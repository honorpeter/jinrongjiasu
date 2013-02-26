`include "para_def.v"
module stage3_field_in_mux_module (    message_en , 
                                       block_time_message , 
                                       message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                                       N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
                                       message_1 , message_2 , message_3 , 
                                       BT8_out , PID1_out , MC1_out , MT1_out , 
                                       SS5_out , EB3_out , SPDC1_out , SP4_out , V4_out , PPDC1_out , PP4_out , TI4_out ,
                                       OIV4_out , 
                                       BP4_out , BS4_out , OP4_out , OS4_out , 
                                       SS4_out , SP2_out , BP2_out , BS2_out , OP2_out , OS2_out , 
                                       BSN4_out , EBSN4_out , RBSN4_out , MC8_out ,
                                       BT8_in , PID1_in , MC1_in , MT1_in , 
                                       SS5_in , EB3_in , SPDC1_in , SP4_in , V4_in , PPDC1_in , PP4_in , TI4_in , 
                                       OIV4_in , 
                                       BP4_in , BS4_in , OP4_in , OS4_in , 
                                       SS4_in , SP2_in , BP2_in , BS2_in , OP2_in , OS2_in , 
                                       BSN4_in , EBSN4_in , RBSN4_in , MC8_in );
    input  message_en , 
           block_time_message , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
           message_1 , message_2 , message_3 ,
           BT8_out , PID1_out , MC1_out , MT1_out , 
           SS5_out , EB3_out , SPDC1_out , SP4_out , V4_out , PPDC1_out , PP4_out , TI4_out ,
           OIV4_out , 
           BP4_out , BS4_out , OP4_out , OS4_out , 
           SS4_out , SP2_out , BP2_out , BS2_out , OP2_out , OS2_out , 
           BSN4_out , EBSN4_out , RBSN4_out , MC8_out ;
    output BT8_in , PID1_in , MC1_in , MT1_in , 
           SS5_in , EB3_in , SPDC1_in , SP4_in , V4_in , PPDC1_in , PP4_in , TI4_in , 
           OIV4_in , 
           BP4_in , BS4_in , OP4_in , OS4_in , 
           SS4_in , SP2_in , BP2_in , BS2_in , OP2_in , OS2_in , 
           BSN4_in , EBSN4_in , RBSN4_in , MC8_in ;
    
    wire                                             message_en ;
    wire [ `field_BT8_bits - 1 : 0 ]                 block_time_message ;
    wire [ `message_mux_control_width - 1 : 0 ]      message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]            N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]               message_1 , message_2 , message_3 ;
    
    wire [ `field_BT8_bits - 1 : 0 ]                 BT8_out ;
    wire [ `field_PID1_bits - 1 : 0 ]                PID1_out ;
    wire [ `field_MC1_bits - 1 : 0 ]                 MC1_out ;
    wire [ `field_MT1_bits - 1 : 0 ]                 MT1_out ;
    wire [ `field_SS5_bits - 1 : 0 ]                 SS5_out ;
    wire [ `field_EB3_bits - 1 : 0 ]                 EB3_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ]               SPDC1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]                 SP4_out ;
    wire [ `field_V4_bits - 1 : 0 ]                  V4_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ]               PPDC1_out ;
    wire [ `field_PP4_bits - 1 : 0 ]                 PP4_out ;
    wire [ `field_TI4_bits - 1 : 0 ]                 TI4_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]                OIV4_out ;
    wire [ `field_BP4_bits - 1 : 0 ]                 BP4_out ;
    wire [ `field_BS4_bits - 1 : 0 ]                 BS4_out ;
    wire [ `field_OP4_bits - 1 : 0 ]                 OP4_out ;
    wire [ `field_OS4_bits - 1 : 0 ]                 OS4_out ;
    wire [ `field_SS4_bits - 1 : 0 ]                 SS4_out ;
    wire [ `field_SP4_bits - 1 : 0 ]                 SP2_out ;
    wire [ `field_BP2_bits - 1 : 0 ]                 BP2_out ;
    wire [ `field_BS2_bits - 1 : 0 ]                 BS2_out ;
    wire [ `field_OP2_bits - 1 : 0 ]                 OP2_out ;
    wire [ `field_OS2_bits - 1 : 0 ]                 OS2_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]                BSN4_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ]               EBSN4_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ]               RBSN4_out ;
    wire [ `field_MC8_bits - 1 : 0 ]                 MC8_out ;
    
    wire [ `field_BT8_bits - 1 : 0 ]                 BT8_in ;
    wire [ `field_PID1_bits - 1 : 0 ]                PID1_in ;
    wire [ `field_MC1_bits - 1 : 0 ]                 MC1_in ;
    wire [ `field_MT1_bits - 1 : 0 ]                 MT1_in ;
    wire [ `field_SS5_bits - 1 : 0 ]                 SS5_in ;
    wire [ `field_EB3_bits - 1 : 0 ]                 EB3_in ;
    wire [ `field_SPDC1_bits - 1 : 0 ]               SPDC1_in ;
    wire [ `field_SP4_bits - 1 : 0 ]                 SP4_in ;
    wire [ `field_V4_bits - 1 : 0 ]                  V4_in ;
    wire [ `field_PPDC1_bits - 1 : 0 ]               PPDC1_in ;
    wire [ `field_PP4_bits - 1 : 0 ]                 PP4_in ;
    wire [ `field_TI4_bits - 1 : 0 ]                 TI4_in ;
    wire [ `field_OIV4_bits - 1 : 0 ]                OIV4_in ;
    wire [ `field_BP4_bits - 1 : 0 ]                 BP4_in ;
    wire [ `field_BS4_bits - 1 : 0 ]                 BS4_in ;
    wire [ `field_OP4_bits - 1 : 0 ]                 OP4_in ;
    wire [ `field_OS4_bits - 1 : 0 ]                 OS4_in ;
    wire [ `field_SS4_bits - 1 : 0 ]                 SS4_in ;
    wire [ `field_SP4_bits - 1 : 0 ]                 SP2_in ;
    wire [ `field_BP2_bits - 1 : 0 ]                 BP2_in ;
    wire [ `field_BS2_bits - 1 : 0 ]                 BS2_in ;
    wire [ `field_OP2_bits - 1 : 0 ]                 OP2_in ;
    wire [ `field_OS2_bits - 1 : 0 ]                 OS2_in ;
    wire [ `field_BSN4_bits - 1 : 0 ]                BSN4_in ;
    wire [ `field_EBSN4_bits - 1 : 0 ]               EBSN4_in ;
    wire [ `field_RBSN4_bits - 1 : 0 ]               RBSN4_in ;
    wire [ `field_MC8_bits - 1 : 0 ]                 MC8_in ;
    
    assign BT8_in   = ( message_en == 0 )? BT8_out : block_time_message ; 
    
    assign PID1_in  = ( message_en == 0 )? PID1_out : 
                      ( message_mux_control_m3 != `message_mux_defaut )? message_3 [ `PID1_b : `PID1_e ] : 
                      ( message_mux_control_m2 != `message_mux_defaut )? message_2 [ `PID1_b : `PID1_e ] :
                      ( message_mux_control_m1 != `message_mux_defaut )? message_1 [ `PID1_b : `PID1_e ] :
                      PID1_out ;
                      
    assign MC1_in   = ( message_en == 0 )? MC1_out : 
                      ( message_mux_control_m3 != `message_mux_defaut )? message_3 [ `MC1_b : `MC1_e ] : 
                      ( message_mux_control_m2 != `message_mux_defaut )? message_2 [ `MC1_b : `MC1_e ] :
                      ( message_mux_control_m1 != `message_mux_defaut )? message_1 [ `MC1_b : `MC1_e ] :
                      MC1_out ;
                      
    assign MT1_in   = ( message_en == 0 )? MT1_out : 
                      ( message_mux_control_m3 != `message_mux_defaut )? message_3 [ `MT1_b : `MT1_e ] : 
                      ( message_mux_control_m2 != `message_mux_defaut )? message_2 [ `MT1_b : `MT1_e ] :
                      ( message_mux_control_m1 != `message_mux_defaut )? message_1 [ `MT1_b : `MT1_e ] :
                      MT1_out ;
    
    assign SS5_in   = ( message_en == 0 )? SS5_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SS5_b : `k_SS5_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SS5_b : `k_SS5_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SS5_b : `k_SS5_e ] : 
                      SS5_out ;
    
    assign EB3_in   = ( message_en == 0 )? EB3_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_EB3_b : `q_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_EB3_b : `q_EB3_e ] :
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_EB3_b : `q_EB3_e ] :
                      EB3_out ;

    assign SPDC1_in = ( message_en == 0 )? SPDC1_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SPDC1_b : `k_SPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SPDC1_b : `k_SPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SPDC1_b : `k_SPDC1_e ] : 
                      SPDC1_out ;

    assign SP4_in   = ( message_en == 0 )? SP4_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SP4_b : `k_SP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SP4_b : `k_SP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SP4_b : `k_SP4_e ] : 
                      SP4_out ;

    assign V4_in    = ( message_en == 0 )? V4_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_V4_b : `a_V4_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_V4_b : `a_V4_e ] :  
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_V4_b : `a_V4_e ] : 
                      V4_out ;

    
    assign PPDC1_in = ( message_en == 0 )? PPDC1_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_PPDC1_b : `k_PPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_PPDC1_b : `k_PPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_PPDC1_b : `k_PPDC1_e ] : 
                      PPDC1_out ;

    assign PP4_in   = ( message_en == 0 )? PP4_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_PP4_b : `a_PP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_PP4_b : `a_PP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_PP4_b : `a_PP4_e ] : 
                      PP4_out ;

    assign TI4_in   = ( message_en == 0 )? TI4_out : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_TI4_b : `a_TI4_e ] : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_TI4_b : `a_TI4_e ] : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_TI4_b : `a_TI4_e ] : 
                      TI4_out ;

    assign OIV4_in  = ( message_en == 0 )? OIV4_out : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_OIV4_b : `d_OIV4_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_OIV4_b : `d_OIV4_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_OIV4_b : `d_OIV4_e ] : 
                      OIV4_out ;

    assign BP4_in   = ( message_en == 0 )? BP4_out : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_BP4_b : `k_BP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_BP4_b : `k_BP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_BP4_b : `k_BP4_e ] : 
                      BP4_out ;

    assign BS4_in   = ( message_en == 0 )? BS4_out : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_BS4_b : `k_BS4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_BS4_b : `k_BS4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_BS4_b : `k_BS4_e ] : 
                      BS4_out ;

    assign OP4_in   = ( message_en == 0 )? OP4_out : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_OP4_b : `k_OP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_OP4_b : `k_OP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_OP4_b : `k_OP4_e ] : 
                      OP4_out ;

    assign OS4_in   = ( message_en == 0 )? OS4_out : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_OS4_b : `k_OS4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_OS4_b : `k_OS4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_OS4_b : `k_OS4_e ] : 
                      OS4_out ;

    assign SS4_in   = ( message_en == 0 )? SS4_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_SS4_b : `q_SS4_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_SS4_b : `q_SS4_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_SS4_b : `q_SS4_e ] : 
                      SS4_out ;

    assign SP2_in   = ( message_en == 0 )? SP2_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_SP2_b : `q_SP2_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_SP2_b : `q_SP2_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_SP2_b : `q_SP2_e ] : 
                      SP2_out ;

    assign BP2_in   = ( message_en == 0 )? BP2_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_BP2_b : `q_BP2_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_BP2_b : `q_BP2_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_BP2_b : `q_BP2_e ] : 
                      BP2_out ;

    assign BS2_in   = ( message_en == 0 )? BS2_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_BS2_b : `q_BS2_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_BS2_b : `q_BS2_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_BS2_b : `q_BS2_e ] : 
                      BS2_out ;

    assign OP2_in   = ( message_en == 0 )? OP2_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_OP2_b : `q_OP2_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_OP2_b : `q_OP2_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_OP2_b : `q_OP2_e ] : 
                      OP2_out ;

    assign OS2_in   = ( message_en == 0 )? OS2_out : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_OS2_b : `q_OS2_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_OS2_b : `q_OS2_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_OS2_b : `q_OS2_e ] : 
                      OS2_out ;

    assign BSN4_in  = ( message_en == 0 )? BSN4_out : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_M) )?  message_3[ `NM_BSN4_b : `NM_BSN4_e ] : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_M) )?  message_2[ `NM_BSN4_b : `NM_BSN4_e ] : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_M) )?  message_1[ `NM_BSN4_b : `NM_BSN4_e ] : 
                      BSN4_out ;

    assign EBSN4_in = ( message_en == 0 )? EBSN4_out : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_N) )?  message_3[ `NN_EBSN4_b : `NN_EBSN4_e ] : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_N) )?  message_2[ `NN_EBSN4_b : `NN_EBSN4_e ] : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_N) )?  message_1[ `NN_EBSN4_b : `NN_EBSN4_e ] : 
                      EBSN4_out ;

    assign RBSN4_in = ( message_en == 0 )? RBSN4_out : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_N) )?  message_3[ `NN_RBSN4_b : `NN_RBSN4_e ] : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_N) )?  message_2[ `NN_RBSN4_b : `NN_RBSN4_e ] : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_N) )?  message_1[ `NN_RBSN4_b : `NN_RBSN4_e ] : 
                      RBSN4_out ;

    assign MC8_in   = ( message_en == 0 )? MC8_out : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_S) )?  message_3[ `NS_MC8_b : `NS_MC8_e ] : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_S) )?  message_2[ `NS_MC8_b : `NS_MC8_e ] : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_S) )?  message_1[ `NS_MC8_b : `NS_MC8_e ] : 
                      MC8_out ;
    
endmodule
