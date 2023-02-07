/*
Basic 2:1 32-bit multiplexer unit
*/
module basemux(a, b, select, out);
input select;
input a, b;
output out;

//output a if select = true, b if select = false
assign out = select ? b : a;
endmodule

module fourmux(a, b, c, d, select, out);
input [1:0] select;
input a, b, c, d;
output out;

wire w1;
wire w2;

basemux in1(a, b, select[0], w1);
basemux in2(c, d, select[0], w2);

basemux outmux(w1, w2, select[1], out);

endmodule

module eightmux(a, b, c, d, e, f, g, h, select, out);
input [2:0] select;
input a, b, c, d, e, f, g, h;
output out;

wire w1;
wire w2;

fourmux mux1(a, b, c, d, select[1:0], w1);
fourmux mux2(e, f, g, h, select[1:0], w2);

basemux finalmux(w1, w2, select[2], out);

endmodule