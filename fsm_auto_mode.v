module fsm_auto_mode (
    input wire clk_1hz,
    input wire reset,
    input wire time_up,
    input wire [7:0] preset_green_laneA,
    input wire [7:0] preset_yellow_laneA,
    input wire [7:0] preset_green_laneB,
    input wire [7:0] preset_yellow_laneB,
    output reg laneA_red,
    output reg laneA_yellow,
    output reg laneA_green,
    output reg laneB_red,
    output reg laneB_yellow,
    output reg laneB_green,
    output reg load_timer,
    output reg [7:0] timer_preset
);

    // Định nghĩa trạng thái bằng parameter
    parameter S0 = 2'd0;
    parameter S1 = 2'd1;
    parameter S2 = 2'd2;
    parameter S3 = 2'd3;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk_1hz or posedge reset) begin
        if (reset)
            state <= S0;
        else if (time_up)
            state <= next_state;
        else
            state <= state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output & timer preset logic
    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            laneA_red <= 0;
            laneA_yellow <= 0;
            laneA_green <= 1;  // Start Lane A green
            laneB_red <= 1;
            laneB_yellow <= 0;
            laneB_green <= 0;
            load_timer <= 1;
            timer_preset <= preset_green_laneA;
        end else if (time_up) begin
            load_timer <= 1;
            case (next_state)
                S0: begin // Lane A Green, Lane B Red
                    laneA_green <= 1;
                    laneA_yellow <= 0;
                    laneA_red <= 0;
                    laneB_red <= 1;
                    laneB_yellow <= 0;
                    laneB_green <= 0;
                    timer_preset <= preset_green_laneA;
                end
                S1: begin // Lane A Yellow, Lane B Red
                    laneA_green <= 0;
                    laneA_yellow <= 1;
                    laneA_red <= 0;
                    laneB_red <= 1;
                    laneB_yellow <= 0;
                    laneB_green <= 0;
                    timer_preset <= preset_yellow_laneA;
                end
                S2: begin // Lane A Red, Lane B Green
                    laneA_green <= 0;
                    laneA_yellow <= 0;
                    laneA_red <= 1;
                    laneB_red <= 0;
                    laneB_yellow <= 0;
                    laneB_green <= 1;
                    timer_preset <= preset_green_laneB;
                end
                S3: begin // Lane A Red, Lane B Yellow
                    laneA_green <= 0;
                    laneA_yellow <= 0;
                    laneA_red <= 1;
                    laneB_red <= 0;
                    laneB_yellow <= 1;
                    laneB_green <= 0;
                    timer_preset <= preset_yellow_laneB;
                end
                default: ;
            endcase
        end else begin
            load_timer <= 0;  // Giữ nguyên timer khi chưa time_up
        end
    end

endmodule
