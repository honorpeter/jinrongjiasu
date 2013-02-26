module reg_m_module #
       ( parameter REG_WIDTH = 1 ,
         parameter REG_INITIAL = 'b0
       )
       (
         clk , rst_n , d , q 
       );
    
    input  clk , rst_n ;
    output d , q;
    
    wire clk , rst_n ;
    wire [ REG_WIDTH - 1 : 0 ] d ;
    reg  [ REG_WIDTH - 1 : 0 ] q ;
    
    always @( posedge clk )
    begin
        if (!rst_n)
          q <= REG_INITIAL ;
        else
          q <= d ;
    end
endmodule
