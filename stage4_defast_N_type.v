`include "para_def.v"
module stage4_defast_N_type_module ( message_NL_1 , message_NL_2 , message_NL_3 ,
                                     message_NM_1 , message_NM_2 , message_NM_3 ,
                                     message_NN_1 , message_NN_2 , message_NN_3 ,
                                     message_NR_1 , message_NR_2 , message_NR_3 ,
                                     message_NS_1 , message_NS_2 , message_NS_3 ,
                                     N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
                                     message_N_1 , message_N_2 , message_N_3  
                                     );
    input  message_NL_1 , message_NL_2 , message_NL_3 , 
           message_NM_1 , message_NM_2 , message_NM_3 , 
           message_NN_1 , message_NN_2 , message_NN_3 , 
           message_NR_1 , message_NR_2 , message_NR_3 , 
           message_NS_1 , message_NS_2 , message_NS_3 , 
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    output message_N_1 , message_N_2 , message_N_3 ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_NL_1 , message_NL_2 , message_NL_3 ,
                                             message_NM_1 , message_NM_2 , message_NM_3 ,
                                             message_NN_1 , message_NN_2 , message_NN_3 ,
                                             message_NR_1 , message_NR_2 , message_NR_3 ,
                                             message_NS_1 , message_NS_2 , message_NS_3 ;
    wire [ `N_type_control_width - 1 : 0]    N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_N_1 , message_N_2 , message_N_3;
    
    assign message_N_1 = ( N_type_control_m1 == `N_type_L )? message_NL_1 : 
                         ( N_type_control_m1 == `N_type_M )? message_NM_1 : 
                         ( N_type_control_m1 == `N_type_N )? message_NN_1 : 
                         ( N_type_control_m1 == `N_type_R )? message_NR_1 : 
                         ( N_type_control_m1 == `N_type_S )? message_NS_1 : 
                         `defaut_message ;
    
    assign message_N_2 = ( N_type_control_m2 == `N_type_L )? message_NL_2 : 
                         ( N_type_control_m2 == `N_type_M )? message_NM_2 : 
                         ( N_type_control_m2 == `N_type_N )? message_NN_2 : 
                         ( N_type_control_m2 == `N_type_R )? message_NR_2 : 
                         ( N_type_control_m2 == `N_type_S )? message_NS_2 : 
                         `defaut_message ;
    
    assign message_N_3 = ( N_type_control_m3 == `N_type_L )? message_NL_3 : 
                         ( N_type_control_m3 == `N_type_M )? message_NM_3 : 
                         ( N_type_control_m3 == `N_type_N )? message_NN_3 : 
                         ( N_type_control_m3 == `N_type_R )? message_NR_3 : 
                         ( N_type_control_m3 == `N_type_S )? message_NS_3 : 
                         `defaut_message ;
endmodule
