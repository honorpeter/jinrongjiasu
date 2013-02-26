`include "para_def.v"
module stage5_OS2_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            OS2_1 , OS2_2 , OS2_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output OS2_1 , OS2_2 , OS2_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_OS2_bits - 1 : 0 ]               OS2_1 , OS2_2 , OS2_3 ;
    
    assign OS2_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_OS2_b : `q_OS2_e ] : `defaut_infor ;

    assign OS2_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_OS2_b : `q_OS2_e ] : `defaut_infor ;

    assign OS2_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_OS2_b : `q_OS2_e ] : `defaut_infor ;
endmodule
