`include "para_def.v"
module stage5_PPDC1_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            PPDC1_1 , PPDC1_2 , PPDC1_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output PPDC1_1 , PPDC1_2 , PPDC1_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             PPDC1_1 , PPDC1_2 , PPDC1_3 ;
    
    assign PPDC1_1  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_PPDC1_b : `k_PPDC1_e ] : `defaut_infor ;

    assign PPDC1_2  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_PPDC1_b : `k_PPDC1_e ] : `defaut_infor ;

    assign PPDC1_3  = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_PPDC1_b : `a_PPDC1_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_PPDC1_b : `k_PPDC1_e ] : `defaut_infor ;
endmodule
