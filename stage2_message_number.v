`include "para_def.v"
module stage2_message_number_module ( message_number_control , message_number_data );
    input  message_number_control ;
    output message_number_data ;
    
    wire [ `message_number_control_width - 1 : 0 ] message_number_control ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data ;
    
    assign message_number_data = ( message_number_control == `message_number_0 )? `message_number_data_0 : 
                                 ( message_number_control == `message_number_1 )? `message_number_data_1 : 
                                 ( message_number_control == `message_number_2 )? `message_number_data_2 :  
                                 `message_number_data_3 ;
endmodule
