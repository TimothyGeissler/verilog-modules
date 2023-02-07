//`include "twobit.v"

module eightbit_tb();
    wire eqOut, gtOut;
    wire[8:0] a, b;
    wire eqIn, gtIn;

    integer i;
    integer score = 0;

    reg zero = 1'b0;
    reg one = 1'b1;

    eightbit comparator(a, b, eqOut, gtOut);

    assign a = i[16:8];
    assign b = i[7:0];

    initial begin
        $display("eqIn:gtIn:a1:a0;b1:b0:eqOut:gtOut");
        //$monitor(eqIn, gtIn, a[1], a[0], b[1], b[0], eqOut, gtOut);
        for (i = 0; i < 65537; i=i+1) begin
            //b = i[2:0];
            //a = i[4:2];
            //gtIn = i[5:4];
            //eqIn = i[6:5];

            if ((a > b) && (gtOut == one && eqOut == zero) || ((a == b) && (gtOut == 0 && eqOut == one)) || (a < b) && ((gtOut == zero && eqOut == zero))) begin
                $display("Testing: %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b -> %b%b     Passed", a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0], eqOut, gtOut);
                score = score + 1;
            end else begin
                $display("Testing: %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b -> %b%b     Failed", a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0], eqOut, gtOut);
            end

            #5;
        end
        $display("Score: %d/65536", score);
    end

endmodule