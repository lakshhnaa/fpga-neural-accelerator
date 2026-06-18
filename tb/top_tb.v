`timescale 1ns/1ps

module top_tb;

    reg clk;
    reg rst;
    reg start;

    // 8x8 signed output matrix
    wire signed [31:0] final_out [0:7][0:7];

    // Instantiate DUT
    neural_accelerator_top dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .final_out(final_out)
    );

    // Clock generation
    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    integer i, j;

    initial begin
        // Generate waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, top_tb);

        // Initialize signals
        rst   = 1;
        start = 0;

        // Apply reset
        #20;
        rst = 0;

        // Start pulse
        #10;
        start = 1;

        #10;
        start = 0;

        // Wait for computation
        #5000;

        // Display output matrix
        $display("=== Final Output Matrix ===");

        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                $write("%4d ", final_out[i][j]);
            end
            $display("");
        end

        $finish;
    end

endmodule