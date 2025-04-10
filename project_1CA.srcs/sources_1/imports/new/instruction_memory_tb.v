`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:28:34 PM
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb;

    reg [15:0] address;
    wire [15:0] instruction;

    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        $display("Time | Address | Instruction");
        $monitor("%4t |   %d     |   %b", $time, address, instruction);

        #5;

        address = 16'd0;   #10;
        address = 16'd2;   #10;
        address = 16'd4;   #10;
        address = 16'd6;   #10;
        address = 16'd8;   #10;
        address = 16'd10;  #10;

        $finish;
    end

endmodule
