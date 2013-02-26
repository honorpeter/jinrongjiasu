`include "para_def.v"
module stage2_message_mux_module ( message_a_1 , message_a_2 , message_a_3 ,
                                   message_d_1 , message_d_2 , message_d_3 ,
                                   message_k_1 , message_k_2 , message_k_3 ,
                                   message_q_1 , message_q_2 , message_q_3 ,
                                   message_N_1 , message_N_2 , message_N_3 ,
                                   message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
                                   message_1 , message_2 , message_3
                                 );
    
    input  message_a_1 , message_a_2 , message_a_3 ,
           message_d_1 , message_d_2 , message_d_3 ,
           message_k_1 , message_k_2 , message_k_3 ,
           message_q_1 , message_q_2 , message_q_3 ,
           message_N_1 , message_N_2 , message_N_3 ,
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
          
    output message_1 , message_2 , message_3 ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]              message_a_1 , message_a_2 , message_a_3 ,
                                                    message_d_1 , message_d_2 , message_d_3 ,
                                                    message_k_1 , message_k_2 , message_k_3 ,
                                                    message_q_1 , message_q_2 , message_q_3 ,
                                                    message_N_1 , message_N_2 , message_N_3 ;                               
    wire [ `message_mux_control_width - 1 : 0 ]     message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]              message_1 , message_2 , message_3 ;
    
    assign message_1 = ( message_mux_control_m1 == `message_mux_a )? message_a_1 : 
                       ( message_mux_control_m1 == `message_mux_d )? message_d_1 : 
                       ( message_mux_control_m1 == `message_mux_k )? message_k_1 : 
                       ( message_mux_control_m1 == `message_mux_q )? message_q_1 : 
                       ( message_mux_control_m1 == `message_mux_N )? message_N_1 : 
                       `defaut_message;
    
    assign message_2 = ( message_mux_control_m2 == `message_mux_a )? message_a_2 : 
                       ( message_mux_control_m2 == `message_mux_d )? message_d_2 : 
                       ( message_mux_control_m2 == `message_mux_k )? message_k_2 : 
                       ( message_mux_control_m2 == `message_mux_q )? message_q_2 : 
                       ( message_mux_control_m2 == `message_mux_N )? message_N_2 : 
                       `defaut_message;
    
    assign message_3 = ( message_mux_control_m3 == `message_mux_a )? message_a_3 : 
                       ( message_mux_control_m3 == `message_mux_d )? message_d_3 : 
                       ( message_mux_control_m3 == `message_mux_k )? message_k_3 : 
                       ( message_mux_control_m3 == `message_mux_q )? message_q_3 : 
                       ( message_mux_control_m3 == `message_mux_N )? message_N_3 : 
                       `defaut_message;
                       
endmodule
