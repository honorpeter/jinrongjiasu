`include "para_def.v"
module stage5_BS4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            BS4_1 , BS4_2 , BS4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output BS4_1 , BS4_2 , BS4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_BS4_bits - 1 : 0 ]               BS4_1 , BS4_2 , BS4_3 ;
    
    assign BS4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_BS4_b : `k_BS4_e ] : `defaut_infor ;

    assign BS4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_BS4_b : `k_BS4_e ] : `defaut_infor ;

    assign BS4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_BS4_b : `k_BS4_e ] : `defaut_infor ;
endmodule
