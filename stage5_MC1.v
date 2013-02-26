`include "para_def.v"
module stage5_MC1_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            MC1_1 , MC1_2 , MC1_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output MC1_1 , MC1_2 , MC1_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_MC1_bits - 1 : 0 ]               MC1_1 , MC1_2 , MC1_3 ;
    
    assign MC1_1  =  ( (message_en != 0) && (message_mux_control_m1 != `message_mux_defaut) )? message_1[ `MC1_b : `MC1_e ] : `defaut_infor ;
    assign MC1_2  =  ( (message_en != 0) && (message_mux_control_m2 != `message_mux_defaut) )? message_2[ `MC1_b : `MC1_e ] : `defaut_infor ;
    assign MC1_3  =  ( (message_en != 0) && (message_mux_control_m3 != `message_mux_defaut) )? message_3[ `MC1_b : `MC1_e ] : `defaut_infor ;
endmodule
