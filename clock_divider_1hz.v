module clock_divider_1hz (
    input wire clk_in,       // Clock đầu vào 125 MHz
    input wire reset,        // Reset đồng bộ
    output reg clk_out       // Clock đầu ra 1 Hz
);

    // Số xung đếm cho nửa chu kỳ 1 Hz
    localparam integer COUNT_MAX = 62_499_999;

    reg [26:0] counter = 0;  // 27-bit counter

    always @(posedge clk_in) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == COUNT_MAX) begin
                counter <= 0;
                clk_out <= ~clk_out;  // Đảo tín hiệu clock_out
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
