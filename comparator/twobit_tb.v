//`include "twobit.v"

module twobit_tb();
    wire eqOut, gtOut;
    wire[1:0] a, b;
    wire eqIn, gtIn;

    integer i;

    reg zero = 1'b0;
    reg one = 1'b1;

    twobit comparator(eqIn, gtIn, a, b, eqOut, gtOut);

    assign {eqIn, gtIn, a, b} = i[5:0];

    initial begin
        $display("eqIn:gtIn:a1:a0;b1:b0:eqOut:gtOut");
        //$monitor(eqIn, gtIn, a[1], a[0], b[1], b[0], eqOut, gtOut);
        for (i = 48; i < 64; i=i+1) begin
            //b = i[2:0];
            //a = i[4:2];
            //gtIn = i[5:4];
            //eqIn = i[6:5];

            if ((a > b) && (gtOut == one && eqOut == zero) || ((a == b) && (gtOut == 0 && eqOut == one)) || (a < b) && ((gtOut == zero && eqOut == zero))) begin
                $display("Testing: %b%b%b%b%b%b%b%b     Passed", eqIn, gtIn, a[1], a[0], b[1], b[0], eqOut, gtOut);
            end else begin
                $display("Testing: %b%b%b%b%b%b%b%b", eqIn, gtIn, a[1], a[0], b[1], b[0], eqOut, gtOut);
            end


            /*// Do check
            if (gtIn == one && eqIn == zero) 
                //eqOut = 0, gtOut = 1
                if (eqOut == zero && gtOut == one) begin
                    $display("CORRECT");
                end else begin
                    $display("INCORRECT");
                end
            else if (eqIn == zero && gtIn == zero) 
                //eqOut = 0, gtOut = 0
                if (eqOut == zero && gtOut == zero) begin
                    $display("CORRECT");
                end else begin
                    $display("INCORRECT");
                end
            else if (eqIn == one && gtIn ==  zero) begin
                //compare
                if (a > b) begin
                    //eq = 0, gt = 1
                    if (eqOut == zero && gtOut == one) begin
                        $display("CORRECT");
                    end else begin
                        $display("INCORRECT");
                    end
                end
                if (a < b) begin
                    //eq = 0, gt = 0
                    if (eqOut == zero && gtOut == zero) begin
                        $display("CORRECT");
                    end else begin
                        $display("INCORRECT");
                    end
                end
                if (a == b) begin
                    //eq = 1, gt = 0
                    if (eqOut == one && gtOut == one) begin
                        $display("CORRECT");
                    end else begin
                        $display("INCORRECT");
                    end
                end

            end*/

            #5;
        end
        
    end

endmodule