`include "para_def.v"
module stage3_packet_messages_module ( message_number_data , packet_messages_data );
    input  message_number_data ;
    output packet_messages_data ;
    
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data ;
    wire [ `packet_messages_data_bits - 1 : 0 ]    packet_messages_data ;
    
    assign packet_messages_data = { 16'b0 , message_number_data };
endmodule
