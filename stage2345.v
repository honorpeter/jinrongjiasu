`include "para_def.v"
module stage2345_module ( 
                          clk , rst_n , 
                          original_data_1 , original_data_2 , original_data_3 , 
                          message_en_in ,
                          message_en_out , 
                          PID1_1_out , MC1_1_out , MT1_1_out , 
                          SS5_1_out , EB3_1_out , SPDC1_1_out , SP4_1_out , V4_1_out , PPDC1_1_out , PP4_1_out , TI4_1_out ,
                          OIV4_1_out , 
                          BP4_1_out , BS4_1_out , OP4_1_out , OS4_1_out , 
                          SS4_1_out , SP2_1_out , BP2_1_out , BS2_1_out , OP2_1_out , OS2_1_out , 
                          BSN4_1_out , EBSN4_1_out , RBSN4_1_out , MC8_1_out , 
                          PID1_2_out , MC1_2_out , MT1_2_out , 
                          SS5_2_out , EB3_2_out , SPDC1_2_out , SP4_2_out , V4_2_out , PPDC1_2_out , PP4_2_out , TI4_2_out ,
                          OIV4_2_out , 
                          BP4_2_out , BS4_2_out , OP4_2_out , OS4_2_out , 
                          SS4_2_out , SP2_2_out , BP2_2_out , BS2_2_out , OP2_2_out , OS2_2_out , 
                          BSN4_2_out , EBSN4_2_out , RBSN4_2_out , MC8_2_out , 
                          PID1_3_out , MC1_3_out , MT1_3_out , 
                          SS5_3_out , EB3_3_out , SPDC1_3_out , SP4_3_out , V4_3_out , PPDC1_3_out , PP4_3_out , TI4_3_out ,
                          OIV4_3_out , 
                          BP4_3_out , BS4_3_out , OP4_3_out , OS4_3_out , 
                          SS4_3_out , SP2_3_out , BP2_3_out , BS2_3_out , OP2_3_out , OS2_3_out , 
                          BSN4_3_out , EBSN4_3_out , RBSN4_3_out , MC8_3_out 
                          );

    input  clk , rst_n , 
           original_data_1 , original_data_2 , original_data_3 , 
           message_en_in ;
    output message_en_out , 
           PID1_1_out , MC1_1_out , MT1_1_out , 
           SS5_1_out , EB3_1_out , SPDC1_1_out , SP4_1_out , V4_1_out , PPDC1_1_out , PP4_1_out , TI4_1_out ,
           OIV4_1_out , 
           BP4_1_out , BS4_1_out , OP4_1_out , OS4_1_out , 
           SS4_1_out , SP2_1_out , BP2_1_out , BS2_1_out , OP2_1_out , OS2_1_out , 
           BSN4_1_out , EBSN4_1_out , RBSN4_1_out , MC8_1_out , 
           PID1_2_out , MC1_2_out , MT1_2_out , 
           SS5_2_out , EB3_2_out , SPDC1_2_out , SP4_2_out , V4_2_out , PPDC1_2_out , PP4_2_out , TI4_2_out ,
           OIV4_2_out , 
           BP4_2_out , BS4_2_out , OP4_2_out , OS4_2_out , 
           SS4_2_out , SP2_2_out , BP2_2_out , BS2_2_out , OP2_2_out , OS2_2_out , 
           BSN4_2_out , EBSN4_2_out , RBSN4_2_out , MC8_2_out , 
           PID1_3_out , MC1_3_out , MT1_3_out , 
           SS5_3_out , EB3_3_out , SPDC1_3_out , SP4_3_out , V4_3_out , PPDC1_3_out , PP4_3_out , TI4_3_out ,
           OIV4_3_out , 
           BP4_3_out , BS4_3_out , OP4_3_out , OS4_3_out , 
           SS4_3_out , SP2_3_out , BP2_3_out , BS2_3_out , OP2_3_out , OS2_3_out , 
           BSN4_3_out , EBSN4_3_out , RBSN4_3_out , MC8_3_out ;

    wire                                           clk , rst_n ;
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ]       original_data_1 , original_data_2 , original_data_3 ;
    wire                                           message_en_in ;
    
    wire [ `field_PID1_bits - 1 : 0 ]              PID1_1_out ;
    wire [ `field_MC1_bits - 1 : 0 ]               MC1_1_out ;
    wire [ `field_MT1_bits - 1 : 0 ]               MT1_1_out ;
    wire [ `field_SS5_bits - 1 : 0 ]               SS5_1_out ;
    wire [ `field_EB3_bits - 1 : 0 ]               EB3_1_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             SPDC1_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP4_1_out ;
    wire [ `field_V4_bits - 1 : 0 ]                V4_1_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             PPDC1_1_out ;
    wire [ `field_PP4_bits - 1 : 0 ]               PP4_1_out ;
    wire [ `field_TI4_bits - 1 : 0 ]               TI4_1_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]              OIV4_1_out ;
    wire [ `field_BP4_bits - 1 : 0 ]               BP4_1_out ;
    wire [ `field_BS4_bits - 1 : 0 ]               BS4_1_out ;
    wire [ `field_OP4_bits - 1 : 0 ]               OP4_1_out ;
    wire [ `field_OS4_bits - 1 : 0 ]               OS4_1_out ;
    wire [ `field_SS4_bits - 1 : 0 ]               SS4_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP2_1_out ;
    wire [ `field_BP2_bits - 1 : 0 ]               BP2_1_out ;
    wire [ `field_BS2_bits - 1 : 0 ]               BS2_1_out ;
    wire [ `field_OP2_bits - 1 : 0 ]               OP2_1_out ;
    wire [ `field_OS2_bits - 1 : 0 ]               OS2_1_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]              BSN4_1_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             EBSN4_1_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             RBSN4_1_out ;
    wire [ `field_MC8_bits - 1 : 0 ]               MC8_1_out ;
    wire [ `field_PID1_bits - 1 : 0 ]              PID1_2_out ;
    wire [ `field_MC1_bits - 1 : 0 ]               MC1_2_out ;
    wire [ `field_MT1_bits - 1 : 0 ]               MT1_2_out ;
    wire [ `field_SS5_bits - 1 : 0 ]               SS5_2_out ;
    wire [ `field_EB3_bits - 1 : 0 ]               EB3_2_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             SPDC1_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP4_2_out ;
    wire [ `field_V4_bits - 1 : 0 ]                V4_2_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             PPDC1_2_out ;
    wire [ `field_PP4_bits - 1 : 0 ]               PP4_2_out ;
    wire [ `field_TI4_bits - 1 : 0 ]               TI4_2_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]              OIV4_2_out ;
    wire [ `field_BP4_bits - 1 : 0 ]               BP4_2_out ;
    wire [ `field_BS4_bits - 1 : 0 ]               BS4_2_out ;
    wire [ `field_OP4_bits - 1 : 0 ]               OP4_2_out ;
    wire [ `field_OS4_bits - 1 : 0 ]               OS4_2_out ;
    wire [ `field_SS4_bits - 1 : 0 ]               SS4_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP2_2_out ;
    wire [ `field_BP2_bits - 1 : 0 ]               BP2_2_out ;
    wire [ `field_BS2_bits - 1 : 0 ]               BS2_2_out ;
    wire [ `field_OP2_bits - 1 : 0 ]               OP2_2_out ;
    wire [ `field_OS2_bits - 1 : 0 ]               OS2_2_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]              BSN4_2_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             EBSN4_2_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             RBSN4_2_out ;
    wire [ `field_MC8_bits - 1 : 0 ]               MC8_2_out ;
    wire [ `field_PID1_bits - 1 : 0 ]              PID1_3_out ;
    wire [ `field_MC1_bits - 1 : 0 ]               MC1_3_out ;
    wire [ `field_MT1_bits - 1 : 0 ]               MT1_3_out ;
    wire [ `field_SS5_bits - 1 : 0 ]               SS5_3_out ;
    wire [ `field_EB3_bits - 1 : 0 ]               EB3_3_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             SPDC1_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP4_3_out ;
    wire [ `field_V4_bits - 1 : 0 ]                V4_3_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             PPDC1_3_out ;
    wire [ `field_PP4_bits - 1 : 0 ]               PP4_3_out ;
    wire [ `field_TI4_bits - 1 : 0 ]               TI4_3_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]              OIV4_3_out ;
    wire [ `field_BP4_bits - 1 : 0 ]               BP4_3_out ;
    wire [ `field_BS4_bits - 1 : 0 ]               BS4_3_out ;
    wire [ `field_OP4_bits - 1 : 0 ]               OP4_3_out ;
    wire [ `field_OS4_bits - 1 : 0 ]               OS4_3_out ;
    wire [ `field_SS4_bits - 1 : 0 ]               SS4_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP2_3_out ;
    wire [ `field_BP2_bits - 1 : 0 ]               BP2_3_out ;
    wire [ `field_BS2_bits - 1 : 0 ]               BS2_3_out ;
    wire [ `field_OP2_bits - 1 : 0 ]               OP2_3_out ;
    wire [ `field_OS2_bits - 1 : 0 ]               OS2_3_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]              BSN4_3_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             EBSN4_3_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             RBSN4_3_out ;
    wire [ `field_MC8_bits - 1 : 0 ]               MC8_3_out ;
    
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
    
    wire                                           message_en_45 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_45 , message_2_45 , message_3_45 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_45 , N_type_control_m2_45 , N_type_control_m3_45 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_45 , message_mux_control_m2_45 , message_mux_control_m3_45 ;
    
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
    
    assign block_time_message_23 = block_data_23 [ `opra_block_time_message_b : `opra_block_time_message_e ];

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
                                                  .message_en_out (message_en_45),
                                                  .message_1_out (message_1_45), 
                                                  .message_2_out (message_2_45), 
                                                  .message_3_out (message_3_45),
                                                  .N_type_control_m1_out (N_type_control_m1_45), 
                                                  .N_type_control_m2_out (N_type_control_m2_45), 
                                                  .N_type_control_m3_out (N_type_control_m3_45), 
                                                  .message_mux_control_m1_out (message_mux_control_m1_45), 
                                                  .message_mux_control_m2_out (message_mux_control_m2_45), 
                                                  .message_mux_control_m3_out (message_mux_control_m3_45) 
                                                  );

    stage5_opra_decode_module stage5_opra_decode (
                                                  .clk (clk), 
                                                  .rst_n (rst_n),
                                                  .message_en (message_en_45),
                                                  .message_1 (message_1_45), 
                                                  .message_2 (message_2_45), 
                                                  .message_3 (message_3_45),
                                                  .N_type_control_m1 (N_type_control_m1_45), 
                                                  .N_type_control_m2 (N_type_control_m2_45), 
                                                  .N_type_control_m3 (N_type_control_m3_45), 
                                                  .message_mux_control_m1 (message_mux_control_m1_45), 
                                                  .message_mux_control_m2 (message_mux_control_m2_45), 
                                                  .message_mux_control_m3 (message_mux_control_m3_45), 
                                   
                                                  .message_en_out        ( message_en_out ) , 
                                                  .PID1_1_out            ( PID1_1_out ), 
                                                  .MC1_1_out             ( MC1_1_out ), 
                                                  .MT1_1_out             ( MT1_1_out ), 
                                                  .SS5_1_out             ( SS5_1_out ), 
                                                  .EB3_1_out             ( EB3_1_out ), 
                                                  .SPDC1_1_out           ( SPDC1_1_out ), 
                                                  .SP4_1_out             ( SP4_1_out ), 
                                                  .V4_1_out              ( V4_1_out ), 
                                                  .PPDC1_1_out           ( PPDC1_1_out ), 
                                                  .PP4_1_out             ( PP4_1_out ), 
                                                  .TI4_1_out             ( TI4_1_out ), 
                                                  .OIV4_1_out            ( OIV4_1_out ), 
                                                  .BP4_1_out             ( BP4_1_out ), 
                                                  .BS4_1_out             ( BS4_1_out ), 
                                                  .OP4_1_out             ( OP4_1_out ), 
                                                  .OS4_1_out             ( OS4_1_out ), 
                                                  .SS4_1_out             ( SS4_1_out ), 
                                                  .SP2_1_out             ( SP2_1_out ), 
                                                  .BP2_1_out             ( BP2_1_out ), 
                                                  .BS2_1_out             ( BS2_1_out ), 
                                                  .OP2_1_out             ( OP2_1_out ), 
                                                  .OS2_1_out             ( OS2_1_out ), 
                                                  .BSN4_1_out            ( BSN4_1_out ), 
                                                  .EBSN4_1_out           ( EBSN4_1_out ), 
                                                  .RBSN4_1_out           ( RBSN4_1_out ), 
                                                  .MC8_1_out             ( MC8_1_out ),
                                                  .PID1_2_out            ( PID1_2_out ), 
                                                  .MC1_2_out             ( MC1_2_out ), 
                                                  .MT1_2_out             ( MT1_2_out ), 
                                                  .SS5_2_out             ( SS5_2_out ), 
                                                  .EB3_2_out             ( EB3_2_out ), 
                                                  .SPDC1_2_out           ( SPDC1_2_out ), 
                                                  .SP4_2_out             ( SP4_2_out ), 
                                                  .V4_2_out              ( V4_2_out ), 
                                                  .PPDC1_2_out           ( PPDC1_2_out ), 
                                                  .PP4_2_out             ( PP4_2_out ), 
                                                  .TI4_2_out             ( TI4_2_out ), 
                                                  .OIV4_2_out            ( OIV4_2_out ), 
                                                  .BP4_2_out             ( BP4_2_out ), 
                                                  .BS4_2_out             ( BS4_2_out ), 
                                                  .OP4_2_out             ( OP4_2_out ), 
                                                  .OS4_2_out             ( OS4_2_out ), 
                                                  .SS4_2_out             ( SS4_2_out ), 
                                                  .SP2_2_out             ( SP2_2_out ), 
                                                  .BP2_2_out             ( BP2_2_out ), 
                                                  .BS2_2_out             ( BS2_2_out ), 
                                                  .OP2_2_out             ( OP2_2_out ), 
                                                  .OS2_2_out             ( OS2_2_out ), 
                                                  .BSN4_2_out            ( BSN4_2_out ), 
                                                  .EBSN4_2_out           ( EBSN4_2_out ), 
                                                  .RBSN4_2_out           ( RBSN4_2_out ), 
                                                  .MC8_2_out             ( MC8_2_out ),
                                                  .PID1_3_out            ( PID1_3_out ), 
                                                  .MC1_3_out             ( MC1_3_out ), 
                                                  .MT1_3_out             ( MT1_3_out ), 
                                                  .SS5_3_out             ( SS5_3_out ), 
                                                  .EB3_3_out             ( EB3_3_out ), 
                                                  .SPDC1_3_out           ( SPDC1_3_out ), 
                                                  .SP4_3_out             ( SP4_3_out ), 
                                                  .V4_3_out              ( V4_3_out ), 
                                                  .PPDC1_3_out           ( PPDC1_3_out ), 
                                                  .PP4_3_out             ( PP4_3_out ), 
                                                  .TI4_3_out             ( TI4_3_out ), 
                                                  .OIV4_3_out            ( OIV4_3_out ), 
                                                  .BP4_3_out             ( BP4_3_out ), 
                                                  .BS4_3_out             ( BS4_3_out ), 
                                                  .OP4_3_out             ( OP4_3_out ), 
                                                  .OS4_3_out             ( OS4_3_out ), 
                                                  .SS4_3_out             ( SS4_3_out ), 
                                                  .SP2_3_out             ( SP2_3_out ), 
                                                  .BP2_3_out             ( BP2_3_out ), 
                                                  .BS2_3_out             ( BS2_3_out ), 
                                                  .OP2_3_out             ( OP2_3_out ), 
                                                  .OS2_3_out             ( OS2_3_out ), 
                                                  .BSN4_3_out            ( BSN4_3_out ), 
                                                  .EBSN4_3_out           ( EBSN4_3_out ), 
                                                  .RBSN4_3_out           ( RBSN4_3_out ), 
                                                  .MC8_3_out             ( MC8_3_out )  
                                                  );
endmodule
