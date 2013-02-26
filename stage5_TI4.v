`include "para_def.v"
module stage5_TI4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            TI4_1 , TI4_2 , TI4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output TI4_1 , TI4_2 , TI4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_TI4_bits - 1 : 0 ]               TI4_1 , TI4_2 , TI4_3 ;
    
    assign TI4_1    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_a )?  message_1[ `a_TI4_b : `a_TI4_e ] : `defaut_infor ;

    assign TI4_2    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_a )?  message_2[ `a_TI4_b : `a_TI4_e ] : `defaut_infor ;

    assign TI4_3    = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_a )?  message_3[ `a_TI4_b : `a_TI4_e ] : `defaut_infor ;
endmodule
