`include "para_def.v" 
//assume that only the message head could be the same to the value in field reg , the time message always the same and the rest always different
module stage4_defast_q_module ( 
                                message_fast_1 , message_fast_2 , message_fast_3 ,
                                field_PID1 , field_MC1 , field_MT1 ,
                                field_SS4 , field_EB3 , field_SP2 , field_BP2 , field_BS2 , field_OP2 , field_OS2 ,   
                                message_1 , message_2 , message_3 
                                );
    input  message_fast_1 , message_fast_2 , message_fast_3 ,
           field_PID1 , field_MC1 , field_MT1 ,
           field_SS4 , field_EB3 , field_SP2 , field_BP2 , field_BS2 , field_OP2 , field_OS2 ;
    output message_1 , message_2 , message_3 ;
    
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `field_SS4_bits - 1 : 0 ]               field_SS4 ;
    wire [ `field_EB3_bits - 1 : 0 ]               field_EB3 ;
    wire [ `field_SP2_bits - 1 : 0 ]               field_SP2 ;
    wire [ `field_BP2_bits - 1 : 0 ]               field_BP2 ;
    wire [ `field_BS2_bits - 1 : 0 ]               field_BS2 ;
    wire [ `field_OP2_bits - 1 : 0 ]               field_OP2 ;
    wire [ `field_OS2_bits - 1 : 0 ]               field_OS2 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    
    assign message_1 = ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_1 [327:192] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_1[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_1 [319:184] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_1[327:320] , field_MT1 , 8'b0 , message_fast_1 [319:184] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_1[327:320] , 8'b0 , message_fast_1 [319:184] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_1[327:320] , message_fast_1[319:312] , field_MT1 , 8'b0 , message_fast_1 [311:176] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_1[327:320] , field_MC1 , message_fast_1[319:312] , 8'b0 , message_fast_1 [311:176] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_1[327:320] , message_fast_1[319:312] , 8'b0 , message_fast_1 [311:176] , 112'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_1[327:320] , message_fast_1[319:312] , message_fast_1[311:304] , 8'b0 , message_fast_1 [303:168] , 112'b0 }:
                                                                                         `defaut_message ;
    
    assign message_2 = ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_2 [327:192] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_2[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_2 [319:184] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_2[327:320] , field_MT1 , 8'b0 , message_fast_2 [319:184] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_2[327:320] , 8'b0 , message_fast_2 [319:184] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_2[327:320] , message_fast_2[319:312] , field_MT1 , 8'b0 , message_fast_2 [311:176] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_2[327:320] , field_MC1 , message_fast_2[319:312] , 8'b0 , message_fast_2 [311:176] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_2[327:320] , message_fast_2[319:312] , 8'b0 , message_fast_2 [311:176] , 112'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_2[327:320] , message_fast_2[319:312] , message_fast_2[311:304] , 8'b0 , message_fast_2 [303:168] , 112'b0 }:
                                                                                         `defaut_message ;

    assign message_3 = ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_3 [327:192] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_3[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_3 [319:184] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_3[327:320] , field_MT1 , 8'b0 , message_fast_3 [319:184] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_3[327:320] , 8'b0 , message_fast_3 [319:184] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_3[327:320] , message_fast_3[319:312] , field_MT1 , 8'b0 , message_fast_3 [311:176] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_3[327:320] , field_MC1 , message_fast_3[319:312] , 8'b0 , message_fast_3 [311:176] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_3[327:320] , message_fast_3[319:312] , 8'b0 , message_fast_3 [311:176] , 112'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_3[327:320] , message_fast_3[319:312] , message_fast_3[311:304] , 8'b0 , message_fast_3 [303:168] , 112'b0 }:
                                                                                         `defaut_message ;

endmodule
