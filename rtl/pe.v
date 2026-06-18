module pe (
input clk,
input rst,
input signed [7:0] a_in,
input signed [7:0] b_in,
output reg signed [7:0] a_out,
output reg signed [7:0] b_out,
output reg signed [31:0] acc
);

always @(posedge clk) begin
if (rst) begin
acc <= 0;
a_out <= 0;
b_out <= 0;
end
else begin
acc <= acc + (a_in * b_in);
a_out <= a_in;
b_out <= b_in;
end
end

endmodule
