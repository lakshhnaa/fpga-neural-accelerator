module relu_tb;

```
// Inputs to the DUT
reg signed [15:0] in_data;

// Output from the DUT
wire signed [15:0] out_data;

// Instantiate the ReLU module
relu uut (
    .in_data(in_data),
    .out_data(out_data)
);

// Apply test cases
initial begin

    // Test Case 1
    in_data = -5;
    #10;

    // Test Case 2
    in_data = 10;
    #10;

    // Test Case 3
    in_data = 0;
    #10;

    // Test Case 4
    in_data = -1;
    #10;

    // End simulation
    $finish;

end
```

endmodule
