`include "para_def.v"
module stage3_packet_head_module ( packet_seq_num_data , packet_messages_data , packet_head_data );
    input  packet_seq_num_data , packet_messages_data ;
    output packet_head_data ;
    
    wire [ `packet_seq_num_data_bits - 1 : 0 ]     packet_seq_num_data ;
    wire [ `packet_messages_data_bits - 1 : 0 ]    packet_messages_data ;
    wire [ `packet_head_data_bits - 1 : 0 ]        packet_head_data ;
    
    assign packet_head_data = { `fast_SOH_data , `fast_Version_Number_data , packet_seq_num_data , packet_messages_data };
endmodule
