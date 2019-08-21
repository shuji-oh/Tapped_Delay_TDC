module tapped_delay_tdc (
	output Out,
	output Out2,
	input CLK,
    input CAN_logic,
	output [20:0] out_data,
    output reg [6:0] HEX5,
    output reg [6:0] HEX4,
    output reg [6:0] HEX3
);

reg [100:0] Sum2 = 400'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

wire [100:0] Co2 /* synthesis keep = 1 */;
reg [100:0] Sum_tmp;
reg [11:0] Sum2_hex = 0;
reg Ci = 0;
reg Selector;
wire Hit;

out_hex out_hex(.CLK(~CAN_logic), .byte_data_send(Sum2_hex[6:0]), .HEX_5(HEX5), .HEX_4(HEX4), .HEX_3(HEX3));

always @(posedge CAN_logic) begin
    Sum_tmp = Sum2;
    if(Sum_tmp[100]==Sum_tmp[0])Sum2_hex=100;
    else if(Sum_tmp[99]==Sum_tmp[0])Sum2_hex=99;
    else if(Sum_tmp[98]==Sum_tmp[0])Sum2_hex=98;
    else if(Sum_tmp[97]==Sum_tmp[0])Sum2_hex=97;
    else if(Sum_tmp[96]==Sum_tmp[0])Sum2_hex=96;
    else if(Sum_tmp[95]==Sum_tmp[0])Sum2_hex=95;
    else if(Sum_tmp[94]==Sum_tmp[0])Sum2_hex=94;
    else if(Sum_tmp[93]==Sum_tmp[0])Sum2_hex=93;
    else if(Sum_tmp[92]==Sum_tmp[0])Sum2_hex=92;
    else if(Sum_tmp[91]==Sum_tmp[0])Sum2_hex=91;
    else if(Sum_tmp[90]==Sum_tmp[0])Sum2_hex=90;
    else if(Sum_tmp[89]==Sum_tmp[0])Sum2_hex=89;
    else if(Sum_tmp[88]==Sum_tmp[0])Sum2_hex=88;
    else if(Sum_tmp[87]==Sum_tmp[0])Sum2_hex=87;
    else if(Sum_tmp[86]==Sum_tmp[0])Sum2_hex=86;
    else if(Sum_tmp[85]==Sum_tmp[0])Sum2_hex=85;
    else if(Sum_tmp[84]==Sum_tmp[0])Sum2_hex=84;
    else if(Sum_tmp[83]==Sum_tmp[0])Sum2_hex=83;
    else if(Sum_tmp[82]==Sum_tmp[0])Sum2_hex=82;
    else if(Sum_tmp[81]==Sum_tmp[0])Sum2_hex=81;
    else if(Sum_tmp[80]==Sum_tmp[0])Sum2_hex=80;
    else if(Sum_tmp[79]==Sum_tmp[0])Sum2_hex=79;
    else if(Sum_tmp[78]==Sum_tmp[0])Sum2_hex=78;
    else if(Sum_tmp[77]==Sum_tmp[0])Sum2_hex=77;
    else if(Sum_tmp[76]==Sum_tmp[0])Sum2_hex=76;
    else if(Sum_tmp[75]==Sum_tmp[0])Sum2_hex=75;
    else if(Sum_tmp[74]==Sum_tmp[0])Sum2_hex=74;
    else if(Sum_tmp[73]==Sum_tmp[0])Sum2_hex=73;
    else if(Sum_tmp[72]==Sum_tmp[0])Sum2_hex=72;
    else if(Sum_tmp[71]==Sum_tmp[0])Sum2_hex=71;
    else if(Sum_tmp[70]==Sum_tmp[0])Sum2_hex=70;
    else if(Sum_tmp[69]==Sum_tmp[0])Sum2_hex=69;
    else if(Sum_tmp[68]==Sum_tmp[0])Sum2_hex=68;
    else if(Sum_tmp[67]==Sum_tmp[0])Sum2_hex=67;
    else if(Sum_tmp[66]==Sum_tmp[0])Sum2_hex=66;
    else if(Sum_tmp[65]==Sum_tmp[0])Sum2_hex=65;
    else if(Sum_tmp[64]==Sum_tmp[0])Sum2_hex=64;
    else if(Sum_tmp[63]==Sum_tmp[0])Sum2_hex=63;
    else if(Sum_tmp[62]==Sum_tmp[0])Sum2_hex=62;
    else if(Sum_tmp[61]==Sum_tmp[0])Sum2_hex=61;
    else if(Sum_tmp[60]==Sum_tmp[0])Sum2_hex=60;
    else if(Sum_tmp[59]==Sum_tmp[0])Sum2_hex=59;
    else if(Sum_tmp[58]==Sum_tmp[0])Sum2_hex=58;
    else if(Sum_tmp[57]==Sum_tmp[0])Sum2_hex=57;
    else if(Sum_tmp[56]==Sum_tmp[0])Sum2_hex=56;
    else if(Sum_tmp[55]==Sum_tmp[0])Sum2_hex=55;
    else if(Sum_tmp[54]==Sum_tmp[0])Sum2_hex=54;
    else if(Sum_tmp[53]==Sum_tmp[0])Sum2_hex=53;
    else if(Sum_tmp[52]==Sum_tmp[0])Sum2_hex=52;
    else if(Sum_tmp[51]==Sum_tmp[0])Sum2_hex=51;
    else if(Sum_tmp[50]==Sum_tmp[0])Sum2_hex=50;
    else if(Sum_tmp[49]==Sum_tmp[0])Sum2_hex=49;
    else if(Sum_tmp[48]==Sum_tmp[0])Sum2_hex=48;
    else if(Sum_tmp[47]==Sum_tmp[0])Sum2_hex=47;
    else if(Sum_tmp[46]==Sum_tmp[0])Sum2_hex=46;
    else if(Sum_tmp[45]==Sum_tmp[0])Sum2_hex=45;
    else if(Sum_tmp[44]==Sum_tmp[0])Sum2_hex=44;
    else if(Sum_tmp[43]==Sum_tmp[0])Sum2_hex=43;
    else if(Sum_tmp[42]==Sum_tmp[0])Sum2_hex=42;
    else if(Sum_tmp[41]==Sum_tmp[0])Sum2_hex=41;
    else if(Sum_tmp[40]==Sum_tmp[0])Sum2_hex=40;
    else if(Sum_tmp[39]==Sum_tmp[0])Sum2_hex=39;
    else if(Sum_tmp[38]==Sum_tmp[0])Sum2_hex=38;
    else if(Sum_tmp[37]==Sum_tmp[0])Sum2_hex=37;
    else if(Sum_tmp[36]==Sum_tmp[0])Sum2_hex=36;
    else if(Sum_tmp[35]==Sum_tmp[0])Sum2_hex=35;
    else if(Sum_tmp[34]==Sum_tmp[0])Sum2_hex=34;
    else if(Sum_tmp[33]==Sum_tmp[0])Sum2_hex=33;
    else if(Sum_tmp[32]==Sum_tmp[0])Sum2_hex=32;
    else if(Sum_tmp[31]==Sum_tmp[0])Sum2_hex=31;
    else if(Sum_tmp[30]==Sum_tmp[0])Sum2_hex=30;
    else if(Sum_tmp[29]==Sum_tmp[0])Sum2_hex=29;
    else if(Sum_tmp[28]==Sum_tmp[0])Sum2_hex=28;
    else if(Sum_tmp[27]==Sum_tmp[0])Sum2_hex=27;
    else if(Sum_tmp[26]==Sum_tmp[0])Sum2_hex=26;
    else if(Sum_tmp[25]==Sum_tmp[0])Sum2_hex=25;
    else if(Sum_tmp[24]==Sum_tmp[0])Sum2_hex=24;
    else if(Sum_tmp[23]==Sum_tmp[0])Sum2_hex=23;
    else if(Sum_tmp[22]==Sum_tmp[0])Sum2_hex=22;
    else if(Sum_tmp[21]==Sum_tmp[0])Sum2_hex=21;
    else if(Sum_tmp[20]==Sum_tmp[0])Sum2_hex=20;
    else if(Sum_tmp[19]==Sum_tmp[0])Sum2_hex=19;
    else if(Sum_tmp[18]==Sum_tmp[0])Sum2_hex=18;
    else if(Sum_tmp[17]==Sum_tmp[0])Sum2_hex=17;
    else if(Sum_tmp[16]==Sum_tmp[0])Sum2_hex=16;
    else if(Sum_tmp[15]==Sum_tmp[0])Sum2_hex=15;
    else if(Sum_tmp[14]==Sum_tmp[0])Sum2_hex=14;
    else if(Sum_tmp[13]==Sum_tmp[0])Sum2_hex=13;
    else if(Sum_tmp[12]==Sum_tmp[0])Sum2_hex=12;
    else if(Sum_tmp[11]==Sum_tmp[0])Sum2_hex=11;
    else if(Sum_tmp[10]==Sum_tmp[0])Sum2_hex=10;
    else if(Sum_tmp[9]==Sum_tmp[0])Sum2_hex=9;
    else if(Sum_tmp[8]==Sum_tmp[0])Sum2_hex=8;
    else if(Sum_tmp[7]==Sum_tmp[0])Sum2_hex=7;
    else if(Sum_tmp[6]==Sum_tmp[0])Sum2_hex=6;
    else if(Sum_tmp[5]==Sum_tmp[0])Sum2_hex=5;
    else if(Sum_tmp[4]==Sum_tmp[0])Sum2_hex=4;
    else if(Sum_tmp[3]==Sum_tmp[0])Sum2_hex=3;
    else if(Sum_tmp[2]==Sum_tmp[0])Sum2_hex=2;
    else if(Sum_tmp[1]==Sum_tmp[0])Sum2_hex=1;
    else Sum2_hex=0;
end

reg chapture;
reg [20:0] time_counter = 0;
reg [20:0] measure_time = 0;

//always @(posedge min_CLK) begin
//    if (Hit) chapture <= 1;
//    if (time_counter >= 1700000) begin
//        chapture <= 0;
//        time_counter = 0;
//    end
//end
//
//always @(posedge Hit) begin
//    measure_time[20:0] = time_counter;
//end
//
//wire min_CLK = Sum2[1023];
//
//always @(posedge min_CLK or posedge Hit) begin 
//    LEDr <= 1;
//    inv_flag <= 1;
//    if (chapture) begin
//        if (inv_flag == 1) inv_flag <= 0;
//        else inv_flag <= 1;
//    end
//end

//always @(posedge CLK) begin
//    if (Hit == 0) 
//        Hit <= 1;
//    else
//        Hit <= 0;
//end

adder adder_0(.Sum(Sum2[0]), .Co(Co2[0]), .A(1), .B(Hit), .Ci(Ci));
adder adder_1(.Sum(Sum2[1]), .Co(Co2[1]), .A(1), .B(0), .Ci(Co2[0]));
adder adder_2(.Sum(Sum2[2]), .Co(Co2[2]), .A(1), .B(0), .Ci(Co2[1]));
adder adder_3(.Sum(Sum2[3]), .Co(Co2[3]), .A(1), .B(0), .Ci(Co2[2]));
adder adder_4(.Sum(Sum2[4]), .Co(Co2[4]), .A(1), .B(0), .Ci(Co2[3]));
adder adder_5(.Sum(Sum2[5]), .Co(Co2[5]), .A(1), .B(0), .Ci(Co2[4]));
adder adder_6(.Sum(Sum2[6]), .Co(Co2[6]), .A(1), .B(0), .Ci(Co2[5]));
adder adder_7(.Sum(Sum2[7]), .Co(Co2[7]), .A(1), .B(0), .Ci(Co2[6]));
adder adder_8(.Sum(Sum2[8]), .Co(Co2[8]), .A(1), .B(0), .Ci(Co2[7]));
adder adder_9(.Sum(Sum2[9]), .Co(Co2[9]), .A(1), .B(0), .Ci(Co2[8]));
adder adder_10(.Sum(Sum2[10]), .Co(Co2[10]), .A(1), .B(0), .Ci(Co2[9]));
adder adder_11(.Sum(Sum2[11]), .Co(Co2[11]), .A(1), .B(0), .Ci(Co2[10]));
adder adder_12(.Sum(Sum2[12]), .Co(Co2[12]), .A(1), .B(0), .Ci(Co2[11]));
adder adder_13(.Sum(Sum2[13]), .Co(Co2[13]), .A(1), .B(0), .Ci(Co2[12]));
adder adder_14(.Sum(Sum2[14]), .Co(Co2[14]), .A(1), .B(0), .Ci(Co2[13]));
adder adder_15(.Sum(Sum2[15]), .Co(Co2[15]), .A(1), .B(0), .Ci(Co2[14]));
adder adder_16(.Sum(Sum2[16]), .Co(Co2[16]), .A(1), .B(0), .Ci(Co2[15]));
adder adder_17(.Sum(Sum2[17]), .Co(Co2[17]), .A(1), .B(0), .Ci(Co2[16]));
adder adder_18(.Sum(Sum2[18]), .Co(Co2[18]), .A(1), .B(0), .Ci(Co2[17]));
adder adder_19(.Sum(Sum2[19]), .Co(Co2[19]), .A(1), .B(0), .Ci(Co2[18]));
adder adder_20(.Sum(Sum2[20]), .Co(Co2[20]), .A(1), .B(0), .Ci(Co2[19]));
adder adder_21(.Sum(Sum2[21]), .Co(Co2[21]), .A(1), .B(0), .Ci(Co2[20]));
adder adder_22(.Sum(Sum2[22]), .Co(Co2[22]), .A(1), .B(0), .Ci(Co2[21]));
adder adder_23(.Sum(Sum2[23]), .Co(Co2[23]), .A(1), .B(0), .Ci(Co2[22]));
adder adder_24(.Sum(Sum2[24]), .Co(Co2[24]), .A(1), .B(0), .Ci(Co2[23]));
adder adder_25(.Sum(Sum2[25]), .Co(Co2[25]), .A(1), .B(0), .Ci(Co2[24]));
adder adder_26(.Sum(Sum2[26]), .Co(Co2[26]), .A(1), .B(0), .Ci(Co2[25]));
adder adder_27(.Sum(Sum2[27]), .Co(Co2[27]), .A(1), .B(0), .Ci(Co2[26]));
adder adder_28(.Sum(Sum2[28]), .Co(Co2[28]), .A(1), .B(0), .Ci(Co2[27]));
adder adder_29(.Sum(Sum2[29]), .Co(Co2[29]), .A(1), .B(0), .Ci(Co2[28]));
adder adder_30(.Sum(Sum2[30]), .Co(Co2[30]), .A(1), .B(0), .Ci(Co2[29]));
adder adder_31(.Sum(Sum2[31]), .Co(Co2[31]), .A(1), .B(0), .Ci(Co2[30]));
adder adder_32(.Sum(Sum2[32]), .Co(Co2[32]), .A(1), .B(0), .Ci(Co2[31]));
adder adder_33(.Sum(Sum2[33]), .Co(Co2[33]), .A(1), .B(0), .Ci(Co2[32]));
adder adder_34(.Sum(Sum2[34]), .Co(Co2[34]), .A(1), .B(0), .Ci(Co2[33]));
adder adder_35(.Sum(Sum2[35]), .Co(Co2[35]), .A(1), .B(0), .Ci(Co2[34]));
adder adder_36(.Sum(Sum2[36]), .Co(Co2[36]), .A(1), .B(0), .Ci(Co2[35]));
adder adder_37(.Sum(Sum2[37]), .Co(Co2[37]), .A(1), .B(0), .Ci(Co2[36]));
adder adder_38(.Sum(Sum2[38]), .Co(Co2[38]), .A(1), .B(0), .Ci(Co2[37]));
adder adder_39(.Sum(Sum2[39]), .Co(Co2[39]), .A(1), .B(0), .Ci(Co2[38]));
adder adder_40(.Sum(Sum2[40]), .Co(Co2[40]), .A(1), .B(0), .Ci(Co2[39]));
adder adder_41(.Sum(Sum2[41]), .Co(Co2[41]), .A(1), .B(0), .Ci(Co2[40]));
adder adder_42(.Sum(Sum2[42]), .Co(Co2[42]), .A(1), .B(0), .Ci(Co2[41]));
adder adder_43(.Sum(Sum2[43]), .Co(Co2[43]), .A(1), .B(0), .Ci(Co2[42]));
adder adder_44(.Sum(Sum2[44]), .Co(Co2[44]), .A(1), .B(0), .Ci(Co2[43]));
adder adder_45(.Sum(Sum2[45]), .Co(Co2[45]), .A(1), .B(0), .Ci(Co2[44]));
adder adder_46(.Sum(Sum2[46]), .Co(Co2[46]), .A(1), .B(0), .Ci(Co2[45]));
adder adder_47(.Sum(Sum2[47]), .Co(Co2[47]), .A(1), .B(0), .Ci(Co2[46]));
adder adder_48(.Sum(Sum2[48]), .Co(Co2[48]), .A(1), .B(0), .Ci(Co2[47]));
adder adder_49(.Sum(Sum2[49]), .Co(Co2[49]), .A(1), .B(0), .Ci(Co2[48]));
adder adder_50(.Sum(Sum2[50]), .Co(Co2[50]), .A(1), .B(0), .Ci(Co2[49]));
adder adder_51(.Sum(Sum2[51]), .Co(Co2[51]), .A(1), .B(0), .Ci(Co2[50]));
adder adder_52(.Sum(Sum2[52]), .Co(Co2[52]), .A(1), .B(0), .Ci(Co2[51]));
adder adder_53(.Sum(Sum2[53]), .Co(Co2[53]), .A(1), .B(0), .Ci(Co2[52]));
adder adder_54(.Sum(Sum2[54]), .Co(Co2[54]), .A(1), .B(0), .Ci(Co2[53]));
adder adder_55(.Sum(Sum2[55]), .Co(Co2[55]), .A(1), .B(0), .Ci(Co2[54]));
adder adder_56(.Sum(Sum2[56]), .Co(Co2[56]), .A(1), .B(0), .Ci(Co2[55]));
adder adder_57(.Sum(Sum2[57]), .Co(Co2[57]), .A(1), .B(0), .Ci(Co2[56]));
adder adder_58(.Sum(Sum2[58]), .Co(Co2[58]), .A(1), .B(0), .Ci(Co2[57]));
adder adder_59(.Sum(Sum2[59]), .Co(Co2[59]), .A(1), .B(0), .Ci(Co2[58]));
adder adder_60(.Sum(Sum2[60]), .Co(Co2[60]), .A(1), .B(0), .Ci(Co2[59]));
adder adder_61(.Sum(Sum2[61]), .Co(Co2[61]), .A(1), .B(0), .Ci(Co2[60]));
adder adder_62(.Sum(Sum2[62]), .Co(Co2[62]), .A(1), .B(0), .Ci(Co2[61]));
adder adder_63(.Sum(Sum2[63]), .Co(Co2[63]), .A(1), .B(0), .Ci(Co2[62]));
adder adder_64(.Sum(Sum2[64]), .Co(Co2[64]), .A(1), .B(0), .Ci(Co2[63]));
adder adder_65(.Sum(Sum2[65]), .Co(Co2[65]), .A(1), .B(0), .Ci(Co2[64]));
adder adder_66(.Sum(Sum2[66]), .Co(Co2[66]), .A(1), .B(0), .Ci(Co2[65]));
adder adder_67(.Sum(Sum2[67]), .Co(Co2[67]), .A(1), .B(0), .Ci(Co2[66]));
adder adder_68(.Sum(Sum2[68]), .Co(Co2[68]), .A(1), .B(0), .Ci(Co2[67]));
adder adder_69(.Sum(Sum2[69]), .Co(Co2[69]), .A(1), .B(0), .Ci(Co2[68]));
adder adder_70(.Sum(Sum2[70]), .Co(Co2[70]), .A(1), .B(0), .Ci(Co2[69]));
adder adder_71(.Sum(Sum2[71]), .Co(Co2[71]), .A(1), .B(0), .Ci(Co2[70]));
adder adder_72(.Sum(Sum2[72]), .Co(Co2[72]), .A(1), .B(0), .Ci(Co2[71]));
adder adder_73(.Sum(Sum2[73]), .Co(Co2[73]), .A(1), .B(0), .Ci(Co2[72]));
adder adder_74(.Sum(Sum2[74]), .Co(Co2[74]), .A(1), .B(0), .Ci(Co2[73]));
adder adder_75(.Sum(Sum2[75]), .Co(Co2[75]), .A(1), .B(0), .Ci(Co2[74]));
adder adder_76(.Sum(Sum2[76]), .Co(Co2[76]), .A(1), .B(0), .Ci(Co2[75]));
adder adder_77(.Sum(Sum2[77]), .Co(Co2[77]), .A(1), .B(0), .Ci(Co2[76]));
adder adder_78(.Sum(Sum2[78]), .Co(Co2[78]), .A(1), .B(0), .Ci(Co2[77]));
adder adder_79(.Sum(Sum2[79]), .Co(Co2[79]), .A(1), .B(0), .Ci(Co2[78]));
adder adder_80(.Sum(Sum2[80]), .Co(Co2[80]), .A(1), .B(0), .Ci(Co2[79]));
adder adder_81(.Sum(Sum2[81]), .Co(Co2[81]), .A(1), .B(0), .Ci(Co2[80]));
adder adder_82(.Sum(Sum2[82]), .Co(Co2[82]), .A(1), .B(0), .Ci(Co2[81]));
adder adder_83(.Sum(Sum2[83]), .Co(Co2[83]), .A(1), .B(0), .Ci(Co2[82]));
adder adder_84(.Sum(Sum2[84]), .Co(Co2[84]), .A(1), .B(0), .Ci(Co2[83]));
adder adder_85(.Sum(Sum2[85]), .Co(Co2[85]), .A(1), .B(0), .Ci(Co2[84]));
adder adder_86(.Sum(Sum2[86]), .Co(Co2[86]), .A(1), .B(0), .Ci(Co2[85]));
adder adder_87(.Sum(Sum2[87]), .Co(Co2[87]), .A(1), .B(0), .Ci(Co2[86]));
adder adder_88(.Sum(Sum2[88]), .Co(Co2[88]), .A(1), .B(0), .Ci(Co2[87]));
adder adder_89(.Sum(Sum2[89]), .Co(Co2[89]), .A(1), .B(0), .Ci(Co2[88]));
adder adder_90(.Sum(Sum2[90]), .Co(Co2[90]), .A(1), .B(0), .Ci(Co2[89]));
adder adder_91(.Sum(Sum2[91]), .Co(Co2[91]), .A(1), .B(0), .Ci(Co2[90]));
adder adder_92(.Sum(Sum2[92]), .Co(Co2[92]), .A(1), .B(0), .Ci(Co2[91]));
adder adder_93(.Sum(Sum2[93]), .Co(Co2[93]), .A(1), .B(0), .Ci(Co2[92]));
adder adder_94(.Sum(Sum2[94]), .Co(Co2[94]), .A(1), .B(0), .Ci(Co2[93]));
adder adder_95(.Sum(Sum2[95]), .Co(Co2[95]), .A(1), .B(0), .Ci(Co2[94]));
adder adder_96(.Sum(Sum2[96]), .Co(Co2[96]), .A(1), .B(0), .Ci(Co2[95]));
adder adder_97(.Sum(Sum2[97]), .Co(Co2[97]), .A(1), .B(0), .Ci(Co2[96]));
adder adder_98(.Sum(Sum2[98]), .Co(Co2[98]), .A(1), .B(0), .Ci(Co2[97]));
adder adder_99(.Sum(Sum2[99]), .Co(Co2[99]), .A(1), .B(0), .Ci(Co2[98]));
adder adder_100(.Sum(Sum2[100]), .Co(Co2[100]), .A(1), .B(0), .Ci(Co2[99]));

assign Hit = CLK;
assign Out = Sum2[0];
assign Out2 = Sum2[100];

endmodule

