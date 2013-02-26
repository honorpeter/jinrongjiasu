`include "para_def.v"
module stage3_packet_ETX_module ( packet_ETX_data );
    output packet_ETX_data ;
    
    wire [ `packet_ETX_data_bits - 1 : 0 ] packet_ETX_data ;
    
    assign packet_ETX_data = 8'b01010101 ;
    
endmodule
