`include "para_def.v"
module stage2_type_control_module ( m1_category , m2_category , m3_category , 
                                    m1_type , m2_type , m3_type ,
                                    N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
                                    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
                                    block_size_control_m1 , block_size_control_m2 , block_size_control_m3 , 
                                    seq_number_control , 
                                    message_number_control , 
                                    block_control_m1 , block_control_m2 , block_control_m3 
                                   );
    input  m1_category , m2_category , m3_category , 
           m1_type , m2_type , m3_type ;
    output N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ,
           message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ,
           block_size_control_m1 , block_size_control_m2 , block_size_control_m3 , 
           seq_number_control , 
           message_number_control , 
           block_control_m1 , block_control_m2 , block_control_m3 ;
    
    wire [ `category_bits - 1 : 0 ]                     m1_category , m2_category , m3_category ;
    wire [ `type_bits - 1 : 0 ]                         m1_type , m2_type , m3_type ;
    wire [ `N_type_control_width - 1 : 0]               N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;
    wire [ `message_mux_control_width - 1 : 0 ]         message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `block_size_control_width - 1 : 0 ]          block_size_control_m1 , block_size_control_m2 , block_size_control_m3 ;
    wire [ `seq_number_control_width - 1 : 0 ]          seq_number_control ;
    wire [ `message_number_control_width - 1 : 0 ]      message_number_control ;
    wire [ `block_control_m_width - 1 : 0 ]             block_control_m1 , block_control_m2 , block_control_m3 ;
    
    // N-type
    assign N_type_control_m1 = ( m1_type == `L_u_ASCII )? `N_type_L :
                               ( m1_type == `M_u_ASCII )? `N_type_M :
                               ( m1_type == `N_u_ASCII )? `N_type_N :
                               ( m1_type == `R_u_ASCII )? `N_type_R :
                               ( m1_type == `S_u_ASCII )? `N_type_S : `N_type_defaut ;
    
    assign N_type_control_m2 = ( m2_type == `L_u_ASCII )? `N_type_L :
                               ( m2_type == `M_u_ASCII )? `N_type_M :
                               ( m2_type == `N_u_ASCII )? `N_type_N :
                               ( m2_type == `R_u_ASCII )? `N_type_R :
                               ( m2_type == `S_u_ASCII )? `N_type_S : `N_type_defaut ;

    assign N_type_control_m3 = ( m3_type == `L_u_ASCII )? `N_type_L :
                               ( m3_type == `M_u_ASCII )? `N_type_M :
                               ( m3_type == `N_u_ASCII )? `N_type_N :
                               ( m3_type == `R_u_ASCII )? `N_type_R :
                               ( m3_type == `S_u_ASCII )? `N_type_S : `N_type_defaut ;
    
    // message mux
    assign message_mux_control_m1 = ( m1_category == `a_l_ASCII )? `message_mux_a :
                                    ( m1_category == `d_l_ASCII )? `message_mux_d :
                                    ( m1_category == `k_l_ASCII )? `message_mux_k :
                                    ( m1_category == `q_l_ASCII )? `message_mux_q :
                                    ( m1_category == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;
    
    assign message_mux_control_m2 = ( m2_category == `a_l_ASCII )? `message_mux_a :
                                    ( m2_category == `d_l_ASCII )? `message_mux_d :
                                    ( m2_category == `k_l_ASCII )? `message_mux_k :
                                    ( m2_category == `q_l_ASCII )? `message_mux_q :
                                    ( m2_category == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;

    assign message_mux_control_m3 = ( m3_category == `a_l_ASCII )? `message_mux_a :
                                    ( m3_category == `d_l_ASCII )? `message_mux_d :
                                    ( m3_category == `k_l_ASCII )? `message_mux_k :
                                    ( m3_category == `q_l_ASCII )? `message_mux_q :
                                    ( m3_category == `N_u_ASCII )? `message_mux_N : `message_mux_defaut ;

    //block size
    assign block_size_control_m1  = ( m1_category == `a_l_ASCII )? `block_size_35 :
                                    ( m1_category == `d_l_ASCII )? `block_size_22 :
                                    ( m1_category == `k_l_ASCII )? `block_size_35 :
                                    ( m1_category == `q_l_ASCII )? `block_size_21 :
                                    ( m1_category == `N_u_ASCII )? `block_size_12 : `block_size_defaut ;
    
    assign block_size_control_m2  = ( m2_category == `a_l_ASCII )? `block_size_35 :
                                    ( m2_category == `d_l_ASCII )? `block_size_22 :
                                    ( m2_category == `k_l_ASCII )? `block_size_35 :
                                    ( m2_category == `q_l_ASCII )? `block_size_21 :
                                    ( m2_category == `N_u_ASCII )? `block_size_12 : `block_size_defaut ;
    
    assign block_size_control_m3  = ( m3_category == `a_l_ASCII )? `block_size_35 :
                                    ( m3_category == `d_l_ASCII )? `block_size_22 :
                                    ( m3_category == `k_l_ASCII )? `block_size_35 :
                                    ( m3_category == `q_l_ASCII )? `block_size_21 :
                                    ( m3_category == `N_u_ASCII )? `block_size_12 : `block_size_defaut ;
    
    //seq number 
    assign seq_number_control = ( ( m1_category != `N_u_ASCII ) && 
                                  ( m2_category != `N_u_ASCII ) && 
                                  ( m3_category != `N_u_ASCII ))? 1'b1 : 1'b0 ;
    
    
    //message number 
    assign message_number_control = ( ( m1_category != `none_ASCII ) && ( m2_category != `none_ASCII ) && ( m3_category != `none_ASCII ) )? `message_number_data_3 : 
                                    ( ( m1_category == `none_ASCII ) && ( m2_category != `none_ASCII ) && ( m3_category != `none_ASCII ) )? `message_number_data_2 : 
                                    ( ( m1_category != `none_ASCII ) && ( m2_category == `none_ASCII ) && ( m3_category != `none_ASCII ) )? `message_number_data_2 : 
                                    ( ( m1_category != `none_ASCII ) && ( m2_category != `none_ASCII ) && ( m3_category == `none_ASCII ) )? `message_number_data_2 :
                                    ( ( m1_category == `none_ASCII ) && ( m2_category == `none_ASCII ) && ( m3_category != `none_ASCII ) )? `message_number_data_1 : 
                                    ( ( m1_category == `none_ASCII ) && ( m2_category != `none_ASCII ) && ( m3_category == `none_ASCII ) )? `message_number_data_1 : 
                                    ( ( m1_category != `none_ASCII ) && ( m2_category == `none_ASCII ) && ( m3_category == `none_ASCII ) )? `message_number_data_1 : `message_number_data_0 ;
    
    //block control
    assign block_control_m1 = ( m1_category == `a_l_ASCII )? `block_control_m_35 :
                              ( m1_category == `d_l_ASCII )? `block_control_m_22 :
                              ( m1_category == `k_l_ASCII )? `block_control_m_35 :
                              ( m1_category == `q_l_ASCII )? `block_control_m_21 :
                              ( m1_category == `N_u_ASCII )? `block_control_m_12 : `block_control_m_defaut ;
    
    assign block_control_m2 = ( m2_category == `a_l_ASCII )? `block_control_m_35 :
                              ( m2_category == `d_l_ASCII )? `block_control_m_22 :
                              ( m2_category == `k_l_ASCII )? `block_control_m_35 :
                              ( m2_category == `q_l_ASCII )? `block_control_m_21 :
                              ( m2_category == `N_u_ASCII )? `block_control_m_12 : `block_control_m_defaut ;
    
    assign block_control_m3 = ( m3_category == `a_l_ASCII )? `block_control_m_35 :
                              ( m3_category == `d_l_ASCII )? `block_control_m_22 :
                              ( m3_category == `k_l_ASCII )? `block_control_m_35 :
                              ( m3_category == `q_l_ASCII )? `block_control_m_21 :
                              ( m3_category == `N_u_ASCII )? `block_control_m_12 : `block_control_m_defaut ;
    
    
    
endmodule
