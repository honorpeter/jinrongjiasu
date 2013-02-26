`include "para_def.v" 
//assume that only the message head could be the same to the value in field reg , the time message always the same and the rest always different
module stage3_fast_k_module ( message_1 , message_2 , message_3 ,
                              block_time_message , 
                              field_BT8 , 
                              field_PID1 , field_MC1 , field_MT1 ,
                              field_SS5 , field_EB3 , field_SPDC1 , field_SP4  , field_PPDC1 , field_BP4 , field_BS4 , field_OP4 , field_OS4 ,     
                              message_fast_1 , message_fast_2 , message_fast_3 ,
                              message_fast_length_1 , message_fast_length_2 , message_fast_length_3 
                              );
    input  message_1 , message_2 , message_3 ,
           block_time_message , 
           field_BT8 , 
           field_PID1 , field_MC1 , field_MT1 ,
           field_SS5 , field_EB3 , field_SPDC1 , field_SP4  , field_PPDC1 , field_BP4 , field_BS4 , field_OP4 , field_OS4 ;
    output message_fast_1 , message_fast_2 , message_fast_3 ,
           message_fast_length_1 , message_fast_length_2 , message_fast_length_3 ;
    
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    wire [ `field_BT8_bits - 1 : 0 ]               block_time_message ;
    wire [ `field_BT8_bits - 1 : 0 ]               field_BT8 ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `field_SS5_bits - 1 : 0 ]               field_SS5 ;
    wire [ `field_EB3_bits - 1 : 0 ]               field_EB3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             field_SPDC1 ;
    wire [ `field_SP4_bits - 1 : 0 ]               field_SP4 ;
    wire [ `field_PPDC1_bits - 1 : 0 ]             field_PPDC1 ;
    wire [ `field_BP4_bits - 1 : 0 ]               field_BP4 ;
    wire [ `field_BS4_bits - 1 : 0 ]               field_BS4 ;
    wire [ `field_OP4_bits - 1 : 0 ]               field_OP4 ;
    wire [ `field_OS4_bits - 1 : 0 ]               field_OS4 ;
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `fast_length_bits - 1 : 0 ]             message_fast_length_1 , message_fast_length_2 , message_fast_length_3 ;
    
    assign message_fast_1 = ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 88'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_1 [ `PID1_b : `PID1_e ] ,                                                                 message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_1 [ `MC1_b : `MC1_e ] ,                                 message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_1 [ `MT1_b : `MT1_e ] , message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_1 [ `PID1_b : `PID1_e ] , message_1 [ `MC1_b : `MC1_e ] ,                                 message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_1 [ `PID1_b : `PID1_e ] ,                                 message_1 [ `MT1_b : `MT1_e ] , message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_1 [ `MC1_b : `MC1_e ] , message_1 [ `MT1_b : `MT1_e ] , message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_1 [ `PID1_b : `PID1_e ] , message_1 [ `MC1_b : `MC1_e ] , message_1 [ `MT1_b : `MT1_e ] , message_1[ `k_SS5_b : `k_SS5_e ] , message_1[ `k_EB3_b : `k_OS4_e ] , 64'b0 } ; 
    
    assign message_fast_2 = ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 88'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_2 [ `PID1_b : `PID1_e ] ,                                                                 message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_2 [ `MC1_b : `MC1_e ] ,                                 message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_2 [ `MT1_b : `MT1_e ] , message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_2 [ `PID1_b : `PID1_e ] , message_2 [ `MC1_b : `MC1_e ] ,                                 message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_2 [ `PID1_b : `PID1_e ] ,                                 message_2 [ `MT1_b : `MT1_e ] , message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_2 [ `MC1_b : `MC1_e ] , message_2 [ `MT1_b : `MT1_e ] , message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_2 [ `PID1_b : `PID1_e ] , message_2 [ `MC1_b : `MC1_e ] , message_2 [ `MT1_b : `MT1_e ] , message_2[ `k_SS5_b : `k_SS5_e ] , message_2[ `k_EB3_b : `k_OS4_e ] , 64'b0 } ;
    
    assign message_fast_3 = ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1111000000000000 ,                                                                                                   message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 88'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1011000000000000 , message_3 [ `PID1_b : `PID1_e ] ,                                                                 message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1101000000000000 ,                                   message_3 [ `MC1_b : `MC1_e ] ,                                 message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1110000000000000 ,                                                                   message_3 [ `MT1_b : `MT1_e ] , message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 80'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1001000000000000 , message_3 [ `PID1_b : `PID1_e ] , message_3 [ `MC1_b : `MC1_e ] ,                                 message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1010000000000000 , message_3 [ `PID1_b : `PID1_e ] ,                                 message_3 [ `MT1_b : `MT1_e ] , message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                            ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? { 16'b1100000000000000 ,                                   message_3 [ `MC1_b : `MC1_e ] , message_3 [ `MT1_b : `MT1_e ] , message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 72'b0 } : 
                                                                                                                                                                                       { 16'b1000000000000000 , message_3 [ `PID1_b : `PID1_e ] , message_3 [ `MC1_b : `MC1_e ] , message_3 [ `MT1_b : `MT1_e ] , message_3[ `k_SS5_b : `k_SS5_e ] , message_3[ `k_EB3_b : `k_OS4_e ] , 64'b0 } ;
    
    assign message_fast_length_1 = ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100000 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 != message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 == message_1 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_1 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_1 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                                                                                                                                                                              8'b00100011 ;
    
    assign message_fast_length_2 = ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100000 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 != message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 == message_2 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_2 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_2 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                                                                                                                                                                              8'b00100011 ;
    
    assign message_fast_length_3 = ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100000 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100001 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 == message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 != message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 == message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                   ( ( field_PID1 == message_3 [ `PID1_b : `PID1_e ] ) && ( field_MC1 != message_3 [ `MC1_b : `MC1_e ] ) && ( field_MT1 != message_3 [ `MT1_b : `MT1_e ] ) )? 8'b00100010 :
                                                                                                                                                                                              8'b00100011 ;
    
                                 
endmodule
