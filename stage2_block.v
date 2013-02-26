`include "para_def.v"
module stage2_block_module ( block_size_data , 
                             seq_number_data ,
                             message_number_data , 
                             time_message_data , 
                             message_1 , message_2 , message_3 ,
                             check_sum_data ,
                             block_control_m1 , block_control_m2 , block_control_m3 ,
                             block_data 
                             );
    input  block_size_data ,
           seq_number_data ,
           message_number_data , 
           time_message_data , 
           message_1 , message_2 , message_3 ,
           check_sum_data ,
           block_control_m1 , block_control_m2 , block_control_m3 ;
    output block_data ;
    
    wire [ `block_size_data_bits - 1 : 0 ]     block_size_data ;
    wire [ `seq_number_data_bits - 1 : 0 ]     seq_number_data ;
    wire [ `message_number_data_bits - 1 : 0 ] message_number_data ;
    wire [ `time_message_data_bits - 1 : 0 ]   time_message_data ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]         message_1 , message_2 , message_3 ;
    wire [ `check_sum_data_bits - 1 : 0 ]      check_sum_data ;
    wire [ `block_control_m_width - 1 : 0 ]    block_control_m1 , block_control_m2 , block_control_m3 ;
    wire [ `max_block_bits - 1 : 0 ]           block_data ;
    
    wire [ `block_header_bits - 1 : 0 ]        block_header ;
    
    assign    block_header = {(8'b00000010) , 
                              block_size_data , 
                              (8'b00000000) ,
                              (8'b00000000) ,
                              (8'b00000000) ,
                              seq_number_data ,
                              message_number_data , 
                              time_message_data , 
                              check_sum_data
                              };
    
    assign    block_data   = ( block_control_m1 == `block_control_m_35 )? 
                                   ( 
                                   ( block_control_m2 == `block_control_m_35 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_35]} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 104'b0} :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 112'b0} :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 184'b0} : 
                                                                                      {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_35] , 280'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_22 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 104'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 208'b0} :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 288'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_22] , 384'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_21 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 112'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 224'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 296'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_21] , 392'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_12 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 184'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 288'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 296'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 368'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_35] , message_2[`m_begin : `end_12] , 464'b0}
                                         ):
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_35] , message_3[`m_begin : `end_35] , 280'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 384'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 464'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_35] , 560'b0}
                                         )
                                   ):
                                    
                             ( block_control_m1 == `block_control_m_22 )? 
                                   ( 
                                   ( block_control_m2 == `block_control_m_35 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_35] , 104'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 208'b0} :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 288'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_35] , 384'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_22 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 208'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 312'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 320'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 392'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_22] , 488'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_21 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 320'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 328'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 400'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_21] , 496'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_12 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 288'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 400'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 472'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_22] , message_2[`m_begin : `end_12] , 568'b0}
                                         ):
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 384'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 488'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 496'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 568'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_22] , 664'b0}
                                         )
                                   ):
                                    
                             ( block_control_m1 == `block_control_m_21 )? 
                                   ( 
                                   ( block_control_m2 == `block_control_m_35 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_35] , 112'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 224'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 296'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_35] , 392'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_22 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 216'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 320'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 328'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 400'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_22] , 496'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_21 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 224'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 328'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 336'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 408'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_21] , 504'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_12 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 296'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 400'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 408'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 480'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_21] , message_2[`m_begin : `end_12] , 576'b0}
                                         ):
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 496'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 504'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 576'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_21] , 672'b0}
                                         )
                                   ):
                                    
                             ( block_control_m1 == `block_control_m_12 )? 
                                   ( 
                                   ( block_control_m2 == `block_control_m_35 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_35] , 184'b0} :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 288'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 296'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 368'b0}  :
                                                                                      {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_35] , 464'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_22 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 288'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 400'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 472'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_22] , 568'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_21 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 296'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 400'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 408'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 480'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_21] , 576'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_12 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 368'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 472'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 480'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 552'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_12] , message_2[`m_begin : `end_12] , 648'b0}
                                         ):
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_1[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 464'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_1[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 568'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_1[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 576'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_1[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 648'b0}  : 
                                                                                      {block_header , message_1[`m_begin : `end_12] , 744'b0}
                                         )
                                   ):
                                   ( 
                                   ( block_control_m2 == `block_control_m_35 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_35] , 280'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_22] , 384'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_21] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_2[`m_begin : `end_35] , message_3[`m_begin : `end_12] , 464'b0}  : 
                                                                                      {block_header , message_2[`m_begin : `end_35] , 560'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_22 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_35] , 384'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_22] , 488'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_21] , 496'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_2[`m_begin : `end_22] , message_3[`m_begin : `end_12] , 568'b0}  : 
                                                                                      {block_header , message_2[`m_begin : `end_22] , 664'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_21 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_35] , 392'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_22] , 496'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_21] , 504'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_2[`m_begin : `end_21] , message_3[`m_begin : `end_12] , 576'b0}  : 
                                                                                      {block_header , message_2[`m_begin : `end_21] , 672'b0}
                                         ):
                                   ( block_control_m2 == `block_control_m_12 )? 
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_35] , 464'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_22] , 568'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_21] , 576'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_2[`m_begin : `end_12] , message_3[`m_begin : `end_12] , 648'b0}  : 
                                                                                      {block_header , message_2[`m_begin : `end_12] , 744'b0}
                                         ):
                                         (
                                         ( block_control_m3 == `block_control_m_35 )? {block_header , message_3[`m_begin : `end_35] , 560'b0}  :
                                         ( block_control_m3 == `block_control_m_22 )? {block_header , message_3[`m_begin : `end_22] , 664'b0}  :
                                         ( block_control_m3 == `block_control_m_21 )? {block_header , message_3[`m_begin : `end_21] , 672'b0}  :
                                         ( block_control_m3 == `block_control_m_12 )? {block_header , message_3[`m_begin : `end_12] , 744'b0}  : 
                                                                                      {block_header , 840'b0}
                                         )
                                   );
    
endmodule
