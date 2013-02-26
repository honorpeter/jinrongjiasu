`include "para_def.v"
module stage5_BP4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            BP4_1 , BP4_2 , BP4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output BP4_1 , BP4_2 , BP4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_BP4_bits - 1 : 0 ]               BP4_1 , BP4_2 , BP4_3 ;
    
    assign BP4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_BP4_b : `k_BP4_e ] : `defaut_infor ;

    assign BP4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_BP4_b : `k_BP4_e ] : `defaut_infor ;

    assign BP4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_BP4_b : `k_BP4_e ] : `defaut_infor ;
endmodule
