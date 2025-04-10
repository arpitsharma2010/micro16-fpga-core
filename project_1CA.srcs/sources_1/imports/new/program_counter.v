`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:57:09 PM
// Design Name: 
// Module Name: program_counter
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
module program_counter (
    input        clk,
    input        reset,
    input enable, 
    input  [15:0] pc_in,
    output reg [15:0] pc_out
);

    always @(posedge clk) begin
        if (reset)
            pc_out <= 0;
        else if (enable)
            pc_out <= pc_in;
    end

endmodule
