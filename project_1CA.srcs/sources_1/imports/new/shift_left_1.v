`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 02:57:00 PM
// Design Name: 
// Module Name: shift_left_1
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


module shift_left_1 (
    input  [15:0] in,
    output [15:0] out
);

    assign out = {in[14:0], 1'b0};  

endmodule
