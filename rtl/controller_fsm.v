module controller_fsm (
    input clk,
    input rst,
    input start,
    output reg [2:0] state
);

parameter IDLE         = 3'd0,
          LOAD_INPUT   = 3'd1,
          LOAD_WEIGHT  = 3'd2,
          COMPUTE      = 3'd3,
          ACTIVATE     = 3'd4,
          STORE_OUTPUT = 3'd5,
          DONE         = 3'd6;

always @(posedge clk) begin
    if (rst)
        state <= IDLE;
    else begin
        case (state)

            IDLE:
                if (start)
                    state <= LOAD_INPUT;

            LOAD_INPUT:
                state <= LOAD_WEIGHT;

            LOAD_WEIGHT:
                state <= COMPUTE;

            COMPUTE:
                state <= ACTIVATE;

            ACTIVATE:
                state <= STORE_OUTPUT;

            STORE_OUTPUT:
                state <= DONE;

            DONE:
                state <= IDLE;

            default:
                state <= IDLE;

        endcase
    end
end

endmodule
