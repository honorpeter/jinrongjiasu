`include "para_def.v"
module stage5_MC8_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            N_type_control_m1 , N_type_control_m2 , N_type_control_m3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            MC8_1 , MC8_2 , MC8_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    output MC8_1 , MC8_2 , MC8_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `field_MC8_bits - 1 : 0 ]               MC8_1 , MC8_2 , MC8_3 ;
    
    assign MC8_1    = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m1 == `message_mux_N) && (N_type_control_m1 == `N_type_S) )?  message_1[ `NS_MC8_b : `NS_MC8_e ] : `defaut_infor ;

    assign MC8_2    = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m2 == `message_mux_N) && (N_type_control_m2 == `N_type_S) )?  message_2[ `NS_MC8_b : `NS_MC8_e ] : `defaut_infor ;

    assign MC8_3    = ( message_en == 0 )? `defaut_infor : 
                      ( (message_mux_control_m3 == `message_mux_N) && (N_type_control_m3 == `N_type_S) )?  message_3[ `NS_MC8_b : `NS_MC8_e ] : `defaut_infor ;
endmodule
