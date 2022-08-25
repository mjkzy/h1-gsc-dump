// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

/*
    ----- WARNING: -----

    This GSC dump may contain symbols that H1-mod does not have named. Navigating to https://github.com/h1-mod/h1-mod/blob/develop/src/client/game/scripting/function_tables.cpp and
    finding the function_map, method_map, & token_map maps will help you. CTRL + F (Find) and search your desired value (ex: 'isplayer') and see if it exists.

    If H1-mod doesn't have the symbol named, then you'll need to use the '_ID' prefix.

    (Reference for below: https://github.com/mjkzy/gsc-tool/blob/97abc4f5b1814d64f06fd48d118876106e8a3a39/src/h1/xsk/resolver.cpp#L877)

    For example, if H1-mod theroetically didn't have this symbol, then you'll refer to the '0x1ad' part. This is the hexdecimal key of the value 'isplayer'.
    So, if 'isplayer' wasn't defined with a proper name in H1-mod's function/method table, you would call this function as 'game:_id_1AD(player)' or 'game:_ID1AD(player)'

    Once again, you may need to do this even though it's named in this GSC dump but not in H1-Mod. This dump just names stuff so you know what you're looking at.
    --------------------

*/

main()
{
    _id_8FCC();
    var_0 = maps\_utility::_id_23DF( "blackout" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 10418.7;
    var_0._id_7299 = 0.547333;
    var_0._id_43D8 = 0.585632;
    var_0.blue = 0.742358;
    var_0._id_4774 = 2.38048;
    var_0._id_5A47 = 0.75;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.512573;
    var_0._id_8FD2 = 0.560913;
    var_0._id_8FBF = 0.742188;
    var_0._id_4776 = 4.02834;
    var_0._id_8FC6 = ( 0.507942, 0.780201, 0.365077 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 70;
    var_0._id_615E = 0.6875;
    var_0._id_85CD = 1;
    var_0._id_85CF = 51.168;
    var_0._id_85CE = 87.4715;
    var_0._id_479F = 0;
    var_0._id_479E = -17.9688;
    var_0._id_47A0 = 445.883;
    var_0.atmosfogenabled = 0;
    var_0.atmosfogsunfogcolor = ( 0.400404, 0.401393, 0.401803 );
    var_0.atmosfoghazecolor = ( 0.417448, 0.420146, 0.416684 );
    var_0.atmosfoghazestrength = 0.42363;
    var_0.atmosfoghazespread = 0.355542;
    var_0.atmosfogextinctionstrength = 0.569592;
    var_0.atmosfoginscatterstrength = 4.93308;
    var_0.atmosfoghalfplanedistance = 142.545;
    var_0.atmosfogstartdistance = -49.1186;
    var_0.atmosfogdistancescale = 0.250323;
    var_0.atmosfogskydistance = 36616;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = -0.307541;
    var_0.atmosfogskyfalloffanglerange = 87.0091;
    var_0.atmosfogsundirection = ( 0.682666, 0.589507, 0.431797 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1812.71;
    var_0.atmosfogheightfoghalfplanedistance = 1573.3;
    var_0 = maps\_utility::_id_23DF( "blackout_swamp_1" );
    var_0._id_8D08 = 383.373;
    var_0._id_4500 = 2850.39;
    var_0._id_7299 = 0.547333;
    var_0._id_43D8 = 0.585632;
    var_0.blue = 0.742358;
    var_0._id_4774 = 2.38048;
    var_0._id_5A47 = 0.78125;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.512573;
    var_0._id_8FD2 = 0.560913;
    var_0._id_8FBF = 0.742188;
    var_0._id_4776 = 4.02834;
    var_0._id_8FC6 = ( 0.507942, 0.780201, 0.365077 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 50.5827;
    var_0._id_615E = 0.6875;
    var_0._id_85CD = 0.398438;
    var_0._id_85CF = 8.12213;
    var_0._id_85CE = 54.6681;
    var_0._id_479F = 1;
    var_0._id_479E = -17.9688;
    var_0._id_47A0 = 445.883;
    var_0.atmosfogenabled = 0;
    var_0.atmosfogsunfogcolor = ( 0.548201, 0.689841, 0.892182 );
    var_0.atmosfoghazecolor = ( 0.189862, 0.491308, 0.757289 );
    var_0.atmosfoghazestrength = 0.0234375;
    var_0.atmosfoghazespread = 0.0180053;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 4.75724;
    var_0.atmosfoghalfplanedistance = 129.881;
    var_0.atmosfogstartdistance = 0;
    var_0.atmosfogdistancescale = 0.0617576;
    var_0.atmosfogskydistance = 654;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = -0.307541;
    var_0.atmosfogskyfalloffanglerange = 87.0091;
    var_0.atmosfogsundirection = ( 0.586616, 0.753847, 0.295968 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1.7467;
    var_0.atmosfogheightfoghalfplanedistance = 797.126;
    var_0 = maps\_utility::_id_23DF( "blackout_swamp_2" );
    var_0._id_8D08 = 150;
    var_0._id_4500 = 4000;
    var_0._id_7299 = 0.547333;
    var_0._id_43D8 = 0.585632;
    var_0.blue = 0.742358;
    var_0._id_4774 = 2.38048;
    var_0._id_5A47 = 0.78125;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.512573;
    var_0._id_8FD2 = 0.560913;
    var_0._id_8FBF = 0.742188;
    var_0._id_4776 = 4.02834;
    var_0._id_8FC6 = ( 0.507942, 0.780201, 0.365077 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 50.5827;
    var_0._id_615E = 0.6875;
    var_0._id_85CD = 0.6;
    var_0._id_85CF = 25;
    var_0._id_85CE = 65;
    var_0._id_479F = 1;
    var_0._id_479E = -17.9688;
    var_0._id_47A0 = 445.883;
    var_0.atmosfogenabled = 0;
    var_0.atmosfogsunfogcolor = ( 0.439057, 0.545198, 0.785911 );
    var_0.atmosfoghazecolor = ( 0.462013, 0.521195, 0.757289 );
    var_0.atmosfoghazestrength = 0.30751;
    var_0.atmosfoghazespread = 0.069509;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 4.45837;
    var_0.atmosfoghalfplanedistance = 4.62273;
    var_0.atmosfogstartdistance = -0.0711896;
    var_0.atmosfogdistancescale = 0.00141336;
    var_0.atmosfogskydistance = 6;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 16.0562;
    var_0.atmosfogskyfalloffanglerange = 15.3183;
    var_0.atmosfogsundirection = ( 0.586616, 0.753847, 0.295968 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 102.861;
    var_0.atmosfogheightfoghalfplanedistance = 934.477;
    var_0 = maps\_utility::_id_23DF( "blackout_hill" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 14500.0;
    var_0._id_7299 = 0.547333;
    var_0._id_43D8 = 0.585632;
    var_0.blue = 0.742358;
    var_0._id_4774 = 2.38048;
    var_0._id_5A47 = 0.65;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.512573;
    var_0._id_8FD2 = 0.560913;
    var_0._id_8FBF = 0.742188;
    var_0._id_4776 = 4.02834;
    var_0._id_8FC6 = ( 0.507942, 0.780201, 0.365077 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 70;
    var_0._id_615E = 0.6875;
    var_0._id_85CD = 1;
    var_0._id_85CF = 61.168;
    var_0._id_85CE = 87.4715;
    var_0._id_479F = 0;
    var_0._id_479E = -17.9688;
    var_0._id_47A0 = 445.883;
    var_0.atmosfogenabled = 0;
    var_0.atmosfogsunfogcolor = ( 0.400404, 0.401393, 0.401803 );
    var_0.atmosfoghazecolor = ( 0.417448, 0.420146, 0.416684 );
    var_0.atmosfoghazestrength = 0.42363;
    var_0.atmosfoghazespread = 0.355542;
    var_0.atmosfogextinctionstrength = 0.569592;
    var_0.atmosfoginscatterstrength = 4.93308;
    var_0.atmosfoghalfplanedistance = 142.545;
    var_0.atmosfogstartdistance = -49.1186;
    var_0.atmosfogdistancescale = 0.250323;
    var_0.atmosfogskydistance = 36616;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = -0.307541;
    var_0.atmosfogskyfalloffanglerange = 87.0091;
    var_0.atmosfogsundirection = ( 0.682666, 0.589507, 0.431797 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1812.71;
    var_0.atmosfogheightfoghalfplanedistance = 1573.3;
    var_0 = maps\_utility::_id_23DF( "blackout_village" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 14500.0;
    var_0._id_7299 = 0.547333;
    var_0._id_43D8 = 0.585632;
    var_0.blue = 0.742358;
    var_0._id_4774 = 2.38048;
    var_0._id_5A47 = 0.75;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.512573;
    var_0._id_8FD2 = 0.560913;
    var_0._id_8FBF = 0.742188;
    var_0._id_4776 = 5.2;
    var_0._id_8FC6 = ( 0.507942, 0.780201, 0.365077 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 70;
    var_0._id_615E = 0.6875;
    var_0._id_85CD = 1;
    var_0._id_85CF = 51.168;
    var_0._id_85CE = 87.4715;
    var_0._id_479F = 0;
    var_0._id_479E = -17.9688;
    var_0._id_47A0 = 445.883;
    var_0.atmosfogenabled = 0;
    var_0.atmosfogsunfogcolor = ( 0.400404, 0.401393, 0.401803 );
    var_0.atmosfoghazecolor = ( 0.417448, 0.420146, 0.416684 );
    var_0.atmosfoghazestrength = 0.42363;
    var_0.atmosfoghazespread = 0.355542;
    var_0.atmosfogextinctionstrength = 0.569592;
    var_0.atmosfoginscatterstrength = 4.93308;
    var_0.atmosfoghalfplanedistance = 142.545;
    var_0.atmosfogstartdistance = -49.1186;
    var_0.atmosfogdistancescale = 0.250323;
    var_0.atmosfogskydistance = 36616;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = -0.307541;
    var_0.atmosfogskyfalloffanglerange = 87.0091;
    var_0.atmosfogsundirection = ( 0.682666, 0.589507, 0.431797 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1812.71;
    var_0.atmosfogheightfoghalfplanedistance = 1573.3;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.position = ( -19.1107, 62.1748, 0.0 );
    maps\_art::_id_8FCD( "default", 0 );
}
