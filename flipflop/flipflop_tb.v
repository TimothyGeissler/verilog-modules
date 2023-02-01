module flipflop_tb;
    wire out;
    reg clk, d;
    integer i;
    
    flipflop dff(d, clk, out);

    initial begin
        clk = 0;
        $dumpfile("flipflop-wvfrm.vcd");
        $dumpvars(0, flipflop_tb);
        $display("clk:data:out");
        $monitor(clk, d, out);
        for (i = 0; i < 4; i=i+1) begin
            d = i[1:0];
            clk =! clk;
            #5;
        end
    end
endmodule