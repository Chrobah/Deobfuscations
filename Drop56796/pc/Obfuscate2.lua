--[[
    Obfuscate2.lua  —  organised by minimarchbleeding
    Original : Drop56796/pc  ->  Obfuscate2.lua
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
			v19 = v0(v3(v30, 1, 1));
			return "";
		else
			local v82 = v2(v0(v30, 16));
			if v19 then
				local v88 = v5(v82, v19);
				v19 = nil;
				return v88;
			else
				return v82;
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v83 = (v31 / ((5 - 3) ^ (v32 - 1))) % ((5 - 3) ^ (((v33 - ((878 - (282 + 595)) - 0)) - (v32 - ((1639 - (1523 + 114)) - 1))) + (620 - (555 + 64))));
			return v83 - (v83 % (932 - (771 + 86 + 74)));
		else
			local v84 = 568 - (367 + 201);
			local v85;
			while true do
				if (v84 == (927 - (214 + 713))) then
					v85 = 2 ^ (v32 - (1 + 0));
					return (((v31 % (v85 + v85)) >= v85) and (1 + 0)) or 0;
				end
			end
		end
	end
	local function v21()
		local v34 = v1(v16, v18, v18);
		v18 = v18 + 1;
		return v34;
	end
	local function v22()
		local v35, v36 = v1(v16, v18, v18 + (2 - 0));
		v18 = v18 + 2;
		return (v36 * (1321 - (68 + 997))) + v35;
	end
	local function v23()
		local v37 = 1270 - (226 + (1929 - 885));
		local v38;
		local v39;
		local v40;
		local v41;
		while true do
			if (v37 == 0) then
				v38, v39, v40, v41 = v1(v16, v18, v18 + 3);
				v18 = v18 + (17 - 13);
				v37 = 118 - (32 + 85);
			end
			if (v37 == (1 + (0 - 0))) then
				return (v41 * (3720433 + 13056783)) + (v40 * (66493 - (892 + 65))) + (v39 * (610 - 354)) + v38;
			end
		end
	end
	local function v24()
		local v42 = v23();
		local v43 = v23();
		local v44 = 351 - (87 + 263);
		local v45 = (v20(v43, 181 - ((1553 - (998 + 488)) + 36 + 77), 15 + 5) * ((4 - 2) ^ (32 + 0))) + v42;
		local v46 = v20(v43, 16 + 5, 31);
		local v47 = ((v20(v43, 127 - (78 + 17)) == (19 - (10 + 8))) and -(953 - (802 + 150))) or (3 - 2);
		if (v46 == 0) then
			if (v45 == (0 - (772 - (201 + 571)))) then
				return v47 * (0 - 0);
			else
				v46 = 1 + 0;
				v44 = 0 - 0;
			end
		elseif (v46 == ((2628 - (116 + 1022)) + 557)) then
			return ((v45 == ((4150 - 3153) - (915 + 82))) and (v47 * ((2 - 1) / (0 + 0)))) or (v47 * NaN);
		end
		return v8(v47, v46 - (1344 - 321)) * (v44 + (v45 / (((698 + 491) - (1069 + 118)) ^ (117 - 65))));
	end
	local function v25(v48)
		local v49;
		if not v48 then
			v48 = v23();
			if (v48 == (0 - 0)) then
				return "";
			end
		end
		v49 = v3(v16, v18, (v18 + v48) - (3 - 2));
		v18 = v18 + v48;
		local v50 = {};
		for v65 = 860 - (814 + 45), #v49 do
			v50[v65] = v2(v1(v3(v49, v65, v65)));
		end
		return v6(v50);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v51 = (function()
			return 0 - 0;
		end)();
		local v52 = (function()
			return;
		end)();
		local v53 = (function()
			return;
		end)();
		local v54 = (function()
			return;
		end)();
		local v55 = (function()
			return;
		end)();
		local v56 = (function()
			return;
		end)();
		local v57 = (function()
			return;
		end)();
		local v58 = (function()
			return;
		end)();
		while true do
			local v67 = (function()
				return 0 + 0;
			end)();
			while true do
				if (v67 == (0 + 0)) then
					if (v51 == (1025 - (706 + 318))) then
						local v95 = (function()
							return 1251 - (721 + 530);
						end)();
						while true do
							if (v95 ~= 0) then
							else
								v55 = (function()
									return {};
								end)();
								v56 = (function()
									return {v53,v54,nil,v55};
								end)();
								v95 = (function()
									return 2 - 1;
								end)();
							end
							if ((1 - 0) ~= v95) then
							else
								v57 = (function()
									return v23();
								end)();
								v51 = (function()
									return 5 - 3;
								end)();
								break;
							end
						end
					end
					if (v51 ~= 0) then
					else
						local v96 = (function()
							return 1700 - (1419 + 281);
						end)();
						local v97 = (function()
							return;
						end)();
						while true do
							if (v96 ~= (0 + 0)) then
							else
								v97 = (function()
									return 0;
								end)();
								while true do
									if (0 == v97) then
										v52 = (function()
											return function(v146, v147, v148)
												local v149 = (function()
													return 0;
												end)();
												while true do
													if (v149 ~= (0 - 0)) then
													else
														local v163 = (function()
															return 74 - (71 + 3);
														end)();
														local v164 = (function()
															return;
														end)();
														while true do
															if (v163 == (1086 - (461 + 625))) then
																v164 = (function()
																	return 0;
																end)();
																while true do
																	if (v164 == 0) then
																		v146[v147 - #"["] = (function()
																			return v148();
																		end)();
																		return v146, v147, v148;
																	end
																end
																break;
															end
														end
													end
												end
											end;
										end)();
										v53 = (function()
											return {};
										end)();
										v97 = (function()
											return 1;
										end)();
									end
									if (v97 ~= (1 + 0)) then
									else
										v54 = (function()
											return {};
										end)();
										v51 = (function()
											return 2 - 1;
										end)();
										break;
									end
								end
								break;
							end
						end
					end
					v67 = (function()
						return 1;
					end)();
				end
				if (v67 == (1 - 0)) then
					if (v51 == 3) then
						for v99 = #"!", v23() do
							local v100 = (function()
								return v21();
							end)();
							if (v20(v100, #",", #"~") ~= (0 + 0)) then
							else
								local v102 = (function()
									return 241 - (187 + 54);
								end)();
								local v103 = (function()
									return;
								end)();
								local v104 = (function()
									return;
								end)();
								local v105 = (function()
									return;
								end)();
								local v106 = (function()
									return;
								end)();
								while true do
									if (v102 == 1) then
										local v115 = (function()
											return 780 - (162 + 618);
										end)();
										while true do
											if (v115 == (1 + 0)) then
												v102 = (function()
													return 531 - (406 + 123);
												end)();
												break;
											end
											if (v115 == (1769 - (1749 + 20))) then
												v105 = (function()
													return nil;
												end)();
												v106 = (function()
													return nil;
												end)();
												v115 = (function()
													return 1 + 0;
												end)();
											end
										end
									end
									if (v102 == (0 + 0)) then
										local v116 = (function()
											return 0;
										end)();
										while true do
											if (v116 ~= (0 + 0)) then
											else
												v103 = (function()
													return 0 - 0;
												end)();
												v104 = (function()
													return nil;
												end)();
												v116 = (function()
													return 1 - 0;
												end)();
											end
											if (v116 ~= 1) then
											else
												v102 = (function()
													return 1;
												end)();
												break;
											end
										end
									end
									if (v102 ~= 2) then
									else
										while true do
											if (v103 == #"-19") then
												if (v20(v105, #"asd", #"gha") ~= #"~") then
												else
													v106[#".dev"] = (function()
														return v58[v106[#"xnxx"]];
													end)();
												end
												v53[v99] = (function()
													return v106;
												end)();
												break;
											end
											if (v103 == #"|") then
												local v154 = (function()
													return 0 + 0;
												end)();
												local v155 = (function()
													return;
												end)();
												while true do
													if ((1636 - (1373 + 263)) == v154) then
														v155 = (function()
															return 1900 - (106 + 1794);
														end)();
														while true do
															if (v155 ~= (1000 - (451 + 549))) then
															else
																v106 = (function()
																	return {v22(),v22(),nil,nil};
																end)();
																if (v104 == 0) then
																	local v171 = (function()
																		return 0;
																	end)();
																	local v172 = (function()
																		return;
																	end)();
																	while true do
																		if (v171 == 0) then
																			v172 = (function()
																				return 0;
																			end)();
																			while true do
																				if (v172 ~= (0 + 0)) then
																				else
																					v106[#"91("] = (function()
																						return v22();
																					end)();
																					v106[#"0836"] = (function()
																						return v22();
																					end)();
																					break;
																				end
																			end
																			break;
																		end
																	end
																elseif (v104 == #"<") then
																	v106[#"xnx"] = (function()
																		return v23();
																	end)();
																elseif (v104 == 2) then
																	v106[#"-19"] = (function()
																		return v23() - (2 ^ (46 - 30));
																	end)();
																elseif (v104 == #"19(") then
																	local v179 = (function()
																		return 0 - 0;
																	end)();
																	local v180 = (function()
																		return;
																	end)();
																	while true do
																		if (v179 == 0) then
																			v180 = (function()
																				return 114 - (4 + 110);
																			end)();
																			while true do
																				if (v180 == (0 - 0)) then
																					v106[#"19("] = (function()
																						return v23() - ((2 - 0) ^ (600 - (57 + 527)));
																					end)();
																					v106[#"0313"] = (function()
																						return v22();
																					end)();
																					break;
																				end
																			end
																			break;
																		end
																	end
																end
																v155 = (function()
																	return 1428 - (41 + 1386);
																end)();
															end
															if (v155 == (104 - (17 + 86))) then
																v103 = (function()
																	return 2 + 0;
																end)();
																break;
															end
														end
														break;
													end
												end
											end
											if (v103 == (1386 - (746 + 638))) then
												local v156 = (function()
													return 0 + 0;
												end)();
												local v157 = (function()
													return;
												end)();
												while true do
													if (v156 == (0 - 0)) then
														v157 = (function()
															return 341 - (218 + 123);
														end)();
														while true do
															if (v157 == (167 - (122 + 44))) then
																v103 = (function()
																	return #"nil";
																end)();
																break;
															end
															if (v157 ~= 0) then
															else
																if (v20(v105, #",", #"\\") == #"{") then
																	v106[2 - 0] = (function()
																		return v58[v106[2]];
																	end)();
																end
																if (v20(v105, 1583 - (1535 + 46), 2 + 0) == #"]") then
																	v106[#"xxx"] = (function()
																		return v58[v106[#"xnx"]];
																	end)();
																end
																v157 = (function()
																	return 1 + 0;
																end)();
															end
														end
														break;
													end
												end
											end
											if (v103 == (0 + 0)) then
												local v158 = (function()
													return 0 + 0;
												end)();
												local v159 = (function()
													return;
												end)();
												while true do
													if (v158 ~= (0 + 0)) then
													else
														v159 = (function()
															return 0;
														end)();
														while true do
															if (v159 ~= (560 - (306 + 254))) then
															else
																v104 = (function()
																	return v20(v100, 1259 - (1043 + 214), #"19(");
																end)();
																v105 = (function()
																	return v20(v100, #"?id=", 22 - 16);
																end)();
																v159 = (function()
																	return 1 + 0;
																end)();
															end
															if (v159 == (1 - 0)) then
																v103 = (function()
																	return #"!";
																end)();
																break;
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
							end
						end
						for v101 = #"|", v23() do
							v54, v101, v28 = (function()
								return v52(v54, v101, v28);
							end)();
						end
						return v56;
					end
					if (v51 == 2) then
						local v98 = (function()
							return 0;
						end)();
						while true do
							if (v98 ~= (1467 - (899 + 568))) then
							else
								v58 = (function()
									return {};
								end)();
								for v108 = #",", v57 do
									local v109 = (function()
										return 0 + 0;
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
									while true do
										if (v109 == (2 - 1)) then
											v112 = (function()
												return nil;
											end)();
											while true do
												if ((0 - 0) == v110) then
													local v160 = (function()
														return 603 - (268 + 335);
													end)();
													while true do
														if (v160 == (321 - (53 + 267))) then
															v110 = (function()
																return 291 - (60 + 230);
															end)();
															break;
														end
														if (v160 == (572 - (426 + 146))) then
															v111 = (function()
																return v21();
															end)();
															v112 = (function()
																return nil;
															end)();
															v160 = (function()
																return 1;
															end)();
														end
													end
												end
												if (v110 == (983 - (18 + 964))) then
													if (v111 == #"|") then
														v112 = (function()
															return v21() ~= (0 - 0);
														end)();
													elseif (v111 == (1 + 1)) then
														v112 = (function()
															return v24();
														end)();
													elseif (v111 ~= #"xnx") then
													else
														v112 = (function()
															return v25();
														end)();
													end
													v58[v108] = (function()
														return v112;
													end)();
													break;
												end
											end
											break;
										end
										if (v109 == (1456 - (282 + 1174))) then
											v110 = (function()
												return 850 - (20 + 830);
											end)();
											v111 = (function()
												return nil;
											end)();
											v109 = (function()
												return 1 + 0;
											end)();
										end
									end
								end
								v98 = (function()
									return 127 - (116 + 10);
								end)();
							end
							if (v98 ~= 1) then
							else
								v56[#"91("] = (function()
									return v21();
								end)();
								v51 = (function()
									return 814 - (569 + 242);
								end)();
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	local function v29(v59, v60, v61)
		local v62 = v59[739 - (542 + 196)];
		local v63 = v59[3 - 1];
		local v64 = v59[3];
		return function(...)
			local v68 = v62;
			local v69 = v63;
			local v70 = v64;
			local v71 = v27;
			local v72 = 1 + 0;
			local v73 = -(1 + 0 + 0);
			local v74 = {};
			local v75 = {...};
			local v76 = v12("#", ...) - (1976 - (1913 + 62));
			local v77 = {};
			local v78 = {};
			for v86 = 0 + 0, v76 do
				if (v86 >= v70) then
					v74[v86 - v70] = v75[v86 + 1];
				else
					v78[v86] = v75[v86 + 1];
				end
			end
			local v79 = (v76 - v70) + (2 - (1899 - (260 + 1638)));
			local v80;
			local v81;
			while true do
				local v87 = 1933 - (565 + 1368);
				while true do
					if (((3 - 2) == v87) or (4177 > 4850) or (3580 < 2844)) then
						if (v81 <= (15 - 9)) then
							if ((89 < 4490) and ((v81 <= (2 - 0)) or (400 > 1111))) then
								if (v81 <= (0 - 0)) then
									v78[v80[1553 - (1126 + 425)]] = v80[408 - (118 + 287)];
								elseif (v81 == (3 - 2)) then
									local v117 = v80[5 - 3];
									local v118 = v78[v80[1124 - (118 + 1003)]];
									v78[v117 + (2 - 1)] = v118;
									v78[v117] = v118[v80[381 - (142 + 235)]];
								else
									local v122 = 0 - (440 - (382 + 58));
									local v123;
									local v124;
									local v125;
									local v126;
									while true do
										if (v122 == (0 + (0 - 0))) then
											v123 = v80[1003 - (938 + 63)];
											v124, v125 = v71(v78[v123](v13(v78, v123 + (978 - (553 + 424)), v80[5 - 2])));
											v122 = 1126 - (936 + 189);
										end
										if (v122 == (1 + 0 + 0)) then
											v73 = (v125 + v123) - ((1 - 0) + 0);
											v126 = 0 + 0;
											v122 = (5 - 3) + 0;
										end
										if (v122 == (1 + 1)) then
											for v166 = v123, v73 do
												local v167 = 0 + (1205 - (902 + 303));
												while true do
													if (v167 == (0 - (0 - 0))) then
														v126 = v126 + (2 - 1);
														v78[v166] = v124[v126];
														break;
													end
												end
											end
											break;
										end
									end
								end
							elseif (v81 <= (8 - 4)) then
								if (v81 > (1 + 2)) then
									local v127 = v80[1094 - (975 + 117)];
									local v128 = v78[v80[14 - 11]];
									v78[v127 + (754 - (239 + 514))] = v128;
									v78[v127] = v128[v80[2 + 2]];
								else
									v78[v80[2]] = v61[v80[1878 - (157 + (4137 - 2419))]];
								end
							elseif ((3051 > 1005) and (v81 > (1334 - (797 + 532)))) then
								do
									return;
								end
							else
								v78[v80[2 + 0]] = v61[v80[2 + 1]];
							end
						elseif (v81 <= (20 - 11)) then
							if (v81 <= (1209 - (373 + 829))) then
								v78[v80[1020 - (697 + 321)]]();
							elseif (((3693 <= 4382) and (v81 > ((64 + 675) - (476 + 255)))) or (4983 < 1808)) then
								do
									return;
								end
							else
								v78[v80[1132 - (369 + 761)]]();
							end
						elseif (v81 <= (7 + 4)) then
							if ((v81 == (18 - 8)) or (3282 > 4100)) then
								local v136 = v80[3 - 1];
								local v137, v138 = v71(v78[v136](v13(v78, v136 + (239 - (64 + 174)), v80[1 + 2])));
								v73 = (v138 + v136) - (1 + 0);
								local v139 = 0 - 0;
								for v150 = v136, v73 do
									v139 = v139 + (1 - 0);
									v78[v150] = v137[v139];
								end
							else
								v78[v80[5 - 3]] = v80[3];
							end
						elseif (v81 > (1702 - (1121 + 569))) then
							local v142 = v80[1229 - ((536 - (22 + 192)) + 905)];
							v78[v142] = v78[v142](v13(v78, v142 + (337 - (144 + 192)), v73));
						else
							local v144 = v80[218 - (42 + (857 - (483 + 200)))];
							v78[v144] = v78[v144](v13(v78, v144 + 1 + 0, v73));
						end
						v72 = v72 + 1 + 0;
						break;
					end
					if ((3829 > 3769) and (v87 == (0 + 0))) then
						v80 = v68[v72];
						v81 = v80[3 - 2];
						v87 = 1505 - ((1826 - (1404 + 59)) + 1141);
					end
				end
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403443O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F44726F7035363739362F43722O6570794579654875622F6D61696E2F50432E6C756100083O0012053O00013O001205000100023O00200400010001000300122O000300044O0002000100034O000D5O00022O00073O000100012O00063O00017O00", v9(), ...);
