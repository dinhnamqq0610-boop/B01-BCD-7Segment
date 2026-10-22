# B01 - BCD to 7-Segment Decoder

## 1. Giới thiệu
Project thiết kế bộ giải mã BCD sang LED 7 đoạn bằng ngôn ngữ Verilog HDL.

## 2. Chức năng
- Nhận dữ liệu BCD đầu vào 4 bit.
- Giải mã các chữ số từ 0 đến 9 thành tín hiệu điều khiển 7 đoạn LED.
- Các mã đầu vào không hợp lệ từ 10 đến 15 được xử lý theo thiết kế.

## 3. Cấu trúc project
- `rtl/`: Mã nguồn Verilog HDL.
- `tb/`: Testbench kiểm thử thiết kế.
- `sim/`: Tệp liên quan đến mô phỏng.
- `docs/`: Tài liệu đặc tả thiết kế.

## 4. Kiểm thử
Testbench kiểm tra 16 giá trị đầu vào từ 0 đến 15.

Kết quả kiểm thử: cập nhật sau khi chạy mô phỏng.

## 5. Công cụ
- Verilog HDL
- Icarus Verilog
- Git và GitHub
