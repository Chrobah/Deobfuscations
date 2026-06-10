--[[
    Doorsbutkinda.lua  —  organised by minimarchbleeding
    Original : CloneNikita/Fe-stuff  ->  Doorsbutkinda.lua
    Not obfuscated; reproduced as-is.
--]]

--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.2.8) ~  Much Love, Ferib 

]]--

do
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
		local v18 = 0;
		local v19;
		local v20;
		local v21;
		local v22;
		local v23;
		local v24;
		local v25;
		local v26;
		local v27;
		local v28;
		local v29;
		local v30;
		while true do
			if (v18 == 5) then
				v27 = v24;
				v28 = nil;
				function v28(...)
					return {...}, v12("#", ...);
				end
				v18 = 6;
			end
			if (v18 == 2) then
				function v22()
					local v31 = 0 - 0;
					local v32;
					while true do
						if (v31 == 1) then
							return v32;
						end
						if (v31 == (0 - (619 - (555 + 64)))) then
							v32 = v1(v16, v19, v19);
							v19 = v19 + (1 - (931 - (857 + 74)));
							v31 = 2 - 1;
						end
					end
				end
				v23 = nil;
				function v23()
					local v33, v34 = v1(v16, v19, v19 + (929 - (214 + 713)));
					v19 = v19 + 2;
					return (v34 * (824 - (367 + 201))) + v33;
				end
				v18 = 3;
			end
			if (v18 == 4) then
				function v25()
					local v35 = v24();
					local v36 = v24();
					local v37 = 1 + 0;
					local v38 = (v21(v36, 878 - ((1120 - 838) + 595), 20) * ((1639 - (1523 + (1066 - (802 + 150)))) ^ 32)) + v35;
					local v39 = v21(v36, 19 + 2, 43 - 12);
					local v40 = ((v21(v36, 1097 - (68 + (2684 - 1687))) == (1271 - (226 + 1044))) and -(4 - 3)) or (118 - ((57 - 25) + 85));
					if (v39 == (0 + 0)) then
						if (v38 == (0 + 0)) then
							return v40 * (957 - (892 + 65));
						else
							local v94 = 0 - 0;
							while true do
								if ((0 - 0) == v94) then
									v39 = 1 - 0;
									v37 = (255 + 95) - (87 + 263);
									break;
								end
							end
						end
					elseif (v39 == (2227 - (67 + 113))) then
						return ((v38 == 0) and (v40 * ((1 + (997 - (915 + 82))) / (0 - (0 - 0))))) or (v40 * NaN);
					end
					return v8(v40, v39 - (753 + 270)) * (v37 + (v38 / (2 ^ 52)));
				end
				v26 = nil;
				function v26(v41)
					local v42;
					if not v41 then
						v41 = v24();
						if (v41 == (0 + 0)) then
							return "";
						end
					end
					v42 = v3(v16, v19, (v19 + v41) - 1);
					v19 = v19 + v41;
					local v43 = {};
					for v67 = 1 - 0, #v42 do
						v43[v67] = v2(v1(v3(v42, v67, v67)));
					end
					return v6(v43);
				end
				v18 = 5;
			end
			if (v18 == 6) then
				v29 = nil;
				function v29()
					local v44 = 0;
					local v45;
					local v46;
					local v47;
					local v48;
					local v49;
					local v50;
					local v51;
					while true do
						if (v44 == (822 - (436 + 383))) then
							v51 = nil;
							while true do
								local v95 = 0;
								local v96;
								while true do
									if ((14 - (9 + 5)) == v95) then
										v96 = 376 - (85 + 291);
										while true do
											if (v96 == 0) then
												if (v45 == 0) then
													v46 = {};
													v47 = {};
													v48 = {};
													v49 = {v46,v47,nil,v48};
													v45 = 1181 - (1123 + 57);
												end
												if (v45 == (2 + 0)) then
													local v138 = 0;
													while true do
														if (v138 ~= 1) then
														else
															return v49;
														end
														if (v138 ~= (254 - (163 + 91))) then
														else
															for v151 = 1931 - (1869 + 61), v24() do
																local v152 = 0 + 0;
																local v153;
																local v154;
																local v155;
																while true do
																	if (v152 == 0) then
																		v153 = 0 - 0;
																		v154 = nil;
																		v152 = 1 - 0;
																	end
																	if (v152 == 1) then
																		v155 = nil;
																		while true do
																			if (1 == v153) then
																				while true do
																					if (0 == v154) then
																						v155 = v22();
																						if (v21(v155, 1, 1 + 0) == (0 - 0)) then
																							local v160 = 0;
																							local v161;
																							local v162;
																							local v163;
																							local v164;
																							while true do
																								if (v160 == 1) then
																									v163 = nil;
																									v164 = nil;
																									v160 = 2 + 0;
																								end
																								if (v160 ~= 0) then
																								else
																									local v165 = 1474 - (1329 + 145);
																									while true do
																										if (0 == v165) then
																											v161 = 971 - (140 + 831);
																											v162 = nil;
																											v165 = 1;
																										end
																										if (v165 == (1851 - (1409 + 441))) then
																											v160 = 719 - (15 + 703);
																											break;
																										end
																									end
																								end
																								if (v160 == (1 + 1)) then
																									while true do
																										if (v161 ~= (439 - (262 + 176))) then
																										else
																											v164 = {v23(),v23(),nil,nil};
																											if (v162 == (0 - 0)) then
																												local v169 = 0;
																												local v170;
																												while true do
																													if (v169 == 0) then
																														v170 = 1206 - (696 + 510);
																														while true do
																															if (v170 ~= (0 - 0)) then
																															else
																																v164[1265 - (1091 + 171)] = v23();
																																v164[4] = v23();
																																break;
																															end
																														end
																														break;
																													end
																												end
																											elseif (v162 == 1) then
																												v164[3] = v24();
																											elseif (v162 == (1 + 1)) then
																												v164[9 - 6] = v24() - (2 ^ 16);
																											elseif (v162 == (9 - 6)) then
																												local v181 = 0;
																												local v182;
																												local v183;
																												while true do
																													if (v181 ~= 0) then
																													else
																														v182 = 0;
																														v183 = nil;
																														v181 = 375 - (123 + 251);
																													end
																													if (v181 == (4 - 3)) then
																														while true do
																															if (v182 == (698 - (208 + 490))) then
																																v183 = 0;
																																while true do
																																	if (v183 ~= (0 + 0)) then
																																	else
																																		v164[2 + 1] = v24() - (2 ^ 16);
																																		v164[840 - (660 + 176)] = v23();
																																		break;
																																	end
																																end
																																break;
																															end
																														end
																														break;
																													end
																												end
																											end
																											v161 = 1 + 1;
																										end
																										if (v161 == (202 - (14 + 188))) then
																											local v166 = 675 - (534 + 141);
																											while true do
																												if (0 == v166) then
																													v162 = v21(v155, 2, 2 + 1);
																													v163 = v21(v155, 4, 6 + 0);
																													v166 = 1 + 0;
																												end
																												if (v166 ~= (1 - 0)) then
																												else
																													v161 = 1;
																													break;
																												end
																											end
																										end
																										if (v161 == 2) then
																											local v167 = 0 - 0;
																											while true do
																												if (v167 == 0) then
																													if (v21(v163, 2 - 1, 1) ~= (1 + 0)) then
																													else
																														v164[2 + 0] = v51[v164[2]];
																													end
																													if (v21(v163, 2, 398 - (115 + 281)) ~= (2 - 1)) then
																													else
																														v164[3] = v51[v164[3 + 0]];
																													end
																													v167 = 1;
																												end
																												if (v167 ~= (2 - 1)) then
																												else
																													v161 = 10 - 7;
																													break;
																												end
																											end
																										end
																										if (v161 ~= 3) then
																										else
																											if (v21(v163, 870 - (550 + 317), 3) ~= (1 - 0)) then
																											else
																												v164[4 - 0] = v51[v164[11 - 7]];
																											end
																											v46[v151] = v164;
																											break;
																										end
																									end
																									break;
																								end
																							end
																						end
																						break;
																					end
																				end
																				break;
																			end
																			if (v153 == 0) then
																				local v159 = 0;
																				while true do
																					if (v159 == (286 - (134 + 151))) then
																						v153 = 1666 - (970 + 695);
																						break;
																					end
																					if (v159 ~= 0) then
																					else
																						v154 = 0;
																						v155 = nil;
																						v159 = 1;
																					end
																				end
																			end
																		end
																		break;
																	end
																end
															end
															for v156 = 1, v24() do
																v47[v156 - 1] = v29();
															end
															v138 = 1;
														end
													end
												end
												v96 = 1;
											end
											if (v96 == 1) then
												if (v45 ~= 1) then
												else
													v50 = v24();
													v51 = {};
													for v140 = 1, v50 do
														local v141 = 0 - 0;
														local v142;
														local v143;
														local v144;
														while true do
															if (v141 == (1991 - (582 + 1408))) then
																v144 = nil;
																while true do
																	if (v142 ~= (3 - 2)) then
																	else
																		if (v143 == (1 - 0)) then
																			v144 = v22() ~= (0 - 0);
																		elseif (v143 == 2) then
																			v144 = v25();
																		elseif (v143 == (1827 - (1195 + 629))) then
																			v144 = v26();
																		end
																		v51[v140] = v144;
																		break;
																	end
																	if (v142 ~= (0 - 0)) then
																	else
																		v143 = v22();
																		v144 = nil;
																		v142 = 242 - (187 + 54);
																	end
																end
																break;
															end
															if (v141 ~= (780 - (162 + 618))) then
															else
																v142 = 0;
																v143 = nil;
																v141 = 1 + 0;
															end
														end
													end
													v49[2 + 1] = v22();
													v45 = 2;
												end
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (v44 ~= 2) then
						else
							local v91 = 0;
							while true do
								if (v91 == (0 - 0)) then
									v49 = nil;
									v50 = nil;
									v91 = 1 - 0;
								end
								if (1 == v91) then
									v44 = 3;
									break;
								end
							end
						end
						if (v44 == (0 + 0)) then
							local v92 = 1636 - (1373 + 263);
							while true do
								if (v92 == (1000 - (451 + 549))) then
									v45 = 0 + 0;
									v46 = nil;
									v92 = 1 - 0;
								end
								if (v92 == (1 - 0)) then
									v44 = 1385 - (746 + 638);
									break;
								end
							end
						end
						if (v44 == 1) then
							local v93 = 0 + 0;
							while true do
								if (v93 == (0 - 0)) then
									v47 = nil;
									v48 = nil;
									v93 = 342 - (218 + 123);
								end
								if (v93 == (1582 - (1535 + 46))) then
									v44 = 2 + 0;
									break;
								end
							end
						end
					end
				end
				v30 = nil;
				v18 = 7;
			end
			if (v18 == 0) then
				v19 = 1;
				v20 = nil;
				v16 = v4(v3(v16, 5), "..", function(v52)
					if (v1(v52, 2) == 79) then
						local v83 = 0;
						while true do
							if (v83 == 0) then
								v20 = v0(v3(v52, 1, 1));
								return "";
							end
						end
					else
						local v84 = v2(v0(v52, 16));
						if v20 then
							local v97 = v5(v84, v20);
							v20 = nil;
							return v97;
						else
							return v84;
						end
					end
				end);
				v18 = 1;
			end
			if (v18 == 3) then
				v24 = nil;
				function v24()
					local v53 = 0 - 0;
					local v54;
					local v55;
					local v56;
					local v57;
					while true do
						if (v53 == (0 + 0)) then
							v54, v55, v56, v57 = v1(v16, v19, v19 + (8 - 5));
							v19 = v19 + (564 - (306 + 254));
							v53 = 1 + 0;
						end
						if (v53 == (1 - 0)) then
							return (v57 * (16778683 - (899 + 568))) + (v56 * (43077 + 1285 + 21174)) + (v55 * (1067 - (569 + 242))) + v54;
						end
					end
				end
				v25 = nil;
				v18 = 4;
			end
			if (v18 == 7) then
				function v30(v58, v59, v60)
					local v61 = v58[1];
					local v62 = v58[2];
					local v63 = v58[3];
					return function(...)
						local v69 = v61;
						local v70 = v62;
						local v71 = v63;
						local v72 = v28;
						local v73 = 1;
						local v74 = -1;
						local v75 = {};
						local v76 = {...};
						local v77 = v12("#", ...) - 1;
						local v78 = {};
						local v79 = {};
						for v85 = 0, v77 do
							if (v85 >= v71) then
								v75[v85 - v71] = v76[v85 + 1];
							else
								v79[v85] = v76[v85 + 1];
							end
						end
						local v80 = (v77 - v71) + 1;
						local v81;
						local v82;
						while true do
							v81 = v69[v73];
							v82 = v81[1];
							if (v82 <= 6) then
								if (v82 <= 2) then
									if (v82 <= 0) then
										v79[v81[2]] = v81[3];
									elseif (v82 > 1) then
										v79[v81[2]]();
									else
										do
											return;
										end
									end
								elseif (v82 <= 4) then
									if (v82 == 3) then
										local v106 = v81[2];
										local v107 = v79[v81[3]];
										v79[v106 + 1] = v107;
										v79[v106] = v107[v81[4]];
									else
										do
											return;
										end
									end
								elseif (v82 > 5) then
									v79[v81[2]]();
								else
									local v111 = 0;
									local v112;
									local v113;
									local v114;
									local v115;
									while true do
										if (v111 == 2) then
											for v148 = v112, v74 do
												v115 = v115 + 1;
												v79[v148] = v113[v115];
											end
											break;
										end
										if (v111 == 1) then
											v74 = (v114 + v112) - 1;
											v115 = 0;
											v111 = 2;
										end
										if (v111 == 0) then
											v112 = v81[2];
											v113, v114 = v72(v79[v112](v13(v79, v112 + 1, v81[3])));
											v111 = 1;
										end
									end
								end
							elseif (v82 <= 9) then
								if (v82 <= 7) then
									local v104 = 0;
									local v105;
									while true do
										if (v104 == 0) then
											v105 = v81[2];
											v79[v105] = v79[v105](v13(v79, v105 + 1, v74));
											break;
										end
									end
								elseif (v82 == 8) then
									v79[v81[2]] = v60[v81[3]];
								else
									v79[v81[2]] = v60[v81[3]];
								end
							elseif (v82 <= 11) then
								if (v82 > 10) then
									local v120 = v81[2];
									local v121, v122 = v72(v79[v120](v13(v79, v120 + 1, v81[3])));
									v74 = (v122 + v120) - 1;
									local v123 = 0;
									for v135 = v120, v74 do
										v123 = v123 + 1;
										v79[v135] = v121[v123];
									end
								else
									local v124 = 0;
									local v125;
									while true do
										if (v124 == 0) then
											v125 = v81[2];
											v79[v125] = v79[v125](v13(v79, v125 + 1, v74));
											break;
										end
									end
								end
							elseif (v82 > 12) then
								v79[v81[2]] = v81[3];
							else
								local v128 = v81[2];
								local v129 = v79[v81[3]];
								v79[v128 + 1] = v129;
								v79[v128] = v129[v81[4]];
							end
							v73 = v73 + 1;
						end
					end;
				end
				return v30(v29(), {}, v17)(...);
			end
			if (v18 == 1) then
				v21 = nil;
				function v21(v64, v65, v66)
					if v66 then
						local v88 = (v64 / ((1026 - (706 + 318)) ^ (v65 - 1))) % ((1253 - (721 + 530)) ^ (((v66 - (1272 - (945 + 326))) - (v65 - ((1 + 1) - 1))) + 1 + 0));
						return v88 - (v88 % (701 - (271 + 429)));
					else
						local v89 = 0 + 0;
						local v90;
						while true do
							if (v89 == ((155 + 1345) - (1408 + 92))) then
								v90 = (1088 - (461 + 625)) ^ (v65 - (1289 - (993 + 295)));
								return (((v64 % (v90 + v90)) >= v90) and (1 + 0)) or (1171 - (123 + 295 + 753));
							end
						end
					end
				end
				v22 = nil;
				v18 = 2;
			end
		end
	end
	v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403413O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F61666B626F2O74696E672F3130312F6D61696E2F6E657766696C652E6C756100083O0012093O00013O001209000100023O00200300010001000300120D000300044O0005000100034O000A5O00022O00023O000100012O00043O00017O00", v9(), ...);
end
