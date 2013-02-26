`include "para_def.v"
module stage5_RBSN4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            RBSN4_1 , RBSN4_2 , RBSN4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    output RBSN4_1 , RBSN4_2 , RBSN4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             RBSN4_1 , RBSN4_2 , RBSN4_3 ;
    
    assign RBSN4_1  = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_N) )?  message_1[ `NN_RBSN4_b : `NN_RBSN4_e ] : `defaut_infor ;

    assign RBSN4_2  = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_N) )?  message_2[ `NN_RBSN4_b : `NN_RBSN4_e ] : `defaut_infor ;

    assign RBSN4_3  = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_N) )?  message_3[ `NN_RBSN4_b : `NN_RBSN4_e ] : `defaut_infor ;
endmodule
