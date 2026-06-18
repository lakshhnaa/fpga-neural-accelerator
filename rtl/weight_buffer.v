module weight_buffer #(parameter N = 8)
(
input clk,
input write_enable,
input [2:0] addr,
input signed [7:0] weight_in,
output reg signed [7:0] b_col [0:N-1]
);

always @(posedge clk) begin
if (write_enable)
b_col[addr] <= weight_in;
end

endmodule
