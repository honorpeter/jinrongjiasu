`include "para_def.v"
module stage5_opra_decode_module (
                                   clk , rst_n ,
                                   message_en ,
                                   message_1 , message_2 , message_3  ,
                                   N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
                                   message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                                   
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
          message_en ,
          message_1 , message_2 , message_3  ,
          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
          message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
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
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_1_out ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_1_out ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_1_out ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_1_out ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_1_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_1_out ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_1_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_1_out ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_1_out ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_1_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_1_out ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_1_out ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_1_out ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_1_out ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_1_out ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_1_out ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_1_out ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_1_out ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_1_out ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_1_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_1_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_1_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_1_out ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_1_out ;
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_2_out ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_2_out ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_2_out ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_2_out ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_2_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_2_out ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_2_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_2_out ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_2_out ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_2_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_2_out ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_2_out ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_2_out ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_2_out ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_2_out ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_2_out ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_2_out ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_2_out ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_2_out ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_2_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_2_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_2_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_2_out ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_2_out ;
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_3_out ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_3_out ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_3_out ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_3_out ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_3_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_3_out ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_3_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_3_out ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_3_out ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_3_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_3_out ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_3_out ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_3_out ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_3_out ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_3_out ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_3_out ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_3_out ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_3_out ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_3_out ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_3_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_3_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_3_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_3_out ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_3_out ;
    
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_1 ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_1 ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_1 ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_1 ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_1 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_1 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_1 ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_1 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_1 ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_1 ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_1 ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_1 ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_1 ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_1 ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_1 ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_1 ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_1 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_1 ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_1 ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_1 ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_1 ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_1 ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_1 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_1 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_1 ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_1 ;
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_2 ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_2 ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_2 ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_2 ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_2 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_2 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_2 ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_2 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_2 ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_2 ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_2 ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_2 ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_2 ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_2 ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_2 ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_2 ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_2 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_2 ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_2 ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_2 ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_2 ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_2 ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_2 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_2 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_2 ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_2 ;
    wire [ `field_PID1_bits - 1 : 0 ]             PID1_3 ;
    wire [ `field_MC1_bits - 1 : 0 ]              MC1_3 ;
    wire [ `field_MT1_bits - 1 : 0 ]              MT1_3 ;
    wire [ `field_SS5_bits - 1 : 0 ]              SS5_3 ;
    wire [ `field_EB3_bits - 1 : 0 ]              EB3_3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]            SPDC1_3 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP4_3 ;
    wire [ `field_V4_bits - 1 : 0 ]               V4_3 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]            PPDC1_3 ;
    wire [ `field_PP4_bits - 1 : 0 ]              PP4_3 ;
    wire [ `field_TI4_bits - 1 : 0 ]              TI4_3 ;
    wire [ `field_OIV4_bits - 1 : 0 ]             OIV4_3 ;
    wire [ `field_BP4_bits - 1 : 0 ]              BP4_3 ;
    wire [ `field_BS4_bits - 1 : 0 ]              BS4_3 ;
    wire [ `field_OP4_bits - 1 : 0 ]              OP4_3 ;
    wire [ `field_OS4_bits - 1 : 0 ]              OS4_3 ;
    wire [ `field_SS4_bits - 1 : 0 ]              SS4_3 ;
    wire [ `field_SP4_bits - 1 : 0 ]              SP2_3 ;
    wire [ `field_BP2_bits - 1 : 0 ]              BP2_3 ;
    wire [ `field_BS2_bits - 1 : 0 ]              BS2_3 ;
    wire [ `field_OP2_bits - 1 : 0 ]              OP2_3 ;
    wire [ `field_OS2_bits - 1 : 0 ]              OS2_3 ;
    wire [ `field_BSN4_bits - 1 : 0 ]             BSN4_3 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]            EBSN4_3 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]            RBSN4_3 ;
    wire [ `field_MC8_bits - 1 : 0 ]              MC8_3 ;
    
    stage5_PID1_module stage5_PID1 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ), 
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .PID1_1                      ( PID1_1 ), 
                                    .PID1_2                      ( PID1_2 ), 
                                    .PID1_3                      ( PID1_3 )
                                    );

    stage5_MC1_module stage5_MC1 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .MC1_1                       ( MC1_1 ), 
                                    .MC1_2                       ( MC1_2 ), 
                                    .MC1_3                       ( MC1_3 )
                                    );

    stage5_MT1_module stage5_MT1 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .MT1_1                       ( MT1_1 ), 
                                    .MT1_2                       ( MT1_2 ), 
                                    .MT1_3                       ( MT1_3 )
                                    );

    stage5_SS5_module stage5_SS5 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .SS5_1                       ( SS5_1 ), 
                                    .SS5_2                       ( SS5_2 ), 
                                    .SS5_3                       ( SS5_3 )
                                    );

    stage5_EB3_module stage5_EB3 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .EB3_1                       ( EB3_1 ), 
                                    .EB3_2                       ( EB3_2 ), 
                                    .EB3_3                       ( EB3_3 )
                                    );

    stage5_SPDC1_module stage5_SPDC1 (
                                      .message_en                ( message_en ), 
                                      .message_1                 ( message_1 ), 
                                      .message_2                 ( message_2 ), 
                                      .message_3                 ( message_3 ),
                                      .message_mux_control_m1    ( message_mux_control_m1 ), 
                                      .message_mux_control_m2    ( message_mux_control_m2 ), 
                                      .message_mux_control_m3    ( message_mux_control_m3 ), 
                                      .SPDC1_1                   ( SPDC1_1 ), 
                                      .SPDC1_2                   ( SPDC1_2 ), 
                                      .SPDC1_3                   ( SPDC1_3 )
                                      );

    stage5_SP4_module stage5_SP4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .SP4_1                       ( SP4_1 ), 
                                    .SP4_2                       ( SP4_2 ), 
                                    .SP4_3                       ( SP4_3 )
                                    );

    stage5_V4_module stage5_V4   (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .V4_1                        ( V4_1 ), 
                                    .V4_2                        ( V4_2 ), 
                                    .V4_3                        ( V4_3 )
                                    );

    stage5_PPDC1_module stage5_PPDC1 (
                                      .message_en                ( message_en ), 
                                      .message_1                 ( message_1 ), 
                                      .message_2                 ( message_2 ), 
                                      .message_3                 ( message_3 ),
                                      .message_mux_control_m1    ( message_mux_control_m1 ), 
                                      .message_mux_control_m2    ( message_mux_control_m2 ), 
                                      .message_mux_control_m3    ( message_mux_control_m3 ), 
                                      .PPDC1_1                   ( PPDC1_1 ), 
                                      .PPDC1_2                   ( PPDC1_2 ), 
                                      .PPDC1_3                   ( PPDC1_3 )
                                      );

    stage5_PP4_module stage5_PP4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .PP4_1                       ( PP4_1 ), 
                                    .PP4_2                       ( PP4_2 ), 
                                    .PP4_3                       ( PP4_3 )
                                    );

    stage5_TI4_module stage5_TI4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .TI4_1                       ( TI4_1 ), 
                                    .TI4_2                       ( TI4_2 ), 
                                    .TI4_3                       ( TI4_3 )
                                    );

    stage5_OIV4_module stage5_OIV4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ), 
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .OIV4_1                      ( OIV4_1 ), 
                                    .OIV4_2                      ( OIV4_2 ), 
                                    .OIV4_3                      ( OIV4_3 )
                                    );

    stage5_BP4_module stage5_BP4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .BP4_1                       ( BP4_1 ), 
                                    .BP4_2                       ( BP4_2 ), 
                                    .BP4_3                       ( BP4_3 )
                                    );

    stage5_BS4_module stage5_BS4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .BS4_1                       ( BS4_1 ), 
                                    .BS4_2                       ( BS4_2 ), 
                                    .BS4_3                       ( BS4_3 )
                                    );

    stage5_OP4_module stage5_OP4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .OP4_1                       ( OP4_1 ), 
                                    .OP4_2                       ( OP4_2 ), 
                                    .OP4_3                       ( OP4_3 )
                                    );

    stage5_OS4_module stage5_OS4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .OS4_1                       ( OS4_1 ), 
                                    .OS4_2                       ( OS4_2 ), 
                                    .OS4_3                       ( OS4_3 )
                                    );

    stage5_SS4_module stage5_SS4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .SS4_1                       ( SS4_1 ), 
                                    .SS4_2                       ( SS4_2 ), 
                                    .SS4_3                       ( SS4_3 )
                                    );

    stage5_SP2_module stage5_SP2 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .SP2_1                       ( SP2_1 ), 
                                    .SP2_2                       ( SP2_2 ), 
                                    .SP2_3                       ( SP2_3 )
                                    );

    stage5_BP2_module stage5_BP2 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .BP2_1                       ( BP2_1 ), 
                                    .BP2_2                       ( BP2_2 ), 
                                    .BP2_3                       ( BP2_3 )
                                    );

    stage5_BS2_module stage5_BS2 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .BS2_1                       ( BS2_1 ), 
                                    .BS2_2                       ( BS2_2 ), 
                                    .BS2_3                       ( BS2_3 )
                                    );

    stage5_OP2_module stage5_OP2 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .OP2_1                       ( OP2_1 ), 
                                    .OP2_2                       ( OP2_2 ), 
                                    .OP2_3                       ( OP2_3 )
                                    );

    stage5_OS2_module stage5_OS2 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ),
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .OS2_1                       ( OS2_1 ), 
                                    .OS2_2                       ( OS2_2 ), 
                                    .OS2_3                       ( OS2_3 )
                                    );

    stage5_BSN4_module stage5_BSN4 (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ), 
                                    .N_type_control_m1           ( N_type_control_m1 ), 
                                    .N_type_control_m2           ( N_type_control_m2 ), 
                                    .N_type_control_m3           ( N_type_control_m3 ), 
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .BSN4_1                      ( BSN4_1 ), 
                                    .BSN4_2                      ( BSN4_2 ), 
                                    .BSN4_3                      ( BSN4_3 )
                                    );

    stage5_EBSN4_module stage5_EBSN4 (
                                      .message_en                ( message_en ), 
                                      .message_1                 ( message_1 ), 
                                      .message_2                 ( message_2 ), 
                                      .message_3                 ( message_3 ), 
                                      .N_type_control_m1         ( N_type_control_m1 ), 
                                      .N_type_control_m2         ( N_type_control_m2 ), 
                                      .N_type_control_m3         ( N_type_control_m3 ), 
                                      .message_mux_control_m1    ( message_mux_control_m1 ), 
                                      .message_mux_control_m2    ( message_mux_control_m2 ), 
                                      .message_mux_control_m3    ( message_mux_control_m3 ), 
                                      .EBSN4_1                   ( EBSN4_1 ), 
                                      .EBSN4_2                   ( EBSN4_2 ), 
                                      .EBSN4_3                   ( EBSN4_3 )
                                      );

    stage5_RBSN4_module stage5_RBSN4 (
                                      .message_en                ( message_en ), 
                                      .message_1                 ( message_1 ), 
                                      .message_2                 ( message_2 ), 
                                      .message_3                 ( message_3 ), 
                                      .N_type_control_m1         ( N_type_control_m1 ), 
                                      .N_type_control_m2         ( N_type_control_m2 ), 
                                      .N_type_control_m3         ( N_type_control_m3 ), 
                                      .message_mux_control_m1    ( message_mux_control_m1 ), 
                                      .message_mux_control_m2    ( message_mux_control_m2 ), 
                                      .message_mux_control_m3    ( message_mux_control_m3 ), 
                                      .RBSN4_1                   ( RBSN4_1 ), 
                                      .RBSN4_2                   ( RBSN4_2 ), 
                                      .RBSN4_3                   ( RBSN4_3 )
                                      );

    stage5_MC8_module stage5_MC8   (
                                    .message_en                  ( message_en ), 
                                    .message_1                   ( message_1 ), 
                                    .message_2                   ( message_2 ), 
                                    .message_3                   ( message_3 ), 
                                    .N_type_control_m1           ( N_type_control_m1 ), 
                                    .N_type_control_m2           ( N_type_control_m2 ), 
                                    .N_type_control_m3           ( N_type_control_m3 ), 
                                    .message_mux_control_m1      ( message_mux_control_m1 ), 
                                    .message_mux_control_m2      ( message_mux_control_m2 ), 
                                    .message_mux_control_m3      ( message_mux_control_m3 ), 
                                    .MC8_1                       ( MC8_1 ), 
                                    .MC8_2                       ( MC8_2 ), 
                                    .MC8_3                       ( MC8_3 )
                                    );

    stage5_display_module stage5_display ( 
                                          .rst_n                 ( rst_n ), 
                                          .clk                   ( clk ),
                                          .message_en_in         ( message_en ) , 
                                          .PID1_1_in             ( PID1_1 ), 
                                          .MC1_1_in              ( MC1_1 ), 
                                          .MT1_1_in              ( MT1_1 ), 
                                          .SS5_1_in              ( SS5_1 ), 
                                          .EB3_1_in              ( EB3_1 ), 
                                          .SPDC1_1_in            ( SPDC1_1 ), 
                                          .SP4_1_in              ( SP4_1 ), 
                                          .V4_1_in               ( V4_1 ), 
                                          .PPDC1_1_in            ( PPDC1_1 ), 
                                          .PP4_1_in              ( PP4_1 ), 
                                          .TI4_1_in              ( TI4_1 ), 
                                          .OIV4_1_in             ( OIV4_1 ), 
                                          .BP4_1_in              ( BP4_1 ), 
                                          .BS4_1_in              ( BS4_1 ), 
                                          .OP4_1_in              ( OP4_1 ), 
                                          .OS4_1_in              ( OS4_1 ), 
                                          .SS4_1_in              ( SS4_1 ), 
                                          .SP2_1_in              ( SP2_1 ), 
                                          .BP2_1_in              ( BP2_1 ), 
                                          .BS2_1_in              ( BS2_1 ), 
                                          .OP2_1_in              ( OP2_1 ), 
                                          .OS2_1_in              ( OS2_1 ), 
                                          .BSN4_1_in             ( BSN4_1 ), 
                                          .EBSN4_1_in            ( EBSN4_1 ), 
                                          .RBSN4_1_in            ( RBSN4_1 ), 
                                          .MC8_1_in              ( MC8_1 ),
                                          .PID1_2_in             ( PID1_2 ), 
                                          .MC1_2_in              ( MC1_2 ), 
                                          .MT1_2_in              ( MT1_2 ), 
                                          .SS5_2_in              ( SS5_2 ), 
                                          .EB3_2_in              ( EB3_2 ), 
                                          .SPDC1_2_in            ( SPDC1_2 ), 
                                          .SP4_2_in              ( SP4_2 ), 
                                          .V4_2_in               ( V4_2 ), 
                                          .PPDC1_2_in            ( PPDC1_2 ), 
                                          .PP4_2_in              ( PP4_2 ), 
                                          .TI4_2_in              ( TI4_2 ), 
                                          .OIV4_2_in             ( OIV4_2 ), 
                                          .BP4_2_in              ( BP4_2 ), 
                                          .BS4_2_in              ( BS4_2 ), 
                                          .OP4_2_in              ( OP4_2 ), 
                                          .OS4_2_in              ( OS4_2 ), 
                                          .SS4_2_in              ( SS4_2 ), 
                                          .SP2_2_in              ( SP2_2 ), 
                                          .BP2_2_in              ( BP2_2 ), 
                                          .BS2_2_in              ( BS2_2 ), 
                                          .OP2_2_in              ( OP2_2 ), 
                                          .OS2_2_in              ( OS2_2 ), 
                                          .BSN4_2_in             ( BSN4_2 ), 
                                          .EBSN4_2_in            ( EBSN4_2 ), 
                                          .RBSN4_2_in            ( RBSN4_2 ), 
                                          .MC8_2_in              ( MC8_2 ),
                                          .PID1_3_in             ( PID1_3 ), 
                                          .MC1_3_in              ( MC1_3 ), 
                                          .MT1_3_in              ( MT1_3 ), 
                                          .SS5_3_in              ( SS5_3 ), 
                                          .EB3_3_in              ( EB3_3 ), 
                                          .SPDC1_3_in            ( SPDC1_3 ), 
                                          .SP4_3_in              ( SP4_3 ), 
                                          .V4_3_in               ( V4_3 ), 
                                          .PPDC1_3_in            ( PPDC1_3 ), 
                                          .PP4_3_in              ( PP4_3 ), 
                                          .TI4_3_in              ( TI4_3 ), 
                                          .OIV4_3_in             ( OIV4_3 ), 
                                          .BP4_3_in              ( BP4_3 ), 
                                          .BS4_3_in              ( BS4_3 ), 
                                          .OP4_3_in              ( OP4_3 ), 
                                          .OS4_3_in              ( OS4_3 ), 
                                          .SS4_3_in              ( SS4_3 ), 
                                          .SP2_3_in              ( SP2_3 ), 
                                          .BP2_3_in              ( BP2_3 ), 
                                          .BS2_3_in              ( BS2_3 ), 
                                          .OP2_3_in              ( OP2_3 ), 
                                          .OS2_3_in              ( OS2_3 ), 
                                          .BSN4_3_in             ( BSN4_3 ), 
                                          .EBSN4_3_in            ( EBSN4_3 ), 
                                          .RBSN4_3_in            ( RBSN4_3 ), 
                                          .MC8_3_in              ( MC8_3 ),
                                          
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
