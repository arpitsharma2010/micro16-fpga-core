`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 01:41:53 AM
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb;

    reg [3:0] opcode;
    wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump;
    wire [1:0] alu_op;

    control_unit uut (
        .opcode(opcode),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .jump(jump),
        .alu_op(alu_op)
    );

    initial begin
        $display("Opcode | RegDst AluSrc MemToReg RegWrite MemRead MemWrite Branch Jump ALUOp");
        opcode = 4'b0000; #10;
        $display("%b |   %b      %b       %b         %b        %b       %b       %b     %b", opcode, reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op);

        opcode = 4'b0001; #10;
        opcode = 4'b0010; #10;
        opcode = 4'b0011; #10;
        opcode = 4'b0100; #10;
        opcode = 4'b0101; #10;
        opcode = 4'b0110; #10;
        $finish;
    end

endmodule
