`include "para_def.v"
module stage3_reg_module ( clk , rst_n , 
                           message_en_in , 
                           packet_head_data_in , 
                           length_fast_1_in , length_fast_2_in , length_fast_3_in , 
                           message_fast_1_in , message_fast_2_in , message_fast_3_in , 
                           packet_ETX_data_in ,  
                           message_en_out , 
                           packet_head_data_out ,
                           length_fast_1_out , length_fast_2_out , length_fast_3_out , 
                           message_fast_1_out , message_fast_2_out , message_fast_3_out , 
                           packet_ETX_data_out 
                           );
    input  clk , rst_n , 
           message_en_in , 
           packet_head_data_in , 
           length_fast_1_in , length_fast_2_in , length_fast_3_in , 
           message_fast_1_in , message_fast_2_in , message_fast_3_in , 
           packet_ETX_data_in ;
    output message_en_out , 
           packet_head_data_out ,
           length_fast_1_out , length_fast_2_out , length_fast_3_out , 
           message_fast_1_out , message_fast_2_out , message_fast_3_out , 
           packet_ETX_data_out ;
    
    wire                                    clk , rst_n ;
    wire                                    message_en_in ;
    wire [ `packet_head_data_bits - 1 : 0 ] packet_head_data_in ;
    wire [ `fast_length_bits - 1 : 0 ]      length_fast_1_in , length_fast_2_in , length_fast_3_in ;
    wire [ `fast_message_bits - 1 : 0 ]     message_fast_1_in , message_fast_2_in , message_fast_3_in ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]  packet_ETX_data_in ;
    
    wire                                    message_en_out ;
    wire [ `packet_head_data_bits - 1 : 0 ] packet_head_data_out ;
    wire [ `fast_length_bits - 1 : 0 ]      length_fast_1_out , length_fast_2_out , length_fast_3_out ;
    wire [ `fast_message_bits - 1 : 0 ]     message_fast_1_out , message_fast_2_out , message_fast_3_out ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]  packet_ETX_data_out ;
    
    reg_m_module # 
      (
       .REG_WIDTH   (1)
      )
      message_en_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_en_in ),
       .q      ( message_en_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`packet_head_data_bits)
      )
      packet_head_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( packet_head_data_in ),
       .q      ( packet_head_data_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_length_bits)
      )
      length_fast_1_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( length_fast_1_in ),
       .q      ( length_fast_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_length_bits)
      )
      length_fast_2_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( length_fast_2_in ),
       .q      ( length_fast_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_length_bits)
      )
      length_fast_3_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( length_fast_3_in ),
       .q      ( length_fast_3_out )
      );
    
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_message_bits)
      )
      message_fast_1_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_fast_1_in ),
       .q      ( message_fast_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_message_bits)
      )
      message_fast_2_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_fast_2_in ),
       .q      ( message_fast_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`fast_message_bits)
      )
      message_fast_3_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_fast_3_in ),
       .q      ( message_fast_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`packet_ETX_data_bits)
      )
      packet_ETX_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( packet_ETX_data_in ),
       .q      ( packet_ETX_data_out )
      );
    
endmodule
