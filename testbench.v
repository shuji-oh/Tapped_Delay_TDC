/*
 * Simple testbench for UART.  Loop the rx and tx pins to each other and send
 * incrementing bytes, make sure that we receive what we expected.
 */
`timescale 1ns/100ps
module tdc_test();

reg hit = 0;
wire out = 1;
reg clk = 0;
reg invclk = 1;
wire [20:0] data;

tapped_delay_tdc test_tdc(
    .Out(out),
    .clk(clk),
    .out_data(data)
);

initial begin
	$dumpfile("tdc.vcd");
	$dumpvars(0, tdc_test);
    hit = 1;
end

always begin
	#1 clk = ~clk;
    #1 invclk = ~invclk;
end

always @(posedge clk) begin
	$display("SUCCESS: send to slave %x", hit);
end

always #5
    hit = 1;

endmodule
