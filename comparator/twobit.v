`include "eightmux.v"

module twobit(eqIn, gtIn, a, b, eqOut, gtOut);
    input [1:0] a, b;
    input eqIn, gtIn;
    output eqOut, gtOut;

    wire feq; // output of EQ mux
    wire fgt; // output of GT mux
    wire wgtf; // from gt mux & c'd
    wire wgt; // from 'c & d
    wire [2:0] select;

    reg zero = 1'b0;
    reg one = 1'b1;

    assign select[0] = b[1];
    assign select[2:1] = a;
    assign nb0 = ~b[0];

    eightmux eqMux(nb0, zero, b[0], zero, zero, nb0, zero, b[0], select, feq);
    and eqAnd(eqOut, eqIn, ~gtIn, feq);

    eightmux gtMux(zero, zero, nb0, zero, one, zero, one, nb0, select, fgt);
    and gtAnd(wgtf, eqIn, ~gtIn, fgt);
    and gtMiniAnd(wgt, ~eqIn, gtIn);
    or gtOr(gtOut, wgt, wgtf);
endmodule