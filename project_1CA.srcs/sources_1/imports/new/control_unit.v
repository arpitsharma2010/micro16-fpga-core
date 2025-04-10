`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 01:20:38 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit (
    input  [3:0] opcode,
    output reg_dst,
    output alu_src,
    output mem_to_reg,
    output reg_write,
    output mem_read,
    output mem_write,
    output [1:0] branch_type,
    output jump,
    output [1:0] alu_op
);

    reg [9:0] controls;

    assign {
        reg_dst,
        alu_src,
        mem_to_reg,
        reg_write,
        mem_read,
        mem_write,
        branch_type,
        jump,
        alu_op
    } = controls;

    always @(*) begin
        case (opcode)
            4'b0000: controls = 11'b1_0_0_1_0_0_00_0_10; // R-type
            4'b0001: controls = 11'b0_1_1_1_1_0_00_0_00; // lw
            4'b0010: controls = 11'b0_1_0_0_0_1_00_0_00; // sw
            4'b0011: controls = 11'b0_1_0_1_0_0_00_0_00; // addi
            4'b0100: controls = 11'b0_0_0_0_0_0_01_0_01; // beq
            4'b0101: controls = 11'b0_0_0_0_0_0_10_0_01; // bne
            4'b0110: controls = 11'b0_0_0_0_0_0_00_1_00; // jump
            default: controls = 11'b0_0_0_0_0_0_00_0_00;
        endcase
    end

endmodule
