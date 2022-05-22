--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: vapor_username
--

CREATE TABLE public.songs (
    id uuid,
    sid text,
    name_en text,
    name_jp text,
    bpm text,
    bpm_base bigint,
    packset text,
    "time" bigint,
    side bigint,
    date double precision,
    version text,
    world_unlock boolean,
    remote_download boolean,
    rating_pst bigint,
    rating_prs bigint,
    rating_ftr bigint,
    rating_byd bigint,
    difficulty_pst bigint,
    difficulty_prs bigint,
    difficulty_ftr bigint,
    difficulty_byd bigint,
    notes_pst bigint,
    notes_prs bigint,
    notes_ftr bigint,
    notes_byd bigint,
    chart_designer_pst text,
    chart_designer_prs text,
    chart_designer_ftr text,
    chart_designer_byd text,
    jacket_designer_pst text,
    jacket_designer_prs text,
    jacket_designer_ftr text,
    jacket_designer_byd text,
    jacket_override_pst boolean,
    jacket_override_prs boolean,
    jacket_override_ftr boolean,
    jacket_override_byd boolean,
    artist text
);


ALTER TABLE public.songs OWNER TO vapor_username;

--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: vapor_username
--

COPY public.songs (id, sid, name_en, name_jp, bpm, bpm_base, packset, "time", side, date, version, world_unlock, remote_download, rating_pst, rating_prs, rating_ftr, rating_byd, difficulty_pst, difficulty_prs, difficulty_ftr, difficulty_byd, notes_pst, notes_prs, notes_ftr, notes_byd, chart_designer_pst, chart_designer_prs, chart_designer_ftr, chart_designer_byd, jacket_designer_pst, jacket_designer_prs, jacket_designer_ftr, jacket_designer_byd, jacket_override_pst, jacket_override_prs, jacket_override_ftr, jacket_override_byd, artist) FROM stdin;
8d4b6227-e149-4b10-9547-81aa0289f617	aegleseeker	Aegleseeker		234	234	observer	147	0	1620691204	3.6	f	t	55	88	110	-1	10	16	22	-1	973	1235	1568	-1	⟨RECORD START⟩ 0:	⟨OBSRV⟩ boundary(?°a,?°A)	L₆ː The Void		シエラ	シエラ	シエラ		f	f	f	f	Silentroom vs Frums
bb06609c-7045-4f70-ab93-7632b34f59e1	aiueoon	AI[UE]OON		145	145	omatsuri	142	0	1566432001	2.3	f	t	35	65	95	-1	6	12	18	-1	436	623	989	-1	N[I]TRO	N[I]TRO	N[I]TRO		SiNoe	SiNoe	SiNoe		f	f	f	f	MYUKKE.
88c8ef07-07fa-4a1f-aa88-2ec7b577ebee	akinokagerou	Haze of Autumn	秋の陽炎	180	180	musedash	152	0	1640304000	3.11	f	t	35	70	98	-1	6	14	19	-1	553	733	1077	-1	秋のén	秋のén	秋のén		MiyU	MiyU	MiyU		f	f	f	f	karatoPαnchii feat.はるの
38a6045f-b606-4d7e-9b09-3eb86e95e9de	alexandrite	Alexandrite		146	146	single	143	1	1537142401	1.7	f	t	45	70	100	-1	8	14	20	-1	507	699	1040	-1	東星※空の宝石	東星※空の宝石	東星※空の宝石		シエラ	シエラ	シエラ		f	f	f	f	WAiKURO
110250cf-0dbd-4064-b450-27c891d8ecb9	alicealamode	Alice à la mode		80-134	134	alice	150	0	1606953600	3.3	f	t	25	65	92	-1	4	12	18	-1	436	618	872	-1	Toaster	Toaster	Toaster		シエラ	シエラ	シエラ		f	f	f	f	Masanori Akita
67054c16-a6a4-4d89-9e20-39008d42a2e0	alicessuitcase	Alice's Suitcase		190	190	alice	151	0	1606953602	3.3	f	t	35	60	91	-1	6	12	18	-1	644	660	999	-1	Kurorak	Kurorak	Kurorak		にんにくましまし	にんにくましまし	にんにくましまし		f	f	f	f	Endorfin.
9e70726c-92fc-4d2d-818f-15afd2794f46	altale	Altale		83-90	180	single	152	0	1590537612	3.0	f	t	25	55	97	-1	4	10	19	-1	357	424	690	-1	Kurorak	Kurorak	Kurorak						f	f	f	f	Sakuzyo
56d0a1b9-ba7a-43c4-a7c7-0366c96e3857	alterale	AlterAle		220-245	245	observer_append_2	147	0	1626825601	3.7	f	t	30	60	97	-1	6	12	19	-1	728	881	1277	-1	CERiNG	CERiNG	CERiNG		ちょこ庵	ちょこ庵	ちょこ庵		f	f	f	f	Arik Kau Delay (アラ＆かゆき＆でり）
f866e271-b350-4baa-9ee0-8ffb1eabadae	amazingmightyyyy	AMAZING MIGHTYYYY!!!!		185	185	maimai	138	1	1610064003	3.4	f	t	45	75	107	-1	8	14	21	-1	624	776	1249	-1	AMAZING TOASTYYYY!!!!	AMAZING TOASTYYYY!!!!	AMAZING TOASTYYYY!!!!						f	f	f	f	WAiKURO
4d6d034b-ea3b-4c0c-9bfa-2125100e8df7	amygdata	amygdata		154	154	single	158	1	1585094401	2.6	f	t	40	75	96	-1	8	14	18	-1	504	711	1199	-1	Nitro	Nitro	Nitro		久賀フーナ	久賀フーナ	久賀フーナ		f	f	f	f	nitro
ac57bd8b-c711-4089-bc9d-a6eb505c0fa6	anokumene	Anökumene		186	186	base	118	1	1491868801	1.0	t	f	25	65	92	-1	4	12	18	-1	412	588	851	-1	Toaster	Toaster	Toaster		Khronetic	Khronetic	Khronetic		f	f	f	f	Jun Kuroda
c266e861-320b-4b02-adc9-63e608c93511	antagonism	Antagonism		160	160	vs	139	1	1590537601	3.0	f	t	45	75	99	-1	8	14	19	-1	431	738	1142	-1	Toaster	Toaster	Toaster		リウイチ	リウイチ	リウイチ		f	f	f	f	Yooh vs. siromaru
941f8eb6-9657-457e-82c1-465f51d77a91	antithese	Antithese		172	172	zettai	141	1	1553126402	2.0	f	t	20	50	88	95	4	10	16	18	845	826	877	-1	chaos//engine	chaos//engine	chaos//engine	石樂	釜飯轟々丸 + Khronetic	釜飯轟々丸 + Khronetic	釜飯轟々丸 + Khronetic	釜飯轟々丸 + jht	f	f	f	t	Blacklolita
ce9fc419-0d94-4df3-9f9a-d9f9244887c3	aprilshowers	April showers	四月の雨	79	79	maimai	129	0	1610064000	3.4	f	t	20	55	83	-1	4	10	16	-1	363	544	697	-1	Nitro-100号	Nitro-100号	Nitro-100号						f	f	f	f	cubesato
f771453a-7c9c-4552-9518-ba693d55e07d	arcahv	Arcahv		191	191	vs	165	0	1590537606	3.0	f	f	45	75	99	-1	8	14	19	-1	818	884	1065	-1	∅	∅	∅		シエラ	シエラ	シエラ		f	f	f	f	Feryquitous
ba058921-a948-4256-8b98-adbd8eef4d0e	ascent	Ascent		145	145	nijuusei_append_1	144	0	1636588801	3.9	f	t	30	60	98	-1	6	12	19	-1	455	626	1023	-1	CER↑NG	CER↑NG	Exschwas↑on with CER↑NG		小奈きなこ	小奈きなこ	小奈きなこ		f	f	f	f	TANUKI
b6906239-13c7-4f4a-8bc5-a835e466475c	astraltale	Astral tale		134	134	single	148	1	1541635201	1.8	f	t	45	70	96	-1	8	14	18	-1	445	642	884	-1	Nitro	Nitro	Nitro		岩十	岩十	岩十		f	f	f	f	Noah
6796922e-6a47-4a9c-a9c7-c49312a3df5e	aterlbus	αterlβus		202	202	dynamix	120	1	1498176005	1.1	f	t	40	70	102	-1	8	14	20	-1	505	668	1030	-1	τoastεr	τoastεr	τoastεr						f	f	f	f	Aoi
cfa99114-1c2a-4176-a9a3-a392152356d7	attraqtia	AttraqtiA		202	202	single	158	0	1611187203	3.5	f	t	40	75	104	-1	8	14	20	-1	732	1002	1433	-1	Toaster affected by 'CHUNITHM'	Toaster affected by 'CHUNITHM'	Toaster affected by 'CHUNITHM'		Enji	Enji	Enji		f	f	f	f	かめりあ
21d85b41-7500-46e8-a95d-6cf724927d65	aurgelmir	Aurgelmir		122-230	180	single	137	1	1647993600	3.12	f	t	45	75	104	-1	8	14	20	-1	540	765	1100	-1	夜浪	夜浪	夜浪						f	f	f	f	溝口ゆうま feat. 大瀬良あい
2efb3bab-b506-4b81-98b8-aef12e1b1679	auxesia	Auxesia		183	183	single	122	0	1502323206	1.1	f	t	35	65	93	-1	6	12	18	-1	385	648	1000	-1	Nitroだー！！	Nitroだー！	Nitroだー！		シエラ	シエラ	シエラ		f	f	f	f	ginkiha
e147b6ae-9905-4e10-b0eb-345ee895b4e1	avantraze	Avant Raze		200	200	single	134	1	1575849600	2.4	f	t	35	65	96	-1	6	12	18	-1	580	727	1125	-1	Avant Toast	Avant Toast	Avant Toast		LAM	LAM	LAM		f	f	f	f	Sampling Masters MEGA
a8dd216b-430a-404d-a055-6ca007c1b2ba	avril	Ävril -Flicka i krans-		130	130	base	162	0	1645056006	3.12	t	f	30	60	83	-1	6	12	16	-1	549	607	851	-1	Aster -Får i Vaaris-	Aster -Får i Vaaris-	Aster -Får i Vaaris-		しいたけ	しいたけ	しいたけ		f	f	f	f	Rigël Theatre
14e22d8a-b97e-4c51-babf-00d7ba02de1d	axiumcrisis	Axium Crisis		170	170	yugamu	151	1	1509667207	1.5	t	t	55	85	109	-1	10	16	21	-1	685	1065	1094	-1	The Monolith	The Monolith	The Monolith		シエラ	シエラ	シエラ		f	f	f	f	ak+q
ea89afba-4159-40fb-a71b-7c01b17acb18	babaroque	Babaroque		136	136	base	149	0	1487980807	1.0	t	f	30	65	85	-1	6	12	16	-1	402	645	808	-1	Toaster	Toaster	Toaster						f	f	f	f	cYsmix
1e247a46-9ff9-4071-aa55-8a44e6bbcc3e	badtek	BADTEK		190	190	single	117	1	1597968000	3.1	f	t	40	70	97	-1	8	14	19	-1	532	595	916	-1	Toaster	Toaster	BADTOAST ft. Kurorak		トロ3	トロ3	トロ3		f	f	f	f	EBIMAYO
4bb177dc-1a88-43ee-b674-8eb450904a0c	bassline	Can I Friend You on Bassbook? Lol	ベースラインやってる？ｗ	128	128	single	146	0	1617926400	3.5	f	t	30	65	93	-1	6	12	18	-1	415	548	861	-1	トースト食べる？笑	トースト食べる？笑	トースト食べる？笑						f	f	f	f	かめりあ feat. ななひら
dfcab29a-885c-425f-94aa-4b5f57c4bcec	battlenoone	BATTLE NO.1		200	200	single	132	1	1579046400	2.4	f	t	35	65	97	-1	6	12	19	-1	476	677	1042	-1	Nitro	Nitro	Arcaea Team		Hanamori Hiro	Hanamori Hiro	Hanamori Hiro		f	f	f	f	TANO*C Sound Team
d3907538-375d-462d-ae3b-84053293b5d7	besideyou	Beside You		181	181	alice_append_1	110	0	1607558400	3.3	f	t	25	60	87	-1	4	12	16	-1	526	634	703	-1	CERiNG	CERiNG	CERiNG		にもし	にもし	にもし		f	f	f	f	江口孝宏
b617878e-7613-4332-85ce-b2c57e1d572c	bethere	Be There		164	164	single	133	0	1527811201	1.6	f	t	40	75	94	-1	8	14	18	-1	592	792	982	-1	Nitro	Nitro	Be Nitro		hie	hie	hie		f	f	f	f	PSYQUI
cb60a786-eb8c-4b38-b939-25a27721706f	blacklotus	Black Lotus		200	200	extend	115	1	1590537611	3.0	t	t	30	65	97	-1	6	12	19	-1	653	687	965	-1	Exschwasion	Exschwasion	Exschwasion		百舌谷	百舌谷	百舌谷		f	f	f	f	wa.
b987ce04-931f-4fe4-8e93-068989301136	blackterritory	Black Territory		200	200	zettai	140	1	1553126403	2.0	f	t	30	75	97	-1	6	14	19	-1	627	785	1195	-1	NitroNukeδ	NitroNukeδ	NitroNukeδ		トロ3	トロ3	トロ3		f	f	f	f	DJ Myosuke
6619ca16-b45c-4e63-9f73-14c99f335eb3	blaster	Blaster		180	180	base	137	1	1520553600	1.5	t	f	40	70	93	-1	8	14	18	-1	571	635	1002	-1	k//urorak	k//urorak	k//urorak		LAM	LAM	LAM		f	f	f	f	Massive New Krew
558ad7b7-f5f5-460f-884b-9aa98791774c	blockedlibrary	Blocked Library		148	148	dividedheart	134	1	1639008002	3.10	f	t	35	65	93	-1	6	12	18	-1	449	622	850	-1	Exschwasion	Exschwasion	Exschwasion		めとこ	めとこ	めとこ		f	f	f	f	影虎。
f0febcbd-c887-47ca-b43c-799cc1231fcd	blossoms	Blossoms		138	138	mirai	145	0	1502323201	1.1	f	t	10	40	70	-1	2	8	14	-1	275	383	655	-1	Nitro	Nitro	Nitro		T2Kazuya	T2Kazuya	T2Kazuya		f	f	f	f	T2Kazuya
1f8a4718-bda6-435c-acb9-31a02fc40810	blrink	BLRINK		115	115	prelude	163	1	1583712000	2.5	t	t	35	75	97	-1	6	14	19	-1	400	683	1015	-1	過去の縁	現在の縁	未来の縁		Sta	Sta	Sta		f	f	f	f	Sta
8c2c2e01-3dc0-42fe-a56c-ac4e82d954a5	bluecomet	blue comet		100-172	172	extend	144	0	1629849601	3.8	t	t	35	50	82	-1	6	10	16	-1	494	645	776	-1	Toaster	Toaster	Toaster		Bison	Bison	Bison		f	f	f	f	ああああ
58d38e7a-fced-45f6-9016-62263be12a67	bluerose	Blue Rose		250-295	295	dividedheart	156	0	1639008001	3.10	f	t	20	55	91	-1	4	10	18	-1	595	669	955	-1	CERiNG	CERiNG	CERiNG		チェリム	チェリム	チェリム		f	f	f	f	Cosmograph
aeda8406-4ecb-40c7-b6d1-ae4f01125829	bookmaker	Bookmaker (2D Version)		175	175	base	150	1	1531699201	1.7	t	f	45	65	83	100	8	12	16	20	538	728	1124	1287	Kurorak	Kurorak	Kurorak	Toastmaker	窓壁九真好キ	窓壁九真好キ	窓壁九真好キ	窓壁九真好キ	f	f	f	t	Kobaryo
c5ff7646-0c30-43e1-9264-af98ec197822	brandnewworld	Brand new world		160	160	base	144	0	1494547200	1.0	f	f	20	40	75	-1	4	8	14	-1	322	432	787	-1	Nitro 2.0	Nitro 2.0	Nitro 2.0						f	f	f	f	U-ske
442f8dc8-822a-4c4b-9d04-09220ded224e	buchigireberserker	BUCHiGiRE Berserker		200	200	single	148	1	1600214401	3.2	f	t	50	86	109	-1	10	16	21	-1	850	1046	1412	-1	夜浪	夜浪	東星 vs 夜浪 《BERSERK》						f	f	f	f	REDALiCE vs MASAKI
780601bb-1e12-4920-abac-35d2970614d7	callmyname	Call My Name feat. Yukacco		175	175	single	148	0	1529539201	1.6	f	t	35	60	87	-1	6	12	16	-1	591	653	921	-1	Kurorak	Kurorak	Kuro my Nitro		DJ Poyoshi	DJ Poyoshi	DJ Poyoshi		f	f	f	f	Mameyudoufu
f8152daf-6194-4307-9edf-ddbdeb5d8c21	carminescythe	carmine:scythe		165	165	single	145	1	1523516400	1.6	f	t	40	75	96	-1	8	14	18	-1	493	710	1164	-1	週刊Toaster	週刊Toaster	週刊Toaster		未早	未早	未早		f	f	f	f	かゆき
7ad4e1e9-f37c-4e10-a765-1fee5e473d88	chelsea	Chelsea		174	174	omatsuri	130	0	1566432000	2.3	f	t	30	60	85	-1	6	12	16	-1	388	503	650	-1	TaroNuke	TaroNuke	TaroNuke		Refla	Refla	Refla		f	f	f	f	7mai
41d967af-345b-4aa1-bdd6-ae89374d2e9d	chronostasis	Chronostasis		196	196	base	134	1	1496188800	1.1	f	f	35	75	91	-1	6	14	18	-1	619	812	916	-1	Kurorak	Kurorak	Kurorak						f	f	f	f	黒皇帝
f470caeb-b1ce-4b71-b8b4-5e8f153e8777	climax	Climax		190	190	chunithm_append_1	154	1	1611187200	3.5	f	t	45	75	106	-1	8	14	20	-1	773	988	1367	-1	Nitro -EXTRA ROUND-	Nitro -EXTRA ROUND-	Nitro -EXTRA ROUND-						f	f	f	f	USAO
254d4900-a9aa-4be3-89b5-a84927eeefee	clotho	Clotho and the stargazer	クロートーと星の観測者	230	230	base	139	0	1498176000	1.1	f	f	20	50	75	-1	4	10	14	-1	519	745	1021	-1	小東星	小東星	小東星		yoshimo	yoshimo	yoshimo		f	f	f	f	しーけー
7ffe6090-9497-4251-a269-df015d7a919b	coastalhighway	Coastal Highway		110	110	observer_append_1	149	0	1620691205	3.6	f	t	30	60	86	-1	6	12	16	-1	355	479	732	-1	Exschwasion	Exschwasion	Exschwasion		水視ずみ	水視ずみ	水視ずみ		f	f	f	f	Glitch Droids
419fa881-23e4-4649-882e-ccae12fedce7	conflict	conflict		160	160	yugamu	134	1	1509667206	1.5	f	t	45	75	101	-1	8	14	20	-1	520	731	1056	-1	Toaster	Nitro	toaster + nitro		horte	horte	horte		f	f	f	f	siromaru + cranky
94c11f8a-ea2c-4be0-b037-4d50f23e3cf9	corpssansorganes	corps-sans-organes		105	105	mirai	156	1	1585094402	2.6	t	t	45	75	106	-1	8	14	20	-1	438	615	1077	-1	夜浪「月食」	夜浪「月食」	夜浪「月食」		softmode	softmode	softmode		f	f	f	f	cybermiso
db00130f-c15a-4bf6-ad6e-daf862662103	corruption	Corruption		170	170	zettai	146	1	1553126404	2.0	f	t	30	65	99	-1	6	12	19	-1	664	847	1293	-1	₸öα$†ε₹	₸öα$†ε₹	₸öα$†ε₹		BerryVerrine	BerryVerrine	BerryVerrine		f	f	f	f	3R2
fa96786a-2ff1-4ec8-a3e6-d6b0aaab894a	cosmica	Cosmica		110	110	nijuusei_append_1	145	1	1636588800	3.9	f	t	25	50	82	-1	4	10	16	-1	428	566	773	-1	Nitro	Nitro	Nitro missing Toaster.		シエラ	シエラ	シエラ		f	f	f	f	Nhato
68d9761b-7f0b-44a1-a7ab-0f43f6cd3bc8	crossover	CROSS†OVER		200	200	extend	150	1	1602028801	3.2	t	t	40	65	94	-1	8	12	18	-1	653	810	1094	-1	Exschwasion	Exschwasion	Exschwasion		Aremos	Aremos	Aremos		f	f	f	f	HyuN feat. LyuU
48619ef8-8f1c-4104-ace0-dd8e1534e266	crosssoul	CROSS†SOUL		200	200	single	140	1	1496188803	1.1	f	t	40	70	94	-1	8	14	18	-1	606	823	1081	-1	k//eternal	k//eternal	k//eternal		Khronetic	Khronetic	Khronetic		f	f	f	f	HyuN feat. Syepias
64d87d12-e1ca-4634-9084-0a87333db766	crystalgravity	Crystal Gravity		178	178	observer	124	1	1620691201	3.6	f	t	35	65	94	-1	6	12	18	-1	571	653	872	-1	Exschwasion	Exschwasion	Exschwasion		雨傘ゆん	雨傘ゆん	雨傘ゆん		f	f	f	f	Tanchiky vs. siromaru
94937f65-4c1d-4186-8332-a8243ea49e20	cyaegha	Cyaegha		200	200	zettai	142	1	1553126406	2.0	f	t	55	84	108	-1	10	16	21	-1	760	984	1368	-1	夜浪、旧支配者	夜浪、旧支配者	夜浪、旧支配者		シエラ	シエラ	シエラ		f	f	f	f	USAO
80c2f585-7c8c-429c-9dc0-618ed4ae8a60	cyanine	cyanine		182	182	lanota	152	1	1517443204	1.5	f	t	40	75	106	-1	8	14	20	-1	661	947	1171	-1	夜浪 - Apocalypse	夜浪	夜浪						f	f	f	f	jioyi
7606f199-04f5-455b-b532-26c2da24e2eb	cyberneciacatharsis	Cybernecia Catharsis		184	184	base	133	1	1527811200	1.6	t	f	40	70	95	-1	8	14	18	-1	377	655	946	-1	Kero	Kero	Kero + Nitro		mirimo	mirimo	mirimo		f	f	f	f	Tanchiky
028a79ea-4329-4293-ba3f-079379b7b774	dandelion	Dandelion		169	169	base	159	0	1489968000	1.0	f	f	25	60	85	-1	4	12	16	-1	391	698	921	-1	Nitro	Nitro	Nitro						f	f	f	f	Farhan
47666301-3b09-4456-ad6c-1e3c8b547040	dantalion	Dantalion		186	186	vs	152	1	1590537603	3.0	f	t	50	82	108	-1	10	16	21	-1	731	843	1476	-1	夜浪	東星	夜浪 X 東星 "The Lost"		Rolua	Rolua	Rolua		f	f	f	f	Team Grimoire
3a8d90cc-14f6-4cf1-aec7-9254b47e888e	darakunosono	Illegal Paradise	堕楽の園	168	168	base	154	1	1531699202	1.7	t	f	20	70	96	-1	4	14	18	-1	535	585	1061	-1	k//eternal	k//eternal	k//eternal + nitro		Illegal Khronetic	Illegal Khronetic	Illegal Khronetic		f	f	f	f	gmtn. (witch's slave)
5913d4d0-1b1c-4295-a171-47b0f775d308	dataerror	DataErr0r		180	180	single	126	1	1496188802	1.1	f	t	30	70	95	-1	6	14	18	-1	502	785	955	-1	ToastErr0r	ToastErr0r	ToastErr0r		Photonskyto	Photonskyto	Photonskyto		f	f	f	f	Cosmograph
968aa6ca-d5cf-4a8b-9ac9-d48efc8cde2e	dazzlehop	Dazzle hop		220	220	ongeki	130	1	1608163201	3.4	f	t	35	60	97	-1	6	12	19	-1	561	571	1022	-1	Kuro rak	Kuro rak	Kuro rak						f	f	f	f	Sampling Masters MEGA
8b533393-ab6c-4136-9bd6-fec22c907139	ddd	DDD		138	138	base	118	0	1647993601	3.12	t	f	25	65	85	-1	4	12	16	-1	363	484	653	-1	én	én	én		わっふゑ	わっふゑ	わっふゑ		f	f	f	f	はがね
8e507cfc-0e3a-4d9e-a435-c117cf0b4992	dement	Dement ~after legend~		210	210	base	126	1	1489968000	1.0	f	f	35	60	75	99	6	12	14	19	548	756	970	1040	Toaster	Toaster	Toaster	Nitro ~ABYSS~					f	f	f	t	Cosmograph
88a4fbaf-dd3a-46a4-96d1-f1a2157e9d88	diode	Diode		132	132	base	140	0	1570492800	2.4	t	f	25	55	81	-1	4	10	16	-1	452	472	709	-1	Kurorak	Kurorak	Kurorak		キッカイキ	キッカイキ	キッカイキ		f	f	f	f	Kolaa
e00835e2-d3a4-4308-af57-5e9a517bfc0e	divinelight	Divine Light of Myriad	光速神授説 - Divine Light of Myriad -	172	172	observer_append_2	142	0	1626825602	3.7	f	t	45	75	108	-1	8	14	21	-1	798	835	1021	-1	東星※神授	東星※神授	東星※神授		緋原ヨウ	緋原ヨウ	緋原ヨウ		f	f	f	f	yoho
085d8753-64d6-4a57-a243-73d14bc1670f	dottodot	Dot to Dot feat. shully		174	174	single	132	0	1556755202	2.0	f	t	30	60	83	-1	6	12	16	-1	453	522	739	-1	•Nitro•	•Nitro•	•Nitro•		DJ Poyoshi	DJ Poyoshi	DJ Poyoshi		f	f	f	f	Mameyudoufu
46f2a9a9-a58e-47af-baa9-cf8711d496db	dreadnought	Dreadnought		96-384	192	single	140	1	1563408000	2.2	f	t	40	70	98	-1	8	14	19	-1	715	897	1099	-1	Nitro	Nitro	Astronomer (Toaster + 東星)						f	f	f	f	Mastermind (xi + nora2r)
2a9f5c7f-ce04-41d2-9d45-591da46aa7f3	dreamgoeson	Dream goes on		174	174	lanota	147	0	1517443200	1.5	f	t	15	50	75	-1	2	10	14	-1	532	751	719	-1	k//eternal	k//eternal	k//eternal						f	f	f	f	Tiny Minim
8237b3a6-cf5e-4e31-a170-efbcea13ecbd	dreaminattraction	Dreamin' Attraction!!		205	205	base	140	0	1509667201	1.5	t	f	45	70	96	-1	8	14	18	-1	592	785	1129	-1	Nitro	Nitro	Nitro						f	f	f	f	翡乃イスカ
28ee555a-c432-4adc-90a3-b8c203c34cca	dxfullmetal	DX Choseinou Full Metal Shojo	DX超性能フルメタル少女	160	160	groovecoaster	115	0	1546992001	1.9	f	t	30	60	98	-1	6	12	19	-1	327	556	808	-1	DX譜面作者フルメタルNitro	DX譜面作者フルメタルNitro	DX譜面作者フルメタルNitro						f	f	f	f	IOSYS TRAX (uno with.ちよこ)
2fe87ca4-85a0-4c91-b099-05acc26e869a	eccentrictale	Eccentric Tale		132	132	alice	137	1	1606953601	3.3	f	t	20	55	84	-1	4	10	16	-1	313	483	732	-1	Nitro	Nitro	Nitro		シエラ	シエラ	シエラ		f	f	f	f	Yamajet
c4d54122-390a-49f7-8ace-6751dcae6801	einherjar	Einherjar Joker		222	222	single	138	1	1579478401	2.5	f	t	40	70	98	-1	8	14	19	-1	582	767	1159	-1	Requiem TaroNuke	Requiem TaroNuke	Requiem TaroNuke		すずなし	すずなし	すずなし		f	f	f	f	DJ Genki vs Gram
4c9558be-8a08-4012-b801-d82872357c9f	empireofwinter	Empire of Winter		175	175	single	140	0	1545523200	1.8	f	t	35	65	90	-1	6	12	18	-1	484	662	920	-1	0°Nitro	0°Nitro	0°Nitro		シエラ + Khronetic	シエラ + Khronetic	シエラ + Khronetic		f	f	f	f	Street
670c3954-195d-489e-9998-d6f84a880a16	enchantedlove	enchanted love		95	190	extend	132	0	1613001600	3.5	t	t	20	45	84	-1	4	8	16	-1	436	617	759	-1	Toaster	Toaster	Toaster		百舌谷	百舌谷	百舌谷		f	f	f	f	linear ring
759fc4eb-8dc7-48b4-b162-b5c292088247	lumia	Lumia		180	180	core	122	0	1487980815	1.0	f	t	25	55	84	95	4	10	16	18	469	438	961	814	Nitro	Nitro	Toaster missing Nitro.	Toaster.	mins	mins	mins	mins	f	f	f	t	sky_delta
d389ec0f-cd7e-402b-9bb7-d47e18aa4c0c	energysynergymatrix	ENERGY SYNERGY MATRIX		160	160	extend	123	1	1631059200	3.8	t	t	35	70	96	-1	6	14	18	-1	471	608	922	-1	POWER NITRO	POWER NITRO	POWER NITRO		からめる	からめる	からめる		f	f	f	f	Tanchiky
31f6cf26-65e9-4ae1-bbb0-f92879bd7cd1	equilibrium	Equilibrium		180	180	vs	137	0	1590537600	3.0	f	t	35	65	94	-1	6	12	18	-1	587	724	951	-1	Kurorak	Kurorak	Kurorak		巻羊	巻羊	巻羊		f	f	f	f	Maozon
a2e46950-94a5-4add-83cd-3544ea1b52ca	espebranch	LunarOrbit -believe in the Espebranch road-	白道、多希望羊と信じありく。	192	192	base	141	1	1535673600	1.7	t	f	35	60	96	-1	6	12	18	-1	624	757	1058	-1	月刊Toaster	月刊Toaster	月刊Toaster		hideo	hideo	hideo		f	f	f	f	Apo11o program ft. 大瀬良あい
9ed916dc-7331-4b24-baff-162ccf186d7d	essenceoftwilight	Essence of Twilight		164	164	core	152	1	1487980816	1.0	t	t	45	70	91	-1	8	14	18	-1	556	767	1204	-1	Nitro	Nitro	Nitro		deel	deel	deel		f	f	f	f	ak+q
b9570434-363f-45c7-8667-98e67f7204c5	etherstrike	Ether Strike		156	156	rei	139	0	1531699207	1.7	t	t	55	83	103	-1	10	16	20	-1	659	837	1170	-1	Zero Sky	Zero Sky	Zero Sky		シエラ	シエラ	シエラ		f	f	f	f	Akira Complex
d56d0f25-f387-4d9f-82d4-3acafe1c54bf	eveninginscarlet	Evening in Scarlet	緋纏いの宵	170	170	single	128	1	1629849600	3.8	f	t	40	70	95	-1	8	14	18	-1	530	638	922	-1	Nitroだー！	Nitroだー！	Nitroだー！		シエラ + yusi.	シエラ + yusi.	シエラ + yusi.		f	f	f	f	Freezer feat.妃苺
b24a10d5-630b-4dde-acc5-160e09e467f7	evoltex	Evoltex (poppi'n mix)		205	205	dynamix	106	0	1498176003	1.1	f	t	20	70	89	-1	4	14	16	-1	297	627	775	-1	k//eternal	k//eternal	k//eternal						f	f	f	f	Arch vs n3pu
dd88efee-b3b8-45b5-83f4-93851a21e3bf	faintlight	Faint Light (Arcaea Edit)		133	133	extend	157	0	1594166400	3.0	t	t	30	60	91	-1	6	12	18	-1	587	711	809	-1	Nitro	Nitro	Nitro		SoU	SoU	SoU		f	f	f	f	Taishi
f6423582-ae9e-4bb4-9b8e-ba2d25760d70	fairytale	Fairytale		189	189	base	139	0	1487980801	1.0	f	f	10	35	70	95	2	6	14	18	336	511	782	932	Toaster	Toaster	Toaster	Nitro in Wonderland	Khronetic	Khronetic	Khronetic	Khronetic	f	f	f	t	chitose
aec75701-68a8-435c-a287-b9e11533c36c	fallensquare	Fallensquare		99	180	single	133	1	1533859202	1.7	f	t	30	70	96	-1	6	14	18	-1	316	486	703	-1	Haruba	Haruba	Haruba		unKn	unKn	unKn		f	f	f	f	Silentroom
fc3200fd-a444-45f1-9f3c-22f3502a6122	farawaylight	Far Away Light		180-216	216	observer	149	0	1620691202	3.6	f	t	45	75	98	-1	8	14	19	-1	656	769	1322	-1	Toaster	Toaster	Toaster		梅まろ	梅まろ	梅まろ		f	f	f	f	technoplanet feat. はるの & 黒沢ダイスケ
72d222bd-ed1b-47d1-aa33-0575da68f85b	feelssoright	Feels So Right feat. Renko		180	180	single	135	0	1594166401	3.0	f	t	35	65	93	-1	6	12	18	-1	594	636	947	-1	Toaster	Toaster	Toaster		DJ Poyoshi	DJ Poyoshi	DJ Poyoshi		f	f	f	f	Mysteka
dafd6e01-7bff-450c-b829-478594bcac85	felis	Felis		155	155	alice	138	0	1606953604	3.3	f	t	40	75	104	-1	8	14	20	-1	463	624	1153	-1	東星	東星	東星		シエラ	シエラ	シエラ		f	f	f	f	M2U
5d4217ef-ec7c-484d-a2b6-556e9f4b1ce1	filament	Filament		170	170	single	143	0	1574726400	2.4	f	t	45	75	97	-1	8	14	19	-1	582	780	991	-1	Toaster	Toaster	Toaster		Hanamori Hiro	Hanamori Hiro	Hanamori Hiro		f	f	f	f	Puru
b06a8f0e-3659-44da-82f2-e4ed5326478b	finalstep	Final Step!		180	180	musedash	137	1	1640304000	3.11	f	t	35	70	94	-1	6	12	18	-1	625	684	1056	-1	CERiNG	CERiNG	CERiNG						f	f	f	f	Lime
cdf085f3-3fd7-4ec1-a31e-45b126673d86	firstsnow	First Snow		88	88	dividedheart	160	0	1639008000	3.10	f	t	25	45	75	-1	4	8	14	-1	366	442	578	-1	Nitro	Nitro	Nitro		ヒトこもる	ヒトこもる	ヒトこもる		f	f	f	f	黒魔
bd6f60d2-4cf3-44e7-91e7-064038613f49	flashback	Flashback		195	195	shiawase	127	0	1494547202	1.0	f	t	20	50	88	-1	4	10	16	-1	356	488	856	-1	Nitro	Nitro	Nitro		yoshimo	yoshimo	yoshimo		f	f	f	f	ARForest
54a85d3d-6cd6-4b7d-a6df-00e4ee21c877	flyburg	Flyburg and Endroll	フライブルクとエンドロウル	180	180	shiawase	148	0	1494547203	1.0	f	t	30	60	90	-1	6	12	18	-1	413	650	930	-1	N	N	NーHelix		アリスシャッハと魔法の楽団	アリスシャッハと魔法の楽団	アリスシャッハと魔法の楽団		f	f	f	f	アリスシャッハと魔法の楽団
1a139a5e-92dd-4b30-979a-e6dbf0d7146a	fractureray	Fracture Ray		200	200	rei	154	0	1531699208	1.7	f	t	60	95	112	-1	12	18	22	-1	983	1343	1279	-1	Volatile Paradox	Absolute Paradox	Paradox Zero		シエラ	シエラ	シエラ		f	f	f	f	Sakuzyo
b159be40-6fe6-4deb-b36d-c4811c3766fb	freefall	FREEF4LL		170	170	base	152	1	1570492801	2.4	t	f	40	70	86	-1	8	14	16	-1	589	782	1023	-1	N↓TRO	N↓TRO	N↓TRO		きらばがに	きらばがに	きらばがに		f	f	f	f	YUKIYANAGI
fa32561c-e6f0-4caf-bb57-2e389ff5751a	galaxyfriends	Galaxy Friends		300	300	single	129	1	1602028800	3.2	f	t	35	60	98	-1	6	12	19	-1	474	572	1013	-1	Nitrome X	Nitrome X	Nitrome X						f	f	f	f	Kobaryo
7b0a03ac-4ffb-4208-81a4-101dc608c21b	garakuta	Garakuta Doll Play		256	256	chunithm	125	1	1558573200	2.1	f	t	45	65	104	-1	8	12	20	-1	444	572	1035	-1	Arcaea Charting Team【Royal Flush】	Arcaea Charting Team【Royal Flush】	Arcaea Charting Teamからの挑戦状 						f	f	f	f	t+pazolite
e33bd18e-a657-4b95-8535-439c1411c055	gekka	Gekka (Short Version)		132	132	extend	164	0	1590537609	3.0	t	t	40	60	86	-1	8	12	16	-1	559	628	817	-1	Nitro	Nitro	Nitro		SoU	SoU	SoU		f	f	f	f	Nhato
52ad9b25-6814-467c-91ce-afd8c996aa47	genesis	Genesis		132	132	mirai	134	1	1502323204	1.1	f	t	20	55	82	-1	4	10	16	-1	275	399	713	-1	Haruba	Haruba	Haruba		RiceGnat	RiceGnat	RiceGnat		f	f	f	f	Iris
f485a382-a5d0-43f0-aec0-c8b88ae2a2a1	gengaozo	G e n g a o z o		153	153	extend	165	1	1632873600	3.8	t	t	40	75	103	-1	8	14	20	-1	580	870	1353	-1	_ P A S T	_ P R E S E N T	_ F U T U R E						f	f	f	f	-45
db98774d-2158-4dec-9848-227aae084758	genocider	GENOCIDER		250-390	250	wacca	139	1	1628553604	3.8	f	t	45	85	107	-1	8	16	21	-1	832	1025	1483	-1	Toaster	Toaster	Toaster		Taiyo Yamamoto	Taiyo Yamamoto	Taiyo Yamamoto		f	f	f	f	DJ Myosuke
035a5885-3043-4e48-a7ab-734f291b7ddc	gimmedablood	GIMME DA BLOOD		87-110	110	single	133	1	1615248000	3.5	f	t	35	70	103	-1	6	14	20	-1	582	737	1093	-1	夜浪	夜浪	夜浪		すずなし	すずなし	すずなし		f	f	f	f	C-Show
1fb1887c-6d64-4ca8-9ba6-8e0805421dbd	givemeanightmare	Give Me a Nightmare		95-190	190	extend	156	1	1590537610	3.0	t	t	35	55	90	-1	6	10	18	-1	676	817	948	-1	CERiNG	CERiNG	CERiNG		mokeo	mokeo	mokeo		f	f	f	f	アリスシャッハと魔法の楽団
e0037246-3d31-461a-969e-1cfc576ad5db	gloryroad	GLORY：ROAD		250	250	shiawase	144	0	1570492802	2.4	t	t	45	70	106	-1	8	14	20	-1	868	999	1479	-1	東星※紅空	東星※紅空	東星※紅空		シエラ	シエラ	シエラ		f	f	f	f	uma vs. モリモリあつし
52a149a8-a780-4973-9eb1-b752bd0b857b	glow	Glow		165	165	extend	138	1	1611187204	3.5	t	t	40	70	93	-1	8	14	18	-1	504	666	916	-1	Exschwasion	Exschwasion	Exschwasion		Taiyo Yamamoto	Taiyo Yamamoto	Taiyo Yamamoto		f	f	f	f	SPACELECTRO
af6c7d76-c6fc-4bd4-b1f1-a8b7a805a32e	goldenslaughterer	goldenslaughterer		133	133	single	184	1	1632873601	3.8	f	t	40	65	97	-1	8	12	19	-1	864	880	1326	-1	Exschwasion	Exschwasion	Exschwasion						f	f	f	f	zts
24d864d0-e215-4f7d-a2d1-354aab89bece	goodtek	GOODTEK (Arcaea Edit)		190	190	base	123	0	1487980809	1.0	t	f	40	65	93	98	8	12	18	19	449	632	968	1103	Nitro	Nitro	Nitro	GOODTOAST	Koyama Mai	Koyama Mai	Koyama Mai	出前	f	f	f	t	EBIMAYO
29f99fd9-dd09-48ba-be71-9dc8be9eea92	gothiveofra	Got hive of Ra		268	268	groovecoaster	126	0	1600214400	3.2	f	t	30	65	98	-1	6	12	19	-1	322	509	794	-1	Groove Nitro	Groove Nitro	Groove Nitro						f	f	f	f	E.G.G.
1eb3ea5f-5d06-4952-a9ea-90ac6d1e759e	gou	Misdeed -la bonté de Dieu et l'origine du mal-	業 -善なる神とこの世の悪について-	190	190	chunithm_append_1	164	0	1611187202	3.5	f	t	55	85	108	-1	10	16	21	-1	814	1070	1522	-1	神の啓示「人類の限界」	神の啓示「人類の希望」	神の啓示「人類の未来」						f	f	f	f	光吉猛修 VS 穴山大輔
494d916a-8b5f-4374-a62d-3828c548270b	grievouslady	Grievous Lady		210	210	yugamu	141	1	1509667208	1.5	f	t	65	93	113	-1	12	18	22	-1	956	1194	1450	-1	迷路第一層	迷路第二層	迷路深層		シエラ	シエラ	シエラ		f	f	f	f	Team Grimoire vs Laur
341d6df6-f01b-4439-85c4-ea1d158ccc9c	grimheart	Grimheart		170	170	base	150	0	1553126400	2.0	t	f	25	50	86	-1	4	10	16	-1	728	699	959	-1	Toaster	Toaster	Toaster						f	f	f	f	Puru
aa51551e-78a8-444e-a2e3-9e4a634b8f25	guardina	γuarδina		202	202	single	131	0	1525305600	1.6	t	t	40	75	105	-1	8	14	20	-1	507	678	1120	-1	τoastεr	τoastεr	τoastεr		姐川 + Khronetic	姐川 + Khronetic	姐川 + Khronetic		f	f	f	f	Aoi
6dae543b-ae4e-4f89-9093-ef80a22df72d	halcyon	Halcyon		191	191	rei	158	0	1531699206	1.7	f	t	55	82	107	-1	10	16	21	-1	662	943	1227	-1	東星※太陽	東星※太陽	東星※太陽						f	f	f	f	xi
be29d617-bed3-43fa-889f-675e9b42bdbd	hallofmirrors	Hall of Mirrors		147	147	tonesphere	153	1	1538870401	1.8	f	t	30	55	82	-1	6	10	16	-1	535	553	898	-1	Toaster	Toaster	Toaster						f	f	f	f	Sta
fa85fc6e-c3a9-4927-a8df-ce6d2c7207ff	harutopia	Harutopia ~Utopia of Spring~	ハルトピア ~Utopia of Spring~	185	185	base	141	0	1502323200	1.1	t	f	10	45	85	-1	2	8	16	-1	444	706	1061	-1	トーストピア  ~Utopia of Toast~	トーストピア  ~Utopia of Toast~	トーストピア  ~Utopia of Toast~						f	f	f	f	A-zu-ra
004d2e42-415b-48e9-8d9d-2c5e48bbc91c	headbonkache	Head BONK ache		132-165	165	single	145	1	1647993602	3.12	f	t	40	70	94	-1	8	14	18	-1	570	725	1061	-1	Nitro	Nitro	Nitro		空読無 白眼	空読無 白眼	空読無 白眼		f	f	f	f	saaa ft. MC iwata Bros.
f1982b5b-9a39-4db4-8281-bd7060249e29	hearditsaid	I've heard it said		165	165	core	127	0	1487980812	1.0	f	t	35	60	81	-1	6	12	16	-1	510	664	864	-1	Toaster	Toaster	Toaster						f	f	f	f	Combatplayer
84576333-7abd-4fbe-ac61-1e3003526cea	heartjackin	Heart Jackin'		160	160	alice_append_1	157	0	1607558401	3.3	f	t	30	55	97	-1	6	10	19	-1	506	543	1112	-1	TaroNuke + Nitro	TaroNuke + Nitro	TaroNuke + Nitro		mins	mins	mins		f	f	f	f	Yu_Asahina
06e228df-a662-466d-8951-049d2305c0d1	heavenlycaress	Heavenly caress		241	241	single	135	0	1572048001	2.4	f	t	35	75	98	-1	6	14	19	-1	855	909	1560	-1	Toaster	Toaster	Toaster		fixro2n	fixro2n	fixro2n		f	f	f	f	Noah
9299db3f-c7ec-4184-ac60-9103b9108277	heavensdoor	Heavensdoor		240	240	prelude	131	1	1563408003	2.2	f	t	45	75	99	107	8	14	19	21	766	869	1101	-1	Kurorak	Kurorak	Black Tea	東星※天の門	yusi. + Khronetic	yusi. + Khronetic	yusi. + Khronetic	nonokuro	f	f	f	t	LeaF
b7e071fc-698e-43ad-9354-53f3a2a0b6c9	hikari	Hikari	光	130	130	tonesphere	142	1	1538870400	1.8	f	t	25	60	81	-1	4	12	16	-1	237	450	684	-1	OptoNuke	OptoNuke	OptoNuke						f	f	f	f	THB
1e5824af-6456-4db4-afc0-aeacfdfad7b9	hivemind	HIVEMIND		252	252	extend	133	1	1626825605	3.7	t	t	40	75	99	-1	8	14	19	-1	995	988	1252	-1	NITRO -unconnected-	NITRO -unconnected-	NITRO -unconnected-		fixro2n	fixro2n	fixro2n		f	f	f	f	かたぎり
f0aa9a32-2f33-4a9f-b80a-980a445f8498	iconoclast	Iconoclast		140	140	yugamu	134	1	1509667203	1.5	f	t	40	70	91	-1	8	14	18	-1	443	593	795	-1	Toaster	Toaster	Toaster		SKT	SKT	SKT		f	f	f	f	Yamajet
720f6dae-2ed5-430e-97d6-3f264e633267	ifi	#1f1e33		181	181	vs	163	1	1590537604	3.0	f	t	55	92	109	-1	10	18	21	-1	765	1144	1576	-1	夜浪	夜浪	夜浪 VS 東星 "Convergence"		望月けい	望月けい	望月けい		f	f	f	f	かめりあ(EDP)
c91daaad-2cbd-4cb3-b79f-e3dde450cc01	ikazuchi	Ikazuchi	怒槌	200	200	chunithm	150	1	1558573201	2.1	f	t	35	75	105	-1	6	14	20	-1	656	976	1347	-1	先史の機械神【夜浪】	先史の機械神【夜浪】	先史の機械神【夜浪】						f	f	f	f	光吉猛修
7474e853-76de-4376-bfdb-ec96533aeddd	impurebird	Impure Bird	不浄な白い鳥	184	184	single	116	0	1500163201	1.1	f	t	20	55	94	-1	4	10	18	-1	350	518	805	-1	Kurorak	Kurorak	Kurorak		Nano Kun	Nano Kun	Nano Kun		f	f	f	f	MIssionary
704e3fdb-2e99-4045-bf1b-69bd178575f2	infinityheaven	Infinity Heaven		160	160	base	154	0	1491868800	1.0	f	f	15	55	75	96	2	10	14	18	336	545	853	986	Nitro	Nitro	Nitro	Nitr∞	Tagtraume	Tagtraume	Tagtraume	Tagtraume	f	f	f	t	HyuN
ee092061-e072-4714-8098-2e6b26682fa6	init	init()		180	180	single	144	1	1642636800	3.11	f	t	40	70	98	-1	8	14	19	-1	713	957	1204	-1	そゐち	そゐち	そゐち		false	false	false		f	f	f	f	kamome sano
15924094-9760-4977-961d-69cdb53f3510	inkarusi	inkar-usi		102	102	base	143	0	1529539200	1.6	f	f	20	40	75	-1	4	8	14	-1	276	326	463	-1	Kurorak	Kurorak	Kurorak		Ancy	Ancy	Ancy		f	f	f	f	DIA
3b9725ea-d6ce-431e-8225-77d808dab2ea	internetoverdose	INTERNET OVERDOSE		163	163	single	118	0	1645056006	3.12	f	t	30	65	84	-1	6	12	16	-1	430	578	657	-1	Nitro Ch.	Nitro Ch.	Nitro Ch.		kinakobooster	kinakobooster	kinakobooster		f	f	f	f	Aiobahn feat. KOTOKO
28c2b912-fed9-4455-b4e0-4dbffd4a0834	izana	IZANA		222	222	single	123	0	1579478402	2.5	f	t	50	83	102	-1	10	16	20	-1	609	836	976	-1	NITRO	NITRO	NITRO		Nagu	Nagu	Nagu		f	f	f	f	t+pazolite vs P*Light
07f23532-7e32-4208-a4f9-e028fad5afb9	journey	Journey		200	200	lanota	134	0	1517443202	1.5	f	t	30	60	86	-1	6	12	16	-1	551	778	997	-1	Kurorak	Kurorak	Kurorak						f	f	f	f	ARForest
62f79046-01f3-49ab-b31c-b97a42864eac	jump	Jump		133	133	alice	149	0	1606953603	3.3	f	t	40	60	90	-1	8	12	18	-1	531	622	841	-1	Nitroだー！	Nitroだー！	Nitroだー！		あるみっく	あるみっく	あるみっく		f	f	f	f	Rasmus Faber
f9990bc7-4fbb-4a1a-800d-23d209f4c6b4	kanagawa	Kanagawa Cyber Culvert	神奈川電脳暗渠	180	180	base	149	0	1496188801	1.1	t	f	10	55	90	98	2	10	18	19	375	707	1111	-1	Nitro	Nitro	Nitro	Exschwas↓on	白鳥怜	白鳥怜	白鳥怜	白鳥怜 + Khronetic	f	f	f	t	南ゆに
0a484ae8-3c24-435d-bfce-a8d24bb2a987	kissinglucifer	Kissing Lucifer		170	170	single	146	1	1645056006	3.12	f	t	45	75	103	-1	8	14	20	-1	639	770	1183	-1	NITRO	NITRO	NITRO		Siino	Siino	Siino		f	f	f	f	ETIA.
aa3e7992-f71b-4f04-bd8b-eb70c8e64868	kyogenkigo	False Embellishment	狂言綺語	155	155	extend	149	1	1626825604	3.7	t	t	35	65	93	-1	6	12	18	-1	576	684	969	-1	Exschwasion	Exschwasion	Exschwasion		あすだ	あすだ	あすだ		f	f	f	f	影虎。 & ikaruga_nex
99c18c05-4a52-4d4e-a4f3-7bcc164f4e38	lapis	Lapis		146	146	extend	138	0	1604016000	3.2	t	t	20	60	94	-1	4	12	18	-1	391	520	920	-1	CERiNG	CERiNG	CERiNG		Khronetic	Khronetic	Khronetic		f	f	f	f	SHIKI
864bbf81-5a85-43cb-8983-f02f6d4fab1e	laqryma	La'qryma of the Wasteland		168	168	single	143	1	1579478400	2.5	f	t	35	65	91	99	6	12	18	19	447	651	956	1161	Toaster	Toaster	Toaster	Nitro 「The Forsaken」	和音ハカ	和音ハカ	和音ハカ	和音ハカ	f	f	f	t	DJ Noriken
739f8f4a-037a-471f-9e42-5a82bced0974	lastcelebration	Last Celebration		238	238	chunithm_append_1	155	1	1611187201	3.5	f	t	35	65	105	-1	6	12	20	-1	969	994	1475	-1	Nitro affected by 'CHUNITHM'	Nitro affected by 'CHUNITHM'	Nitro affected by 'CHUNITHM'						f	f	f	f	Laur vs CK
b2f955eb-5114-46eb-ac14-5b3b61a6fe50	lastendconductor	lastendconductor		139	139	single	184	1	1632873602	3.8	f	t	35	70	94	102	6	14	18	20	726	901	1209	1339	Nitro	Nitro	Nitro	Toaster					f	f	f	f	zts
fd8892d3-853a-4123-8a32-479b6535de73	lazyaddiction	Lazy Addiction		185	185	ongeki	143	0	1608163200	3.4	f	t	25	60	94	-1	4	12	18	-1	462	647	1031	-1	Nitro without Toaster.	Nitro without Toaster.	Nitro without Toaster.						f	f	f	f	sky_delta
50372cbf-0d57-4baf-b95e-9d3b65e527b1	lethaeus	Lethaeus		155	155	mirai	147	1	1502323205	1.1	f	t	35	65	97	-1	6	12	19	-1	480	717	900	-1	夜浪	夜浪	夜浪		softmode	softmode	softmode		f	f	f	f	Silentroom
e4d02523-8d13-47a6-8693-13f84e222551	letyoudivermx	Let you DIVE! (nitro rmx)		185	185	wacca	147	0	1628553602	3.8	f	t	30	65	92	-1	6	12	18	-1	608	819	1049	-1	Nitro	Nitro	Nitro						f	f	f	f	nitro (lowiro)
9ad9ec2c-8951-4228-95c6-d8d6566e6646	libertas	Libertas		160	160	single	131	0	1549843200	1.9	f	t	35	55	92	-1	6	10	18	-1	476	514	947	-1	Kurorak	Kurorak	Kurorak + Nitro		wacca	wacca	wacca		f	f	f	f	Zekk
603f82ab-35d6-4764-86d7-8e7c3f7ec74e	lifeispiano	Life is PIANO		133	133	extend	130	0	1617926401	3.5	t	t	35	55	91	-1	6	10	18	-1	398	437	674	-1	Nitro	Nitro	Nitro						f	f	f	f	Junk
4b4cbf7f-32df-4822-9226-9a29b687ca02	lightningscrew	Lightning Screw		190	190	dividedheart	127	0	1639008004	3.10	f	t	45	75	105	-1	8	14	20	-1	611	811	1192	-1	東星	東星	東星		シエラ	シエラ	シエラ		f	f	f	f	HiTECH NINJA
8c03391a-b7cb-4db7-96d5-c5e32acf532d	lightsofmuse	Lights of Muse		180	180	musedash	100	0	1640304000	3.11	f	t	25	55	87	-1	4	10	16	-1	333	438	580	-1	antymis	antymis	antymis						f	f	f	f	Ayatsugu_Otowa
a9118552-4e7e-4171-809f-1a6622cbb197	linearaccelerator	Linear Accelerator		200 - 211.9	200	tonesphere	124	0	1538870403	1.8	f	t	25	65	98	-1	4	12	19	-1	438	488	905	-1	THE TOAST	THE TOAST	THE TOAST						f	f	f	f	THE SHAFT
c9aa06da-58de-4ecb-b113-ca2706036a76	livefastdieyoung	Live Fast Die Young		153	153	nijuusei_append_1	136	0	1636588802	3.9	f	t	45	81	105	-1	8	16	20	-1	565	837	1292	-1	Nitro	Nitro	Nitro with Toaster.		シエラ	シエラ	シエラ		f	f	f	f	anubasu-anubasu
282441ec-3d8a-4a1d-ad0d-01b9aee320ca	loschen	Löschen		181	181	observer	140	1	1620691203	3.6	f	t	35	70	101	-1	6	14	20	-1	642	850	1235	-1	絶滅	絶滅	絶滅		LOWRISE	LOWRISE	LOWRISE		f	f	f	f	BlackY feat. Risa Yuzuki
7ee6d9e5-309e-4ec9-a6a9-84b8d1b24ae2	lostcivilization	Lost Civilization		75 - 210	210	base	125	1	1487980808	1.0	f	f	40	70	92	98	8	14	18	19	462	690	986	1061	Toaster	Toaster	Toaster	Nitro affected by Nitro				みしゃも + yoshimo	f	f	f	t	Laur vs CK
1f3be41d-8dfc-459c-aab8-a8b107e98dbb	lostdesire	Lost Desire		170	170	vs	158	1	1590537602	3.0	t	t	40	75	98	-1	8	14	19	-1	684	871	1154	-1	Darkest Dream	Darkest Dream	Darkest Dream		シエラ	シエラ	シエラ		f	f	f	f	Powerless feat. Sennzai
d7b00c4a-9928-4db2-8211-24896ddf88bb	lucifer	Lucifer		165	165	base	132	1	1487980804	1.0	t	f	35	55	82	-1	6	10	16	-1	424	506	861	-1	Nitro	Nitro	Nitro						f	f	f	f	chitose
fb55071e-cdf5-4d34-b00e-a205f2e04912	macromod	Macrocosmic Modulation		170	170	single	147	0	1645056006	3.12	f	t	40	75	98	-1	8	14	19	-1	608	794	1117	-1	Exschwas↕on	Exschwas↕on	Exschwas↕on		装甲枕	装甲枕	装甲枕		f	f	f	f	JAKAZiD
df567034-3ff8-490a-9de0-5e12f80d7670	mahoroba	MAHOROBA		195	195	single	122	0	1596758400	3.0	f	t	30	65	95	-1	6	12	18	-1	422	632	828	-1	Nitro	Nitro	TaroNuke + Nitro		そゐち	そゐち	そゐち		f	f	f	f	Zekk
4f6931da-7fc5-4b66-a5c7-3e5ce3b437f3	maliciousmischance	Malicious Mischance		155	155	single	138	1	1599177600	3.1	f	t	40	75	101	-1	8	14	20	-1	510	706	1126	-1	×NITRO×	×NITRO×	×NITRO×		nonokuro	nonokuro	nonokuro		f	f	f	f	s-don
03e56ce4-fa44-4283-a00c-3b3613c40da0	mazenine	Maze No.9	九番目の迷路	159	159	rei	145	0	1531699203	1.7	f	t	30	35	89	-1	6	6	16	-1	494	445	775	-1	小東星	小東星	小東星		アリスシャッハと魔法の楽団	アリスシャッハと魔法の楽団	アリスシャッハと魔法の楽団		f	f	f	f	アリスシャッハと魔法の楽団
384c38c9-a482-468d-ad26-e1b85fe5b695	mazymetroplex	Mazy Metroplex		155	155	wacca	129	0	1628553603	3.8	f	t	30	75	97	-1	6	14	19	-1	453	704	952	-1	Exschwasion	Exschwasion	Exschwasion						f	f	f	f	aran
716932df-7d45-4ccb-bd8d-d33bbee804c6	medusa	Medusa		165	165	musedash	124	1	1640304000	3.11	f	t	45	70	102	-1	8	14	20	-1	550	645	931	-1	Toaster	Toaster	Toaster						f	f	f	f	HiTECH NINJA
9eb2fd49-bb69-4337-8123-4ccae8727d0f	melodyoflove	A Wandering Melody of Love	迷える音色は恋の唄	165	165	omatsuri	134	0	1566432002	2.3	f	t	35	75	97	-1	6	14	19	-1	422	670	931	-1	恋のToaster	恋のToaster	恋のToaster		シエラ	シエラ	シエラ		f	f	f	f	からとPαnchii少年 feat.はるの
b4c59cc9-393c-4655-8ba8-24a17580f1d8	memoryfactory	memoryfactory.lzh		100	180	core	132	0	1487980813	1.0	f	t	25	55	89	-1	4	10	16	-1	308	448	672	-1	Nitro	Nitro	Nitro		Frums	Frums	Frums		f	f	f	f	Frums
677a0cf6-f2b6-42b0-9b12-a243710f482c	memoryforest	Memory Forest		178	178	nijuusei	144	0	1521763203	1.6	f	t	35	60	98	-1	6	12	19	-1	639	726	978	-1	Kurorak	Kurorak	Kurorak		シエラ	シエラ	シエラ		f	f	f	f	ETIA.
38e4b526-c22f-47e8-90e2-34f2d0218f15	merlin	MERLIN		180	180	groovecoaster	129	0	1546992000	1.9	f	t	30	55	89	94	6	10	16	18	315	428	712	881	Got More Taro?	Got More Taro?	Got More Taro?	EXSCHWASiON					f	f	f	f	REDALiCE
c37f1ecd-d1d7-4caa-8520-ec3982394434	metallicpunisher	Metallic Punisher		165	165	single	150	1	1518480000	1.5	f	t	30	70	102	-1	6	14	20	-1	500	846	1238	-1	Kurorak	Kurorak	Black Tea		nonokuro	nonokuro	nonokuro		f	f	f	f	INNOCENT NOIZE
1de5c4a7-f4b3-4919-8cdd-94101d0b4cfc	mirzam	Mirzam		201	201	single	148	1	1568246400	2.3	f	t	40	70	100	-1	8	14	20	-1	662	885	1303	-1	東星※おおいぬ座β星	東星※おおいぬ座β星	東星※おおいぬ座β星		すずなし	すずなし	すずなし		f	f	f	f	Aoi vs. siqlo
be71a6e0-27d8-4ad6-ad9f-6a27d3d9bd0b	modelista	Modelista		165	165	single	128	0	1505520001	1.1	f	t	35	75	100	-1	6	14	20	-1	418	691	1010	-1	NITRO	NITRO	NITRO		yusi.	yusi.	yusi.		f	f	f	f	HiTECH NINJA
b402137d-0216-4aec-aea7-0655ce4c0d2e	monochromeprincess	Monochrome Princess		160	160	base	137	1	1572048000	2.4	t	f	45	75	96	-1	8	14	18	-1	621	756	974	-1	N↕TRO	N↕TRO	N↕TRO		GreeN	GreeN	GreeN		f	f	f	f	polysha
a037e8be-c6f7-4ccc-8abc-871849cf1d66	moonheart	Moonheart		180	180	mirai	133	0	1502323203	1.1	f	t	25	55	84	96	4	10	16	19	449	566	947	1139	Toaster	Toaster	Toaster	Toaster	VMWT	VMWT	VMWT	VMWT + ljc	f	f	f	t	翡乃イスカ
8723a9e0-c427-4ff2-b2a0-03fc216ec809	moonlightofsandcastle	Moonlight of Sand Castle		160	160	dynamix	147	0	1498176001	1.1	f	t	15	50	75	-1	2	10	14	-1	418	394	645	-1	Kurorak	Kurorak	Kurorak						f	f	f	f	旅人E
5255a5ba-a104-4a8e-b9f0-e17ece38ac3a	nekonote	Dancin' on a Cat's Paw	ネコノテ・カリタガール	148	148	base	0	0	1651104004	3.12	t	f	30	60	92	-1	6	12	18	-1	417	593	891	-1	antymis	antymis	antymis		kkkfff2	kkkfff2	kkkfff2		f	f	f	f	Ino(chronoize)
65c8118f-ee5f-49d2-9694-700ef858b6d4	neokosmo	nέο κόsmo		190	190	dividedheart	133	1	1639008003	3.10	f	t	40	75	97	-1	8	14	19	-1	603	791	979	-1	Nitro × Toaster	Nitro × Toaster	Nitro × Toaster		久坂んむり	久坂んむり	久坂んむり		f	f	f	f	ak+q × Street
0cd9c317-eacf-4931-a2f5-b9c3c51afe84	neowings	NEO WINGS		168	168	single	150	1	1645056006	3.12	f	t	40	75	102	-1	8	14	20	-1	591	840	1328	-1	Toaster	Toaster	Toaster		シエラ	シエラ	シエラ		f	f	f	f	SOUND HOLIC feat. Nana Takahashi
6a1eb15b-64e7-467e-b1c1-e5625b247104	nexttoyou	next to you		165	165	nijuusei	134	0	1521763200	1.6	f	t	45	70	88	96	8	14	16	18	454	583	824	954	Nitro	Nitro	Nitro	Toastie	mins	mins	mins	mins	f	f	f	t	uma feat. 橘花音
352ff395-15e4-4408-8d35-655bc1f59c49	nhelv	Nhelv		174.59	174	base	171	1	1533859200	1.7	t	f	30	65	99	-1	6	12	19	-1	647	913	1108	-1	Nitro「Katastrophe」	Nitro「Katastrophe」	Nitro「Katastrophe」		駿	駿	駿		f	f	f	f	Silentroom
ede1f365-ef57-4f2e-8fa1-f60de86043cd	nirvluce	Nirv lucE		260	260	shiawase	129	0	1494547205	1.0	f	t	25	70	103	-1	4	14	20	-1	297	547	980	-1	東星※紅空	東星※紅空	東星※紅空		シエラ	シエラ	シエラ		f	f	f	f	しーけー
ba68d83e-d6f4-4f78-bf1d-55f0f0eefdc4	nulctrl	NULCTRL		100	100	base	151	0	1645056006	3.12	t	f	30	60	95	-1	6	12	18	-1	407	410	715	-1	moonquay [CON]	moonquay [CON]	moonquay [CON]						f	f	f	f	Silentroom
afb8653d-5be0-4507-be2d-24c69e1434d6	oblivia	Oblivia		180	180	base	148	0	1585094400	2.6	f	f	35	50	83	-1	6	10	16	-1	574	517	956	-1	Toaster	Toaster	Toaster		クルエルGZ	クルエルGZ	クルエルGZ		f	f	f	f	Saiph
56a59571-b2ae-4c20-86b9-440a773b24cb	odysseia	ΟΔΥΣΣΕΙΑ		174	174	observer_append_1	144	1	1620691206	3.6	f	t	40	75	95	-1	8	14	18	-1	717	909	1092	-1	ΤΟΑΣΤΕΡ	ΤΟΑΣΤΕΡ	ΤΟΑΣΤΕΡ		SHIROTA.	SHIROTA.	SHIROTA.		f	f	f	f	Sober Bear
25bf2460-72ea-41f2-8823-7619e17755ae	omakeno	OMAKENO Stroke		240	240	groovecoaster	116	1	1546992002	1.9	f	t	30	65	95	101	6	12	18	20	502	616	869	931	Kurorak	Kurorak	Kurorak	NITRO					f	f	f	f	t+pazolite
1a9a5740-34fe-40d5-8763-2adb5512ca9d	omegafour	ω4		71-192	192	ongeki	165	0	1608163203	3.4	f	t	35	75	108	-1	6	14	21	-1	816	943	1393	-1	τ0	τ0	τ0						f	f	f	f	穴山大輔 VS 光吉猛修 VS Kai
73f58f3c-d749-4f40-8664-5bbe531e1ce8	onefr	1F√		130	130	extend	140	0	1590537608	3.0	t	t	25	65	82	-1	4	12	16	-1	411	539	758	-1	Nitro	Nitro	Nitro		terry & nakanome	terry & nakanome	terry & nakanome		f	f	f	f	WHITEFISTS
7cf088f7-6f78-4c85-99d2-0a8378a32411	onelastdrive	One Last Drive		154 - 175	175	base	145	0	1509667200	1.5	f	f	25	55	82	-1	4	10	16	-1	604	564	885	-1	Toaster	Toaster	Toaster						f	f	f	f	REDSHiFT
e88472dd-8fa2-46f1-b20e-3d2f3e96c4ec	oracle	Oracle		152	152	dynamix	143	1	1498176004	1.1	f	t	30	55	93	-1	6	10	18	-1	425	508	963	-1	Nitro	Nitro	Nitro						f	f	f	f	TQ☆
d64b8b2d-8dd4-4fed-af20-638ef57f267c	oshamascramble	Oshama Scramble!		190	190	maimai	121	0	1610064002	3.4	f	t	35	65	100	-1	6	12	20	-1	508	568	1073	-1	Nitro!+9牛乳	Nitro!+99牛乳	Nitro!+999牛乳						f	f	f	f	t+pazolite
8faf9cd8-9aa8-4990-b942-0d5196aa4ed1	ouroboros	ouroboros -twin stroke of the end-		188	188	groovecoaster	149	1	1546992004	1.9	f	t	45	70	107	-1	8	14	21	-1	575	832	1369	-1	Groove 東星	Groove 東星	Groove 東星						f	f	f	f	Cranky VS MASAKI
d3e18a14-c50c-4f2c-a290-61fb58c99098	overwhelm	Overwhelm		200	200	observer_append_1	149	0	1620691207	3.6	f	t	50	85	106	-1	10	16	20	-1	854	1038	1251	-1	夜浪	夜浪	夜浪		緋原ヨウ	緋原ヨウ	緋原ヨウ		f	f	f	f	xi
ef85e903-4b6d-48f3-ba54-a83ddc79bcff	paperwitch	Paper Witch		130	130	observer	149	0	1620691200	3.6	f	t	20	50	87	-1	4	10	16	-1	348	487	793	-1	CERiNG	CERiNG	CERiNG		桶乃かもく	桶乃かもく	桶乃かもく		f	f	f	f	Yu-dachi
977cc686-72d7-4312-880f-c3e018a76c38	paradise	Paradise		126	126	shiawase	150	0	1494547201	1.0	f	t	10	40	75	-1	2	8	14	-1	253	349	729	-1	Nitro	Nitro	Nitro		ましろみ のあ	ましろみ のあ	ましろみ のあ		f	f	f	f	Sound Souler
54879814-2fcc-4a18-940f-413aa1036a14	particlearts	Particle Arts		162-175	175	prelude	146	1	1563408001	2.2	f	t	35	60	88	-1	6	12	16	-1	529	637	925	-1	小東星	小東星	小東星						f	f	f	f	Virtual Self
5d0beb0d-8797-41bc-8783-6679da00879b	partyvinyl	Party Vinyl		132	132	shiawase	110	0	1494547204	1.0	f	t	40	75	95	-1	8	14	18	-1	337	543	800	-1	Party Toaster	Party Toaster	Party Toaster		アサヤ	アサヤ	アサヤ		f	f	f	f	モリモリあつし
bd1a08c1-c114-40b2-8a16-2d1188bbf387	phantasia	Phantasia		153	153	single	152	0	1543449600	1.8	f	t	40	55	92	-1	8	10	18	-1	544	579	952	-1	Toaster	Toaster	Toaster		そゐち	そゐち	そゐち		f	f	f	f	Yunosuke
3213cc80-db6b-464a-9947-0154e6d4b3d7	picopicotranslation	PICO-Pico-Translation!	ピコPico*とらんすれーしょんっ！	185	185	single	0	1	1651104003	3.12	f	t	20	60	93	-1	4	12	18	-1	543	723	1049	-1	Translated by én	Translated by én	Translated by én		九鳥ぱんや & t+pazolite	九鳥ぱんや & t+pazolite	九鳥ぱんや & t+pazolite		f	f	f	f	t+pazolite,ななひら,Cranky,Pico*
f164061b-648f-4169-ada0-cd1beb2ce77c	pragmatism	PRAGMATISM		174	174	core	120	0	1487980817	1.0	t	t	45	86	101	110	8	16	20	22	476	855	942	-1	東星	東星	東星	THE LAST DREAM	シエラ	シエラ	シエラ	シエラ	f	f	f	t	Laur
d45a6754-40fa-4b53-9f1a-60d788c8cec0	prism	Prism		107-109	109	lanota_append_1	0	0	1651104000	3.12	f	t	20	50	80	-1	4	10	16	-1	476	544	785	-1	CERiNG	CERiNG	CERiNG						t	t	f	f	bermei.inazawa ft. Chata
3477020a-66c4-49c0-97a3-1be1435938eb	protoflicker	Protoflicker		140	140	lanota_append_1	0	1	1651104001	3.12	f	t	30	60	98	-1	6	12	19	-1	510	633	1042	-1	antymis <prototype>	antymis <prototype>	antymis <prototype>						t	t	f	f	Slientroom
c90239a2-abc5-43e6-a6db-01a111932d70	purgatorium	Purgatorium		150	150	base	151	1	1537142400	1.7	f	f	25	60	84	96	4	12	16	18	609	641	983	1051	Kurorak	Kurorak	Kurorak	Toaster	michele	michele	michele	michele	f	f	f	t	お月さま交響曲
24634a6f-3430-4f70-b3fa-acb09f13f760	purpleverse	Purple Verse		170	170	extend	145	1	1606953605	3.3	t	t	40	70	95	-1	8	14	18	-1	558	664	1023	-1	Exschwasion	Exschwasion	Exschwasion		HakureiNeko	HakureiNeko	HakureiNeko		f	f	f	f	Hommarju
c697bda5-0d6b-404e-ae19-d78a63f7b707	qualia	qualia -ideaesthesia-		144	144	base	148	1	1487980810	1.0	t	f	45	70	91	97	8	14	18	19	550	875	1022	-1	-chartaesthesia-	-chartaesthesia-	-chartaesthesia-	moonquay -end of chartaesthesia-	Khronetic	Khronetic	Khronetic	khronetic -synesthesia-	f	f	f	t	nitro
5980aad6-77f0-4386-a37b-eb27ba8e596b	quon	Quon		189	189	lanota	143	0	1517443203	1.5	f	t	40	65	97	-1	8	12	19	-1	547	718	991	-1	Nitro	Nitro	Nitro		シエラ	シエラ	シエラ		f	f	f	f	Feryquitous
8f2390c4-ee05-41ce-8c5c-930111241581	quonwacca	Quon		170	170	wacca	124	1	1628553600	3.8	f	t	25	55	87	104	4	10	16	20	425	496	749	1044	CERiNG	CERiNG	CERiNG	XIII: The Journey/Nitro					f	f	f	f	DJ Noriken
3df5206b-a1ce-4c99-a253-085a870d4ccf	rabbitintheblackroom	Rabbit In The Black Room		270	270	base	132	1	1505520000	1.1	t	f	25	55	84	-1	4	10	16	-1	373	467	772	-1	Toaster	Toaster	Toaster		YEONIE	YEONIE	YEONIE		f	f	f	f	Rabbit House
ce99ebe0-dbaa-4cb4-9ecc-fe981b5060e6	reconstruction	REconstruction		180	180	dynamix	128	0	1498176002	1.1	f	t	25	60	84	-1	4	12	16	-1	347	469	825	-1	Nitro	Nitro	Nitro						f	f	f	f	Ryazan
9d784717-de8e-493d-baee-b491e58a0d72	redandblue	Red and Blue		150	150	base	121	1	1509667202	1.5	t	f	40	75	94	100	8	14	18	-1	464	597	845	-1	-chartaesthesia- RED side	side BLUE -chartaesthesia-	-chartaesthesia-\nLEFT=BLUE RED=RIGHT 		Khronetic	Khronetic	Khronetic		f	f	f	f	Silentroom
f88be12f-feba-4e6f-9f50-417ec522db03	redolentshape	Redolent Shape		150	150	single	132	1	1634774400	3.8	f	t	45	75	102	-1	8	14	20	-1	570	717	1088	-1	絶滅	絶滅	絶滅		ＫＴ。	ＫＴ。	ＫＴ。		f	f	f	f	Sanaas
4f02b55b-7447-489a-b1d4-de7055bd2750	reinvent	Reinvent		174	174	base	150	0	1513814400	1.5	f	f	25	65	85	-1	4	12	16	-1	570	703	852	-1	k//eternal	k//eternal	k//eternal + nitro		Khronetic	Khronetic	Khronetic		f	f	f	f	Sound Souler
dbf48444-fd7d-4a8d-bf0c-3e7368e276d2	rekkaresonance	REKKA RESONANCE	烈華RESONANCE	240	240	single	142	0	1625011201	3.6	f	t	50	83	107	-1	10	16	21	-1	860	1051	1212	-1	夜浪 vs Nitro	夜浪 vs Nitro	夜浪 vs Nitro		Nagu + yusi.	Nagu + yusi.	Nagu + yusi.		f	f	f	f	REDALiCE vs Kobaryo
9dc43eb6-2305-4bf5-b950-dc56560f829c	relentless	Relentless		174	174	core	139	1	1487980814	1.0	f	t	45	65	80	-1	8	12	16	-1	607	722	1015	-1	Nitro	Nitro	Nitro		SERXPHIS	SERXPHIS	SERXPHIS		f	f	f	f	Akira Complex
829bf86b-0f3c-44d6-9fe7-d606f83a8b81	revixy	ReviXy		115-185	185	base	158	1	1553126401	2.0	t	f	30	60	90	-1	6	12	18	-1	538	729	1047	-1	Revoke Kurorak	Revoke Kurorak	Revoke Kurorak		出前	出前	出前		f	f	f	f	ikaruga_nex
c16e7d10-53d1-4ccb-9092-195140498c6d	ringedgenesis	Ringed Genesis		160	160	prelude	133	0	1563408004	2.2	f	t	55	84	108	-1	10	16	21	-1	672	860	1146	-1	夜浪 vs Nitro	夜浪 vs Nitro	夜浪 vs Nitro		シエラ	シエラ	シエラ		f	f	f	f	Edelritter
8a0ba0a7-d637-46f0-9844-07eacc754605	rise	Rise		140	140	base	143	0	1487980803	1.0	f	f	25	40	75	-1	4	8	14	-1	322	599	788	-1	Nitro	Nitro	Nitro						f	f	f	f	Combatplayer
d30e4749-991d-46fa-9f53-586d185d4630	romancewars	Romance Wars	vsキミ戦争	187	187	mirai	106	0	1502323202	1.1	f	t	10	40	75	-1	2	8	14	-1	423	378	641	-1	Kurorak	Kurorak	Kurorak		橙乃遥	橙乃遥	橙乃遥		f	f	f	f	U-ske (feat. lueur)
0315d01a-7a69-4f2b-94c7-98aed9bd1e0a	rugie	Rugie		191	191	base	144	1	1541635200	1.8	t	f	30	60	92	-1	6	12	18	-1	566	754	975	-1	k//urorak	k//urorak	k//urorak						f	f	f	f	Feryquitous feat.Sennzai
6d34777c-0eaa-4abd-8689-c8856c13dbaa	saikyostronger	SAIKYO STRONGER	最強STRONGER	205	205	single	142	1	1579478403	2.5	f	t	55	94	110	-1	10	18	22	-1	654	1067	1384	-1	最強FUMEN (夜浪 ft. 東星)	最強FUMEN (夜浪 ft. 東星)	最強FUMEN (夜浪 ft. 東星)		KEI	KEI	KEI		f	f	f	f	REDALiCE vs USAO
bece92f1-d359-4930-8630-5462c7b3e001	sakurafubuki	Sakura Fubuki		175	175	base	118	0	1645056006	3.12	f	f	35	55	93	-1	6	10	18	-1	526	571	837	-1	én	én	én						f	f	f	f	Street
924dbefe-f69d-4b10-a3cb-fb5fa3da2e0e	sayonarahatsukoi	Sayonara Hatsukoi		178	178	base	115	0	1487980800	1.0	f	f	15	45	70	-1	2	8	14	-1	205	305	666	-1	Nitro	Nitro	Toaster						f	f	f	f	REDSHiFT
3eb5c96f-f222-4beb-9383-bbe27ee0b9a3	scarletcage	Scarlet Cage		166	166	single	158	1	1594166402	3.0	f	t	40	70	97	-1	8	14	19	-1	570	711	1195	-1	赤Nitro	赤Nitro	赤Nitro		未早	未早	未早		f	f	f	f	Daisuke Kurosawa
7f4bd921-37d5-4988-a2f0-3ebdb07fc4eb	scarletlance	Scarlet Lance		185	185	groovecoaster	129	0	1546992003	1.9	f	t	40	70	101	-1	8	14	20	-1	517	644	1130	-1	闇運	闇運	闇運						f	f	f	f	MASAKI (ZUNTATA)
92522959-34e4-4cc2-ab66-066c0a8ea44a	seclusion	Seclusion		175	175	observer	138	1	1626825603	3.7	t	t	40	70	105	-1	8	14	20	-1	544	762	1132	-1	Exschwasion	Exschwasion	N•Ex•T		海鵜げそ	海鵜げそ	海鵜げそ		f	f	f	f	Laur feat. Sennzai
0573720e-cd21-43c9-894b-c9f76f2c1304	senkyou	Senkyou		90	180	base	151	0	1574121600	2.4	f	f	30	55	87	-1	6	10	16	-1	627	722	964	-1	k//eternal	k//eternal	k//eternal		未早	未早	未早		f	f	f	f	MYTK
a14021ce-aba8-4f16-b99b-bb67cd4c90ae	seventhsense	7thSense		150	150	maimai	129	1	1610064001	3.4	f	t	30	75	99	-1	6	14	19	-1	360	739	925	-1	石樂	石樂	石樂						f	f	f	f	削除
3e4e1266-8edb-4e1d-ae0f-3e9c33fbf4d9	shadesoflight	Shades of Light in a Transcendent Realm		170	170	base	151	0	1487980806	1.0	t	f	30	60	83	-1	6	12	16	-1	517	789	1067	-1	Nitro	Nitro	Nitro		RiceGnat	RiceGnat	RiceGnat		f	f	f	f	ak+q
54079aed-1764-46a3-82c6-8e5184803704	sheriruth	Sheriruth		185	185	core	137	1	1487980818	1.0	t	t	55	75	102	-1	10	14	20	-1	611	832	1151	-1	夜浪	夜浪	夜浪		シエラ	シエラ	シエラ		f	f	f	f	Team Grimoire
31d97ef5-ad30-4e6d-b5ec-e117e9880b95	sheriruthrmx	Sheriruth (Laur Remix)		200	200	single	124	1	1628553605	3.8	f	t	40	75	105	-1	8	14	20	-1	671	795	1134	-1	Nitro	Nitro	東星※恣意						f	f	f	f	Laur
52dcef8b-b7ea-4936-9178-9e2ad4adde75	silentrush	Silent Rush		158	158	nijuusei	158	1	1521763201	1.6	f	t	25	50	86	-1	4	10	16	-1	416	674	941	-1	TaroNuke	TaroNuke	TaroNuke		CinEraLiA	CinEraLiA	CinEraLiA		f	f	f	f	Soleily
4b018a73-1290-4636-904f-297e9924bc6d	singularity	Singularity		175	175	nijuusei	126	1	1521763204	1.6	f	t	45	75	107	103	8	14	21	-1	534	678	1105	-1	東星	東星	東星※コラプサー		シエラ	シエラ	シエラ		f	f	f	f	ETIA.
a0807618-97eb-4ef5-a29c-5054be1f80a3	smallcloud	Small Cloud Sugar Candy		220	220	observer_append_2	133	0	1626825600	3.7	f	t	30	65	91	-1	6	12	18	-1	548	727	919	-1	én	én	én		のう	のう	のう		f	f	f	f	テヅカ x Aoi feat.桃雛なの
8955aa0d-6ac2-4ce0-bea0-d758bceb4ced	snowwhite	Snow White		150	150	base	148	0	1487980805	1.0	f	f	25	50	84	-1	4	10	16	-1	486	672	978	-1	Toaster	Toaster	Toaster						f	f	f	f	Puru
93397c66-30f3-4ef1-a57d-3d8036cfb7ed	solitarydream	Solitary Dream	虚空の夢	162	162	core	174	0	1552089600	1.9	t	t	40	70	88	-1	8	14	16	-1	712	854	972	-1					シエラ	シエラ	シエラ		f	f	f	f	ak+q feat. Sennzai
bc2ac55e-801b-411f-83ae-b0e9002efc8a	soundwitch	SOUNDWiTCH		170	170	yugamu	108	1	1509667204	1.5	f	t	35	65	99	-1	6	12	19	-1	315	488	785	-1	NiTRO	NiTRO	NiTRO		スズカミ	スズカミ	スズカミ		f	f	f	f	HATE
b1a45df2-e37d-4b23-a7cb-47cdc3dd9e77	specta	Specta		179	179	lanota	136	0	1517443202	1.5	f	t	35	65	95	-1	6	12	18	-1	390	706	1096	-1	Toaster	Toaster	Toaster						f	f	f	f	Junk
87679c12-77c9-44c7-a98e-df6633cf99c9	stager	STAGER (ALL STAGE CLEAR)		145	145	tonesphere	152	0	1538870402	1.8	f	t	30	65	95	-1	6	12	18	-1	453	559	1004	-1	KURORAK	KURORAK	KURORAK						t	t	f	f	Ras
11a57d10-0e11-436e-850c-b7f4458ab1b4	stasis	Stasis		180	180	lanota_append_1	0	0	1651104002	3.12	f	t	45	70	107	-1	8	14	21	-1	848	935	1521	-1	東星	東星	東星						t	t	f	f	Maozon
a268cdff-edbd-4b85-8162-785f6afd6976	strongholds	Strongholds		105	210	nijuusei	137	1	1521763202	1.6	f	t	25	50	92	-1	4	10	18	-1	570	778	922	-1	TaroNuke	TaroNukeΔ	TΔroNuke		八葉	八葉	八葉		f	f	f	f	Yooh
e5278fd8-7239-4f15-82b4-3d881125d3c6	sulfur	Sulfur		182	182	rei	142	0	1531699205	1.7	f	t	40	60	97	-1	8	12	19	-1	458	608	1045	-1	Shirorak	Shirorak	Shirorak		すずなし	すずなし	すずなし		f	f	f	f	ぺのれり
939b0c8c-f57a-4f59-8f49-8509a30edbcb	summerfireworks	Summer Fireworks of Love	彩る夏の恋花火	160	160	single	146	0	1636588803	3.9	f	t	30	65	99	-1	6	12	19	-1	0	0	0	-1	夏のNitro	夏のNitro	夏のNitro		シエラ	シエラ	シエラ		f	f	f	f	karatoPαnchii feat.はるの
6a1d0174-9c68-4110-99a9-93f44abd1b71	suomi	Suomi		125	125	base	129	0	1531699200	1.7	t	f	20	50	75	-1	4	10	14	-1	368	550	818	-1	Toastie	Toastie	Toastie		雨風雪夏	雨風雪夏	雨風雪夏		f	f	f	f	Aire
27e2aaa1-0d04-42e5-b776-27b1361b8cd0	supernova	SUPERNOVA		150	150	base	159	1	1556755201	2.0	t	f	30	60	98	-1	6	12	19	-1	664	564	1123	-1	東超新星	東超新星	東超新星		Khronetic	Khronetic	Khronetic		f	f	f	f	BACO
0940a489-b0b3-4436-ba6e-38bbcfce188e	surrender	Surrender		152	152	single	150	0	1511481600	1.5	f	t	30	65	88	-1	6	12	16	-1	550	721	925	-1	Nitro	Nitro	Nitro		softmode	softmode	softmode		f	f	f	f	void
4925e981-3809-4e8a-9034-6a8f7a69a20f	syro	Syro		178	178	base	141	0	1513814401	1.5	t	f	35	65	93	-1	6	12	18	-1	535	829	1150	-1	Toaster	Toaster	Toaster		RiceGnat	RiceGnat	RiceGnat		f	f	f	f	Mitomoro
edfb71e6-7d98-4a08-81c5-e03ecca89758	take	Bamboo	竹	5-315	219	extend	140	0	1613001601	3.5	t	t	30	65	99	-1	6	12	19	-1	499	631	1050	-1	竹の子	竹の子	竹の子		石王マサト	石王マサト	石王マサト		f	f	f	f	立秋 feat.ちょこ
77c45579-1f48-43f7-8ab4-fa7404c5c509	tempestissimo	Tempestissimo		231	231	vs	137	1	1590537605	3.0	f	t	65	95	106	115	12	18	20	22	919	1034	1254	1540	Prelude - Ouverture	Convergence - Intermezzo	Onslaught - Crescendo	Finale - The Tempest	シエラ	シエラ	シエラ	シエラ	f	f	f	t	t+pazolite
9475e02f-8ed9-4de4-adbc-215b27372e92	teriqma	Teriqma		128	128	single	147	1	1594857600	3.0	f	t	30	65	94	-1	6	12	18	-1	345	579	873	-1	Nitro	Nitro	Nitro						f	f	f	f	owl*tree
a6ffe7ca-0a50-4877-aa9b-d2904c4766f6	themessage	The Message		202	202	rei	140	0	1531699204	1.7	f	t	30	65	97	-1	6	12	19	-1	536	630	992	-1	Toaster	Toaster	Toaster		Shionty + Khronetic	Shionty + Khronetic	Shionty + Khronetic		f	f	f	f	Jun Kuroda
5a3ea02e-7748-470e-a6bc-e20dace00d9a	theultimacy	THE ULTIMACY		200	200	single	148	1	1625011200	3.6	f	t	30	70	97	-1	6	14	19	-1	749	919	1304	-1	東星 vs Toaster	東星 vs Toaster	東星 vs Toaster		fixro2n	fixro2n	fixro2n		f	f	f	f	aran vs Massive New Krew
2fa5a26b-8dd0-4e07-8941-898cfe85886c	tiemedowngently	Tie me down gently		191	191	omatsuri	139	1	1566432003	2.3	f	t	30	55	83	-1	6	10	16	-1	581	535	724	-1	Kurorak	Kurorak	Kurorak		kobuta	kobuta	kobuta		f	f	f	f	溝口ゆうま feat. 大瀬良あい
d6e38ee3-28af-4d9a-bea5-fe2841ffdd02	tiferet	Tiferet		140?	140	tonesphere	147	1	1538870404	1.8	f	t	45	75	106	-1	8	14	20	-1	450	720	1086	-1	夜浪[Spherical]	夜浪[Spherical]	夜浪[Spherical]						f	f	f	f	xi + Sta
424dfda7-9e2b-4528-9cd6-4419eeaba368	toaliceliddell	To: Alice Liddell	アリス・リデルに捧ぐ	222	222	alice_append_1	118	1	1607558402	3.3	f	t	40	70	104	-1	8	14	20	-1	535	674	998	-1	Yours Sincerely, 夜浪	Yours Sincerely, 夜浪	Yours Sincerely, 夜浪		みきさい + Khronetic	みきさい + Khronetic	みきさい + Khronetic		f	f	f	f	モリモリあつし
adab181c-8aa2-4952-b32f-ce565a0df340	trappola	trappola bewitching	妖艶魔女 -trappola bewitching-	190	190	yugamu	120	1	1509667205	1.5	f	t	30	60	100	-1	6	12	20	-1	415	541	1044	-1	Kurorak	Kurorak	k//urorak		Shionty	Shionty	Shionty		f	f	f	f	gmtn.
c283d2ad-c813-425c-998a-b53b7d5a4ed6	turbocharger	Turbocharger		128-170	170	extend	149	0	1623283200	3.6	t	t	25	55	89	-1	4	10	16	-1	419	659	979	-1	Toaster	Toaster	Toaster		志月	志月	志月		f	f	f	f	A/I
c36f3fbe-870d-4199-8040-985ba9a64fba	valhallazero	Valhalla:0		200	200	omatsuri	142	1	1566432004	2.3	f	t	45	70	104	-1	8	14	20	-1	624	893	1173	-1	夜浪	夜浪	夜浪		すずなし	すずなし	すずなし		f	f	f	f	Juggernaut.
6ad34e5a-c557-482c-a968-1513ebd6b185	vandalism	Vandalism		194	194	extend	150	1	1620691208	3.6	t	t	35	60	97	-1	6	12	19	-1	668	685	1087	-1	Kurorak	Kurorak	Kurorak		Asagon.	Asagon.	Asagon.		f	f	f	f	Ashrount
5d895489-2c47-41ae-b869-69c195d8840a	vector	VECTOЯ		200	200	base	142	1	1556755200	2.0	t	f	30	70	94	-1	6	14	18	-1	675	1002	1299	-1	Nitro	Nitro	Nitro		ふぇいフリック	ふぇいフリック	ふぇいフリック		f	f	f	f	WHITEFISTS
fddb6628-12aa-4926-85c3-880fb4575a90	vexaria	Vexaria		180	180	base	129	0	1487980802	1.0	f	f	25	50	70	88	4	10	14	16	369	534	734	785	Nitro	Nitro	Nitro	石樂	Koyama Mai	Koyama Mai	Koyama Mai	Koyama Mai	f	f	f	t	ak+q
9cadc7ed-f827-44d3-9ad8-4aacbf2b28a3	viciousheroism	Vicious Heroism		256	256	zettai	140	1	1553126405	2.0	f	t	40	75	100	-1	8	14	20	-1	430	756	1150	-1	Nitro vanquish Toaster.	Nitro vanquish Toaster.	Nitro vanquish Toaster.		吠L	吠L	吠L		f	f	f	f	Kobaryo
a67d79d8-9075-4887-8955-2d10d080e790	vindication	Vindication		174	174	prelude	149	0	1563408002	2.2	f	t	40	65	96	-1	8	12	18	-1	721	899	1075	-1	Toaster	Toaster	Nitro vs Toaster		EB十	EB十	EB十		f	f	f	f	Laur
24274395-3139-41e5-a3a3-f02d69bbb870	vividtheory	Vivid Theory		178	178	extend	148	0	1590537607	3.0	t	t	20	50	88	-1	4	10	16	-1	447	658	885	-1	TaroNuke	TaroNuke	TaroNuke		Mechari	Mechari	Mechari		f	f	f	f	ak+q
7fbf7c86-01d8-481b-8679-9e6f5ddb527b	viyella	cry of viyella		75 - 180	180	core	127	1	1487980811	1.0	f	t	35	60	85	-1	6	12	16	-1	414	492	791	-1	Toaster	Toaster	Toaster		Khronetic	Khronetic	Khronetic		f	f	f	f	Laur
5e014b96-4efc-4d88-91af-edf94edc5c2b	viyellastears	Viyella's Tears		218	218	ongeki	157	1	1608163202	3.4	f	t	40	70	104	-1	8	14	20	-1	716	942	1403	-1	東星の涙	東星の涙	東星の涙						f	f	f	f	Laur
76153626-8288-4758-b446-649308a5f63a	withu	with U		155	155	wacca	140	0	1628553601	3.8	f	t	25	65	94	-1	4	12	18	-1	448	649	932	-1	én	én	én						f	f	f	f	t+pazolite & Massive New Krew feat. リリィ(CV:青木志貴)
b695e912-ac1c-4cdd-bcea-e2ae8e80ffef	worldexecuteme	world.execute(me);		130	130	base	151	0	1582243200	2.5	f	f	35	55	85	-1	6	10	16	-1	452	582	851	-1	toaster.chart(this);	toaster.chart(this);	toaster.chart(this);		そゐち	そゐち	そゐち		f	f	f	f	Mili
7f9100a5-a653-4c96-b89b-9ede4334efbc	worldvanquisher	World Vanquisher		170	170	chunithm	164	0	1558573202	2.1	t	t	25	55	109	-1	4	10	21	-1	529	759	1452	-1	処刑人【東星】	処刑人【東星】	処刑人【東星】						f	f	f	f	void (Mournfinale)
3bdf1f11-1511-4e1e-b6a3-63fd910aa74d	xanatos	Xanatos		170	170	single	158	1	1605744000	3.2	f	t	40	75	100	-1	8	14	20	-1	735	938	1232	-1	XERiNG	eXschwasion	XERiNG × eXschwasion × NitromeX		クリス	クリス	クリス		f	f	f	f	Tatsh
bf65c352-9f50-470c-8135-c83c283990cf	xeraphinite	Xeraphinite		146	146	single	145	0	1604016001	3.2	f	t	30	70	98	-1	6	14	19	-1	383	648	1048	-1	東星※空の宝石	東星※空の宝石	東星※空の宝石		シエラ	シエラ	シエラ		f	f	f	f	BlackY
5158813a-ec0a-41ba-b206-58ee130dd197	yourvoiceso	Your voice so... feat. Such		176	176	single	150	0	1496188804	1.1	f	t	35	65	94	-1	6	12	18	-1	469	677	1013	-1	Nitro	Nitro	Nitro		DJ Poyoshi	DJ Poyoshi	DJ Poyoshi		f	f	f	f	PSYQUI
358ea61d-f6da-4ac3-a4b2-25f4ddc4e408	yozakurafubuki	Yosakura Fubuki	夜桜吹雪	172	172	single	132	0	1511481601	1.5	f	t	45	70	94	-1	8	14	18	-1	416	582	931	-1	k//eternal	k//eternal	k//eternal		シエラ	シエラ	シエラ		f	f	f	f	A.SAKA
80960cd9-7f60-456f-a522-2e7bb29951d9	ignotus	Ignotus		170	170	base	146	1	1500163200	1.1	t	f	35	65	93	99	6	12	18	-1	579	809	1225	-1	Toaster	Toaster	Toaster		Khronetic	Khronetic	Khronetic		f	f	f	f	ak+q
50ae0ff8-01f5-47ca-832f-4c36dd881646	dropdead	dropdead		50	200	single	137	1	1533859201	1.7	f	t	15	95	91	105	2	18	16	-1	44	1323	823	-1	-chartaesthesia-\nLIMITER:10%	-chartaesthesia-\nLIMITER:100%	-chartaesthesia-\nLIMITER:25% (OVERDRIVE:+100%)		Hanamori Hiro	Hanamori Hiro	Hanamori Hiro		f	f	f	f	Frums
\.


--
-- PostgreSQL database dump complete
--
