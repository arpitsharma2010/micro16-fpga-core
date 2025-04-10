`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:57:09 PM
// Design Name: 
// Module Name: program_counter_tb
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
module program_counter_tb;

    reg clk;
    reg reset;
    reg [15:0] pc_in;
    wire [15:0] pc_out;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time | Reset | PC_in | PC_out");
        $monitor("%4t |   %b   |  %4d  |  %4d", $time, reset, pc_in, pc_out);

        clk = 0;
        reset = 1;
        pc_in = 16'd0;
        #10;
        reset = 0;
        pc_in = 16'd2;
        #10;
        pc_in = 16'd4;
        #10;
        pc_in = 16'd6;
        #10;
        reset = 1;
        #10;
        reset = 0;
        pc_in = 16'd10;
        #10;
        $finish;
    end


endmodule
