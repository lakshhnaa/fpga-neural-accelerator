module output_buffer #(parameter N = 8)
(
input clk,
input rst,
input enable,
input signed [31:0] data_in [0:N-1][0:N-1],
output reg signed [31:0] data_out [0:N-1][0:N-1]
);

integer i, j;

always @(posedge clk) begin
if (rst) begin
for (i = 0; i < N; i = i + 1) begin
for (j = 0; j < N; j = j + 1) begin
data_out[i][j] <= 0;
end
end
end
else if (enable) begin
for (i = 0; i < N; i = i + 1) begin
for (j = 0; j < N; j = j + 1) begin
data_out[i][j] <= data_in[i][j];
end
end
end
end

endmodule
