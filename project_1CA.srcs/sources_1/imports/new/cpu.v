`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 07:08:42 PM
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cpu (
    input clk,
    input reset,
    input btn_next_instr,
    output [15:0] alu_led,
    output [6:0] seg,
    output [3:0] an
);

    wire [15:0] pc_out, pc_in, pc_plus_2;
    wire [15:0] instruction;
    wire [3:0]  rs, rt, write_reg;
    wire [15:0] reg_data1, reg_data2;
    wire [15:0] sign_ext_out;
    wire [15:0] alu_in2, alu_result;
    wire [2:0]  alu_control_out;
    wire        zero;
    wire [15:0] mem_read_data;
    wire [15:0] write_back_data;
    wire [15:0] branch_offset_shifted, branch_target;
    wire [15:0] jump_target;
    wire [1:0] branch_type;
    reg toggle_state = 0;
    wire [15:0] reg_val_out;

    wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, jump;
    wire [1:0] alu_op;

    reg prev_btn = 0;
    wire btn_rising_edge;
    
    assign btn_rising_edge = btn_next_instr && !prev_btn;
    
    always @(posedge clk) begin
        prev_btn <= btn_next_instr;
    end
    
    always @(posedge clk) begin
    if (reset) begin
        toggle_state <= 0;
    end else if (btn_rising_edge) begin
        toggle_state <= ~toggle_state;
    end
end

    // Debug + instruction counting
    integer instr_count = 0;

    always @(posedge clk) begin
        if (!reset) begin
            $display("--------------------------------------------------");
            $display("PC = %h | Instruction = %b", pc_out, instruction);
            $display("Opcode = %b | RS = R%0d | RT = R%0d | IMM/Funct = %b", 
                     instruction[15:12], rs, rt, instruction[3:0]);
            $display("Reg[RS] = %h | Reg[RT] = %h", reg_data1, reg_data2);
            $display("ALU Result = %h | Zero = %b", alu_result, zero);
            $display("Mem Read Data = %h", mem_read_data);
            $display("Writeback Data = %h to R%0d", write_back_data, write_reg);
            $display("Branch Taken = %b | Jump = %b", (branch_type & zero), jump);
        end
    end

    always @(posedge clk) begin
        $display("PC = %h | Instr = %b | ALU Result = %h | WB = %h | rs = %h | rt = %h", 
             pc_out, instruction, alu_result, write_back_data, reg_data1, reg_data2);
        if (!reset) begin
            instr_count = instr_count + 1;
            if (instr_count == 100) begin
                $display("Simulation ended after 10 instructions.");
                $finish;
            end
        end
    end

    // Main datapath

    program_counter PC (
        .clk(clk),
        .reset(reset),
        .enable(btn_rising_edge && toggle_state),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    adder PC_Adder (
        .a(pc_out),
        .b(16'd2),
        .sum(pc_plus_2)
    );

    instruction_memory IMEM (
        .address(pc_out),
        .instruction(instruction)
    );

    control_unit CU (
        .opcode(instruction[15:12]),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch_type(branch_type),
        .jump(jump),
        .alu_op(alu_op)
    );


    assign rs = instruction[7:4];
    assign rt = instruction[11:8];
    assign write_reg = instruction[11:8];

    register_file RF (
        .clk(clk),
        .enable(btn_rising_edge  && toggle_state),
        .reg_write(reg_write),
        .read_reg1(rs),
        .read_reg2(rt),
        .write_reg(write_reg),
        .write_data(write_back_data),
        .read_data1(reg_data1),
        .read_data2(reg_data2),
        .reg_val_out(reg_val_out)
    );

    sign_extend SE (
        .in(instruction[3:0]),
        .out(sign_ext_out)
    );

    mux2_1_16 alu_mux (
        .in0(reg_data2),
        .in1(sign_ext_out),
        .sel(alu_src),
        .out(alu_in2)
    );

    alu_control ALU_CTRL (
        .alu_op(alu_op),
        .funct(instruction[3:0]),
        .alu_ctrl_op(alu_control_out)
    );

    alu ALU (
        .a(reg_data1),
        .b(alu_in2),
        .alu_ctrl_op(alu_control_out),
        .result(alu_result),
        .zero(zero)
    );

    data_memory DMEM (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(alu_result),
        .write_data(reg_data2),
        .read_data(mem_read_data)
    );

    mux2_1_16 mem_to_reg_mux (
        .in0(alu_result),
        .in1(mem_read_data),
        .sel(mem_to_reg),
        .out(write_back_data)
    );

    shift_left_1 SL1 (
        .in(sign_ext_out),
        .out(branch_offset_shifted)
    );

    adder branch_adder (
        .a(pc_plus_2),
        .b(branch_offset_shifted),
        .sum(branch_target)
    );

    wire [15:0] jmp_offset = {{4{instruction[11]}}, instruction[11:0]} << 1;
    assign jump_target = pc_plus_2 + jmp_offset;

    wire [15:0] pc_branch_mux_out;

    assign branch_taken = (branch_type == 2'b01 && zero) ||
                      (branch_type == 2'b10 && ~zero);
                      
    mux2_1_16 branch_mux (
        .in0(pc_plus_2),
        .in1(branch_target),
        .sel(branch_taken),
        .out(pc_branch_mux_out)
    );

    mux2_1_16 jump_mux (
        .in0(pc_branch_mux_out),
        .in1(jump_target),
        .sel(jump),
        .out(pc_in)
    );
    
    seven_seg_display display (
        .clk(clk),
        .data(instruction),
        .an(an),
        .seg(seg)
    );
    

    assign alu_led = (toggle_state == 0) ? reg_val_out : (reg_write ? write_back_data : reg_val_out);

endmodule
