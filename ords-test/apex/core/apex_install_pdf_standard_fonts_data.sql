
prompt
prompt ...insert standard PDF fonts
prompt

begin

delete 
  from wwv_flow_pdf_fonts
 where is_standard = 'Y';

end;
/


begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
1,
'Y',
'Courier-Bold',
'Courier', 
'normal',
'bold',
1.051);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1, 1, 32, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2, 1, 33, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (3, 1, 34, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (4, 1, 35, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (5, 1, 36, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (6, 1, 37, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (7, 1, 38, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (8, 1, 39, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (9, 1, 40, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (10, 1, 41, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (11, 1, 42, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (12, 1, 43, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (13, 1, 44, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (14, 1, 45, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (15, 1, 46, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (16, 1, 47, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (17, 1, 48, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (18, 1, 49, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (19, 1, 50, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (20, 1, 51, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (21, 1, 52, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (22, 1, 53, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (23, 1, 54, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (24, 1, 55, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (25, 1, 56, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (26, 1, 57, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (27, 1, 58, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (28, 1, 59, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (29, 1, 60, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (30, 1, 61, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (31, 1, 62, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (32, 1, 63, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (33, 1, 64, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (34, 1, 65, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (35, 1, 66, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (36, 1, 67, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (37, 1, 68, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (38, 1, 69, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (39, 1, 70, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (40, 1, 71, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (41, 1, 72, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (42, 1, 73, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (43, 1, 74, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (44, 1, 75, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (45, 1, 76, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (46, 1, 77, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (47, 1, 78, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (48, 1, 79, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (49, 1, 80, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (50, 1, 81, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (51, 1, 82, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (52, 1, 83, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (53, 1, 84, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (54, 1, 85, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (55, 1, 86, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (56, 1, 87, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (57, 1, 88, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (58, 1, 89, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (59, 1, 90, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (60, 1, 91, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (61, 1, 92, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (62, 1, 93, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (63, 1, 94, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (64, 1, 95, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (65, 1, 96, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (66, 1, 97, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (67, 1, 98, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (68, 1, 99, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (69, 1, 100, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (70, 1, 101, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (71, 1, 102, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (72, 1, 103, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (73, 1, 104, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (74, 1, 105, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (75, 1, 106, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (76, 1, 107, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (77, 1, 108, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (78, 1, 109, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (79, 1, 110, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (80, 1, 111, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (81, 1, 112, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (82, 1, 113, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (83, 1, 114, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (84, 1, 115, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (85, 1, 116, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (86, 1, 117, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (87, 1, 118, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (88, 1, 119, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (89, 1, 120, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (90, 1, 121, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (91, 1, 122, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (92, 1, 123, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (93, 1, 124, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (94, 1, 125, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (95, 1, 126, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (96, 1, 161, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (97, 1, 162, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (98, 1, 163, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (99, 1, 164, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (100, 1, 165, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (101, 1, 166, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (102, 1, 167, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (103, 1, 168, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (104, 1, 169, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (105, 1, 170, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (106, 1, 171, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (107, 1, 172, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (108, 1, 173, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (109, 1, 174, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (110, 1, 175, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (111, 1, 177, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (112, 1, 178, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (113, 1, 179, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (114, 1, 180, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (115, 1, 182, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (116, 1, 183, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (117, 1, 184, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (118, 1, 185, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (119, 1, 186, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (120, 1, 187, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (121, 1, 188, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (122, 1, 189, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (123, 1, 191, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (124, 1, 193, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (125, 1, 194, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (126, 1, 195, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (127, 1, 196, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (128, 1, 197, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (129, 1, 198, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (130, 1, 199, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (131, 1, 200, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (132, 1, 202, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (133, 1, 203, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (134, 1, 205, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (135, 1, 206, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (136, 1, 207, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (137, 1, 208, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (138, 1, 225, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (139, 1, 227, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (140, 1, 232, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (141, 1, 233, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (142, 1, 234, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (143, 1, 235, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (144, 1, 241, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (145, 1, 245, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (146, 1, 248, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (147, 1, 249, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (148, 1, 250, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (149, 1, 251, 600);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
2,
'Y',
'Courier-BoldOblique',
'Courier', 
'italic',
'bold',
1.051);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (150, 2, 32, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (151, 2, 33, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (152, 2, 34, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (153, 2, 35, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (154, 2, 36, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (155, 2, 37, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (156, 2, 38, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (157, 2, 39, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (158, 2, 40, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (159, 2, 41, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (160, 2, 42, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (161, 2, 43, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (162, 2, 44, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (163, 2, 45, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (164, 2, 46, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (165, 2, 47, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (166, 2, 48, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (167, 2, 49, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (168, 2, 50, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (169, 2, 51, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (170, 2, 52, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (171, 2, 53, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (172, 2, 54, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (173, 2, 55, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (174, 2, 56, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (175, 2, 57, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (176, 2, 58, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (177, 2, 59, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (178, 2, 60, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (179, 2, 61, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (180, 2, 62, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (181, 2, 63, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (182, 2, 64, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (183, 2, 65, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (184, 2, 66, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (185, 2, 67, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (186, 2, 68, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (187, 2, 69, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (188, 2, 70, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (189, 2, 71, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (190, 2, 72, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (191, 2, 73, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (192, 2, 74, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (193, 2, 75, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (194, 2, 76, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (195, 2, 77, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (196, 2, 78, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (197, 2, 79, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (198, 2, 80, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (199, 2, 81, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (200, 2, 82, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (201, 2, 83, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (202, 2, 84, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (203, 2, 85, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (204, 2, 86, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (205, 2, 87, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (206, 2, 88, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (207, 2, 89, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (208, 2, 90, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (209, 2, 91, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (210, 2, 92, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (211, 2, 93, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (212, 2, 94, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (213, 2, 95, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (214, 2, 96, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (215, 2, 97, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (216, 2, 98, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (217, 2, 99, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (218, 2, 100, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (219, 2, 101, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (220, 2, 102, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (221, 2, 103, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (222, 2, 104, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (223, 2, 105, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (224, 2, 106, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (225, 2, 107, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (226, 2, 108, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (227, 2, 109, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (228, 2, 110, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (229, 2, 111, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (230, 2, 112, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (231, 2, 113, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (232, 2, 114, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (233, 2, 115, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (234, 2, 116, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (235, 2, 117, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (236, 2, 118, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (237, 2, 119, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (238, 2, 120, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (239, 2, 121, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (240, 2, 122, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (241, 2, 123, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (242, 2, 124, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (243, 2, 125, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (244, 2, 126, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (245, 2, 161, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (246, 2, 162, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (247, 2, 163, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (248, 2, 164, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (249, 2, 165, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (250, 2, 166, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (251, 2, 167, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (252, 2, 168, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (253, 2, 169, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (254, 2, 170, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (255, 2, 171, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (256, 2, 172, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (257, 2, 173, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (258, 2, 174, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (259, 2, 175, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (260, 2, 177, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (261, 2, 178, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (262, 2, 179, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (263, 2, 180, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (264, 2, 182, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (265, 2, 183, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (266, 2, 184, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (267, 2, 185, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (268, 2, 186, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (269, 2, 187, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (270, 2, 188, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (271, 2, 189, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (272, 2, 191, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (273, 2, 193, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (274, 2, 194, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (275, 2, 195, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (276, 2, 196, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (277, 2, 197, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (278, 2, 198, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (279, 2, 199, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (280, 2, 200, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (281, 2, 202, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (282, 2, 203, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (283, 2, 205, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (284, 2, 206, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (285, 2, 207, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (286, 2, 208, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (287, 2, 225, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (288, 2, 227, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (289, 2, 232, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (290, 2, 233, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (291, 2, 234, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (292, 2, 235, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (293, 2, 241, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (294, 2, 245, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (295, 2, 248, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (296, 2, 249, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (297, 2, 250, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (298, 2, 251, 600);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
3,
'Y',
'Courier-Oblique',
'Courier', 
'italic',
'normal',
1.055);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (299, 3, 32, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (300, 3, 33, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (301, 3, 34, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (302, 3, 35, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (303, 3, 36, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (304, 3, 37, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (305, 3, 38, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (306, 3, 39, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (307, 3, 40, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (308, 3, 41, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (309, 3, 42, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (310, 3, 43, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (311, 3, 44, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (312, 3, 45, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (313, 3, 46, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (314, 3, 47, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (315, 3, 48, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (316, 3, 49, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (317, 3, 50, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (318, 3, 51, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (319, 3, 52, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (320, 3, 53, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (321, 3, 54, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (322, 3, 55, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (323, 3, 56, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (324, 3, 57, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (325, 3, 58, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (326, 3, 59, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (327, 3, 60, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (328, 3, 61, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (329, 3, 62, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (330, 3, 63, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (331, 3, 64, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (332, 3, 65, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (333, 3, 66, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (334, 3, 67, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (335, 3, 68, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (336, 3, 69, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (337, 3, 70, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (338, 3, 71, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (339, 3, 72, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (340, 3, 73, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (341, 3, 74, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (342, 3, 75, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (343, 3, 76, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (344, 3, 77, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (345, 3, 78, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (346, 3, 79, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (347, 3, 80, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (348, 3, 81, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (349, 3, 82, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (350, 3, 83, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (351, 3, 84, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (352, 3, 85, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (353, 3, 86, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (354, 3, 87, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (355, 3, 88, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (356, 3, 89, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (357, 3, 90, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (358, 3, 91, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (359, 3, 92, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (360, 3, 93, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (361, 3, 94, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (362, 3, 95, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (363, 3, 96, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (364, 3, 97, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (365, 3, 98, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (366, 3, 99, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (367, 3, 100, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (368, 3, 101, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (369, 3, 102, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (370, 3, 103, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (371, 3, 104, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (372, 3, 105, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (373, 3, 106, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (374, 3, 107, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (375, 3, 108, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (376, 3, 109, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (377, 3, 110, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (378, 3, 111, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (379, 3, 112, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (380, 3, 113, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (381, 3, 114, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (382, 3, 115, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (383, 3, 116, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (384, 3, 117, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (385, 3, 118, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (386, 3, 119, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (387, 3, 120, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (388, 3, 121, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (389, 3, 122, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (390, 3, 123, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (391, 3, 124, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (392, 3, 125, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (393, 3, 126, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (394, 3, 161, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (395, 3, 162, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (396, 3, 163, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (397, 3, 164, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (398, 3, 165, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (399, 3, 166, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (400, 3, 167, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (401, 3, 168, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (402, 3, 169, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (403, 3, 170, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (404, 3, 171, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (405, 3, 172, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (406, 3, 173, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (407, 3, 174, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (408, 3, 175, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (409, 3, 177, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (410, 3, 178, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (411, 3, 179, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (412, 3, 180, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (413, 3, 182, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (414, 3, 183, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (415, 3, 184, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (416, 3, 185, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (417, 3, 186, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (418, 3, 187, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (419, 3, 188, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (420, 3, 189, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (421, 3, 191, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (422, 3, 193, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (423, 3, 194, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (424, 3, 195, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (425, 3, 196, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (426, 3, 197, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (427, 3, 198, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (428, 3, 199, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (429, 3, 200, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (430, 3, 202, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (431, 3, 203, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (432, 3, 205, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (433, 3, 206, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (434, 3, 207, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (435, 3, 208, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (436, 3, 225, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (437, 3, 227, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (438, 3, 232, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (439, 3, 233, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (440, 3, 234, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (441, 3, 235, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (442, 3, 241, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (443, 3, 245, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (444, 3, 248, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (445, 3, 249, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (446, 3, 250, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (447, 3, 251, 600);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
4,
'Y',
'Courier',
'Courier', 
'normal',
'normal',
1.055);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (448, 4, 32, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (449, 4, 33, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (450, 4, 34, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (451, 4, 35, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (452, 4, 36, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (453, 4, 37, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (454, 4, 38, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (455, 4, 39, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (456, 4, 40, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (457, 4, 41, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (458, 4, 42, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (459, 4, 43, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (460, 4, 44, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (461, 4, 45, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (462, 4, 46, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (463, 4, 47, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (464, 4, 48, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (465, 4, 49, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (466, 4, 50, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (467, 4, 51, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (468, 4, 52, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (469, 4, 53, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (470, 4, 54, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (471, 4, 55, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (472, 4, 56, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (473, 4, 57, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (474, 4, 58, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (475, 4, 59, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (476, 4, 60, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (477, 4, 61, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (478, 4, 62, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (479, 4, 63, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (480, 4, 64, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (481, 4, 65, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (482, 4, 66, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (483, 4, 67, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (484, 4, 68, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (485, 4, 69, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (486, 4, 70, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (487, 4, 71, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (488, 4, 72, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (489, 4, 73, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (490, 4, 74, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (491, 4, 75, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (492, 4, 76, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (493, 4, 77, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (494, 4, 78, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (495, 4, 79, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (496, 4, 80, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (497, 4, 81, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (498, 4, 82, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (499, 4, 83, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (500, 4, 84, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (501, 4, 85, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (502, 4, 86, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (503, 4, 87, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (504, 4, 88, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (505, 4, 89, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (506, 4, 90, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (507, 4, 91, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (508, 4, 92, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (509, 4, 93, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (510, 4, 94, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (511, 4, 95, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (512, 4, 96, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (513, 4, 97, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (514, 4, 98, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (515, 4, 99, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (516, 4, 100, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (517, 4, 101, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (518, 4, 102, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (519, 4, 103, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (520, 4, 104, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (521, 4, 105, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (522, 4, 106, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (523, 4, 107, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (524, 4, 108, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (525, 4, 109, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (526, 4, 110, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (527, 4, 111, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (528, 4, 112, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (529, 4, 113, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (530, 4, 114, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (531, 4, 115, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (532, 4, 116, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (533, 4, 117, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (534, 4, 118, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (535, 4, 119, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (536, 4, 120, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (537, 4, 121, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (538, 4, 122, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (539, 4, 123, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (540, 4, 124, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (541, 4, 125, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (542, 4, 126, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (543, 4, 161, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (544, 4, 162, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (545, 4, 163, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (546, 4, 164, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (547, 4, 165, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (548, 4, 166, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (549, 4, 167, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (550, 4, 168, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (551, 4, 169, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (552, 4, 170, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (553, 4, 171, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (554, 4, 172, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (555, 4, 173, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (556, 4, 174, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (557, 4, 175, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (558, 4, 177, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (559, 4, 178, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (560, 4, 179, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (561, 4, 180, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (562, 4, 182, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (563, 4, 183, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (564, 4, 184, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (565, 4, 185, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (566, 4, 186, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (567, 4, 187, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (568, 4, 188, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (569, 4, 189, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (570, 4, 191, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (571, 4, 193, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (572, 4, 194, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (573, 4, 195, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (574, 4, 196, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (575, 4, 197, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (576, 4, 198, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (577, 4, 199, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (578, 4, 200, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (579, 4, 202, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (580, 4, 203, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (581, 4, 205, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (582, 4, 206, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (583, 4, 207, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (584, 4, 208, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (585, 4, 225, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (586, 4, 227, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (587, 4, 232, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (588, 4, 233, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (589, 4, 234, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (590, 4, 235, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (591, 4, 241, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (592, 4, 245, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (593, 4, 248, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (594, 4, 249, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (595, 4, 250, 600);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (596, 4, 251, 600);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
5,
'Y',
'Helvetica-Bold',
'Helvetica', 
'normal',
'bold',
1.19);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (597, 5, 32, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (598, 5, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (599, 5, 34, 474);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (600, 5, 35, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (601, 5, 36, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (602, 5, 37, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (603, 5, 38, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (604, 5, 39, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (605, 5, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (606, 5, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (607, 5, 42, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (608, 5, 43, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (609, 5, 44, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (610, 5, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (611, 5, 46, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (612, 5, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (613, 5, 48, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (614, 5, 49, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (615, 5, 50, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (616, 5, 51, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (617, 5, 52, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (618, 5, 53, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (619, 5, 54, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (620, 5, 55, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (621, 5, 56, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (622, 5, 57, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (623, 5, 58, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (624, 5, 59, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (625, 5, 60, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (626, 5, 61, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (627, 5, 62, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (628, 5, 63, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (629, 5, 64, 975);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (630, 5, 65, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (631, 5, 66, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (632, 5, 67, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (633, 5, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (634, 5, 69, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (635, 5, 70, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (636, 5, 71, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (637, 5, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (638, 5, 73, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (639, 5, 74, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (640, 5, 75, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (641, 5, 76, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (642, 5, 77, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (643, 5, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (644, 5, 79, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (645, 5, 80, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (646, 5, 81, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (647, 5, 82, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (648, 5, 83, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (649, 5, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (650, 5, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (651, 5, 86, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (652, 5, 87, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (653, 5, 88, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (654, 5, 89, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (655, 5, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (656, 5, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (657, 5, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (658, 5, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (659, 5, 94, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (660, 5, 95, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (661, 5, 96, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (662, 5, 97, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (663, 5, 98, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (664, 5, 99, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (665, 5, 100, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (666, 5, 101, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (667, 5, 102, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (668, 5, 103, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (669, 5, 104, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (670, 5, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (671, 5, 106, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (672, 5, 107, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (673, 5, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (674, 5, 109, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (675, 5, 110, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (676, 5, 111, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (677, 5, 112, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (678, 5, 113, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (679, 5, 114, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (680, 5, 115, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (681, 5, 116, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (682, 5, 117, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (683, 5, 118, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (684, 5, 119, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (685, 5, 120, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (686, 5, 121, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (687, 5, 122, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (688, 5, 123, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (689, 5, 124, 280);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (690, 5, 125, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (691, 5, 126, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (692, 5, 161, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (693, 5, 162, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (694, 5, 163, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (695, 5, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (696, 5, 165, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (697, 5, 166, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (698, 5, 167, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (699, 5, 168, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (700, 5, 169, 238);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (701, 5, 170, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (702, 5, 171, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (703, 5, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (704, 5, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (705, 5, 174, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (706, 5, 175, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (707, 5, 177, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (708, 5, 178, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (709, 5, 179, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (710, 5, 180, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (711, 5, 182, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (712, 5, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (713, 5, 184, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (714, 5, 185, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (715, 5, 186, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (716, 5, 187, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (717, 5, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (718, 5, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (719, 5, 191, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (720, 5, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (721, 5, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (722, 5, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (723, 5, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (724, 5, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (725, 5, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (726, 5, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (727, 5, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (728, 5, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (729, 5, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (730, 5, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (731, 5, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (732, 5, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (733, 5, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (734, 5, 225, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (735, 5, 227, 370);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (736, 5, 232, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (737, 5, 233, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (738, 5, 234, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (739, 5, 235, 365);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (740, 5, 241, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (741, 5, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (742, 5, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (743, 5, 249, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (744, 5, 250, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (745, 5, 251, 611);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
6,
'Y',
'Helvetica-BoldOblique',
'Helvetica', 
'italic',
'bold',
1.19);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (746, 6, 32, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (747, 6, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (748, 6, 34, 474);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (749, 6, 35, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (750, 6, 36, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (751, 6, 37, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (752, 6, 38, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (753, 6, 39, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (754, 6, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (755, 6, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (756, 6, 42, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (757, 6, 43, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (758, 6, 44, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (759, 6, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (760, 6, 46, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (761, 6, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (762, 6, 48, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (763, 6, 49, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (764, 6, 50, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (765, 6, 51, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (766, 6, 52, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (767, 6, 53, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (768, 6, 54, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (769, 6, 55, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (770, 6, 56, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (771, 6, 57, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (772, 6, 58, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (773, 6, 59, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (774, 6, 60, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (775, 6, 61, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (776, 6, 62, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (777, 6, 63, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (778, 6, 64, 975);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (779, 6, 65, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (780, 6, 66, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (781, 6, 67, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (782, 6, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (783, 6, 69, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (784, 6, 70, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (785, 6, 71, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (786, 6, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (787, 6, 73, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (788, 6, 74, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (789, 6, 75, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (790, 6, 76, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (791, 6, 77, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (792, 6, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (793, 6, 79, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (794, 6, 80, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (795, 6, 81, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (796, 6, 82, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (797, 6, 83, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (798, 6, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (799, 6, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (800, 6, 86, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (801, 6, 87, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (802, 6, 88, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (803, 6, 89, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (804, 6, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (805, 6, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (806, 6, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (807, 6, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (808, 6, 94, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (809, 6, 95, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (810, 6, 96, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (811, 6, 97, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (812, 6, 98, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (813, 6, 99, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (814, 6, 100, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (815, 6, 101, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (816, 6, 102, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (817, 6, 103, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (818, 6, 104, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (819, 6, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (820, 6, 106, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (821, 6, 107, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (822, 6, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (823, 6, 109, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (824, 6, 110, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (825, 6, 111, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (826, 6, 112, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (827, 6, 113, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (828, 6, 114, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (829, 6, 115, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (830, 6, 116, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (831, 6, 117, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (832, 6, 118, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (833, 6, 119, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (834, 6, 120, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (835, 6, 121, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (836, 6, 122, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (837, 6, 123, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (838, 6, 124, 280);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (839, 6, 125, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (840, 6, 126, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (841, 6, 161, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (842, 6, 162, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (843, 6, 163, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (844, 6, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (845, 6, 165, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (846, 6, 166, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (847, 6, 167, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (848, 6, 168, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (849, 6, 169, 238);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (850, 6, 170, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (851, 6, 171, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (852, 6, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (853, 6, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (854, 6, 174, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (855, 6, 175, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (856, 6, 177, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (857, 6, 178, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (858, 6, 179, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (859, 6, 180, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (860, 6, 182, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (861, 6, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (862, 6, 184, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (863, 6, 185, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (864, 6, 186, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (865, 6, 187, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (866, 6, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (867, 6, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (868, 6, 191, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (869, 6, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (870, 6, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (871, 6, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (872, 6, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (873, 6, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (874, 6, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (875, 6, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (876, 6, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (877, 6, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (878, 6, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (879, 6, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (880, 6, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (881, 6, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (882, 6, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (883, 6, 225, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (884, 6, 227, 370);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (885, 6, 232, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (886, 6, 233, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (887, 6, 234, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (888, 6, 235, 365);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (889, 6, 241, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (890, 6, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (891, 6, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (892, 6, 249, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (893, 6, 250, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (894, 6, 251, 611);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
7,
'Y',
'Helvetica',
'Helvetica', 
'normal',
'normal',
1.156);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (895, 7, 32, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (896, 7, 33, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (897, 7, 34, 355);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (898, 7, 35, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (899, 7, 36, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (900, 7, 37, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (901, 7, 38, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (902, 7, 39, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (903, 7, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (904, 7, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (905, 7, 42, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (906, 7, 43, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (907, 7, 44, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (908, 7, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (909, 7, 46, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (910, 7, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (911, 7, 48, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (912, 7, 49, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (913, 7, 50, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (914, 7, 51, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (915, 7, 52, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (916, 7, 53, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (917, 7, 54, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (918, 7, 55, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (919, 7, 56, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (920, 7, 57, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (921, 7, 58, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (922, 7, 59, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (923, 7, 60, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (924, 7, 61, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (925, 7, 62, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (926, 7, 63, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (927, 7, 64, 1015);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (928, 7, 65, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (929, 7, 66, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (930, 7, 67, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (931, 7, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (932, 7, 69, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (933, 7, 70, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (934, 7, 71, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (935, 7, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (936, 7, 73, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (937, 7, 74, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (938, 7, 75, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (939, 7, 76, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (940, 7, 77, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (941, 7, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (942, 7, 79, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (943, 7, 80, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (944, 7, 81, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (945, 7, 82, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (946, 7, 83, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (947, 7, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (948, 7, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (949, 7, 86, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (950, 7, 87, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (951, 7, 88, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (952, 7, 89, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (953, 7, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (954, 7, 91, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (955, 7, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (956, 7, 93, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (957, 7, 94, 469);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (958, 7, 95, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (959, 7, 96, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (960, 7, 97, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (961, 7, 98, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (962, 7, 99, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (963, 7, 100, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (964, 7, 101, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (965, 7, 102, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (966, 7, 103, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (967, 7, 104, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (968, 7, 105, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (969, 7, 106, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (970, 7, 107, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (971, 7, 108, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (972, 7, 109, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (973, 7, 110, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (974, 7, 111, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (975, 7, 112, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (976, 7, 113, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (977, 7, 114, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (978, 7, 115, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (979, 7, 116, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (980, 7, 117, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (981, 7, 118, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (982, 7, 119, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (983, 7, 120, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (984, 7, 121, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (985, 7, 122, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (986, 7, 123, 334);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (987, 7, 124, 260);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (988, 7, 125, 334);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (989, 7, 126, 584);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (990, 7, 161, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (991, 7, 162, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (992, 7, 163, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (993, 7, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (994, 7, 165, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (995, 7, 166, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (996, 7, 167, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (997, 7, 168, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (998, 7, 169, 191);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (999, 7, 170, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1000, 7, 171, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1001, 7, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1002, 7, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1003, 7, 174, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1004, 7, 175, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1005, 7, 177, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1006, 7, 178, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1007, 7, 179, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1008, 7, 180, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1009, 7, 182, 537);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1010, 7, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1011, 7, 184, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1012, 7, 185, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1013, 7, 186, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1014, 7, 187, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1015, 7, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1016, 7, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1017, 7, 191, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1018, 7, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1019, 7, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1020, 7, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1021, 7, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1022, 7, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1023, 7, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1024, 7, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1025, 7, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1026, 7, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1027, 7, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1028, 7, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1029, 7, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1030, 7, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1031, 7, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1032, 7, 225, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1033, 7, 227, 370);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1034, 7, 232, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1035, 7, 233, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1036, 7, 234, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1037, 7, 235, 365);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1038, 7, 241, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1039, 7, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1040, 7, 248, 222);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1041, 7, 249, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1042, 7, 250, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1043, 7, 251, 611);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
8,
'Y',
'Symbol',
'Symbol', 
'normal',
'normal',
1.303);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1044, 8, 32, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1045, 8, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1046, 8, 34, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1047, 8, 35, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1048, 8, 36, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1049, 8, 37, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1050, 8, 38, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1051, 8, 39, 439);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1052, 8, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1053, 8, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1054, 8, 42, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1055, 8, 43, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1056, 8, 44, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1057, 8, 45, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1058, 8, 46, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1059, 8, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1060, 8, 48, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1061, 8, 49, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1062, 8, 50, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1063, 8, 51, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1064, 8, 52, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1065, 8, 53, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1066, 8, 54, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1067, 8, 55, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1068, 8, 56, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1069, 8, 57, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1070, 8, 58, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1071, 8, 59, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1072, 8, 60, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1073, 8, 61, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1074, 8, 62, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1075, 8, 63, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1076, 8, 64, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1077, 8, 65, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1078, 8, 66, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1079, 8, 67, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1080, 8, 68, 612);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1081, 8, 69, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1082, 8, 70, 763);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1083, 8, 71, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1084, 8, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1085, 8, 73, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1086, 8, 74, 631);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1087, 8, 75, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1088, 8, 76, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1089, 8, 77, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1090, 8, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1091, 8, 79, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1092, 8, 80, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1093, 8, 81, 741);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1094, 8, 82, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1095, 8, 83, 592);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1096, 8, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1097, 8, 85, 690);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1098, 8, 86, 439);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1099, 8, 87, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1100, 8, 88, 645);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1101, 8, 89, 795);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1102, 8, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1103, 8, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1104, 8, 92, 863);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1105, 8, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1106, 8, 94, 658);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1107, 8, 95, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1108, 8, 96, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1109, 8, 97, 631);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1110, 8, 98, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1111, 8, 99, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1112, 8, 100, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1113, 8, 101, 439);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1114, 8, 102, 521);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1115, 8, 103, 411);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1116, 8, 104, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1117, 8, 105, 329);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1118, 8, 106, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1119, 8, 107, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1120, 8, 108, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1121, 8, 109, 576);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1122, 8, 110, 521);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1123, 8, 111, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1124, 8, 112, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1125, 8, 113, 521);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1126, 8, 114, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1127, 8, 115, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1128, 8, 116, 439);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1129, 8, 117, 576);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1130, 8, 118, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1131, 8, 119, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1132, 8, 120, 493);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1133, 8, 121, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1134, 8, 122, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1135, 8, 123, 480);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1136, 8, 124, 200);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1137, 8, 125, 480);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1138, 8, 126, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1139, 8, 160, 750);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1140, 8, 161, 620);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1141, 8, 162, 247);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1142, 8, 163, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1143, 8, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1144, 8, 165, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1145, 8, 166, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1146, 8, 167, 753);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1147, 8, 168, 753);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1148, 8, 169, 753);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1149, 8, 170, 753);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1150, 8, 171, 1042);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1151, 8, 172, 987);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1152, 8, 173, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1153, 8, 174, 987);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1154, 8, 175, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1155, 8, 176, 400);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1156, 8, 177, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1157, 8, 178, 411);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1158, 8, 179, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1159, 8, 180, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1160, 8, 181, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1161, 8, 182, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1162, 8, 183, 460);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1163, 8, 184, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1164, 8, 185, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1165, 8, 186, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1166, 8, 187, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1167, 8, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1168, 8, 189, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1169, 8, 190, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1170, 8, 191, 658);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1171, 8, 192, 823);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1172, 8, 193, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1173, 8, 194, 795);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1174, 8, 195, 987);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1175, 8, 196, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1176, 8, 197, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1177, 8, 198, 823);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1178, 8, 199, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1179, 8, 200, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1180, 8, 201, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1181, 8, 202, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1182, 8, 203, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1183, 8, 204, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1184, 8, 205, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1185, 8, 206, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1186, 8, 207, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1187, 8, 208, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1188, 8, 209, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1189, 8, 210, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1190, 8, 211, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1191, 8, 212, 890);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1192, 8, 213, 823);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1193, 8, 214, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1194, 8, 215, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1195, 8, 216, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1196, 8, 217, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1197, 8, 218, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1198, 8, 219, 1042);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1199, 8, 220, 987);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1200, 8, 221, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1201, 8, 222, 987);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1202, 8, 223, 603);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1203, 8, 224, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1204, 8, 225, 329);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1205, 8, 226, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1206, 8, 227, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1207, 8, 228, 786);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1208, 8, 229, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1209, 8, 230, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1210, 8, 231, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1211, 8, 232, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1212, 8, 233, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1213, 8, 234, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1214, 8, 235, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1215, 8, 236, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1216, 8, 237, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1217, 8, 238, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1218, 8, 239, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1219, 8, 241, 329);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1220, 8, 242, 274);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1221, 8, 243, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1222, 8, 244, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1223, 8, 245, 686);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1224, 8, 246, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1225, 8, 247, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1226, 8, 248, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1227, 8, 249, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1228, 8, 250, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1229, 8, 251, 384);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1230, 8, 252, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1231, 8, 253, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1232, 8, 254, 494);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
9,
'Y',
'Times-Bold',
'Times', 
'normal',
'bold',
1.153);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1233, 9, 32, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1234, 9, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1235, 9, 34, 555);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1236, 9, 35, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1237, 9, 36, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1238, 9, 37, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1239, 9, 38, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1240, 9, 39, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1241, 9, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1242, 9, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1243, 9, 42, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1244, 9, 43, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1245, 9, 44, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1246, 9, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1247, 9, 46, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1248, 9, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1249, 9, 48, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1250, 9, 49, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1251, 9, 50, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1252, 9, 51, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1253, 9, 52, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1254, 9, 53, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1255, 9, 54, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1256, 9, 55, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1257, 9, 56, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1258, 9, 57, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1259, 9, 58, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1260, 9, 59, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1261, 9, 60, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1262, 9, 61, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1263, 9, 62, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1264, 9, 63, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1265, 9, 64, 930);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1266, 9, 65, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1267, 9, 66, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1268, 9, 67, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1269, 9, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1270, 9, 69, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1271, 9, 70, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1272, 9, 71, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1273, 9, 72, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1274, 9, 73, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1275, 9, 74, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1276, 9, 75, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1277, 9, 76, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1278, 9, 77, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1279, 9, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1280, 9, 79, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1281, 9, 80, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1282, 9, 81, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1283, 9, 82, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1284, 9, 83, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1285, 9, 84, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1286, 9, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1287, 9, 86, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1288, 9, 87, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1289, 9, 88, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1290, 9, 89, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1291, 9, 90, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1292, 9, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1293, 9, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1294, 9, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1295, 9, 94, 581);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1296, 9, 95, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1297, 9, 96, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1298, 9, 97, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1299, 9, 98, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1300, 9, 99, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1301, 9, 100, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1302, 9, 101, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1303, 9, 102, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1304, 9, 103, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1305, 9, 104, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1306, 9, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1307, 9, 106, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1308, 9, 107, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1309, 9, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1310, 9, 109, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1311, 9, 110, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1312, 9, 111, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1313, 9, 112, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1314, 9, 113, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1315, 9, 114, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1316, 9, 115, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1317, 9, 116, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1318, 9, 117, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1319, 9, 118, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1320, 9, 119, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1321, 9, 120, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1322, 9, 121, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1323, 9, 122, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1324, 9, 123, 394);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1325, 9, 124, 220);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1326, 9, 125, 394);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1327, 9, 126, 520);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1328, 9, 161, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1329, 9, 162, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1330, 9, 163, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1331, 9, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1332, 9, 165, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1333, 9, 166, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1334, 9, 167, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1335, 9, 168, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1336, 9, 169, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1337, 9, 170, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1338, 9, 171, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1339, 9, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1340, 9, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1341, 9, 174, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1342, 9, 175, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1343, 9, 177, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1344, 9, 178, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1345, 9, 179, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1346, 9, 180, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1347, 9, 182, 540);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1348, 9, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1349, 9, 184, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1350, 9, 185, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1351, 9, 186, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1352, 9, 187, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1353, 9, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1354, 9, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1355, 9, 191, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1356, 9, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1357, 9, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1358, 9, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1359, 9, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1360, 9, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1361, 9, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1362, 9, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1363, 9, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1364, 9, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1365, 9, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1366, 9, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1367, 9, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1368, 9, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1369, 9, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1370, 9, 225, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1371, 9, 227, 300);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1372, 9, 232, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1373, 9, 233, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1374, 9, 234, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1375, 9, 235, 330);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1376, 9, 241, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1377, 9, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1378, 9, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1379, 9, 249, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1380, 9, 250, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1381, 9, 251, 556);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
10,
'Y',
'Times-BoldItalic',
'Times', 
'italic',
'bold',
1.139);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1382, 10, 32, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1383, 10, 33, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1384, 10, 34, 555);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1385, 10, 35, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1386, 10, 36, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1387, 10, 37, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1388, 10, 38, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1389, 10, 39, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1390, 10, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1391, 10, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1392, 10, 42, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1393, 10, 43, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1394, 10, 44, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1395, 10, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1396, 10, 46, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1397, 10, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1398, 10, 48, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1399, 10, 49, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1400, 10, 50, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1401, 10, 51, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1402, 10, 52, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1403, 10, 53, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1404, 10, 54, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1405, 10, 55, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1406, 10, 56, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1407, 10, 57, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1408, 10, 58, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1409, 10, 59, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1410, 10, 60, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1411, 10, 61, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1412, 10, 62, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1413, 10, 63, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1414, 10, 64, 832);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1415, 10, 65, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1416, 10, 66, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1417, 10, 67, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1418, 10, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1419, 10, 69, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1420, 10, 70, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1421, 10, 71, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1422, 10, 72, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1423, 10, 73, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1424, 10, 74, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1425, 10, 75, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1426, 10, 76, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1427, 10, 77, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1428, 10, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1429, 10, 79, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1430, 10, 80, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1431, 10, 81, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1432, 10, 82, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1433, 10, 83, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1434, 10, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1435, 10, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1436, 10, 86, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1437, 10, 87, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1438, 10, 88, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1439, 10, 89, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1440, 10, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1441, 10, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1442, 10, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1443, 10, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1444, 10, 94, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1445, 10, 95, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1446, 10, 96, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1447, 10, 97, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1448, 10, 98, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1449, 10, 99, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1450, 10, 100, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1451, 10, 101, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1452, 10, 102, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1453, 10, 103, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1454, 10, 104, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1455, 10, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1456, 10, 106, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1457, 10, 107, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1458, 10, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1459, 10, 109, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1460, 10, 110, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1461, 10, 111, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1462, 10, 112, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1463, 10, 113, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1464, 10, 114, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1465, 10, 115, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1466, 10, 116, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1467, 10, 117, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1468, 10, 118, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1469, 10, 119, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1470, 10, 120, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1471, 10, 121, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1472, 10, 122, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1473, 10, 123, 348);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1474, 10, 124, 220);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1475, 10, 125, 348);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1476, 10, 126, 570);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1477, 10, 161, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1478, 10, 162, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1479, 10, 163, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1480, 10, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1481, 10, 165, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1482, 10, 166, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1483, 10, 167, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1484, 10, 168, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1485, 10, 169, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1486, 10, 170, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1487, 10, 171, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1488, 10, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1489, 10, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1490, 10, 174, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1491, 10, 175, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1492, 10, 177, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1493, 10, 178, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1494, 10, 179, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1495, 10, 180, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1496, 10, 182, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1497, 10, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1498, 10, 184, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1499, 10, 185, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1500, 10, 186, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1501, 10, 187, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1502, 10, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1503, 10, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1504, 10, 191, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1505, 10, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1506, 10, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1507, 10, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1508, 10, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1509, 10, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1510, 10, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1511, 10, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1512, 10, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1513, 10, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1514, 10, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1515, 10, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1516, 10, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1517, 10, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1518, 10, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1519, 10, 225, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1520, 10, 227, 266);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1521, 10, 232, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1522, 10, 233, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1523, 10, 234, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1524, 10, 235, 300);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1525, 10, 241, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1526, 10, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1527, 10, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1528, 10, 249, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1529, 10, 250, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1530, 10, 251, 500);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
11,
'Y',
'Times-Italic',
'Times', 
'italic',
'normal',
1.1);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1531, 11, 32, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1532, 11, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1533, 11, 34, 420);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1534, 11, 35, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1535, 11, 36, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1536, 11, 37, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1537, 11, 38, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1538, 11, 39, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1539, 11, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1540, 11, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1541, 11, 42, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1542, 11, 43, 675);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1543, 11, 44, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1544, 11, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1545, 11, 46, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1546, 11, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1547, 11, 48, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1548, 11, 49, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1549, 11, 50, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1550, 11, 51, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1551, 11, 52, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1552, 11, 53, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1553, 11, 54, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1554, 11, 55, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1555, 11, 56, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1556, 11, 57, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1557, 11, 58, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1558, 11, 59, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1559, 11, 60, 675);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1560, 11, 61, 675);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1561, 11, 62, 675);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1562, 11, 63, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1563, 11, 64, 920);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1564, 11, 65, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1565, 11, 66, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1566, 11, 67, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1567, 11, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1568, 11, 69, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1569, 11, 70, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1570, 11, 71, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1571, 11, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1572, 11, 73, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1573, 11, 74, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1574, 11, 75, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1575, 11, 76, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1576, 11, 77, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1577, 11, 78, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1578, 11, 79, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1579, 11, 80, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1580, 11, 81, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1581, 11, 82, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1582, 11, 83, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1583, 11, 84, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1584, 11, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1585, 11, 86, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1586, 11, 87, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1587, 11, 88, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1588, 11, 89, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1589, 11, 90, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1590, 11, 91, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1591, 11, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1592, 11, 93, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1593, 11, 94, 422);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1594, 11, 95, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1595, 11, 96, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1596, 11, 97, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1597, 11, 98, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1598, 11, 99, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1599, 11, 100, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1600, 11, 101, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1601, 11, 102, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1602, 11, 103, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1603, 11, 104, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1604, 11, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1605, 11, 106, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1606, 11, 107, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1607, 11, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1608, 11, 109, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1609, 11, 110, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1610, 11, 111, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1611, 11, 112, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1612, 11, 113, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1613, 11, 114, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1614, 11, 115, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1615, 11, 116, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1616, 11, 117, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1617, 11, 118, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1618, 11, 119, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1619, 11, 120, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1620, 11, 121, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1621, 11, 122, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1622, 11, 123, 400);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1623, 11, 124, 275);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1624, 11, 125, 400);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1625, 11, 126, 541);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1626, 11, 161, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1627, 11, 162, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1628, 11, 163, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1629, 11, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1630, 11, 165, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1631, 11, 166, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1632, 11, 167, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1633, 11, 168, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1634, 11, 169, 214);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1635, 11, 170, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1636, 11, 171, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1637, 11, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1638, 11, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1639, 11, 174, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1640, 11, 175, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1641, 11, 177, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1642, 11, 178, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1643, 11, 179, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1644, 11, 180, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1645, 11, 182, 523);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1646, 11, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1647, 11, 184, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1648, 11, 185, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1649, 11, 186, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1650, 11, 187, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1651, 11, 188, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1652, 11, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1653, 11, 191, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1654, 11, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1655, 11, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1656, 11, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1657, 11, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1658, 11, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1659, 11, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1660, 11, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1661, 11, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1662, 11, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1663, 11, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1664, 11, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1665, 11, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1666, 11, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1667, 11, 208, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1668, 11, 225, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1669, 11, 227, 276);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1670, 11, 232, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1671, 11, 233, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1672, 11, 234, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1673, 11, 235, 310);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1674, 11, 241, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1675, 11, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1676, 11, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1677, 11, 249, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1678, 11, 250, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1679, 11, 251, 500);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
12,
'Y',
'Times-Roman',
'Times', 
'normal',
'normal',
1.116);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1680, 12, 32, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1681, 12, 33, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1682, 12, 34, 408);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1683, 12, 35, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1684, 12, 36, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1685, 12, 37, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1686, 12, 38, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1687, 12, 39, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1688, 12, 40, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1689, 12, 41, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1690, 12, 42, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1691, 12, 43, 564);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1692, 12, 44, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1693, 12, 45, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1694, 12, 46, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1695, 12, 47, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1696, 12, 48, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1697, 12, 49, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1698, 12, 50, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1699, 12, 51, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1700, 12, 52, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1701, 12, 53, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1702, 12, 54, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1703, 12, 55, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1704, 12, 56, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1705, 12, 57, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1706, 12, 58, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1707, 12, 59, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1708, 12, 60, 564);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1709, 12, 61, 564);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1710, 12, 62, 564);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1711, 12, 63, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1712, 12, 64, 921);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1713, 12, 65, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1714, 12, 66, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1715, 12, 67, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1716, 12, 68, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1717, 12, 69, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1718, 12, 70, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1719, 12, 71, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1720, 12, 72, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1721, 12, 73, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1722, 12, 74, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1723, 12, 75, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1724, 12, 76, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1725, 12, 77, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1726, 12, 78, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1727, 12, 79, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1728, 12, 80, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1729, 12, 81, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1730, 12, 82, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1731, 12, 83, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1732, 12, 84, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1733, 12, 85, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1734, 12, 86, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1735, 12, 87, 944);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1736, 12, 88, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1737, 12, 89, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1738, 12, 90, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1739, 12, 91, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1740, 12, 92, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1741, 12, 93, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1742, 12, 94, 469);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1743, 12, 95, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1744, 12, 96, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1745, 12, 97, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1746, 12, 98, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1747, 12, 99, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1748, 12, 100, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1749, 12, 101, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1750, 12, 102, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1751, 12, 103, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1752, 12, 104, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1753, 12, 105, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1754, 12, 106, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1755, 12, 107, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1756, 12, 108, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1757, 12, 109, 778);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1758, 12, 110, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1759, 12, 111, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1760, 12, 112, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1761, 12, 113, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1762, 12, 114, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1763, 12, 115, 389);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1764, 12, 116, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1765, 12, 117, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1766, 12, 118, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1767, 12, 119, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1768, 12, 120, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1769, 12, 121, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1770, 12, 122, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1771, 12, 123, 480);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1772, 12, 124, 200);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1773, 12, 125, 480);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1774, 12, 126, 541);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1775, 12, 161, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1776, 12, 162, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1777, 12, 163, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1778, 12, 164, 167);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1779, 12, 165, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1780, 12, 166, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1781, 12, 167, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1782, 12, 168, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1783, 12, 169, 180);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1784, 12, 170, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1785, 12, 171, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1786, 12, 172, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1787, 12, 173, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1788, 12, 174, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1789, 12, 175, 556);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1790, 12, 177, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1791, 12, 178, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1792, 12, 179, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1793, 12, 180, 250);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1794, 12, 182, 453);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1795, 12, 183, 350);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1796, 12, 184, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1797, 12, 185, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1798, 12, 186, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1799, 12, 187, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1800, 12, 188, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1801, 12, 189, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1802, 12, 191, 444);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1803, 12, 193, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1804, 12, 194, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1805, 12, 195, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1806, 12, 196, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1807, 12, 197, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1808, 12, 198, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1809, 12, 199, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1810, 12, 200, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1811, 12, 202, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1812, 12, 203, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1813, 12, 205, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1814, 12, 206, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1815, 12, 207, 333);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1816, 12, 208, 1000);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1817, 12, 225, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1818, 12, 227, 276);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1819, 12, 232, 611);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1820, 12, 233, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1821, 12, 234, 889);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1822, 12, 235, 310);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1823, 12, 241, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1824, 12, 245, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1825, 12, 248, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1826, 12, 249, 500);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1827, 12, 250, 722);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1828, 12, 251, 500);


commit;
end;
/



begin

insert into wwv_flow_pdf_fonts (
    id,
    is_standard,
    font_name, 
    family_name, 
    font_style, 
    font_weight,
    line_height )
values (
13,
'Y',
'ZapfDingbats',
'ZapfDingbats', 
'normal',
'normal',
0.963);


insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1829, 13, 32, 278);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1830, 13, 33, 974);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1831, 13, 34, 961);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1832, 13, 35, 974);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1833, 13, 36, 980);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1834, 13, 37, 719);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1835, 13, 38, 789);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1836, 13, 39, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1837, 13, 40, 791);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1838, 13, 41, 690);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1839, 13, 42, 960);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1840, 13, 43, 939);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1841, 13, 44, 549);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1842, 13, 45, 855);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1843, 13, 46, 911);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1844, 13, 47, 933);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1845, 13, 48, 911);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1846, 13, 49, 945);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1847, 13, 50, 974);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1848, 13, 51, 755);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1849, 13, 52, 846);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1850, 13, 53, 762);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1851, 13, 54, 761);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1852, 13, 55, 571);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1853, 13, 56, 677);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1854, 13, 57, 763);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1855, 13, 58, 760);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1856, 13, 59, 759);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1857, 13, 60, 754);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1858, 13, 61, 494);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1859, 13, 62, 552);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1860, 13, 63, 537);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1861, 13, 64, 577);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1862, 13, 65, 692);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1863, 13, 66, 786);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1864, 13, 67, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1865, 13, 68, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1866, 13, 69, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1867, 13, 70, 793);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1868, 13, 71, 794);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1869, 13, 72, 816);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1870, 13, 73, 823);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1871, 13, 74, 789);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1872, 13, 75, 841);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1873, 13, 76, 823);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1874, 13, 77, 833);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1875, 13, 78, 816);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1876, 13, 79, 831);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1877, 13, 80, 923);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1878, 13, 81, 744);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1879, 13, 82, 723);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1880, 13, 83, 749);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1881, 13, 84, 790);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1882, 13, 85, 792);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1883, 13, 86, 695);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1884, 13, 87, 776);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1885, 13, 88, 768);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1886, 13, 89, 792);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1887, 13, 90, 759);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1888, 13, 91, 707);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1889, 13, 92, 708);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1890, 13, 93, 682);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1891, 13, 94, 701);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1892, 13, 95, 826);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1893, 13, 96, 815);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1894, 13, 97, 789);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1895, 13, 98, 789);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1896, 13, 99, 707);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1897, 13, 100, 687);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1898, 13, 101, 696);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1899, 13, 102, 689);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1900, 13, 103, 786);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1901, 13, 104, 787);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1902, 13, 105, 713);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1903, 13, 106, 791);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1904, 13, 107, 785);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1905, 13, 108, 791);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1906, 13, 109, 873);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1907, 13, 110, 761);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1908, 13, 111, 762);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1909, 13, 112, 762);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1910, 13, 113, 759);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1911, 13, 114, 759);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1912, 13, 115, 892);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1913, 13, 116, 892);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1914, 13, 117, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1915, 13, 118, 784);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1916, 13, 119, 438);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1917, 13, 120, 138);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1918, 13, 121, 277);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1919, 13, 122, 415);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1920, 13, 123, 392);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1921, 13, 124, 392);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1922, 13, 125, 668);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1923, 13, 126, 668);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1924, 13, 128, 390);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1925, 13, 129, 390);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1926, 13, 130, 317);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1927, 13, 131, 317);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1928, 13, 132, 276);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1929, 13, 133, 276);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1930, 13, 134, 509);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1931, 13, 135, 509);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1932, 13, 136, 410);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1933, 13, 137, 410);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1934, 13, 138, 234);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1935, 13, 139, 234);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1936, 13, 140, 334);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1937, 13, 141, 334);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1938, 13, 161, 732);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1939, 13, 162, 544);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1940, 13, 163, 544);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1941, 13, 164, 910);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1942, 13, 165, 667);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1943, 13, 166, 760);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1944, 13, 167, 760);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1945, 13, 168, 776);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1946, 13, 169, 595);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1947, 13, 170, 694);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1948, 13, 171, 626);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1949, 13, 172, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1950, 13, 173, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1951, 13, 174, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1952, 13, 175, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1953, 13, 176, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1954, 13, 177, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1955, 13, 178, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1956, 13, 179, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1957, 13, 180, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1958, 13, 181, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1959, 13, 182, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1960, 13, 183, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1961, 13, 184, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1962, 13, 185, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1963, 13, 186, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1964, 13, 187, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1965, 13, 188, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1966, 13, 189, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1967, 13, 190, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1968, 13, 191, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1969, 13, 192, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1970, 13, 193, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1971, 13, 194, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1972, 13, 195, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1973, 13, 196, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1974, 13, 197, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1975, 13, 198, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1976, 13, 199, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1977, 13, 200, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1978, 13, 201, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1979, 13, 202, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1980, 13, 203, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1981, 13, 204, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1982, 13, 205, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1983, 13, 206, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1984, 13, 207, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1985, 13, 208, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1986, 13, 209, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1987, 13, 210, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1988, 13, 211, 788);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1989, 13, 212, 894);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1990, 13, 213, 838);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1991, 13, 214, 1016);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1992, 13, 215, 458);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1993, 13, 216, 748);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1994, 13, 217, 924);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1995, 13, 218, 748);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1996, 13, 219, 918);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1997, 13, 220, 927);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1998, 13, 221, 928);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (1999, 13, 222, 928);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2000, 13, 223, 834);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2001, 13, 224, 873);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2002, 13, 225, 828);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2003, 13, 226, 924);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2004, 13, 227, 924);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2005, 13, 228, 917);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2006, 13, 229, 930);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2007, 13, 230, 931);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2008, 13, 231, 463);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2009, 13, 232, 883);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2010, 13, 233, 836);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2011, 13, 234, 836);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2012, 13, 235, 867);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2013, 13, 236, 867);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2014, 13, 237, 696);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2015, 13, 238, 696);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2016, 13, 239, 874);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2017, 13, 241, 874);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2018, 13, 242, 760);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2019, 13, 243, 946);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2020, 13, 244, 771);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2021, 13, 245, 865);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2022, 13, 246, 771);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2023, 13, 247, 888);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2024, 13, 248, 967);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2025, 13, 249, 888);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2026, 13, 250, 831);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2027, 13, 251, 873);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2028, 13, 252, 927);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2029, 13, 253, 970);
insert into wwv_flow_pdf_std_fnt_glyphs
(id, font_id, char_code, width)
values (2030, 13, 254, 918);


commit;
end;
/

