`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 11:11:12 AM
// Design Name: 
// Module Name: alu_control_tb
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


module alu_control_tb;

    reg [1:0] alu_op;
    reg [3:0] funct;
    wire [2:0] alu_ctrl_op;

    alu_control uut (
        .alu_op(alu_op),
        .funct(funct),
        .alu_ctrl_op(alu_ctrl_op)
    );

    initial begin
        $display("ALUOp | Funct | ALUCtrl");
        
        alu_op = 2'b00; funct = 4'bxxxx; #10; // lw/sw/addi
        $display("%b   |  %b  | %b", alu_op, funct, alu_ctrl_op);

        alu_op = 2'b01; funct = 4'bxxxx; #10; // beq/bne
        $display("%b   |  %b  | %b", alu_op, funct, alu_ctrl_op);

        alu_op = 2'b10;

        funct = 4'b0000; #10;
        funct = 4'b0001; #10;
        funct = 4'b0010; #10;
        funct = 4'b0011; #10;
        $finish;
    end

endmodule
