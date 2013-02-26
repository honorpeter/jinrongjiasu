`include "para_def.v" 
//assume that only the message head could be the same to the value in field reg , the time message always the same and the rest always different
module stage3_fast_NN_module ( message_1 , message_2 , message_3 ,
                               block_time_message , 
                               field_BT8 , 
                               field_PID1 , field_MC1 , field_MT1 ,
                               field_EBSN4 , field_RBSN4 ,  
                               message_fast_1 , message_fast_2 , message_fast_3 ,
                               message_fast_length_1 , message_fast_length_2 , message_fast_length_3 
                               );
    input  message_1 , message_2 , message_3 ,
           block_time_message , 
           field_BT8 , 
           field_PID1 , field_MC1 , field_MT1 ,
           field_EBSN4 , field_RBSN4 ;
    output message_fast_1 , message_fast_2 , message_fast_3 ,
           message_fast_length_1 , message_fast_length_2 , message_fast_length_3 ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `field_BT8_bits - 1 : 0 ]               block_time_message ;
    wire [ `field_BT8_bits - 1 : 0 ]               field_BT8 ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `field_EBSN4_bits - 1 : 0 ]             field_EBSN4 ;
    wire [ `field_RBSN4_bits - 1 : 0 ]             field_RBSN4 ;
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `fast_length_bits - 1 : 0 ]             message_fast_length_1 , message_fast_length_2 , message_fast_length_3 ;
    
    assign message_fast_1 = ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 264'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_1 [ `PID1_b : `PID1_e ] ,                                                                 message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_1 [ `MC1_b : `MC1_e ] ,                                 message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_1 [ `MT1_b : `MT1_e ] , message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_1 [ `PID1_b : `PID1_e ] , message_1 [ `MC1_b : `MC1_e ] ,                                 message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_1 [ `PID1_b : `PID1_e ] ,                                 message_1 [ `MT1_b : `MT1_e ] , message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_1 [ `MC1_b : `MC1_e ] , message_1 [ `MT1_b : `MT1_e ] , message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_1 [ `PID1_b : `PID1_e ] , message_1 [ `MC1_b : `MC1_e ] , message_1 [ `MT1_b : `MT1_e ] , message_1[ `NN_EBSN4_b : `NN_RBSN4_e ] , 240'b0 } ; 
    
    assign message_fast_2 = ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 264'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_2 [ `PID1_b : `PID1_e ] ,                                                                 message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_2 [ `MC1_b : `MC1_e ] ,                                 message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_2 [ `MT1_b : `MT1_e ] , message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_2 [ `PID1_b : `PID1_e ] , message_2 [ `MC1_b : `MC1_e ] ,                                 message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_2 [ `PID1_b : `PID1_e ] ,                                 message_2 [ `MT1_b : `MT1_e ] , message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_2 [ `MC1_b : `MC1_e ] , message_2 [ `MT1_b : `MT1_e ] , message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_2 [ `PID1_b : `PID1_e ] , message_2 [ `MC1_b : `MC1_e ] , message_2 [ `MT1_b : `MT1_e ] , message_2[ `NN_EBSN4_b : `NN_RBSN4_e ] , 240'b0 } ;
    
    assign message_fast_3 = ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 264'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_3 [ `PID1_b : `PID1_e ] ,                                                                 message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_3 [ `MC1_b : `MC1_e ] ,                                 message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_3 [ `MT1_b : `MT1_e ] , message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 256'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_3 [ `PID1_b : `PID1_e ] , message_3 [ `MC1_b : `MC1_e ] ,                                 message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_3 [ `PID1_b : `PID1_e ] ,                                 message_3 [ `MT1_b : `MT1_e ] , message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_3 [ `MC1_b : `MC1_e ] , message_3 [ `MT1_b : `MT1_e ] , message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 248'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_3 [ `PID1_b : `PID1_e ] , message_3 [ `MC1_b : `MC1_e ] , message_3 [ `MT1_b : `MT1_e ] , message_3[ `NN_EBSN4_b : `NN_RBSN4_e ] , 240'b0 } ;
    
    assign message_fast_length_1 = ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001010 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                                                                                                                                                                              8'b00001101 ;
    
    assign message_fast_length_2 = ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001010 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                                                                                                                                                                              8'b00001101 ;
    
    assign message_fast_length_3 = ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001010 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001011 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00001100 :
                                                                                                                                                                                              8'b00001101 ;
    
                                 
endmodule
