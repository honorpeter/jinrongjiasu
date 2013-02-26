`include "para_def.v"
module stage5_MT1_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            MT1_1 , MT1_2 , MT1_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output MT1_1 , MT1_2 , MT1_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_MT1_bits - 1 : 0 ]               MT1_1 , MT1_2 , MT1_3 ;
    
    assign MT1_1  =  ( (message_en != 0) && (message_mux_control_m1 != `message_mux_defaut) )? message_1[ `MT1_b : `MT1_e ] : `defaut_infor ;
    assign MT1_2  =  ( (message_en != 0) && (message_mux_control_m2 != `message_mux_defaut) )? message_2[ `MT1_b : `MT1_e ] : `defaut_infor ;
    assign MT1_3  =  ( (message_en != 0) && (message_mux_control_m3 != `message_mux_defaut) )? message_3[ `MT1_b : `MT1_e ] : `defaut_infor ;
endmodule
