`include "para_def.v"
module stage2_check_sum_module ( block_size_data , 
                                 seq_number_data ,
                                 message_number_data , 
                                 time_message_data , 
                                 message_1 , message_2 , message_3 ,
                                 check_sum_data 
                               );
    input  block_size_data , 
           seq_number_data , 
           message_number_data , 
           time_message_data , 
           message_1 , message_2 , message_3 ;
    output check_sum_data ;
    
    wire [ `block_size_data_bits - 1 : 0 ]     block_size_data ;
    wire [ `seq_number_data_bits - 1 : 0 ]     seq_number_data ;
    wire [ `message_number_data_bits - 1 : 0 ] message_number_data ;
    wire [ `time_message_data_bits - 1 : 0 ]   time_message_data ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]         message_1 , message_2 , message_3 ;
    wire [ `check_sum_data_bits - 1 : 0 ]      check_sum_data ;
    
    wire [ `check_sum_mid_data_bits - 1 : 0 ]  check_sum_mid[0:118] ; 
    
    assign check_sum_mid[0]   = block_size_data[15:8] + block_size_data[7:0] ;
    assign check_sum_mid[1]   = seq_number_data[31:24] + seq_number_data[23:16] ;
    assign check_sum_mid[2]   = seq_number_data[15:8] + seq_number_data[7:0] ;
    assign check_sum_mid[3]   = message_number_data[7:0] + time_message_data[63:56]  ;
    assign check_sum_mid[4]   = time_message_data[55:48] + time_message_data[47:40] ;
    assign check_sum_mid[5]   = time_message_data[39:32] + time_message_data[31:24] ;
    assign check_sum_mid[6]   = time_message_data[23:16] + time_message_data[15:7] ;
    assign check_sum_mid[7]   = time_message_data[7:0] + message_1[279:272] ;
    assign check_sum_mid[8]   = message_1[271:264] + message_1[263:256] ;
    assign check_sum_mid[9]   = message_1[255:248] + message_1[247:240] ;
    assign check_sum_mid[10]  = message_1[239:232] + message_1[231:224] ;
    assign check_sum_mid[11]  = message_1[223:216] + message_1[215:208] ;
    assign check_sum_mid[12]  = message_1[207:200] + message_1[199:192] ;
    assign check_sum_mid[13]  = message_1[191:184] + message_1[183:176] ;
    assign check_sum_mid[14]  = message_1[175:168] + message_1[167:160] ;
    assign check_sum_mid[15]  = message_1[159:152] + message_1[151:144] ;
    assign check_sum_mid[16]  = message_1[143:136] + message_1[135:128] ;
    assign check_sum_mid[17]  = message_1[127:120] + message_1[119:112] ;
    assign check_sum_mid[18]  = message_1[111:104] + message_1[103:96] ;
    assign check_sum_mid[19]  = message_1[95:88] + message_1[87:80] ;
    assign check_sum_mid[20]  = message_1[79:72] + message_1[71:64] ;
    assign check_sum_mid[21]  = message_1[63:56] + message_1[55:48] ;
    assign check_sum_mid[22]  = message_1[47:40] + message_1[39:32] ;
    assign check_sum_mid[23]  = message_1[31:24] + message_1[23:16] ;
    assign check_sum_mid[24]  = message_1[15:7] + message_1[7:0] ;
    assign check_sum_mid[25]  = message_2[279:272] + message_2[271:264] ;
    assign check_sum_mid[26]  = message_2[263:256] + message_2[255:248] ;
    assign check_sum_mid[27]  = message_2[247:240] + message_2[239:232] ;
    assign check_sum_mid[28]  = message_2[231:224] + message_2[223:216] ;
    assign check_sum_mid[29]  = message_2[215:208] + message_2[207:200] ;
    assign check_sum_mid[30]  = message_2[199:192] + message_2[191:184] ;
    assign check_sum_mid[31]  = message_2[183:176] + message_2[175:168] ;
    assign check_sum_mid[32]  = message_2[167:160] + message_2[159:152] ;
    assign check_sum_mid[33]  = message_2[151:144] + message_2[143:136] ;
    assign check_sum_mid[34]  = message_2[135:128] + message_2[127:120] ;
    assign check_sum_mid[35]  = message_2[119:112] + message_2[111:104] ;
    assign check_sum_mid[36]  = message_2[103:96] + message_2[95:88] ;
    assign check_sum_mid[37]  = message_2[87:80] + message_2[79:72] ;
    assign check_sum_mid[38]  = message_2[71:64] + message_2[63:56] ;
    assign check_sum_mid[39]  = message_2[55:48] + message_2[47:40] ;
    assign check_sum_mid[40]  = message_2[39:32] + message_2[31:24] ;
    assign check_sum_mid[41]  = message_2[23:16] + message_2[15:7] ;
    assign check_sum_mid[42]  = message_2[7:0] + message_3[279:272] ;
    assign check_sum_mid[43]  = message_3[271:264] + message_3[263:256] ;
    assign check_sum_mid[44]  = message_3[255:248] + message_3[247:240] ;
    assign check_sum_mid[45]  = message_3[239:232] + message_3[231:224] ;
    assign check_sum_mid[46]  = message_3[223:216] + message_3[215:208] ;
    assign check_sum_mid[47]  = message_3[207:200] + message_3[199:192] ;
    assign check_sum_mid[48]  = message_3[191:184] + message_3[183:176] ;
    assign check_sum_mid[49]  = message_3[175:168] + message_3[167:160] ;
    assign check_sum_mid[50]  = message_3[159:152] + message_3[151:144] ;
    assign check_sum_mid[51]  = message_3[143:136] + message_3[135:128] ;
    assign check_sum_mid[52]  = message_3[127:120] + message_3[119:112] ;
    assign check_sum_mid[53]  = message_3[111:104] + message_3[103:96] ;
    assign check_sum_mid[54]  = message_3[95:88] + message_3[87:80] ;
    assign check_sum_mid[55]  = message_3[79:72] + message_3[71:64] ;
    assign check_sum_mid[56]  = message_3[63:56] + message_3[55:48] ;
    assign check_sum_mid[57]  = message_3[47:40] + message_3[39:32] ;
    assign check_sum_mid[58]  = message_3[31:24] + message_3[23:16] ;
    assign check_sum_mid[59]  = message_3[15:8] + message_3[7:0] ;
    assign check_sum_mid[60]  = check_sum_mid[0] + check_sum_mid[1] ;
    assign check_sum_mid[61]  = check_sum_mid[2] + check_sum_mid[3] ;
    assign check_sum_mid[62]  = check_sum_mid[4] + check_sum_mid[5] ;
    assign check_sum_mid[63]  = check_sum_mid[6] + check_sum_mid[7] ;
    assign check_sum_mid[64]  = check_sum_mid[8] + check_sum_mid[9] ;
    assign check_sum_mid[65]  = check_sum_mid[10] + check_sum_mid[11] ;
    assign check_sum_mid[66]  = check_sum_mid[12] + check_sum_mid[13] ;
    assign check_sum_mid[67]  = check_sum_mid[14] + check_sum_mid[15] ;
    assign check_sum_mid[68]  = check_sum_mid[16] + check_sum_mid[17] ;
    assign check_sum_mid[69]  = check_sum_mid[18] + check_sum_mid[19] ;
    assign check_sum_mid[70]  = check_sum_mid[20] + check_sum_mid[21] ;
    assign check_sum_mid[71]  = check_sum_mid[22] + check_sum_mid[23] ;
    assign check_sum_mid[72]  = check_sum_mid[24] + check_sum_mid[25] ;
    assign check_sum_mid[73]  = check_sum_mid[26] + check_sum_mid[27] ;
    assign check_sum_mid[74]  = check_sum_mid[28] + check_sum_mid[29] ;
    assign check_sum_mid[75]  = check_sum_mid[30] + check_sum_mid[31] ;
    assign check_sum_mid[76]  = check_sum_mid[32] + check_sum_mid[33] ;
    assign check_sum_mid[77]  = check_sum_mid[34] + check_sum_mid[35] ;
    assign check_sum_mid[78]  = check_sum_mid[36] + check_sum_mid[37] ;
    assign check_sum_mid[79]  = check_sum_mid[38] + check_sum_mid[39] ;
    assign check_sum_mid[80]  = check_sum_mid[40] + check_sum_mid[41] ;
    assign check_sum_mid[81]  = check_sum_mid[42] + check_sum_mid[43] ;
    assign check_sum_mid[82]  = check_sum_mid[44] + check_sum_mid[45] ;
    assign check_sum_mid[83]  = check_sum_mid[46] + check_sum_mid[47] ;
    assign check_sum_mid[84]  = check_sum_mid[48] + check_sum_mid[49] ;
    assign check_sum_mid[85]  = check_sum_mid[50] + check_sum_mid[51] ;
    assign check_sum_mid[86]  = check_sum_mid[52] + check_sum_mid[53] ;
    assign check_sum_mid[87]  = check_sum_mid[54] + check_sum_mid[55] ;
    assign check_sum_mid[88]  = check_sum_mid[56] + check_sum_mid[57] ;
    assign check_sum_mid[89]  = check_sum_mid[58] + check_sum_mid[59] ;
    assign check_sum_mid[90]  = check_sum_mid[60] + check_sum_mid[61] ;
    assign check_sum_mid[91]  = check_sum_mid[62] + check_sum_mid[63] ;
    assign check_sum_mid[92]  = check_sum_mid[64] + check_sum_mid[65] ;
    assign check_sum_mid[93]  = check_sum_mid[66] + check_sum_mid[67] ;
    assign check_sum_mid[94]  = check_sum_mid[68] + check_sum_mid[69] ;
    assign check_sum_mid[95]  = check_sum_mid[70] + check_sum_mid[71] ;
    assign check_sum_mid[96]  = check_sum_mid[72] + check_sum_mid[73] ;
    assign check_sum_mid[97]  = check_sum_mid[74] + check_sum_mid[75] ;
    assign check_sum_mid[98]  = check_sum_mid[76] + check_sum_mid[77] ;
    assign check_sum_mid[99]  = check_sum_mid[78] + check_sum_mid[79] ;
    assign check_sum_mid[100] = check_sum_mid[80] + check_sum_mid[81] ;
    assign check_sum_mid[101] = check_sum_mid[82] + check_sum_mid[83] ;
    assign check_sum_mid[102] = check_sum_mid[84] + check_sum_mid[85] ;
    assign check_sum_mid[103] = check_sum_mid[86] + check_sum_mid[87] ;
    assign check_sum_mid[104] = check_sum_mid[88] + check_sum_mid[89] ;
    assign check_sum_mid[105] = check_sum_mid[90] + check_sum_mid[91] ;
    assign check_sum_mid[106] = check_sum_mid[92] + check_sum_mid[93] ;
    assign check_sum_mid[107] = check_sum_mid[94] + check_sum_mid[95] ;
    assign check_sum_mid[108] = check_sum_mid[96] + check_sum_mid[97] ;
    assign check_sum_mid[109] = check_sum_mid[98] + check_sum_mid[99] ;
    assign check_sum_mid[110] = check_sum_mid[100] + check_sum_mid[101] ;
    assign check_sum_mid[111] = check_sum_mid[102] + check_sum_mid[103] ;
    assign check_sum_mid[112] = check_sum_mid[104] + check_sum_mid[105] ;
    assign check_sum_mid[113] = check_sum_mid[106] + check_sum_mid[107] ;
    assign check_sum_mid[114] = check_sum_mid[108] + check_sum_mid[109] ;
    assign check_sum_mid[115] = check_sum_mid[110] + check_sum_mid[111] ;
    assign check_sum_mid[116] = check_sum_mid[112] + check_sum_mid[113] ;
    assign check_sum_mid[117] = check_sum_mid[114] + check_sum_mid[115] ;
    assign check_sum_mid[118] = check_sum_mid[116] + check_sum_mid[117] ;
    
    assign check_sum_data     = check_sum_mid[118][ `check_sum_data_bits - 1 : 0];
endmodule
