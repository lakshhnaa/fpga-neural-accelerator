module weight_buffer_tb;

```
reg clk;
reg write_enable;
reg [2:0] addr;
reg signed [15:0] weight_in;

wire signed [15:0] weight_out;

weight_buffer uut (
    .clk(clk),
    .write_enable(write_enable),
    .addr(addr),
    .weight_in(weight_in),
    .weight_out(weight_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    write_enable = 0;
    addr = 0;
    weight_in = 0;

    // Write 10 to address 0
    #10;
    write_enable = 1;
    addr = 0;
    weight_in = 10;

    // Write 20 to address 1
    #10;
    addr = 1;
    weight_in = 20;

    // Stop writing
    #10;
    write_enable = 0;

    // Read address 0
    addr = 0;
    #10;

    // Read address 1
    addr = 1;
    #10;

    $finish;

end
```

endmodule
