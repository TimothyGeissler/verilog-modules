`include "twobit.v"

module eightbit(input [15:0] SW, output [1:0] LED, input CLK100MHZ);
    
    //input [8:0] a, b;
    //output eqOut, gtOut;

    reg zero = 1'b0;
    reg one = 1'b1;

    //eq = 1, gt = 0
    wire [1:0] aOut, bOut, cOut; 
    wire [7:0] a, b;
    
    assign a = SW[7:0];
    assign b = SW[15:8];
    
    assign LED[0] = eqOut;
    assign LED[1] = gtOut;
    

    twobit aComp(one, zero, a[7:6], b[7:6], aOut[1], aOut[0]);
    twobit bComp(aOut[1], aOut[0], a[5:4], b[5:4], bOut[1], bOut[0]);

    twobit cComp(bOut[1], bOut[0], a[3:2], b[3:2], cOut[1], cOut[0]);
    twobit dComp(cOut[1], cOut[0], a[1:0], b[1:0], eqOut, gtOut);

    ila_0 debuggers(.clk(CLK100MHZ),.probe0(a),.probe1(b),.probe2(eqOut),.probe3(gtOut));

endmodule