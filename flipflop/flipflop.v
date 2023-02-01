module flipflop (
    d,
    clk,
    q
);
    
    input d, clk;
    output q;
    reg q;

    // output = data (store data) at every clk rising edge 
    always @(posedge clk) begin
        q = d; 
    end

endmodule