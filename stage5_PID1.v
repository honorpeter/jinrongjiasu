`include "para_def.v"
module stage5_PID1_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            PID1_1 , PID1_2 , PID1_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output PID1_1 , PID1_2 , PID1_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_PID1_bits - 1 : 0 ]              PID1_1 , PID1_2 , PID1_3 ;
    
    assign PID1_1  =  ( (message_en != 0) && (message_mux_control_m1 != `message_mux_defaut) )? message_1[ `PID1_b : `PID1_e ] : `defaut_infor ;
    assign PID1_2  =  ( (message_en != 0) && (message_mux_control_m2 != `message_mux_defaut) )? message_2[ `PID1_b : `PID1_e ] : `defaut_infor ;
    assign PID1_3  =  ( (message_en != 0) && (message_mux_control_m3 != `message_mux_defaut) )? message_3[ `PID1_b : `PID1_e ] : `defaut_infor ;
endmodule
