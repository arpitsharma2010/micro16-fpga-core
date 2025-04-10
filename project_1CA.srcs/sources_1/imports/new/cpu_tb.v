`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 07:15:44 PM
// Design Name: 
// Module Name: cpu_tb
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

module cpu_tb;

    reg clk;
    reg reset;
    reg btn_next_instr;

    wire [15:0] alu_led;
    wire [6:0] seg;
    wire [3:0] an;

    // Instantiate the CPU module
    cpu uut (
        .clk(clk),
        .reset(reset),
        .btn_next_instr(btn_next_instr),
        .alu_led(alu_led),
        .seg(seg),
        .an(an)
    );
    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        btn_next_instr = 0;

        #20 reset = 0;

        repeat (100) begin
            #10 btn_next_instr = 1;  // simulate button press
            #10 btn_next_instr = 0;  // release
            #10;                     // small delay between presses
        end

        $display("Simulation finished.");
        #50;
        $finish;
    end

endmodule
