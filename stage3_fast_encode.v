`include "para_def.v"
module stage3_fast_encode_module ( clk , rst_n , 
                                   message_en ,
                                   block_time_message , 
                                   message_1 , message_2 , message_3 , 
                                   N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
                                   message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
                                   message_number_data , 
                                   message_en_out , 
                                   packet_head_data_out ,
                                   length_fast_1_out , length_fast_2_out , length_fast_3_out , 
                                   message_fast_1_out , message_fast_2_out , message_fast_3_out , 
                                   packet_ETX_data_out 
                                   );
    input  clk , rst_n , 
           message_en ,
           block_time_message , 
           message_1 ,  message_2 , message_3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
           message_number_data ;
    output message_en_out , 
           packet_head_data_out ,
           length_fast_1_out , length_fast_2_out , length_fast_3_out , 
           message_fast_1_out , message_fast_2_out , message_fast_3_out , 
           packet_ETX_data_out ;
    
    wire                                             clk , rst_n ;
    wire                                             message_en ;
    wire [ `field_BT8_bits - 1 : 0 ]                 block_time_message ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]               message_1 , message_2 , message_3 ;
    wire [ `N_type_control_width - 1 : 0]            N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `message_mux_control_width - 1 : 0 ]      message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `message_number_data_bits - 1 : 0 ]       message_number_data ;
    
    wire                                             message_en_out ;
    wire [ `packet_head_data_bits - 1 : 0 ]          packet_head_data_out ;
    wire [ `fast_length_bits - 1 : 0 ]               length_fast_1_out , length_fast_2_out , length_fast_3_out ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_out , message_fast_2_out , message_fast_3_out ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]           packet_ETX_data_out ;
    
    wire [ `field_BT8_bits - 1 : 0 ]                 field_BT8 ;
    wire [ `field_PID1_bits - 1 : 0 ]                field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]                 field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]                 field_MT1 ;
    wire [ `field_SS5_bits - 1 : 0 ]                 field_SS5 ;
    wire [ `field_EB3_bits - 1 : 0 ]                 field_EB3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]               field_SPDC1 ;
    wire [ `field_SP4_bits - 1 : 0 ]                 field_SP4 ;
    wire [ `field_V4_bits - 1 : 0 ]                  field_V4 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]               field_PPDC1 ;
    wire [ `field_PP4_bits - 1 : 0 ]                 field_PP4 ; 
    wire [ `field_TI4_bits - 1 : 0 ]                 field_TI4 ;
    wire [ `field_OIV4_bits - 1 : 0 ]                field_OIV4 ;
    wire [ `field_BP4_bits - 1 : 0 ]                 field_BP4 ; 
    wire [ `field_BS4_bits - 1 : 0 ]                 field_BS4 ; 
    wire [ `field_OP4_bits - 1 : 0 ]                 field_OP4 ; 
    wire [ `field_OS4_bits - 1 : 0 ]                 field_OS4 ; 
    wire [ `field_SS4_bits - 1 : 0 ]                 field_SS4 ;
    wire [ `field_SP2_bits - 1 : 0 ]                 field_SP2 ;
    wire [ `field_BP2_bits - 1 : 0 ]                 field_BP2 ;
    wire [ `field_BS2_bits - 1 : 0 ]                 field_BS2 ;
    wire [ `field_OP2_bits - 1 : 0 ]                 field_OP2 ;
    wire [ `field_OS2_bits - 1 : 0 ]                 field_OS2 ;
    wire [ `field_BSN4_bits - 1 : 0 ]                field_BSN4 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]               field_EBSN4 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]               field_RBSN4 ;
    wire [ `field_MC8_bits - 1 : 0 ]                 field_MC8 ;
    
    wire [ `field_BT8_bits - 1 : 0 ]                 field_BT8_next ;
    wire [ `field_PID1_bits - 1 : 0 ]                field_PID1_next ;
    wire [ `field_MC1_bits - 1 : 0 ]                 field_MC1_next ;
    wire [ `field_MT1_bits - 1 : 0 ]                 field_MT1_next ;
    wire [ `field_SS5_bits - 1 : 0 ]                 field_SS5_next ;
    wire [ `field_EB3_bits - 1 : 0 ]                 field_EB3_next ;
    wire [ `field_SPDC1_bits - 1 : 0 ]               field_SPDC1_next ;
    wire [ `field_SP4_bits - 1 : 0 ]                 field_SP4_next ;
    wire [ `field_V4_bits - 1 : 0 ]                  field_V4_next ;
    wire [ `field_PPDC1_bits - 1 : 0 ]               field_PPDC1_next ;
    wire [ `field_PP4_bits - 1 : 0 ]                 field_PP4_next ; 
    wire [ `field_TI4_bits - 1 : 0 ]                 field_TI4_next ;
    wire [ `field_OIV4_bits - 1 : 0 ]                field_OIV4_next ;
    wire [ `field_BP4_bits - 1 : 0 ]                 field_BP4_next ; 
    wire [ `field_BS4_bits - 1 : 0 ]                 field_BS4_next ; 
    wire [ `field_OP4_bits - 1 : 0 ]                 field_OP4_next ; 
    wire [ `field_OS4_bits - 1 : 0 ]                 field_OS4_next ; 
    wire [ `field_SS4_bits - 1 : 0 ]                 field_SS4_next ;
    wire [ `field_SP2_bits - 1 : 0 ]                 field_SP2_next ;
    wire [ `field_BP2_bits - 1 : 0 ]                 field_BP2_next ;
    wire [ `field_BS2_bits - 1 : 0 ]                 field_BS2_next ;
    wire [ `field_OP2_bits - 1 : 0 ]                 field_OP2_next ;
    wire [ `field_OS2_bits - 1 : 0 ]                 field_OS2_next ;
    wire [ `field_BSN4_bits - 1 : 0 ]                field_BSN4_next ;
    wire [ `field_EBSN4_bits - 1 : 0 ]               field_EBSN4_next ;
    wire [ `field_RBSN4_bits - 1 : 0 ]               field_RBSN4_next ;
    wire [ `field_MC8_bits - 1 : 0 ]                 field_MC8_next ;
    
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_a , message_fast_2_a , message_fast_3_a ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_a , message_fast_length_2_a , message_fast_length_3_a ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_d , message_fast_2_d , message_fast_3_d ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_d , message_fast_length_2_d , message_fast_length_3_d ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_k , message_fast_2_k , message_fast_3_k ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_k , message_fast_length_2_k , message_fast_length_3_k ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_q , message_fast_2_q , message_fast_3_q ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_q , message_fast_length_2_q , message_fast_length_3_q ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_NL , message_fast_2_NL , message_fast_3_NL ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_NL , message_fast_length_2_NL , message_fast_length_3_NL ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_NM , message_fast_2_NM , message_fast_3_NM ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_NM , message_fast_length_2_NM , message_fast_length_3_NM ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_NN , message_fast_2_NN , message_fast_3_NN ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_NN , message_fast_length_2_NN , message_fast_length_3_NN ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_NR , message_fast_2_NR , message_fast_3_NR ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_NR , message_fast_length_2_NR , message_fast_length_3_NR ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_NS , message_fast_2_NS , message_fast_3_NS ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_NS , message_fast_length_2_NS , message_fast_length_3_NS ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1_N , message_fast_2_N , message_fast_3_N ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1_N , message_fast_length_2_N , message_fast_length_3_N ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `fast_length_bits - 1 : 0 ]               message_fast_length_1 , message_fast_length_2 , message_fast_length_3 ;
    
    wire [ `packet_messages_data_bits - 1 : 0 ]      packet_messages_data ;
    wire [ `packet_seq_num_data_bits - 1 : 0 ]       packet_seq_num_data ;
    wire [ `packet_head_data_bits - 1 : 0 ]          packet_head_data ;
    wire [ `packet_ETX_data_bits - 1 : 0 ]           packet_ETX_data ;
    
    stage3_fast_a_module stage3_fast_a ( 
                                        .message_1                                   ( message_1 ), 
                                        .message_2                                   ( message_2 ), 
                                        .message_3                                   ( message_3 ),
                                        .block_time_message                          ( block_time_message ), 
                                        .field_BT8                                   ( field_BT8 ),
                                        .field_PID1                                  ( field_PID1 ), 
                                        .field_MC1                                   ( field_MC1 ), 
                                        .field_MT1                                   ( field_MT1 ),
                                        .field_SS5                                   ( field_SS5 ), 
                                        .field_EB3                                   ( field_EB3 ), 
                                        .field_SPDC1                                 ( field_SPDC1 ), 
                                        .field_SP4                                   ( field_SP4 ), 
                                        .field_V4                                    ( field_V4 ), 
                                        .field_PPDC1                                 ( field_PPDC1 ), 
                                        .field_PP4                                   ( field_PP4 ), 
                                        .field_TI4                                   ( field_TI4 ),
                                        .message_fast_1                              ( message_fast_1_a ), 
                                        .message_fast_2                              ( message_fast_2_a ), 
                                        .message_fast_3                              ( message_fast_3_a ),
                                        .message_fast_length_1                       ( message_fast_length_1_a ), 
                                        .message_fast_length_2                       ( message_fast_length_2_a ), 
                                        .message_fast_length_3                       ( message_fast_length_3_a )
                                        );
    
    stage3_fast_d_module stage3_fast_d ( 
                                        .message_1                                   ( message_1 ), 
                                        .message_2                                   ( message_2 ), 
                                        .message_3                                   ( message_3 ), 
                                        .block_time_message                          ( block_time_message ), 
                                        .field_BT8                                   ( field_BT8 ), 
                                        .field_PID1                                  ( field_PID1 ), 
                                        .field_MC1                                   ( field_MC1 ), 
                                        .field_MT1                                   ( field_MT1 ), 
                                        .field_SS5                                   ( field_SS5 ), 
                                        .field_EB3                                   ( field_EB3 ), 
                                        .field_SPDC1                                 ( field_SPDC1 ), 
                                        .field_SP4                                   ( field_SP4 ), 
                                        .field_OIV4                                  ( field_OIV4 ), 
                                        .message_fast_1                              ( message_fast_1_d ), 
                                        .message_fast_2                              ( message_fast_2_d ), 
                                        .message_fast_3                              ( message_fast_2_d ),
                                        .message_fast_length_1                       ( message_fast_length_1_d ), 
                                        .message_fast_length_2                       ( message_fast_length_2_d ), 
                                        .message_fast_length_3                       ( message_fast_length_3_d )
                              );
    
    stage3_fast_k_module stage3_fast_k ( 
                                        .message_1                                   ( message_1 ), 
                                        .message_2                                   ( message_2 ), 
                                        .message_3                                   ( message_3 ),
                                        .block_time_message                          ( block_time_message ), 
                                        .field_BT8                                   ( field_BT8 ), 
                                        .field_PID1                                  ( field_PID1 ), 
                                        .field_MC1                                   ( field_MC1 ), 
                                        .field_MT1                                   ( field_MT1 ),
                                        .field_SS5                                   ( field_SS5 ), 
                                        .field_EB3                                   ( field_EB3 ), 
                                        .field_SPDC1                                 ( field_SPDC1 ), 
                                        .field_SP4                                   ( field_SP4 ), 
                                        .field_PPDC1                                 ( field_PPDC1 ), 
                                        .field_BP4                                   ( field_BP4 ), 
                                        .field_BS4                                   ( field_BS4 ), 
                                        .field_OP4                                   ( field_OP4 ), 
                                        .field_OS4                                   ( field_OS4 ), 
                                        .message_fast_1                              ( message_fast_1_k ), 
                                        .message_fast_2                              ( message_fast_2_k ), 
                                        .message_fast_3                              ( message_fast_3_k ), 
                                        .message_fast_length_1                       ( message_fast_length_1_k ), 
                                        .message_fast_length_2                       ( message_fast_length_2_k ), 
                                        .message_fast_length_3                       ( message_fast_length_3_k )
                              );
    
    stage3_fast_q_module stage3_fast_q ( 
                                        .message_1                                   ( message_1 ), 
                                        .message_2                                   ( message_2 ), 
                                        .message_3                                   ( message_3 ),
                                        .block_time_message                          ( block_time_message ),
                                        .field_BT8                                   ( field_BT8 ), 
                                        .field_PID1                                  ( field_PID1 ), 
                                        .field_MC1                                   ( field_MC1 ), 
                                        .field_MT1                                   ( field_MT1 ),
                                        .field_SS4                                   ( field_SS4 ), 
                                        .field_EB3                                   ( field_EB3 ), 
                                        .field_SP2                                   ( field_SP2 ), 
                                        .field_BP2                                   ( field_BP2 ), 
                                        .field_BS2                                   ( field_BS2 ), 
                                        .field_OP2                                   ( field_OP2 ), 
                                        .field_OS2                                   ( field_OS2 ),
                                        .message_fast_1                              ( message_fast_1_q ), 
                                        .message_fast_2                              ( message_fast_2_q ), 
                                        .message_fast_3                              ( message_fast_3_q ), 
                                        .message_fast_length_1                       ( message_fast_length_1_q ), 
                                        .message_fast_length_2                       ( message_fast_length_2_q ), 
                                        .message_fast_length_3                       ( message_fast_length_3_q ) 
                              );
    
    stage3_fast_NL_module stage3_fast_NL ( 
                                          .message_1                                 ( message_1 ), 
                                          .message_2                                 ( message_2 ), 
                                          .message_3                                 ( message_3 ),
                                          .block_time_message                        ( block_time_message ), 
                                          .field_BT8                                 ( field_BT8 ), 
                                          .field_PID1                                ( field_PID1 ), 
                                          .field_MC1                                 ( field_MC1 ), 
                                          .field_MT1                                 ( field_MT1 ), 
                                          .message_fast_1                            ( message_fast_1_NL ), 
                                          .message_fast_2                            ( message_fast_2_NL ), 
                                          .message_fast_3                            ( message_fast_3_NL ), 
                                          .message_fast_length_1                     ( message_fast_length_1_NL ), 
                                          .message_fast_length_2                     ( message_fast_length_2_NL ), 
                                          .message_fast_length_3                     ( message_fast_length_3_NL ) 
                               );
    
    stage3_fast_NM_module stage3_fast_NM (  
                                          .message_1                                 ( message_1 ), 
                                          .message_2                                 ( message_2 ), 
                                          .message_3                                 ( message_3 ),
                                          .block_time_message                        ( block_time_message ), 
                                          .field_BT8                                 ( field_BT8 ), 
                                          .field_PID1                                ( field_PID1 ), 
                                          .field_MC1                                 ( field_MC1 ), 
                                          .field_MT1                                 ( field_MT1 ),
                                          .field_BSN4                                ( field_BSN4 ),   
                                          .message_fast_1                            ( message_fast_1_NM ), 
                                          .message_fast_2                            ( message_fast_2_NM ), 
                                          .message_fast_3                            ( message_fast_3_NM ), 
                                          .message_fast_length_1                     ( message_fast_length_1_NM ), 
                                          .message_fast_length_2                     ( message_fast_length_2_NM ), 
                                          .message_fast_length_3                     ( message_fast_length_3_NM ) 
                                          );
    
    stage3_fast_NN_module stage3_fast_NN (  
                                          .message_1                                 ( message_1 ), 
                                          .message_2                                 ( message_2 ), 
                                          .message_3                                 ( message_3 ),
                                          .block_time_message                        ( block_time_message ), 
                                          .field_BT8                                 ( field_BT8 ), 
                                          .field_PID1                                ( field_PID1 ), 
                                          .field_MC1                                 ( field_MC1 ), 
                                          .field_MT1                                 ( field_MT1 ),
                                          .field_EBSN4                               ( field_EBSN4 ), 
                                          .field_RBSN4                               ( field_RBSN4 ),  
                                          .message_fast_1                            ( message_fast_1_NN ), 
                                          .message_fast_2                            ( message_fast_2_NN ), 
                                          .message_fast_3                            ( message_fast_3_NN ), 
                                          .message_fast_length_1                     ( message_fast_length_1_NN ), 
                                          .message_fast_length_2                     ( message_fast_length_2_NN ), 
                                          .message_fast_length_3                     ( message_fast_length_3_NN ) 
                                          );
    
    stage3_fast_NR_module stage3_fast_NR (  
                                          .message_1                                 ( message_1 ), 
                                          .message_2                                 ( message_2 ), 
                                          .message_3                                 ( message_3 ),
                                          .block_time_message                        ( block_time_message ), 
                                          .field_BT8                                 ( field_BT8 ), 
                                          .field_PID1                                ( field_PID1 ), 
                                          .field_MC1                                 ( field_MC1 ), 
                                          .field_MT1                                 ( field_MT1 ),  
                                          .message_fast_1                            ( message_fast_1_NR ), 
                                          .message_fast_2                            ( message_fast_2_NR ), 
                                          .message_fast_3                            ( message_fast_3_NR ), 
                                          .message_fast_length_1                     ( message_fast_length_1_NR ), 
                                          .message_fast_length_2                     ( message_fast_length_2_NR ), 
                                          .message_fast_length_3                     ( message_fast_length_3_NR ) 
                                          );
    
    stage3_fast_NS_module stage3_fast_NS ( 
                                          .message_1                                 ( message_1 ), 
                                          .message_2                                 ( message_2 ), 
                                          .message_3                                 ( message_3 ),
                                          .block_time_message                        ( block_time_message ), 
                                          .field_BT8                                 ( field_BT8 ), 
                                          .field_PID1                                ( field_PID1 ), 
                                          .field_MC1                                 ( field_MC1 ), 
                                          .field_MT1                                 ( field_MT1 ),
                                          .field_MC8                                 ( field_MC8 ),   
                                          .message_fast_1                            ( message_fast_1_NS ), 
                                          .message_fast_2                            ( message_fast_2_NS ), 
                                          .message_fast_3                            ( message_fast_3_NS ), 
                                          .message_fast_length_1                     ( message_fast_length_1_NS ), 
                                          .message_fast_length_2                     ( message_fast_length_2_NS ), 
                                          .message_fast_length_3                     ( message_fast_length_3_NS ) 
                                          );
    
    stage3_fast_N_type_module stage3_fast_N_type ( 
                                                  .message_fast_NL_1                 ( message_fast_1_NL ), 
                                                  .message_fast_NL_2                 ( message_fast_2_NL ), 
                                                  .message_fast_NL_3                 ( message_fast_3_NL ),
                                                  .message_fast_NM_1                 ( message_fast_1_NM ), 
                                                  .message_fast_NM_2                 ( message_fast_2_NM ), 
                                                  .message_fast_NM_3                 ( message_fast_3_NM ),
                                                  .message_fast_NN_1                 ( message_fast_1_NN ), 
                                                  .message_fast_NN_2                 ( message_fast_2_NN ), 
                                                  .message_fast_NN_3                 ( message_fast_3_NN ),
                                                  .message_fast_NR_1                 ( message_fast_1_NR ), 
                                                  .message_fast_NR_2                 ( message_fast_2_NR ), 
                                                  .message_fast_NR_3                 ( message_fast_3_NR ),
                                                  .message_fast_NS_1                 ( message_fast_1_NS ), 
                                                  .message_fast_NS_2                 ( message_fast_2_NS ), 
                                                  .message_fast_NS_3                 ( message_fast_3_NS ),
                                                  .length_fast_NL_1                  ( message_fast_length_1_NL ), 
                                                  .length_fast_NL_2                  ( message_fast_length_2_NL ), 
                                                  .length_fast_NL_3                  ( message_fast_length_3_NL ),
                                                  .length_fast_NM_1                  ( message_fast_length_1_NM ), 
                                                  .length_fast_NM_2                  ( message_fast_length_2_NM ), 
                                                  .length_fast_NM_3                  ( message_fast_length_3_NM ),
                                                  .length_fast_NN_1                  ( message_fast_length_1_NN ), 
                                                  .length_fast_NN_2                  ( message_fast_length_2_NN ), 
                                                  .length_fast_NN_3                  ( message_fast_length_3_NN ),
                                                  .length_fast_NR_1                  ( message_fast_length_1_NR ), 
                                                  .length_fast_NR_2                  ( message_fast_length_2_NR ), 
                                                  .length_fast_NR_3                  ( message_fast_length_3_NR ),
                                                  .length_fast_NS_1                  ( message_fast_length_1_NS ), 
                                                  .length_fast_NS_2                  ( message_fast_length_2_NS ), 
                                                  .length_fast_NS_3                  ( message_fast_length_3_NS ),
                                                  .N_type_control_m1                 ( N_type_control_m1 ), 
                                                  .N_type_control_m2                 ( N_type_control_m2 ), 
                                                  .N_type_control_m3                 ( N_type_control_m3 ),
                                                  .message_fast_N_1                  ( message_fast_1_N ), 
                                                  .message_fast_N_2                  ( message_fast_2_N ), 
                                                  .message_fast_N_3                  ( message_fast_3_N ), 
                                                  .length_fast_N_1                   ( message_fast_length_1_N ), 
                                                  .length_fast_N_2                   ( message_fast_length_2_N ), 
                                                  .length_fast_N_3                   ( message_fast_length_3_N )
                                                  );    
        
    stage3_fast_message_mux_module stage3_fast_message_mux_ ( 
                                                             .message_fast_a_1       ( message_fast_1_a ), 
                                                             .message_fast_a_2       ( message_fast_2_a ), 
                                                             .message_fast_a_3       ( message_fast_3_a ),
                                                             .message_fast_d_1       ( message_fast_1_d ), 
                                                             .message_fast_d_2       ( message_fast_2_d ), 
                                                             .message_fast_d_3       ( message_fast_3_d ),
                                                             .message_fast_k_1       ( message_fast_1_k ), 
                                                             .message_fast_k_2       ( message_fast_2_k ), 
                                                             .message_fast_k_3       ( message_fast_3_k ),
                                                             .message_fast_q_1       ( message_fast_1_q ), 
                                                             .message_fast_q_2       ( message_fast_2_q ), 
                                                             .message_fast_q_3       ( message_fast_3_q ),
                                                             .message_fast_N_1       ( message_fast_1_N ), 
                                                             .message_fast_N_2       ( message_fast_2_N ), 
                                                             .message_fast_N_3       ( message_fast_3_N ),
                                                             .length_fast_a_1        ( message_fast_length_1_a ), 
                                                             .length_fast_a_2        ( message_fast_length_2_a ), 
                                                             .length_fast_a_3        ( message_fast_length_3_a ),
                                                             .length_fast_d_1        ( message_fast_length_1_d ), 
                                                             .length_fast_d_2        ( message_fast_length_2_d ), 
                                                             .length_fast_d_3        ( message_fast_length_3_d ),
                                                             .length_fast_k_1        ( message_fast_length_1_k ), 
                                                             .length_fast_k_2        ( message_fast_length_2_k ), 
                                                             .length_fast_k_3        ( message_fast_length_3_k ),
                                                             .length_fast_q_1        ( message_fast_length_1_q ), 
                                                             .length_fast_q_2        ( message_fast_length_2_q ), 
                                                             .length_fast_q_3        ( message_fast_length_3_q ),
                                                             .length_fast_N_1        ( message_fast_length_1_N ), 
                                                             .length_fast_N_2        ( message_fast_length_2_N ), 
                                                             .length_fast_N_3        ( message_fast_length_3_N ),
                                                             .message_mux_control_m1 ( message_mux_control_m1 ), 
                                                             .message_mux_control_m2 ( message_mux_control_m2 ), 
                                                             .message_mux_control_m3 ( message_mux_control_m3 ),
                                                             .message_fast_1         ( message_fast_1 ), 
                                                             .message_fast_2         ( message_fast_2 ), 
                                                             .message_fast_3         ( message_fast_3 ), 
                                                             .length_fast_1          ( message_fast_length_1 ), 
                                                             .length_fast_2          ( message_fast_length_2 ), 
                                                             .length_fast_3          ( message_fast_length_3 ) 
                                                             );
                                                             
    stage3_packet_messages_module stage3_packet_messages ( 
                                                          .message_number_data       ( message_number_data ), 
                                                          .packet_messages_data      ( packet_messages_data )
                                                          );    
    
    stage3_packet_seq_num_module stage3_packet_seq_num ( 
                                                        .rst_n                       ( rst_n ), 
                                                        .clk                         ( clk ), 
                                                        .message_en                  ( message_en ), 
                                                        .packet_seq_num_data         ( packet_seq_num_data ) 
                                                        );
    
    stage3_field_reg_module stage3_field_reg ( 
                                              .rst_n                                 ( rst_n ), 
                                              .clk                                   ( clk ), 
                                              .BT8_in                                ( field_BT8_next ), 
                                              .PID1_in                               ( field_PID1_next ), 
                                              .MC1_in                                ( field_MC1_next ), 
                                              .MT1_in                                ( field_MT1_next ), 
                                              .SS5_in                                ( field_SS5_next ), 
                                              .EB3_in                                ( field_EB3_next ), 
                                              .SPDC1_in                              ( field_SPDC1_next ), 
                                              .SP4_in                                ( field_SP4_next ), 
                                              .V4_in                                 ( field_V4_next ), 
                                              .PPDC1_in                              ( field_PPDC1_next ), 
                                              .PP4_in                                ( field_PP4_next ), 
                                              .TI4_in                                ( field_TI4_next ), 
                                              .OIV4_in                               ( field_OIV4_next ), 
                                              .BP4_in                                ( field_BP4_next ), 
                                              .BS4_in                                ( field_BS4_next ), 
                                              .OP4_in                                ( field_OP4_next ), 
                                              .OS4_in                                ( field_OS4_next ), 
                                              .SS4_in                                ( field_SS4_next ), 
                                              .SP2_in                                ( field_SP2_next ), 
                                              .BP2_in                                ( field_BP2_next ), 
                                              .BS2_in                                ( field_BS2_next ), 
                                              .OP2_in                                ( field_OP2_next ), 
                                              .OS2_in                                ( field_OS2_next ), 
                                              .BSN4_in                               ( field_BSN4_next ), 
                                              .EBSN4_in                              ( field_EBSN4_next ), 
                                              .RBSN4_in                              ( field_RBSN4_next ), 
                                              .MC8_in                                ( field_MC8_next ), 
                                              .BT8_out                               ( field_BT8 ), 
                                              .PID1_out                              ( field_PID1 ), 
                                              .MC1_out                               ( field_MC1 ), 
                                              .MT1_out                               ( field_MT1 ), 
                                              .SS5_out                               ( field_SS5 ), 
                                              .EB3_out                               ( field_EB3 ), 
                                              .SPDC1_out                             ( field_SPDC1 ), 
                                              .SP4_out                               ( field_SP4 ), 
                                              .V4_out                                ( field_V4 ), 
                                              .PPDC1_out                             ( field_PPDC1 ), 
                                              .PP4_out                               ( field_PP4 ), 
                                              .TI4_out                               ( field_TI4 ),
                                              .OIV4_out                              ( field_OIV4 ), 
                                              .BP4_out                               ( field_BP4 ), 
                                              .BS4_out                               ( field_BS4 ), 
                                              .OP4_out                               ( field_OP4 ), 
                                              .OS4_out                               ( field_OS4 ), 
                                              .SS4_out                               ( field_SS4 ), 
                                              .SP2_out                               ( field_SP2 ), 
                                              .BP2_out                               ( field_BP2 ), 
                                              .BS2_out                               ( field_BS2 ), 
                                              .OP2_out                               ( field_OP2 ), 
                                              .OS2_out                               ( field_OS2 ), 
                                              .BSN4_out                              ( field_BSN4 ), 
                                              .EBSN4_out                             ( field_EBSN4 ), 
                                              .RBSN4_out                             ( field_RBSN4 ), 
                                              .MC8_out                               ( field_MC8 )
                                              );
    
    stage3_field_in_mux_module stage3_field_in_mux (    
                                                    .message_en                      ( message_en ), 
                                                    .block_time_message              ( block_time_message ), 
                                                    .message_mux_control_m1          ( message_mux_control_m1 ), 
                                                    .message_mux_control_m2          ( message_mux_control_m2 ), 
                                                    .message_mux_control_m3          ( message_mux_control_m3 ),
                                                    .N_type_control_m1               ( N_type_control_m1 ), 
                                                    .N_type_control_m2               ( N_type_control_m2 ), 
                                                    .N_type_control_m3               ( N_type_control_m3 ),
                                                    .message_1                       ( message_1 ), 
                                                    .message_2                       ( message_2 ), 
                                                    .message_3                       ( message_3 ), 
                                                    .BT8_out                         ( field_BT8 ), 
                                                    .PID1_out                        ( field_PID1 ), 
                                                    .MC1_out                         ( field_MC1 ), 
                                                    .MT1_out                         ( field_MT1 ), 
                                                    .SS5_out                         ( field_SS5 ), 
                                                    .EB3_out                         ( field_EB3 ), 
                                                    .SPDC1_out                       ( field_SPDC1 ), 
                                                    .SP4_out                         ( field_SP4 ), 
                                                    .V4_out                          ( field_V4 ), 
                                                    .PPDC1_out                       ( field_PPDC1 ), 
                                                    .PP4_out                         ( field_PP4 ), 
                                                    .TI4_out                         ( field_TI4 ),
                                                    .OIV4_out                        ( field_OIV4 ), 
                                                    .BP4_out                         ( field_BP4 ), 
                                                    .BS4_out                         ( field_BS4 ), 
                                                    .OP4_out                         ( field_OP4 ), 
                                                    .OS4_out                         ( field_OS4 ), 
                                                    .SS4_out                         ( field_SS4 ), 
                                                    .SP2_out                         ( field_SP2 ), 
                                                    .BP2_out                         ( field_BP2 ), 
                                                    .BS2_out                         ( field_BS2 ), 
                                                    .OP2_out                         ( field_OP2 ), 
                                                    .OS2_out                         ( field_OS2 ), 
                                                    .BSN4_out                        ( field_BSN4 ), 
                                                    .EBSN4_out                       ( field_EBSN4 ), 
                                                    .RBSN4_out                       ( field_RBSN4 ), 
                                                    .MC8_out                         ( field_MC8 ) ,
                                                    .BT8_in                          ( field_BT8_next ), 
                                                    .PID1_in                         ( field_PID1_next ), 
                                                    .MC1_in                          ( field_MC1_next ), 
                                                    .MT1_in                          ( field_MT1_next ), 
                                                    .SS5_in                          ( field_SS5_next ), 
                                                    .EB3_in                          ( field_EB3_next ), 
                                                    .SPDC1_in                        ( field_SPDC1_next ), 
                                                    .SP4_in                          ( field_SP4_next ), 
                                                    .V4_in                           ( field_V4_next ), 
                                                    .PPDC1_in                        ( field_PPDC1_next ), 
                                                    .PP4_in                          ( field_PP4_next ), 
                                                    .TI4_in                          ( field_TI4_next ), 
                                                    .OIV4_in                         ( field_OIV4_next ), 
                                                    .BP4_in                          ( field_BP4_next ), 
                                                    .BS4_in                          ( field_BS4_next ), 
                                                    .OP4_in                          ( field_OP4_next ), 
                                                    .OS4_in                          ( field_OS4_next ), 
                                                    .SS4_in                          ( field_SS4_next ), 
                                                    .SP2_in                          ( field_SP2_next ), 
                                                    .BP2_in                          ( field_BP2_next ), 
                                                    .BS2_in                          ( field_BS2_next ), 
                                                    .OP2_in                          ( field_OP2_next ), 
                                                    .OS2_in                          ( field_OS2_next ), 
                                                    .BSN4_in                         ( field_BSN4_next ), 
                                                    .EBSN4_in                        ( field_EBSN4_next ), 
                                                    .RBSN4_in                        ( field_RBSN4_next ), 
                                                    .MC8_in                          ( field_MC8_next ) 
                                                    );
    
    stage3_packet_head_module stage3_packet_head ( 
                                                  .packet_seq_num_data               ( packet_seq_num_data ), 
                                                  .packet_messages_data              ( packet_messages_data ), 
                                                  .packet_head_data                  ( packet_head_data )
                                                  );
    
    stage3_packet_ETX_module stage3_packet_ETX ( 
                                                .packet_ETX_data                     ( packet_ETX_data )
                                                );
    
    stage3_reg_module stage3_reg ( 
                                  .clk                                               ( clk ), 
                                  .rst_n                                             ( rst_n ), 
                                  .message_en_in                                     ( message_en ), 
                                  .packet_head_data_in                               ( packet_head_data ), 
                                  .length_fast_1_in                                  ( message_fast_length_1 ), 
                                  .length_fast_2_in                                  ( message_fast_length_2 ), 
                                  .length_fast_3_in                                  ( message_fast_length_3 ), 
                                  .message_fast_1_in                                 ( message_fast_1 ), 
                                  .message_fast_2_in                                 ( message_fast_2 ), 
                                  .message_fast_3_in                                 ( message_fast_3 ), 
                                  .packet_ETX_data_in                                ( packet_ETX_data ),  
                                  .message_en_out                                    ( message_en_out ), 
                                  .packet_head_data_out                              ( packet_head_data_out ),
                                  .length_fast_1_out                                 ( length_fast_1_out ), 
                                  .length_fast_2_out                                 ( length_fast_2_out ), 
                                  .length_fast_3_out                                 ( length_fast_3_out ), 
                                  .message_fast_1_out                                ( message_fast_1_out ), 
                                  .message_fast_2_out                                ( message_fast_2_out ), 
                                  .message_fast_3_out                                ( message_fast_3_out ), 
                                  .packet_ETX_data_out                               ( packet_ETX_data_out )
                                  );
    
endmodule
