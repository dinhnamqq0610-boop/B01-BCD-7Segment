`timescale 1ns/1ps

module tb_bcd_7segment;

    reg  [3:0] bcd;
    wire [6:0] seg;
    reg  [6:0] expected;

    integer i;
    integer errors;

    bcd_7segment dut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        $dumpfile("sim/bcd_7segment.vcd");
        $dumpvars(0, tb_bcd_7segment);

        errors = 0;

        for (i = 0; i < 16; i = i + 1) begin
            bcd = i;

            case (i)
                0: expected = 7'b0000001;
                1: expected = 7'b1001111;
                2: expected = 7'b0010010;
                3: expected = 7'b0000110;
                4: expected = 7'b1001100;
                5: expected = 7'b0100100;
                6: expected = 7'b0100000;
                7: expected = 7'b0001111;
                8: expected = 7'b0000000;
                9: expected = 7'b0000100;
                default: expected = 7'b1111111;
            endcase

            #10;

            if (seg !== expected) begin
                $display("FAIL: BCD=%h, seg=%b, expected=%b",
                         bcd, seg, expected);
                errors = errors + 1;
            end else begin
                $display("PASS: BCD=%h, seg=%b", bcd, seg);
            end
        end

        $display("-----------------------");
        $display("Total tests: 16");
        $display("Errors: %0d", errors);

        if (errors == 0)
            $display("RESULT: ALL TESTS PASSED");
        else
            $display("RESULT: TESTS FAILED");

        $finish;
    end

endmodule
