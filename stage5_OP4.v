`include "para_def.v"
module stage5_OP4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            OP4_1 , OP4_2 , OP4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output OP4_1 , OP4_2 , OP4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_OP4_bits - 1 : 0 ]               OP4_1 , OP4_2 , OP4_3 ;
    
    assign OP4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_OP4_b : `k_OP4_e ] : `defaut_infor ;

    assign OP4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_OP4_b : `k_OP4_e ] : `defaut_infor ;

    assign OP4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_OP4_b : `k_OP4_e ] : `defaut_infor ;
endmodule
