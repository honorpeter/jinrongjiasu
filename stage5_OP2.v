`include "para_def.v"
module stage5_OP2_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            OP2_1 , OP2_2 , OP2_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output OP2_1 , OP2_2 , OP2_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_OP2_bits - 1 : 0 ]               OP2_1 , OP2_2 , OP2_3 ;
    
    assign OP2_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_OP2_b : `q_OP2_e ] : `defaut_infor ;

    assign OP2_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_OP2_b : `q_OP2_e ] : `defaut_infor ;

    assign OP2_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_OP2_b : `q_OP2_e ] : `defaut_infor ;
endmodule
