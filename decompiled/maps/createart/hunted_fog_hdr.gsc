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
    var_0 = maps\_utility::_id_23DF( "hunted" );
    var_0._id_8D08 = 1024;
    var_0._id_4500 = 4097;
    var_0._id_7299 = 0.0845683;
    var_0._id_43D8 = 0.101563;
    var_0.blue = 0.210938;
    var_0._id_4774 = 4.25;
    var_0._id_5A47 = 0.625;
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
    var_0._id_85CF = 46.4867;
    var_0._id_85CE = 78;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 424;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 1.0, 1.0, 1.0 );
    var_0.atmosfoghazecolor = ( 0.761353, 0.951638, 0.992188 );
    var_0.atmosfoghazestrength = 0.367188;
    var_0.atmosfoghazespread = 0.0138765;
    var_0.atmosfogextinctionstrength = 0.445313;
    var_0.atmosfoginscatterstrength = 4.8515;
    var_0.atmosfoghalfplanedistance = 4097;
    var_0.atmosfogstartdistance = 2561.61;
    var_0.atmosfogdistancescale = 1.375;
    var_0.atmosfogskydistance = 8192;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 6.86674;
    var_0.atmosfogskyfalloffanglerange = 18.3113;
    var_0.atmosfogsundirection = ( 0.459477, 0.569579, 0.681514 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 228.052;
    var_0.atmosfogheightfoghalfplanedistance = 346.845;
    var_0 = maps\_utility::_id_23DF( "hunted_barn_interior" );
    var_0._id_8D08 = 1024;
    var_0._id_4500 = 4097;
    var_0._id_7299 = 0.0845683;
    var_0._id_43D8 = 0.101563;
    var_0.blue = 0.210938;
    var_0._id_4774 = 4.25;
    var_0._id_5A47 = 0.625;
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
    var_0._id_85CF = 46.4867;
    var_0._id_85CE = 78;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 424;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 1.0, 1.0, 1.0 );
    var_0.atmosfoghazecolor = ( 0.761353, 0.951638, 0.992188 );
    var_0.atmosfoghazestrength = 0.367188;
    var_0.atmosfoghazespread = 0.0138765;
    var_0.atmosfogextinctionstrength = 0.445313;
    var_0.atmosfoginscatterstrength = 4.8515;
    var_0.atmosfoghalfplanedistance = 4097;
    var_0.atmosfogstartdistance = 2561.61;
    var_0.atmosfogdistancescale = 1.375;
    var_0.atmosfogskydistance = 8192;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 6.86674;
    var_0.atmosfogskyfalloffanglerange = 18.3113;
    var_0.atmosfogsundirection = ( 0.459477, 0.569579, 0.681514 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 228.052;
    var_0.atmosfogheightfoghalfplanedistance = 346.845;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.position = ( -44.3585, 50.2227, 0.0 );
    maps\_art::_id_8FCD( "default", 0 );
}
