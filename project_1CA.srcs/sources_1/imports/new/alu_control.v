`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 11:03:26 AM
// Design Name: 
// Module Name: alu_control
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


module alu_control (
    input [1:0] alu_op,
    input [3:0] funct,
    output reg [2:0] alu_ctrl_op
);

    always @(*) begin
        case (alu_op)
            2'b00: alu_ctrl_op = 3'b010; 
            2'b01: alu_ctrl_op = 3'b110; 
            2'b10: begin     
                case (funct)
                    4'b0000: alu_ctrl_op = 3'b010; // add
                    4'b0001: alu_ctrl_op = 3'b110; // sub
                    4'b0010: alu_ctrl_op = 3'b001; // sll
                    4'b0011: alu_ctrl_op = 3'b000; // and
                    default: alu_ctrl_op = 3'bxxx;
                endcase
            end
            default: alu_ctrl_op = 3'bxxx;
        endcase
    end

endmodule
