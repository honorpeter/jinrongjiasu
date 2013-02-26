`include "para_def.v"
module stage5_SP4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            SP4_1 , SP4_2 , SP4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output SP4_1 , SP4_2 , SP4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_SP4_bits - 1 : 0 ]               SP4_1 , SP4_2 , SP4_3 ;
    
    assign SP4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SP4_b : `k_SP4_e ] : `defaut_infor ;

    assign SP4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SP4_b : `k_SP4_e ] : `defaut_infor ;

    assign SP4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SP4_b : `a_SP4_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SP4_b : `d_SP4_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SP4_b : `k_SP4_e ] : `defaut_infor ;
endmodule
