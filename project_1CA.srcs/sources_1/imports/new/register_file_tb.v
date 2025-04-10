`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:57:50 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;

    reg clk;
    reg reg_write;
    reg [3:0] read_reg1;
    reg [3:0] read_reg2;
    reg [3:0] write_reg;
    reg [15:0] write_data;
    
    wire [15:0] read_data1;
    wire [15:0] read_data2;
    
    register_file uut (
        .clk(clk),
        .reg_write(reg_write),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time=%0t | RegWrite=%b | WriteReg=%d | WriteData=%d | Read1=%d | Read2=%d",
                    $time, reg_write, write_reg, write_data, read_data1, read_data2);
        
        clk = 0;
        reg_write = 0;
        write_reg = 0;
        write_data = 0;
        read_reg1 = 0;
        read_reg2 = 0;
        
        #10;
        
        reg_write = 1;
        write_reg = 4'd3;
        write_data = 16'd123;
        #10;
        
        reg_write = 0;
        read_reg1 = 4'd3;
        read_reg2 = 4'd3;
        #10;
        
        reg_write = 1;
        write_reg = 4'd7;
        write_data = 16'd456;
        #10;
        
        reg_write = 0;
        read_reg1 = 4'd3;
        read_reg2 = 4'd7;
        #10;
        
        reg_write = 0;
        write_reg = 4'd3;
        write_data = 16'd999;
        #10;
        
        read_reg1 = 4'd3;
        read_reg2 = 4'd7;
        #10;
        
        $finish;
    end

endmodule
