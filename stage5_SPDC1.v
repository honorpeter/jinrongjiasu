`include "para_def.v"
module stage5_SPDC1_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            SPDC1_1 , SPDC1_2 , SPDC1_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output SPDC1_1 , SPDC1_2 , SPDC1_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             SPDC1_1 , SPDC1_2 , SPDC1_3 ;
    
    assign SPDC1_1  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SPDC1_b : `k_SPDC1_e ] : `defaut_infor ;

    assign SPDC1_2  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SPDC1_b : `k_SPDC1_e ] : `defaut_infor ;

    assign SPDC1_3  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SPDC1_b : `a_SPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SPDC1_b : `d_SPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SPDC1_b : `k_SPDC1_e ] : `defaut_infor ;
endmodule
