module fsm_manual_mode (
    input wire sw1,   // công tắc điều khiển lane 1
    input wire sw2,   // công tắc điều khiển lane 2
    output reg laneA_red,
    output reg laneA_yellow,
    output reg laneA_green,
    output reg laneB_red,
    output reg laneB_yellow,
    output reg laneB_green
);

    always @(*) begin
        // Khởi tạo mặc định là đỏ cả 2 lane
        laneA_red = 1;
        laneA_yellow = 0;
        laneA_green = 0;
        laneB_red = 1;
        laneB_yellow = 0;
        laneB_green = 0;

        if (sw1 == 1 && sw2 == 0) begin
            // Lane 1 xanh, Lane 2 đỏ
            laneA_green = 1;
            laneA_red = 0;
            laneB_red = 1;
            laneB_green = 0;
        end else if (sw2 == 1 && sw1 == 0) begin
            // Lane 2 xanh, Lane 1 đỏ
            laneB_green = 1;
            laneB_red = 0;
            laneA_red = 1;
            laneA_green = 0;
        end
        // Nếu cả hai cùng bật hoặc cùng tắt, giữ đỏ cả hai lane để an toàn
    end

endmodule
