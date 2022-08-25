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
    var_0 = maps\mp\_art::_id_23DF( "mp_farm_spring" );
    var_0._id_8D08 = 100000;
    var_0._id_4500 = 300000;
    var_0._id_7299 = 0.925474;
    var_0._id_43D8 = 1;
    var_0.blue = 0.999999;
    var_0._id_4774 = 14.4735;
    var_0._id_5A47 = 0.893394;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 1;
    var_0._id_8FD2 = 0;
    var_0._id_8FBF = 0;
    var_0._id_4776 = 1;
    var_0._id_8FC6 = ( 1.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 180;
    var_0._id_615E = 1;
    var_0._id_85CD = 1;
    var_0._id_85CF = 0;
    var_0._id_85CE = 87.6317;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.729, 1.0, 0.921 );
    var_0.atmosfoghazecolor = ( 1.0, 0.897, 0.671 );
    var_0.atmosfoghazestrength = 0.78;
    var_0.atmosfoghazespread = 0.065;
    var_0.atmosfogextinctionstrength = 0.5;
    var_0.atmosfoginscatterstrength = 17.5;
    var_0.atmosfoghalfplanedistance = 10000;
    var_0.atmosfogstartdistance = 500;
    var_0.atmosfogdistancescale = 1;
    var_0.atmosfogskydistance = 90927;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 3;
    var_0.atmosfogskyfalloffanglerange = 88;
    var_0.atmosfogsundirection = ( -0.468, -0.497, 0.731 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = 800;
    var_0.atmosfogheightfoghalfplanedistance = 1800;
    var_0 = maps\mp\_art::_id_23DF( "mp_farm_spring_int" );
    var_0._id_8D08 = 100000;
    var_0._id_4500 = 300000;
    var_0._id_7299 = 0.925474;
    var_0._id_43D8 = 1;
    var_0.blue = 0.999999;
    var_0._id_4774 = 14.4735;
    var_0._id_5A47 = 0.893394;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 1;
    var_0._id_8FD2 = 0;
    var_0._id_8FBF = 0;
    var_0._id_4776 = 1;
    var_0._id_8FC6 = ( 1.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 180;
    var_0._id_615E = 1;
    var_0._id_85CD = 1;
    var_0._id_85CF = 0;
    var_0._id_85CE = 87.6317;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.729, 1.0, 0.921 );
    var_0.atmosfoghazecolor = ( 1.0, 0.897, 0.671 );
    var_0.atmosfoghazestrength = 0.78;
    var_0.atmosfoghazespread = 0.065;
    var_0.atmosfogextinctionstrength = 0.5;
    var_0.atmosfoginscatterstrength = 17.5;
    var_0.atmosfoghalfplanedistance = 10000;
    var_0.atmosfogstartdistance = 500;
    var_0.atmosfogdistancescale = 0.85;
    var_0.atmosfogskydistance = 90927;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 3;
    var_0.atmosfogskyfalloffanglerange = 88;
    var_0.atmosfogsundirection = ( -0.468, -0.497, 0.731 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = 7432.35;
    var_0.atmosfogheightfoghalfplanedistance = 6008.52;
}

_id_8317()
{

}
