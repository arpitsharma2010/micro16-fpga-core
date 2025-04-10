`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:57:09 PM
// Design Name: 
// Module Name: data_memory
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
module data_memory (
    input clk,
    input mem_read,
    input mem_write,
    input [15:0] address,
    input [15:0] write_data,
    output reg [15:0] read_data
);

    reg [15:0] memory [0:255];

    always @(*) begin
        if (mem_read) begin
            read_data = memory[address[7:0]];
        end else begin
            read_data = 16'h0000;
        end
    end

    always @(posedge clk) begin
        if (mem_write) begin
            memory[address[7:0]] <= write_data;
            $display("Mem[0x%02h] <= %h (Write) at time %t", address[7:0], write_data, $time);
        end
        if (mem_read) begin
            $display("Mem[0x%02h] => %h (Read) at time %t", address[7:0], memory[address[7:0]], $time);
        end
    end

endmodule
