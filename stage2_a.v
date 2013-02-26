`include "para_def.v"
module stage2_a_module ( data_a_1 , data_a_2 , data_a_3 , message_a_1 , message_a_2 , message_a_3 );
    input  data_a_1 , data_a_2 , data_a_3 ;
    output message_a_1 , message_a_2 , message_a_3 ;
    
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ] data_a_1 , data_a_2 , data_a_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_a_1 , message_a_2 , message_a_3 ;
    
    assign message_a_1 = {data_a_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_a_1 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_a_1 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_a_1 [ `a_Security_Symbol_begin : `a_Security_Symbol_end ] ,
                          { `a_reserved_1_width {1'b0}} ,
                          data_a_1 [ `a_Expiration_Block_begin : `a_Expiration_Block_end ] ,
                          data_a_1 [ `a_Strike_Price_Denominator_Code_begin : `a_Strike_Price_Denominator_Code_end ] ,
                          data_a_1 [ `a_Strike_Price_begin : `a_Strike_Price_end ] ,
                          data_a_1 [ `a_Volume_begin : `a_Volume_end ] ,
                          data_a_1 [ `a_Premium_Price_Denominator_Code_begin : `a_Premium_Price_Denominator_Code_end ] ,
                          data_a_1 [ `a_Premium_Price_begin : `a_Premium_Price_end ] ,
                          data_a_1 [ `a_Trade_Identifier_begin : `a_Trade_Identifier_end ] ,
                          { `a_reserved_2_width {1'b0}}
                          //35bytes
                          };
     
    assign message_a_2 = {data_a_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_a_2 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_a_2 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_a_2 [ `a_Security_Symbol_begin : `a_Security_Symbol_end ] ,
                          { `a_reserved_1_width {1'b0}} ,
                          data_a_2 [ `a_Expiration_Block_begin : `a_Expiration_Block_end ] ,
                          data_a_2 [ `a_Strike_Price_Denominator_Code_begin : `a_Strike_Price_Denominator_Code_end ] ,
                          data_a_2 [ `a_Strike_Price_begin : `a_Strike_Price_end ] ,
                          data_a_2 [ `a_Volume_begin : `a_Volume_end ] ,
                          data_a_2 [ `a_Premium_Price_Denominator_Code_begin : `a_Premium_Price_Denominator_Code_end ] ,
                          data_a_2 [ `a_Premium_Price_begin : `a_Premium_Price_end ] ,
                          data_a_2 [ `a_Trade_Identifier_begin : `a_Trade_Identifier_end ] ,
                          { `a_reserved_2_width {1'b0}}
                          //35bytes
                          };
                          
    assign message_a_3 = {data_a_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_a_3 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_a_3 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_a_3 [ `a_Security_Symbol_begin : `a_Security_Symbol_end ] ,
                          { `a_reserved_1_width {1'b0}} ,
                          data_a_3 [ `a_Expiration_Block_begin : `a_Expiration_Block_end ] ,
                          data_a_3 [ `a_Strike_Price_Denominator_Code_begin : `a_Strike_Price_Denominator_Code_end ] ,
                          data_a_3 [ `a_Strike_Price_begin : `a_Strike_Price_end ] ,
                          data_a_3 [ `a_Volume_begin : `a_Volume_end ] ,
                          data_a_3 [ `a_Premium_Price_Denominator_Code_begin : `a_Premium_Price_Denominator_Code_end ] ,
                          data_a_3 [ `a_Premium_Price_begin : `a_Premium_Price_end ] ,
                          data_a_3 [ `a_Trade_Identifier_begin : `a_Trade_Identifier_end ] ,
                          { `a_reserved_2_width {1'b0}}
                          //35bytes
                          };
endmodule

