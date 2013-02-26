`include "para_def.v"
module stage5_EB3_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            EB3_1 , EB3_2 , EB3_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output EB3_1 , EB3_2 , EB3_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_EB3_bits - 1 : 0 ]               EB3_1 , EB3_2 , EB3_3 ;
    
    assign EB3_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_EB3_b : `q_EB3_e ] : `defaut_infor ;

    assign EB3_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_1[ `q_EB3_b : `q_EB3_e ] : `defaut_infor ;

    assign EB3_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_EB3_b : `a_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_EB3_b : `d_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_EB3_b : `k_EB3_e ] : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_1[ `q_EB3_b : `q_EB3_e ] : `defaut_infor ;
endmodule
