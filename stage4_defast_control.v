`include "para_def.v"
module stage_4_defast_control_module (
                                      message_fast_1 , message_fast_2 , message_fast_3 ,
                                      field_MC1 , field_MT1 , 
                                      message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                                      N_type_control_m1 , N_type_control_m2 , N_type_control_m3 
                                      );
    
    input  message_fast_1 , message_fast_2 , message_fast_3 ,
           field_MC1 , field_MT1 ;
    output message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    
    wire [ `field_MC1_bits - 1 : 0 ]               MC_1 , MC_2 , MC_3 ;
    wire [ `field_MT1_bits - 1 : 0 ]               MT_1 , MT_2 , MT_3 ;
    
    assign MC_1 = ( message_fast_1 [ `MC_position ] == 1'b1 )?  field_MC1 :
                  ( message_fast_1 [ `PID_position ] == 1'b1 )? message_fast_1[327:320] : message_fast_1[319:312] ;

    assign MC_2 = ( message_fast_2 [ `MC_position ] == 1'b1 )?  field_MC1 :
                  ( message_fast_2 [ `PID_position ] == 1'b1 )? message_fast_2[327:320] : message_fast_2[319:312] ;

    assign MC_3 = ( message_fast_3 [ `MC_position ] == 1'b1 )?  field_MC1 :
                  ( message_fast_3 [ `PID_position ] == 1'b1 )? message_fast_3[327:320] : message_fast_3[319:312] ;

    assign MT_1 = ( message_fast_1 [ `MT_position ] == 1'b1 )?  field_MT1 :
                  ( message_fast_1 [ `PID_position : `MC_position ] == 2'b00 )? message_fast_1[311:304] :
                  ( message_fast_1 [ `PID_position : `MC_position ] == 2'b11 )? message_fast_1[327:320] : message_fast_1[319:312] ;

    assign MT_2 = ( message_fast_2 [ `MT_position ] == 1'b1 )?  field_MT1 :
                  ( message_fast_2 [ `PID_position : `MC_position ] == 2'b00 )? message_fast_2[311:304] :
                  ( message_fast_2 [ `PID_position : `MC_position ] == 2'b11 )? message_fast_2[327:320] : message_fast_2[319:312] ;

    assign MT_3 = ( message_fast_3 [ `MT_position ] == 1'b1 )?  field_MT1 :
                  ( message_fast_3 [ `PID_position : `MC_position ] == 2'b00 )? message_fast_3[311:304] :
                  ( message_fast_3 [ `PID_position : `MC_position ] == 2'b11 )? message_fast_3[327:320] : message_fast_3[319:312] ;

    assign message_mux_control_m1 = ( MC_1 == `a_l_ASCII )? `message_mux_a :
                                    ( MC_1 == `d_l_ASCII )? `message_mux_d :
                                    ( MC_1 == `k_l_ASCII )? `message_mux_k :
                                    ( MC_1 == `q_l_ASCII )? `message_mux_q :
                                    ( MC_1 == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;
    
    assign message_mux_control_m2 = ( MC_2 == `a_l_ASCII )? `message_mux_a :
                                    ( MC_2 == `d_l_ASCII )? `message_mux_d :
                                    ( MC_2 == `k_l_ASCII )? `message_mux_k :
                                    ( MC_2 == `q_l_ASCII )? `message_mux_q :
                                    ( MC_2 == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;

    assign message_mux_control_m3 = ( MC_3 == `a_l_ASCII )? `message_mux_a :
                                    ( MC_3 == `d_l_ASCII )? `message_mux_d :
                                    ( MC_3 == `k_l_ASCII )? `message_mux_k :
                                    ( MC_3 == `q_l_ASCII )? `message_mux_q :
                                    ( MC_3 == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;
    
    assign N_type_control_m1 = ( MT_1 == `L_u_ASCII )? `N_type_L :
                               ( MT_1 == `M_u_ASCII )? `N_type_M :
                               ( MT_1 == `N_u_ASCII )? `N_type_N :
                               ( MT_1 == `R_u_ASCII )? `N_type_R :
                               ( MT_1 == `S_u_ASCII )? `N_type_S : `N_type_defaut ;
    
    assign N_type_control_m2 = ( MT_2 == `L_u_ASCII )? `N_type_L :
                               ( MT_2 == `M_u_ASCII )? `N_type_M :
                               ( MT_2 == `N_u_ASCII )? `N_type_N :
                               ( MT_2 == `R_u_ASCII )? `N_type_R :
                               ( MT_2 == `S_u_ASCII )? `N_type_S : `N_type_defaut ;

    assign N_type_control_m3 = ( MT_3 == `L_u_ASCII )? `N_type_L :
                               ( MT_3 == `M_u_ASCII )? `N_type_M :
                               ( MT_3 == `N_u_ASCII )? `N_type_N :
                               ( MT_3 == `R_u_ASCII )? `N_type_R :
                               ( MT_3 == `S_u_ASCII )? `N_type_S : `N_type_defaut ;
endmodule
