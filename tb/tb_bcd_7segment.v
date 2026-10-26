
`timescale 1ns/1ps

module tb_bcd_7segment;

    reg  [3:0] ui_in;
    wire [7:0] uo_out;
    reg  [7:0] expected;

    integer i;
    integer errors;
    integer tests;

    bcd_7segment dut (
        .ui_in(ui_in),
        .uo_out(uo_out)
    );

    task check_value;
        input [3:0] value;
        input [7:0] expected_value;
        begin
            ui_in = value;
            #10;
            tests = tests + 1;

            if (uo_out !== expected_value) begin
                $display("FAIL: ui_in=%h, uo_out=%b, expected=%b",
                         ui_in, uo_out, expected_value);
                errors = errors + 1;
            end
            else begin
                $display("PASS: ui_in=%h, uo_out=%b",
                         ui_in, uo_out);
            end
        end
    endtask

    initial begin
        errors = 0;
        tests = 0;
        ui_in = 4'd0;

        $dumpfile("sim/bcd_7segment.vcd");
        $dumpvars(0, tb_bcd_7segment);

        // TC-01 den TC-16: Kiem tra tat ca ma dau vao 0 den 15
        check_value(4'd0,  8'b01000000);
        check_value(4'd1,  8'b01111001);
        check_value(4'd2,  8'b00100100);
        check_value(4'd3,  8'b00110000);
        check_value(4'd4,  8'b00011001);
        check_value(4'd5,  8'b00010010);
        check_value(4'd6,  8'b00000010);
        check_value(4'd7,  8'b01111000);
        check_value(4'd8,  8'b00000000);
        check_value(4'd9,  8'b00010000);
        check_value(4'd10, 8'b11111111);
        check_value(4'd11, 8'b11111111);
        check_value(4'd12, 8'b11111111);
        check_value(4'd13, 8'b11111111);
        check_value(4'd14, 8'b11111111);
        check_value(4'd15, 8'b11111111);

        // TC-17 den TC-21: Kiem tra lai mot so gia tri
        check_value(4'd9,  8'b00010000);
        check_value(4'd10, 8'b11111111);
        check_value(4'd15, 8'b11111111);
        check_value(4'd0,  8'b01000000);
        check_value(4'd1,  8'b01111001);

        // TC-22: Chuyen tu ma hop le 9 sang ma khong hop le 10
        check_value(4'd9,  8'b00010000);
        check_value(4'd10, 8'b11111111);

        // TC-23: Chuyen tu ma khong hop le 10 sang ma hop le 8
        check_value(4'd10, 8'b11111111);
        check_value(4'd8,  8'b00000000);

        $display("------------------------------");
        $display("Total tests: %0d", tests);
        $display("Errors: %0d", errors);

        if (errors == 0)
            $display("RESULT: ALL TESTS PASSED");
        else
            $display("RESULT: SOME TESTS FAILED");

        $finish;
    end

endmodule
