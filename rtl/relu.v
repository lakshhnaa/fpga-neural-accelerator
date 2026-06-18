module relu #(parameter N = 8)
(
input signed [31:0] in_data [0:N-1][0:N-1],
output reg signed [31:0] out_data [0:N-1][0:N-1]
);

integer i, j;

always @(*) begin
for (i = 0; i < N; i = i + 1) begin
for (j = 0; j < N; j = j + 1) begin
if (in_data[i][j] < 0)
out_data[i][j] = 0;
else
out_data[i][j] = in_data[i][j];
end
end
end

endmodule
