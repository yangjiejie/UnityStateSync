-module(data_partner_grow).

-include("common.hrl").

-export([get/1, keys/0]).

%% get(Id,Step);
%% 武将成长表;
%% 
get(1101) ->
	#d_partner_grow{
		attr         = #attr{dodge = 700,hp = 1130,magic_def = 20,att = 90,attback = 900,crit = 1400,strong_def = 30},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1101             % 武将ID
	};
get(1102) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 1310,magic_def = 20,att = 120,attback = 1200,crit = 800,strong_def = 30},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1102             % 武将ID
	};
get(1103) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1300,hp = 1275,magic_def = 20,att = 125,attback = 800,crit = 900,strong_def = 30},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1103             % 武将ID
	};
get(1104) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1400,hp = 1540,magic_def = 20,att = 90,attback = 1100,crit = 500,strong_def = 30},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1104             % 武将ID
	};
get(1105) ->
	#d_partner_grow{
		attr         = #attr{dodge = 700,hp = 1015,magic_def = 20,att = 105,attback = 900,crit = 1400,strong_def = 30},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1105             % 武将ID
	};
get(1106) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1700,hp = 875,magic_def = 25,att = 145,attback = 800,crit = 500,strong_def = 25},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1106             % 武将ID
	};
get(1107) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 845,magic_def = 25,att = 135,attback = 500,crit = 1500,strong_def = 25},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1107             % 武将ID
	};
get(1108) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1100,hp = 1035,magic_def = 30,att = 130,attback = 800,crit = 1100,strong_def = 20},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1108             % 武将ID
	};
get(1109) ->
	#d_partner_grow{
		attr         = #attr{dodge = 700,hp = 1080,magic_def = 30,att = 110,attback = 700,crit = 1600,strong_def = 20},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1109             % 武将ID
	};
get(1110) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 960,magic_def = 30,att = 125,attback = 800,crit = 1200,strong_def = 20},
		quali        = 13,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1110             % 武将ID
	};
get(1201) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1800,hp = 1665,magic_def = 30,att = 100,attback = 1000,crit = 700,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1201             % 武将ID
	};
get(1202) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1665,magic_def = 30,att = 100,attback = 1200,crit = 1100,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1202             % 武将ID
	};
get(1203) ->
	#d_partner_grow{
		attr         = #attr{dodge = 700,hp = 1395,magic_def = 30,att = 135,attback = 1000,crit = 1800,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1203             % 武将ID
	};
get(1204) ->
	#d_partner_grow{
		attr         = #attr{dodge = 900,hp = 1195,magic_def = 30,att = 100,attback = 1000,crit = 1600,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1204             % 武将ID
	};
get(1205) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1500,hp = 1360,magic_def = 30,att = 140,attback = 1000,crit = 1000,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1205             % 武将ID
	};
get(1206) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 1435,magic_def = 30,att = 130,attback = 1500,crit = 1000,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1206             % 武将ID
	};
get(1207) ->
	#d_partner_grow{
		attr         = #attr{dodge = 900,hp = 1080,magic_def = 30,att = 115,attback = 1000,crit = 1600,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1207             % 武将ID
	};
get(1208) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 1075,magic_def = 30,att = 110,attback = 1000,crit = 1500,strong_def = 40},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1208             % 武将ID
	};
get(1209) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 975,magic_def = 30,att = 165,attback = 1000,crit = 500,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1209             % 武将ID
	};
get(1210) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 930,magic_def = 30,att = 155,attback = 500,crit = 2000,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1210             % 武将ID
	};
get(1211) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1175,magic_def = 40,att = 145,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1211             % 武将ID
	};
get(1212) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1290,magic_def = 40,att = 130,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1212             % 武将ID
	};
get(1213) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1400,hp = 1205,magic_def = 40,att = 130,attback = 1100,crit = 1000,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1213             % 武将ID
	};
get(1214) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1500,hp = 1290,magic_def = 40,att = 130,attback = 1000,crit = 1000,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1214             % 武将ID
	};
get(1215) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 1160,magic_def = 40,att = 120,attback = 900,crit = 1600,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1215             % 武将ID
	};
get(1216) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1100,hp = 1160,magic_def = 40,att = 120,attback = 1000,crit = 1400,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1216             % 武将ID
	};
get(1217) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1205,magic_def = 40,att = 130,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1217             % 武将ID
	};
get(1218) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1205,magic_def = 40,att = 130,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1218             % 武将ID
	};
get(1219) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1035,magic_def = 40,att = 115,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1219             % 武将ID
	};
get(1220) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1200,hp = 1110,magic_def = 40,att = 120,attback = 1100,crit = 1200,strong_def = 30},
		quali        = 16,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1220             % 武将ID
	};
get(1301) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1400,hp = 1560,magic_def = 40,att = 140,attback = 1300,crit = 1300,strong_def = 50},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1301             % 武将ID
	};
get(1302) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1500,hp = 1710,magic_def = 40,att = 120,attback = 1500,crit = 1000,strong_def = 50},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1302             % 武将ID
	};
get(1303) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 1400,magic_def = 40,att = 160,attback = 1500,crit = 1500,strong_def = 50},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1303             % 武将ID
	};
get(1304) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1300,hp = 1480,magic_def = 40,att = 150,attback = 1300,crit = 1400,strong_def = 50},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1304             % 武将ID
	};
get(1305) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 1030,magic_def = 40,att = 180,attback = 1000,crit = 1000,strong_def = 40},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1305             % 武将ID
	};
get(1306) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1300,hp = 1005,magic_def = 40,att = 165,attback = 500,crit = 2200,strong_def = 40},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1306             % 武将ID
	};
get(1307) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1600,hp = 1205,magic_def = 40,att = 130,attback = 1100,crit = 1300,strong_def = 30},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1307             % 武将ID
	};
get(1308) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1300,hp = 1290,magic_def = 40,att = 130,attback = 1300,crit = 1400,strong_def = 30},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1308             % 武将ID
	};
get(1309) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1500,hp = 1110,magic_def = 40,att = 120,attback = 1000,crit = 1500,strong_def = 30},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1309             % 武将ID
	};
get(1310) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1500,hp = 1290,magic_def = 40,att = 130,attback = 500,crit = 2000,strong_def = 30},
		quali        = 19,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1310             % 武将ID
	};
get(1511) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1511             % 武将ID
	};
get(1512) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1512             % 武将ID
	};
get(1513) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1513             % 武将ID
	};
get(1514) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1514             % 武将ID
	};
get(1515) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1515             % 武将ID
	};
get(1516) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 500,magic_def = 0,att = 50,attback = 2000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1516             % 武将ID
	};
get(1517) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1517             % 武将ID
	};
get(1518) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1518             % 武将ID
	};
get(1519) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1519             % 武将ID
	};
get(1520) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1520             % 武将ID
	};
get(1521) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1521             % 武将ID
	};
get(1522) ->
	#d_partner_grow{
		attr         = #attr{dodge = 2000,hp = 400,magic_def = 0,att = 60,attback = 1000,crit = 1000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1522             % 武将ID
	};
get(1523) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1523             % 武将ID
	};
get(1524) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1524             % 武将ID
	};
get(1525) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1525             % 武将ID
	};
get(1526) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1526             % 武将ID
	};
get(1527) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1527             % 武将ID
	};
get(1528) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1000,hp = 300,magic_def = 0,att = 70,attback = 1000,crit = 2000,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1528             % 武将ID
	};
get(1529) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1529             % 武将ID
	};
get(1530) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1530             % 武将ID
	};
get(1531) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1531             % 武将ID
	};
get(1532) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1532             % 武将ID
	};
get(1533) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1533             % 武将ID
	};
get(1534) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 350,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1534             % 武将ID
	};
get(1535) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1535             % 武将ID
	};
get(1536) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1536             % 武将ID
	};
get(1537) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1537             % 武将ID
	};
get(1538) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1538             % 武将ID
	};
get(1539) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1539             % 武将ID
	};
get(1540) ->
	#d_partner_grow{
		attr         = #attr{dodge = 1350,hp = 300,magic_def = 0,att = 50,attback = 1350,crit = 1350,strong_def = 0},
		quali        = 10,              % 资质参数
		sol          = #sol{str_d = 1,mag_d = 1,mag_a = 2,str_a = 2},
		id           = 1540             % 武将ID
	};
get(_) ->
	?null.

keys() ->
	[1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219, 1220, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1523, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540].