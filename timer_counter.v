module timer_counter (
    input wire clk_1hz,          // Clock 1 Hz
    input wire reset,            // Reset đồng bộ
    input wire load_preset,      // Tải lại giá trị preset
    input wire [7:0] preset,     // Giá trị preset (max 255 giây)
    output reg [7:0] count,      // Giá trị đếm ngược hiện tại
    output reg time_up           // Tín hiệu báo hết thời gian
);

    always @(posedge clk_1hz) begin
        if (reset) begin
            count <= preset;     // Reset thì load preset luôn
            time_up <= 0;
        end else if (load_preset) begin
            count <= preset;     // Load preset từ bên ngoài
            time_up <= 0;
        end else if (count > 0) begin
            count <= count - 1;  // Đếm ngược từng giây
            time_up <= 0;
        end else begin
            time_up <= 1;        // Đếm về 0 báo time_up = 1
            count <= 0;          // Giữ không giảm nữa
        end
    end

endmodule
