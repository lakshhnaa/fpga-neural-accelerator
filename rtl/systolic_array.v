module systolic_array #(parameter N = 8)
(
input clk,
input rst,

input signed [7:0] a_row [0:N-1],
input signed [7:0] b_col [0:N-1],

output signed [31:0] result [0:N-1][0:N-1]

);

wire signed [7:0] a_wire [0:N-1][0:N];
wire signed [7:0] b_wire [0:N][0:N-1];
wire signed [31:0] acc_wire [0:N-1][0:N-1];

genvar i, j;

generate

for (i = 0; i < N; i = i + 1) begin : row_init
    assign a_wire[i][0] = a_row[i];
end

for (j = 0; j < N; j = j + 1) begin : col_init
    assign b_wire[0][j] = b_col[j];
end

for (i = 0; i < N; i = i + 1) begin : row_gen
    for (j = 0; j < N; j = j + 1) begin : col_gen

        pe pe_inst (
            .clk(clk),
            .rst(rst),

            .a_in(a_wire[i][j]),
            .b_in(b_wire[i][j]),

            .a_out(a_wire[i][j+1]),
            .b_out(b_wire[i+1][j]),

            .acc(acc_wire[i][j])
        );

    end
end

endgenerate

assign result = acc_wire;

endmodule