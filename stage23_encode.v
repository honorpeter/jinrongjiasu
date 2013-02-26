`include "para_def.v"
module stage23_encode_module ( 
                       clk , rst_n , 
                       original_data_1 , original_data_2 , original_data_3 , 
                       message_en_in , 
                       message_en_out , 
                       packet_head_data_out , 
                       length_fast_1_out , length_fast_2_out , length_fast_3_out , 
                       message_fast_1_out , message_fast_2_out , message_fast_3_out , 
                       packet_ETX_data_out 
                       );
    input  clk , rst_n , 
           original_data_1 , original_data_2 , original_data_3 , 
           message_en_in ;
    output message_en_out , 
           packet_head_data_out , 
           length_fast_1_out , length_fast_2_out , length_fast_3_out , 
           message_fast_1_out , message_fast_2_out , message_fast_3_out , 
           packet_ETX_data_out ;
           
    wire                                           clk , rst_n ;
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ]       original_data_1 , original_data_2 , original_data_3 ;
    wire                                           message_en_in ;
    
    wire                                           message_en_out ;
    wire [ `packet_head_data_bits - 1 : 0 ]        packet_head_data_out ;
    wire [ `fast_length_bits - 1 : 0 ]             length_fast_1_out , length_fast_2_out , length_fast_3_out ;
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1_out , message_fast_2_out , message_fast_3_out ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]         packet_ETX_data_out ;
    
    
    
    wire [ `max_block_bits - 1 : 0 ]               block_data_mid ;
    wire                                           message_en_mid ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_mid , message_2_mid , message_3_mid;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_mid , N_type_control_m2_mid , N_type_control_m3_mid ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_mid , message_mux_control_m2_mid , message_mux_control_m3_mid ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data_mid ;
    wire [ `field_BT8_bits - 1 : 0 ]               block_time_message_mid ;
    
    
    assign block_time_message_mid = block_data_mid [ `opra_block_time_message_b : `opra_block_time_message_e ];
    
    stage2_opra_encode_module stage2_opra_encode ( 
                                                  .clk ( clk ), 
                                                  .rst_n ( rst_n ), 
                                                  .original_data_1 ( original_data_1 ), 
                                                  .original_data_2 ( original_data_2 ), 
                                                  .original_data_3 ( original_data_3 ), 
                                                  .message_en_in ( message_en_in ),
                                                  .block_data_out ( block_data_mid ), 
                                                  .message_en_out ( message_en_mid ),
                                                  .message_1_out ( message_1_mid ), 
                                                  .message_2_out ( message_2_mid ), 
                                                  .message_3_out ( message_3_mid ), 
                                                  .N_type_control_m1_out ( N_type_control_m1_mid ),
                                                  .N_type_control_m2_out ( N_type_control_m2_mid ),
                                                  .N_type_control_m3_out ( N_type_control_m3_mid ),
                                                  .message_mux_control_m1_out ( message_mux_control_m1_mid ),
                                                  .message_mux_control_m2_out ( message_mux_control_m2_mid ),
                                                  .message_mux_control_m3_out ( message_mux_control_m3_mid ),
                                                  .message_number_data_out ( message_number_data_mid )
                                                  );
    
    stage3_fast_encode_module stage3_fast_encode ( 
                                                  .clk ( clk ), 
                                                  .rst_n ( rst_n ), 
                                                  .message_en ( message_en_mid ),
                                                  .block_time_message ( block_time_message_mid ), 
                                                  .message_1 ( message_1_mid ), 
                                                  .message_2 ( message_2_mid ), 
                                                  .message_3 ( message_3_mid ), 
                                                  .N_type_control_m1 ( N_type_control_m1_mid ), 
                                                  .N_type_control_m2 ( N_type_control_m2_mid ), 
                                                  .N_type_control_m3 ( N_type_control_m3_mid ),
                                                  .message_mux_control_m1 ( message_mux_control_m1_mid ), 
                                                  .message_mux_control_m2 ( message_mux_control_m2_mid ), 
                                                  .message_mux_control_m3 ( message_mux_control_m3_mid ),
                                                  .message_number_data ( message_number_data_mid ), 
                                                  .message_en_out ( message_en_out ), 
                                                  .packet_head_data_out ( packet_head_data_out ),
                                                  .length_fast_1_out ( length_fast_1_out ), 
                                                  .length_fast_2_out ( length_fast_2_out ), 
                                                  .length_fast_3_out ( length_fast_3_out ), 
                                                  .message_fast_1_out ( message_fast_1_out ), 
                                                  .message_fast_2_out ( message_fast_2_out ), 
                                                  .message_fast_3_out ( message_fast_3_out ), 
                                                  .packet_ETX_data_out ( packet_ETX_data_out ) 
                                                  );
    
endmodule
