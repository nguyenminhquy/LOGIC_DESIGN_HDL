LOGIC_DESIGN_HDL
Giới thiệu
Dự án LOGIC_DESIGN_HDL là một bài tập lớn trong môn HDL (Hardware Description Language), được thiết kế nhằm xây dựng hệ thống điều khiển đèn giao thông sử dụng ngôn ngữ mô tả phần cứng Verilog trên công cụ Xilinx Vivado.

Hệ thống điều khiển đèn giao thông được thiết kế với mục tiêu điều khiển các đèn đỏ, vàng và xanh trên một tuyến đường theo một chu trình tự động, sử dụng các bộ đếm và máy trạng thái (FSM - Finite State Machine). Mô hình này có thể được sử dụng trong các ứng dụng thực tế như các hệ thống đèn giao thông tự động, giúp giảm thiểu tai nạn và tối ưu hóa giao thông.
Mục tiêu
Thiết kế và mô phỏng hệ thống điều khiển đèn giao thông sử dụng Verilog.

Triển khai và mô phỏng bộ đếm thời gian và máy trạng thái (FSM) để quản lý các tín hiệu đèn giao thông.

Sử dụng công cụ Vivado để tạo ra mạch logic cho hệ thống.

Đảm bảo hệ thống có thể chuyển đổi giữa các chế độ tự động và thủ công, bao gồm chế độ đèn sáng tự động và chế độ đèn nhấp nháy khi có sự cố.

Cấu trúc hệ thống
Hệ thống điều khiển đèn giao thông bao gồm các module chính sau:

Traffic Light Controller (traffic_light_controller.v): Điều khiển toàn bộ logic của đèn giao thông, bao gồm việc chuyển đổi giữa các trạng thái của đèn (đỏ, vàng, xanh).

FSM (Finite State Machine): Một máy trạng thái để quản lý trạng thái của đèn giao thông. Bao gồm:

fsm_auto_mode.v: Quản lý trạng thái tự động của hệ thống.

fsm_manual_mode.v: Quản lý trạng thái thủ công của hệ thống (điều khiển bằng tay).

Clock Divider (clock_divider_1hz.v): Bộ chia đồng hồ để điều khiển chu kỳ thay đổi giữa các trạng thái đèn giao thông.

Timer Counter (timer_counter.v): Bộ đếm thời gian để xác định thời gian mà mỗi đèn sẽ sáng.

Night Mode (night_mode.v): Chế độ đèn nhấp nháy vào ban đêm khi không có giao thông.

Công cụ và phần mềm sử dụng
Xilinx Vivado: Phần mềm được sử dụng để mô phỏng, biên dịch và triển khai thiết kế Verilog.

Verilog HDL: Ngôn ngữ mô tả phần cứng được sử dụng để viết mã logic cho các module trong hệ thống.

Cách sử dụng
Cài đặt Vivado: Tải và cài đặt công cụ Vivado từ Xilinx Vivado.

Clone repo về máy tính:

bash
Sao chép
git clone https://github.com/nguyenminhquy/LOGIC_DESIGN_HDL.git
cd LOGIC_DESIGN_HDL
Mở dự án trong Vivado:

Tạo một dự án mới trong Vivado.

Thêm các tệp .v vào dự án của bạn.

Thiết lập bộ mô phỏng và biên dịch để bắt đầu mô phỏng thiết kế của bạn.

Chạy mô phỏng:

Sử dụng mô phỏng của Vivado để kiểm tra tính đúng đắn của thiết kế.

Kiểm tra các tín hiệu đầu ra của hệ thống đèn giao thông để xác nhận hoạt động đúng như kỳ vọng.

Cấu trúc dự án
css
Sao chép
LOGIC_DESIGN_HDL/
│
├── traffic_light_controller.v    # Mô-đun điều khiển đèn giao thông
├── fsm_auto_mode.v               # Máy trạng thái tự động
├── fsm_manual_mode.v             # Máy trạng thái thủ công
├── clock_divider_1hz.v           # Bộ chia đồng hồ 1Hz
├── timer_counter.v               # Bộ đếm thời gian
├── night_mode.v                  # Chế độ đèn nhấp nháy vào ban đêm
└── README.md                     # Tài liệu hướng dẫn sử dụng
Các tính năng
Tự động điều khiển đèn giao thông: Hệ thống tự động chuyển đèn đỏ, vàng, xanh theo một chu trình đã định.

Chế độ thủ công: Người dùng có thể chuyển hệ thống sang chế độ thủ công để điều khiển đèn giao thông bằng tay.

Đèn nhấp nháy vào ban đêm: Khi không có giao thông, đèn giao thông sẽ chuyển sang chế độ nhấp nháy vào ban đêm để tiết kiệm năng lượng.

Mô phỏng thời gian thực: Mỗi tín hiệu đèn có thời gian sáng nhất định, có thể điều chỉnh qua bộ đếm thời gian.
