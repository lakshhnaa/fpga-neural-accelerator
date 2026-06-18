`timescale 1ns/1ps

module neural_accelerator_top (
input clk,
input rst,
input start,
output signed [31:0] final_out [0:7][0:7]
);

parameter N = 8;

wire [2:0] state;
wire signed [7:0] a_row [0:N-1];
wire signed [7:0] b_col [0:N-1];
wire signed [31:0] result [0:N-1][0:N-1];
wire signed [31:0] relu_out [0:N-1][0:N-1];

controller_fsm fsm (
.clk(clk),
.rst(rst),
.start(start),
.state(state)
);

assign a_row[0]=8'd1;
assign a_row[1]=8'd2;
assign a_row[2]=8'd3;
assign a_row[3]=8'd4;
assign a_row[4]=8'd5;
assign a_row[5]=8'd6;
assign a_row[6]=8'd7;
assign a_row[7]=8'd8;

assign b_col[0]=8'd1;
assign b_col[1]=8'd2;
assign b_col[2]=8'd3;
assign b_col[3]=8'd4;
assign b_col[4]=8'd5;
assign b_col[5]=8'd6;
assign b_col[6]=8'd7;
assign b_col[7]=8'd8;

systolic_array #(N) sa (
.clk(clk),
.rst(rst),
.a_row(a_row),
.b_col(b_col),
.result(result)
);

relu #(N) relu_unit (
.in_data(result),
.out_data(relu_out)
);

output_buffer #(N) obuf (
.clk(clk),
.rst(rst),
.enable(1'b1),
.data_in(relu_out),
.data_out(final_out)
);

endmodule
