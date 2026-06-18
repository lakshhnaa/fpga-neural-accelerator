module controller_fsm_tb;

```
reg clk;
reg rst;
reg start;

wire [2:0] state;

controller_fsm uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .state(state)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    start = 0;

    #10;
    rst = 0;

    #10;
    start = 1;

    #10;
    start = 0;

    #100;

    $finish;

end
```

endmodule
