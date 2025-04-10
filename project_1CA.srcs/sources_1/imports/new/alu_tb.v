`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 05:29:48 PM
// Design Name: 
// Module Name: alu_tb
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

module alu_tb;

    reg [15:0] a, b;
    reg [2:0] alu_ctrl_op;
    wire [15:0] result;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_ctrl_op(alu_ctrl_op),
        .result(result),
        .zero(zero)
    );

    initial begin
        $display("Time | A     | B     | Ctrl | Result | Zero");

        // AND
        a = 16'hAAAA; b = 16'h0F0F; alu_ctrl_op = 3'b000; #10;
        $display("%4t | %h | %h |  %b  | %h |  %b", $time, a, b, alu_ctrl_op, result, zero);

        // SLL
        a = 16'd2; b = 16'h0001; alu_ctrl_op = 3'b001; #10;
        $display("%4t | %h | %h |  %b  | %h |  %b", $time, a, b, alu_ctrl_op, result, zero);

        // ADD
        a = 16'd5; b = 16'd10; alu_ctrl_op = 3'b010; #10;
        $display("%4t | %h | %h |  %b  | %h |  %b", $time, a, b, alu_ctrl_op, result, zero);

        // SUB (non-zero)
        a = 16'd10; b = 16'd5; alu_ctrl_op = 3'b110; #10;
        $display("%4t | %h | %h |  %b  | %h |  %b", $time, a, b, alu_ctrl_op, result, zero);

        // SUB (zero result)
        a = 16'd10; b = 16'd10; alu_ctrl_op = 3'b110; #10;
        $display("%4t | %h | %h |  %b  | %h |  %b", $time, a, b, alu_ctrl_op, result, zero);

        $finish;
    end

endmodule
