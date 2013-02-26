///////////////////////////////////////////////////////////////////////////////////////
`define MAX_ORIGINAL_DATA_BYTES                   33
`define MAX_ORIGINAL_DATA_BITS                    ( `MAX_ORIGINAL_DATA_BYTES * 8 )
`define MAX_MESSAGE_BYTES                         35
`define MAX_MESSAGE_BITS                          ( `MAX_MESSAGE_BYTES * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
//error
`define defaut_message                            { `MAX_MESSAGE_BITS {1'b0}}
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// message head
// width 
`define Participant_ID_width                      ( 8 * 1 )
`define Message_Category_width                    ( 8 * 1 )
`define Message_Type_width                        ( 8 * 1 )
  //message head , one reserved
`define message_head_reserved_width               ( 8 * 1 )

// position
`define Participant_ID_begin                      ( `MAX_ORIGINAL_DATA_BITS - 1 )
`define Participant_ID_end                        ( `Participant_ID_begin - `Participant_ID_width  + 1 ) 
`define Message_Category_begin                    ( `Participant_ID_end - 1 ) 
`define Message_Category_end                      ( `Message_Category_begin - `Message_Category_width  + 1 ) 
`define Message_Type_begin                        ( `Message_Category_end - 1 ) 
`define Message_Type_end                          ( `Message_Type_begin - `Message_Type_width  + 1 ) 
  //message head , one reserved 1 Bytes
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// Category a
// width 
`define a_Security_Symbol_width                   ( 8 * 5 ) 
// Category a , one reserved   ( 8 * 1 ) 
`define a_reserved_1_width                        ( 8 * 1 ) 
`define a_Expiration_Block_width                  ( 8 * 3 ) 
`define a_Strike_Price_Denominator_Code_width     ( 8 * 1 ) 
`define a_Strike_Price_width                      ( 8 * 4 ) 
`define a_Volume_width                            ( 8 * 4 ) 
`define a_Premium_Price_Denominator_Code_width    ( 8 * 1 ) 
`define a_Premium_Price_width                     ( 8 * 4 ) 
`define a_Trade_Identifier_width                  ( 8 * 4 ) 
// Category a , another reserved   ( 8 * 4 ) 
`define a_reserved_2_width                        ( 8 * 4 ) 
  
// position
`define a_Security_Symbol_begin                   ( `Message_Type_end - 1 ) 
`define a_Security_Symbol_end                     ( `a_Security_Symbol_begin - `a_Security_Symbol_width  + 1 ) 
  // Category a , one reserved 1 Bytes
`define a_Expiration_Block_begin                  ( `a_Security_Symbol_end - 1 ) 
`define a_Expiration_Block_end                    ( `a_Expiration_Block_begin - `a_Expiration_Block_width  + 1 ) 
`define a_Strike_Price_Denominator_Code_begin     ( `a_Expiration_Block_end - 1 ) 
`define a_Strike_Price_Denominator_Code_end       ( `a_Strike_Price_Denominator_Code_begin - `a_Strike_Price_Denominator_Code_width  + 1 ) 
`define a_Strike_Price_begin                      ( `a_Strike_Price_Denominator_Code_end - 1 ) 
`define a_Strike_Price_end                        ( `a_Strike_Price_begin - `a_Strike_Price_width  + 1 ) 
`define a_Volume_begin                            ( `a_Strike_Price_end - 1 ) 
`define a_Volume_end                              ( `a_Volume_begin - `a_Volume_width  + 1 ) 
`define a_Premium_Price_Denominator_Code_begin    ( `a_Volume_end - 1 ) 
`define a_Premium_Price_Denominator_Code_end      ( `a_Premium_Price_Denominator_Code_begin - `a_Premium_Price_Denominator_Code_width  + 1 ) 
`define a_Premium_Price_begin                     ( `a_Premium_Price_Denominator_Code_end - 1 ) 
`define a_Premium_Price_end                       ( `a_Premium_Price_begin - `a_Premium_Price_width  + 1 ) 
`define a_Trade_Identifier_begin                  ( `a_Premium_Price_end - 1 ) 
`define a_Trade_Identifier_end                    ( `a_Trade_Identifier_begin - `a_Trade_Identifier_width  + 1 ) 
  // Category a , one reserved 4 Bytes
 
// rest bits
`define a_total_bytes                             35
`define a_rest_bits                               (( `MAX_MESSAGE_BYTES - `a_total_bytes ) * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// Category d
// width 
`define d_Security_Symbol_width                   ( 8 * 5 ) 
  // Category d , one reserved   ( 8 * 1 ) 
`define d_reserved_1_width                        ( 8 * 1 )
`define d_Expiration_Block_width                  ( 8 * 3 ) 
`define d_Strike_Price_Denominator_Code_width     ( 8 * 1 ) 
`define d_Strike_Price_width                      ( 8 * 4 ) 
`define d_Open_Interest_Volume_width              ( 8 * 4 ) 
  
// position
`define d_Security_Symbol_begin                   ( `Message_Type_end - 1 ) 
`define d_Security_Symbol_end                     ( `d_Security_Symbol_begin - `d_Security_Symbol_width  + 1 ) 
  // Category d , one reserved 1 Bytes
`define d_Expiration_Block_begin                  ( `d_Security_Symbol_end - 1 ) 
`define d_Expiration_Block_end                    ( `d_Expiration_Block_begin - `d_Expiration_Block_width  + 1 ) 
`define d_Strike_Price_Denominator_Code_begin     ( `d_Expiration_Block_end - 1 ) 
`define d_Strike_Price_Denominator_Code_end       ( `d_Strike_Price_Denominator_Code_begin - `d_Strike_Price_Denominator_Code_width  + 1 ) 
`define d_Strike_Price_begin                      ( `d_Strike_Price_Denominator_Code_end - 1 ) 
`define d_Strike_Price_end                        ( `d_Strike_Price_begin - `d_Strike_Price_width  + 1 ) 
`define d_Open_Interest_Volume_begin              ( `d_Strike_Price_end - 1 ) 
`define d_Open_Interest_Volume_end                ( `d_Open_Interest_Volume_begin - `d_Open_Interest_Volume_width  + 1 )
 
// rest bits
`define d_total_bytes                             22
`define d_rest_bits                               (( `MAX_MESSAGE_BYTES - `d_total_bytes ) * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
//Category k
// width 
`define k_Security_Symbol_width                   ( 8 * 5 ) 
  // Category k , one reserved   ( 8 * 1 ) 
`define k_reserved_1_width                        ( 8 * 1 ) 
`define k_Expiration_Block_width                  ( 8 * 3 ) 
`define k_Strike_Price_Denominator_Code_width     ( 8 * 1 ) 
`define k_Strike_Price_width                      ( 8 * 4 ) 
`define k_Premium_Price_Denominator_Code_width    ( 8 * 1 ) 
`define k_Bid_Price_width                         ( 8 * 4 )
`define k_Bid_Size_width                          ( 8 * 4 ) 
`define k_Offer_Price_width                       ( 8 * 4 )
`define k_Offer_Size_width                        ( 8 * 4 )  
  
// position
`define k_Security_Symbol_begin                   ( `Message_Type_end - 1 ) 
`define k_Security_Symbol_end                     ( `k_Security_Symbol_begin - `k_Security_Symbol_width  + 1 ) 
  // Category k , one reserved 1 Bytes
`define k_Expiration_Block_begin                  ( `k_Security_Symbol_end - 1 ) 
`define k_Expiration_Block_end                    ( `k_Expiration_Block_begin - `k_Expiration_Block_width  + 1 ) 
`define k_Strike_Price_Denominator_Code_begin     ( `k_Expiration_Block_end - 1 ) 
`define k_Strike_Price_Denominator_Code_end       ( `k_Strike_Price_Denominator_Code_begin - `k_Strike_Price_Denominator_Code_width  + 1 ) 
`define k_Strike_Price_begin                      ( `k_Strike_Price_Denominator_Code_end - 1 ) 
`define k_Strike_Price_end                        ( `k_Strike_Price_begin - `k_Strike_Price_width  + 1 ) 
`define k_Premium_Price_Denominator_Code_begin    ( `k_Strike_Price_end - 1 ) 
`define k_Premium_Price_Denominator_Code_end      ( `k_Premium_Price_Denominator_Code_begin - `k_Premium_Price_Denominator_Code_width  + 1 ) 
`define k_Bid_Price_begin                         ( `k_Premium_Price_Denominator_Code_end - 1 ) 
`define k_Bid_Price_end                           ( `k_Bid_Price_begin - `k_Bid_Price_width  + 1 ) 
`define k_Bid_Size_begin                          ( `k_Bid_Price_end - 1 ) 
`define k_Bid_Size_end                            ( `k_Bid_Size_begin - `k_Bid_Size_width  + 1 )
`define k_Offer_Price_begin                       ( `k_Bid_Size_end - 1 ) 
`define k_Offer_Price_end                         ( `k_Offer_Price_begin - `k_Offer_Price_width  + 1 ) 
`define k_Offer_Size_begin                        ( `k_Offer_Price_end - 1 ) 
`define k_Offer_Size_end                          ( `k_Offer_Size_begin - `k_Offer_Size_width  + 1 ) 
 
// rest bits
`define k_total_bytes                             35
`define k_rest_bits                               (( `MAX_MESSAGE_BYTES - `k_total_bytes ) * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// Category q
// width 
`define q_Security_Symbol_width                   ( 8 * 4 ) 
`define q_Expiration_Block_width                  ( 8 * 3 )  
`define q_Strike_Price_width                      ( 8 * 2 ) 
`define q_Bid_Price_width                         ( 8 * 2 )
`define q_Bid_Size_width                          ( 8 * 2 ) 
`define q_Offer_Price_width                       ( 8 * 2 )
`define q_Offer_Size_width                        ( 8 * 2 )  
  
// position
`define q_Security_Symbol_begin                   ( `Message_Type_end - 1 ) 
`define q_Security_Symbol_end                     ( `q_Security_Symbol_begin - `q_Security_Symbol_width  + 1 ) 
`define q_Expiration_Block_begin                  ( `q_Security_Symbol_end - 1 ) 
`define q_Expiration_Block_end                    ( `q_Expiration_Block_begin - `q_Expiration_Block_width  + 1 ) 
`define q_Strike_Price_begin                      ( `q_Expiration_Block_end - 1 ) 
`define q_Strike_Price_end                        ( `q_Strike_Price_begin - `q_Strike_Price_width  + 1 ) 
`define q_Bid_Price_begin                         ( `q_Strike_Price_end - 1 ) 
`define q_Bid_Price_end                           ( `q_Bid_Price_begin - `q_Bid_Price_width  + 1 ) 
`define q_Bid_Size_begin                          ( `q_Bid_Price_end - 1 ) 
`define q_Bid_Size_end                            ( `q_Bid_Size_begin - `q_Bid_Size_width  + 1 )
`define q_Offer_Price_begin                       ( `q_Bid_Size_end - 1 ) 
`define q_Offer_Price_end                         ( `q_Offer_Price_begin - `q_Offer_Price_width  + 1 ) 
`define q_Offer_Size_begin                        ( `q_Offer_Price_end - 1 ) 
`define q_Offer_Size_end                          ( `q_Offer_Size_begin - `q_Offer_Size_width  + 1 ) 
 
// rest bits
`define q_total_bytes                             21
`define q_rest_bits                               (( `MAX_MESSAGE_BYTES - `q_total_bytes ) * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// Category N
// width 
// Category N Type L
  // Category N Type L , one reserved   ( 8 * 4 ) 
`define NL_reserved_1_width                       ( 8 * 4 )
  // Category N Type L , another reserved   ( 8 * 4 ) 
`define NL_reserved_2_width                       ( 8 * 4 )

// Category N Type M
`define NM_Block_Sequency_Number_width            ( 8 * 4 )
  // Category N Type M , one reserved   ( 8 * 4 ) 
`define NM_reserved_1_width                       ( 8 * 4 )

// Category N Type N
`define NN_Expected_Block_Sequency_Number_width   ( 8 * 4 )
`define NN_Received_Block_Sequency_Number_width   ( 8 * 4 )

// Category N Type R
  // Category N Type R , one reserved   ( 8 * 8 ) 
`define NR_reserved_1_width                       ( 8 * 8 )

//Category N Type S
`define NS_Message_Count_width                    ( 8 * 8 )
  
// position
`define NM_Block_Sequency_Number_begin            ( `Message_Type_end - 1 )
`define NM_Block_Sequency_Number_end              ( `NM_Block_Sequency_Number_begin - `NM_Block_Sequency_Number_width  + 1 ) 

`define NN_Expected_Block_Sequency_Number_begin   ( `Message_Type_end - 1 )
`define NN_Expected_Block_Sequency_Number_end     ( `NN_Expected_Block_Sequency_Number_begin - `NN_Expected_Block_Sequency_Number_width  + 1 ) 
`define NN_Received_Block_Sequency_Number_begin   ( `NN_Expected_Block_Sequency_Number_end - 1 )
`define NN_Received_Block_Sequency_Number_end     ( `NN_Received_Block_Sequency_Number_begin - `NN_Received_Block_Sequency_Number_width  + 1 ) 

`define NS_Message_Count_begin                    ( `Message_Type_end - 1 )
`define NS_Message_Count_end                      ( `NS_Message_Count_begin - `NS_Message_Count_width  + 1 ) 


// rest bits
`define N_total_bytes                             12
`define N_rest_bits                               (( `MAX_MESSAGE_BYTES - `N_total_bytes ) * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// N_type_control
`define N_type_control_width                      3
`define N_type_L                                  ( 3'b000 )
`define N_type_M                                  ( 3'b001 )
`define N_type_N                                  ( 3'b010 )
`define N_type_R                                  ( 3'b011 )
`define N_type_S                                  ( 3'b100 )
`define N_type_defaut                             ( 3'b111 )
///////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////
// message_mux_control
`define message_mux_control_width                 3
`define message_mux_a                             ( 3'b000 )
`define message_mux_d                             ( 3'b001 )
`define message_mux_k                             ( 3'b010 )
`define message_mux_q                             ( 3'b011 )
`define message_mux_N                             ( 3'b100 )
`define message_mux_defaut                        ( 3'b111 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// block_size_control
`define block_size_control_width                  3
`define block_size_35                             ( 3'b000 )
`define block_size_22                             ( 3'b001 )
`define block_size_21                             ( 3'b010 )
`define block_size_12                             ( 3'b011 )
`define block_size_defaut                         ( 3'b111 )
`define block_size_data_bytes                     2
`define block_size_data_bits                      ( `block_size_data_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// seq_number_control
`define seq_number_control_width                  1
`define seq_number_add                            ( 1'b1 )
`define seq_number_keep                           ( 1'b0 )
`define seq_number_data_bytes                     4
`define seq_number_data_bits                      ( `seq_number_data_bytes * 8 )
`define seq_number_data_initial                   { `seq_number_data_bits {1'b0}}
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// message_number_control
`define message_number_control_width              2
`define message_number_0                          ( 2'b00 )
`define message_number_1                          ( 2'b01 )
`define message_number_2                          ( 2'b10 )
`define message_number_3                          ( 2'b11 )
`define message_number_data_bytes                 1
`define message_number_data_bits                  ( `message_number_data_bytes * 8 )
`define message_number_data_0                     { {( `message_number_data_bits - `message_number_control_width ) {1'b0}} , `message_number_0 }
`define message_number_data_1                     { {( `message_number_data_bits - `message_number_control_width ) {1'b0}} , `message_number_1 }
`define message_number_data_2                     { {( `message_number_data_bits - `message_number_control_width ) {1'b0}} , `message_number_2 }
`define message_number_data_3                     { {( `message_number_data_bits - `message_number_control_width ) {1'b0}} , `message_number_3 }
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// time_data
`define time_message_data_bytes                   8
`define time_message_data_bits                    ( `time_message_data_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// check_sum
`define check_sum_data_bytes                      2
`define check_sum_mid_data_bytes                  4
`define check_sum_data_bits                       ( `check_sum_data_bytes * 8 )
`define check_sum_mid_data_bits                   ( `check_sum_mid_data_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// block
`define block_control_m_width                     3
`define block_control_m_35                        ( 3'b000 )
`define block_control_m_22                        ( 3'b001 )
`define block_control_m_21                        ( 3'b010 )
`define block_control_m_12                        ( 3'b011 )
`define block_control_m_defaut                    ( 3'b111 )
`define max_block_bytes                           126
`define max_block_bits                            ( `max_block_bytes * 8 )
`define block_header_bytes                        21
`define block_header_bits                         ( `block_header_bytes * 8 )
`define bytes_35                                  35
`define bytes_22                                  22
`define bytes_21                                  21
`define bytes_12                                  12
`define bits_35                                   ( `bytes_35 * 8 )
`define bits_22                                   ( `bytes_22 * 8 )
`define bits_21                                   ( `bytes_21 * 8 )
`define bits_12                                   ( `bytes_12 * 8 )
`define m_begin                                   ( `MAX_MESSAGE_BITS - 1)
`define end_35                                    ( `m_begin - `bits_35 + 1 )
`define end_22                                    ( `m_begin - `bits_22 + 1 )
`define end_21                                    ( `m_begin - `bits_21 + 1 )
`define end_12                                    ( `m_begin - `bits_12 + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
//  control
`define category_bytes                            1
`define category_bits                             ( `category_bytes * 8 )
`define type_bytes                                1
`define type_bits                                 ( `type_bytes * 8 )

`define L_u_ASCII                                 8'b01001100
`define M_u_ASCII                                 8'b01001101
`define N_u_ASCII                                 8'b01001110
`define R_u_ASCII                                 8'b01010010
`define S_u_ASCII                                 8'b01010011
`define a_l_ASCII                                 8'b01100001
`define d_l_ASCII                                 8'b01100100
`define k_l_ASCII                                 8'b01101011
`define q_l_ASCII                                 8'b01110001
`define none_ASCII                                8'b00000000
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast all
`define field_BT8_bytes                           8
`define field_BT8_bits                            ( `field_BT8_bytes * 8 ) 
`define field_PID1_bytes                          1
`define field_PID1_bits                           ( `field_PID1_bytes * 8 )
`define field_MC1_bytes                           1
`define field_MC1_bits                            ( `field_MC1_bytes * 8 )
`define field_MT1_bytes                           1
`define field_MT1_bits                            ( `field_MT1_bytes * 8 )
`define field_MH_reserved_bytes                   1
`define field_MH_reserved_bits                    ( `field_MH_reserved_bytes * 8 )


`define field_SS5_bytes                           5
`define field_SS5_bits                            ( `field_SS5_bytes * 8 )
`define field_EB3_bytes                           3
`define field_EB3_bits                            ( `field_EB3_bytes * 8 )
`define field_SPDC1_bytes                         1
`define field_SPDC1_bits                          ( `field_SPDC1_bytes * 8 )
`define field_SP4_bytes                           4
`define field_SP4_bits                            ( `field_SP4_bytes * 8 )
`define field_V4_bytes                            4
`define field_V4_bits                             ( `field_V4_bytes * 8 )
`define field_PPDC1_bytes                         1
`define field_PPDC1_bits                          ( `field_PPDC1_bytes * 8 )
`define field_PP4_bytes                           4
`define field_PP4_bits                            ( `field_PP4_bytes * 8 )
`define field_TI4_bytes                           4
`define field_TI4_bits                            ( `field_TI4_bytes * 8 )

`define field_OIV4_bytes                          4
`define field_OIV4_bits                           ( `field_OIV4_bytes * 8 )

`define field_BP4_bytes                           4
`define field_BP4_bits                            ( `field_BP4_bytes * 8 )
`define field_BS4_bytes                           4
`define field_BS4_bits                            ( `field_BS4_bytes * 8 )
`define field_OP4_bytes                           4
`define field_OP4_bits                            ( `field_OP4_bytes * 8 )
`define field_OS4_bytes                           4
`define field_OS4_bits                            ( `field_OS4_bytes * 8 )

`define field_SS4_bytes                           4
`define field_SS4_bits                            ( `field_SS5_bytes * 8 )
`define field_SP2_bytes                           2
`define field_SP2_bits                            ( `field_SP4_bytes * 8 )
`define field_BP2_bytes                           2
`define field_BP2_bits                            ( `field_BP4_bytes * 8 )
`define field_BS2_bytes                           2
`define field_BS2_bits                            ( `field_BS4_bytes * 8 )
`define field_OP2_bytes                           2
`define field_OP2_bits                            ( `field_OP4_bytes * 8 )
`define field_OS2_bytes                           2
`define field_OS2_bits                            ( `field_OS4_bytes * 8 )

`define field_BSN4_bytes                          4
`define field_BSN4_bits                           ( `field_BSN4_bytes * 8 )
`define field_EBSN4_bytes                         4
`define field_EBSN4_bits                          ( `field_EBSN4_bytes * 8 )
`define field_RBSN4_bytes                         4
`define field_RBSN4_bits                          ( `field_RBSN4_bytes * 8 )
`define field_MC8_bytes                           8
`define field_MC8_bits                            ( `field_MC8_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast all
`define fast_message_bytes                        43
`define fast_message_bits                         ( `fast_message_bytes * 8 )
`define fast_length_bytes                         1
`define fast_length_bits                          ( `fast_length_bytes * 8 )
`define fast_message_origin                       { `fast_message_bits {1'b0}}

`define PID1_b                                    ( `MAX_MESSAGE_BITS - 1 )
`define PID1_e                                    ( `PID1_b - `field_PID1_bits  + 1 ) 
`define MC1_b                                     ( `PID1_e - 1 ) 
`define MC1_e                                     ( `MC1_b - `field_MC1_bits  + 1 ) 
`define MT1_b                                     ( `MC1_e - 1 ) 
`define MT1_e                                     ( `MT1_b - `field_MT1_bits  + 1 )
`define MH_reserved_b                             ( `MT1_e - 1 )
`define MH_reserved_e                             ( `MH_reserved_b - `field_MH_reserved_bits + 1 )

`define defaut_fast_message                       { `fast_message_bits {1'b0}}
`define defaut_fast_length                        { `fast_length_bits {1'b0}}
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast a
`define a_SS5_b                                   ( `MH_reserved_e - 1 )
`define a_SS5_e                                   ( `a_SS5_b - `field_SS5_bits + 1 )
`define a_EB3_b                                   ( `a_SS5_e - `a_reserved_1_width - 1 )
`define a_EB3_e                                   ( `a_EB3_b - `field_EB3_bits + 1 )
`define a_SPDC1_b                                 ( `a_EB3_e - 1 )
`define a_SPDC1_e                                 ( `a_SPDC1_b - `field_SPDC1_bits + 1 )
`define a_SP4_b                                   ( `a_SPDC1_e - 1 )
`define a_SP4_e                                   ( `a_SP4_b - `field_SP4_bits + 1 )
`define a_V4_b                                    ( `a_SP4_e - 1 )
`define a_V4_e                                    ( `a_V4_b - `field_V4_bits + 1 )
`define a_PPDC1_b                                 ( `a_V4_e - 1 )
`define a_PPDC1_e                                 ( `a_PPDC1_b - `field_PPDC1_bits + 1 )
`define a_PP4_b                                   ( `a_PPDC1_e - 1 )
`define a_PP4_e                                   ( `a_PP4_b - `field_PP4_bits + 1 )
`define a_TI4_b                                   ( `a_PP4_e - 1 )
`define a_TI4_e                                   ( `a_TI4_b - `field_TI4_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast d
`define d_SS5_b                                   ( `MH_reserved_e - 1 )
`define d_SS5_e                                   ( `d_SS5_b - `field_SS5_bits + 1 )
`define d_EB3_b                                   ( `d_SS5_e - `d_reserved_1_width - 1 )
`define d_EB3_e                                   ( `d_EB3_b - `field_EB3_bits + 1 )
`define d_SPDC1_b                                 ( `d_EB3_e - 1 )
`define d_SPDC1_e                                 ( `d_SPDC1_b - `field_SPDC1_bits + 1 )
`define d_SP4_b                                   ( `d_SPDC1_e - 1 )
`define d_SP4_e                                   ( `d_SP4_b - `field_SP4_bits + 1 )
`define d_OIV4_b                                  ( `d_SP4_e - 1 )
`define d_OIV4_e                                  ( `d_OIV4_b - `field_OIV4_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast k
`define k_SS5_b                                   ( `MH_reserved_e - 1 )
`define k_SS5_e                                   ( `k_SS5_b - `field_SS5_bits + 1 )
`define k_EB3_b                                   ( `k_SS5_e - `k_reserved_1_width - 1 )
`define k_EB3_e                                   ( `k_EB3_b - `field_EB3_bits + 1 )
`define k_SPDC1_b                                 ( `k_EB3_e - 1 )
`define k_SPDC1_e                                 ( `k_SPDC1_b - `field_SPDC1_bits + 1 )
`define k_SP4_b                                   ( `k_SPDC1_e - 1 )
`define k_SP4_e                                   ( `k_SP4_b - `field_SP4_bits + 1 )
`define k_PPDC1_b                                 ( `k_SP4_e - 1 )
`define k_PPDC1_e                                 ( `k_PPDC1_b - `field_PPDC1_bits + 1 )
`define k_BP4_b                                   ( `k_PPDC1_e - 1 )
`define k_BP4_e                                   ( `k_BP4_b - `field_BP4_bits + 1 )
`define k_BS4_b                                   ( `k_BP4_e - 1 )
`define k_BS4_e                                   ( `k_BS4_b - `field_BS4_bits + 1 )
`define k_OP4_b                                   ( `k_BS4_e - 1 )
`define k_OP4_e                                   ( `k_OP4_b - `field_OP4_bits + 1 )
`define k_OS4_b                                   ( `k_OP4_e - 1 )
`define k_OS4_e                                   ( `k_OS4_b - `field_OS4_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast q
`define q_SS4_b                                   ( `MH_reserved_e - 1 )
`define q_SS4_e                                   ( `q_SS4_b - `field_SS4_bits + 1 )
`define q_EB3_b                                   ( `q_SS4_e - 1 )
`define q_EB3_e                                   ( `q_EB3_b - `field_EB3_bits + 1 )
`define q_SP2_b                                   ( `q_EB3_e - 1 )
`define q_SP2_e                                   ( `q_SP2_b - `field_SP2_bits + 1 )
`define q_BP2_b                                   ( `q_SP2_e - 1 )
`define q_BP2_e                                   ( `q_BP2_b - `field_BP2_bits + 1 )
`define q_BS2_b                                   ( `q_BP2_e - 1 )
`define q_BS2_e                                   ( `q_BS2_b - `field_BS2_bits + 1 )
`define q_OP2_b                                   ( `q_BS2_e - 1 )
`define q_OP2_e                                   ( `q_OP2_b - `field_OP2_bits + 1 )
`define q_OS2_b                                   ( `q_OP2_e - 1 )
`define q_OS2_e                                   ( `q_OS2_b - `field_OS2_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// fast N
  // NM
`define NM_BSN4_b                                 ( `MH_reserved_e - 1 )
`define NM_BSN4_e                                 ( `NM_BSN4_b - `field_BSN4_bits + 1 )
  // NN
`define NN_EBSN4_b                                ( `MH_reserved_e - 1 )
`define NN_EBSN4_e                                ( `NN_EBSN4_b - `field_EBSN4_bits + 1 )
`define NN_RBSN4_b                                ( `NN_EBSN4_e - 1 )
`define NN_RBSN4_e                                ( `NN_RBSN4_b - `field_RBSN4_bits + 1 )
  // NS
`define NS_MC8_b                                  ( `MH_reserved_e - 1 )
`define NS_MC8_e                                  ( `NS_MC8_b - `field_MC8_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// packet messages
`define packet_messages_data_bytes                3
`define packet_messages_data_bits                 ( `packet_messages_data_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// packet seq num
`define packet_seq_num_data_bytes                 10
`define packet_seq_num_data_bits                  ( `packet_seq_num_data_bytes * 8 )
`define packet_seq_num_data_initial               { `packet_seq_num_data_bits {1'b0}}
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// packet head
`define packet_head_data_bytes                    15
`define packet_head_data_bits                     ( `packet_head_data_bytes * 8 )
`define fast_SOH_data                             8'b10101010
`define fast_Version_Number_data                  8'b00001111
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// packet ETX
`define packet_ETX_data_bytes                     1
`define packet_ETX_data_bits                      ( `packet_ETX_data_bytes * 8 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// stage23
`define opra_block_time_message_b                 ( `max_block_bits - 88 - 1)
`define opra_block_time_message_e                 ( `opra_block_time_message_b - `field_BT8_bits + 1)
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// defast
`define pmap_bytes                                2
`define pmam_bits                                 ( `pmap_bytes * 8 )
`define pmap_b                                    ( `fast_message_bits - 1 )
`define pmap_e                                    ( `pmap_b - `pmam_bits + 1 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// defast control
`define PID_position                              ( `pmap_b - 1 )
`define MC_position                               ( `pmap_b - 2 )
`define MT_position                               ( `pmap_b - 3 )
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////
// stage5 information
`define defaut_infor                              ( 'b0 )
///////////////////////////////////////////////////////////////////////////////////////