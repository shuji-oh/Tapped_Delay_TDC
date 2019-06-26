module tapped_delay_tdc (
	output Out,
	input CLK,
    input RST,
	output [20:0] out_data,
    output reg [6:0] HEX5,
    output reg [6:0] HEX4,
    output reg [6:0] HEX3,
    output reg LED1
);

reg [1023:0] Sum2 = 4096'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
reg [1023:0] Co2 = 4096'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
reg [11:0] Sum2_hex = 0;
reg Ci = 0;
reg Selector;
reg Hit = 0;
reg LEDr = 0;

always @(posedge CLK) begin
    if (Hit == 0) 
        Hit <= 1;
    else
        Hit <= 0;
end

reg [2:0] RSTr = 0;
always @(negedge Hit) begin
    RSTr <= {RSTr[1:0], RST};
end
wire RST_risingedge = (RSTr[2:0]==3'b001);

out_hex out_hex(.CLK(RST_risingedge), .byte_data_send(Sum2_hex[9:0]), .HEX_5(HEX5), .HEX_4(HEX4), .HEX_3(HEX3));

always @(negedge Hit) begin
    if(RST == 1) begin
        if(Sum2[511]==0)Sum2_hex=511;
        else if(Sum2[510]==0)Sum2_hex=510;
        else if(Sum2[509]==0)Sum2_hex=509;
        else if(Sum2[508]==0)Sum2_hex=508;
        else if(Sum2[507]==0)Sum2_hex=507;
        else if(Sum2[506]==0)Sum2_hex=506;
        else if(Sum2[505]==0)Sum2_hex=505;
        else if(Sum2[504]==0)Sum2_hex=504;
        else if(Sum2[503]==0)Sum2_hex=503;
        else if(Sum2[502]==0)Sum2_hex=502;
        else if(Sum2[501]==0)Sum2_hex=501;
        else if(Sum2[500]==0)Sum2_hex=500;
        else if(Sum2[499]==0)Sum2_hex=499;
        else if(Sum2[498]==0)Sum2_hex=498;
        else if(Sum2[497]==0)Sum2_hex=497;
        else if(Sum2[496]==0)Sum2_hex=496;
        else if(Sum2[495]==0)Sum2_hex=495;
        else if(Sum2[494]==0)Sum2_hex=494;
        else if(Sum2[493]==0)Sum2_hex=493;
        else if(Sum2[492]==0)Sum2_hex=492;
        else if(Sum2[491]==0)Sum2_hex=491;
        else if(Sum2[490]==0)Sum2_hex=490;
        else if(Sum2[489]==0)Sum2_hex=489;
        else if(Sum2[488]==0)Sum2_hex=488;
        else if(Sum2[487]==0)Sum2_hex=487;
        else if(Sum2[486]==0)Sum2_hex=486;
        else if(Sum2[485]==0)Sum2_hex=485;
        else if(Sum2[484]==0)Sum2_hex=484;
        else if(Sum2[483]==0)Sum2_hex=483;
        else if(Sum2[482]==0)Sum2_hex=482;
        else if(Sum2[481]==0)Sum2_hex=481;
        else if(Sum2[480]==0)Sum2_hex=480;
        else if(Sum2[479]==0)Sum2_hex=479;
        else if(Sum2[478]==0)Sum2_hex=478;
        else if(Sum2[477]==0)Sum2_hex=477;
        else if(Sum2[476]==0)Sum2_hex=476;
        else if(Sum2[475]==0)Sum2_hex=475;
        else if(Sum2[474]==0)Sum2_hex=474;
        else if(Sum2[473]==0)Sum2_hex=473;
        else if(Sum2[472]==0)Sum2_hex=472;
        else if(Sum2[471]==0)Sum2_hex=471;
        else if(Sum2[470]==0)Sum2_hex=470;
        else if(Sum2[469]==0)Sum2_hex=469;
        else if(Sum2[468]==0)Sum2_hex=468;
        else if(Sum2[467]==0)Sum2_hex=467;
        else if(Sum2[466]==0)Sum2_hex=466;
        else if(Sum2[465]==0)Sum2_hex=465;
        else if(Sum2[464]==0)Sum2_hex=464;
        else if(Sum2[463]==0)Sum2_hex=463;
        else if(Sum2[462]==0)Sum2_hex=462;
        else if(Sum2[461]==0)Sum2_hex=461;
        else if(Sum2[460]==0)Sum2_hex=460;
        else if(Sum2[459]==0)Sum2_hex=459;
        else if(Sum2[458]==0)Sum2_hex=458;
        else if(Sum2[457]==0)Sum2_hex=457;
        else if(Sum2[456]==0)Sum2_hex=456;
        else if(Sum2[455]==0)Sum2_hex=455;
        else if(Sum2[454]==0)Sum2_hex=454;
        else if(Sum2[453]==0)Sum2_hex=453;
        else if(Sum2[452]==0)Sum2_hex=452;
        else if(Sum2[451]==0)Sum2_hex=451;
        else if(Sum2[450]==0)Sum2_hex=450;
        else if(Sum2[449]==0)Sum2_hex=449;
        else if(Sum2[448]==0)Sum2_hex=448;
        else if(Sum2[447]==0)Sum2_hex=447;
        else if(Sum2[446]==0)Sum2_hex=446;
        else if(Sum2[445]==0)Sum2_hex=445;
        else if(Sum2[444]==0)Sum2_hex=444;
        else if(Sum2[443]==0)Sum2_hex=443;
        else if(Sum2[442]==0)Sum2_hex=442;
        else if(Sum2[441]==0)Sum2_hex=441;
        else if(Sum2[440]==0)Sum2_hex=440;
        else if(Sum2[439]==0)Sum2_hex=439;
        else if(Sum2[438]==0)Sum2_hex=438;
        else if(Sum2[437]==0)Sum2_hex=437;
        else if(Sum2[436]==0)Sum2_hex=436;
        else if(Sum2[435]==0)Sum2_hex=435;
        else if(Sum2[434]==0)Sum2_hex=434;
        else if(Sum2[433]==0)Sum2_hex=433;
        else if(Sum2[432]==0)Sum2_hex=432;
        else if(Sum2[431]==0)Sum2_hex=431;
        else if(Sum2[430]==0)Sum2_hex=430;
        else if(Sum2[429]==0)Sum2_hex=429;
        else if(Sum2[428]==0)Sum2_hex=428;
        else if(Sum2[427]==0)Sum2_hex=427;
        else if(Sum2[426]==0)Sum2_hex=426;
        else if(Sum2[425]==0)Sum2_hex=425;
        else if(Sum2[424]==0)Sum2_hex=424;
        else if(Sum2[423]==0)Sum2_hex=423;
        else if(Sum2[422]==0)Sum2_hex=422;
        else if(Sum2[421]==0)Sum2_hex=421;
        else if(Sum2[420]==0)Sum2_hex=420;
        else if(Sum2[419]==0)Sum2_hex=419;
        else if(Sum2[418]==0)Sum2_hex=418;
        else if(Sum2[417]==0)Sum2_hex=417;
        else if(Sum2[416]==0)Sum2_hex=416;
        else if(Sum2[415]==0)Sum2_hex=415;
        else if(Sum2[414]==0)Sum2_hex=414;
        else if(Sum2[413]==0)Sum2_hex=413;
        else if(Sum2[412]==0)Sum2_hex=412;
        else if(Sum2[411]==0)Sum2_hex=411;
        else if(Sum2[410]==0)Sum2_hex=410;
        else if(Sum2[409]==0)Sum2_hex=409;
        else if(Sum2[408]==0)Sum2_hex=408;
        else if(Sum2[407]==0)Sum2_hex=407;
        else if(Sum2[406]==0)Sum2_hex=406;
        else if(Sum2[405]==0)Sum2_hex=405;
        else if(Sum2[404]==0)Sum2_hex=404;
        else if(Sum2[403]==0)Sum2_hex=403;
        else if(Sum2[402]==0)Sum2_hex=402;
        else if(Sum2[401]==0)Sum2_hex=401;
        else if(Sum2[400]==0)Sum2_hex=400;
        else if(Sum2[399]==0)Sum2_hex=399;
        else if(Sum2[398]==0)Sum2_hex=398;
        else if(Sum2[397]==0)Sum2_hex=397;
        else if(Sum2[396]==0)Sum2_hex=396;
        else if(Sum2[395]==0)Sum2_hex=395;
        else if(Sum2[394]==0)Sum2_hex=394;
        else if(Sum2[393]==0)Sum2_hex=393;
        else if(Sum2[392]==0)Sum2_hex=392;
        else if(Sum2[391]==0)Sum2_hex=391;
        else if(Sum2[390]==0)Sum2_hex=390;
        else if(Sum2[389]==0)Sum2_hex=389;
        else if(Sum2[388]==0)Sum2_hex=388;
        else if(Sum2[387]==0)Sum2_hex=387;
        else if(Sum2[386]==0)Sum2_hex=386;
        else if(Sum2[385]==0)Sum2_hex=385;
        else if(Sum2[384]==0)Sum2_hex=384;
        else if(Sum2[383]==0)Sum2_hex=383;
        else if(Sum2[382]==0)Sum2_hex=382;
        else if(Sum2[381]==0)Sum2_hex=381;
        else if(Sum2[380]==0)Sum2_hex=380;
        else if(Sum2[379]==0)Sum2_hex=379;
        else if(Sum2[378]==0)Sum2_hex=378;
        else if(Sum2[377]==0)Sum2_hex=377;
        else if(Sum2[376]==0)Sum2_hex=376;
        else if(Sum2[375]==0)Sum2_hex=375;
        else if(Sum2[374]==0)Sum2_hex=374;
        else if(Sum2[373]==0)Sum2_hex=373;
        else if(Sum2[372]==0)Sum2_hex=372;
        else if(Sum2[371]==0)Sum2_hex=371;
        else if(Sum2[370]==0)Sum2_hex=370;
        else if(Sum2[369]==0)Sum2_hex=369;
        else if(Sum2[368]==0)Sum2_hex=368;
        else if(Sum2[367]==0)Sum2_hex=367;
        else if(Sum2[366]==0)Sum2_hex=366;
        else if(Sum2[365]==0)Sum2_hex=365;
        else if(Sum2[364]==0)Sum2_hex=364;
        else if(Sum2[363]==0)Sum2_hex=363;
        else if(Sum2[362]==0)Sum2_hex=362;
        else if(Sum2[361]==0)Sum2_hex=361;
        else if(Sum2[360]==0)Sum2_hex=360;
        else if(Sum2[359]==0)Sum2_hex=359;
        else if(Sum2[358]==0)Sum2_hex=358;
        else if(Sum2[357]==0)Sum2_hex=357;
        else if(Sum2[356]==0)Sum2_hex=356;
        else if(Sum2[355]==0)Sum2_hex=355;
        else if(Sum2[354]==0)Sum2_hex=354;
        else if(Sum2[353]==0)Sum2_hex=353;
        else if(Sum2[352]==0)Sum2_hex=352;
        else if(Sum2[351]==0)Sum2_hex=351;
        else if(Sum2[350]==0)Sum2_hex=350;
        else if(Sum2[349]==0)Sum2_hex=349;
        else if(Sum2[348]==0)Sum2_hex=348;
        else if(Sum2[347]==0)Sum2_hex=347;
        else if(Sum2[346]==0)Sum2_hex=346;
        else if(Sum2[345]==0)Sum2_hex=345;
        else if(Sum2[344]==0)Sum2_hex=344;
        else if(Sum2[343]==0)Sum2_hex=343;
        else if(Sum2[342]==0)Sum2_hex=342;
        else if(Sum2[341]==0)Sum2_hex=341;
        else if(Sum2[340]==0)Sum2_hex=340;
        else if(Sum2[339]==0)Sum2_hex=339;
        else if(Sum2[338]==0)Sum2_hex=338;
        else if(Sum2[337]==0)Sum2_hex=337;
        else if(Sum2[336]==0)Sum2_hex=336;
        else if(Sum2[335]==0)Sum2_hex=335;
        else if(Sum2[334]==0)Sum2_hex=334;
        else if(Sum2[333]==0)Sum2_hex=333;
        else if(Sum2[332]==0)Sum2_hex=332;
        else if(Sum2[331]==0)Sum2_hex=331;
        else if(Sum2[330]==0)Sum2_hex=330;
        else if(Sum2[329]==0)Sum2_hex=329;
        else if(Sum2[328]==0)Sum2_hex=328;
        else if(Sum2[327]==0)Sum2_hex=327;
        else if(Sum2[326]==0)Sum2_hex=326;
        else if(Sum2[325]==0)Sum2_hex=325;
        else if(Sum2[324]==0)Sum2_hex=324;
        else if(Sum2[323]==0)Sum2_hex=323;
        else if(Sum2[322]==0)Sum2_hex=322;
        else if(Sum2[321]==0)Sum2_hex=321;
        else if(Sum2[320]==0)Sum2_hex=320;
        else if(Sum2[319]==0)Sum2_hex=319;
        else if(Sum2[318]==0)Sum2_hex=318;
        else if(Sum2[317]==0)Sum2_hex=317;
        else if(Sum2[316]==0)Sum2_hex=316;
        else if(Sum2[315]==0)Sum2_hex=315;
        else if(Sum2[314]==0)Sum2_hex=314;
        else if(Sum2[313]==0)Sum2_hex=313;
        else if(Sum2[312]==0)Sum2_hex=312;
        else if(Sum2[311]==0)Sum2_hex=311;
        else if(Sum2[310]==0)Sum2_hex=310;
        else if(Sum2[309]==0)Sum2_hex=309;
        else if(Sum2[308]==0)Sum2_hex=308;
        else if(Sum2[307]==0)Sum2_hex=307;
        else if(Sum2[306]==0)Sum2_hex=306;
        else if(Sum2[305]==0)Sum2_hex=305;
        else if(Sum2[304]==0)Sum2_hex=304;
        else if(Sum2[303]==0)Sum2_hex=303;
        else if(Sum2[302]==0)Sum2_hex=302;
        else if(Sum2[301]==0)Sum2_hex=301;
        else if(Sum2[300]==0)Sum2_hex=300;
        else if(Sum2[299]==0)Sum2_hex=299;
        else if(Sum2[298]==0)Sum2_hex=298;
        else if(Sum2[297]==0)Sum2_hex=297;
        else if(Sum2[296]==0)Sum2_hex=296;
        else if(Sum2[295]==0)Sum2_hex=295;
        else if(Sum2[294]==0)Sum2_hex=294;
        else if(Sum2[293]==0)Sum2_hex=293;
        else if(Sum2[292]==0)Sum2_hex=292;
        else if(Sum2[291]==0)Sum2_hex=291;
        else if(Sum2[290]==0)Sum2_hex=290;
        else if(Sum2[289]==0)Sum2_hex=289;
        else if(Sum2[288]==0)Sum2_hex=288;
        else if(Sum2[287]==0)Sum2_hex=287;
        else if(Sum2[286]==0)Sum2_hex=286;
        else if(Sum2[285]==0)Sum2_hex=285;
        else if(Sum2[284]==0)Sum2_hex=284;
        else if(Sum2[283]==0)Sum2_hex=283;
        else if(Sum2[282]==0)Sum2_hex=282;
        else if(Sum2[281]==0)Sum2_hex=281;
        else if(Sum2[280]==0)Sum2_hex=280;
        else if(Sum2[279]==0)Sum2_hex=279;
        else if(Sum2[278]==0)Sum2_hex=278;
        else if(Sum2[277]==0)Sum2_hex=277;
        else if(Sum2[276]==0)Sum2_hex=276;
        else if(Sum2[275]==0)Sum2_hex=275;
        else if(Sum2[274]==0)Sum2_hex=274;
        else if(Sum2[273]==0)Sum2_hex=273;
        else if(Sum2[272]==0)Sum2_hex=272;
        else if(Sum2[271]==0)Sum2_hex=271;
        else if(Sum2[270]==0)Sum2_hex=270;
        else if(Sum2[269]==0)Sum2_hex=269;
        else if(Sum2[268]==0)Sum2_hex=268;
        else if(Sum2[267]==0)Sum2_hex=267;
        else if(Sum2[266]==0)Sum2_hex=266;
        else if(Sum2[265]==0)Sum2_hex=265;
        else if(Sum2[264]==0)Sum2_hex=264;
        else if(Sum2[263]==0)Sum2_hex=263;
        else if(Sum2[262]==0)Sum2_hex=262;
        else if(Sum2[261]==0)Sum2_hex=261;
        else if(Sum2[260]==0)Sum2_hex=260;
        else if(Sum2[259]==0)Sum2_hex=259;
        else if(Sum2[258]==0)Sum2_hex=258;
        else if(Sum2[257]==0)Sum2_hex=257;
        else if(Sum2[256]==0)Sum2_hex=256;
        else if(Sum2[255]==0)Sum2_hex=255;
        else if(Sum2[254]==0)Sum2_hex=254;
        else if(Sum2[253]==0)Sum2_hex=253;
        else if(Sum2[252]==0)Sum2_hex=252;
        else if(Sum2[251]==0)Sum2_hex=251;
        else if(Sum2[250]==0)Sum2_hex=250;
        else if(Sum2[249]==0)Sum2_hex=249;
        else if(Sum2[248]==0)Sum2_hex=248;
        else if(Sum2[247]==0)Sum2_hex=247;
        else if(Sum2[246]==0)Sum2_hex=246;
        else if(Sum2[245]==0)Sum2_hex=245;
        else if(Sum2[244]==0)Sum2_hex=244;
        else if(Sum2[243]==0)Sum2_hex=243;
        else if(Sum2[242]==0)Sum2_hex=242;
        else if(Sum2[241]==0)Sum2_hex=241;
        else if(Sum2[240]==0)Sum2_hex=240;
        else if(Sum2[239]==0)Sum2_hex=239;
        else if(Sum2[238]==0)Sum2_hex=238;
        else if(Sum2[237]==0)Sum2_hex=237;
        else if(Sum2[236]==0)Sum2_hex=236;
        else if(Sum2[235]==0)Sum2_hex=235;
        else if(Sum2[234]==0)Sum2_hex=234;
        else if(Sum2[233]==0)Sum2_hex=233;
        else if(Sum2[232]==0)Sum2_hex=232;
        else if(Sum2[231]==0)Sum2_hex=231;
        else if(Sum2[230]==0)Sum2_hex=230;
        else if(Sum2[229]==0)Sum2_hex=229;
        else if(Sum2[228]==0)Sum2_hex=228;
        else if(Sum2[227]==0)Sum2_hex=227;
        else if(Sum2[226]==0)Sum2_hex=226;
        else if(Sum2[225]==0)Sum2_hex=225;
        else if(Sum2[224]==0)Sum2_hex=224;
        else if(Sum2[223]==0)Sum2_hex=223;
        else if(Sum2[222]==0)Sum2_hex=222;
        else if(Sum2[221]==0)Sum2_hex=221;
        else if(Sum2[220]==0)Sum2_hex=220;
        else if(Sum2[219]==0)Sum2_hex=219;
        else if(Sum2[218]==0)Sum2_hex=218;
        else if(Sum2[217]==0)Sum2_hex=217;
        else if(Sum2[216]==0)Sum2_hex=216;
        else if(Sum2[215]==0)Sum2_hex=215;
        else if(Sum2[214]==0)Sum2_hex=214;
        else if(Sum2[213]==0)Sum2_hex=213;
        else if(Sum2[212]==0)Sum2_hex=212;
        else if(Sum2[211]==0)Sum2_hex=211;
        else if(Sum2[210]==0)Sum2_hex=210;
        else if(Sum2[209]==0)Sum2_hex=209;
        else if(Sum2[208]==0)Sum2_hex=208;
        else if(Sum2[207]==0)Sum2_hex=207;
        else if(Sum2[206]==0)Sum2_hex=206;
        else if(Sum2[205]==0)Sum2_hex=205;
        else if(Sum2[204]==0)Sum2_hex=204;
        else if(Sum2[203]==0)Sum2_hex=203;
        else if(Sum2[202]==0)Sum2_hex=202;
        else if(Sum2[201]==0)Sum2_hex=201;
        else if(Sum2[200]==0)Sum2_hex=200;
        else if(Sum2[199]==0)Sum2_hex=199;
        else if(Sum2[198]==0)Sum2_hex=198;
        else if(Sum2[197]==0)Sum2_hex=197;
        else if(Sum2[196]==0)Sum2_hex=196;
        else if(Sum2[195]==0)Sum2_hex=195;
        else if(Sum2[194]==0)Sum2_hex=194;
        else if(Sum2[193]==0)Sum2_hex=193;
        else if(Sum2[192]==0)Sum2_hex=192;
        else if(Sum2[191]==0)Sum2_hex=191;
        else if(Sum2[190]==0)Sum2_hex=190;
        else if(Sum2[189]==0)Sum2_hex=189;
        else if(Sum2[188]==0)Sum2_hex=188;
        else if(Sum2[187]==0)Sum2_hex=187;
        else if(Sum2[186]==0)Sum2_hex=186;
        else if(Sum2[185]==0)Sum2_hex=185;
        else if(Sum2[184]==0)Sum2_hex=184;
        else if(Sum2[183]==0)Sum2_hex=183;
        else if(Sum2[182]==0)Sum2_hex=182;
        else if(Sum2[181]==0)Sum2_hex=181;
        else if(Sum2[180]==0)Sum2_hex=180;
        else if(Sum2[179]==0)Sum2_hex=179;
        else if(Sum2[178]==0)Sum2_hex=178;
        else if(Sum2[177]==0)Sum2_hex=177;
        else if(Sum2[176]==0)Sum2_hex=176;
        else if(Sum2[175]==0)Sum2_hex=175;
        else if(Sum2[174]==0)Sum2_hex=174;
        else if(Sum2[173]==0)Sum2_hex=173;
        else if(Sum2[172]==0)Sum2_hex=172;
        else if(Sum2[171]==0)Sum2_hex=171;
        else if(Sum2[170]==0)Sum2_hex=170;
        else if(Sum2[169]==0)Sum2_hex=169;
        else if(Sum2[168]==0)Sum2_hex=168;
        else if(Sum2[167]==0)Sum2_hex=167;
        else if(Sum2[166]==0)Sum2_hex=166;
        else if(Sum2[165]==0)Sum2_hex=165;
        else if(Sum2[164]==0)Sum2_hex=164;
        else if(Sum2[163]==0)Sum2_hex=163;
        else if(Sum2[162]==0)Sum2_hex=162;
        else if(Sum2[161]==0)Sum2_hex=161;
        else if(Sum2[160]==0)Sum2_hex=160;
        else if(Sum2[159]==0)Sum2_hex=159;
        else if(Sum2[158]==0)Sum2_hex=158;
        else if(Sum2[157]==0)Sum2_hex=157;
        else if(Sum2[156]==0)Sum2_hex=156;
        else if(Sum2[155]==0)Sum2_hex=155;
        else if(Sum2[154]==0)Sum2_hex=154;
        else if(Sum2[153]==0)Sum2_hex=153;
        else if(Sum2[152]==0)Sum2_hex=152;
        else if(Sum2[151]==0)Sum2_hex=151;
        else if(Sum2[150]==0)Sum2_hex=150;
        else if(Sum2[149]==0)Sum2_hex=149;
        else if(Sum2[148]==0)Sum2_hex=148;
        else if(Sum2[147]==0)Sum2_hex=147;
        else if(Sum2[146]==0)Sum2_hex=146;
        else if(Sum2[145]==0)Sum2_hex=145;
        else if(Sum2[144]==0)Sum2_hex=144;
        else if(Sum2[143]==0)Sum2_hex=143;
        else if(Sum2[142]==0)Sum2_hex=142;
        else if(Sum2[141]==0)Sum2_hex=141;
        else if(Sum2[140]==0)Sum2_hex=140;
        else if(Sum2[139]==0)Sum2_hex=139;
        else if(Sum2[138]==0)Sum2_hex=138;
        else if(Sum2[137]==0)Sum2_hex=137;
        else if(Sum2[136]==0)Sum2_hex=136;
        else if(Sum2[135]==0)Sum2_hex=135;
        else if(Sum2[134]==0)Sum2_hex=134;
        else if(Sum2[133]==0)Sum2_hex=133;
        else if(Sum2[132]==0)Sum2_hex=132;
        else if(Sum2[131]==0)Sum2_hex=131;
        else if(Sum2[130]==0)Sum2_hex=130;
        else if(Sum2[129]==0)Sum2_hex=129;
        else if(Sum2[128]==0)Sum2_hex=128;
        else if(Sum2[127]==0)Sum2_hex=127;
        else if(Sum2[126]==0)Sum2_hex=126;
        else if(Sum2[125]==0)Sum2_hex=125;
        else if(Sum2[124]==0)Sum2_hex=124;
        else if(Sum2[123]==0)Sum2_hex=123;
        else if(Sum2[122]==0)Sum2_hex=122;
        else if(Sum2[121]==0)Sum2_hex=121;
        else if(Sum2[120]==0)Sum2_hex=120;
        else if(Sum2[119]==0)Sum2_hex=119;
        else if(Sum2[118]==0)Sum2_hex=118;
        else if(Sum2[117]==0)Sum2_hex=117;
        else if(Sum2[116]==0)Sum2_hex=116;
        else if(Sum2[115]==0)Sum2_hex=115;
        else if(Sum2[114]==0)Sum2_hex=114;
        else if(Sum2[113]==0)Sum2_hex=113;
        else if(Sum2[112]==0)Sum2_hex=112;
        else if(Sum2[111]==0)Sum2_hex=111;
        else if(Sum2[110]==0)Sum2_hex=110;
        else if(Sum2[109]==0)Sum2_hex=109;
        else if(Sum2[108]==0)Sum2_hex=108;
        else if(Sum2[107]==0)Sum2_hex=107;
        else if(Sum2[106]==0)Sum2_hex=106;
        else if(Sum2[105]==0)Sum2_hex=105;
        else if(Sum2[104]==0)Sum2_hex=104;
        else if(Sum2[103]==0)Sum2_hex=103;
        else if(Sum2[102]==0)Sum2_hex=102;
        else if(Sum2[101]==0)Sum2_hex=101;
        else if(Sum2[100]==0)Sum2_hex=100;
        else if(Sum2[99]==0)Sum2_hex=99;
        else if(Sum2[98]==0)Sum2_hex=98;
        else if(Sum2[97]==0)Sum2_hex=97;
        else if(Sum2[96]==0)Sum2_hex=96;
        else if(Sum2[95]==0)Sum2_hex=95;
        else if(Sum2[94]==0)Sum2_hex=94;
        else if(Sum2[93]==0)Sum2_hex=93;
        else if(Sum2[92]==0)Sum2_hex=92;
        else if(Sum2[91]==0)Sum2_hex=91;
        else if(Sum2[90]==0)Sum2_hex=90;
        else if(Sum2[89]==0)Sum2_hex=89;
        else if(Sum2[88]==0)Sum2_hex=88;
        else if(Sum2[87]==0)Sum2_hex=87;
        else if(Sum2[86]==0)Sum2_hex=86;
        else if(Sum2[85]==0)Sum2_hex=85;
        else if(Sum2[84]==0)Sum2_hex=84;
        else if(Sum2[83]==0)Sum2_hex=83;
        else if(Sum2[82]==0)Sum2_hex=82;
        else if(Sum2[81]==0)Sum2_hex=81;
        else if(Sum2[80]==0)Sum2_hex=80;
        else if(Sum2[79]==0)Sum2_hex=79;
        else if(Sum2[78]==0)Sum2_hex=78;
        else if(Sum2[77]==0)Sum2_hex=77;
        else if(Sum2[76]==0)Sum2_hex=76;
        else if(Sum2[75]==0)Sum2_hex=75;
        else if(Sum2[74]==0)Sum2_hex=74;
        else if(Sum2[73]==0)Sum2_hex=73;
        else if(Sum2[72]==0)Sum2_hex=72;
        else if(Sum2[71]==0)Sum2_hex=71;
        else if(Sum2[70]==0)Sum2_hex=70;
        else if(Sum2[69]==0)Sum2_hex=69;
        else if(Sum2[68]==0)Sum2_hex=68;
        else if(Sum2[67]==0)Sum2_hex=67;
        else if(Sum2[66]==0)Sum2_hex=66;
        else if(Sum2[65]==0)Sum2_hex=65;
        else if(Sum2[64]==0)Sum2_hex=64;
        else if(Sum2[63]==0)Sum2_hex=63;
        else if(Sum2[62]==0)Sum2_hex=62;
        else if(Sum2[61]==0)Sum2_hex=61;
        else if(Sum2[60]==0)Sum2_hex=60;
        else if(Sum2[59]==0)Sum2_hex=59;
        else if(Sum2[58]==0)Sum2_hex=58;
        else if(Sum2[57]==0)Sum2_hex=57;
        else if(Sum2[56]==0)Sum2_hex=56;
        else if(Sum2[55]==0)Sum2_hex=55;
        else if(Sum2[54]==0)Sum2_hex=54;
        else if(Sum2[53]==0)Sum2_hex=53;
        else if(Sum2[52]==0)Sum2_hex=52;
        else if(Sum2[51]==0)Sum2_hex=51;
        else if(Sum2[50]==0)Sum2_hex=50;
        else if(Sum2[49]==0)Sum2_hex=49;
        else if(Sum2[48]==0)Sum2_hex=48;
        else if(Sum2[47]==0)Sum2_hex=47;
        else if(Sum2[46]==0)Sum2_hex=46;
        else if(Sum2[45]==0)Sum2_hex=45;
        else if(Sum2[44]==0)Sum2_hex=44;
        else if(Sum2[43]==0)Sum2_hex=43;
        else if(Sum2[42]==0)Sum2_hex=42;
        else if(Sum2[41]==0)Sum2_hex=41;
        else if(Sum2[40]==0)Sum2_hex=40;
        else if(Sum2[39]==0)Sum2_hex=39;
        else if(Sum2[38]==0)Sum2_hex=38;
        else if(Sum2[37]==0)Sum2_hex=37;
        else if(Sum2[36]==0)Sum2_hex=36;
        else if(Sum2[35]==0)Sum2_hex=35;
        else if(Sum2[34]==0)Sum2_hex=34;
        else if(Sum2[33]==0)Sum2_hex=33;
        else if(Sum2[32]==0)Sum2_hex=32;
        else if(Sum2[31]==0)Sum2_hex=31;
        else if(Sum2[30]==0)Sum2_hex=30;
        else if(Sum2[29]==0)Sum2_hex=29;
        else if(Sum2[28]==0)Sum2_hex=28;
        else if(Sum2[27]==0)Sum2_hex=27;
        else if(Sum2[26]==0)Sum2_hex=26;
        else if(Sum2[25]==0)Sum2_hex=25;
        else if(Sum2[24]==0)Sum2_hex=24;
        else if(Sum2[23]==0)Sum2_hex=23;
        else if(Sum2[22]==0)Sum2_hex=22;
        else if(Sum2[21]==0)Sum2_hex=21;
        else if(Sum2[20]==0)Sum2_hex=20;
        else if(Sum2[19]==0)Sum2_hex=19;
        else if(Sum2[18]==0)Sum2_hex=18;
        else if(Sum2[17]==0)Sum2_hex=17;
        else if(Sum2[16]==0)Sum2_hex=16;
        else if(Sum2[15]==0)Sum2_hex=15;
        else if(Sum2[14]==0)Sum2_hex=14;
        else if(Sum2[13]==0)Sum2_hex=13;
        else if(Sum2[12]==0)Sum2_hex=12;
        else if(Sum2[11]==0)Sum2_hex=11;
        else if(Sum2[10]==0)Sum2_hex=10;
        else if(Sum2[9]==0)Sum2_hex=9;
        else if(Sum2[8]==0)Sum2_hex=8;
        else if(Sum2[7]==0)Sum2_hex=7;
        else if(Sum2[6]==0)Sum2_hex=6;
        else if(Sum2[5]==0)Sum2_hex=5;
        else if(Sum2[4]==0)Sum2_hex=4;
        else if(Sum2[3]==0)Sum2_hex=3;
        else if(Sum2[2]==0)Sum2_hex=2;
        else if(Sum2[1]==0)Sum2_hex=1;
        else if(Sum2[0]==0)Sum2_hex=0;
        else Sum2_hex=0;
    end
    else begin
        Sum2_hex=2184;
    end
end

always @(posedge Hit) begin 
        LEDr <= 1;
        Sum2[1023:0] <= 4096'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        Co2[1023:0] <= 4096'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        Sum2[0]<=1^Hit^Ci;
        Co2[0]<=(1&Hit|(1|Hit)&Ci);

        Sum2[1]<=1^0^Co2[0];
        Co2[1]<=(1&0|(1|0)&Co2[0]);

        Sum2[2]<=1^0^Co2[1];
        Co2[2]<=(1&0|(1|0)&Co2[1]);

        Sum2[3]<=1^0^Co2[2];
        Co2[3]<=(1&0|(1|0)&Co2[2]);

        Sum2[4]<=1^0^Co2[3];
        Co2[4]<=(1&0|(1|0)&Co2[3]);

        Sum2[5]<=1^0^Co2[4];
        Co2[5]<=(1&0|(1|0)&Co2[4]);

        Sum2[6]<=1^0^Co2[5];
        Co2[6]<=(1&0|(1|0)&Co2[5]);

        Sum2[7]<=1^0^Co2[6];
        Co2[7]<=(1&0|(1|0)&Co2[6]);

        Sum2[8]<=1^0^Co2[7];
        Co2[8]<=(1&0|(1|0)&Co2[7]);

        Sum2[9]<=1^0^Co2[8];
        Co2[9]<=(1&0|(1|0)&Co2[8]);

        Sum2[10]<=1^0^Co2[9];
        Co2[10]<=(1&0|(1|0)&Co2[9]);

        Sum2[11]<=1^0^Co2[10];
        Co2[11]<=(1&0|(1|0)&Co2[10]);

        Sum2[12]<=1^0^Co2[11];
        Co2[12]<=(1&0|(1|0)&Co2[11]);

        Sum2[13]<=1^0^Co2[12];
        Co2[13]<=(1&0|(1|0)&Co2[12]);

        Sum2[14]<=1^0^Co2[13];
        Co2[14]<=(1&0|(1|0)&Co2[13]);

        Sum2[15]<=1^0^Co2[14];
        Co2[15]<=(1&0|(1|0)&Co2[14]);

        Sum2[16]<=1^0^Co2[15];
        Co2[16]<=(1&0|(1|0)&Co2[15]);

        Sum2[17]<=1^0^Co2[16];
        Co2[17]<=(1&0|(1|0)&Co2[16]);

        Sum2[18]<=1^0^Co2[17];
        Co2[18]<=(1&0|(1|0)&Co2[17]);

        Sum2[19]<=1^0^Co2[18];
        Co2[19]<=(1&0|(1|0)&Co2[18]);

        Sum2[20]<=1^0^Co2[19];
        Co2[20]<=(1&0|(1|0)&Co2[19]);

        Sum2[21]<=1^0^Co2[20];
        Co2[21]<=(1&0|(1|0)&Co2[20]);

        Sum2[22]<=1^0^Co2[21];
        Co2[22]<=(1&0|(1|0)&Co2[21]);

        Sum2[23]<=1^0^Co2[22];
        Co2[23]<=(1&0|(1|0)&Co2[22]);

        Sum2[24]<=1^0^Co2[23];
        Co2[24]<=(1&0|(1|0)&Co2[23]);

        Sum2[25]<=1^0^Co2[24];
        Co2[25]<=(1&0|(1|0)&Co2[24]);

        Sum2[26]<=1^0^Co2[25];
        Co2[26]<=(1&0|(1|0)&Co2[25]);

        Sum2[27]<=1^0^Co2[26];
        Co2[27]<=(1&0|(1|0)&Co2[26]);

        Sum2[28]<=1^0^Co2[27];
        Co2[28]<=(1&0|(1|0)&Co2[27]);

        Sum2[29]<=1^0^Co2[28];
        Co2[29]<=(1&0|(1|0)&Co2[28]);

        Sum2[30]<=1^0^Co2[29];
        Co2[30]<=(1&0|(1|0)&Co2[29]);

        Sum2[31]<=1^0^Co2[30];
        Co2[31]<=(1&0|(1|0)&Co2[30]);

        Sum2[32]<=1^0^Co2[31];
        Co2[32]<=(1&0|(1|0)&Co2[31]);

        Sum2[33]<=1^0^Co2[32];
        Co2[33]<=(1&0|(1|0)&Co2[32]);

        Sum2[34]<=1^0^Co2[33];
        Co2[34]<=(1&0|(1|0)&Co2[33]);

        Sum2[35]<=1^0^Co2[34];
        Co2[35]<=(1&0|(1|0)&Co2[34]);

        Sum2[36]<=1^0^Co2[35];
        Co2[36]<=(1&0|(1|0)&Co2[35]);

        Sum2[37]<=1^0^Co2[36];
        Co2[37]<=(1&0|(1|0)&Co2[36]);

        Sum2[38]<=1^0^Co2[37];
        Co2[38]<=(1&0|(1|0)&Co2[37]);

        Sum2[39]<=1^0^Co2[38];
        Co2[39]<=(1&0|(1|0)&Co2[38]);

        Sum2[40]<=1^0^Co2[39];
        Co2[40]<=(1&0|(1|0)&Co2[39]);

        Sum2[41]<=1^0^Co2[40];
        Co2[41]<=(1&0|(1|0)&Co2[40]);

        Sum2[42]<=1^0^Co2[41];
        Co2[42]<=(1&0|(1|0)&Co2[41]);

        Sum2[43]<=1^0^Co2[42];
        Co2[43]<=(1&0|(1|0)&Co2[42]);

        Sum2[44]<=1^0^Co2[43];
        Co2[44]<=(1&0|(1|0)&Co2[43]);

        Sum2[45]<=1^0^Co2[44];
        Co2[45]<=(1&0|(1|0)&Co2[44]);

        Sum2[46]<=1^0^Co2[45];
        Co2[46]<=(1&0|(1|0)&Co2[45]);

        Sum2[47]<=1^0^Co2[46];
        Co2[47]<=(1&0|(1|0)&Co2[46]);

        Sum2[48]<=1^0^Co2[47];
        Co2[48]<=(1&0|(1|0)&Co2[47]);

        Sum2[49]<=1^0^Co2[48];
        Co2[49]<=(1&0|(1|0)&Co2[48]);

        Sum2[50]<=1^0^Co2[49];
        Co2[50]<=(1&0|(1|0)&Co2[49]);

        Sum2[51]<=1^0^Co2[50];
        Co2[51]<=(1&0|(1|0)&Co2[50]);

        Sum2[52]<=1^0^Co2[51];
        Co2[52]<=(1&0|(1|0)&Co2[51]);

        Sum2[53]<=1^0^Co2[52];
        Co2[53]<=(1&0|(1|0)&Co2[52]);

        Sum2[54]<=1^0^Co2[53];
        Co2[54]<=(1&0|(1|0)&Co2[53]);

        Sum2[55]<=1^0^Co2[54];
        Co2[55]<=(1&0|(1|0)&Co2[54]);

        Sum2[56]<=1^0^Co2[55];
        Co2[56]<=(1&0|(1|0)&Co2[55]);

        Sum2[57]<=1^0^Co2[56];
        Co2[57]<=(1&0|(1|0)&Co2[56]);

        Sum2[58]<=1^0^Co2[57];
        Co2[58]<=(1&0|(1|0)&Co2[57]);

        Sum2[59]<=1^0^Co2[58];
        Co2[59]<=(1&0|(1|0)&Co2[58]);

        Sum2[60]<=1^0^Co2[59];
        Co2[60]<=(1&0|(1|0)&Co2[59]);

        Sum2[61]<=1^0^Co2[60];
        Co2[61]<=(1&0|(1|0)&Co2[60]);

        Sum2[62]<=1^0^Co2[61];
        Co2[62]<=(1&0|(1|0)&Co2[61]);

        Sum2[63]<=1^0^Co2[62];
        Co2[63]<=(1&0|(1|0)&Co2[62]);

        Sum2[64]<=1^0^Co2[63];
        Co2[64]<=(1&0|(1|0)&Co2[63]);

        Sum2[65]<=1^0^Co2[64];
        Co2[65]<=(1&0|(1|0)&Co2[64]);

        Sum2[66]<=1^0^Co2[65];
        Co2[66]<=(1&0|(1|0)&Co2[65]);

        Sum2[67]<=1^0^Co2[66];
        Co2[67]<=(1&0|(1|0)&Co2[66]);

        Sum2[68]<=1^0^Co2[67];
        Co2[68]<=(1&0|(1|0)&Co2[67]);

        Sum2[69]<=1^0^Co2[68];
        Co2[69]<=(1&0|(1|0)&Co2[68]);

        Sum2[70]<=1^0^Co2[69];
        Co2[70]<=(1&0|(1|0)&Co2[69]);

        Sum2[71]<=1^0^Co2[70];
        Co2[71]<=(1&0|(1|0)&Co2[70]);

        Sum2[72]<=1^0^Co2[71];
        Co2[72]<=(1&0|(1|0)&Co2[71]);

        Sum2[73]<=1^0^Co2[72];
        Co2[73]<=(1&0|(1|0)&Co2[72]);

        Sum2[74]<=1^0^Co2[73];
        Co2[74]<=(1&0|(1|0)&Co2[73]);

        Sum2[75]<=1^0^Co2[74];
        Co2[75]<=(1&0|(1|0)&Co2[74]);

        Sum2[76]<=1^0^Co2[75];
        Co2[76]<=(1&0|(1|0)&Co2[75]);

        Sum2[77]<=1^0^Co2[76];
        Co2[77]<=(1&0|(1|0)&Co2[76]);

        Sum2[78]<=1^0^Co2[77];
        Co2[78]<=(1&0|(1|0)&Co2[77]);

        Sum2[79]<=1^0^Co2[78];
        Co2[79]<=(1&0|(1|0)&Co2[78]);

        Sum2[80]<=1^0^Co2[79];
        Co2[80]<=(1&0|(1|0)&Co2[79]);

        Sum2[81]<=1^0^Co2[80];
        Co2[81]<=(1&0|(1|0)&Co2[80]);

        Sum2[82]<=1^0^Co2[81];
        Co2[82]<=(1&0|(1|0)&Co2[81]);

        Sum2[83]<=1^0^Co2[82];
        Co2[83]<=(1&0|(1|0)&Co2[82]);

        Sum2[84]<=1^0^Co2[83];
        Co2[84]<=(1&0|(1|0)&Co2[83]);

        Sum2[85]<=1^0^Co2[84];
        Co2[85]<=(1&0|(1|0)&Co2[84]);

        Sum2[86]<=1^0^Co2[85];
        Co2[86]<=(1&0|(1|0)&Co2[85]);

        Sum2[87]<=1^0^Co2[86];
        Co2[87]<=(1&0|(1|0)&Co2[86]);

        Sum2[88]<=1^0^Co2[87];
        Co2[88]<=(1&0|(1|0)&Co2[87]);

        Sum2[89]<=1^0^Co2[88];
        Co2[89]<=(1&0|(1|0)&Co2[88]);

        Sum2[90]<=1^0^Co2[89];
        Co2[90]<=(1&0|(1|0)&Co2[89]);

        Sum2[91]<=1^0^Co2[90];
        Co2[91]<=(1&0|(1|0)&Co2[90]);

        Sum2[92]<=1^0^Co2[91];
        Co2[92]<=(1&0|(1|0)&Co2[91]);

        Sum2[93]<=1^0^Co2[92];
        Co2[93]<=(1&0|(1|0)&Co2[92]);

        Sum2[94]<=1^0^Co2[93];
        Co2[94]<=(1&0|(1|0)&Co2[93]);

        Sum2[95]<=1^0^Co2[94];
        Co2[95]<=(1&0|(1|0)&Co2[94]);

        Sum2[96]<=1^0^Co2[95];
        Co2[96]<=(1&0|(1|0)&Co2[95]);

        Sum2[97]<=1^0^Co2[96];
        Co2[97]<=(1&0|(1|0)&Co2[96]);

        Sum2[98]<=1^0^Co2[97];
        Co2[98]<=(1&0|(1|0)&Co2[97]);

        Sum2[99]<=1^0^Co2[98];
        Co2[99]<=(1&0|(1|0)&Co2[98]);

        Sum2[100]<=1^0^Co2[99];
        Co2[100]<=(1&0|(1|0)&Co2[99]);

        Sum2[101]<=1^0^Co2[100];
        Co2[101]<=(1&0|(1|0)&Co2[100]);

        Sum2[102]<=1^0^Co2[101];
        Co2[102]<=(1&0|(1|0)&Co2[101]);

        Sum2[103]<=1^0^Co2[102];
        Co2[103]<=(1&0|(1|0)&Co2[102]);

        Sum2[104]<=1^0^Co2[103];
        Co2[104]<=(1&0|(1|0)&Co2[103]);

        Sum2[105]<=1^0^Co2[104];
        Co2[105]<=(1&0|(1|0)&Co2[104]);

        Sum2[106]<=1^0^Co2[105];
        Co2[106]<=(1&0|(1|0)&Co2[105]);

        Sum2[107]<=1^0^Co2[106];
        Co2[107]<=(1&0|(1|0)&Co2[106]);

        Sum2[108]<=1^0^Co2[107];
        Co2[108]<=(1&0|(1|0)&Co2[107]);

        Sum2[109]<=1^0^Co2[108];
        Co2[109]<=(1&0|(1|0)&Co2[108]);

        Sum2[110]<=1^0^Co2[109];
        Co2[110]<=(1&0|(1|0)&Co2[109]);

        Sum2[111]<=1^0^Co2[110];
        Co2[111]<=(1&0|(1|0)&Co2[110]);

        Sum2[112]<=1^0^Co2[111];
        Co2[112]<=(1&0|(1|0)&Co2[111]);

        Sum2[113]<=1^0^Co2[112];
        Co2[113]<=(1&0|(1|0)&Co2[112]);

        Sum2[114]<=1^0^Co2[113];
        Co2[114]<=(1&0|(1|0)&Co2[113]);

        Sum2[115]<=1^0^Co2[114];
        Co2[115]<=(1&0|(1|0)&Co2[114]);

        Sum2[116]<=1^0^Co2[115];
        Co2[116]<=(1&0|(1|0)&Co2[115]);

        Sum2[117]<=1^0^Co2[116];
        Co2[117]<=(1&0|(1|0)&Co2[116]);

        Sum2[118]<=1^0^Co2[117];
        Co2[118]<=(1&0|(1|0)&Co2[117]);

        Sum2[119]<=1^0^Co2[118];
        Co2[119]<=(1&0|(1|0)&Co2[118]);

        Sum2[120]<=1^0^Co2[119];
        Co2[120]<=(1&0|(1|0)&Co2[119]);

        Sum2[121]<=1^0^Co2[120];
        Co2[121]<=(1&0|(1|0)&Co2[120]);

        Sum2[122]<=1^0^Co2[121];
        Co2[122]<=(1&0|(1|0)&Co2[121]);

        Sum2[123]<=1^0^Co2[122];
        Co2[123]<=(1&0|(1|0)&Co2[122]);

        Sum2[124]<=1^0^Co2[123];
        Co2[124]<=(1&0|(1|0)&Co2[123]);

        Sum2[125]<=1^0^Co2[124];
        Co2[125]<=(1&0|(1|0)&Co2[124]);

        Sum2[126]<=1^0^Co2[125];
        Co2[126]<=(1&0|(1|0)&Co2[125]);

        Sum2[127]<=1^0^Co2[126];
        Co2[127]<=(1&0|(1|0)&Co2[126]);

        Sum2[128]<=1^0^Co2[127];
        Co2[128]<=(1&0|(1|0)&Co2[127]);

        Sum2[129]<=1^0^Co2[128];
        Co2[129]<=(1&0|(1|0)&Co2[128]);

        Sum2[130]<=1^0^Co2[129];
        Co2[130]<=(1&0|(1|0)&Co2[129]);

        Sum2[131]<=1^0^Co2[130];
        Co2[131]<=(1&0|(1|0)&Co2[130]);

        Sum2[132]<=1^0^Co2[131];
        Co2[132]<=(1&0|(1|0)&Co2[131]);

        Sum2[133]<=1^0^Co2[132];
        Co2[133]<=(1&0|(1|0)&Co2[132]);

        Sum2[134]<=1^0^Co2[133];
        Co2[134]<=(1&0|(1|0)&Co2[133]);

        Sum2[135]<=1^0^Co2[134];
        Co2[135]<=(1&0|(1|0)&Co2[134]);

        Sum2[136]<=1^0^Co2[135];
        Co2[136]<=(1&0|(1|0)&Co2[135]);

        Sum2[137]<=1^0^Co2[136];
        Co2[137]<=(1&0|(1|0)&Co2[136]);

        Sum2[138]<=1^0^Co2[137];
        Co2[138]<=(1&0|(1|0)&Co2[137]);

        Sum2[139]<=1^0^Co2[138];
        Co2[139]<=(1&0|(1|0)&Co2[138]);

        Sum2[140]<=1^0^Co2[139];
        Co2[140]<=(1&0|(1|0)&Co2[139]);

        Sum2[141]<=1^0^Co2[140];
        Co2[141]<=(1&0|(1|0)&Co2[140]);

        Sum2[142]<=1^0^Co2[141];
        Co2[142]<=(1&0|(1|0)&Co2[141]);

        Sum2[143]<=1^0^Co2[142];
        Co2[143]<=(1&0|(1|0)&Co2[142]);

        Sum2[144]<=1^0^Co2[143];
        Co2[144]<=(1&0|(1|0)&Co2[143]);

        Sum2[145]<=1^0^Co2[144];
        Co2[145]<=(1&0|(1|0)&Co2[144]);

        Sum2[146]<=1^0^Co2[145];
        Co2[146]<=(1&0|(1|0)&Co2[145]);

        Sum2[147]<=1^0^Co2[146];
        Co2[147]<=(1&0|(1|0)&Co2[146]);

        Sum2[148]<=1^0^Co2[147];
        Co2[148]<=(1&0|(1|0)&Co2[147]);

        Sum2[149]<=1^0^Co2[148];
        Co2[149]<=(1&0|(1|0)&Co2[148]);

        Sum2[150]<=1^0^Co2[149];
        Co2[150]<=(1&0|(1|0)&Co2[149]);

        Sum2[151]<=1^0^Co2[150];
        Co2[151]<=(1&0|(1|0)&Co2[150]);

        Sum2[152]<=1^0^Co2[151];
        Co2[152]<=(1&0|(1|0)&Co2[151]);

        Sum2[153]<=1^0^Co2[152];
        Co2[153]<=(1&0|(1|0)&Co2[152]);

        Sum2[154]<=1^0^Co2[153];
        Co2[154]<=(1&0|(1|0)&Co2[153]);

        Sum2[155]<=1^0^Co2[154];
        Co2[155]<=(1&0|(1|0)&Co2[154]);

        Sum2[156]<=1^0^Co2[155];
        Co2[156]<=(1&0|(1|0)&Co2[155]);

        Sum2[157]<=1^0^Co2[156];
        Co2[157]<=(1&0|(1|0)&Co2[156]);

        Sum2[158]<=1^0^Co2[157];
        Co2[158]<=(1&0|(1|0)&Co2[157]);

        Sum2[159]<=1^0^Co2[158];
        Co2[159]<=(1&0|(1|0)&Co2[158]);

        Sum2[160]<=1^0^Co2[159];
        Co2[160]<=(1&0|(1|0)&Co2[159]);

        Sum2[161]<=1^0^Co2[160];
        Co2[161]<=(1&0|(1|0)&Co2[160]);

        Sum2[162]<=1^0^Co2[161];
        Co2[162]<=(1&0|(1|0)&Co2[161]);

        Sum2[163]<=1^0^Co2[162];
        Co2[163]<=(1&0|(1|0)&Co2[162]);

        Sum2[164]<=1^0^Co2[163];
        Co2[164]<=(1&0|(1|0)&Co2[163]);

        Sum2[165]<=1^0^Co2[164];
        Co2[165]<=(1&0|(1|0)&Co2[164]);

        Sum2[166]<=1^0^Co2[165];
        Co2[166]<=(1&0|(1|0)&Co2[165]);

        Sum2[167]<=1^0^Co2[166];
        Co2[167]<=(1&0|(1|0)&Co2[166]);

        Sum2[168]<=1^0^Co2[167];
        Co2[168]<=(1&0|(1|0)&Co2[167]);

        Sum2[169]<=1^0^Co2[168];
        Co2[169]<=(1&0|(1|0)&Co2[168]);

        Sum2[170]<=1^0^Co2[169];
        Co2[170]<=(1&0|(1|0)&Co2[169]);

        Sum2[171]<=1^0^Co2[170];
        Co2[171]<=(1&0|(1|0)&Co2[170]);

        Sum2[172]<=1^0^Co2[171];
        Co2[172]<=(1&0|(1|0)&Co2[171]);

        Sum2[173]<=1^0^Co2[172];
        Co2[173]<=(1&0|(1|0)&Co2[172]);

        Sum2[174]<=1^0^Co2[173];
        Co2[174]<=(1&0|(1|0)&Co2[173]);

        Sum2[175]<=1^0^Co2[174];
        Co2[175]<=(1&0|(1|0)&Co2[174]);

        Sum2[176]<=1^0^Co2[175];
        Co2[176]<=(1&0|(1|0)&Co2[175]);

        Sum2[177]<=1^0^Co2[176];
        Co2[177]<=(1&0|(1|0)&Co2[176]);

        Sum2[178]<=1^0^Co2[177];
        Co2[178]<=(1&0|(1|0)&Co2[177]);

        Sum2[179]<=1^0^Co2[178];
        Co2[179]<=(1&0|(1|0)&Co2[178]);

        Sum2[180]<=1^0^Co2[179];
        Co2[180]<=(1&0|(1|0)&Co2[179]);

        Sum2[181]<=1^0^Co2[180];
        Co2[181]<=(1&0|(1|0)&Co2[180]);

        Sum2[182]<=1^0^Co2[181];
        Co2[182]<=(1&0|(1|0)&Co2[181]);

        Sum2[183]<=1^0^Co2[182];
        Co2[183]<=(1&0|(1|0)&Co2[182]);

        Sum2[184]<=1^0^Co2[183];
        Co2[184]<=(1&0|(1|0)&Co2[183]);

        Sum2[185]<=1^0^Co2[184];
        Co2[185]<=(1&0|(1|0)&Co2[184]);

        Sum2[186]<=1^0^Co2[185];
        Co2[186]<=(1&0|(1|0)&Co2[185]);

        Sum2[187]<=1^0^Co2[186];
        Co2[187]<=(1&0|(1|0)&Co2[186]);

        Sum2[188]<=1^0^Co2[187];
        Co2[188]<=(1&0|(1|0)&Co2[187]);

        Sum2[189]<=1^0^Co2[188];
        Co2[189]<=(1&0|(1|0)&Co2[188]);

        Sum2[190]<=1^0^Co2[189];
        Co2[190]<=(1&0|(1|0)&Co2[189]);

        Sum2[191]<=1^0^Co2[190];
        Co2[191]<=(1&0|(1|0)&Co2[190]);

        Sum2[192]<=1^0^Co2[191];
        Co2[192]<=(1&0|(1|0)&Co2[191]);

        Sum2[193]<=1^0^Co2[192];
        Co2[193]<=(1&0|(1|0)&Co2[192]);

        Sum2[194]<=1^0^Co2[193];
        Co2[194]<=(1&0|(1|0)&Co2[193]);

        Sum2[195]<=1^0^Co2[194];
        Co2[195]<=(1&0|(1|0)&Co2[194]);

        Sum2[196]<=1^0^Co2[195];
        Co2[196]<=(1&0|(1|0)&Co2[195]);

        Sum2[197]<=1^0^Co2[196];
        Co2[197]<=(1&0|(1|0)&Co2[196]);

        Sum2[198]<=1^0^Co2[197];
        Co2[198]<=(1&0|(1|0)&Co2[197]);

        Sum2[199]<=1^0^Co2[198];
        Co2[199]<=(1&0|(1|0)&Co2[198]);

        Sum2[200]<=1^0^Co2[199];
        Co2[200]<=(1&0|(1|0)&Co2[199]);

        Sum2[201]<=1^0^Co2[200];
        Co2[201]<=(1&0|(1|0)&Co2[200]);

        Sum2[202]<=1^0^Co2[201];
        Co2[202]<=(1&0|(1|0)&Co2[201]);

        Sum2[203]<=1^0^Co2[202];
        Co2[203]<=(1&0|(1|0)&Co2[202]);

        Sum2[204]<=1^0^Co2[203];
        Co2[204]<=(1&0|(1|0)&Co2[203]);

        Sum2[205]<=1^0^Co2[204];
        Co2[205]<=(1&0|(1|0)&Co2[204]);

        Sum2[206]<=1^0^Co2[205];
        Co2[206]<=(1&0|(1|0)&Co2[205]);

        Sum2[207]<=1^0^Co2[206];
        Co2[207]<=(1&0|(1|0)&Co2[206]);

        Sum2[208]<=1^0^Co2[207];
        Co2[208]<=(1&0|(1|0)&Co2[207]);

        Sum2[209]<=1^0^Co2[208];
        Co2[209]<=(1&0|(1|0)&Co2[208]);

        Sum2[210]<=1^0^Co2[209];
        Co2[210]<=(1&0|(1|0)&Co2[209]);

        Sum2[211]<=1^0^Co2[210];
        Co2[211]<=(1&0|(1|0)&Co2[210]);

        Sum2[212]<=1^0^Co2[211];
        Co2[212]<=(1&0|(1|0)&Co2[211]);

        Sum2[213]<=1^0^Co2[212];
        Co2[213]<=(1&0|(1|0)&Co2[212]);

        Sum2[214]<=1^0^Co2[213];
        Co2[214]<=(1&0|(1|0)&Co2[213]);

        Sum2[215]<=1^0^Co2[214];
        Co2[215]<=(1&0|(1|0)&Co2[214]);

        Sum2[216]<=1^0^Co2[215];
        Co2[216]<=(1&0|(1|0)&Co2[215]);

        Sum2[217]<=1^0^Co2[216];
        Co2[217]<=(1&0|(1|0)&Co2[216]);

        Sum2[218]<=1^0^Co2[217];
        Co2[218]<=(1&0|(1|0)&Co2[217]);

        Sum2[219]<=1^0^Co2[218];
        Co2[219]<=(1&0|(1|0)&Co2[218]);

        Sum2[220]<=1^0^Co2[219];
        Co2[220]<=(1&0|(1|0)&Co2[219]);

        Sum2[221]<=1^0^Co2[220];
        Co2[221]<=(1&0|(1|0)&Co2[220]);

        Sum2[222]<=1^0^Co2[221];
        Co2[222]<=(1&0|(1|0)&Co2[221]);

        Sum2[223]<=1^0^Co2[222];
        Co2[223]<=(1&0|(1|0)&Co2[222]);

        Sum2[224]<=1^0^Co2[223];
        Co2[224]<=(1&0|(1|0)&Co2[223]);

        Sum2[225]<=1^0^Co2[224];
        Co2[225]<=(1&0|(1|0)&Co2[224]);

        Sum2[226]<=1^0^Co2[225];
        Co2[226]<=(1&0|(1|0)&Co2[225]);

        Sum2[227]<=1^0^Co2[226];
        Co2[227]<=(1&0|(1|0)&Co2[226]);

        Sum2[228]<=1^0^Co2[227];
        Co2[228]<=(1&0|(1|0)&Co2[227]);

        Sum2[229]<=1^0^Co2[228];
        Co2[229]<=(1&0|(1|0)&Co2[228]);

        Sum2[230]<=1^0^Co2[229];
        Co2[230]<=(1&0|(1|0)&Co2[229]);

        Sum2[231]<=1^0^Co2[230];
        Co2[231]<=(1&0|(1|0)&Co2[230]);

        Sum2[232]<=1^0^Co2[231];
        Co2[232]<=(1&0|(1|0)&Co2[231]);

        Sum2[233]<=1^0^Co2[232];
        Co2[233]<=(1&0|(1|0)&Co2[232]);

        Sum2[234]<=1^0^Co2[233];
        Co2[234]<=(1&0|(1|0)&Co2[233]);

        Sum2[235]<=1^0^Co2[234];
        Co2[235]<=(1&0|(1|0)&Co2[234]);

        Sum2[236]<=1^0^Co2[235];
        Co2[236]<=(1&0|(1|0)&Co2[235]);

        Sum2[237]<=1^0^Co2[236];
        Co2[237]<=(1&0|(1|0)&Co2[236]);

        Sum2[238]<=1^0^Co2[237];
        Co2[238]<=(1&0|(1|0)&Co2[237]);

        Sum2[239]<=1^0^Co2[238];
        Co2[239]<=(1&0|(1|0)&Co2[238]);

        Sum2[240]<=1^0^Co2[239];
        Co2[240]<=(1&0|(1|0)&Co2[239]);

        Sum2[241]<=1^0^Co2[240];
        Co2[241]<=(1&0|(1|0)&Co2[240]);

        Sum2[242]<=1^0^Co2[241];
        Co2[242]<=(1&0|(1|0)&Co2[241]);

        Sum2[243]<=1^0^Co2[242];
        Co2[243]<=(1&0|(1|0)&Co2[242]);

        Sum2[244]<=1^0^Co2[243];
        Co2[244]<=(1&0|(1|0)&Co2[243]);

        Sum2[245]<=1^0^Co2[244];
        Co2[245]<=(1&0|(1|0)&Co2[244]);

        Sum2[246]<=1^0^Co2[245];
        Co2[246]<=(1&0|(1|0)&Co2[245]);

        Sum2[247]<=1^0^Co2[246];
        Co2[247]<=(1&0|(1|0)&Co2[246]);

        Sum2[248]<=1^0^Co2[247];
        Co2[248]<=(1&0|(1|0)&Co2[247]);

        Sum2[249]<=1^0^Co2[248];
        Co2[249]<=(1&0|(1|0)&Co2[248]);

        Sum2[250]<=1^0^Co2[249];
        Co2[250]<=(1&0|(1|0)&Co2[249]);

        Sum2[251]<=1^0^Co2[250];
        Co2[251]<=(1&0|(1|0)&Co2[250]);

        Sum2[252]<=1^0^Co2[251];
        Co2[252]<=(1&0|(1|0)&Co2[251]);

        Sum2[253]<=1^0^Co2[252];
        Co2[253]<=(1&0|(1|0)&Co2[252]);

        Sum2[254]<=1^0^Co2[253];
        Co2[254]<=(1&0|(1|0)&Co2[253]);

        Sum2[255]<=1^0^Co2[254];
        Co2[255]<=(1&0|(1|0)&Co2[254]);

        Sum2[256]<=1^0^Co2[255];
        Co2[256]<=(1&0|(1|0)&Co2[255]);

        Sum2[257]<=1^0^Co2[256];
        Co2[257]<=(1&0|(1|0)&Co2[256]);

        Sum2[258]<=1^0^Co2[257];
        Co2[258]<=(1&0|(1|0)&Co2[257]);

        Sum2[259]<=1^0^Co2[258];
        Co2[259]<=(1&0|(1|0)&Co2[258]);

        Sum2[260]<=1^0^Co2[259];
        Co2[260]<=(1&0|(1|0)&Co2[259]);

        Sum2[261]<=1^0^Co2[260];
        Co2[261]<=(1&0|(1|0)&Co2[260]);

        Sum2[262]<=1^0^Co2[261];
        Co2[262]<=(1&0|(1|0)&Co2[261]);

        Sum2[263]<=1^0^Co2[262];
        Co2[263]<=(1&0|(1|0)&Co2[262]);

        Sum2[264]<=1^0^Co2[263];
        Co2[264]<=(1&0|(1|0)&Co2[263]);

        Sum2[265]<=1^0^Co2[264];
        Co2[265]<=(1&0|(1|0)&Co2[264]);

        Sum2[266]<=1^0^Co2[265];
        Co2[266]<=(1&0|(1|0)&Co2[265]);

        Sum2[267]<=1^0^Co2[266];
        Co2[267]<=(1&0|(1|0)&Co2[266]);

        Sum2[268]<=1^0^Co2[267];
        Co2[268]<=(1&0|(1|0)&Co2[267]);

        Sum2[269]<=1^0^Co2[268];
        Co2[269]<=(1&0|(1|0)&Co2[268]);

        Sum2[270]<=1^0^Co2[269];
        Co2[270]<=(1&0|(1|0)&Co2[269]);

        Sum2[271]<=1^0^Co2[270];
        Co2[271]<=(1&0|(1|0)&Co2[270]);

        Sum2[272]<=1^0^Co2[271];
        Co2[272]<=(1&0|(1|0)&Co2[271]);

        Sum2[273]<=1^0^Co2[272];
        Co2[273]<=(1&0|(1|0)&Co2[272]);

        Sum2[274]<=1^0^Co2[273];
        Co2[274]<=(1&0|(1|0)&Co2[273]);

        Sum2[275]<=1^0^Co2[274];
        Co2[275]<=(1&0|(1|0)&Co2[274]);

        Sum2[276]<=1^0^Co2[275];
        Co2[276]<=(1&0|(1|0)&Co2[275]);

        Sum2[277]<=1^0^Co2[276];
        Co2[277]<=(1&0|(1|0)&Co2[276]);

        Sum2[278]<=1^0^Co2[277];
        Co2[278]<=(1&0|(1|0)&Co2[277]);

        Sum2[279]<=1^0^Co2[278];
        Co2[279]<=(1&0|(1|0)&Co2[278]);

        Sum2[280]<=1^0^Co2[279];
        Co2[280]<=(1&0|(1|0)&Co2[279]);

        Sum2[281]<=1^0^Co2[280];
        Co2[281]<=(1&0|(1|0)&Co2[280]);

        Sum2[282]<=1^0^Co2[281];
        Co2[282]<=(1&0|(1|0)&Co2[281]);

        Sum2[283]<=1^0^Co2[282];
        Co2[283]<=(1&0|(1|0)&Co2[282]);

        Sum2[284]<=1^0^Co2[283];
        Co2[284]<=(1&0|(1|0)&Co2[283]);

        Sum2[285]<=1^0^Co2[284];
        Co2[285]<=(1&0|(1|0)&Co2[284]);

        Sum2[286]<=1^0^Co2[285];
        Co2[286]<=(1&0|(1|0)&Co2[285]);

        Sum2[287]<=1^0^Co2[286];
        Co2[287]<=(1&0|(1|0)&Co2[286]);

        Sum2[288]<=1^0^Co2[287];
        Co2[288]<=(1&0|(1|0)&Co2[287]);

        Sum2[289]<=1^0^Co2[288];
        Co2[289]<=(1&0|(1|0)&Co2[288]);

        Sum2[290]<=1^0^Co2[289];
        Co2[290]<=(1&0|(1|0)&Co2[289]);

        Sum2[291]<=1^0^Co2[290];
        Co2[291]<=(1&0|(1|0)&Co2[290]);

        Sum2[292]<=1^0^Co2[291];
        Co2[292]<=(1&0|(1|0)&Co2[291]);

        Sum2[293]<=1^0^Co2[292];
        Co2[293]<=(1&0|(1|0)&Co2[292]);

        Sum2[294]<=1^0^Co2[293];
        Co2[294]<=(1&0|(1|0)&Co2[293]);

        Sum2[295]<=1^0^Co2[294];
        Co2[295]<=(1&0|(1|0)&Co2[294]);

        Sum2[296]<=1^0^Co2[295];
        Co2[296]<=(1&0|(1|0)&Co2[295]);

        Sum2[297]<=1^0^Co2[296];
        Co2[297]<=(1&0|(1|0)&Co2[296]);

        Sum2[298]<=1^0^Co2[297];
        Co2[298]<=(1&0|(1|0)&Co2[297]);

        Sum2[299]<=1^0^Co2[298];
        Co2[299]<=(1&0|(1|0)&Co2[298]);

        Sum2[300]<=1^0^Co2[299];
        Co2[300]<=(1&0|(1|0)&Co2[299]);

        Sum2[301]<=1^0^Co2[300];
        Co2[301]<=(1&0|(1|0)&Co2[300]);

        Sum2[302]<=1^0^Co2[301];
        Co2[302]<=(1&0|(1|0)&Co2[301]);

        Sum2[303]<=1^0^Co2[302];
        Co2[303]<=(1&0|(1|0)&Co2[302]);

        Sum2[304]<=1^0^Co2[303];
        Co2[304]<=(1&0|(1|0)&Co2[303]);

        Sum2[305]<=1^0^Co2[304];
        Co2[305]<=(1&0|(1|0)&Co2[304]);

        Sum2[306]<=1^0^Co2[305];
        Co2[306]<=(1&0|(1|0)&Co2[305]);

        Sum2[307]<=1^0^Co2[306];
        Co2[307]<=(1&0|(1|0)&Co2[306]);

        Sum2[308]<=1^0^Co2[307];
        Co2[308]<=(1&0|(1|0)&Co2[307]);

        Sum2[309]<=1^0^Co2[308];
        Co2[309]<=(1&0|(1|0)&Co2[308]);

        Sum2[310]<=1^0^Co2[309];
        Co2[310]<=(1&0|(1|0)&Co2[309]);

        Sum2[311]<=1^0^Co2[310];
        Co2[311]<=(1&0|(1|0)&Co2[310]);

        Sum2[312]<=1^0^Co2[311];
        Co2[312]<=(1&0|(1|0)&Co2[311]);

        Sum2[313]<=1^0^Co2[312];
        Co2[313]<=(1&0|(1|0)&Co2[312]);

        Sum2[314]<=1^0^Co2[313];
        Co2[314]<=(1&0|(1|0)&Co2[313]);

        Sum2[315]<=1^0^Co2[314];
        Co2[315]<=(1&0|(1|0)&Co2[314]);

        Sum2[316]<=1^0^Co2[315];
        Co2[316]<=(1&0|(1|0)&Co2[315]);

        Sum2[317]<=1^0^Co2[316];
        Co2[317]<=(1&0|(1|0)&Co2[316]);

        Sum2[318]<=1^0^Co2[317];
        Co2[318]<=(1&0|(1|0)&Co2[317]);

        Sum2[319]<=1^0^Co2[318];
        Co2[319]<=(1&0|(1|0)&Co2[318]);

        Sum2[320]<=1^0^Co2[319];
        Co2[320]<=(1&0|(1|0)&Co2[319]);

        Sum2[321]<=1^0^Co2[320];
        Co2[321]<=(1&0|(1|0)&Co2[320]);

        Sum2[322]<=1^0^Co2[321];
        Co2[322]<=(1&0|(1|0)&Co2[321]);

        Sum2[323]<=1^0^Co2[322];
        Co2[323]<=(1&0|(1|0)&Co2[322]);

        Sum2[324]<=1^0^Co2[323];
        Co2[324]<=(1&0|(1|0)&Co2[323]);

        Sum2[325]<=1^0^Co2[324];
        Co2[325]<=(1&0|(1|0)&Co2[324]);

        Sum2[326]<=1^0^Co2[325];
        Co2[326]<=(1&0|(1|0)&Co2[325]);

        Sum2[327]<=1^0^Co2[326];
        Co2[327]<=(1&0|(1|0)&Co2[326]);

        Sum2[328]<=1^0^Co2[327];
        Co2[328]<=(1&0|(1|0)&Co2[327]);

        Sum2[329]<=1^0^Co2[328];
        Co2[329]<=(1&0|(1|0)&Co2[328]);

        Sum2[330]<=1^0^Co2[329];
        Co2[330]<=(1&0|(1|0)&Co2[329]);

        Sum2[331]<=1^0^Co2[330];
        Co2[331]<=(1&0|(1|0)&Co2[330]);

        Sum2[332]<=1^0^Co2[331];
        Co2[332]<=(1&0|(1|0)&Co2[331]);

        Sum2[333]<=1^0^Co2[332];
        Co2[333]<=(1&0|(1|0)&Co2[332]);

        Sum2[334]<=1^0^Co2[333];
        Co2[334]<=(1&0|(1|0)&Co2[333]);

        Sum2[335]<=1^0^Co2[334];
        Co2[335]<=(1&0|(1|0)&Co2[334]);

        Sum2[336]<=1^0^Co2[335];
        Co2[336]<=(1&0|(1|0)&Co2[335]);

        Sum2[337]<=1^0^Co2[336];
        Co2[337]<=(1&0|(1|0)&Co2[336]);

        Sum2[338]<=1^0^Co2[337];
        Co2[338]<=(1&0|(1|0)&Co2[337]);

        Sum2[339]<=1^0^Co2[338];
        Co2[339]<=(1&0|(1|0)&Co2[338]);

        Sum2[340]<=1^0^Co2[339];
        Co2[340]<=(1&0|(1|0)&Co2[339]);

        Sum2[341]<=1^0^Co2[340];
        Co2[341]<=(1&0|(1|0)&Co2[340]);

        Sum2[342]<=1^0^Co2[341];
        Co2[342]<=(1&0|(1|0)&Co2[341]);

        Sum2[343]<=1^0^Co2[342];
        Co2[343]<=(1&0|(1|0)&Co2[342]);

        Sum2[344]<=1^0^Co2[343];
        Co2[344]<=(1&0|(1|0)&Co2[343]);

        Sum2[345]<=1^0^Co2[344];
        Co2[345]<=(1&0|(1|0)&Co2[344]);

        Sum2[346]<=1^0^Co2[345];
        Co2[346]<=(1&0|(1|0)&Co2[345]);

        Sum2[347]<=1^0^Co2[346];
        Co2[347]<=(1&0|(1|0)&Co2[346]);

        Sum2[348]<=1^0^Co2[347];
        Co2[348]<=(1&0|(1|0)&Co2[347]);

        Sum2[349]<=1^0^Co2[348];
        Co2[349]<=(1&0|(1|0)&Co2[348]);

        Sum2[350]<=1^0^Co2[349];
        Co2[350]<=(1&0|(1|0)&Co2[349]);

        Sum2[351]<=1^0^Co2[350];
        Co2[351]<=(1&0|(1|0)&Co2[350]);

        Sum2[352]<=1^0^Co2[351];
        Co2[352]<=(1&0|(1|0)&Co2[351]);

        Sum2[353]<=1^0^Co2[352];
        Co2[353]<=(1&0|(1|0)&Co2[352]);

        Sum2[354]<=1^0^Co2[353];
        Co2[354]<=(1&0|(1|0)&Co2[353]);

        Sum2[355]<=1^0^Co2[354];
        Co2[355]<=(1&0|(1|0)&Co2[354]);

        Sum2[356]<=1^0^Co2[355];
        Co2[356]<=(1&0|(1|0)&Co2[355]);

        Sum2[357]<=1^0^Co2[356];
        Co2[357]<=(1&0|(1|0)&Co2[356]);

        Sum2[358]<=1^0^Co2[357];
        Co2[358]<=(1&0|(1|0)&Co2[357]);

        Sum2[359]<=1^0^Co2[358];
        Co2[359]<=(1&0|(1|0)&Co2[358]);

        Sum2[360]<=1^0^Co2[359];
        Co2[360]<=(1&0|(1|0)&Co2[359]);

        Sum2[361]<=1^0^Co2[360];
        Co2[361]<=(1&0|(1|0)&Co2[360]);

        Sum2[362]<=1^0^Co2[361];
        Co2[362]<=(1&0|(1|0)&Co2[361]);

        Sum2[363]<=1^0^Co2[362];
        Co2[363]<=(1&0|(1|0)&Co2[362]);

        Sum2[364]<=1^0^Co2[363];
        Co2[364]<=(1&0|(1|0)&Co2[363]);

        Sum2[365]<=1^0^Co2[364];
        Co2[365]<=(1&0|(1|0)&Co2[364]);

        Sum2[366]<=1^0^Co2[365];
        Co2[366]<=(1&0|(1|0)&Co2[365]);

        Sum2[367]<=1^0^Co2[366];
        Co2[367]<=(1&0|(1|0)&Co2[366]);

        Sum2[368]<=1^0^Co2[367];
        Co2[368]<=(1&0|(1|0)&Co2[367]);

        Sum2[369]<=1^0^Co2[368];
        Co2[369]<=(1&0|(1|0)&Co2[368]);

        Sum2[370]<=1^0^Co2[369];
        Co2[370]<=(1&0|(1|0)&Co2[369]);

        Sum2[371]<=1^0^Co2[370];
        Co2[371]<=(1&0|(1|0)&Co2[370]);

        Sum2[372]<=1^0^Co2[371];
        Co2[372]<=(1&0|(1|0)&Co2[371]);

        Sum2[373]<=1^0^Co2[372];
        Co2[373]<=(1&0|(1|0)&Co2[372]);

        Sum2[374]<=1^0^Co2[373];
        Co2[374]<=(1&0|(1|0)&Co2[373]);

        Sum2[375]<=1^0^Co2[374];
        Co2[375]<=(1&0|(1|0)&Co2[374]);

        Sum2[376]<=1^0^Co2[375];
        Co2[376]<=(1&0|(1|0)&Co2[375]);

        Sum2[377]<=1^0^Co2[376];
        Co2[377]<=(1&0|(1|0)&Co2[376]);

        Sum2[378]<=1^0^Co2[377];
        Co2[378]<=(1&0|(1|0)&Co2[377]);

        Sum2[379]<=1^0^Co2[378];
        Co2[379]<=(1&0|(1|0)&Co2[378]);

        Sum2[380]<=1^0^Co2[379];
        Co2[380]<=(1&0|(1|0)&Co2[379]);

        Sum2[381]<=1^0^Co2[380];
        Co2[381]<=(1&0|(1|0)&Co2[380]);

        Sum2[382]<=1^0^Co2[381];
        Co2[382]<=(1&0|(1|0)&Co2[381]);

        Sum2[383]<=1^0^Co2[382];
        Co2[383]<=(1&0|(1|0)&Co2[382]);

        Sum2[384]<=1^0^Co2[383];
        Co2[384]<=(1&0|(1|0)&Co2[383]);

        Sum2[385]<=1^0^Co2[384];
        Co2[385]<=(1&0|(1|0)&Co2[384]);

        Sum2[386]<=1^0^Co2[385];
        Co2[386]<=(1&0|(1|0)&Co2[385]);

        Sum2[387]<=1^0^Co2[386];
        Co2[387]<=(1&0|(1|0)&Co2[386]);

        Sum2[388]<=1^0^Co2[387];
        Co2[388]<=(1&0|(1|0)&Co2[387]);

        Sum2[389]<=1^0^Co2[388];
        Co2[389]<=(1&0|(1|0)&Co2[388]);

        Sum2[390]<=1^0^Co2[389];
        Co2[390]<=(1&0|(1|0)&Co2[389]);

        Sum2[391]<=1^0^Co2[390];
        Co2[391]<=(1&0|(1|0)&Co2[390]);

        Sum2[392]<=1^0^Co2[391];
        Co2[392]<=(1&0|(1|0)&Co2[391]);

        Sum2[393]<=1^0^Co2[392];
        Co2[393]<=(1&0|(1|0)&Co2[392]);

        Sum2[394]<=1^0^Co2[393];
        Co2[394]<=(1&0|(1|0)&Co2[393]);

        Sum2[395]<=1^0^Co2[394];
        Co2[395]<=(1&0|(1|0)&Co2[394]);

        Sum2[396]<=1^0^Co2[395];
        Co2[396]<=(1&0|(1|0)&Co2[395]);

        Sum2[397]<=1^0^Co2[396];
        Co2[397]<=(1&0|(1|0)&Co2[396]);

        Sum2[398]<=1^0^Co2[397];
        Co2[398]<=(1&0|(1|0)&Co2[397]);

        Sum2[399]<=1^0^Co2[398];
        Co2[399]<=(1&0|(1|0)&Co2[398]);

        Sum2[400]<=1^0^Co2[399];
        Co2[400]<=(1&0|(1|0)&Co2[399]);

        Sum2[401]<=1^0^Co2[400];
        Co2[401]<=(1&0|(1|0)&Co2[400]);

        Sum2[402]<=1^0^Co2[401];
        Co2[402]<=(1&0|(1|0)&Co2[401]);

        Sum2[403]<=1^0^Co2[402];
        Co2[403]<=(1&0|(1|0)&Co2[402]);

        Sum2[404]<=1^0^Co2[403];
        Co2[404]<=(1&0|(1|0)&Co2[403]);

        Sum2[405]<=1^0^Co2[404];
        Co2[405]<=(1&0|(1|0)&Co2[404]);

        Sum2[406]<=1^0^Co2[405];
        Co2[406]<=(1&0|(1|0)&Co2[405]);

        Sum2[407]<=1^0^Co2[406];
        Co2[407]<=(1&0|(1|0)&Co2[406]);

        Sum2[408]<=1^0^Co2[407];
        Co2[408]<=(1&0|(1|0)&Co2[407]);

        Sum2[409]<=1^0^Co2[408];
        Co2[409]<=(1&0|(1|0)&Co2[408]);

        Sum2[410]<=1^0^Co2[409];
        Co2[410]<=(1&0|(1|0)&Co2[409]);

        Sum2[411]<=1^0^Co2[410];
        Co2[411]<=(1&0|(1|0)&Co2[410]);

        Sum2[412]<=1^0^Co2[411];
        Co2[412]<=(1&0|(1|0)&Co2[411]);

        Sum2[413]<=1^0^Co2[412];
        Co2[413]<=(1&0|(1|0)&Co2[412]);

        Sum2[414]<=1^0^Co2[413];
        Co2[414]<=(1&0|(1|0)&Co2[413]);

        Sum2[415]<=1^0^Co2[414];
        Co2[415]<=(1&0|(1|0)&Co2[414]);

        Sum2[416]<=1^0^Co2[415];
        Co2[416]<=(1&0|(1|0)&Co2[415]);

        Sum2[417]<=1^0^Co2[416];
        Co2[417]<=(1&0|(1|0)&Co2[416]);

        Sum2[418]<=1^0^Co2[417];
        Co2[418]<=(1&0|(1|0)&Co2[417]);

        Sum2[419]<=1^0^Co2[418];
        Co2[419]<=(1&0|(1|0)&Co2[418]);

        Sum2[420]<=1^0^Co2[419];
        Co2[420]<=(1&0|(1|0)&Co2[419]);

        Sum2[421]<=1^0^Co2[420];
        Co2[421]<=(1&0|(1|0)&Co2[420]);

        Sum2[422]<=1^0^Co2[421];
        Co2[422]<=(1&0|(1|0)&Co2[421]);

        Sum2[423]<=1^0^Co2[422];
        Co2[423]<=(1&0|(1|0)&Co2[422]);

        Sum2[424]<=1^0^Co2[423];
        Co2[424]<=(1&0|(1|0)&Co2[423]);

        Sum2[425]<=1^0^Co2[424];
        Co2[425]<=(1&0|(1|0)&Co2[424]);

        Sum2[426]<=1^0^Co2[425];
        Co2[426]<=(1&0|(1|0)&Co2[425]);

        Sum2[427]<=1^0^Co2[426];
        Co2[427]<=(1&0|(1|0)&Co2[426]);

        Sum2[428]<=1^0^Co2[427];
        Co2[428]<=(1&0|(1|0)&Co2[427]);

        Sum2[429]<=1^0^Co2[428];
        Co2[429]<=(1&0|(1|0)&Co2[428]);

        Sum2[430]<=1^0^Co2[429];
        Co2[430]<=(1&0|(1|0)&Co2[429]);

        Sum2[431]<=1^0^Co2[430];
        Co2[431]<=(1&0|(1|0)&Co2[430]);

        Sum2[432]<=1^0^Co2[431];
        Co2[432]<=(1&0|(1|0)&Co2[431]);

        Sum2[433]<=1^0^Co2[432];
        Co2[433]<=(1&0|(1|0)&Co2[432]);

        Sum2[434]<=1^0^Co2[433];
        Co2[434]<=(1&0|(1|0)&Co2[433]);

        Sum2[435]<=1^0^Co2[434];
        Co2[435]<=(1&0|(1|0)&Co2[434]);

        Sum2[436]<=1^0^Co2[435];
        Co2[436]<=(1&0|(1|0)&Co2[435]);

        Sum2[437]<=1^0^Co2[436];
        Co2[437]<=(1&0|(1|0)&Co2[436]);

        Sum2[438]<=1^0^Co2[437];
        Co2[438]<=(1&0|(1|0)&Co2[437]);

        Sum2[439]<=1^0^Co2[438];
        Co2[439]<=(1&0|(1|0)&Co2[438]);

        Sum2[440]<=1^0^Co2[439];
        Co2[440]<=(1&0|(1|0)&Co2[439]);

        Sum2[441]<=1^0^Co2[440];
        Co2[441]<=(1&0|(1|0)&Co2[440]);

        Sum2[442]<=1^0^Co2[441];
        Co2[442]<=(1&0|(1|0)&Co2[441]);

        Sum2[443]<=1^0^Co2[442];
        Co2[443]<=(1&0|(1|0)&Co2[442]);

        Sum2[444]<=1^0^Co2[443];
        Co2[444]<=(1&0|(1|0)&Co2[443]);

        Sum2[445]<=1^0^Co2[444];
        Co2[445]<=(1&0|(1|0)&Co2[444]);

        Sum2[446]<=1^0^Co2[445];
        Co2[446]<=(1&0|(1|0)&Co2[445]);

        Sum2[447]<=1^0^Co2[446];
        Co2[447]<=(1&0|(1|0)&Co2[446]);

        Sum2[448]<=1^0^Co2[447];
        Co2[448]<=(1&0|(1|0)&Co2[447]);

        Sum2[449]<=1^0^Co2[448];
        Co2[449]<=(1&0|(1|0)&Co2[448]);

        Sum2[450]<=1^0^Co2[449];
        Co2[450]<=(1&0|(1|0)&Co2[449]);

        Sum2[451]<=1^0^Co2[450];
        Co2[451]<=(1&0|(1|0)&Co2[450]);

        Sum2[452]<=1^0^Co2[451];
        Co2[452]<=(1&0|(1|0)&Co2[451]);

        Sum2[453]<=1^0^Co2[452];
        Co2[453]<=(1&0|(1|0)&Co2[452]);

        Sum2[454]<=1^0^Co2[453];
        Co2[454]<=(1&0|(1|0)&Co2[453]);

        Sum2[455]<=1^0^Co2[454];
        Co2[455]<=(1&0|(1|0)&Co2[454]);

        Sum2[456]<=1^0^Co2[455];
        Co2[456]<=(1&0|(1|0)&Co2[455]);

        Sum2[457]<=1^0^Co2[456];
        Co2[457]<=(1&0|(1|0)&Co2[456]);

        Sum2[458]<=1^0^Co2[457];
        Co2[458]<=(1&0|(1|0)&Co2[457]);

        Sum2[459]<=1^0^Co2[458];
        Co2[459]<=(1&0|(1|0)&Co2[458]);

        Sum2[460]<=1^0^Co2[459];
        Co2[460]<=(1&0|(1|0)&Co2[459]);

        Sum2[461]<=1^0^Co2[460];
        Co2[461]<=(1&0|(1|0)&Co2[460]);

        Sum2[462]<=1^0^Co2[461];
        Co2[462]<=(1&0|(1|0)&Co2[461]);

        Sum2[463]<=1^0^Co2[462];
        Co2[463]<=(1&0|(1|0)&Co2[462]);

        Sum2[464]<=1^0^Co2[463];
        Co2[464]<=(1&0|(1|0)&Co2[463]);

        Sum2[465]<=1^0^Co2[464];
        Co2[465]<=(1&0|(1|0)&Co2[464]);

        Sum2[466]<=1^0^Co2[465];
        Co2[466]<=(1&0|(1|0)&Co2[465]);

        Sum2[467]<=1^0^Co2[466];
        Co2[467]<=(1&0|(1|0)&Co2[466]);

        Sum2[468]<=1^0^Co2[467];
        Co2[468]<=(1&0|(1|0)&Co2[467]);

        Sum2[469]<=1^0^Co2[468];
        Co2[469]<=(1&0|(1|0)&Co2[468]);

        Sum2[470]<=1^0^Co2[469];
        Co2[470]<=(1&0|(1|0)&Co2[469]);

        Sum2[471]<=1^0^Co2[470];
        Co2[471]<=(1&0|(1|0)&Co2[470]);

        Sum2[472]<=1^0^Co2[471];
        Co2[472]<=(1&0|(1|0)&Co2[471]);

        Sum2[473]<=1^0^Co2[472];
        Co2[473]<=(1&0|(1|0)&Co2[472]);

        Sum2[474]<=1^0^Co2[473];
        Co2[474]<=(1&0|(1|0)&Co2[473]);

        Sum2[475]<=1^0^Co2[474];
        Co2[475]<=(1&0|(1|0)&Co2[474]);

        Sum2[476]<=1^0^Co2[475];
        Co2[476]<=(1&0|(1|0)&Co2[475]);

        Sum2[477]<=1^0^Co2[476];
        Co2[477]<=(1&0|(1|0)&Co2[476]);

        Sum2[478]<=1^0^Co2[477];
        Co2[478]<=(1&0|(1|0)&Co2[477]);

        Sum2[479]<=1^0^Co2[478];
        Co2[479]<=(1&0|(1|0)&Co2[478]);

        Sum2[480]<=1^0^Co2[479];
        Co2[480]<=(1&0|(1|0)&Co2[479]);

        Sum2[481]<=1^0^Co2[480];
        Co2[481]<=(1&0|(1|0)&Co2[480]);

        Sum2[482]<=1^0^Co2[481];
        Co2[482]<=(1&0|(1|0)&Co2[481]);

        Sum2[483]<=1^0^Co2[482];
        Co2[483]<=(1&0|(1|0)&Co2[482]);

        Sum2[484]<=1^0^Co2[483];
        Co2[484]<=(1&0|(1|0)&Co2[483]);

        Sum2[485]<=1^0^Co2[484];
        Co2[485]<=(1&0|(1|0)&Co2[484]);

        Sum2[486]<=1^0^Co2[485];
        Co2[486]<=(1&0|(1|0)&Co2[485]);

        Sum2[487]<=1^0^Co2[486];
        Co2[487]<=(1&0|(1|0)&Co2[486]);

        Sum2[488]<=1^0^Co2[487];
        Co2[488]<=(1&0|(1|0)&Co2[487]);

        Sum2[489]<=1^0^Co2[488];
        Co2[489]<=(1&0|(1|0)&Co2[488]);

        Sum2[490]<=1^0^Co2[489];
        Co2[490]<=(1&0|(1|0)&Co2[489]);

        Sum2[491]<=1^0^Co2[490];
        Co2[491]<=(1&0|(1|0)&Co2[490]);

        Sum2[492]<=1^0^Co2[491];
        Co2[492]<=(1&0|(1|0)&Co2[491]);

        Sum2[493]<=1^0^Co2[492];
        Co2[493]<=(1&0|(1|0)&Co2[492]);

        Sum2[494]<=1^0^Co2[493];
        Co2[494]<=(1&0|(1|0)&Co2[493]);

        Sum2[495]<=1^0^Co2[494];
        Co2[495]<=(1&0|(1|0)&Co2[494]);

        Sum2[496]<=1^0^Co2[495];
        Co2[496]<=(1&0|(1|0)&Co2[495]);

        Sum2[497]<=1^0^Co2[496];
        Co2[497]<=(1&0|(1|0)&Co2[496]);

        Sum2[498]<=1^0^Co2[497];
        Co2[498]<=(1&0|(1|0)&Co2[497]);

        Sum2[499]<=1^0^Co2[498];
        Co2[499]<=(1&0|(1|0)&Co2[498]);

        Sum2[500]<=1^0^Co2[499];
        Co2[500]<=(1&0|(1|0)&Co2[499]);

        Sum2[501]<=1^0^Co2[500];
        Co2[501]<=(1&0|(1|0)&Co2[500]);

        Sum2[502]<=1^0^Co2[501];
        Co2[502]<=(1&0|(1|0)&Co2[501]);

        Sum2[503]<=1^0^Co2[502];
        Co2[503]<=(1&0|(1|0)&Co2[502]);

        Sum2[504]<=1^0^Co2[503];
        Co2[504]<=(1&0|(1|0)&Co2[503]);

        Sum2[505]<=1^0^Co2[504];
        Co2[505]<=(1&0|(1|0)&Co2[504]);

        Sum2[506]<=1^0^Co2[505];
        Co2[506]<=(1&0|(1|0)&Co2[505]);

        Sum2[507]<=1^0^Co2[506];
        Co2[507]<=(1&0|(1|0)&Co2[506]);

        Sum2[508]<=1^0^Co2[507];
        Co2[508]<=(1&0|(1|0)&Co2[507]);

        Sum2[509]<=1^0^Co2[508];
        Co2[509]<=(1&0|(1|0)&Co2[508]);

        Sum2[510]<=1^0^Co2[509];
        Co2[510]<=(1&0|(1|0)&Co2[509]);

        Sum2[511]<=1^0^Co2[510];
        Co2[511]<=(1&0|(1|0)&Co2[510]);

end

always @(posedge RST_risingedge) begin
    LED1 <= LEDr;
end

//assign out_data = Sum2;
assign Out = Co2[1023];

endmodule
