`include "para_def.v"
module stage5_SS4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            SS4_1 , SS4_2 , SS4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output SS4_1 , SS4_2 , SS4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_SS4_bits - 1 : 0 ]               SS4_1 , SS4_2 , SS4_3 ;
    
    assign SS4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_SS4_b : `q_SS4_e ] : `defaut_infor ;

    assign SS4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_SS4_b : `q_SS4_e ] : `defaut_infor ;

    assign SS4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_SS4_b : `q_SS4_e ] : `defaut_infor ;
endmodule
