`include "para_def.v"
module stage5_SS5_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            SS5_1 , SS5_2 , SS5_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output SS5_1 , SS5_2 , SS5_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_SS5_bits - 1 : 0 ]               SS5_1 , SS5_2 , SS5_3 ;
    
    assign SS5_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m1 == `message_mux_k )?  message_1[ `k_SS5_b : `k_SS5_e ] : `defaut_infor ;

    assign SS5_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m2 == `message_mux_k )?  message_2[ `k_SS5_b : `k_SS5_e ] : `defaut_infor ;

    assign SS5_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_SS5_b : `a_SS5_e ] : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_SS5_b : `d_SS5_e ] : 
                      ( message_mux_control_m3 == `message_mux_k )?  message_3[ `k_SS5_b : `k_SS5_e ] : `defaut_infor ;
endmodule
