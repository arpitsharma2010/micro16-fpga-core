`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:26:38 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory (
    input  [15:0] address,           
    output [15:0] instruction
);

    reg [15:0] memory [0:63];        

    assign instruction = memory[address[15:1]];

    initial begin
        //$readmemh("instructions.mem", memory);
        memory[0]  = 16'h3105;
        memory[1]  = 16'h33F3;
        memory[2]  = 16'h3542;
        memory[3]  = 16'h3761;
        memory[4]  = 16'h0130;
        memory[5]  = 16'h0331;
        memory[6]  = 16'h0773;
        memory[7]  = 16'h0552;
        memory[8]  = 16'h2102;
        memory[9]  = 16'h1B02;
        memory[10] = 16'h4991;
        memory[11] = 16'h3101;
        memory[12] = 16'h3AA4;
        memory[13] = 16'h51A1;
        memory[14] = 16'h0000;
        memory[15] = 16'h6FFC;
    end

endmodule
