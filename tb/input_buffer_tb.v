module input_buffer_tb;

```
reg clk;
reg write_enable;
reg [2:0] addr;
reg signed [15:0] data_in;

wire signed [15:0] data_out;

input_buffer uut (
    .clk(clk),
    .write_enable(write_enable),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    write_enable = 0;
    addr = 0;
    data_in = 0;

    // Write 5 to address 0
    #10;
    write_enable = 1;
    addr = 0;
    data_in = 5;

    // Write 15 to address 1
    #10;
    addr = 1;
    data_in = 15;

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
