`include "para_def.v"
module stage2_seq_number_module ( rst_n , clk , message_en , seq_number_control , seq_number_data );
    input rst_n , clk , message_en , seq_number_control ;
    output seq_number_data ; 
    
    wire                                       rst_n , clk , message_en ;
    wire [ `seq_number_control_width - 1 : 0 ] seq_number_control ;
    reg  [ `seq_number_data_bits - 1 : 0 ]     seq_number_data ;
    
    always @( posedge clk )
    begin
        if (!rst_n)
              seq_number_data <=  `seq_number_data_initial;
        else
          if ( message_en )
            if ( seq_number_control )
              seq_number_data <=  ( seq_number_data + 1 );
            else
              seq_number_data <=  `seq_number_data_initial ;
          else
              seq_number_data <=  seq_number_data ; 
    end
endmodule
