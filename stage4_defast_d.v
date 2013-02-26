`include "para_def.v" 
//assume that only the message head could be the same to the value in field reg , the time message always the same and the rest always different
module stage4_defast_d_module ( 
                                message_fast_1 , message_fast_2 , message_fast_3 ,
                                field_PID1 , field_MC1 , field_MT1 ,
                                field_SS5 , field_EB3 , field_SPDC1 , field_SP4 , field_OIV4 ,   
                                message_1 , message_2 , message_3 
                                );
    input  message_fast_1 , message_fast_2 , message_fast_3 ,
           field_PID1 , field_MC1 , field_MT1 ,
           field_SS5 , field_EB3 , field_SPDC1 , field_SP4 , field_OIV4 ;
    output message_1 , message_2 , message_3 ;
    
    wire [ `fast_message_bits - 1 : 0 ]            message_fast_1 , message_fast_2 , message_fast_3 ;
    wire [ `field_PID1_bits - 1 : 0 ]              field_PID1 ;
    wire [ `field_MC1_bits - 1 : 0 ]               field_MC1 ;
    wire [ `field_MT1_bits - 1 : 0 ]               field_MT1 ;
    wire [ `field_SS5_bits - 1 : 0 ]               field_SS5 ;
    wire [ `field_EB3_bits - 1 : 0 ]               field_EB3 ;
    wire [ `field_SPDC1_bits - 1 : 0 ]             field_SPDC1 ;
    wire [ `field_SP4_bits - 1 : 0 ]               field_SP4 ;
    wire [ `field_OIV4_bits - 1 : 0 ]              field_OIV4 ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             message_1 , message_2 , message_3 ;
    
    assign message_1 = ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_1 [327:288] , 8'b0 , message_fast_1[287:192] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_1[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_1 [319:280] , 8'b0 , message_fast_1[279:184] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_1[327:320] , field_MT1 , 8'b0 , message_fast_1 [319:280] , 8'b0 , message_fast_1[279:184] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_1[327:320] , 8'b0 , message_fast_1 [319:280] , 8'b0 , message_fast_1[279:184] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_1[327:320] , message_fast_1[319:312] , field_MT1 , 8'b0 , message_fast_1 [311:272] , 8'b0 , message_fast_1[271:176] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_1[327:320] , field_MC1 , message_fast_1[319:312] , 8'b0 , message_fast_1 [311:272] , 8'b0 , message_fast_1[271:176] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_1[327:320] , message_fast_1[319:312] , 8'b0 , message_fast_1 [311:272] , 8'b0 , message_fast_1[271:176] , 104'b0 }:
                       ( message_fast_1 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_1[327:320] , message_fast_1[319:312] , message_fast_1[311:304] , 8'b0 , message_fast_1 [303:264] , 8'b0 , message_fast_1[263:168] , 104'b0 }:
                                                                                         `defaut_message ;
    
    assign message_2 = ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_2 [327:288] , 8'b0 , message_fast_2[287:192] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_2[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_2 [319:280] , 8'b0 , message_fast_2[279:184] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_2[327:320] , field_MT1 , 8'b0 , message_fast_2 [319:280] , 8'b0 , message_fast_2[279:184] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_2[327:320] , 8'b0 , message_fast_2 [319:280] , 8'b0 , message_fast_2[279:184] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_2[327:320] , message_fast_2[319:312] , field_MT1 , 8'b0 , message_fast_2 [311:272] , 8'b0 , message_fast_2[271:176] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_2[327:320] , field_MC1 , message_fast_2[319:312] , 8'b0 , message_fast_2 [311:272] , 8'b0 , message_fast_2[271:176] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_2[327:320] , message_fast_2[319:312] , 8'b0 , message_fast_2 [311:272] , 8'b0 , message_fast_2[271:176] , 104'b0 }:
                       ( message_fast_2 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_2[327:320] , message_fast_2[319:312] , message_fast_2[311:304] , 8'b0 , message_fast_2 [303:264] , 8'b0 , message_fast_2[263:168] , 104'b0 }:
                                                                                         `defaut_message ;
    
    assign message_3 = ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1111000000000000 )? { field_PID1 , field_MC1 , field_MT1 , 8'b0 , message_fast_3 [327:288] , 8'b0 , message_fast_3[287:192] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1011000000000000 )? { message_fast_3[327:320] , field_MC1 , field_MT1 , 8'b0 , message_fast_3 [319:280] , 8'b0 , message_fast_3[279:184] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1101000000000000 )? { field_PID1 , message_fast_3[327:320] , field_MT1 , 8'b0 , message_fast_3 [319:280] , 8'b0 , message_fast_3[279:184] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1110000000000000 )? { field_PID1 , field_MC1 , message_fast_3[327:320] , 8'b0 , message_fast_3 [319:280] , 8'b0 , message_fast_3[279:184] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1001000000000000 )? { message_fast_3[327:320] , message_fast_3[319:312] , field_MT1 , 8'b0 , message_fast_3 [311:272] , 8'b0 , message_fast_3[271:176] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1010000000000000 )? { message_fast_3[327:320] , field_MC1 , message_fast_3[319:312] , 8'b0 , message_fast_3 [311:272] , 8'b0 , message_fast_3[271:176] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1100000000000000 )? { field_PID1 , message_fast_3[327:320] , message_fast_3[319:312] , 8'b0 , message_fast_3 [311:272] , 8'b0 , message_fast_3[271:176] , 104'b0 }:
                       ( message_fast_3 [ `pmap_b : `pmap_e ] == 16'b1000000000000000 )? { message_fast_3[327:320] , message_fast_3[319:312] , message_fast_3[311:304] , 8'b0 , message_fast_3 [303:264] , 8'b0 , message_fast_3[263:168] , 104'b0 }:
                                                                                         `defaut_message ;

endmodule
