`include "para_def.v"
module stage2_k_module ( data_k_1 , data_k_2 , data_k_3 , message_k_1 , message_k_2 , message_k_3 );
    input  data_k_1 , data_k_2 , data_k_3 ;
    output message_k_1 , message_k_2 , message_k_3 ;
    
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ] data_k_1 , data_k_2 , data_k_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_k_1 , message_k_2 , message_k_3 ;
    
    assign message_k_1 = {data_k_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_k_1 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_k_1 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_k_1 [ `k_Security_Symbol_begin : `k_Security_Symbol_end ] ,
                          { `k_reserved_1_width {1'b0}} ,
                          data_k_1 [ `k_Expiration_Block_begin : `k_Expiration_Block_end ] ,
                          data_k_1 [ `k_Strike_Price_Denominator_Code_begin : `k_Strike_Price_Denominator_Code_end ] ,
                          data_k_1 [ `k_Strike_Price_begin : `k_Strike_Price_end ] ,
                          data_k_1 [ `k_Premium_Price_Denominator_Code_begin : `k_Premium_Price_Denominator_Code_end ] ,
                          data_k_1 [ `k_Bid_Price_begin : `k_Bid_Price_end ] ,
                          data_k_1 [ `k_Bid_Size_begin : `k_Bid_Size_end ] ,
                          data_k_1 [ `k_Offer_Price_begin : `k_Offer_Price_end ] ,
                          data_k_1 [ `k_Offer_Size_begin : `k_Offer_Size_end ]
                          //35bytes
                          };
     
    assign message_k_2 = {data_k_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_k_2 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_k_2 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_k_2 [ `k_Security_Symbol_begin : `k_Security_Symbol_end ] ,
                          { `k_reserved_1_width {1'b0}} ,
                          data_k_2 [ `k_Expiration_Block_begin : `k_Expiration_Block_end ] ,
                          data_k_2 [ `k_Strike_Price_Denominator_Code_begin : `k_Strike_Price_Denominator_Code_end ] ,
                          data_k_2 [ `k_Strike_Price_begin : `k_Strike_Price_end ] ,
                          data_k_2 [ `k_Premium_Price_Denominator_Code_begin : `k_Premium_Price_Denominator_Code_end ] ,
                          data_k_2 [ `k_Bid_Price_begin : `k_Bid_Price_end ] ,
                          data_k_2 [ `k_Bid_Size_begin : `k_Bid_Size_end ] ,
                          data_k_2 [ `k_Offer_Price_begin : `k_Offer_Price_end ] ,
                          data_k_2 [ `k_Offer_Size_begin : `k_Offer_Size_end ]
                          //35bytes
                          };

    assign message_k_3 = {data_k_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_k_3 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_k_3 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_k_3 [ `k_Security_Symbol_begin : `k_Security_Symbol_end ] ,
                          { `k_reserved_1_width {1'b0}} ,
                          data_k_3 [ `k_Expiration_Block_begin : `k_Expiration_Block_end ] ,
                          data_k_3 [ `k_Strike_Price_Denominator_Code_begin : `k_Strike_Price_Denominator_Code_end ] ,
                          data_k_3 [ `k_Strike_Price_begin : `k_Strike_Price_end ] ,
                          data_k_3 [ `k_Premium_Price_Denominator_Code_begin : `k_Premium_Price_Denominator_Code_end ] ,
                          data_k_3 [ `k_Bid_Price_begin : `k_Bid_Price_end ] ,
                          data_k_3 [ `k_Bid_Size_begin : `k_Bid_Size_end ] ,
                          data_k_3 [ `k_Offer_Price_begin : `k_Offer_Price_end ] ,
                          data_k_3 [ `k_Offer_Size_begin : `k_Offer_Size_end ]
                          //35bytes
                          };
endmodule
