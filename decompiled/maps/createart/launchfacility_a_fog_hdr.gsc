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
    var_0 = maps\_utility::_id_23DF( "launchfacility_a" );
    var_0._id_8D08 = 1204.17;
    var_0._id_4500 = 9151;
    var_0._id_7299 = 0.906515;
    var_0._id_43D8 = 0.839342;
    var_0.blue = 0.909582;
    var_0._id_4774 = 8.4588;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 0;
    var_0._id_85CE = 0;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 488;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.570313, 0.578125, 0.734375 );
    var_0.atmosfoghazecolor = ( 0.756491, 0.710936, 0.679688 );
    var_0.atmosfoghazestrength = 0.015625;
    var_0.atmosfoghazespread = 0.0390625;
    var_0.atmosfogextinctionstrength = 0.679688;
    var_0.atmosfoginscatterstrength = 15;
    var_0.atmosfoghalfplanedistance = 6053.87;
    var_0.atmosfogstartdistance = 376.726;
    var_0.atmosfogdistancescale = 1.00012;
    var_0.atmosfogskydistance = 28517;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 50;
    var_0.atmosfogsundirection = ( 0.931829, -0.121288, 0.34203 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1556.33;
    var_0.atmosfogheightfoghalfplanedistance = 684.694;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.position = ( -13.3154, -7.5753, 0.0 );
    maps\_art::_id_8FCD( "default", 0 );
}
