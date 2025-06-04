module night_mode (
    input wire clk_1hz,
    input wire reset,
    output reg laneA_yellow,
    output reg laneB_yellow
);

    reg blink_state;

    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            blink_state <= 0;
            laneA_yellow <= 0;
            laneB_yellow <= 0;
        end else begin
            blink_state <= ~blink_state;    // Đảo trạng thái mỗi giây
            laneA_yellow <= blink_state;
            laneB_yellow <= blink_state;
        end
    end

endmodule
