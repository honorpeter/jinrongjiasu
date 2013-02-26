`include "para_def.v"
module stage2_d_module ( data_d_1 , data_d_2 , data_d_3 , message_d_1 , message_d_2 , message_d_3 );
    input  data_d_1 , data_d_2 , data_d_3 ;
    output message_d_1 , message_d_2 , message_d_3 ;
    
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ] data_d_1 , data_d_2 , data_d_3 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_d_1 , message_d_2 , message_d_3 ;
    
    assign message_d_1 = {data_d_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_d_1 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_d_1 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_d_1 [ `d_Security_Symbol_begin : `d_Security_Symbol_end ] ,
                          { `d_reserved_1_width {1'b0}} ,
                          data_d_1 [ `d_Expiration_Block_begin : `d_Expiration_Block_end ] ,
                          data_d_1 [ `d_Strike_Price_Denominator_Code_begin : `d_Strike_Price_Denominator_Code_end ] ,
                          data_d_1 [ `d_Strike_Price_begin : `d_Strike_Price_end ] ,
                          data_d_1 [ `d_Open_Interest_Volume_begin : `d_Open_Interest_Volume_begin ] ,
                          { `d_rest_bits {1'b0}} 
                          };
 
    assign message_d_2 = {data_d_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_d_2 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_d_2 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_d_2 [ `d_Security_Symbol_begin : `d_Security_Symbol_end ] ,
                          { `d_reserved_1_width {1'b0}} ,
                          data_d_2 [ `d_Expiration_Block_begin : `d_Expiration_Block_end ] ,
                          data_d_2 [ `d_Strike_Price_Denominator_Code_begin : `d_Strike_Price_Denominator_Code_end ] ,
                          data_d_2 [ `d_Strike_Price_begin : `d_Strike_Price_end ] ,
                          data_d_2 [ `d_Open_Interest_Volume_begin : `d_Open_Interest_Volume_begin ] ,
                          { `d_rest_bits {1'b0}} 
                          };
                          
    assign message_d_3 = {data_d_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                          data_d_3 [ `Message_Category_begin : `Message_Category_end ] ,
                          data_d_3 [ `Message_Type_begin : `Message_Type_end ] ,
                          { `message_head_reserved_width {1'b0}} ,
                          data_d_3 [ `d_Security_Symbol_begin : `d_Security_Symbol_end ] ,
                          { `d_reserved_1_width {1'b0}} ,
                          data_d_3 [ `d_Expiration_Block_begin : `d_Expiration_Block_end ] ,
                          data_d_3 [ `d_Strike_Price_Denominator_Code_begin : `d_Strike_Price_Denominator_Code_end ] ,
                          data_d_3 [ `d_Strike_Price_begin : `d_Strike_Price_end ] ,
                          data_d_3 [ `d_Open_Interest_Volume_begin : `d_Open_Interest_Volume_begin ] ,
                          { `d_rest_bits {1'b0}} 
                          };                     
endmodule
