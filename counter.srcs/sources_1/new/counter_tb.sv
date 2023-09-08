module counter_tb();
timeunit 1ns/1ps;
localparam N=8;
logic clk=0,reset,incr;
logic [N-1:0] count_reg;
counter #(.N(N)) dut(.*);

// clock generation in simulation.
localparam period=10;
initial forever 
    #(period/2) clk <= ~clk;
    
initial begin
$dumpfile ("dumpfile.vcd");
$dumpvars(0,dut);
 
#(period*2)
@(posedge clk);
#1 reset<=1;
repeat (2) @(posedge clk);
#1 incr <= 1;

@(posedge clk);
#1 reset <= 0; incr <= 1;
repeat(4) @(posedge clk);
#1 incr <= 0;
repeat(4) @(posedge clk);
#1 reset <= 1;
$finish();
end
endmodule
