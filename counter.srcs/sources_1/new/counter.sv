`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2023 07:12:17 PM
// Design Name: 
// Module Name: counter
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


module counter #(
    parameter N = 8)(
        input logic clk,incr,reset,
        output logic [N-1:0] count_reg
    );
    always_ff @(posedge clk) begin 
    if (reset) count_reg <= 0 ;
    else if (incr) count_reg<=count_reg+ 1'b1;   // no chance about latches forming 
    end                                          // because we are using always_ff (flipflop)
endmodule
