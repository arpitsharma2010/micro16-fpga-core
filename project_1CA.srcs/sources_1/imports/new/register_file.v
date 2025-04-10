`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 09:25:42 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input               clk,
    input enable,
    input               reg_write,
    input   [3:0]       read_reg1,
    input   [3:0]       read_reg2,
    input   [3:0]       write_reg,
    input   [15:0]      write_data,
    output  [15:0]      read_data1,
    output  [15:0]      read_data2,
    output  [15:0]      reg_val_out
    );
    reg [15:0] registers [15:0];
    
    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1)
            registers[i] = 16'h0000;
    end
    
    assign read_data1 = registers [read_reg1];
    assign read_data2 = registers [read_reg2];
    
    always @(posedge clk) begin
        if (reg_write && enable) begin
            registers[write_reg] <= write_data;
            $display("Write to R%0d = %h at time %t", write_reg, write_data, $time);
        end
    end
    
    assign reg_val_out = registers[write_reg];
endmodule
