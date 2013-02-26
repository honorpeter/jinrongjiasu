`include "para_def.v"
module stage5_BSN4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            BSN4_1 , BSN4_2 , BSN4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    output BSN4_1 , BSN4_2 , BSN4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `field_BSN4_bits - 1 : 0 ]              BSN4_1 , BSN4_2 , BSN4_3 ;
    
    assign BSN4_1   = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_M) )?  message_1[ `NM_BSN4_b : `NM_BSN4_e ] : `defaut_infor ;

    assign BSN4_2   = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_M) )?  message_2[ `NM_BSN4_b : `NM_BSN4_e ] : `defaut_infor ;

    assign BSN4_3   = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_M) )?  message_3[ `NM_BSN4_b : `NM_BSN4_e ] : `defaut_infor ;
endmodule