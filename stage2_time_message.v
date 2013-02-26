`include "para_def.v"
module stage2_time_message_module ( time_message_data );
    output time_message_data ;
    
    wire [ `time_message_data_bits - 1 : 0 ] time_message_data ;
    
    assign time_message_data = 64'b1100110011001100110011001100110011001100110011001100110011001100;

endmodule
