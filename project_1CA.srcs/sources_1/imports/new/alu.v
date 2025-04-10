`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 05:00:43 PM
// Design Name: ALU
// Module Name: alu
// Project Name: COMP_ARC
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


module alu(
    input   [15:0]      a,
    input   [15:0]      b,
    input   [2:0]       alu_ctrl_op,
    output reg  [15:0]  result,
    output       zero
    );
    
    assign zero = (result == 16'b0);
    
    always @(*) begin
        case (alu_ctrl_op)
            3'b010: result = a+b;
            3'b110: result = a-b;
            3'b001: result = b << a;
            3'b000: result = a&b;
            default:result = 16'b0;
        endcase
    end

endmodule
