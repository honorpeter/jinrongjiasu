`include "para_def.v"
module stage234_module ( 
                        clk , rst_n , 
                        original_data_1 , original_data_2 , original_data_3 , 
                        message_en_in , 
                        message_en_out ,
                        message_1_out , message_2_out , message_3_out , 
                        N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
                        message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out 
                        );
    
    input  clk , rst_n , 
           original_data_1 , original_data_2 , original_data_3 , 
           message_en_in ;
    output message_en_out ,
           message_1_out , message_2_out , message_3_out , 
           N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
           message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;

    wire                                           clk , rst_n ;
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ]       original_data_1 , original_data_2 , original_data_3 ;
    wire                                           message_en_in ;

    wire                                           message_en_out ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_out , message_2_out , message_3_out ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    
    wire [ `max_block_bits - 1 : 0 ]               block_data_23 ;
    wire                                           message_en_23 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_23 , message_2_23 , message_3_23;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_23 , N_type_control_m2_23 , N_type_control_m3_23 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_23 , message_mux_control_m2_23 , message_mux_control_m3_23 ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data_23 ;
    wire [ `field_BT8_bits - 1 : 0 ]               block_time_message_23 ;
    
    wire                                           message_en_34 ;
    wire [ `packet_head_data_bits - 1 : 0 ]        packet_head_data_34 ;
    wire [ `fast_length_bits - 1 : 0 ]             length_fast_1_34 , length_fast_2_34 , length_fast_3_34 ;
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1_34 , message_fast_2_34 , message_fast_3_34 ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]         packet_ETX_data_34 ;
    
    assign block_time_message_23 = block_data_23 [ `opra_block_time_message_b : `opra_block_time_message_e ];

    stage2_opra_encode_module stage2_opra_encode ( 
                                                  .clk ( clk ), 
                                                  .rst_n ( rst_n ), 
                                                  .original_data_1 ( original_data_1 ), 
                                                  .original_data_2 ( original_data_2 ), 
                                                  .original_data_3 ( original_data_3 ), 
                                                  .message_en_in ( message_en_in ),
                                                  .block_data_out ( block_data_23 ), 
                                                  .message_en_out ( message_en_23 ),
                                                  .message_1_out ( message_1_23 ), 
                                                  .message_2_out ( message_2_23 ), 
                                                  .message_3_out ( message_3_23 ), 
                                                  .N_type_control_m1_out ( N_type_control_m1_23 ),
                                                  .N_type_control_m2_out ( N_type_control_m2_23 ),
                                                  .N_type_control_m3_out ( N_type_control_m3_23 ),
                                                  .message_mux_control_m1_out ( message_mux_control_m1_23 ),
                                                  .message_mux_control_m2_out ( message_mux_control_m2_23 ),
                                                  .message_mux_control_m3_out ( message_mux_control_m3_23 ),
                                                  .message_number_data_out ( message_number_data_23 )
                                                  );
    
    stage3_fast_encode_module stage3_fast_encode ( 
                                                  .clk ( clk ), 
                                                  .rst_n ( rst_n ), 
                                                  .message_en ( message_en_23 ),
                                                  .block_time_message ( block_time_message_23 ), 
                                                  .message_1 ( message_1_23 ), 
                                                  .message_2 ( message_2_23 ), 
                                                  .message_3 ( message_3_23 ), 
                                                  .N_type_control_m1 ( N_type_control_m1_23 ), 
                                                  .N_type_control_m2 ( N_type_control_m2_23 ), 
                                                  .N_type_control_m3 ( N_type_control_m3_23 ),
                                                  .message_mux_control_m1 ( message_mux_control_m1_23 ), 
                                                  .message_mux_control_m2 ( message_mux_control_m2_23 ), 
                                                  .message_mux_control_m3 ( message_mux_control_m3_23 ),
                                                  .message_number_data ( message_number_data_23 ), 
                                                  .message_en_out ( message_en_34 ), 
                                                  .packet_head_data_out ( packet_head_data_34 ),
                                                  .length_fast_1_out ( length_fast_1_34 ), 
                                                  .length_fast_2_out ( length_fast_2_34 ), 
                                                  .length_fast_3_out ( length_fast_3_34 ), 
                                                  .message_fast_1_out ( message_fast_1_34 ), 
                                                  .message_fast_2_out ( message_fast_2_34 ), 
                                                  .message_fast_3_out ( message_fast_3_34 ), 
                                                  .packet_ETX_data_out ( packet_ETX_data_34 ) 
                                                  );
    
    stage4_fast_decode_module stage4_fast_decode ( 
                                                  .clk (clk), 
                                                  .rst_n (rst_n), 
                                                  .message_fast_1 (message_fast_1_34), 
                                                  .message_fast_2 (message_fast_2_34), 
                                                  .message_fast_3 (message_fast_3_34),
                                                  .message_en (message_en_34), 
                                                  .message_en_out (message_en_out),
                                                  .message_1_out (message_1_out), 
                                                  .message_2_out (message_2_out), 
                                                  .message_3_out (message_3_out),
                                                  .N_type_control_m1_out (N_type_control_m1_out), 
                                                  .N_type_control_m2_out (N_type_control_m2_out), 
                                                  .N_type_control_m3_out (N_type_control_m3_out), 
                                                  .message_mux_control_m1_out (message_mux_control_m1_out), 
                                                  .message_mux_control_m2_out (message_mux_control_m2_out), 
                                                  .message_mux_control_m3_out (message_mux_control_m3_out) 
                                                  );
endmodule
