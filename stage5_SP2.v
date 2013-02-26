`include "para_def.v"
module stage5_SP2_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            SP2_1 , SP2_2 , SP2_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output SP2_1 , SP2_2 , SP2_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_SP2_bits - 1 : 0 ]               SP2_1 , SP2_2 , SP2_3 ;
    
    assign SP2_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_SP2_b : `q_SP2_e ] : `defaut_infor ;

    assign SP2_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_SP2_b : `q_SP2_e ] : `defaut_infor ;

    assign SP2_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_SP2_b : `q_SP2_e ] : `defaut_infor ;
endmodule
