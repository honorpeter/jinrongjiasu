`include "para_def.v"
module stage5_BP2_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            BP2_1 , BP2_2 , BP2_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output BP2_1 , BP2_2 , BP2_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_BP2_bits - 1 : 0 ]               BP2_1 , BP2_2 , BP2_3 ;
    
    assign BP2_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_q )?  message_1[ `q_BP2_b : `q_BP2_e ] : `defaut_infor ;

    assign BP2_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_q )?  message_2[ `q_BP2_b : `q_BP2_e ] : `defaut_infor ;

    assign BP2_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_q )?  message_3[ `q_BP2_b : `q_BP2_e ] : `defaut_infor ;
endmodule
