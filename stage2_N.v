`include "para_def.v"
module stage2_N_module ( data_N_1 , data_N_2 , data_N_3 , 
                         message_NL_1 , message_NL_2 , message_NL_3 ,
                         message_NM_1 , message_NM_2 , message_NM_3 ,
                         message_NN_1 , message_NN_2 , message_NN_3 ,
                         message_NR_1 , message_NR_2 , message_NR_3 ,
                         message_NS_1 , message_NS_2 , message_NS_3 
                        );
    input  data_N_1 , data_N_2 , data_N_3 ;
    output message_NL_1 , message_NL_2 , message_NL_3 ,
           message_NM_1 , message_NM_2 , message_NM_3 ,
           message_NN_1 , message_NN_2 , message_NN_3 ,
           message_NR_1 , message_NR_2 , message_NR_3 ,
           message_NS_1 , message_NS_2 , message_NS_3 ;
    
    wire [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ] data_N_1 , data_N_2 , data_N_3;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]       message_NL_1 , message_NL_2 , message_NL_3 ,
                                             message_NM_1 , message_NM_2 , message_NM_3 ,
                                             message_NN_1 , message_NN_2 , message_NN_3 ,
                                             message_NR_1 , message_NR_2 , message_NR_3 ,
                                             message_NS_1 , message_NS_2 , message_NS_3 ;
    
    assign message_NL_1 = {data_N_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_1 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_1 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NL_reserved_1_width {1'b0}} ,
                           { `NL_reserved_2_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };

    assign message_NL_2 = {data_N_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_2 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_2 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NL_reserved_1_width {1'b0}} ,
                           { `NL_reserved_2_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NL_3 = {data_N_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_3 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_3 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NL_reserved_1_width {1'b0}} ,
                           { `NL_reserved_2_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NM_1 = {data_N_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_1 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_1 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_1 [ `NM_Block_Sequency_Number_begin : `NM_Block_Sequency_Number_end ] ,
                           { `NM_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NM_2 = {data_N_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_2 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_2 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_2 [ `NM_Block_Sequency_Number_begin : `NM_Block_Sequency_Number_end ] ,
                           { `NM_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NM_3 = {data_N_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_3 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_3 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_3 [ `NM_Block_Sequency_Number_begin : `NM_Block_Sequency_Number_end ] ,
                           { `NM_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NN_1 = {data_N_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_1 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_1 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_1 [ `NN_Expected_Block_Sequency_Number_begin : `NN_Expected_Block_Sequency_Number_end ] ,
                           data_N_1 [ `NN_Received_Block_Sequency_Number_begin : `NN_Received_Block_Sequency_Number_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NN_2 = {data_N_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_2 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_2 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_2 [ `NN_Expected_Block_Sequency_Number_begin : `NN_Expected_Block_Sequency_Number_end ] ,
                           data_N_2 [ `NN_Received_Block_Sequency_Number_begin : `NN_Received_Block_Sequency_Number_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NN_3 = {data_N_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_3 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_3 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_3 [ `NN_Expected_Block_Sequency_Number_begin : `NN_Expected_Block_Sequency_Number_end ] ,
                           data_N_3 [ `NN_Received_Block_Sequency_Number_begin : `NN_Received_Block_Sequency_Number_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NR_1 = {data_N_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_1 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_1 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NR_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NR_2 = {data_N_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_2 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_2 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NR_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NR_3 = {data_N_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_3 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_3 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           { `NR_reserved_1_width {1'b0}} ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NS_1 = {data_N_1 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_1 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_1 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_1 [ `NS_Message_Count_begin : `NS_Message_Count_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NS_2 = {data_N_2 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_2 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_2 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_2 [ `NS_Message_Count_begin : `NS_Message_Count_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
                           
    assign message_NS_3 = {data_N_3 [ `Participant_ID_begin : `Participant_ID_end ] , 
                           data_N_3 [ `Message_Category_begin : `Message_Category_end ] ,
                           data_N_3 [ `Message_Type_begin : `Message_Type_end ] ,
                           { `message_head_reserved_width {1'b0}} ,
                           data_N_3 [ `NS_Message_Count_begin : `NS_Message_Count_end ] ,
                           { `N_rest_bits {1'b0}}
                           };
endmodule
