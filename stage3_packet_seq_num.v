`include "para_def.v"
module stage3_packet_seq_num_module ( rst_n , clk , message_en , packet_seq_num_data );
    input  rst_n , clk , message_en ;
    output packet_seq_num_data ;
    
    wire                                       rst_n , clk , message_en ;
    reg  [ `packet_seq_num_data_bits - 1 : 0 ] packet_seq_num_data ;
    
    always @( posedge clk )
    begin
        if (!rst_n)
            packet_seq_num_data <= `packet_seq_num_data_initial ;
        else
          if (message_en)
            packet_seq_num_data <= ( packet_seq_num_data + 1 ) ;
          else
            packet_seq_num_data <= packet_seq_num_data ;
    end
endmodule
