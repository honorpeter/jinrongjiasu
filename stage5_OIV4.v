`include "para_def.v"
module stage5_OIV4_module (
                            message_en , 
                            message_1 , message_2 , message_3 , 
                            message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 , 
                            OIV4_1 , OIV4_2 , OIV4_3 
                            );
    input  message_en , 
           message_1 , message_2 , message_3 , 
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    output OIV4_1 , OIV4_2 , OIV4_3 ;
    
    wire                                           message_en ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `field_OIV4_bits - 1 : 0 ]              OIV4_1 , OIV4_2 , OIV4_3 ;
    
    assign OIV4_1   = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m1 == `message_mux_d )?  message_1[ `d_OIV4_b : `d_OIV4_e ] : `defaut_infor ;

    assign OIV4_2   = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m2 == `message_mux_d )?  message_2[ `d_OIV4_b : `d_OIV4_e ] : `defaut_infor ;

    assign OIV4_3   = ( message_en == 0 )? `defaut_infor : 
                      ( message_mux_control_m3 == `message_mux_d )?  message_3[ `d_OIV4_b : `d_OIV4_e ] : `defaut_infor ;
endmodule
