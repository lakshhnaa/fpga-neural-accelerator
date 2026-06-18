module output_buffer_tb;

```
reg clk;
reg rst;
reg enable;
reg [15:0] data_in;

wire [15:0] data_out;

// Instantiate DUT
output_buffer uut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    enable = 0;
    data_in = 0;

    #10;
    rst = 0;

    // Load 15
    enable = 1;
    data_in = 15;
    #10;

    // Hold previous value
    enable = 0;
    data_in = 25;
    #10;

    // Load 40
    enable = 1;
    data_in = 40;
    #10;

    $finish;

end
```

endmodule
