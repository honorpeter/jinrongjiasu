`include "para_def.v"
module stage4_fast_decode_module ( 
                                   clk , rst_n , 
                                   message_fast_1 , message_fast_2 , message_fast_3 ,
                                   message_en , 
                                   message_en_out ,
                                   message_1_out , message_2_out , message_3_out  ,
                                   N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
                                   message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out  
                                   );

    input  clk , rst_n , 
           message_fast_1 , message_fast_2 , message_fast_3 ,
           message_en ;
    
    output message_en_out ,
           message_1_out , message_2_out , message_3_out  ,
           N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
           message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;

    wire                                           clk , rst_n ; 
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire                                           message_en ;
    
    wire                                           message_en_out ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_out , message_2_out , message_3_out ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    
    wire [ `field_BT8_bits - 1 : 0 ]               field_BT8 ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `field_SS5_bits - 1 : 0 ]               field_SS5 ;
    wire [ `field_EB3_bits - 1 : 0 ]               field_EB3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             field_SPDC1 ;
    wire [ `field_SP4_bits - 1 : 0 ]               field_SP4 ;
    wire [ `field_V4_bits - 1 : 0 ]                field_V4 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             field_PPDC1 ;
    wire [ `field_PP4_bits - 1 : 0 ]               field_PP4 ; 
    wire [ `field_TI4_bits - 1 : 0 ]               field_TI4 ;
    wire [ `field_OIV4_bits - 1 : 0 ]              field_OIV4 ;
    wire [ `field_BP4_bits - 1 : 0 ]               field_BP4 ; 
    wire [ `field_BS4_bits - 1 : 0 ]               field_BS4 ; 
    wire [ `field_OP4_bits - 1 : 0 ]               field_OP4 ; 
    wire [ `field_OS4_bits - 1 : 0 ]               field_OS4 ; 
    wire [ `field_SS4_bits - 1 : 0 ]               field_SS4 ;
    wire [ `field_SP2_bits - 1 : 0 ]               field_SP2 ;
    wire [ `field_BP2_bits - 1 : 0 ]               field_BP2 ;
    wire [ `field_BS2_bits - 1 : 0 ]               field_BS2 ;
    wire [ `field_OP2_bits - 1 : 0 ]               field_OP2 ;
    wire [ `field_OS2_bits - 1 : 0 ]               field_OS2 ;
    wire [ `field_BSN4_bits - 1 : 0 ]              field_BSN4 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             field_EBSN4 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             field_RBSN4 ;
    wire [ `field_MC8_bits - 1 : 0 ]               field_MC8 ;
    
    wire [ `field_BT8_bits - 1 : 0 ]               field_BT8_next ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1_next ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1_next ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1_next ;
    wire [ `field_SS5_bits - 1 : 0 ]               field_SS5_next ;
    wire [ `field_EB3_bits - 1 : 0 ]               field_EB3_next ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             field_SPDC1_next ;
    wire [ `field_SP4_bits - 1 : 0 ]               field_SP4_next ;
    wire [ `field_V4_bits - 1 : 0 ]                field_V4_next ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             field_PPDC1_next ;
    wire [ `field_PP4_bits - 1 : 0 ]               field_PP4_next ; 
    wire [ `field_TI4_bits - 1 : 0 ]               field_TI4_next ;
    wire [ `field_OIV4_bits - 1 : 0 ]              field_OIV4_next ;
    wire [ `field_BP4_bits - 1 : 0 ]               field_BP4_next ; 
    wire [ `field_BS4_bits - 1 : 0 ]               field_BS4_next ; 
    wire [ `field_OP4_bits - 1 : 0 ]               field_OP4_next ; 
    wire [ `field_OS4_bits - 1 : 0 ]               field_OS4_next ; 
    wire [ `field_SS4_bits - 1 : 0 ]               field_SS4_next ;
    wire [ `field_SP2_bits - 1 : 0 ]               field_SP2_next ;
    wire [ `field_BP2_bits - 1 : 0 ]               field_BP2_next ;
    wire [ `field_BS2_bits - 1 : 0 ]               field_BS2_next ;
    wire [ `field_OP2_bits - 1 : 0 ]               field_OP2_next ;
    wire [ `field_OS2_bits - 1 : 0 ]               field_OS2_next ;
    wire [ `field_BSN4_bits - 1 : 0 ]              field_BSN4_next ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             field_EBSN4_next ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             field_RBSN4_next ;
    wire [ `field_MC8_bits - 1 : 0 ]               field_MC8_next ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_a_1 , message_a_2 , message_a_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_d_1 , message_d_2 , message_d_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_k_1 , message_k_2 , message_k_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_q_1 , message_q_2 , message_q_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NL_1 , message_NL_2 , message_NL_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NM_1 , message_NM_2 , message_NM_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NN_1 , message_NN_2 , message_NN_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NR_1 , message_NR_2 , message_NR_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NS_1 , message_NS_2 , message_NS_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_N_1 , message_N_2 , message_N_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    
    stage4_defast_a_module stage4_defast_a ( 
                                            .message_fast_1                             ( message_fast_1 ), 
                                            .message_fast_2                             ( message_fast_2 ), 
                                            .message_fast_3                             ( message_fast_3 ),
                                            .field_PID1                                 ( field_PID1 ), 
                                            .field_MC1                                  ( field_MC1 ), 
                                            .field_MT1                                  ( field_MT1 ),
                                            .field_SS5                                  ( field_SS5 ), 
                                            .field_EB3                                  ( field_EB3 ), 
                                            .field_SPDC1                                ( field_SPDC1 ), 
                                            .field_SP4                                  ( field_SP4 ), 
                                            .field_V4                                   ( field_V4 ), 
                                            .field_PPDC1                                ( field_PPDC1 ), 
                                            .field_PP4                                  ( field_PP4 ), 
                                            .field_TI4                                  ( field_TI4 ),    
                                            .message_1                                  ( message_a_1 ), 
                                            .message_2                                  ( message_a_2 ), 
                                            .message_3                                  ( message_a_3 )
                                            );

    stage4_defast_d_module stage4_defast_d ( 
                                            .message_fast_1                             ( message_fast_1 ), 
                                            .message_fast_2                             ( message_fast_2 ), 
                                            .message_fast_3                             ( message_fast_3 ),
                                            .field_PID1                                 ( field_PID1 ), 
                                            .field_MC1                                  ( field_MC1 ), 
                                            .field_MT1                                  ( field_MT1 ),
                                            .field_SS5                                  ( field_SS5 ), 
                                            .field_EB3                                  ( field_EB3 ), 
                                            .field_SPDC1                                ( field_SPDC1 ), 
                                            .field_SP4                                  ( field_SP4 ), 
                                            .field_OIV4                                 ( field_OIV4 ),   
                                            .message_1                                  ( message_d_1 ), 
                                            .message_2                                  ( message_d_2 ), 
                                            .message_3                                  ( message_d_3 )
                                            );

    stage4_defast_k_module stage4_defast_k ( 
                                            .message_fast_1                             ( message_fast_1 ), 
                                            .message_fast_2                             ( message_fast_2 ), 
                                            .message_fast_3                             ( message_fast_3 ),
                                            .field_PID1                                 ( field_PID1 ), 
                                            .field_MC1                                  ( field_MC1 ), 
                                            .field_MT1                                  ( field_MT1 ),
                                            .field_SS5                                  ( field_SS5 ), 
                                            .field_EB3                                  ( field_EB3 ), 
                                            .field_SPDC1                                ( field_SPDC1 ), 
                                            .field_SP4                                  ( field_SP4 ), 
                                            .field_PPDC1                                ( field_PPDC1 ), 
                                            .field_BP4                                  ( field_BP4 ), 
                                            .field_BS4                                  ( field_BS4 ), 
                                            .field_OP4                                  ( field_OP4 ), 
                                            .field_OS4                                  ( field_OS4 ),     
                                            .message_1                                  ( message_k_1 ), 
                                            .message_2                                  ( message_k_2 ), 
                                            .message_3                                  ( message_k_3 )
                                            );

    stage4_defast_q_module stage4_defast_q ( 
                                            .message_fast_1                             ( message_fast_1 ), 
                                            .message_fast_2                             ( message_fast_2 ), 
                                            .message_fast_3                             ( message_fast_3 ),
                                            .field_PID1                                 ( field_PID1 ), 
                                            .field_MC1                                  ( field_MC1 ), 
                                            .field_MT1                                  ( field_MT1 ),
                                            .field_SS4                                  ( field_SS4 ), 
                                            .field_EB3                                  ( field_EB3 ), 
                                            .field_SP2                                  ( field_SP2 ), 
                                            .field_BP2                                  ( field_BP2 ), 
                                            .field_BS2                                  ( field_BS2 ), 
                                            .field_OP2                                  ( field_OP2 ), 
                                            .field_OS2                                  ( field_OS2 ),   
                                            .message_1                                  ( message_q_1 ), 
                                            .message_2                                  ( message_q_2 ), 
                                            .message_3                                  ( message_q_3 )
                                            );

    stage4_defast_NL_module stage4_defast_NL ( 
                                              .message_fast_1                           ( message_fast_1 ), 
                                              .message_fast_2                           ( message_fast_2 ), 
                                              .message_fast_3                           ( message_fast_3 ),
                                              .field_PID1                               ( field_PID1 ), 
                                              .field_MC1                                ( field_MC1 ), 
                                              .field_MT1                                ( field_MT1 ),  
                                              .message_1                                ( message_NL_1 ), 
                                              .message_2                                ( message_NL_2 ), 
                                              .message_3                                ( message_NL_3 )
                                              );

    stage4_defast_NM_module stage4_defast_NM(  
                                              .message_fast_1                           ( message_fast_1 ), 
                                              .message_fast_2                           ( message_fast_2 ), 
                                              .message_fast_3                           ( message_fast_3 ),
                                              .field_PID1                               ( field_PID1 ), 
                                              .field_MC1                                ( field_MC1 ), 
                                              .field_MT1                                ( field_MT1 ), 
                                              .field_BSN4                               ( field_BSN4 ),  
                                              .message_1                                ( message_NM_1 ), 
                                              .message_2                                ( message_NM_2 ), 
                                              .message_3                                ( message_NM_3 )
                                              );

    stage4_defast_NN_module stage4_defast_NN (  
                                              .message_fast_1                           ( message_fast_1 ), 
                                              .message_fast_2                           ( message_fast_2 ), 
                                              .message_fast_3                           ( message_fast_3 ),
                                              .field_PID1                               ( field_PID1 ), 
                                              .field_MC1                                ( field_MC1 ), 
                                              .field_MT1                                ( field_MT1 ),
                                              .field_EBSN4                              ( field_EBSN4 ), 
                                              .field_RBSN4                              ( field_RBSN4 ),  
                                              .message_1                                ( message_NN_1 ), 
                                              .message_2                                ( message_NN_2 ), 
                                              .message_3                                ( message_NN_3 ) 
                                              );
    
    stage4_defast_NR_module stage4_defast_NR ( 
                                              .message_fast_1                           ( message_fast_1 ), 
                                              .message_fast_2                           ( message_fast_2 ), 
                                              .message_fast_3                           ( message_fast_3 ),
                                              .field_PID1                               ( field_PID1 ), 
                                              .field_MC1                                ( field_MC1 ), 
                                              .field_MT1                                ( field_MT1 ),  
                                              .message_1                                ( message_NR_1 ), 
                                              .message_2                                ( message_NR_2 ), 
                                              .message_3                                ( message_NR_3 )
                                              );

    stage4_defast_NS_module stage4_defast_NS(  
                                              .message_fast_1                           ( message_fast_1 ), 
                                              .message_fast_2                           ( message_fast_2 ), 
                                              .message_fast_3                           ( message_fast_3 ),
                                              .field_PID1                               ( field_PID1 ), 
                                              .field_MC1                                ( field_MC1 ), 
                                              .field_MT1                                ( field_MT1 ), 
                                              .field_MC8                                ( field_MC8 ),  
                                              .message_1                                ( message_NS_1 ), 
                                              .message_2                                ( message_NS_2 ), 
                                              .message_3                                ( message_NS_3 )
                                              );

    stage4_defast_N_type_module stage4_defast_N_type ( 
                                                      .message_NL_1                     ( message_NL_1 ), 
                                                      .message_NL_2                     ( message_NL_2 ), 
                                                      .message_NL_3                     ( message_NL_3 ),
                                                      .message_NM_1                     ( message_NM_1 ), 
                                                      .message_NM_2                     ( message_NM_2 ), 
                                                      .message_NM_3                     ( message_NM_3 ),
                                                      .message_NN_1                     ( message_NN_1 ), 
                                                      .message_NN_2                     ( message_NN_2 ), 
                                                      .message_NN_3                     ( message_NN_3 ),
                                                      .message_NR_1                     ( message_NR_1 ), 
                                                      .message_NR_2                     ( message_NR_2 ), 
                                                      .message_NR_3                     ( message_NR_3 ),
                                                      .message_NS_1                     ( message_NS_1 ), 
                                                      .message_NS_2                     ( message_NS_2 ), 
                                                      .message_NS_3                     ( message_NS_3 ),
                                                      .N_type_control_m1                ( N_type_control_m1 ), 
                                                      .N_type_control_m2                ( N_type_control_m2 ), 
                                                      .N_type_control_m3                ( N_type_control_m3 ),
                                                      .message_N_1                      ( message_N_1 ), 
                                                      .message_N_2                      ( message_N_2 ), 
                                                      .message_N_3                      ( message_N_3 ) 
                                                      );

    stage4_defast_message_mux_module stage4_defast_message_mux ( 
                                                                .message_a_1            ( message_a_1 ), 
                                                                .message_a_2            ( message_a_2 ), 
                                                                .message_a_3            ( message_a_3 ),
                                                                .message_d_1            ( message_d_1 ), 
                                                                .message_d_2            ( message_d_2 ), 
                                                                .message_d_3            ( message_d_3 ),
                                                                .message_k_1            ( message_k_1 ), 
                                                                .message_k_2            ( message_k_2 ), 
                                                                .message_k_3            ( message_k_3 ),
                                                                .message_q_1            ( message_q_1 ), 
                                                                .message_q_2            ( message_q_2 ), 
                                                                .message_q_3            ( message_q_3 ),
                                                                .message_N_1            ( message_N_1 ), 
                                                                .message_N_2            ( message_N_2 ), 
                                                                .message_N_3            ( message_N_3 ),
                                                                .message_mux_control_m1 ( message_mux_control_m1 ), 
                                                                .message_mux_control_m2 ( message_mux_control_m2 ), 
                                                                .message_mux_control_m3 ( message_mux_control_m3 ),
                                                                .message_1              ( message_1 ), 
                                                                .message_2              ( message_2 ), 
                                                                .message_3              ( message_3 )
                                                               );

    stage_4_defast_control_module stage_4_defast_control (
                                                          .message_fast_1               ( message_fast_1 ), 
                                                          .message_fast_2               ( message_fast_2 ), 
                                                          .message_fast_3               ( message_fast_3 ),
                                                          .field_MC1                    ( field_MC1 ), 
                                                          .field_MT1                    ( field_MT1 ), 
                                                          .message_mux_control_m1       ( message_mux_control_m1 ), 
                                                          .message_mux_control_m2       ( message_mux_control_m2 ), 
                                                          .message_mux_control_m3       ( message_mux_control_m3 ), 
                                                          .N_type_control_m1            ( N_type_control_m1 ), 
                                                          .N_type_control_m2            ( N_type_control_m2 ), 
                                                          .N_type_control_m3            ( N_type_control_m3 )
                                                          );

    stage4_defast_field_reg_module stage4_defast_field_reg ( 
                                                            .rst_n                      ( rst_n ), 
                                                            .clk                        ( clk ), 
                                                            .PID1_in                    ( field_PID1_next ), 
                                                            .MC1_in                     ( field_MC1_next ), 
                                                            .MT1_in                     ( field_MT1_next ), 
                                                            .SS5_in                     ( field_SS5_next ), 
                                                            .EB3_in                     ( field_EB3_next ), 
                                                            .SPDC1_in                   ( field_SPDC1_next ), 
                                                            .SP4_in                     ( field_SP4_next ), 
                                                            .V4_in                      ( field_V4_next ), 
                                                            .PPDC1_in                   ( field_PPDC1_next ), 
                                                            .PP4_in                     ( field_PP4_next ), 
                                                            .TI4_in                     ( field_TI4_next ), 
                                                            .OIV4_in                    ( field_OIV4_next ), 
                                                            .BP4_in                     ( field_BP4_next ), 
                                                            .BS4_in                     ( field_BS4_next ), 
                                                            .OP4_in                     ( field_OP4_next ), 
                                                            .OS4_in                     ( field_OS4_next ), 
                                                            .SS4_in                     ( field_SS4_next ), 
                                                            .SP2_in                     ( field_SP2_next ), 
                                                            .BP2_in                     ( field_BP2_next ), 
                                                            .BS2_in                     ( field_BS2_next ), 
                                                            .OP2_in                     ( field_OP2_next ), 
                                                            .OS2_in                     ( field_OS2_next ), 
                                                            .BSN4_in                    ( field_BSN4_next ), 
                                                            .EBSN4_in                   ( field_EBSN4_next ), 
                                                            .RBSN4_in                   ( field_RBSN4_next ), 
                                                            .MC8_in                     ( field_MC8_next ), 
                                                            .PID1_out                   ( field_PID1 ), 
                                                            .MC1_out                    ( field_MC1 ), 
                                                            .MT1_out                    ( field_MT1 ), 
                                                            .SS5_out                    ( field_SS5 ), 
                                                            .EB3_out                    ( field_EB3 ), 
                                                            .SPDC1_out                  ( field_SPDC1 ), 
                                                            .SP4_out                    ( field_SP4 ), 
                                                            .V4_out                     ( field_V4 ), 
                                                            .PPDC1_out                  ( field_PPDC1 ), 
                                                            .PP4_out                    ( field_PP4 ), 
                                                            .TI4_out                    ( field_TI4 ),
                                                            .OIV4_out                   ( field_OIV4 ), 
                                                            .BP4_out                    ( field_BP4 ), 
                                                            .BS4_out                    ( field_BS4 ), 
                                                            .OP4_out                    ( field_OP4 ), 
                                                            .OS4_out                    ( field_OS4 ), 
                                                            .SS4_out                    ( field_SS4 ), 
                                                            .SP2_out                    ( field_SP2 ), 
                                                            .BP2_out                    ( field_BP2 ), 
                                                            .BS2_out                    ( field_BS2 ), 
                                                            .OP2_out                    ( field_OP2 ), 
                                                            .OS2_out                    ( field_OS2 ), 
                                                            .BSN4_out                   ( field_BSN4 ), 
                                                            .EBSN4_out                  ( field_EBSN4 ), 
                                                            .RBSN4_out                  ( field_RBSN4 ), 
                                                            .MC8_out                    ( field_MC8 )
                                                            );

    stage4_defast_field_mux_module stage4_defast_field_mux (    
                                                            .message_en                 ( message_en ), 
                                                            .message_mux_control_m1     ( message_mux_control_m1 ), 
                                                            .message_mux_control_m2     ( message_mux_control_m2 ), 
                                                            .message_mux_control_m3     ( message_mux_control_m3 ),
                                                            .N_type_control_m1          ( N_type_control_m1 ), 
                                                            .N_type_control_m2          ( N_type_control_m2 ), 
                                                            .N_type_control_m3          ( N_type_control_m3 ),
                                                            .message_1                  ( message_1 ), 
                                                            .message_2                  ( message_2 ), 
                                                            .message_3                  ( message_3 ), 
                                                            .PID1_out                   ( field_PID1 ), 
                                                            .MC1_out                    ( field_MC1 ), 
                                                            .MT1_out                    ( field_MT1 ), 
                                                            .SS5_out                    ( field_SS5 ), 
                                                            .EB3_out                    ( field_EB3 ), 
                                                            .SPDC1_out                  ( field_SPDC1 ), 
                                                            .SP4_out                    ( field_SP4 ), 
                                                            .V4_out                     ( field_V4 ), 
                                                            .PPDC1_out                  ( field_PPDC1 ), 
                                                            .PP4_out                    ( field_PP4 ), 
                                                            .TI4_out                    ( field_TI4 ),
                                                            .OIV4_out                   ( field_OIV4 ), 
                                                            .BP4_out                    ( field_BP4 ), 
                                                            .BS4_out                    ( field_BS4 ), 
                                                            .OP4_out                    ( field_OP4 ), 
                                                            .OS4_out                    ( field_OS4 ), 
                                                            .SS4_out                    ( field_SS4 ), 
                                                            .SP2_out                    ( field_SP2 ), 
                                                            .BP2_out                    ( field_BP2 ), 
                                                            .BS2_out                    ( field_BS2 ), 
                                                            .OP2_out                    ( field_OP2 ), 
                                                            .OS2_out                    ( field_OS2 ), 
                                                            .BSN4_out                   ( field_BSN4 ), 
                                                            .EBSN4_out                  ( field_EBSN4 ), 
                                                            .RBSN4_out                  ( field_RBSN4 ), 
                                                            .MC8_out                    ( field_MC8 ) ,
                                                            .PID1_in                    ( field_PID1_next ), 
                                                            .MC1_in                     ( field_MC1_next ), 
                                                            .MT1_in                     ( field_MT1_next ), 
                                                            .SS5_in                     ( field_SS5_next ), 
                                                            .EB3_in                     ( field_EB3_next ), 
                                                            .SPDC1_in                   ( field_SPDC1_next ), 
                                                            .SP4_in                     ( field_SP4_next ), 
                                                            .V4_in                      ( field_V4_next ), 
                                                            .PPDC1_in                   ( field_PPDC1_next ), 
                                                            .PP4_in                     ( field_PP4_next ), 
                                                            .TI4_in                     ( field_TI4_next ), 
                                                            .OIV4_in                    ( field_OIV4_next ), 
                                                            .BP4_in                     ( field_BP4_next ), 
                                                            .BS4_in                     ( field_BS4_next ), 
                                                            .OP4_in                     ( field_OP4_next ), 
                                                            .OS4_in                     ( field_OS4_next ), 
                                                            .SS4_in                     ( field_SS4_next ), 
                                                            .SP2_in                     ( field_SP2_next ), 
                                                            .BP2_in                     ( field_BP2_next ), 
                                                            .BS2_in                     ( field_BS2_next ), 
                                                            .OP2_in                     ( field_OP2_next ), 
                                                            .OS2_in                     ( field_OS2_next ), 
                                                            .BSN4_in                    ( field_BSN4_next ), 
                                                            .EBSN4_in                   ( field_EBSN4_next ), 
                                                            .RBSN4_in                   ( field_RBSN4_next ), 
                                                            .MC8_in                     ( field_MC8_next ) 
                                                            );

    stage4_reg_module stage4_reg ( 
                                  .clk                                                  ( clk ), 
                                  .rst_n                                                ( rst_n ), 
                                  .message_en_in                                        ( message_en ),
                                  .message_1_in                                         ( message_1 ), 
                                  .message_2_in                                         ( message_2 ), 
                                  .message_3_in                                         ( message_3 ),
                                  .N_type_control_m1_in                                 ( N_type_control_m1 ), 
                                  .N_type_control_m2_in                                 ( N_type_control_m2 ), 
                                  .N_type_control_m3_in                                 ( N_type_control_m3 ),
                                  .message_mux_control_m1_in                            ( message_mux_control_m1 ), 
                                  .message_mux_control_m2_in                            ( message_mux_control_m2 ), 
                                  .message_mux_control_m3_in                            ( message_mux_control_m3 ),
                                  .message_en_out                                       ( message_en_out ),
                                  .message_1_out                                        ( message_1_out ), 
                                  .message_2_out                                        ( message_2_out ), 
                                  .message_3_out                                        ( message_3_out ),
                                  .N_type_control_m1_out                                ( N_type_control_m1_out ), 
                                  .N_type_control_m2_out                                ( N_type_control_m2_out ), 
                                  .N_type_control_m3_out                                ( N_type_control_m3_out ), 
                                  .message_mux_control_m1_out                           ( message_mux_control_m1_out ), 
                                  .message_mux_control_m2_out                           ( message_mux_control_m2_out ), 
                                  .message_mux_control_m3_out                           ( message_mux_control_m3_out ) 
                                  );
endmodule
