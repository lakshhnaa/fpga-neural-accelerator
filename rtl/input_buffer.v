module input_buffer #(parameter N = 8)
(
input clk,
input write_enable,
input [2:0] addr,
input signed [7:0] data_in,
output reg signed [7:0] a_row [0:N-1]
);

always @(posedge clk) begin
if (write_enable)
a_row[addr] <= data_in;
end

endmodule
