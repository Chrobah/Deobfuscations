-- source: github.com/Drop56796/nightmare  (nightmare mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/MuhXd/DoorSuff/main/Whitelist/NewKeySystem.lua  (59780 bytes)

--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.1.6) ~  Much Love, Ferib 

]]--
--[[
do local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=getfenv or function()return _ENV;end;local v9=setmetatable;local v10=pcall;local v11=select;local v12=unpack or table.unpack;local v13=tonumber;local function v14(v15,v16)local v17=1;local v18;v15=v4(v3(v15,5),"..",function(v29)if (v1(v29,2)==79) then v18=v0(v3(v29,1,1));return "";else local v62=v2(v0(v29,16));if v18 then local v73=0;local v74;while true do if (0==v73) then v74=v5(v62,v18);v18=nil;v73=1;end if (v73==1) then return v74;end end else return v62;end end end);local function v19(v30,v31,v32)if v32 then local v63=(v30/(((3 + 0) -1)^(v31-1)))%(((3 + 0) -1)^(((v32-(2 -1)) -(v31-(1 -0))) + (2 -1)));return v63-(v63%(2 -1));else local v64=1987 -(798 + 1189);local v65;while true do if (v64==(0 -0)) then v65=(3 -1)^(v31-((1 + 0) -0));return (((v30%(v65 + v65))>=v65) and (2 -1)) or (0 + 0);end end end end local function v20()local v37=0;local v38;while true do if (v37==(0 -(834 -(365 + 469)))) then v38=v1(v15,v17,v17);v17=v17 + (3 -2);v37=1189 -(81 + 1107);end if (v37==1) then return v38;end end end local function v21()local v39,v40=v1(v15,v17,v17 + 1 + 1);v17=v17 + (1241 -(833 + 406));return (v40 * 256) + v39;end local function v22()local v41,v42,v43,v44=v1(v15,v17,v17 + 2 + (911 -(49 + 861)));v17=v17 + (8 -4);return (v44 * (16778605 -((332 -(155 + 14)) + 1226))) + (v43 * 65536) + (v42 * (232 + 24)) + v41;end local function v23()local v45=0;local v46;local v47;while true do if (v45==0) then v46=v22();v47=v22();v45=3 -2;end if ((1 + 0)==v45) then return (( -(1380 -(119 + (2472 -(1025 + 188)))) * v19(v47,623 -(59 + 532))) + (1 -0)) * ((1177 -(907 + 268))^(v19(v47,34 -13,3 + 28) -1023)) * ((((v19(v47,1 + 0,(35 -15) + 0) * (2^(1825 -(934 + 733 + 126)))) + v46)/((2 + (0 -0))^(1657 -(882 + 723)))) + (3 -2));end end end local function v24(v33)local v48=0 -0;local v49;local v50;while true do if ((1 + 2)==v48) then return v6(v50);end if (v48==0) then v49=nil;if  not v33 then v33=v22();if (v33==(1076 -(214 + (2163 -1301)))) then return "";end end v48=1887 -(482 + 1171 + 233);end if (v48==(1 + 0)) then v49=v3(v15,v17,(v17 + v33) -(2 -1));v17=v17 + v33;v48=166 -(72 + 92);end if (2==v48) then v50={};for v75=899 -(80 + 818), #v49 do v50[v75]=v2(v1(v3(v49,v75,v75)));end v48=(1785 -(1215 + 565)) -2;end end end local v25=v22;local function v26(...)return {...},v11("#",...);end local function v27()local v51=0 -0;local v52;local v53;local v54;local v55;local v56;local v57;local v58;while true do if (v51~=(1660 -(108 + 1552))) then else local v71=0 + 0;while true do if (v71~=0) then else v52=0 -0;v53=nil;v71=1 -0;end if (v71==1) then v51=1;break;end end end if (v51==(1 + 0)) then local v72=0;while true do if (v72==(0 + 0)) then v54=nil;v55=nil;v72=1 + 0;end if (v72==(2 -1)) then v51=4 -2;break;end end end if (3==v51) then v58=nil;while true do if (v52~=1) then else local v93=0 -0;while true do if (v93~=(0 + 0)) then else local v99=0 -0;while true do if (v99==(1 + 0)) then v93=2 -1;break;end if (v99==(0 -0)) then v56={v53,v54,nil,v55};v57=v22();v99=1 -0;end end end if (v93==(1 + 0)) then v58={};v52=1443 -(1252 + 189);break;end end end if (v52~=(2 + 0)) then else local v94=0 -0;while true do if (v94==(1 + 0)) then for v101=1,v22() do local v102=0 -0;local v103;local v104;local v105;while true do if (v102~=(1 + 0)) then else v105=nil;while true do if (v103==(0 + 0)) then local v118=0 -0;while true do if ((1 -0)~=v118) then else v103=2 -1;break;end if ((0 + 0)==v118) then v104=0;v105=nil;v118=1370 -(656 + 713);end end end if (v103==1) then while true do if (v104~=(0 -0)) then else v105=v20();if (v19(v105,1,2 -1)==(0 -0)) then local v121=0 -0;local v122;local v123;local v124;while true do if (v121~=(1 + 2)) then else if (v19(v123,1734 -(87 + 1644),1141 -(619 + 519))==(2 -1)) then v124[12 -8]=v58[v124[1300 -(843 + 453)]];end v53[v101]=v124;break;end if (v121==(0 + 0)) then local v126=0 -0;while true do if (v126==1) then v121=1;break;end if (v126==0) then v122=v19(v105,1 + 1,3);v123=v19(v105,1 + 3,17 -11);v126=1 + 0;end end end if (v121~=1) then else local v127=0 + 0;while true do if (v127==1) then v121=2;break;end if (v127==(0 -0)) then v124={v21(),v21(),nil,nil};if (v122==(0 + 0)) then local v236=1851 -(754 + 1097);local v237;while true do if (v236==(217 -(37 + 180))) then v237=1297 -(134 + 1163);while true do if (v237==0) then v124[4 -1]=v21();v124[1791 -(679 + 1108)]=v21();break;end end break;end end elseif (v122==(1 + 0)) then v124[4 -1]=v22();elseif (v122==(1835 -(482 + 1351))) then v124[7 -4]=v22() -((191 -(18 + 171))^16);elseif (v122~=(7 -4)) then else local v300=979 -(471 + 508);local v301;while true do if (v300~=(0 + 0)) then else v301=0 + 0;while true do if ((0 + 0)==v301) then v124[252 -(17 + 232)]=v22() -((1 + 1)^16);v124[3 + 1]=v21();break;end end break;end end end v127=1 -0;end end end if (v121==(8 -6)) then local v128=0 + 0;while true do if (v128~=(1 + 0)) then else v121=1963 -(713 + 1247);break;end if ((735 -(690 + 45))==v128) then if (v19(v123,4 -3,1 + 0)==1) then v124[5 -3]=v58[v124[2 + 0]];end if (v19(v123,2,954 -(141 + 811))==(3 -2)) then v124[3]=v58[v124[3]];end v128=1 + 0;end end end end end break;end end break;end end break;end if (v102~=(0 -0)) then else v103=1865 -(686 + 1179);v104=nil;v102=39 -(23 + 15);end end end v52=3;break;end if (v94~=0) then else for v106=1,v57 do local v107=0 + 0;local v108;local v109;while true do if (v107~=1) then else if (v108==(674 -(334 + 339))) then v109=v20()~=(0 + 0);elseif (v108==(2 -0)) then v109=v23();elseif (v108~=(1817 -(273 + 1541))) then else v109=v24();end v58[v106]=v109;break;end if (v107==0) then local v115=0 -0;while true do if (v115==(0 -0)) then local v119=0 + 0;while true do if (v119==0) then v108=v20();v109=nil;v119=1;end if (v119~=(1 + 0)) then else v115=712 -(210 + 501);break;end end end if (v115~=(1 -0)) then else v107=1 -0;break;end end end end end v56[3]=v20();v94=1;end end end if (0==v52) then local v95=1000 -(124 + 876);while true do if (v95~=(0 + 0)) then else v53={};v54={};v95=1;end if (v95~=(2 -1)) then else v55={};v52=983 -(246 + 736);break;end end end if (v52==(13 -10)) then local v96=1258 -(1172 + 86);while true do if (v96~=(3 -2)) then else return v56;end if (v96~=(0 -0)) then else for v110=1 + 0,v22() do v54[v110-(157 -(142 + 14))]=v27();end for v112=1,v22() do v55[v112]=v22();end v96=3 -2;end end end end break;end if (v51~=2) then else v56=nil;v57=nil;v51=2 + 1;end end end local function v28(v34,v35,v36)local v59=v34[1];local v60=v34[2];local v61=v34[3];return function(...)local v66=1;local v67= -1;local v68={...};local v69=v11("#",...) -1;local function v70()local v77=v59;local v78=Const;local v79=v60;local v80=v61;local v81=v26;local v82={};local v83={};local v84={};for v89=0 -0,v69 do if ((v89>=v80) or ((2149 + 1823)==(5616 -(492 + 1372)))) then v82[v89-v80]=v68[v89 + 1 + 0];else v84[v89]=v68[v89 + (1243 -(147 + 1095))];end end local v85=(v69-v80) + (70 -(48 + 21));local v86;local v87;while true do local v90=676 -(484 + 192);local v91;local v92;while true do if ((v90==(1 + 0)) or (734==((14359 -11172) -(946 + 1027)))) then while true do if ((v91==(0 + (254 -(209 + 45)))) or ((4919 -(124 + 906))<2940)) then v92=0 -0;while true do if ((v92==(763 -(574 + 189))) or ((196 + 840)>=(5164 -(425 + 79)))) then local v116=0 -0;local v117;while true do if ((300<(2195 -(7 + 13))) and (v116==(1650 -(12 + 1638)))) then v117=1175 -(298 + 877);while true do if (((4126 -(554 + 66))>=(4815 -(1683 + 293))) and (v117==1)) then v92=4 -3;break;end if ((0==v117) or (2577>(2863 + 1799))) then local v120=0 + 0;while true do if (((212 + 40 + 1505)==(144 + 1613)) and ((2 -1)==v120)) then v117=4 -3;break;end if (((2144 -1283)<=(2990 -(1372 + 235))) and (v120==(0 + 0 + 0))) then v86=v77[v66];v87=v86[2 -1];v120=927 -(812 + 114);end end end end break;end end end if ((v92==(711 -(444 + 6 + 260))) or ((5386 -(434 + 1))<(2079 -(275 + 513)))) then if ((v87<=((829 -(751 + 19)) -38)) or (((15159 -8280) -3552)>=(309 + (4406 -(95 + 188))))) then if ((v87<=(8 + 1 + 1)) or (3645>4176)) then if ((1172>=(1517 -(64 + 708))) and (v87<=(8 -(8 -4)))) then if ((v87<=(2 -1)) or ((3849 + 529)>=(5919 -((1013 -(9 + 2)) + 530)))) then if ((v87>(1941 -(1715 + 226))) or ((5636 -(348 + 322 + 55))==(1747 -(272 + 214)))) then if ((v86[2 + 0]==v84[v86[17 -(50 -37)]]) or (2872<=(2690 -(1373 + 151 + 467)))) then v66=v66 + (2 -1);else v66=v86[1490 -(25 + 1462)];end else local v129=0 + 0;local v130;while true do if ((4209>=(1934 -711)) and ((0 -0)==v129)) then v130=v86[1087 -(1026 + 59)];v84[v130](v84[v130 + (939 -(88 + 850)) + 0]);break;end end end elseif ((v87<=(728 -(372 + 354))) or ((1969 -1224)>(5045 -2772))) then if (v84[v86[2]] or ((286 + 179 + 3603)<=1195)) then v66=v66 + 1 + 0;else v66=v86[798 -(778 + 17)];end elseif ((1352<(3183 -1044)) and (v87==3)) then local v160=1115 -(312 + 803);local v161;local v162;local v163;while true do if ((v160==(1267 -(471 + 796))) or (((1937 + 326) -1481)>=(12297 -8842))) then v161=(417 -(162 + 255)) + 0;v162=nil;v160=1 + (1538 -(1193 + 345));end if (((3440 + 563)>=(3414 + 166)) and (v160==(3 -2))) then v163=nil;while true do if ((v161==(0 -(0 -0))) or ((3283 -(1099 + (1853 -(184 + 1487))))<407)) then local v264=0 -0;while true do if (((10924 -7233)<=(1316 + 3258)) and (v264==(0 -0))) then v162=0 + 0;v163=nil;v264=1 + 0;end if (((1041 + 1620)==(3343 -(114 + 568))) and (v264==(4 -3))) then v161=1925 -(611 + 1313);break;end end end if (((1217 + 2060)>(2702 -(203 + 551))) and (v161==(1 + 0))) then while true do if (((0 + 0)==v162) or ((130 + 1564)>2055)) then v163=v86[2 + 0];v84[v163]=v84[v163](v12(v84,v163 + 1,v86[3]));break;end end break;end end break;end end else v66=v86[3];end elseif (((5305 -(413 + 1427))>(1580 + 335)) and (v87<=7)) then if (((180 + 1969)==(812 + 1337)) and (v87<=(8 -3))) then local v131=0;local v132;while true do if (((17477 -12781)>=(15132 -11567)) and (0==v131)) then v132=v86[1021 -((797 -167) + (2117 -(431 + 1297)))];v84[v132]=v84[v132](v84[v132 + (1380 -(528 + 851))]);break;end end elseif ((v87==6) or ((7315 -3941)<=(240 + 1340))) then local v164=0 + 0 + 0;local v165;local v166;local v167;local v168;while true do if ((v164==(1 + 0)) or ((1346 -(2071 -(866 + 418)))>3594)) then v167=nil;v168=nil;v164=2;end if (((2259 + 2227)>(11808 -8312)) and (0==v164)) then v165=0 -0;v166=nil;v164=748 -(339 + (620 -212));end if ((v164==2) or (827==(6085 -4782))) then while true do if (((1206 + 2949)==4155) and ((0 + 0)==v165)) then local v265=0;while true do if ((v265==(97 -(39 + 58))) or (1019>(4323 -(306 + 1223)))) then v166=0;v167=nil;v265=1027 -(369 + 657);end if ((v265==(1 -(0 + 0))) or ((4344 -(529 + 1275))<(767 -(109 + (690 -(62 + 25)))))) then v165=1 + 0;break;end end end if ((v165==1) or ((17292 -12295)<=((9531 -(311 + 1253)) -4546))) then v168=nil;while true do if ((1206>(2190 -(1038 + 354))) and (v166==0)) then local v303=1576 -(1027 + 549);local v304;while true do if (((4975 -2423)>=(5960 -3408)) and (v303==(0 + 0))) then v304=(1253 -(1213 + 40)) -0;while true do if (((6601 -((1241 -(629 + 414)) + 1487))>((1224 + 1492) -(270 + 402))) and (v304==(1 -0))) then v166=3 -2;break;end if (((0 + 0)==v304) or (3737<(6435 -4798))) then local v331=1400 -(255 + 1145);while true do if (((2685 -((3305 -2454) + 512))<1367) and (v331==(1 + 0))) then v304=1468 -(604 + 863);break;end if (((665 + 142)==(644 + 163)) and (v331==(0 -0))) then v167=v86[9 -7];v168=v84[v86[3 -0]];v331=2 -1;end end end end break;end end end if (((4874 -(122 + 48))>=(365 + 1373)) and (v166==(1 + 0))) then v84[v167 + (2 -1)]=v168;v84[v167]=v168[v86[14 -10]];break;end end break;end end break;end end else v84[v86[1417 -(1095 + 320)]]={};end elseif (((1747 + 313)==(795 + 1265)) and (v87<=(1382 -(1292 + 82)))) then v84[v86[2 + 0]]=v84[v86[949 -(447 + 499)]];elseif ((v87>(1417 -((923 -691) + 1176))) or ((1087 + 75 + 1091)<(2547 -(42 + 342 + (1233 -(474 + 729)))))) then local v170=0 -0;local v171;local v172;local v173;local v174;while true do if (((0 -0)==v170) or ((8258 -4619)<(19 + 2815))) then v171=0 + 0;v172=nil;v170=1 + (1883 -(805 + 1078));end if (((3275 -(53 + 343))>=(1883 -(180 + 1428))) and (v170==(1687 -(1545 + 141)))) then v173=nil;v174=nil;v170=2 + 0;end if (((3234 -1758)<(717 + 3250)) and (v170==(2 -0))) then while true do if (((4303 -(989 + 313))>=675) and (v171==0)) then local v266=0;local v267;while true do if (((503 + 58)>(948 -(136 + 330))) and ((0 -0)==v266)) then v267=0 + 0;while true do if ((v267==(0 -0)) or ((1925 + 1891)<(3893 -(10 + 74)))) then v172=v86[1 + 1];v173={v84[v172](v84[v172 + (388 -(337 + 50))])};v267=180 -(64 + (230 -115));end if ((v267==1) or ((4520 -(1583 + 89))<=((1248 -816) -((944 -670) + 87)))) then v171=1;break;end end break;end end end if ((v171==(1 + 0)) or ((5627 -(5234 -3240))<37)) then v174=1481 -((1736 -(710 + 144)) + (1613 -(145 + 869)));for v285=v172,v86[10 -6] do local v286=182 -(6 + 16 + 160);local v287;while true do if (((2796 -(16 + 60))<2771) and ((54 -(50 + 4))==v286)) then v287=0 + 0;while true do if (((1799 + 1247)>=2274) and (v287==(0 + 0 + 0))) then v174=v174 + 1 + 0 + 0;v84[v285]=v173[v174];break;end end break;end end end break;end end break;end end else local v175=0 + 0;local v176;local v177;local v178;local v179;while true do if ((v175==(5 -3)) or ((4411 -2195)<(1961 -(250 + 73)))) then for v245=v176,v67 do local v246=0 + 0;while true do if ((v246==(1831 -(364 + 1467))) or ((11959 -7244)>(19179 -14343))) then v179=v179 + (2 -1);v84[v245]=v177[v179];break;end end end break;end if ((472<=(3294 + 1286)) and (v175==(0 + 0))) then local v240=0 -0;while true do if ((v240==(658 -(336 + 321))) or ((9544 -4956)<=(1834 -(929 + 28)))) then v175=3 -2;break;end if (((10365 -6294)==(1115 + 2956)) and (v240==(0 + (0 -0)))) then v176=v86[1 + 1];v177,v178=v81(v84[v176](v84[v176 + 1 + 0]));v240=1796 -(625 + 1170);end end end if (((148 -95)<(1733 -1080)) and (v175==(2 -1))) then v67=(v178 + v176) -1;v179=784 -(255 + 529);v175=2;end end end elseif (((467 -(15 + 253))<(488 + 79)) and (v87<=(1251 -(29 + 344 + 863)))) then if ((1787>=(196 + 523)) and (v87<=(3 + 9))) then if (((4000 -(215 + 1183))==(12858 -10256)) and (v87==(1322 -(489 + 63 + (1272 -513))))) then do return v84[v86[358 -(23 + 333)]];end else for v157=v86[401 -(366 + 33)],v86[3 + 0] do v84[v157]=nil;end end elseif (((568 + 1594)==(10789 -8627)) and (v87<=(697 -(263 + 421)))) then local v134=0 -0;local v135;local v136;local v137;local v138;local v139;while true do if ((v134==1) or ((1203 -(380 + 373))>=(1378 -(154 + (1092 -748))))) then v137=nil;v138=nil;v134=1554 -(122 + 1430);end if (((9365 -5033)==(883 + 3449)) and ((2 + 0)==v134)) then v139=nil;while true do if ((v135==1) or ((1788 + 2025)<(8447 -5503))) then local v247=0 + 0;while true do if (((3237 + 1716)>2761) and (v247==(0 -0))) then v67=(v138 + v136) -1;v139=0;v247=3 -2;end if (((1514 + 199 + 0)==1713) and (v247==(941 -(927 + (49 -36))))) then v135=1217 -(183 + 1032);break;end end end if (((69 + 131 + 117)<((6067 -2889) -2316)) and (v135==(0 + 0))) then local v248=366 -(77 + (1306 -(596 + 421)));local v249;while true do if ((v248==0) or ((2863 -(478 + 939))>=4955)) then v249=0 -0;while true do if (((4460 -(68 + 185))>=(2401 -1490)) and (v249==(0 -(0 -0)))) then v136=v86[302 -(177 + 123)];v137,v138=v81(v84[v136](v12(v84,v136 + ((56 + 201) -((991 -763) + 28)),v86[1 + 0 + 2])));v249=1;end if (((4214 -(215 + 668))<=(2365 + 2416)) and (v249==(1 + 0))) then v135=(1599 -(41 + 96)) -(1216 + 245);break;end end break;end end end if (((1367 -(890 + 475))==v135) or ((24 + 380)>(1015 + (5864 -3365)))) then for v256=v136,v67 do local v257=0 + 0;local v258;while true do if ((v257==0) or (4933<(4102 -2106))) then v258=0 + 0;while true do if (((3185 -(231 + 132 + 123))<=(5971 -(639 + 581))) and (v258==(0 + 0))) then v139=v139 + 1 + 0;v84[v256]=v137[v139];break;end end break;end end end break;end end break;end if (((1371 + 2026)>=(378 + 26)) and (v134==(0 + (0 -0)))) then local v229=999 -(905 + 94);while true do if (((73 + 35)<(58 + 149)) and (v229==(2 -1))) then v134=577 -(514 + 62);break;end if ((v229==0) or ((3275 + 653)<(4285 -(600 + 1108)))) then v135=0 -0;v136=nil;v229=1;end end end end elseif ((v87>(1002 -(537 + 451))) or ((8 + 572)>=(124 + 3498))) then local v180=0;local v181;local v182;while true do if (((2042 -(164 + 292))==(3231 -(1482 + (491 -(91 + 237))))) and (v180==((0 + 0) -0))) then v181=0 + (1586 -(1326 + 260));v182=nil;v180=1;end if ((v180==(1 + 0)) or ((5563 -(733 + 231))==(735 -126))) then while true do if ((3804<=4587) and (v181==(0 + 0))) then v182=v86[3 -1];do return v84[v182](v12(v84,v182 + 1 + 0,v86[1229 -(857 + 298 + 71)]));end break;end end break;end end else local v183=1915 -(372 + 1543);local v184;local v185;while true do if ((v183==(1399 -(146 + 1252))) or ((1492 + 2264)>=(16456 -12599))) then while true do if ((v184==(692 -(261 + 431))) or ((1550 -626)>=1402)) then v185=v86[6 -4];do return v12(v84,v185,v67);end break;end end break;end if (((3078 -(8 + 2052))==(2697 -1679)) and (v183==(0 -0))) then v184=0;v185=nil;v183=1216 -(812 + 403);end end end elseif ((v87<=((1851 -(178 + 1602)) -(1880 -(1297 + 530)))) or (4631<=2375)) then if ((v87<=(8 + 2 + 6)) or ((5652 -3995)>=(214 + 1459))) then v84[v86[1 + 1 + 0]]=v36[v86[1929 -(505 + 1421)]];elseif ((v87>(27 -10)) or ((39 -27)>1870)) then local v186=0 + 0;local v187;local v188;while true do if ((v186==(0 -0)) or ((60 + 58 + 179)<(755 -((936 -(251 + 663)) + 566)))) then v187=0;v188=nil;v186=356 -(261 + 94);end if ((3362<=4009) and (v186==(4 -3))) then while true do if (((7219 -2276)==(2497 + 2446)) and (v187==(1866 -(875 + 991)))) then v188=v86[2 + 0];v84[v188]=v84[v188](v12(v84,v188 + (3 -(2 + 0)),v67));break;end end break;end end else local v189=0 + 0;local v190;local v191;local v192;local v193;while true do if (((14 + 3)<2699) and (v189==((2 -1) + 0))) then local v241=208 -(203 + 5);while true do if (((123 + 3457)>=(132 + 1633)) and (v241==(749 -(510 + 238)))) then v189=1803 -(1194 + 607);break;end if ((v241==((0 -0) -0)) or (1087>(4215 -(440 + 143)))) then v192=nil;v193=nil;v241=1;end end end if ((105<(1503 -(1394 -(21 + 362)))) and (v189==((1599 -(743 + 856)) -0))) then local v242=1307 -(602 + 705);while true do if (((849 + 4093)>(3048 -(500 + 783))) and (v242==(0 + 0))) then v190=0 -0;v191=nil;v242=1;end if (((1263 + 3639)>=(3513 -(878 + 945))) and ((1 -0)==v242)) then v189=1 -0;break;end end end if ((v189==2) or ((4540 -(4751 -3270))>(364 + 3978))) then while true do if (((3492 -1410)>(1036 + 163)) and ((3 -1)==v190)) then if (((2122 -(1350 + 157))<=3487) and (v192>(0 + 0))) then if ((((208 + 1512) -(238 + (467 -(325 + 113))))==(42 + 1411)) and (v193<=v84[v191 + (983 -(807 + 175))])) then local v312=0;while true do if ((2756<4659) and (v312==(0 -0))) then v66=v86[1 + 1 + 1];v84[v191 + 3]=v193;break;end end end elseif (((6168 -(113 + 1823))==(6186 -(1263 + 691))) and (v193>=v84[v191 + (833 -(205 + 627))])) then local v313=0;while true do if ((v313==(0 -0)) or ((2101 -(113 + 161))>2401)) then v66=v86[(3 + 2) -2];v84[v191 + 3 + 0]=v193;break;end end end break;end if (((929 -(504 + 282))<2259) and (v190==(2 -1))) then local v269=0 + 0;local v270;while true do if ((1759<=(5300 -(847 + 997))) and (v269==0)) then v270=1074 -(701 + 373);while true do if ((v270==(1470 -(418 + 1052))) or (((3295 + 669) -(293 + 1393))>(5918 -3164))) then v193=v84[v191] + v192;v84[v191]=v193;v270=2 -1;end if (((4685 -(536 + 1224))>=1774) and (v270==(1578 -(1128 + 449)))) then v190=2;break;end end break;end end end if (((3984 -(1249 + 441))>(263 + (2468 -(853 + 590)))) and (v190==0)) then local v271=0;while true do if ((v271==(1022 -(956 + 65))) or ((4485 -(1267 + 246))==(6681 -2903))) then v190=(4 -2) -1;break;end if ((1185<=(3962 -2082)) and ((1508 -(23 + 31 + 1454))==v271)) then v191=v86[2];v192=v84[v191 + 2 + 0];v271=2 -1;end end end end break;end end end elseif (((2689 -1823)<3291) and (v87<=(25 -6))) then v84[v86[2 + 0]]=v84[v86[2 + 1]][v86[1070 -(315 + 751)]];elseif ((v87>(6 + 14)) or ((9454 -4920)<=(4512 -((339 -167) + 1230)))) then do return;end else local v194=0 -0;local v195;local v196;local v197;while true do if (((14295 -9919)>=((3967 + 1233) -2394)) and (v194==(833 -(447 + 385)))) then v197=0 + 0;for v250=v195,v86[2 + 2] do local v251=1568 -(506 + 1062);local v252;while true do if (((190 -43)>113) and (v251==(0 + 0 + 0))) then v252=(753 -(382 + 371)) -0;while true do if (((13719 -(10274 -(1032 + 180)))>(178 + 169)) and (v252==(0 -0))) then v197=v197 + (2 -(3 -2));v84[v250]=v196[v197];break;end end break;end end end break;end if ((v194==(0 + 0)) or (((3949 -(61 + 226)) -2035)>=(4647 -((3690 -2344) + 572)))) then local v243=0 -0;while true do if ((136<(13504 -10220)) and (v243==(0 -0))) then v195=v86[1315 -(87 + 1226)];v196={v84[v195](v12(v84,v195 + (284 -(175 + 108)),v67))};v243=1 + 0;end if (((3621 -2491)==1130) and ((1108 -(357 + 750))==v243)) then v194=1;break;end end end end end elseif (((157 + 911)==(4025 -2957)) and (v87<=32)) then if ((v87<=26) or ((1067 + 2609)==(839 -444))) then if ((v87<=(2 + 21)) or ((1694 -1071)>2522)) then if (((2347 -(151 + 692))>=(1702 -(51 + 160))) and (v87==22)) then if ((v84[v86[2]]~=v86[5 -1]) or ((3766 -(1526 + (2346 -(759 + 1159))))>(5717 -3452))) then v66=v66 + ((1884 -(1011 + 869)) -3);else v66=v86[11 -8];end else local v142=0 -0;local v143;local v144;local v145;while true do if ((v142==(48 -(4 + 14 + 29))) or (((6580 -(1795 + 67)) -1529)<=1133)) then local v230=0 -0;while true do if (((1245 -(269 + 533))<=(3888 -(637 + 798))) and (v230==(0 -0))) then v145={};v144=v9({},{__index=function(v259,v260)local v272=0;local v273;local v274;while true do if (((1380 + 408 + (4389 -(228 + 1194)))>=3857) and ((0 + 0)==v272)) then v273=0 + 0;v274=nil;v272=1;end if ((v272==(1 -0)) or ((795 -(431 + 195))==(2754 -(832 + 685)))) then while true do if ((v273==(0 + 0)) or ((5047 -(400 + (1885 -(71 + 1584))))<=(898 + 3))) then v274=v145[v260];return v274[1 + 0][v274[1 + 1]];end end break;end end end,__newindex=function(v261,v262,v263)local v275=0;local v276;local v277;while true do if ((v275==(1 + 0)) or (((550 + 545) -(433 + 280 + 33))>=4582)) then while true do if ((4985>(4861 -(330 + 1442))) and (v276==(0 + (445 -(423 + 22))))) then v277=v145[v262];v277[1 + 0][v277[(1210 -(59 + 692)) -(198 + 259)]]=v263;break;end end break;end if ((v275==(0 + 0)) or ((11386 -8623)==2131)) then local v307=0;while true do if (((6952 -3868)<=(966 + 3216)) and (v307==((1010 -(752 + 258)) -0))) then v276=0 + 0 + 0;v277=nil;v307=2 -1;end if (((364 + 403 + 1103)<=(4499 -(403 + 1592))) and (v307==1)) then v275=1 + 0 + 0;break;end end end end end});v230=1 -0;end if ((2305==(224 + 2081)) and (v230==(903 -(126 + 27 + (1408 -659))))) then v142=6 -4;break;end end end if ((v142==(0 + 0)) or (((5687 -2746) -2189)>(2215 + 424))) then v143=v79[v86[14 -11]];v144=nil;v142=1 + 0;end if ((v142==(1 + 1)) or ((2317 -(71 + 1493))>=(2499 -(242 + 387)))) then for v232=1,v86[549 -(190 + 355)] do local v233=0 + 0;local v234;local v235;while true do if (((7465 -5248)<=3760) and (v233==0)) then v234=(5445 -3520) -((4321 -2930) + 534);v235=nil;v233=897 -(52 + 844);end if ((v233==(3 -2)) or ((435 -(83 + 17))>=4166)) then while true do if (((2858 -(420 + 106))<=(12870 -10009)) and (v234==(1 + 0))) then if ((1830<=(2179 + 2408)) and (v235[1 + 0]==(6 + (248 -(75 + 171))))) then v145[v232-1]={v84,v235[654 -(230 + 421)]};else v145[v232-(1295 -(61 + 282 + (4102 -3151)))]={v35,v235[3 + 0]};end v83[ #v83 + (1 -0)]=v145;break;end if ((v234==(0 -0)) or ((1816 -((1430 -(427 + 991)) + 1))>(5107 -(1421 + 14)))) then local v295=0;while true do if (((3999 -(1082 + 473))>=(438 + 1740)) and (v295==1)) then v234=723 -(367 + 355);break;end if (((1314 + 806 + 1270)==(13026 -9636)) and (v295==(0 + 0))) then v66=v66 + (144 -(38 + 105));v235=v77[v66];v295=1;end end end end break;end end end v84[v86[2]]=v28(v143,v144,v36);break;end end end elseif ((v87<=(18 + 6)) or ((4011 -2445)>=4992)) then if (((88 + 1161 + 2181)<=3536) and (v84[v86[2]]==v84[v86[3 + 1]])) then v66=v66 + 1 + 0;else v66=v86[1 + 2];end elseif ((v87==(7 + 18)) or ((1121 + 3738)==(4996 -(432 + 268)))) then local v198=0;local v199;local v200;local v201;while true do if ((v198==((1 -0) + 0)) or ((108 + 704)>=(5027 -(1373 + 51 + 105)))) then v201=nil;while true do if (((9081 -6075)>1023) and (v199==0)) then local v278=0 -(1948 -(1864 + 84));while true do if (((6621 -(297 + 1460))==(5603 -(17 + (2255 -(307 + 1226))))) and (v278==((0 -0) -(0 + 0)))) then v200=77 -(37 + 40);v201=nil;v278=1 -0;end if (((3880 + (1191 -(915 + 113)))>(1897 + 965)) and (v278==(1 + 0))) then v199=3 -2;break;end end end if (((2254 -(1698 + 83))==(148 + 325)) and (v199==(137 -(63 + 73)))) then while true do if (((975 + 843)>(1484 -769)) and (v200==(0 + 0 + 0))) then v201=v86[4 -(1651 -(1448 + 201))];v84[v201]=v84[v201]();break;end end break;end end break;end if ((v198==(0 -(0 -0))) or ((2955 + 1375)<1971)) then v199=0 + 0;v200=nil;v198=1 + 0;end end else local v202=0 + 0;local v203;local v204;while true do if ((v202==(1834 -(1770 + 64))) or ((3747 -(845 + 204))==(4081 + 502))) then v203=410 -(91 + 319);v204=nil;v202=1 + 0 + 0;end if (((3965 -(62 + 165))>(2606 -2006)) and (v202==1)) then while true do if ((v203==(0 -0)) or ((762 + 2406)<=(2506 -(1450 + 288)))) then v204=v86[1018 -(217 + (2067 -(719 + 549)))];do return v12(v84,v204,v204 + v86[2 + 1]);end break;end end break;end end end elseif ((v87<=(625 -(255 + 341))) or (((4863 + 311) -(256 + 996))>(4492 -(17 + 33 + 39)))) then if (((3872 -(194 + 1079))<(2332 + (1628 -(427 + 895)))) and (v87<=(19 + 8))) then v84[v86[2 + 0]]=v86[(3016 -1446) -(1046 + 521)]~=(0 + 0);elseif ((v87==(1079 -(481 + 570))) or ((6725 -4319)>=(1344 + 1756))) then v84[v86[2]]=v84[v86[622 -(56 + 563)]] + v86[4];else local v206=0;local v207;local v208;while true do if ((((1524 -(931 + 592)) + 0)==v206) or (((17101 -11089) -3666)==(654 + (2193 -(646 + 1223))))) then while true do if (((3593 -(469 + 280))>=(1148 + (1019 -682))) and (v207==(0 + 0))) then v208=v86[2 + (1282 -(356 + 926))];v84[v208](v12(v84,v208 + (3 -(1 + 1)),v86[332 -(204 + 125)]));break;end end break;end if ((v206==((0 -0) -0)) or ((2015 -1570)>=(5027 -(1239 + 668)))) then v207=0 -0;v208=nil;v206=1;end end end elseif (((1438 + (4355 -(163 + 991)))>(12313 -8156)) and (v87<=(22 + (956 -(671 + 277))))) then v84[v86[2]]=v35[v86[11 -8]];elseif (((1920 -680)<=(3825 + 526)) and (v87==(54 -23))) then v84[v86[2]]=v84[v86[1557 -(926 + 628)]]/v84[v86[1121 -(381 + 736)]];else v84[v86[1792 -(1100 + 690)]]=v84[v86[2 + 0 + 1]] * v84[v86[4 + 0]];end elseif ((4389>=(2607 -(889 + 104 + 12))) and (v87<=(38 + 0))) then if ((v87<=(22 + 13)) or ((7370 -3053)==(4476 -(363 + 924)))) then if ((v87<=(478 -(329 + 116))) or (1322<(3045 -1930))) then v84[v86[2]]=v28(v79[v86[833 -(264 + (1132 -(484 + 82)))]],nil,v36);elseif ((v87==(10 + 24)) or (720>(4732 -1501))) then local v211=0 -0;local v212;local v213;local v214;local v215;while true do if (((2213 -(174 + (2511 -(1055 + 236))))<=(2389 -(50 + 238))) and (v211==(0 -(1485 -(661 + 824))))) then v212=0 + 0;v213=nil;v211=1 + 0;end if ((v211==1) or ((4675 -1795)<=((3195 -(1040 + 118)) -(6 + 436)))) then local v244=0 -(0 + 0);while true do if ((246==(1307 -(939 + 122))) and (v244==(0 -0))) then v214=nil;v215=nil;v244=1;end if ((v244==(1 + 0)) or ((4075 -(96 + 117))>4490)) then v211=(2667 -1845) -(584 + (691 -455));break;end end end if ((v211==(2 + 0)) or ((4923 -(241 + 205))<=1519)) then while true do if ((v212==(1219 -(338 + 881))) or ((1007 -571)>4109)) then local v279=0 -0;while true do if ((v279==(4 -3)) or ((1289 -(276 + 136))<=(313 + 71))) then v212=2 -1;break;end if ((((1241 + 256) -(69 + 25))>=709) and (v279==(534 -(133 + 401)))) then local v309=963 -(810 + 153);while true do if ((v309==(991 -(218 + 772))) or (3356<=(1732 -(169 + 1367)))) then v279=1;break;end if (((691 + 1900)>=(1053 -662)) and (v309==(127 -(67 + 60)))) then v213=v86[4 -2];v214=v84[v213];v309=1 + 0;end end end end end if ((v212==1) or (2691>(1327 + 2161))) then v215=v84[v213 + ((1 + 2) -(1502 -(1016 + 485)))];if (((359 + 985)==(2438 -(546 + 548))) and (v215>(25 -(23 + 2)))) then if ((v214>v84[v213 + ((121 + 171) -(171 + 120))]) or ((4561 -1482)<(2849 + 13))) then v66=v86[1073 -(445 + 625)];else v84[v213 + 3]=v214;end elseif ((3682>(3413 -(602 + 467))) and (v214<v84[v213 + 1])) then v66=v86[10 -(7 + 0)];else v84[v213 + 3]=v214;end break;end end break;end end elseif ((v84[v86[(1865 -(1408 + 451)) -4]]==v86[8 -4]) or (409>(5083 -(41 + 1745)))) then v66=v66 + (1 -0);else v66=v86[9 -6];end elseif ((3822>=2315) and (v87<=36)) then local v149=0;local v150;local v151;local v152;local v153;local v154;local v155;while true do if (((2186 -(160 + 1185))<(2845 -(804 + 339))) and (v149==(1 + 2))) then while true do if ((910<=1514) and (v150==((4 -2) + (3 -2)))) then if (v155 or ((3881 -1658)>=(5309 -1924))) then local v280=1677 -(1002 + 675);local v281;while true do if ((v280==(726 -(359 + (722 -(207 + 148))))) or ((694 + 2549)==(938 + 1109))) then v281=0;while true do if ((v281==(1228 -(953 + 275))) or ((7924 -(13139 -9331))>=((8391 -(1565 + 294)) -1961))) then v84[v153]=v155;v66=v86[3];break;end end break;end end else v66=v66 + 1 + 0;end break;end if (((2301 + 68)<=(3567 -(346 + 260))) and (v150==1)) then v153=v151 + (5 -3);v154={v84[v151](v84[v151 + (1664 -(396 + 1267))],v84[v153])};v150=2 -0;end if ((v150==(0 + 0)) or ((9763 -6725)<(612 + 92 + 442))) then local v253=0 + 0;while true do if ((((5302 -2418) + 553)<=(850 + 3055)) and (v253==(1936 -(910 + 1025)))) then v150=1451 -(589 + 40 + 821);break;end if ((v253==0) or (2099<(1399 -((868 -603) + 1100)))) then v151=v86[2];v152=v86[1 + 3];v253=1761 -(932 + 828);end end end if ((v150==(2 + 0)) or ((23 + 403 + 4525)<=(6368 -4744))) then local v254=0 -0;while true do if ((v254==(2 -1)) or (2729==(2223 -(1359 + 69)))) then v150=1 + 2;break;end if (((0 -0)==v254) or ((335 + 1077 + 295)==4647)) then for v296=1543 -(908 + 634),v152 do v84[v153 + v296]=v154[v296];end v155=v154[(1 + 0) -0];v254=1;end end end end break;end if ((v149==(1 + 0)) or ((4216 + 546)<=(2735 -1008))) then v152=nil;v153=nil;v149=1752 -((4379 -2969) + 340);end if ((380<=(7302 -3694)) and (v149==(3 -1))) then v154=nil;v155=nil;v149=(78 -(34 + 41)) -0;end if (((0 + 0)==v149) or (((8861 -(1517 + 278)) -3219)<=(154 + 601))) then v150=479 -(43 + 436);v151=nil;v149=1 + 0;end end elseif ((v87>37) or ((1583 + 2926)<=(3315 -1725))) then if (((5794 -2293)>(3361 -(144 + 38 + 1177))) and  not v84[v86[2 + 0]]) then v66=v66 + (2 -1);else v66=v86[1368 -(36 + 1329)];end else local v216=0;local v217;local v218;local v219;while true do if (((3281 -(287 + 83 + 341))>=(230 + 76)) and (v216==(1 -0))) then v219=nil;while true do if ((v217==(1 + 0)) or ((1118 -(124 + 156))>=(18674 -14721))) then for v289=1 + 0, #v83 do local v290=0 + (0 -0);local v291;local v292;local v293;while true do if (((2185 + 802)==(3213 -(173 + 53))) and (v290==(125 -(103 + 22)))) then v291=815 -(424 + 391);v292=nil;v290=1 + 0;end if (((752 -((1425 -(214 + 854)) + 252))<=(5016 -(212 + 336))) and (v290==(1 -0))) then v293=nil;while true do if ((3154>=(996 -(271 + 126))) and (v291==(0 -0))) then local v328=1239 -(1237 + 2);while true do if ((v328==(0 -0)) or ((22 + 0)>(139 + (1700 -(21 + 157))))) then v292=0 -0;v293=nil;v328=1;end if (((254 + 2543)<(11397 -7384)) and (v328==1)) then v291=1 + 0;break;end end end if (((4235 -(189 + 320))==((7052 -3684) + 358)) and (v291==(1 + 0 + 0))) then while true do if ((2052<(3044 -(297 + 516))) and ((0 + 0)==v292)) then v293=v83[v289];for v332=0, #v293 do local v333=0 + 0;local v334;local v335;local v336;while true do if ((v333==(0 -0)) or ((1088 -(20 + 25))<(1872 -(398 + 378 + 163)))) then local v337=1023 -(649 + 374);while true do if ((((1727 -(739 + 657)) + 1204)<=4533) and (v337==(1 + 0))) then v333=1;break;end if ((3879>=(6854 -4271)) and (v337==(132 -(79 + 53)))) then v334=v293[v332];v335=v334[3 -2];v337=(141 -69) -(58 + 13);end end end if ((v333==(1 -0)) or ((6388 -(1467 + 372))==(2703 + (2329 -(116 + 900))))) then v336=v334[(303 + 103) -(268 + 136)];if (((v335==v84) and (v336>=v218)) or (4327<(4532 -2431))) then local v338=0 + 0;while true do if ((v338==(902 -(840 + 62))) or ((10771 -7311)==(7730 -3877))) then v219[v336]=v335[v336];v334[1]=v219;break;end end end break;end end end break;end end break;end end break;end end end break;end if ((v217==0) or ((4459 -(230 + 128 + 29))<(7603 -4920))) then local v282=0 + 0;local v283;while true do if ((v282==(0 -0)) or ((1896 + (3024 -1022))<=(2359 -(860 + (2366 -(959 + 915)))))) then v283=0 -0;while true do if ((v283==(0 + 0)) or ((4309 -(838 + 290))<=((4635 -(1150 + 245)) -1598))) then v218=v86[170 -(130 + 38)];v219={};v283=1;end if ((v283==(2 -1)) or ((2069 -(102 + 172))>=(1628 + 332 + 570))) then v217=574 -(139 + 434);break;end end break;end end end end break;end if ((v216==(0 + 0)) or ((1886 -1295)<=(1396 -(625 + 194)))) then v217=0 + 0;v218=nil;v216=892 -(50 + 841);end end end elseif ((((2632 + 148) -(650 + (2419 -1802)))<(966 + 1446)) and (v87<=(1388 -(513 + 834)))) then if ((v87<=(140 -101)) or ((2981 -(621 + 478))<=(1971 -596))) then v84[v86[3 -1]]();elseif ((v87==(1109 -(725 + 344))) or ((318 + 1592)<(474 -337))) then v36[v86[4 -1]]=v84[v86[2]];else v84[v86[3 -1]][v86[3 + 0]]=v86[4];end elseif (((3718 -(568 + 654))<=(13705 -9459)) and (v87<=(107 -65))) then v84[v86[1 + 1]]=v84[v86[727 -(260 + 464)]] -v86[13 -9];elseif (((4175 -((718 -151) + 81))>(6374 -5043)) and (v87==(1670 -(1428 + 199)))) then v84[v86[1 + 1]]=v86[3];else local v223=1046 -(379 + 667);local v224;local v225;local v226;local v227;while true do if ((v223==(2 + 0)) or ((4317 -(265 + 325))==(3193 + 1482))) then while true do if (((855 + 2831)<4955) and (v224==(1 + 0))) then v227=nil;while true do if ((v225==(1723 -(1142 + 581))) or ((6769 -(1724 + 109))<=1627)) then local v310=0 + 0 + 0;while true do if ((3424<=(1415 + 2868)) and (v310==(1306 -(589 + 717)))) then local v324=0 + (336 -(277 + 59));while true do if ((v324==(1 + 0)) or ((211 + 3721)==(3022 + 1737))) then v310=1 -0;break;end if (((3097 -(985 + 529 + 85))<2339) and (v324==(1319 -(789 + 530)))) then v226=v86[5 -2];v227=v84[v226];v324=1 + 0 + 0;end end end if (((68 + 105 + 3106)<(13581 -8993)) and (v310==1)) then v225=4 -3;break;end end end if ((v225==(750 -(433 + 316))) or ((3864 -(90 + 526))<(217 -149))) then for v319=v226 + (3 -2),v86[10 -6] do v227=v227   .. v84[v319];end v84[v86[4 -2]]=v227;break;end end break;end if ((v224==((47 + 1186) -(426 + 807))) or (((13984 + 2492) -11500)<=(944 + 2671))) then v225=0 + 0;v226=nil;v224=353 -((1322 -(70 + 1063)) + 163);end end break;end if ((v223==(1 + 0)) or (((1921 + 760) -922)>(5475 -(1097 + 795)))) then v226=nil;v227=nil;v223=2 + 0;end if ((v223==(1544 -(466 + 1078))) or ((2318 -(1562 + 297))==(183 + 99))) then v224=0 + 0;v225=nil;v223=(2 + 0) -(1 -0);end end end v66=v66 + 1;break;end end break;end end break;end if (((1540 -(1393 + 147))==v90) or ((1307 -(661 + (530 -264)))>=2156)) then v91=0;v92=nil;v90=2 -(1 -0);end end end end A,B=v26(v10(v70));if  not A[1] then local v88=v34[4][v66] or "?";error("Script error at ["   .. v88   .. "]:"   .. A[2]);else return v12(A,2,B);end end;end return v28(v27(),{},v16)();end v14("LOL!393O00028O00027O0040026O000840026O001040026O00F03F2O033O004B657903043O005465787403073O0064656372797074034D3O005F4B455957484954454C4953544E4F504153574F5244594F5557492O4C4E455645524755452O53544849534953544F414E4F492O594F554F4D474A532O44484A532O48534A44484A5344484A5F03013O0061030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403483O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4D756858642F442O6F7253752O662F6D61696E2F57686974656C6973742F53797374656D333203083O00746F737472696E67026O00184003053O007072696E7403103O005249474854204B45592053415645442103063O00737472696E6703073O0044657374726F7903093O004E6F2077696E646F7703043O00613O4303093O004E657742752O746F6E03093O0057686974656C697374032A3O0050757420796F7572204B657920696E207468652054657874626F78205468656E20436C69636B206D652103083O004E65774C6162656C032A3O004A6F696E206D7920446973636F726420676F20746F205468652043686174206765742D6E65772D6B657903093O004372656174654C696203093O0057686974654C69737403073O0053796E6170736503063O004E6577546162030A3O004E657753656374696F6E03103O004B657920456E74657265643A206E696C030A3O004E657754657874426F7803133O0050757420546865206B657920496E2068657265031A3O005072652O7320456E746572206F6E20546865204B657920426974030F3O004A6F696E206D7920446973636F7264031E3O004A6F696E206D7920446973636F726420746F2067657420746865204B657903043O007461736B03043O007761697403063O00697366696C6503093O00777269746566696C6503093O004E6F6B6579436F6465030B3O00446973636F72644C696E6B034B3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4D756858642F442O6F7253752O662F6D61696E2F57686974656C6973742F446973636F72644C696E6B030A3O0044657374726F794C6962026O00144003083O0047657453706C697403043O00536C697003493O00682O7470733A2O2F6769746875622E636F6D2F4D756858642F442O6F7253752O662F626C6F622F6D61696E2F57686974656C6973742F4C69624D6F64696665643F7261773D7472756503043O007465787403083O006D616B65636F646503073O004B65792E74787403013O002F03083O006973666F6C646572030A3O006D616B65666F6C64657203083O007265616466696C650054012O00122B3O00014O000C000100093O0026233O000600010002002O043O000600012O000C000500063O00122B3O00033O0026233O000A00010003002O043O000A00012O000C000700083O00122B3O00043O0026233O00482O010004002O043O00482O012O000C000900093O0026230001002E00010002002O043O002E000100122B000A00013O002623000A001400010002002O043O0014000100122B000100033O002O043O002E0001002623000A001E00010005002O043O001E0001001210000B00073O00122B000C00083O00122B000D00093O001210000E000A4O0003000B000E0002001228000B00063O00122B000300063O00122B000A00023O000E01000100100001000A002O043O00100001001210000B000B3O001210000C000C3O002006000C000C000D00122B000E000E4O000D000C000E4O0012000B3O00022O0019000B00010002001228000B000A3O001210000B000F3O001210000C000A4O0005000B00020002001228000B000A3O00122B000A00053O002O043O00100001002623000100D100010010002O043O00D10001001210000A00063O000618000900530001000A002O043O0053000100122B000A00014O000C000B000B3O002623000A003500010001002O043O0035000100122B000B00013O002623000B004700010001002O043O0047000100122B000C00013O000E01000100420001000C002O043O00420001001210000D00113O00122B000E00126O000D00020001001228000900133O00122B000C00053O002623000C003B00010005002O043O003B000100122B000B00053O002O043O00470001002O043O003B0001002623000B003800010005002O043O00380001001210000C00143O00122B000D00156O000C00020001001210000C00063O001228000C00163O002O043O00C90001002O043O00380001002O043O00C90001002O043O00350001002O043O00C9000100122B000A00014O000C000B00133O000E010001005A0001000A002O043O005A000100122B000B00014O000C000C000C3O00122B000A00053O002623000A005E00010002002O043O005E00012O000C000F00103O00122B000A00033O002623000A006200010003002O043O006200012O000C001100123O00122B000A00043O002623000A00C300010004002O043O00C300012O000C001300133O002623000B007B00010003002O043O007B000100122B001400013O0026230014007600010001002O043O007600010020060015000E001700122B001700183O00122B001800193O00061700193O000100012O00083O00104O00030015001900022O0008001100153O0020060015000E001A00122B0017001B4O00030015001700022O0008001200153O00122B001400053O0026230014006800010005002O043O0068000100122B000B00043O002O043O007B0001002O043O00680001002623000B008F00010001002O043O008F000100122B001400013O0026230014008A00010001002O043O008A000100201300150002001C00122B0016001D3O00122B0017001E4O00030015001700022O0008000C00153O0020060015000C001F00122B0017001D4O00030015001700022O0008000D00153O00122B001400053O0026230014007E00010005002O043O007E000100122B000B00053O002O043O008F0001002O043O007E0001002623000B00A200010005002O043O00A2000100122B001400013O0026230014009D00010001002O043O009D00010020060015000D002000122B0017001D4O00030015001700022O0008000E00153O0020060015000E001A00122B001700214O00030015001700022O0008000F00153O00122B001400053O0026230014009200010005002O043O0092000100122B000B00023O002O043O00A20001002O043O00920001002623000B00B700010002002O043O00B7000100122B001400013O002623001400A900010005002O043O00A9000100122B000B00033O002O043O00B70001002623001400A500010001002O043O00A500010020060015000E002200122B001700063O00122B001800233O00061700190001000100012O00083O000F4O001D0015001900010020060015000E001A00122B001700244O00030015001700022O0008001000153O00122B001400053O002O043O00A50001002623000B006500010004002O043O006500010020060014000E001700122B001600253O00122B001700263O00061700180002000100012O00083O00124O00030014001800022O0008001300143O002O043O00C80001002O043O00650001002O043O00C80001002623000A005500010005002O043O005500012O000C000D000E3O00122B000A00023O002O043O005500012O0025000A5O001210000A00273O002013000A000A00282O0027000A00010001001210000A00163O001210000B00063O000618000A00C90001000B002O043O00C90001002O043O00522O01002623000100E800010004002O043O00E80001001210000A00294O0008000B00064O0005000A000200022O00080007000A3O000626000700DD00010001002O043O00DD0001001210000A002A4O0008000B00063O00122B000C002B4O001D000A000C0001001210000A000B3O001210000B000C3O002006000B000B000D00122B000D002D4O000D000B000D4O0012000A3O00022O0019000A00010002001228000A002C3O000221000A00033O001228000A002E3O00122B0001002F3O002623000100FE00010001002O043O00FE000100122B000A00013O002623000A00F200010005002O043O00F20001000221000B00043O001228000B00303O000221000B00053O001228000B00313O00122B000A00023O002623000A00F600010002002O043O00F6000100122B000100053O002O043O00FE0001002623000A00EB00010001002O043O00EB0001000221000B00063O001228000B00303O000221000B00073O001228000B00313O00122B000A00053O002O043O00EB00010026230001001A2O010005002O043O001A2O0100122B000A00013O002623000A00052O010002002O043O00052O0100122B000100023O002O043O001A2O01000E01000500122O01000A002O043O00122O01000221000B00083O001228000B00073O001210000B000B3O001210000C000C3O002006000C000C000D00122B000E00324O000D000C000E4O0012000B3O00022O0019000B000100022O00080002000B3O00122B000A00023O002623000A003O010001002O043O003O01000221000B00093O001228000B00333O000221000B000A3O001228000B00343O00122B000A00053O002O043O003O01002623000100362O010003002O043O00362O0100122B000A00013O002623000A00252O010005002O043O00252O0100122B000500354O0008000B00033O00122B000C00364O0008000D00054O002C0006000B000D00122B000A00023O002623000A00292O010002002O043O00292O0100122B000100043O002O043O00362O01002623000A001D2O010001002O043O001D2O01001210000B00374O0008000C00034O0005000B000200022O00080004000B3O000626000400342O010001002O043O00342O01001210000B00384O0008000C00036O000B0002000100122B000A00053O002O043O001D2O010026230001000D0001002F002O043O000D0001001210000A002E4O0027000A00010001000617000A000B000100012O00083O00063O001228000A00143O001210000A00394O0008000B00064O0005000A000200022O00080008000A3O001210000A000F4O0008000B00084O0005000A000200022O00080009000A3O00122B000100103O002O043O000D0001002O043O00522O010026233O004D2O010001002O043O004D2O0100122B000100014O000C000200023O00122B3O00053O0026233O000200010005002O043O000200012O000C000300043O00122B3O00023O002O043O000200012O00258O00153O00013O000C3O000C3O00028O0003063O00737472696E672O033O004B657903073O0044657374726F79031A3O0057696E646F77204F722057686174657665722055444844534A4403043O00613O43030B3O005570646174654C6162656C03093O0057726F6E67204B6579026O00F03F03043O0077616974026O001440031A3O005072652O7320456E746572206F6E20546865204B65792042697400223O00122B3O00013O0026233O001600010001002O043O00160001001210000100023O001210000200033O0006180001001100010002002O043O0011000100122B000100013O0026230001000800010001002O043O00080001001210000200043O00122B000300056O000200020001001210000200033O001228000200063O002O043O00110001002O043O000800012O001E00015O00200600010001000700122B000300084O001D00010003000100122B3O00093O0026233O000100010009002O043O000100010012100001000A3O00122B0002000B6O0001000200012O001E00015O00200600010001000700122B0003000C4O001D000100030001002O043O00210001002O043O000100012O00153O00017O00223O006F3O00713O00713O00723O00723O00723O00723O00733O00753O00753O00763O00763O00763O00773O00773O00783O00793O007C3O007C3O007C3O007C3O007D3O007F3O007F3O00803O00803O00803O00813O00813O00813O00813O00823O00833O00853O00053O00028O0003063O00737472696E6703083O00746F737472696E67030B3O005570646174654C6162656C030D3O004B657920456E74657265643A2001163O00122B000100014O000C000200023O0026230001000200010001002O043O0002000100122B000200013O0026230002000500010001002O043O00050001001210000300034O000800046O0005000300020002001228000300024O001E00035O00200600030003000400122B000500053O001210000600024O002C0005000500062O001D000300050001002O043O00150001002O043O00050001002O043O00150001002O043O000200012O00153O00017O00163O00B43O00B53O00B73O00B73O00B83O00BA3O00BA3O00BB3O00BB3O00BB3O00BB3O00BC3O00BC3O00BC3O00BC3O00BC3O00BC3O00BD3O00BE3O00C03O00C13O00C33O00053O00028O00030B3O005570646174654C6162656C03193O00476F20746F20682O7470733A2O2F646973636F72642E2O672F030B3O00446973636F72644C696E6B03053O007063612O6C000F3O00122B3O00013O000E010001000100013O002O043O000100012O001E00015O00200600010001000200122B000300033O001210000400044O002C0003000300042O001D000100030001001210000100053O00022100028O000100020001002O043O000E0001002O043O000100012O00153O00013O00013O00043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403533O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F4D756858642F442O6F7253752O662F6D61696E2F57686974656C6973742F53656E64253230746F253230446973636F726400083O0012103O00013O001210000100023O00200600010001000300122B000300044O000D000100034O00125O00022O00273O000100012O00153O00017O00083O00D03O00D03O00D03O00D03O00D03O00D03O00D03O00D13O000F3O00CB3O00CD3O00CD3O00CE3O00CE3O00CE3O00CE3O00CE3O00CE3O00CF3O00D13O00CF3O00D23O00D33O00D53O000B3O00028O0003013O004103053O00706169727303043O0067616D6503073O00436F7265477569030B3O004765744368696C6472656E2O033O0049734103093O005363722O656E47756903043O004E616D65030C3O004C696257686974656C69737403073O0044657374726F79002E3O00122B3O00014O000C000100013O0026233O000200010001002O043O0002000100122B000100013O0026230001000500010001002O043O000500012O001B00025O001228000200023O001210000200033O001210000300043O0020130003000300050020060003000300062O0009000300044O001400023O0004002O043O0027000100200600070006000700122B000900084O00030007000900020006020007002700013O002O043O00270001002013000700060009002623000700270001000A002O043O0027000100122B000700014O000C000800083O0026230007001A00010001002O043O001A000100122B000800013O0026230008001D00010001002O043O001D000100200600090006000B4O0009000200012O001B000900013O001228000900023O002O043O00270001002O043O001D0001002O043O00270001002O043O001A00010006240002001000010002002O043O00100001002O043O002D0001002O043O00050001002O043O002D0001002O043O000200012O00153O00017O002E3O00EE3O00EF3O00F13O00F13O00F23O00F43O00F43O00F53O00F53O00F63O00F63O00F63O00F63O00F63O00F63O00F63O00F73O00F73O00F73O00F73O00F73O00F73O00F73O00F73O00F83O00F93O00FB3O00FB3O00FC3O00FE3O00FE3O00FF3O00FF4O00013O00012O002O012O0002012O0004012O0005012O00F63O0007012O0009012O000A012O000C012O000D012O000F012O00023O0003043O0066696E6403013O002F01053O00200600013O000100122B000300024O000F000100034O000E00016O00153O00017O00053O0017012O0017012O0017012O0017012O0018012O000A3O00028O00026O00F03F027O004003053O00536C69707403063O00737472696E6703053O0073706C697403013O0061034O0003083O00746F737472696E6703053O00706169727302413O00122B000200014O000C000300033O0026230002000200010001002O043O0002000100122B000300013O0026230003001800010002002O043O0018000100122B000400013O0026230004000C00010002002O043O000C000100122B000300033O002O043O001800010026230004000800010001002O043O00080001001210000500053O0020130005000500062O000800066O0008000700014O0003000500070002001228000500043O00122B000500083O001228000500073O00122B000400023O002O043O00080001000E010001002B00010003002O043O002B000100122B000400013O000E010001002600010004002O043O00260001001210000500094O000800066O00050005000200022O00083O00053O001210000500094O0008000600014O00050005000200022O0008000100053O00122B000400023O000E010002001B00010004002O043O001B000100122B000300023O002O043O002B0001002O043O001B0001000E010003000500010003002O043O0005000100122B000400013O0026230004002E00010001002O043O002E00010012100005000A3O001210000600044O000A000500020007002O043O00380001001210000A00074O0008000B00094O002C000A000A000B001228000A00073O0006240005003400010002002O043O00340001001210000500074O000B000500023O002O043O002E0001002O043O00050001002O043O00400001002O043O000200012O00153O00017O00413O001A012O001B012O001D012O001D012O001E012O0020012O0020012O0021012O0023012O0023012O0024012O0025012O0027012O0027012O0028012O0028012O0028012O0028012O0028012O0028012O0029012O0029012O002A012O002B012O002E012O002E012O002F012O0031012O0031012O0032012O0032012O0032012O0032012O0033012O0033012O0033012O0033012O0034012O0036012O0036012O0037012O0038012O0039012O003C012O003C012O003D012O003F012O003F012O0040012O0040012O0040012O0040012O0041012O0041012O0041012O0041012O0040012O0041012O0043012O0043012O0044012O0046012O0048012O0049012O004B012O00023O0003043O0066696E6403013O002F01053O00200600013O000100122B000300024O000F000100034O000E00016O00153O00017O00053O0054012O0054012O0054012O0054012O0055012O000A3O00028O00026O00F03F027O004003053O00706169727303053O00536C69707403013O006103063O00737472696E6703053O0073706C6974034O0003083O00746F737472696E67023F3O00122B000200013O00122B000300013O0026230003001300010002002O043O00130001000E010003000100010002002O043O00010001001210000400043O001210000500054O000A000400020006002O043O000E0001001210000900064O0008000A00084O002C00090009000A001228000900063O0006240004000A00010002002O043O000A0001001210000400064O000B000400023O002O043O000100010026230003000200010001002O043O000200010026230002002800010002002O043O0028000100122B000400013O000E010002001C00010004002O043O001C000100122B000200033O002O043O002800010026230004001800010001002O043O00180001001210000500073O0020130005000500082O000800066O0008000700014O0003000500070002001228000500053O00122B000500093O001228000500063O00122B000400023O002O043O001800010026230002003B00010001002O043O003B000100122B000400013O0026230004002F00010002002O043O002F000100122B000200023O002O043O003B00010026230004002B00010001002O043O002B00010012100005000A4O000800066O00050005000200022O00083O00053O0012100005000A4O0008000600014O00050005000200022O0008000100053O00122B000400023O002O043O002B000100122B000300023O002O043O00020001002O043O000100012O00153O00017O003F3O0057012O0059012O005B012O005B012O005C012O005C012O005D012O005D012O005D012O005D012O005E012O005E012O005E012O005E012O005D012O005E012O0060012O0060012O0062012O0064012O0064012O0065012O0065012O0066012O0068012O0068012O0069012O006A012O006C012O006C012O006D012O006D012O006D012O006D012O006D012O006D012O006E012O006E012O006F012O0070012O0073012O0073012O0074012O0076012O0076012O0077012O0078012O007A012O007A012O007B012O007B012O007B012O007B012O007C012O007C012O007C012O007C012O007D012O007E012O0081012O0082012O0083012O0085012O00123O00028O00034O00026O00F03F026O00144003063O00737472696E6703043O006279746503083O00746F6E756D62657203073O00656E63727970742O033O006C656E03053O004C424F5A4F2O033O00737562030B3O004C424F5A4F2F4C424F5A4F03073O0064656372797074027O004003083O0047657453706C69740003043O006368617203043O00536C6970039B3O00122B000300014O000C000400043O0026230003001300010001002O043O0013000100122B000400023O00122B000500033O00122B000600043O00122B000700033O0004220005001200012O0008000900043O001210000A00053O002013000A000A00062O0008000B00014O0008000C00084O0008000D00084O0003000A000D00022O002C00040009000A00041100050009000100122B000300033O0026230003000200010003002O043O00020001001210000500074O0008000600044O00050005000200022O0008000400053O0026233O004900010008002O043O0049000100122B000500014O000C000600073O000E010003004200010005002O043O0042000100122B000800013O0026230008002000010001002O043O00200001000E010003002500010006002O043O002500012O000B000700023O0026230006001F00010001002O043O001F000100122B000700023O00122B000900033O001210000A00053O002013000A000A00092O0008000B00024O0005000A0002000200122B000B00033O0004220009003D000100122B000D000A4O0008000E00073O00122B000F000A3O001210001000053O00201300100010000600200600110002000B2O00080013000C4O00080014000C4O000D001100144O001200103O00022O002000100010000400122B0011000C4O002C0007000D00110004110009002F000100122B000600033O002O043O001F0001002O043O00200001002O043O001F0001002O043O009A00010026230005001D00010001002O043O001D000100122B000600014O000C000700073O00122B000500033O002O043O001D0001002O043O009A00010026233O009A0001000D002O043O009A000100122B000500014O000C000600073O002623000500500001000E002O043O005000012O000B000600023O0026230005008E00010003002O043O008E00012O0008000700023O00122B000800033O001210000900053O0020130009000900092O0008000A00024O000500090002000200122B000A00033O0004220008008D000100122B000C00014O000C000D000E3O002623000C005C00010001002O043O005C0001001210000F000F4O0008001000074O000A000F000200102O0008000E00104O0008000D000F3O002616000D008C00010010002O043O008C000100122B000F00014O000C001000103O002623000F007000010003002O043O007000012O0008001100063O001210001200053O0020130012001200112O0008001300104O00050012000200022O002C000600110012002O043O008C0001000E01000100670001000F002O043O0067000100122B001100013O000E010001008400010011002O043O00840001001210001200073O00200600130007000B00122B001500033O001210001600074O00080017000D4O000500160002000200202A0016001600032O000D001300164O001200123O00022O001F00100012000400200600120007000B00201C0014000D00032O00030012001400022O0008000700123O00122B001100033O0026230011007300010003002O043O0073000100122B000F00033O002O043O00670001002O043O00730001002O043O00670001002O043O008C0001002O043O005C00010004110008005A000100122B0005000E3O0026230005004D00010001002O043O004D000100122B000600023O001210000800124O0008000900023O00122B000A000A4O00030008000A00022O0008000200083O00122B000500033O002O043O004D0001002O043O009A0001002O043O000200012O00153O00017O009B3O0093012O0094012O0096012O0096012O0097012O0098012O0098012O0098012O0098012O0099012O0099012O0099012O0099012O0099012O0099012O0099012O0099012O0098012O009B012O009D012O009D012O009E012O009E012O009E012O009E012O009F012O009F012O00A0012O00A1012O00A4012O00A4012O00A6012O00A8012O00A8012O00A9012O00A9012O00AA012O00AC012O00AC012O00AD012O00AE012O00AE012O00AE012O00AE012O00AE012O00AE012O00AE012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AF012O00AE012O00B1012O00B3012O00B4012O00B5012O00B7012O00B9012O00B9012O00BA012O00BB012O00BC012O00BD012O00BE012O00BF012O00BF012O00C0012O00C1012O00C4012O00C4012O00C5012O00C7012O00C7012O00C8012O00C9012O00C9012O00C9012O00C9012O00C9012O00C9012O00C9012O00CA012O00CB012O00CE012O00CE012O00CF012O00CF012O00CF012O00CF012O00CF012O00D0012O00D0012O00D1012O00D2012O00D4012O00D4012O00D5012O00D5012O00D5012O00D5012O00D5012O00D5012O00D6012O00D8012O00D8012O00D9012O00DB012O00DB012O00DC012O00DC012O00DC012O00DC012O00DC012O00DC012O00DC012O00DC012O00DC012O00DC012O00DD012O00DD012O00DD012O00DD012O00DE012O00E0012O00E0012O00E1012O00E2012O00E3012O00E5012O00E8012O00E9012O00C9012O00EC012O00EE012O00EE012O00EF012O00F0012O00F0012O00F0012O00F0012O00F0012O00F1012O00F2012O00F5012O00F6012O00F8012O00093O00028O00026O00F03F034O0003063O00737472696E6703043O006368617203043O006D61746803063O0072616E646F6D2O033O004D696E2O033O004D617802283O00122B000200014O000C000300043O0026230002002100010002002O043O0021000100122B000500013O0026230005000500010001002O043O000500010026230003001A00010001002O043O001A000100122B000400033O00122B000600024O000800075O00122B000800023O0004220006001900012O0008000A00043O001210000B00043O002013000B000B0005001210000C00063O002013000C000C0007002013000D00010008002013000E000100092O000D000C000E4O0012000B3O00022O002C0004000A000B0004110006000E000100122B000300023O0026230003000400010002002O043O000400012O000B000400023O002O043O00040001002O043O00050001002O043O00040001002O043O002700010026230002000200010001002O043O0002000100122B000300014O000C000400043O00122B000200023O002O043O000200012O00153O00017O00283O00FE012O00FF012O002O022O002O022O0004022O0006022O0006022O0007022O0007022O0008022O0009022O0009022O0009022O0009022O000A022O000A022O000A022O000A022O000A022O000A022O000A022O000A022O000A022O000A022O0009022O000C022O000E022O000E022O000F022O0011022O0012022O0013022O0015022O0017022O0017022O0018022O0019022O001A022O001B022O001D022O00063O0003043O0074657874026O0014402O033O004D696E026O0049402O033O004D6178025O0080514000083O0012103O00013O00122B000100024O000700023O00020030290002000300040030290002000500062O000F3O00024O000E8O00153O00017O00083O001F022O001F022O001F022O001F022O001F022O001F022O001F022O0020022O00053O00028O0003093O00777269746566696C6503063O00737472696E6703093O004E6F2077696E646F77030A3O0044657374726F794C696201143O00122B000100014O000C000200023O0026230001000200010001002O043O0002000100122B000200013O0026230002000500010001002O043O00050001001210000300024O001E00045O001210000500034O001D0003000500010026163O001300010004002O043O00130001001210000300054O0027000300010001002O043O00130001002O043O00050001002O043O00130001002O043O000200012O00153O00017O00143O003D022O003E022O0040022O0040022O0041022O0043022O0043022O0044022O0044022O0044022O0044022O0045022O0045022O0046022O0046022O0048022O0049022O004B022O004C022O004E022O0054012O00023O00033O000D3O000D3O000E3O00103O00123O00123O00133O00153O00173O00173O00183O001A3O001A3O001B3O001D3O001D3O001E3O001F3O00213O00213O00223O00223O00223O00223O00223O00223O00233O00243O00263O00263O00273O00273O00273O00273O00273O00273O00273O00273O00283O00283O00283O00283O00293O002A3O002D3O002D3O002E3O002E3O002E3O002F3O00303O00323O00323O00333O00353O00353O00363O00383O00383O00393O00393O00393O003A3O003B3O003D3O003D3O003E3O003F3O00403O00433O00433O00443O00443O00443O00453O00453O00463O00473O00493O004A3O004B3O004D3O004E3O00583O00583O00593O005A3O005B3O005D3O005D3O005E3O00603O00623O00623O00633O00653O00673O00673O00683O006A3O006A3O006B3O006D3O006D3O006E3O006E3O006E3O00853O00853O006E3O00853O00863O00863O00863O00863O00873O00893O00893O008A3O008B3O008C3O008F3O008F3O00903O00923O00923O00933O00933O00933O00933O00933O00943O00943O00943O00943O00953O00973O00973O00983O00993O009A3O009D3O009D3O009E3O00A03O00A03O00A13O00A13O00A13O00A13O00A23O00A23O00A23O00A23O00A33O00A53O00A53O00A63O00A73O00A83O00AB3O00AB3O00AC3O00AE3O00AE3O00AF3O00B03O00B23O00B23O00B33O00B33O00B33O00C33O00C33O00B33O00C43O00C43O00C43O00C43O00C53O00C63O00C93O00C93O00CA3O00CA3O00CA3O00D53O00D53O00CA3O00D53O00D63O00D73O00D93O00DB3O00DB3O00DC3O00DE3O00DF3O00E03O00E33O00E33O00E33O00E43O00E43O00E43O00E43O00E53O00E73O00E73O00E83O00E83O00E83O00E83O00E93O00E93O00EA3O00EA3O00EA3O00EA3O00EC3O00EC3O00EC3O00EC3O00EC3O00EC3O00EC3O00EC3O000F012O00ED3O0010012O0012012O0012012O0013012O0015012O0015012O0018012O0016012O004B012O0019012O004C012O004E012O004E012O004F012O0050012O0052012O0052012O0055012O0053012O0085012O0056012O0086012O0087012O008A012O008A012O008B012O008D012O008D012O008E012O008F012O0091012O0091012O00F8012O0092012O00F9012O00F9012O00F9012O00F9012O00F9012O00F9012O00F9012O00F9012O00FA012O00FC012O00FC012O001D022O00FD012O0020022O001E022O0021022O0022022O0025022O0025022O0026022O0028022O0028022O0029022O002A022O002A022O002A022O002A022O002B022O002D022O002D022O002E022O002F022O0031022O0031022O0032022O0032022O0032022O0032022O0033022O0033022O0034022O0034022O0034022O0036022O0037022O003A022O003A022O003B022O003B022O004E022O004E022O003C022O004F022O004F022O004F022O004F022O0050022O0050022O0050022O0050022O0051022O0052022O0054022O0056022O0056022O0057022O0058022O0059022O005B022O005B022O005C022O005E022O005F022O0060022O0061022O00",v8());end
]]--
print("Wating to Make a better key system")


-- ========================================

-- source: github.com/Drop56796/nightmare  (nightmare mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/Sprint  (10226 bytes)

-- Gui to Lua


-- Version: 3.2



-- Instances:


local runService = game:GetService("RunService")



local character = game.Players.LocalPlayer.Character


local humanoid = character:WaitForChild("Humanoid")



local StaminaBar = Instance.new("ScreenGui")


local Border = Instance.new("Frame")


local Bar = Instance.new("Frame")


local SideBar = Instance.new("Frame")


local Bar_2 = Instance.new("Frame")



--Properties:



StaminaBar.Name = "StaminaBar"


StaminaBar.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


StaminaBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



Border.Name = "Border"


Border.Parent = StaminaBar


Border.AnchorPoint = Vector2.new(0, 1)


Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


Border.BorderColor3 = Color3.fromRGB(0, 0, 0)


Border.BorderSizePixel = 4


Border.Position = UDim2.new(0.25, 0, 0.85, 0)


Border.Size = UDim2.new(0.6, 0, 0.0263093561, 0)



Bar.Name = "Bar"


Bar.Parent = Border


Bar.AnchorPoint = Vector2.new(0, 1)


Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)


Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)


Bar.BorderSizePixel = 0


Bar.Position = UDim2.new(0, 0, 1, 0)


Bar.Size = UDim2.new(1, 0, 1, 0)



SideBar.Name = "SideBar"


SideBar.Parent = StaminaBar


SideBar.AnchorPoint = Vector2.new(0, 1)


SideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)


SideBar.BorderSizePixel = 4


SideBar.Position = UDim2.new(0.985890269, 0, 1, 0)


SideBar.Size = UDim2.new(0.0141097549, 0, 0.17468825, 0)



Bar_2.Name = "Bar"


Bar_2.Parent = SideBar


Bar_2.AnchorPoint = Vector2.new(0, 1)


Bar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 0)


Bar_2.BorderColor3 = Color3.fromRGB(0, 0, 0)


Bar_2.BorderSizePixel = 0


Bar_2.Position = UDim2.new(0, 0, 1, 0)


Bar_2.Size = UDim2.new(1, 0, 1, 0)


local Started=false


-- Scripts:


local OO = 0


function QCHWWK_fake_script() -- StaminaBar.SprintFire 


	local script = Instance.new('LocalScript', StaminaBar)


	local Bool = Instance.new('NumberValue', script.Parent)


	Bool.Name = "Dissapear"


	--------------------------------------------------------------------------------------------------------------


	script.Parent.Dissapear.Changed:Connect(function(Value)



		for i,v in pairs(script:GetChildren()) do


			v:Destroy()


		end



		local A = Instance.new("Part")


		A.Parent = script


		A.Name="Keep"..tick()..game.JobId..game:GetService("Players").LocalPlayer.Name



		Border.Visible = true


		SideBar.Visible = false


		wait(1)


		if script:FindFirstChild(A.Name) then




			OO=0


			repeat wait(1)


				--if not script:FindFirstChild(A.Name) then


				--Border.Visible = true


				--SideBar.Visible = false


				OO = OO +1


				-- end


			until Value > OO or not script:FindFirstChild(A.Name)




			if script:FindFirstChild(A.Name) then


				Border.Visible = false


				SideBar.Visible = true


			end


		end



	end)




	--------------------------------------------------------------------------------------------------------------


	local Players = game:GetService("Players")


	local RS = game:GetService("RunService")


	local ReSt = game:GetService("ReplicatedStorage")


	local CG = game:GetService("CoreGui")


	local TS = game:GetService("TweenService")


	local Plr = Players.LocalPlayer



	--local ModuleScripts = {


	---	MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),


	--	ModuleEvents = require(ReSt.ClientModules.Module_Events),


	--}


	-- KEYBINDS HERE


	local Camera = workspace.CurrentCamera


	local bind1 = Enum.KeyCode.LeftShift -- This is the keybind this script is set to by default


	local bind2 = Enum.KeyCode.RightShift -- This is the second keybind this script is set to by default



	-- To change the keybind, replace the word after "Enum.Keycode." with your desired keybind




	--------------------------------------------------------------------------------------------------------------




	local player = game.Players.LocalPlayer -- Targets the player


	local char = player.Character or player.CharacterAdded:Wait() -- Finds player's character


	local hrp = char:WaitForChild("HumanoidRootPart") -- Finds character's humanoid root part



	local cam = game.Workspace.CurrentCamera


	local bar = script.Parent.Border.Bar



	--local runSound = hrp:WaitForChild("Running") -- Finds the running sound of the player



	local TS = game:GetService("TweenService")


	local TI = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)




	--------------------------------------------------------------------------------------------------------------




	local FOV1 = {


		FieldOfView = 90 -- FOV change while sprinting, change as desired


	}


	local FOV2 = {


		FieldOfView = 70 -- FOV default value, suggested to keep as is


	}




	--------------------------------------------------------------------------------------------------------------




	local BigFOV = TS:Create(cam, TI, FOV1)


	local SmallFOV = TS:Create(cam, TI, FOV2)




	--------------------------------------------------------------------------------------------------------------




	local stamPower = 100 -- Total stamina points


	local stamTick = 2 -- How much the stamina goes down every tick of holding down the sprint button


	local regenTick = 0.5 -- How much the stamina goes back up every tick of not holding down the sprint button (until it hits stamPower max)






	--------------------------------------------------------------------------------------------------------------




	local sprinting = false


	local DEF = 15

	function sprint(name, IS, context)


		--	ModuleScripts.MainGame.camShaker.ShakeOnce(ModuleScripts.MainGame.camShaker, 5)


		if IS == Enum.UserInputState.Begin then

			if sprinting == false then
				DEF = char.Humanoid.WalkSpeed
			end
			--	runSound.PlaybackSpeed = 4 -- Changes the playback speed that the running sound plays at during sprinting, replace 4 with your desired playback speed if wanted


			script.Parent.Dissapear.Value=999999999999999999999999999999999999999999999999999999999999999999999

			
			Walkspeed2 = DEF+17
			char.Humanoid.WalkSpeed = Walkspeed2
			


			sprinting = true


			while stamPower > 0 and sprinting == true do





				if Started~=true then


					script.Parent.Dissapear.Value=991291291291291291291289129129129129129129129129129129129129129


					BigFOV:Play()


					Started=true



				end



				bar.Size = UDim2.new(stamPower / 100, 0, 1, 0)


				SideBar.Bar.Size = UDim2.new(1, 0, stamPower/100, 0)


				bar.Visible = true


				SideBar.Bar.Visible = true


				stamPower = stamPower - stamTick


				--BigFOV:Play()


				wait()


				if stamPower <= 0 then


					bar.Visible = false


					--	runSound.PlaybackSpeed = 2
					Walkspeed2 = DEF

					char.Humanoid.WalkSpeed = Walkspeed2


					SmallFOV:Play()


					Started=false


					script.Parent.Dissapear.Value=10


					stamPower=0



				end


			end


		elseif IS == Enum.UserInputState.End then



			if stamPower < 1 then


				bar.Visible = false


				SideBar.Bar.Visible = false


			else


				bar.Visible = true


				SideBar.Bar.Visible = true


			end


			--	runSound.PlaybackSpeed = 2 -- Resets the playback speed to its original value, recommended to leave as is

			Walkspeed2 = DEF
				char.Humanoid.WalkSpeed = Walkspeed2 -- Sets player speed to 16 (Roblox game default), if you change your Roblox game's default player speed, replace 16 with the new value


			sprinting = false


			while stamPower <= 100 and sprinting == false do


				stamPower = stamPower + regenTick


				--	bar.Visible = true


				--SideBar.Bar.Visible = true


				if stamPower > 100 then


					stamPower = 100


				end


				-- SideBar.Bar.Visible = false


				if stamPower < 1 then


					bar.Visible = false


					SideBar.Bar.Visible = false


				else


					bar.Visible = true


					SideBar.Bar.Visible = true


				end



				bar.Size = UDim2.new(stamPower / 100, 0, 1, 0)


				SideBar.Bar.Size = UDim2.new(1, 0, stamPower/100, 0)





				--if cam.FieldOfView > 78 and script.Parent.Dissapear.Value ~= 10 then


				--	Fov(70)


				--	end








				if Started~=false then


					Started=false


					SmallFOV:Play()


					script.Parent.Dissapear.Value=10	


				end



				wait()


			end



		end


	end




	--------------------------------------------------------------------------------------------------------------

	char.Changed:Connect(function()
		if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed2 and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= 10 then
			DEF=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			if sprinting == true then
				WalkSpeed2=DEF+17
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = DEF
			end
			
		end
	end)

	function updateBobbleEffect()


		local currentTime = tick()


		if  Started == true then


			if humanoid.MoveDirection.Magnitude > 0  then -- we are walking


				local bobbleY = math.abs(math.sin(currentTime * 10)) * .35


				local bobbleX = math.abs(math.sin(currentTime * 10)) * .05



				local bobble = Vector3.new(bobbleX, bobbleY, 0)



				humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble, .75)





			else -- we are not walking


				humanoid.CameraOffset =humanoid.CameraOffset * 0


			end


		end


	end



	runService.RenderStepped:Connect(updateBobbleEffect)






	local CAS = game:GetService("ContextActionService")



	CAS:BindAction("Sprint", sprint, true, bind1, bind2) -- Binds the keybinds to the sprint function and creates a mobile button for it


	CAS:SetPosition("Sprint", UDim2.new(0.7,0,0,0)) -- Changes the position of the mobile button within the context frame, to read more about how UDim2 positions work, go to https://developer.roblox.com/en-us/api-reference/datatype/UDim2


	CAS:SetTitle("Sprint", "Shift") -- Sets the text on the mobile button, replace Ctrl with any text you desire


end


coroutine.wrap(QCHWWK_fake_script)()


function CJZEISY_fake_script() -- SideBar.LocalScript 


	local script = Instance.new('LocalScript', SideBar)



	script.Parent.Visible = false


end


coroutine.wrap(CJZEISY_fake_script)()





-- ========================================

-- source: github.com/Drop56796/nightmare  (nightmare mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua  (3452 bytes)

-- Additional help: @ActualMasterOogway

-- \\ Services // --

local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")

-- \\ Variables // --

local Module = {}

-- \\ Functions // --

local function timestampToMillis(timestamp: string | number | DateTime): number
    return
        (typeof(timestamp) == "string" and DateTime.fromIsoDate(timestamp).UnixTimestampMillis)
        or (typeof(timestamp) == "number" and timestamp)
        or timestamp.UnixTimestampMillis
end

-- \\ Main // --

Module.Require = function(s: string): any?
    local content = s
    if s:lower():sub(1, 4) == "http" then
        content = game:HttpGet(s)
    elseif isfile(s) then
        content = readfile(s)
    end

    local func, err = loadstring(content)
    if not func then
        error(debug.traceback("Failed to load module:\n"..s.."\nError: "..err))
    end
    return func()
end

Module.LoadCustomAsset = function(url: string): string?
    if getcustomasset then
        if url:lower():sub(1, 4) == "http" then
            local fileName = `temp_{tick()}.txt`
            local _, result = pcall(function()
                writefile(fileName, game:HttpGet(url))
                return getcustomasset(fileName, true)
            end)
            if isfile(fileName) then
                delfile(fileName)
            end
            return result
        elseif isfile(url) then
            return getcustomasset(url, true)
        end
    else
        warn("Executor doesn't support 'getcustomasset', rbxassetid only.")
    end
    if url:find("rbxassetid") or tonumber(url) then
        return "rbxassetid://"..url:match("%d+")
    end
    error(debug.traceback("Failed to load custom asset for:\n"..url))
end

Module.LoadCustomInstance = function(url: string): Instance?
    local success, result = pcall(function()
        return game:GetObjects(Module.LoadCustomAsset(url))[1]
    end)
    return success and result or nil
end

Module.GetGameLastUpdate = function(): DateTime
    return DateTime.fromIsoDate(MarketplaceService:GetProductInfo(game.PlaceId).Updated)
end

Module.HasGameUpdated = function(timestamp: string | number | DateTime): boolean
    local millis = timestampToMillis(timestamp)
    if millis then
        return millis < Module.GetGameLastUpdate().UnixTimestampMillis
    end
    return false
end

Module.GetGitLastUpdate = function(owner: string, repo: string, filePath: string): DateTime
    local url = `https://api.github.com/repos/{owner}/{repo}/commits?per_page=1&path={filePath}`
    local success, result = pcall(HttpService.JSONDecode, HttpService, game:HttpGet(url))
    if not success then
        error(debug.traceback("Failed to get last commit for:\n"..url))
    end
    return DateTime.fromIsoDate(result[1].commit.committer.date)
end

Module.HasGitUpdated = function(owner: string, repo: string, filePath: string, timestamp: string | number | DateTime): boolean
    local millis = timestampToMillis(timestamp)
    if millis then
        return millis < Module.GetGitLastUpdate(owner, repo, filePath).UnixTimestampMillis
    end
    return false
end

Module.TruncateNumber = function(num: number, decimals: number): number
    local shift = 10 ^ (decimals and math.max(decimals, 0) or 0)
    return num * shift // 1 / shift
end

for name, func in next, Module do
    if typeof(func) == "function" then
        getgenv()[name] = func
    end
end

return Module