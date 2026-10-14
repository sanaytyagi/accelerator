module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
wire[7:0] wire1;
wire [7:0] wire2;
wire [7:0] wire3;
my_dff8 inst1(.clk(clk), .d(d), .q(wire1));
my_dff8 inst2(.clk(clk), .d(wire1), .q(wire2));
my_dff8 inst3(.clk(clk), .d(wire2), .q(wire3));

reg[7:0] mux_out;
always @(*) begin
    case(sel)
    2'd0: mux_out = d;
    2'd1: mux_out = wire1;
    2'd2: mux_out = wire2;
    2'd3: mux_out = wire3;
    endcase
end
assign q = mux_out;
endmodule
