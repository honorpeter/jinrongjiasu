`include "para_def.v"
module stage3_fast_message_mux_module ( message_fast_a_1 , message_fast_a_2 , message_fast_a_3 ,
                                        message_fast_d_1 , message_fast_d_2 , message_fast_d_3 ,
                                        message_fast_k_1 , message_fast_k_2 , message_fast_k_3 ,
                                        message_fast_q_1 , message_fast_q_2 , message_fast_q_3 ,
                                        message_fast_N_1 , message_fast_N_2 , message_fast_N_3 ,
                                        length_fast_a_1 , length_fast_a_2 , length_fast_a_3 ,
                                        length_fast_d_1 , length_fast_d_2 , length_fast_d_3 ,
                                        length_fast_k_1 , length_fast_k_2 , length_fast_k_3 ,
                                        length_fast_q_1 , length_fast_q_2 , length_fast_q_3 ,
                                        length_fast_N_1 , length_fast_N_2 , length_fast_N_3 ,
                                        message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
                                        message_fast_1 , message_fast_2 , message_fast_3 , 
                                        length_fast_1 , length_fast_2 , length_fast_3
                                        );
    
    input  message_fast_a_1 , message_fast_a_2 , message_fast_a_3 ,
           message_fast_d_1 , message_fast_d_2 , message_fast_d_3 ,
           message_fast_k_1 , message_fast_k_2 , message_fast_k_3 ,
           message_fast_q_1 , message_fast_q_2 , message_fast_q_3 ,
           message_fast_N_1 , message_fast_N_2 , message_fast_N_3 ,
           length_fast_a_1 , length_fast_a_2 , length_fast_a_3 ,
           length_fast_d_1 , length_fast_d_2 , length_fast_d_3 ,
           length_fast_k_1 , length_fast_k_2 , length_fast_k_3 ,
           length_fast_q_1 , length_fast_q_2 , length_fast_q_3 ,
           length_fast_N_1 , length_fast_N_2 , length_fast_N_3 ,
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
          
    output message_fast_1 , message_fast_2 , message_fast_3 , 
           length_fast_1 , length_fast_2 , length_fast_3 ;
    
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_a_1 , message_fast_a_2 , message_fast_a_3 ,
                                                     message_fast_d_1 , message_fast_d_2 , message_fast_d_3 ,
                                                     message_fast_k_1 , message_fast_k_2 , message_fast_k_3 ,
                                                     message_fast_q_1 , message_fast_q_2 , message_fast_q_3 ,
                                                     message_fast_N_1 , message_fast_N_2 , message_fast_N_3 ;                               
    wire [ `fast_length_bits - 1 : 0 ]               length_fast_a_1 , length_fast_a_2 , length_fast_a_3 ,
                                                     length_fast_d_1 , length_fast_d_2 , length_fast_d_3 ,
                                                     length_fast_k_1 , length_fast_k_2 , length_fast_k_3 ,
                                                     length_fast_q_1 , length_fast_q_2 , length_fast_q_3 ,
                                                     length_fast_N_1 , length_fast_N_2 , length_fast_N_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]      message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `fast_message_bits - 1 : 0 ]              message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `fast_length_bits - 1 : 0 ]               length_fast_1 , length_fast_2 , length_fast_3 ;
    
    assign message_fast_1 = ( message_mux_control_m1 == `message_mux_a )? message_fast_a_1 : 
                            ( message_mux_control_m1 == `message_mux_d )? message_fast_d_1 : 
                            ( message_mux_control_m1 == `message_mux_k )? message_fast_k_1 : 
                            ( message_mux_control_m1 == `message_mux_q )? message_fast_q_1 : 
                            ( message_mux_control_m1 == `message_mux_N )? message_fast_N_1 : 
                            `defaut_fast_message ;
    
    assign message_fast_2 = ( message_mux_control_m2 == `message_mux_a )? message_fast_a_2 : 
                            ( message_mux_control_m2 == `message_mux_d )? message_fast_d_2 : 
                            ( message_mux_control_m2 == `message_mux_k )? message_fast_k_2 : 
                            ( message_mux_control_m2 == `message_mux_q )? message_fast_q_2 : 
                            ( message_mux_control_m2 == `message_mux_N )? message_fast_N_2 : 
                            `defaut_fast_message ;
    
    assign message_fast_3 = ( message_mux_control_m3 == `message_mux_a )? message_fast_a_3 : 
                            ( message_mux_control_m3 == `message_mux_d )? message_fast_d_3 : 
                            ( message_mux_control_m3 == `message_mux_k )? message_fast_k_3 : 
                            ( message_mux_control_m3 == `message_mux_q )? message_fast_q_3 : 
                            ( message_mux_control_m3 == `message_mux_N )? message_fast_N_3 : 
                            `defaut_fast_message ;
    
    assign length_fast_1  = ( message_mux_control_m1 == `message_mux_a )? length_fast_a_1 : 
                            ( message_mux_control_m1 == `message_mux_d )? length_fast_d_1 : 
                            ( message_mux_control_m1 == `message_mux_k )? length_fast_k_1 : 
                            ( message_mux_control_m1 == `message_mux_q )? length_fast_q_1 : 
                            ( message_mux_control_m1 == `message_mux_N )? length_fast_N_1 : 
                            `defaut_fast_length ;
    
    assign length_fast_2  = ( message_mux_control_m2 == `message_mux_a )? length_fast_a_2 : 
                            ( message_mux_control_m2 == `message_mux_d )? length_fast_d_2 : 
                            ( message_mux_control_m2 == `message_mux_k )? length_fast_k_2 : 
                            ( message_mux_control_m2 == `message_mux_q )? length_fast_q_2 : 
                            ( message_mux_control_m2 == `message_mux_N )? length_fast_N_2 : 
                            `defaut_fast_length ;
    
    assign length_fast_3  = ( message_mux_control_m3 == `message_mux_a )? length_fast_a_3 : 
                            ( message_mux_control_m3 == `message_mux_d )? length_fast_d_3 : 
                            ( message_mux_control_m3 == `message_mux_k )? length_fast_k_3 : 
                            ( message_mux_control_m3 == `message_mux_q )? length_fast_q_3 : 
                            ( message_mux_control_m3 == `message_mux_N )? length_fast_N_3 : 
                            `defaut_fast_length ;

    
endmodule
