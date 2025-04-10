`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 12:57:09 PM
// Design Name: 
// Module Name: data_memory_tb
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
module data_memory_tb;

    reg         clk;
    reg         mem_read;
    reg         mem_write;
    reg  [15:0] address;
    reg  [15:0] write_data;
    wire [15:0] read_data;

    data_memory uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time | Addr | WriteData | ReadData | mem_read | mem_write");
        $monitor("%4t | %4d |   %5d   |  %5d  |    %b     |     %b", 
                  $time, address, write_data, read_data, mem_read, mem_write);

        clk = 0;
        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;

        #10;
        
        address = 16'd4;
        write_data = 16'hABCD;
        mem_write = 1;
        #10;
        mem_write = 0;

        mem_read = 1;
        #10;
        mem_read = 0;

        address = 16'd10;
        write_data = 16'h1234;
        mem_write = 1;
        #10;
        mem_write = 0;

        mem_read = 1;
        #10;
        mem_read = 0;

        $finish;
    end

endmodule
