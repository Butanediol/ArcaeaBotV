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
-- Name: aliases; Type: TABLE; Schema: public; Owner: vapor_username
--

CREATE TABLE public.aliases (
    id uuid NOT NULL,
    sid text NOT NULL,
    alias text NOT NULL
);


ALTER TABLE public.aliases OWNER TO vapor_username;

--
-- Data for Name: aliases; Type: TABLE DATA; Schema: public; Owner: vapor_username
--

COPY public.aliases (id, sid, alias) FROM stdin;
b4472fa9-19f9-4438-9561-724f932f2734	sayonarahatsukoi	再见初恋
4bd11044-b54f-4c4f-b3b1-7417b281521a	sayonarahatsukoi	失恋
97cfa36d-aac9-4546-98e1-3024d377342f	lostcivilization	LC
e5655814-4434-4ddb-8e00-30aadb268898	lostcivilization	失落的文明
35adce06-110a-4395-83bf-7887230a25b5	lostcivilization	失落文明
b6679bee-dcea-4831-bfa2-274563a3758e	lostcivilization	失落遗迹
3491714d-128a-4ab9-80b5-97984b7da685	lostcivilization	我的天啊你看看都几点了
cf80100e-7950-4296-8148-69e762722f76	goodtek	锤子
b6920bd3-dea7-4c1c-acd7-45d4a1727b27	goodtek	榔头
59960651-8daa-4e92-8bf3-7d0f6e12f67c	goodtek	锤子姐
221f39c2-5865-41dd-b289-582d352652c0	viyella	COV
be21bd9d-a586-4224-a409-48edb79b6a6a	viyella	维耶拉
83a4c303-914b-47db-9ccf-eb8887b4481c	viyella	维耶拉的哭泣
d71eab0a-9763-4b34-ac85-b369ff1bbdbe	lucifer	路西法
c67813cd-c959-47c1-9339-6a378882cfdb	fairytale	FARYTALE
e9360f7c-e9a6-4e71-9875-9543b2f9e3d1	fairytale	草房子
d4fe44a8-8ab5-441e-a1eb-da27fc1abde9	fairytale	风车
63682fb4-4ef9-4e42-9fa6-2b4bcd4d1f2a	fairytale	童话
c7af1cd6-0046-4861-8524-54d0f6e4a3ba	fairytale	风车屋
88837f77-d469-4e4a-9d3a-330f30a85d30	babaroque	BBQ
6227eccb-7ca1-4203-96d2-e1d117a11ce8	babaroque	BBRQ
6c79e6e5-d2e5-4fca-8e15-00e972b67b3a	babaroque	BARBEQUE
902194ad-a9f1-4abf-85a2-19b6a22d20e5	babaroque	烧烤
eefb613a-1453-4299-9404-51f5b1e089ac	babaroque	巴巴洛克
d3b750b9-a103-4a5c-a559-45b290d24594	memoryfactory	工厂
cc13311b-9f44-4ca1-83da-893ede6bbe28	memoryfactory	记忆工厂
48be98ab-1798-4aa8-83b5-33103b7b5be5	snowwhite	雪白
3d4d81c0-f17f-4f1f-95b0-bf91c88ee912	shadesoflight	上界光之影
3c50d266-9e84-4237-9b7a-98cef38f7d33	essenceoftwilight	EOT
f32015b1-d6d2-422d-8b26-af3c697ece0a	pragmatism	白魔王
d12f7d6c-e7fb-4abd-8f2e-15f137878107	pragmatism	实用主义
5a8c0cd3-1e48-429f-8fe5-0a631328caf7	sheriruth	黑魔王
b26abcd2-17c0-43c4-af82-59b1dcfabb67	sheriruth	射日如桃花
5d7b3302-58c7-4702-9b2d-7f1d00dbefd8	sheriruth	对立削苹果
e4d4ed77-98de-4c54-a0bf-675b565bb942	anokumene	ANO
d4e77fb9-cdb5-40ef-b0b4-af8e20da1e25	anokumene	无人区
d5bb0cec-4340-4ba0-a530-ead97438c5cc	anokumene	无人禁区
c75a2ffd-6f0a-4ee8-84a3-d2a163286dee	infinityheaven	无限天堂
7091a3ce-77c2-4b73-bb16-8e1d48aae166	infinityheaven	无尽天堂
817d7feb-e314-40e1-a3c0-8eec537fc6ce	partyvinyl	PV
a780c2e0-4251-42b2-82ff-6c377183683b	partyvinyl	派对乙烯基
49baedfc-35c9-4643-9d07-f9a9cd42a260	flashback	闪回
b976c2b6-155f-4931-afef-2aac6aa9ae02	flashback	闪退
7f5774ae-3b47-4b18-92b3-2e695884b424	flyburg	飞堡
e3de3e16-10a7-4986-b438-efcc7804c6d5	nirvluce	KOU
8bba1544-3799-49e7-8ad3-f2e58d34ba8b	nirvluce	红魔王
e7ead999-e677-43bd-bd18-dbb3ea171c00	nirvluce	表红
3554eeb5-489b-4309-a163-e2fe77b8a6f2	paradise	FARADISE
0753d26f-7fc6-42e3-893e-ec8ab6769f47	paradise	乐园
b786713e-babf-4ecc-8377-faf557e0604e	paradise	小红
68c94b16-d52c-4c4e-a080-c3b00c045ea2	brandnewworld	全新世界
0a5c5cc1-d93d-48c6-9fee-45131d3d9268	dataerror	D0
adf23c90-e4c5-4c20-9aa5-3d34745b2b6f	dataerror	数据错误
923de7e2-2eb8-4025-8fc1-d5088b4e1670	dataerror	数据异常
bf788cb5-fc11-444b-a698-f6381b05b1ce	crosssoul	魂穿
b69ce7dd-c839-469d-81d7-28c8dd8603a1	crosssoul	穿魂
cff84ce9-ceeb-48b0-8a85-195e219404fe	crosssoul	十字
90b6dc6b-c4b0-4cc9-9bfa-27eb2ada4e3b	crosssoul	十字架
15f9a4e3-4bbf-4a4e-a93b-4f7b584259ff	crosssoul	十字灵魂
a9825317-68de-4878-ba39-d57193dba6cb	yourvoiceso	腿
d2713a48-be96-4558-86ea-009d497bc546	yourvoiceso	腿一
f056c3b4-db7e-4d0f-af9c-4dc035c723cf	yourvoiceso	腿1
1bde0fe4-1565-460d-8991-27587ded6f46	yourvoiceso	腿歌1
c8cdccc4-5bae-4604-8f2b-387b31d8c93e	yourvoiceso	你的声音
f5f2f159-147f-4161-99b6-5a69930dcaf6	chronostasis	时停
8fd326a8-1f81-42de-84cf-83e7f23f3ace	chronostasis	时停错觉
c3f76c7d-1fa8-4034-a55f-9602de995432	kanagawa	神奈川
9323ebc3-23c6-4313-8fa0-35f259cc2509	kanagawa	神奈川电脑阴沟
15d6a4e0-5ecd-4835-9d24-84527979fa85	kanagawa	神奈川电脑暗渠
f4f6cf92-8513-4a05-9274-9baf27ef164c	kanagawa	下水道
83cbde62-d60f-48b9-8a1c-7ea0577295e7	moonlightofsandcastle	月光沙堡
f1866e9f-31e4-4803-acc2-d459a4c15c50	moonlightofsandcastle	月下沙堡
a6cbf4c1-a630-489e-86cc-9ae944bb1c69	moonlightofsandcastle	月光沙城
b8d9b0b6-9d79-40e5-8bb9-46250c84cd74	moonlightofsandcastle	沙雕
9b508bcd-6cc3-47a9-a05c-4689478c77fd	reconstruction	RE
5d96011b-6a41-4cef-8cd7-dbf4c446172b	reconstruction	再构筑
6c0ba9d4-df32-4930-9314-04dad818649c	reconstruction	重构
0297bb56-5cb6-4fff-829b-7b5d5bea4c3e	oracle	神谕
a7f4879c-297d-4a1a-a8bf-23a40e0bf901	aterlbus	AB
7549e085-a259-4203-bba4-d5aebfb29db7	aterlbus	黑白
6deee88b-26d8-4781-b9cf-8e33fd589ffa	aterlbus	黑白之战
0fd28b91-f096-4ec4-8e3c-2f6daec29c23	clotho	观星者
209a4e84-aec0-47af-9577-5a5b84b4587d	impurebird	FARBIRD
f1096e2f-d897-4e08-92e4-7f8d7c63956d	impurebird	LOSTBIRD
51da8cf5-7a4c-42de-afe5-2697dd2fdbe2	impurebird	白鸟
bc21dac6-9961-4bc5-a522-5b5d2b5ec842	impurebird	不大鸟
a19ba27f-88a6-4397-9077-c27559b752e1	impurebird	净白鸟
9f410b71-7912-41c0-9304-105f229f82d9	impurebird	脏鸟
95131fe9-aee7-4fe3-bd2f-9050afe3a78c	impurebird	污鸟
978f3de7-deb6-44b9-bfc4-28a9c2685f07	impurebird	不洁白鸟
81b1ee54-77c1-4a0e-ae05-44667bbe90fe	ignotus	IG
2f0a7d6f-e800-4d2a-83d1-37bf8e0bfe2f	lethaeus	黄魔王
542dacd4-6c1c-4a16-9e49-fb670e29b450	lethaeus	外黄
66d13418-a203-4cde-a196-ccf993c968cf	romancewars	与你开战
8b02484d-47b2-441c-810e-16a664cb0b34	moonheart	月心
484a430f-dc94-4d06-9344-c59b81325a93	genesis	起源
a96339aa-d0f9-4f59-a5f5-3c8f060f114c	harutopia	乌托邦
dce5da61-4e71-4665-80b1-4cd004f8b2d3	harutopia	乌托邦之春
9666062d-d8e5-4ea7-80ca-976f3e0031ad	auxesia	夏日
2b80c36b-e04d-4df5-af7c-1985df034498	auxesia	夏歌
64238ca9-afd6-4af8-aa85-4940fe9b7e2e	auxesia	夏日曲
c87381a1-9004-4222-b2f5-13e6edbfd0b8	rabbitintheblackroom	黑兔
9ed2f2a7-d1cb-414b-9df0-fe3b1f2b7aa9	rabbitintheblackroom	兔房
d0c09f3c-df60-44dc-af0d-42a888cc1ede	rabbitintheblackroom	黑兔屋
5def3321-ca64-4ba6-a5cc-cde3aac94449	rabbitintheblackroom	兔子小黑屋
46642cec-34cc-471a-b268-9c8bae6dfadd	rabbitintheblackroom	兔子在小黑屋
51b7bd5c-22a3-4314-8aef-efddc4229dac	rabbitintheblackroom	兔叽
b1623329-c74b-40dd-8e40-160306f45ef3	rabbitintheblackroom	黑兔子
4840f207-77b3-42e2-9098-06dd2dbb4e55	modelista	MODE
771e021c-da8d-4bce-a582-8c5264aa3594	modelista	设计者
0298952f-002c-4fed-b38f-1738ab74f197	soundwitch	音巫
7bdc326a-9116-463b-a20b-400103e3ac5f	trappola	魔女
4eae5599-0d7f-4a4b-a426-630afd71af8d	trappola	妖艳魔女
27c18573-ba38-427d-9761-e46853f579e6	iconoclast	ICO
487fe213-73da-44bb-8589-624a1b4c717f	iconoclast	ICON
c59d60ca-62b0-47ef-b2b6-832f3dfdfb8d	conflict	公交车
20485ad4-8b4e-41f7-bd42-466535c63ca9	conflict	矛盾
a72bc4d7-c9ab-46b8-a95b-4b6158255022	axiumcrisis	AC
86b6493f-b810-4481-b5ee-03cea6ece79f	axiumcrisis	多轴危机
06f0d4c6-4ec9-4af4-b09f-1a40723b87fd	grievouslady	GL
6788f257-c76e-4ce7-a78f-e25223e79d68	grievouslady	里黑
8437cec8-6c43-42d3-91e1-f9346e31e74a	grievouslady	痛女
6a43ccf0-4aed-4991-82e5-15e84870a043	grievouslady	病女
383a4f42-96b2-4f33-a1aa-a4cbca27fc34	grievouslady	疼女
1375ba67-6022-446c-b7bd-37cacb1d06e7	grievouslady	拉开窗帘
e83609c5-b620-4cbb-b928-7cf4bd045530	grievouslady	对立掀窗帘
4d7cf085-ec00-4213-91b9-fa10e0471ab8	grievouslady	对立拉窗帘
46a44c30-8695-4ca3-b615-27a5b25e5d67	grievouslady	悲痛淑女
9e7b21d4-7aaa-4d48-9d77-b635dda0421d	redandblue	RB
3d0134e5-4dde-4f3b-9a72-8de9eef5343f	redandblue	红蓝
41b626f2-7129-4808-a426-dfef5402a270	redandblue	红与蓝
57b95fbe-90d3-4c68-8441-2d869d8b171d	redandblue	红和蓝
6908491a-59f0-4a48-bf12-c13f239e2fb1	redandblue	红与红
91b106bc-d3cc-4af8-b51c-2929d082c7ee	redandblue	红和红
94a67e21-338d-4013-b27d-e0031cfa8b2f	redandblue	双蛇律动
a882ae70-cb91-4411-8eec-fe96e9b476f3	onelastdrive	最后驱力
69f7ea72-4883-42a6-a256-9dcb6e20c1a8	onelastdrive	最后一次开车
cacfa2e2-1fb9-4ee4-8c79-814842833ddf	yozakurafubuki	夜桜
adbea7dc-5290-4a41-9065-172805b890a1	yozakurafubuki	夜樱
af837b1f-a7c4-492c-8e45-cf5507b5c70e	yozakurafubuki	夜樱吹雪
cd12d9b1-d628-41e8-858a-872862399b8b	yozakurafubuki	夜桜吹雪
c54c2b8c-fcb6-4f57-a4a5-9ea2c58b3777	cyanine	花青
c3b37b78-f45d-4102-b838-3bb92be2fffa	cyanine	地球仪
eb56232d-f102-4e17-bebc-2ed3fe2c317a	cyanine	核弹
4cdb7c39-d7ef-4e47-a9f2-893921576453	dreamgoeson	梦想启程
a97aee2c-8c0b-462e-b9b3-81399cce1cc6	specta	灯男
a8d2d2be-72dc-4451-ace9-e8d3fcd90db6	syro	涮羊肉
dff973f2-e1fa-4ab8-8a07-f052912b53f5	silentrush	静冲
d28cdb9c-282e-41ea-8c2b-d3f905db5cd6	singularity	奇点
7c617290-74b2-46db-94bb-57196ed7e996	memoryforest	森林
a1f373dc-725d-4f4b-9248-84eb6a3682cb	memoryforest	记忆森林
3b27d2d8-9926-455e-8a79-9a0e0a0d742d	strongholds	强握
0a556013-f996-425a-b4a9-7895c376aa5a	strongholds	印度蛇
10afac25-c66f-47c8-8294-864a8676594c	strongholds	要塞
5d205a82-5b0b-4fc1-9a82-098be2a32857	metallicpunisher	MP
49c6f943-1c5d-4336-914f-93734dd42654	metallicpunisher	罚金
646cd3c9-fecc-4696-8c7d-e89386168f64	metallicpunisher	金属
e3c70589-3e4a-44c1-82fe-fdfd866292ea	metallicpunisher	金属惩罚者
ec250fab-599d-49eb-bf82-ea8cab32d273	guardina	GD
8f1bc0d5-d7b1-4521-a0a9-92b1d2e14a84	carminescythe	红镰
8de1942a-b209-45e3-aa0b-4eb267f4ca24	bethere	在那里
18018d44-b8d7-4e69-9be9-3bc49d5bbdf2	bethere	在哪里
309a1354-328a-4627-a88b-16ebf6546d15	cyberneciacatharsis	CC
c433bd1f-45e5-4040-8373-98f42dc6c9cc	callmyname	腿二
1a46601a-9747-42a2-8dcd-189c87d8bcf8	callmyname	腿2
4719dcac-5b41-4962-92ce-1099462a7fc1	callmyname	腿歌
11cca154-cc70-4b45-9b7d-f229bbdbb833	callmyname	腿歌2
716a01cc-b0fd-4588-9689-375e07260233	callmyname	冰激凌
683cbfb4-834d-4f55-b37e-a513a979ae0d	mazenine	妹子9
559bc531-4e25-4c4a-af8e-84051bb57b8f	mazenine	妹子⑨
21acf9f8-ce41-4778-8624-6ddcc25cbd1a	mazenine	妹子九
ed9b9ca0-9728-4bfd-8451-0bea188e0fbe	mazenine	Maze9
e8003c8d-12b9-4b44-b19f-7da63f815358	mazenine	迷宫
3ccb458e-1632-4fc4-9526-284bbca0c83d	mazenine	迷路
2810a54f-9046-4506-8191-b47707ef0d58	mazenine	迷宫九
4151a8d1-4304-4e33-891a-918e4d6c9fef	themessage	马杀鸡
c928daf3-efcf-4aa3-9d05-7eac5a17a9f4	themessage	信息
2a2063e3-e5ed-40f0-aed6-6a762fab2892	themessage	短信
f1ebb621-5560-43d6-95a5-d829df065784	sulfur	SULFAR
55bfef30-8891-4bc1-8c40-749694808154	sulfur	硫磺
6a370d1f-1344-4642-9f9e-1fe614c8b61b	halcyon	翡翠鸡
df2d25e2-23a9-435c-b8fb-c6f764d65c89	halcyon	脆皮鸡
e3d436ab-004b-4cd3-81ff-359ad40e8f4c	halcyon	黄金鸡
cc1c58c5-6bc1-4edc-bc85-608ea8514572	halcyon	翡翠鸟
8776e240-8a6f-43c7-8adc-f45a6e51bb0e	etherstrike	ES
290a9ca1-cc67-4bfd-9889-32b4ca7d70e9	etherstrike	乙醚冲击
47ec71e6-89f9-4776-923c-f8a831751938	etherstrike	以太冲击
2c4fd995-e7cd-4778-9ca1-210bccfe5da4	etherstrike	乙醚上头
1037c896-083d-4f74-853a-b4d977d5df49	fractureray	FR
2ed84d8e-1988-4fbd-9a32-083b1dd40562	fractureray	里白
ccbbee9f-8b22-4e09-aafa-0845d3512194	fractureray	碎光
6fd3c7e4-240b-4b63-a6fd-a60a26e12a74	fractureray	高达光
0428e828-a232-45f4-be84-13a7645116fb	fractureray	骨折光
ae4e148c-2bc2-41f6-a0d0-6c39f33f3730	fractureray	骨折光线
ddca6647-5c09-45e6-a332-31dea413cbd0	fractureray	骨折射线
c879b352-e3da-4dfc-ab13-34ed6d2963e0	fractureray	光伸手
d7fad46c-f67d-4f9b-8e0e-9f7020014a0a	fractureray	支离光
39c4e7f5-e4df-4a57-b386-88db958bbc14	fractureray	我很可爱请给我钱
6740e0ed-4c10-4a17-afb0-ad42247eab9b	fractureray	破碎的光线
dfe2230e-992b-4b25-a53e-414a7493265e	fractureray	光伸手要钱
50d14cf4-3740-42dc-b92a-9682c724d568	fractureray	折骨
3e35fdb5-8d13-4387-b2c5-5f363e6c9bda	suomi	扭秧歌
e380ce4c-bedb-4ec6-922d-fadf71bd7b7e	suomi	索米
aaafa6a6-b64c-4943-a355-8e56e9f2b0d5	bookmaker	造书者
ea431f3f-e723-4f14-ad6c-fbe2108ef1cd	bookmaker	做书者
a71447fd-1e99-4c3c-b18d-a62e199fe58f	darakunosono	堕乐园
d154700d-d9bd-4416-b3cd-ef43c5c58a95	darakunosono	堕落乐园
21fe7cc4-3c60-4a60-a84b-0031db4919a5	dropdead	摔死
8dca9ca6-a71a-431a-ab89-36084036522b	dropdead	摔活
8f3d1fa0-4031-4e31-986e-0891f34518c0	fallensquare	塌方
38d124ee-0f7a-420d-9139-31684a553239	fallensquare	塌圆
dcfdaa86-9ded-46a5-a3e8-179e68dd6e91	nhelv	你和驴
967f0ca8-c7f6-4646-91c5-516408155830	nhelv	您和驴
dd36ad03-509a-4ed2-be88-54264dfa1553	nhelv	阿米驴
6fd297e3-eb6f-4dcc-90c3-633eae1bb32b	nhelv	阿米娅
274a82b8-6fad-42be-8506-f9a4a506aa5c	espebranch	白道
4f5bfba8-73a7-4960-b039-fbe620ad2c4b	hikari	光
fcc1e57b-e2df-4260-a31c-9b1039cb37c6	hallofmirrors	镜厅
fd63b4d5-2ba0-40fc-aa95-e53171c5cb5a	linearaccelerator	加速器
d885f4b1-8f0e-40be-b78d-0e718303fad5	linearaccelerator	线性加速器
0569b2f7-804f-4dba-92c0-291acc13ab6f	tiferet	体罚
6aec3fe4-5785-45f1-b840-b4ed32e735a6	alexandrite	变石
13385dfe-d860-4a97-a588-eff679630238	rugie	乳鸽
e85b1207-4cbb-425f-83a6-6191be31e8a8	phantasia	做彩梦
23bc3d56-1b9c-471a-a040-d4218e60f31c	empireofwinter	EOW
dff73c90-bbae-448e-8a45-83315e0212f5	empireofwinter	EOF
23b9f20c-36c1-4617-aa7f-d981274d6efb	empireofwinter	冬之国
820dadd6-e994-4305-ab2c-d5c6fb733420	empireofwinter	冬国
58dba51c-a205-4757-ac2e-d7cd881988e3	merlin	梅林
ded1234a-37e8-4d4b-80e3-2dee0030c1df	dxfullmetal	纵连少女
a2b4301a-fc75-407d-b647-4b387a52d463	dxfullmetal	超纵连少女
141dcf8f-6aed-40d1-b62d-6fb3320f3bba	scarletlance	红X
56179b19-d6da-4f8c-957d-c0f7d09b1802	scarletlance	红叉
e42d132f-d0a2-4762-84a9-827822e4eaaf	scarletlance	红枪
6ebd0345-e4d6-4bf3-89e8-5e0e1a226933	ouroboros	衔尾蛇
22ea6edc-0683-4a2a-ac96-c082209b8f56	ouroboros	纤维蛇
ec10a4ad-a130-427a-8ef8-acd4425558e7	ouroboros	响尾蛇
bd0ac623-db1d-4705-bf45-9e19e654c75d	libertas	自主神
f158aaf7-e4b4-48e2-a453-936088d0b5b3	solitarydream	虚空之梦
2ee24294-0288-4a5e-8c4e-4f8d89b8a1fd	solitarydream	百合
a2a70ea0-2882-49b9-a283-339d85818a33	solitarydream	百合曲
336359ac-81b4-4b7f-b5d7-e37c7324b505	solitarydream	孤梦
4997f47b-73a2-4212-97e6-6755f90c8de7	solitarydream	虚空梦
2cf0e631-1c17-45ba-b0bf-b520335c90d7	corruption	腐败
d6a1064d-d4d8-462d-854a-658e19fe6f89	corruption	死机
ca651b79-43f4-4e5a-91d1-6f0d03757f77	corruption	玩蛇博物馆
8fdcc36d-d1e8-4b3f-9d24-8a66806c82cd	blackterritory	黑域
47c4f413-85af-48e7-8196-915ad55285e8	blackterritory	黑色领域
b3016fd8-c0a2-4b41-a1ad-7a9380a21268	blackterritory	黑色领地
c07c8696-c53b-412c-908d-1600a4604d07	viciousheroism	VH
97c2f1b4-b6b8-48d7-8a5c-d151e20b137f	viciousheroism	反英雄
074917fb-8e0e-4dd1-a831-fb9071507e21	viciousheroism	恶毒的英雄主义
9482456f-42b3-445b-ab65-a7092013841c	viciousheroism	邪雄主义
01b2d747-ebb3-48a9-93e9-ebffd8755b68	cyaegha	绿魔王
d80f7620-8c22-4d0e-bc59-e24945b723cd	cyaegha	花魔王
16280555-4d71-4775-bfa3-9936f77f3013	cyaegha	咲弥
46310d8e-1db2-4d78-99d1-b717583fd096	cyaegha	赛伊格亚
f0b3bf1f-34d7-4f73-8900-493826e77a2e	cyaegha	咲弥削吐司
65e672a9-d132-40ec-9824-8c8839640b9e	cyaegha	咲弥削面包
adfdef48-d8ff-48ce-9371-3e12310aaea1	cyaegha	咲弥削花
daea9236-11e5-4a69-8ff6-e51aab3e8f19	cyaegha	赛伊加
c591298b-fee9-4d20-bf88-63465bfd4c07	cyaegha	塞伊格亚
92f7c995-00e2-4787-9035-6b2f7822d0fe	revixy	屑
0b3c60ed-f0bb-4d7f-8787-a3a21dfb984b	revixy	逊
1343217b-b861-4459-b6cd-c363a9323709	grimheart	黑心
6227bb07-803d-42c4-9f5d-bfdf2800e51a	evoltex	EVO
5ac44929-e1ac-4f44-ac37-0e163e3d7e85	evoltex	E旋风
e649d94e-aad4-4072-a9de-c846106f000c	vector	向量
6d10ceff-5c08-4859-81b8-0fc46613717f	vector	维克托
4bc00461-61d1-4e36-995a-dfadb9c5fb99	supernova	超新星
a6b23f59-7738-4f0c-9dc0-083293067d66	supernova	超级诺娃
ac9ec66b-dace-44b8-a98a-f139e796a52d	supernova	白矮星
f6d252ab-3144-42b1-a4b7-3b230d11e018	dottodot	P2P
81ae0900-169b-4b75-819e-ce3c17276819	dottodot	DTD
8b9bd144-8b8d-43c0-a32c-8cfdbf9605a2	dottodot	D2D
d3c13c55-8ec2-4221-b003-30fab73356f2	dottodot	手歌
3853560e-997f-46c9-a222-a59344afd7d0	dottodot	点对点
b8131f7c-20a5-4c8b-8b83-0b5271bfce38	dottodot	草莓
c0ab1ce3-7605-4264-bc0a-9ba3c3b3f4b7	worldvanquisher	WV
afab06e0-7f08-43e8-b67f-8e1bed90e7fb	worldvanquisher	FTR6
e0d3b065-d85c-439f-94fb-ca7406a7d5d0	worldvanquisher	世征
83fcbc83-f184-4377-927d-a4c3e84031f9	worldvanquisher	世界终结
44182d48-038d-4ca9-8167-61dd45d0990a	worldvanquisher	世界征服者
36ebf4b8-f8ab-4ef9-8de6-6e92213d85b1	worldvanquisher	我是6
56a898ed-31a6-47b4-bb33-4561f66662f1	ikazuchi	怒槌
8a9c7018-8b4e-455e-889a-27531d19947a	ikazuchi	怒锤
7c75a846-bc9a-40b3-9e0f-f4cd9fd01fa9	ikazuchi	木槌
27c45581-f770-45be-8122-db25b358faaa	ikazuchi	怒椎
c2a03619-2517-428b-88e0-59a5809ecdc9	garakuta	GDP
57378953-3a8a-4fdb-9162-7aa8cf303863	garakuta	小丑
3a909b69-4ddc-4f2c-8a02-03858eff6144	garakuta	国内生产总值
422ae909-a728-4943-947e-1f66602839b2	garakuta	国民生产总值
ecedbf7b-13bb-4612-8890-9a82cee38e31	garakuta	轨道炮
24c615a8-a1a1-42fd-b6a8-5d47efc0f24a	particlearts	PA
4f1ce158-fd7e-4154-8ee6-accd78370de7	particlearts	粒子艺术
05b168ce-d97c-403e-848e-21312420593f	particlearts	粒子画
5fe0c819-8474-4d49-83af-dc5be1472654	heavensdoor	天门
fc1654de-6ae4-4467-b39f-b354dad1e8e6	heavensdoor	天堂门
5ffa842d-0531-49a2-a5bd-d218f0f55559	heavensdoor	天堂之门
d6f141fc-53ac-4abf-8142-52e60bced33e	heavensdoor	黑蚊子
5b17e6ec-ee77-44d6-9b48-61e805e874e2	heavensdoor	黑蚊子多
89086957-c732-4ede-b412-a72bfb076fcd	vindication	VI
d6f6bf59-1ec8-4f38-a70f-7aabb0a813cf	vindication	辩护
981f08a1-d20e-43c2-8103-02b0fe1eb748	vindication	辩白
3359532e-c8fd-4d74-89a1-67e2f7ed77c8	ringedgenesis	RG
8e09652c-2cfe-4b9c-b6f3-71e82d44ac7f	ringedgenesis	环状起源
28c04e29-0593-429c-a19f-60f8ec7d68fa	dreadnought	无畏舰
fac87043-7528-4baf-87ca-c9b1a2703e7c	dreadnought	无畏号
e4630fa5-df49-4f2c-8758-1d4fcc999d89	dreadnought	手电筒
f4f0ae6d-43c0-4217-ad48-bab7d2889dd8	dreadnought	迫击炮
204dcb40-8661-4ca6-a552-570ef9011726	dreadnought	望远镜
eff18e66-4c23-4740-8013-6985882fe6b0	melodyoflove	AW
5292ca5e-5f6b-43e3-a713-84ed11f001ec	melodyoflove	AWM
4b620c05-563b-4230-b493-e8498025f096	melodyoflove	迷音
99b9295f-0188-4f45-b5c9-49da9f8b8eb3	melodyoflove	冠军曲
7791d570-3905-4c6c-9a5f-97688de9a774	melodyoflove	抖音
836a4a7e-e5d7-4846-9391-d58bbb2b5983	melodyoflove	音恋
16574187-cefd-4f44-aee1-9e4d8a04e132	melodyoflove	恋歌
f5466c0e-4c49-4457-b913-a97be289c1f4	tiemedowngently	TMD
86475072-c566-4968-a1e2-e9b2dfb7f200	tiemedowngently	TMDG
bac6fa5f-9bc0-463f-ba87-b83d8ecb4fdd	tiemedowngently	绑我
f5f20ad0-6787-40b2-bb1f-eb5e2fc40be4	valhallazero	V0
4464ae84-ef41-4e95-9250-5ff0bae913d2	valhallazero	VALHALLA0
c4746825-5b8d-438c-b8e6-f91a27fab468	valhallazero	瓦尔哈拉
b0ded90f-7597-4af9-8592-22bf1e4c3cb7	valhallazero	爪魔王
b5d6a433-6671-4430-b1b2-cc2e5a302840	aiueoon	AI
70d978a4-b6f5-497d-8426-93135c03583c	aiueoon	AIUEOON
213aa934-eefe-4fee-853e-c70032ac25b0	chelsea	切尔西
82546beb-ae03-483f-93c2-198607d7c78e	diode	KONODIODA
2069d929-0449-48ed-8deb-2b942f585357	diode	DIODA
dc91d689-22f7-4c90-be51-4602cff55386	diode	DIO哒
39e1bd39-f28b-43c3-aa08-8f9e3c87a577	freefall	F4A
ed987246-070e-422f-8980-2c5cd117a3f9	freefall	F4L
a049d942-ca47-455c-afd1-70ba9a58f395	freefall	免费送
1209546b-3d2a-4f66-8624-809410e87d89	freefall	白给
ec368027-f0ec-47c7-a458-677511d99085	gloryroad	GR
11ad7b16-2c58-4ca9-b7a0-34b65b956d88	gloryroad	里红
08861dca-c4c9-45ec-85ec-134e27bf5d82	gloryroad	光荣
0d9582f4-ac9a-41d9-8da4-ab4e28882a07	gloryroad	光荣之路
2628d41f-73dc-473f-af04-23ba6091430d	gloryroad	光荣路
8597652a-c1e5-48b1-aff8-6a13f3f807b2	gloryroad	荣耀之路
6b7d6b1e-1799-4ad7-a124-9b794dc865ca	monochromeprincess	黑白公主
b9f2a42e-83bb-49c1-a749-c5df92eedc02	monochromeprincess	单色公主
2769f6f9-d5ae-444e-8e70-30884f985a5d	monochromeprincess	纵连公主
2cfcee73-b0ad-40e9-b46c-b61240737974	monochromeprincess	单色女王
4ca6860b-b349-455b-b530-52ec8b04ac7f	heavenlycaress	HC
859d69dd-8f88-4318-ac7c-9692e404b89f	senkyou	3Q
d9d78507-2d29-4f8f-8b33-d2050ae3daa1	senkyou	战况
4a9d2c33-3aaf-4747-89b3-22d3f2208391	senkyou	三克油
2c78887b-126d-4928-9b29-6d8369095bca	filament	灯丝
8d36f47a-472f-4745-9e89-9aedf822d9ad	filament	钨丝
3edf4031-7418-45f5-bcd1-b8d34e0ee749	avantraze	AR
bf004e70-1ae9-4474-b9b9-6f595acae957	avantraze	前卫剃须刀
b62dcba1-4335-4197-8003-134074067431	battlenoone	NO.1
7c07dc12-3020-4603-912d-d240dd2abfa9	battlenoone	坝头1
7c828256-a61b-467b-9f95-02980e668991	battlenoone	BATTLE1
35b799f6-b23c-48dd-8198-042265751389	einherjar	EJ
92f78ced-a050-4d63-803a-3aaf655bfb42	einherjar	英灵小丑
51e54d11-7ae4-4d22-a180-5c53165654ef	izana	KONFU
2caa5b4b-89d2-4ac7-a338-61fd2af08bd0	izana	功夫高
2f432bf8-d856-4bf8-8d68-aec033e1cc78	izana	哪里功夫高
135742d1-1d3d-4ee1-adc6-f4a9cbee5aa7	izana	巭高
8e411eea-dd90-4934-b08b-f7083d4c4db5	izana	哪里巭高
2c3d4e20-e271-4d3b-9915-4aa05e79233b	laqryma	LA
048611af-2b42-436b-a9e4-02faab8e21ab	laqryma	LAQUEMA
c812420e-d0e5-4b6a-86cc-b418ca993293	laqryma	废土
f7958853-3916-4ec6-bcdc-90adb02ff0fa	laqryma	垃圾岛
55007ec4-a7cc-4883-9abb-20a26e32fafd	saikyostronger	SAIKOU
deaef210-f31f-41f7-9054-cbe723b00f64	saikyostronger	赛KOU
6a35345e-5e4e-4d16-a68b-56a2a088dfd0	saikyostronger	赛高
416922dc-d971-4419-ae9a-79bc966b6eb8	saikyostronger	最强STRONGER
f3fe4dc4-9fb5-4cdd-873d-332769e9f698	saikyostronger	最强王者
96b6f5bc-d96d-426b-a8e5-638f05863bfc	saikyostronger	最强
463eb07c-24df-4433-96ed-95ebda136ad3	saikyostronger	血魔王
351188af-d15e-40bb-b2f8-e9d54de92368	saikyostronger	血妈
d3877681-1bf4-46cc-bba4-e90d50edbc4e	saikyostronger	血女王
5c8b7ea3-b17e-4dbc-886d-56f88dd20e05	worldexecuteme	世界杀我
cfcd23d7-339c-4336-9f39-2fa7f6dfcb16	worldexecuteme	世界处刑
d0f34d0a-413b-4458-a88f-a02a8adbaa65	worldexecuteme	世界执行
4c909b83-e4e0-4757-a81d-df047a637772	worldexecuteme	死刑
d2da66d8-85f4-4bf9-b1c5-adbe0c4c8ac2	blrink	BLINK
3bf1171f-73c2-4130-b1cb-4bd62bfb98dc	corpssansorganes	里黄
8a605631-0d13-479e-ae98-f3bca20aa100	corpssansorganes	铜魔王
6ef1e01c-e3a0-49c5-8512-d8d2420732e6	corpssansorganes	里铜
ff22d75a-49f4-43b3-be4b-59a18800aaa9	goodtek	好锤子
4b014fd3-20ae-47a1-87da-953a1e235a2e	monochromeprincess	黑白纵连公主
5f0a94a1-01d7-4bd6-96ea-3ec480d83b43	corpssansorganes	无器官
aeafaaad-3cd2-4063-bd18-da5137abf0d3	lostcivilization	钟
a7dd76de-a2b5-4f0c-8f62-bff310abda96	impurebird	不净白鸡
c7f6ff07-4487-45b3-94bb-68bc281f976a	sheriruth	对立切苹果
369924ce-4cba-4531-9d43-63c2d455594d	mazenine	第九迷宫
08f34f38-7dfd-4232-b9a7-f49b8d043572	dreadnought	无畏战舰
ced23d9d-8345-4a2b-8224-5d624c72c467	memoryfactory	老字号
5043480f-dda5-46a5-98a6-1bfae806c733	empireofwinter	冬双子
add9dd9a-b38f-4f6a-8cc7-1e192e6c2968	empireofwinter	冬日双子
79215662-5df8-455b-8864-b5b09c9e72c4	corpssansorganes	空壳
8b4b126d-d097-4380-8296-48cc6a0c097e	antithese	左手绿苹果
b75a3a64-d2ca-4a24-8dbc-a7181b3a6a29	clotho	观测者
44aafb2f-e0e9-44ca-8e83-911234c9abfb	reinvent	冰红茶
27f790e6-b6b3-4815-994d-df0e1261a5ac	empireofwinter	冬之帝国
cd067def-bd5e-41a5-967c-139b5cefca88	heavenlycaress	圣抚
07369648-8dcd-4722-8191-4a978163a8d4	saikyostronger	完形填空
6125994b-09ff-455c-b1e1-3b361632b30b	saikyostronger	爬
0a7105c8-6752-4514-84ee-33dbe8b4b98d	chronostasis	齿轮
13c1bbb9-1ede-4352-aeda-78a82594e991	lostcivilization	韵律八点
77f445fc-cf55-4f08-be5b-fb1bf35b7fa6	aiueoon	あいうえおおん
7f202182-c80b-408b-b61e-62ca4e833020	battlenoone	打架第一名
425b7e46-c30f-4b02-af90-46129b1132c6	avantraze	罗志祥
85b94f5f-b8e0-4199-aff8-63ce452138f2	axiumcrisis	对立吊缚
7dbc92c0-4122-42e8-970f-652bcc45a9af	axiumcrisis	捆绑
8b84658e-5377-4237-8350-bfef8b25e5cc	worldvanquisher	威猛先生
b1a74621-2880-441a-b557-0db2ee4f079b	ringedgenesis	砖魔王
9ec5d2d9-9066-41dc-9d26-b724cb7ec6cf	modelista	飙车
ef54b8fb-6f74-45f9-b7ef-f57f82edb2f5	valhallazero	指甲油
b559bb30-d501-4a32-8255-6e912463d560	blacklotus	黑莲
96baaa46-e488-4c05-87d2-97103e1cabd7	lostdesire	LD
fef5a9fa-77d5-4a43-8d20-e086f606e6e5	tempestissimo	猫魔王
6d020681-76eb-4ce0-840a-5e2373ecf6de	tempestissimo	风暴
c80f8497-df05-4664-9d65-852dad536448	antagonism	对立撸串
bb80eb06-d5f1-48d6-be97-8e05dc111785	altale	ALTALE
b0e810a4-f7ce-42d5-8c8b-ed89ac617b28	dantalion	蛋挞狮子
8f61f16a-5e8c-4908-8452-c5a0e38e6450	tempestissimo	妙脆角
c16002bb-29ff-4904-a379-6dcb31ca7bf7	antagonism	对立吃烤串
f1c2c2e3-6978-4fb7-be1a-ed4c48f04a14	onefr	根号
e601a1e2-8e56-4051-9a13-1c95bd877db7	onefr	一楼
832f4cb1-ecf3-4eba-b3c8-a75415626ca0	dantalion	但它林
ce135335-7f6a-4d91-9b1e-69b799f8d4a0	dantalion	但塔林
0df53bc4-0515-42e1-ad99-62daa36e3f01	dantalion	但他林
84f0254a-bc00-4f25-9ddf-9b84ac392f48	onefr	1F根号
fee52b0b-47cc-4c18-bb65-c45d4af52348	tempestissimo	暴风雨
4780282b-0a84-4b71-b330-cdf17a0c064e	dantalion	蛋挞林
38aaed4f-25df-4701-9f3b-504b26f6bb55	equilibrium	幼白
a9a1879c-1d6d-45aa-940a-a8a91e94c96a	equilibrium	小白
6422cdc5-76e5-4480-b0af-948f5566bdfd	equilibrium	圆光
1ed6a847-04e6-48a2-8b81-b5fc9f24b914	equilibrium	幼光
c781f59b-2066-4691-8b3e-d203c40d7c53	antagonism	圆对立
5967215b-c16c-4453-8129-2af862b73846	antagonism	幼黑
e07439e4-6235-46e0-b8e2-7c0518a656f4	antagonism	小黑
9f0c65e5-3f4b-400a-a854-b8f1b7dc0c2f	antagonism	圆黑
c24e9fe8-f6d7-4a94-9452-bb1048ae4a19	senkyou	仙境
8aca72e2-d334-40e9-ac70-1ba2649b840d	ifi	对立色
b266ff07-d313-4097-a8a8-9838e62cad63	tempestissimo	猫对立
92ed28aa-e11b-4370-8b50-f577edfe3647	onefr	一次全连
21a32a11-a5d1-4027-87e5-e21f19aad041	vividtheory	生理
9b658ad1-43fe-4d80-9d8e-d9e1e605eaf2	givemeanightmare	噩梦
18454f5d-37f6-4756-a349-0512a5d25c50	vividtheory	生动理论
84afb331-b331-4285-b9a0-0ab0adda35ac	genesis	GENESIS
3cfd3bae-375e-4da1-a77d-7fb60f79725f	paradise	PARADISE
a3e6351a-276c-4662-a0a9-2a4ead41fc5f	tempestissimo	奥运会
b3387401-2e3f-4032-b88a-0a38be9735cd	amygdata	六个核桃
6bdddf43-5f01-4d76-8c34-424c97b76686	amygdata	杏仁体
3dd193b7-e890-4298-b936-d9648eff7aa8	amygdata	杏仁体数据
90105d18-b49d-43b5-95ca-f934425ed7d4	amygdata	杏仁体记忆
9868cc59-e0ec-41c0-a045-31ce101f6b1d	amygdata	杏仁核
e16fa0c4-af32-4fc8-af41-45d12586d4f7	givemeanightmare	给我噩梦
7b8172b8-db73-4ba9-a702-c80e98db2ca5	corpssansorganes	无器官的躯体
2246ef89-089c-4fed-a004-d11a1a69abdc	oblivia	遗忘
7cd61cc8-d6eb-4735-8fd2-2d7efd95c313	vividtheory	生动的理论
cd9fcd8b-2350-4ebe-bb6b-11090dcdf291	onefr	1FARYES!
b31debed-778a-4fcd-b212-e68598ea15f3	gekka	月下
50ed6405-0e32-43dc-a049-cbcf1e14eabb	equilibrium	平衡
93e3b3c8-55dd-4425-99fa-e991a61cb26e	antagonism	对抗
c1d00b37-721f-41c6-bce2-6f8dd3c9883a	lostdesire	失落的欲望
6a7d09cd-060a-4449-a92f-ee0980f827d1	arcahv	聚合
1c589a8d-b0eb-4be2-ad7a-ef2b94b520f0	ifi	色号
2cf799d1-1d84-4177-8b29-810579f25dad	oblivia	健忘
c3fa2a93-8850-46c0-92b2-ecc776e08ffc	gekka	月花
a2eaeaef-905b-4f92-ae45-b19b41b9be47	equilibrium	接手霸王
70a8e1d4-e346-45a5-8a00-c77352f4d338	antagonism	异议
47ed337f-bbde-447b-a1ee-c101d1c89d94	antagonism	敌对
96dcc6ac-589b-4bf5-9699-399d050ac249	antagonism	敌意
80f13540-7882-4589-a38f-36c54fe0f9fa	aiueoon	凹酱
0c9c65a4-b648-4fd4-a978-e1fc35efd039	scarletcage	红牢
283c60a5-12f2-4bb4-ae72-145f50529a48	scarletcage	SC
ff648cfd-42f4-4625-8aa1-b6114d8cffc3	scarletcage	绯红之笼
e3962008-7b3d-4483-ae8c-d5a2c88dbdb3	scarletcage	里调
5a83f61e-4802-4dfc-b357-ae65569faf58	scarletcage	绯红的笼
5aee623e-da8a-4515-9f50-d78b9af4ebe0	feelssoright	马卡龙
9bca1060-c6a0-4cc3-852a-7067d6e7ad5e	feelssoright	感觉很好
f7026c01-ba07-400c-817d-404f1cea60ef	feelssoright	腿4
3507d428-e8df-4c54-a51a-958838283abb	feelssoright	腿四
d8893178-bfa2-4be4-bef9-94e5ada5f624	feelssoright	感觉良好
511099f6-03e8-4a61-9ec9-4ab7ffe58bab	feelssoright	感觉很右
41c847cd-c26d-4773-b447-c0fa2b728da6	faintlight	微弱的光
8189eed5-91a5-4194-987e-dbc2f9e3fbe4	faintlight	FL
dbb59bb6-f049-4cca-9b0c-1656f2b5fe9f	soundwitch	SOUNDBITCH
cd682e2b-15b7-4a17-9853-35ef1517f12d	dreaminattraction	美年达
bccf4698-ced4-405b-a5d0-29874c878a5f	scarletcage	红笼子
c5e9599a-8a4f-488e-9e54-df3d7332b21b	faintlight	微光
0b1d6718-af4e-4c80-8fa9-146ba17630dc	scarletcage	红笼
37e4352c-fd0a-4ea3-89b9-26ba7b24e884	feelssoright	感觉很爽
01a8edba-2ffa-480f-8085-8dca9edca9c6	feelssoright	我爽
c169ea87-e740-47dc-8ac3-be2648bb5b4c	feelssoright	爽
f40a4fd4-b2e1-40b3-a13a-66fa95a5a428	feelssoright	我很爽
cefaff72-c40f-4ad1-aaa7-f48a04666d4f	feelssoright	感觉爽
b8e4527d-f435-4e82-a7a5-5ea9f7c90020	feelssoright	感觉好
51c5ddb4-2339-40a0-a194-a35c404d4eed	feelssoright	感觉右
c3e40bee-41ba-4d2b-8e42-1b85e214382a	stasis	船
6dd6f760-f019-4dbd-8515-81a878a6c6ee	stasis	🚢
1870bbc8-17bd-4dde-aef8-5e45081667b5	ouroboros	贪吃蛇
a3663731-ca40-4b9e-bb7b-873a4a61dcfd	trappola	妖艳贱货
550a0b30-3c6c-443a-a58e-4173d8b1199a	climax	妖艳魔男
ab00d92e-6560-401c-98e7-a92301076a10	grievouslady	gl
76aa42c1-bbe9-46d0-a5d3-01b7838c9651	divinelight	光速神授说
2710fbc9-920a-4ebd-9455-107a29fc16e4	divinelight	光速神兽说
7fcffdc5-4761-4e3e-b0f8-dfa60a740156	divinelight	光速
95446b8e-b50e-47fd-b194-b11ae851a3ef	aegleseeker	光追
d7ea253d-07ce-46fc-8b62-0949e07eeadd	kissinglucifer	嗦嗦路西法
afb000f3-75d5-4517-bb9b-5b8c492a3257	kissinglucifer	亲亲路西法
39de120a-5a80-454b-ac81-9e66c922fdac	kissinglucifer	贴贴路西法
a0ea3a19-8b5e-4228-a467-e28be5e7583b	neowings	尼奥翅膀
2fd9b738-c5a5-4881-b4e8-fc96301d2775	viciousheroism	vh
864ed9cd-cea4-42a5-8bab-8e6eae6dd65d	oshamascramble	牛奶
f28e6c85-bfa3-4bb2-8389-da991b427298	oshamascramble	每天一杯奶
6f43c730-960a-43db-ba6a-ce036d1e3877	dantalion	蛋挞狮
aa56e6db-ab91-4191-8fc9-8fc83a730540	garakuta	gdp
5162d629-f6d4-4666-bc56-2a1cddb58a6b	garakuta	垃圾娃娃玩
673d3fae-525f-446c-8c0e-880411433d67	gou	🐶
f9cbfeb4-70fe-4a9d-bbaa-650078311c1c	gou	业善
f5ec1ea9-2e0e-49e1-8bda-28a79b441768	omakeno	小蛇
a63a3cb1-8f0a-448e-a631-9dd80527c6b7	dxfullmetal	dx
8d6169c6-ce4a-43c1-ae23-5ee2ca581488	dxfullmetal	dx超纵连少女
b6cb1f7f-d2ec-4eb1-9945-fc02ad89e44f	amazingmightyyyy	am
de73b148-e2ea-48cb-a7a3-d95e554f11c8	seventhsense	第七感
df92ae60-084c-4f05-9e66-f00c0bf66ba8	aprilshowers	四月的雨
b4edc043-1dac-494e-b875-e61a0f640d15	aprilshowers	四月の雨
1f4f61ff-d7f3-4cad-9c7c-355c0d2cb346	climax	高潮
bba48e3c-6dae-4eb2-bba0-382c47d3444c	nekonote	猫爪
e453f2de-64ee-4e90-bc64-039a492beeeb	gengaozo	跟哥走
38623843-777c-4757-a2aa-825d4f3c488a	gengaozo	走
f40a9429-475c-484e-aaf8-5ec1097a6ed8	sakurafubuki	樱吹雪
3774f40b-08e0-42f1-95cd-5d0d8f3b15cf	sakurafubuki	樱吹屎
ad7b64f7-f652-44af-bd43-80d77f0fb56e	sakurafubuki	樱吹💩
cd8529df-2c43-4aab-a8f1-a72a958e8e0e	blacklotus	黑莲花
bd9db260-415e-461a-b899-c3595982d4cb	rabbitintheblackroom	数一被关进黑房子
20802237-3369-476e-9bcb-c7884832051a	memoryfactory	内存工厂
1162ba7c-e781-4fa1-9bf0-8a2682998f44	memoryfactory	李子河
7fdc0f16-c5b3-47c9-99d7-4d291d67efc6	memoryfactory	李泽航
7ac5bcef-4f79-4e50-b868-4565e1586d57	singularity	ifyoucan
9a6c82dd-ac44-40dc-8634-4536531815ca	singularity	ifucan
f530629e-9262-4a8e-8cf5-a36f9a872f76	gimmedablood	血来
\.


--
-- Name: aliases aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: vapor_username
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_pkey PRIMARY KEY (id);


--
-- Name: aliases_alias_uindex; Type: INDEX; Schema: public; Owner: vapor_username
--

CREATE UNIQUE INDEX aliases_alias_uindex ON public.aliases USING btree (alias);


--
-- PostgreSQL database dump complete
--

