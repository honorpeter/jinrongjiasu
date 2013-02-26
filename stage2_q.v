`include "para_def.v"
module stage2_q_module ( data_q_1 , data_q_2 , data_q_3 , message_q_1 , message_q_2 , message_q_3 );
    input  data_q_1 , data_q_2 , data_q_3 ;
    output message_q_1 , message_q_2 , message_q_3 ;
    
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ] data_q_1 , data_q_2 , data_q_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_q_1 , message_q_2 , message_q_3 ;
    
    assign message_q_1 = {data_q_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_q_1 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_q_1 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_q_1 [ `q_Security_Symbol_begin : `q_Security_Symbol_end ] ,
                          data_q_1 [ `q_Expiration_Block_begin : `q_Expiration_Block_end ] ,
                          data_q_1 [ `q_Strike_Price_begin : `q_Strike_Price_end ] ,
                          data_q_1 [ `q_Bid_Price_begin : `q_Bid_Price_end ] ,
                          data_q_1 [ `q_Bid_Size_begin : `q_Bid_Size_end ] ,
                          data_q_1 [ `q_Offer_Price_begin : `q_Offer_Price_end ] ,
                          data_q_1 [ `q_Offer_Size_begin : `q_Offer_Size_end ],
                          { `q_rest_bits {1'b0}}
                          };
                          
    assign message_q_2 = {data_q_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_q_2 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_q_2 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_q_2 [ `q_Security_Symbol_begin : `q_Security_Symbol_end ] ,
                          data_q_2 [ `q_Expiration_Block_begin : `q_Expiration_Block_end ] ,
                          data_q_2 [ `q_Strike_Price_begin : `q_Strike_Price_end ] ,
                          data_q_2 [ `q_Bid_Price_begin : `q_Bid_Price_end ] ,
                          data_q_2 [ `q_Bid_Size_begin : `q_Bid_Size_end ] ,
                          data_q_2 [ `q_Offer_Price_begin : `q_Offer_Price_end ] ,
                          data_q_2 [ `q_Offer_Size_begin : `q_Offer_Size_end ],
                          { `q_rest_bits {1'b0}}
                          };
                          
    assign message_q_3 = {data_q_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_q_2 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_q_2 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_q_2 [ `q_Security_Symbol_begin : `q_Security_Symbol_end ] ,
                          data_q_2 [ `q_Expiration_Block_begin : `q_Expiration_Block_end ] ,
                          data_q_2 [ `q_Strike_Price_begin : `q_Strike_Price_end ] ,
                          data_q_2 [ `q_Bid_Price_begin : `q_Bid_Price_end ] ,
                          data_q_2 [ `q_Bid_Size_begin : `q_Bid_Size_end ] ,
                          data_q_2 [ `q_Offer_Price_begin : `q_Offer_Price_end ] ,
                          data_q_2 [ `q_Offer_Size_begin : `q_Offer_Size_end ],
                          { `q_rest_bits {1'b0}}
                          };
endmodule
