`include "para_def.v"
module stage2_opra_encode_module ( clk , rst_n , 
                                   original_data_1 , original_data_2 , original_data_3 , 
                                   message_en_in ,
                                   block_data_out , 
                                   message_en_out ,
                                   message_1_out , 
                                   message_2_out , 
                                   message_3_out , 
                                   N_type_control_m1_out ,
                                   N_type_control_m2_out ,
                                   N_type_control_m3_out ,
                                   message_mux_control_m1_out ,
                                   message_mux_control_m2_out ,
                                   message_mux_control_m3_out ,
                                   message_number_data_out 
                                  );
    input  clk , rst_n , 
           original_data_1 , original_data_2 , original_data_3 , 
           message_en_in ;
    output block_data_out , message_en_out , message_1_out , message_2_out , message_3_out , 
           N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
           message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out , 
           message_number_data_out ;
    
    wire                                           clk , rst_n ;
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ]       original_data_1 , original_data_2 , original_data_3 ;
    wire                                           message_en_in ;
    wire [ `max_block_bits - 1 : 0 ]               block_data_out ;
    wire                                           message_en_out ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1_out , message_2_out , message_3_out;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data_out ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_a_1 , message_a_2 , message_a_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_d_1 , message_d_2 , message_d_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_k_1 , message_k_2 , message_k_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_q_1 , message_q_2 , message_q_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_N_1 , message_N_2 , message_N_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_NL_1 , message_NL_2 , message_NL_3 ,
                                                   message_NM_1 , message_NM_2 , message_NM_3 ,
                                                   message_NN_1 , message_NN_2 , message_NN_3 ,
                                                   message_NR_1 , message_NR_2 , message_NR_3 ,
                                                   message_NS_1 , message_NS_2 , message_NS_3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1 , N_type_control_m2 , N_type_control_m3 ;    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1 , message_mux_control_m2 , message_mux_control_m3 ;
    wire [ `block_size_control_width - 1 : 0 ]     block_size_control_m1 , block_size_control_m2 , block_size_control_m3 ;
    wire [ `block_size_data_bits - 1 : 0 ]         block_size_data ;
    wire [ `seq_number_control_width - 1 : 0 ]     seq_number_control ;
    wire [ `seq_number_data_bits - 1 : 0 ]         seq_number_data ;
    wire [ `message_number_control_width - 1 : 0 ] message_number_control ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data ;
    wire [ `time_message_data_bits - 1 : 0 ]       time_message_data ;
    wire [ `check_sum_data_bits - 1 : 0 ]          check_sum_data ;
    wire [ `block_control_m_width - 1 : 0 ]        block_control_m1 , block_control_m2 , block_control_m3 ;
    wire [ `max_block_bits - 1 : 0 ]               block_data ;
    
    
    
    
    
    stage2_a_module stage2_a (
                              .data_a_1                                         ( original_data_1 ), 
                              .data_a_2                                         ( original_data_2 ), 
                              .data_a_3                                         ( original_data_3 ), 
                              .message_a_1                                      ( message_a_1 ), 
                              .message_a_2                                      ( message_a_2 ), 
                              .message_a_3                                      ( message_a_3 )
                              );
    
    stage2_d_module stage2_d (
                              .data_d_1                                         ( original_data_1 ), 
                              .data_d_2                                         ( original_data_2 ), 
                              .data_d_3                                         ( original_data_3 ), 
                              .message_d_1                                      ( message_d_1 ), 
                              .message_d_2                                      ( message_d_2 ), 
                              .message_d_3                                      ( message_d_3 )
                              );
    
    stage2_k_module stage2_k (
                              .data_k_1                                         ( original_data_1 ), 
                              .data_k_2                                         ( original_data_2 ), 
                              .data_k_3                                         ( original_data_3 ), 
                              .message_k_1                                      ( message_k_1 ), 
                              .message_k_2                                      ( message_k_2 ), 
                              .message_k_3                                      ( message_k_3 )
                              );
    
    stage2_q_module stage2_q (
                              .data_q_1                                         ( original_data_1 ), 
                              .data_q_2                                         ( original_data_2 ), 
                              .data_q_3                                         ( original_data_3 ), 
                              .message_q_1                                      ( message_q_1 ), 
                              .message_q_2                                      ( message_q_2 ), 
                              .message_q_3                                      ( message_q_3 )
                              );
    
    stage2_N_module stage2_N (
                              .data_N_1                                         ( original_data_1 ), 
                              .data_N_2                                         ( original_data_2 ), 
                              .data_N_3                                         ( original_data_3 ), 
                              .message_NL_1                                     ( message_NL_1 ), 
                              .message_NL_2                                     ( message_NL_2 ), 
                              .message_NL_3                                     ( message_NL_3 ),
                              .message_NM_1                                     ( message_NM_1 ), 
                              .message_NM_2                                     ( message_NM_2 ), 
                              .message_NM_3                                     ( message_NM_3 ),
                              .message_NN_1                                     ( message_NN_1 ), 
                              .message_NN_2                                     ( message_NN_2 ), 
                              .message_NN_3                                     ( message_NN_3 ),
                              .message_NR_1                                     ( message_NR_1 ), 
                              .message_NR_2                                     ( message_NR_2 ), 
                              .message_NR_3                                     ( message_NR_3 ),
                              .message_NS_1                                     ( message_NS_1 ), 
                              .message_NS_2                                     ( message_NS_2 ), 
                              .message_NS_3                                     ( message_NS_3 )
                              );
    
    stage2_N_type_module stage2_N_type (
                                        .message_NL_1                           ( message_NL_1 ), 
                                        .message_NL_2                           ( message_NL_2 ), 
                                        .message_NL_3                           ( message_NL_3 ),
                                        .message_NM_1                           ( message_NM_1 ), 
                                        .message_NM_2                           ( message_NM_2 ), 
                                        .message_NM_3                           ( message_NM_3 ),
                                        .message_NN_1                           ( message_NN_1 ), 
                                        .message_NN_2                           ( message_NN_2 ), 
                                        .message_NN_3                           ( message_NN_3 ),
                                        .message_NR_1                           ( message_NR_1 ), 
                                        .message_NR_2                           ( message_NR_2 ), 
                                        .message_NR_3                           ( message_NR_3 ),
                                        .message_NS_1                           ( message_NS_1 ), 
                                        .message_NS_2                           ( message_NS_2 ), 
                                        .message_NS_3                           ( message_NS_3 ),
                                        .N_type_control_m1                      ( N_type_control_m1 ),
                                        .N_type_control_m2                      ( N_type_control_m2 ),
                                        .N_type_control_m3                      ( N_type_control_m3 ),
                                        .message_N_1                            ( message_N_1 ),
                                        .message_N_2                            ( message_N_2 ),
                                        .message_N_3                            ( message_N_3 )
                                        );
    
    stage2_message_mux_module stage2_message_mux ( 
                                                  .message_a_1                  ( message_a_1 ), 
                                                  .message_a_2                  ( message_a_2 ), 
                                                  .message_a_3                  ( message_a_3 ),
                                                  .message_d_1                  ( message_d_1 ), 
                                                  .message_d_2                  ( message_d_2 ), 
                                                  .message_d_3                  ( message_d_3 ),
                                                  .message_k_1                  ( message_k_1 ), 
                                                  .message_k_2                  ( message_k_2 ), 
                                                  .message_k_3                  ( message_k_3 ),
                                                  .message_q_1                  ( message_q_1 ), 
                                                  .message_q_2                  ( message_q_2 ), 
                                                  .message_q_3                  ( message_q_3 ),
                                                  .message_N_1                  ( message_N_1 ), 
                                                  .message_N_2                  ( message_N_2 ), 
                                                  .message_N_3                  ( message_N_3 ),
                                                  .message_mux_control_m1       ( message_mux_control_m1 ), 
                                                  .message_mux_control_m2       ( message_mux_control_m2 ), 
                                                  .message_mux_control_m3       ( message_mux_control_m3 ),
                                                  .message_1                    ( message_1 ), 
                                                  .message_2                    ( message_2 ), 
                                                  .message_3                    ( message_3 )
                                                  );
    
    stage2_block_size_module stage2_block_size ( 
                                                .block_size_control_m1          ( block_size_control_m1 ), 
                                                .block_size_control_m2          ( block_size_control_m2 ), 
                                                .block_size_control_m3          ( block_size_control_m3 ), 
                                                .block_size_data                ( block_size_data )
                                                ); 
    
    stage2_seq_number_module stage2_seq_number ( 
                                                .rst_n                          ( rst_n ), 
                                                .clk                            ( clk ), 
                                                .message_en                     ( message_en_in ), 
                                                .seq_number_control             ( seq_number_control ), 
                                                .seq_number_data                ( seq_number_data )
                                                );
    
    stage2_message_number_module stage2_message_number ( 
                                                        .message_number_control ( message_number_control ), 
                                                        .message_number_data    ( message_number_data )
                                                        );
    
    stage2_time_message_module stage2_time_message (                                                     
                                                    .time_message_data          ( time_message_data )
                                                    );
    
    stage2_check_sum_module stage2_check_sum ( 
                                              .block_size_data                  ( block_size_data ), 
                                              .seq_number_data                  ( seq_number_data ),
                                              .message_number_data              ( message_number_data ), 
                                              .time_message_data                ( time_message_data ), 
                                              .message_1                        ( message_1 ), 
                                              .message_2                        ( message_2 ), 
                                              .message_3                        ( message_3 ),
                                              .check_sum_data                   ( check_sum_data )
                                              );
    stage2_block_module stage2_block ( 
                                      .block_size_data                          ( block_size_data ), 
                                      .seq_number_data                          ( seq_number_data ),
                                      .message_number_data                      ( message_number_data ), 
                                      .time_message_data                        ( time_message_data ), 
                                      .message_1                                ( message_1 ), 
                                      .message_2                                ( message_2 ), 
                                      .message_3                                ( message_3 ),
                                      .check_sum_data                           ( check_sum_data ),
                                      .block_control_m1                         ( block_control_m1 ), 
                                      .block_control_m2                         ( block_control_m2 ), 
                                      .block_control_m3                         ( block_control_m3 ),
                                      .block_data                               ( block_data )
                                      );
    
    stage2_type_control_module stage2_type_control ( 
                                                    .m1_category                ( original_data_1 [ `Message_Category_begin : `Message_Category_end ] ), 
                                                    .m2_category                ( original_data_2 [ `Message_Category_begin : `Message_Category_end ] ), 
                                                    .m3_category                ( original_data_3 [ `Message_Category_begin : `Message_Category_end ] ), 
                                                    .m1_type                    ( original_data_1 [ `Message_Type_begin : `Message_Type_end ] ), 
                                                    .m2_type                    ( original_data_2 [ `Message_Type_begin : `Message_Type_end ] ), 
                                                    .m3_type                    ( original_data_3 [ `Message_Type_begin : `Message_Type_end ] ),
                                                    .N_type_control_m1          ( N_type_control_m1 ), 
                                                    .N_type_control_m2          ( N_type_control_m2 ), 
                                                    .N_type_control_m3          ( N_type_control_m3 ),
                                                    .message_mux_control_m1     ( message_mux_control_m1 ), 
                                                    .message_mux_control_m2     ( message_mux_control_m2 ), 
                                                    .message_mux_control_m3     ( message_mux_control_m3 ),
                                                    .block_size_control_m1      ( block_size_control_m1 ), 
                                                    .block_size_control_m2      ( block_size_control_m2 ), 
                                                    .block_size_control_m3      ( block_size_control_m3 ),
                                                    .seq_number_control         ( seq_number_control ), 
                                                    .message_number_control     ( message_number_control ), 
                                                    .block_control_m1           ( block_control_m1 ), 
                                                    .block_control_m2           ( block_control_m2 ), 
                                                    .block_control_m3           ( block_control_m3 )
                                                    );
    stage2_reg_module stage2_reg ( 
                                  .clk                                          ( clk ), 
                                  .rst_n                                        ( rst_n ), 
                                  .block_data_in                                ( block_data ), 
                                  .message_en_in                                ( message_en_in ),
                                  .message_1_in                                 ( message_1 ), 
                                  .message_2_in                                 ( message_2 ), 
                                  .message_3_in                                 ( message_3 ),
                                  .N_type_control_m1_in                         ( N_type_control_m1 ), 
                                  .N_type_control_m2_in                         ( N_type_control_m2 ),
                                  .N_type_control_m3_in                         ( N_type_control_m3 ),
                                  .message_mux_control_m1_in                    ( message_mux_control_m1 ), 
                                  .message_mux_control_m2_in                    ( message_mux_control_m2 ), 
                                  .message_mux_control_m3_in                    ( message_mux_control_m3 ),
                                  .message_number_data_in                       ( message_number_data ),
                                  .block_data_out                               ( block_data_out ), 
                                  .message_en_out                               ( message_en_out ),
                                  .message_1_out                                ( message_1_out ), 
                                  .message_2_out                                ( message_2_out ), 
                                  .message_3_out                                ( message_3_out ),
                                  .N_type_control_m1_out                        ( N_type_control_m1_out ), 
                                  .N_type_control_m2_out                        ( N_type_control_m2_out ), 
                                  .N_type_control_m3_out                        ( N_type_control_m3_out ),
                                  .message_mux_control_m1_out                   ( message_mux_control_m1_out ), 
                                  .message_mux_control_m2_out                   ( message_mux_control_m2_out ), 
                                  .message_mux_control_m3_out                   ( message_mux_control_m3_out ),
                                  .message_number_data_out                      ( message_number_data_out )
                                  );
    
    
endmodule
    