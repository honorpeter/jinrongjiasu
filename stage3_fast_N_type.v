`include "para_def.v"
module stage3_fast_N_type_module ( message_fast_NL_1 , message_fast_NL_2 , message_fast_NL_3 ,
                                   message_fast_NM_1 , message_fast_NM_2 , message_fast_NM_3 ,
                                   message_fast_NN_1 , message_fast_NN_2 , message_fast_NN_3 ,
                                   message_fast_NR_1 , message_fast_NR_2 , message_fast_NR_3 ,
                                   message_fast_NS_1 , message_fast_NS_2 , message_fast_NS_3 ,
                                   length_fast_NL_1 , length_fast_NL_2 , length_fast_NL_3 ,
                                   length_fast_NM_1 , length_fast_NM_2 , length_fast_NM_3 ,
                                   length_fast_NN_1 , length_fast_NN_2 , length_fast_NN_3 ,
                                   length_fast_NR_1 , length_fast_NR_2 , length_fast_NR_3 ,
                                   length_fast_NS_1 , length_fast_NS_2 , length_fast_NS_3 ,
                                   N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
                                   message_fast_N_1 , message_fast_N_2 , message_fast_N_3 , 
                                   length_fast_N_1 , length_fast_N_2 , length_fast_N_3 
                                   );
    input  message_fast_NL_1 , message_fast_NL_2 , message_fast_NL_3 , 
           message_fast_NM_1 , message_fast_NM_2 , message_fast_NM_3 , 
           message_fast_NN_1 , message_fast_NN_2 , message_fast_NN_3 , 
           message_fast_NR_1 , message_fast_NR_2 , message_fast_NR_3 , 
           message_fast_NS_1 , message_fast_NS_2 , message_fast_NS_3 , 
           length_fast_NL_1 , length_fast_NL_2 , length_fast_NL_3 ,
           length_fast_NM_1 , length_fast_NM_2 , length_fast_NM_3 ,
           length_fast_NN_1 , length_fast_NN_2 , length_fast_NN_3 ,
           length_fast_NR_1 , length_fast_NR_2 , length_fast_NR_3 ,
           length_fast_NS_1 , length_fast_NS_2 , length_fast_NS_3 ,
           N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    output message_fast_N_1 , message_fast_N_2 , message_fast_N_3 , 
           length_fast_N_1 , length_fast_N_2 , length_fast_N_3 ;
    
    wire [ `fast_message_bits - 1 : 0 ]      message_fast_NL_1 , message_fast_NL_2 , message_fast_NL_3 ,
                                             message_fast_NM_1 , message_fast_NM_2 , message_fast_NM_3 ,
                                             message_fast_NN_1 , message_fast_NN_2 , message_fast_NN_3 ,
                                             message_fast_NR_1 , message_fast_NR_2 , message_fast_NR_3 ,
                                             message_fast_NS_1 , message_fast_NS_2 , message_fast_NS_3 ;
    wire [ `fast_length_bits - 1 : 0 ]       length_fast_NL_1 , length_fast_NL_2 , length_fast_NL_3 ,
                                             length_fast_NM_1 , length_fast_NM_2 , length_fast_NM_3 ,
                                             length_fast_NN_1 , length_fast_NN_2 , length_fast_NN_3 ,
                                             length_fast_NR_1 , length_fast_NR_2 , length_fast_NR_3 ,
                                             length_fast_NS_1 , length_fast_NS_2 , length_fast_NS_3 ;
    wire [ `N_type_control_width - 1 : 0]    N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `fast_message_bits - 1 : 0 ]      message_fast_N_1 , message_fast_N_2 , message_fast_N_3;
    wire [ `fast_length_bits - 1 : 0 ]       length_fast_N_1 , length_fast_N_2 , length_fast_N_3 ;
    
    assign message_fast_N_1 = ( N_type_control_m1 == `N_type_L )? message_fast_NL_1 : 
                              ( N_type_control_m1 == `N_type_M )? message_fast_NM_1 : 
                              ( N_type_control_m1 == `N_type_N )? message_fast_NN_1 : 
                              ( N_type_control_m1 == `N_type_R )? message_fast_NR_1 : 
                              ( N_type_control_m1 == `N_type_S )? message_fast_NS_1 : 
                              `defaut_fast_message ;
    
    assign message_fast_N_2 = ( N_type_control_m2 == `N_type_L )? message_fast_NL_2 : 
                              ( N_type_control_m2 == `N_type_M )? message_fast_NM_2 : 
                              ( N_type_control_m2 == `N_type_N )? message_fast_NN_2 : 
                              ( N_type_control_m2 == `N_type_R )? message_fast_NR_2 : 
                              ( N_type_control_m2 == `N_type_S )? message_fast_NS_2 : 
                              `defaut_fast_message ;
    
    assign message_fast_N_3 = ( N_type_control_m3 == `N_type_L )? message_fast_NL_3 : 
                              ( N_type_control_m3 == `N_type_M )? message_fast_NM_3 : 
                              ( N_type_control_m3 == `N_type_N )? message_fast_NN_3 : 
                              ( N_type_control_m3 == `N_type_R )? message_fast_NR_3 : 
                              ( N_type_control_m3 == `N_type_S )? message_fast_NS_3 : 
                              `defaut_fast_message ;

    assign length_fast_N_1  = ( N_type_control_m1 == `N_type_L )? length_fast_NL_1 : 
                              ( N_type_control_m1 == `N_type_M )? length_fast_NM_1 : 
                              ( N_type_control_m1 == `N_type_N )? length_fast_NN_1 : 
                              ( N_type_control_m1 == `N_type_R )? length_fast_NR_1 : 
                              ( N_type_control_m1 == `N_type_S )? length_fast_NS_1 : 
                              `defaut_fast_length ;
    
    assign length_fast_N_2  = ( N_type_control_m2 == `N_type_L )? length_fast_NL_2 : 
                              ( N_type_control_m2 == `N_type_M )? length_fast_NM_2 : 
                              ( N_type_control_m2 == `N_type_N )? length_fast_NN_2 : 
                              ( N_type_control_m2 == `N_type_R )? length_fast_NR_2 : 
                              ( N_type_control_m2 == `N_type_S )? length_fast_NS_2 : 
                              `defaut_fast_length ;
    
    assign length_fast_N_3  = ( N_type_control_m3 == `N_type_L )? length_fast_NL_3 : 
                              ( N_type_control_m3 == `N_type_M )? length_fast_NM_3 : 
                              ( N_type_control_m3 == `N_type_N )? length_fast_NN_3 : 
                              ( N_type_control_m3 == `N_type_R )? length_fast_NR_3 : 
                              ( N_type_control_m3 == `N_type_S )? length_fast_NS_3 : 
                              `defaut_fast_length ;
endmodule
