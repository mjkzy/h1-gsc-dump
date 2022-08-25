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
    var_0 = maps\mp\_art::_id_23DF( "mp_pipeline" );
    var_0._id_8D08 = 17346.3;
    var_0._id_4500 = 32487.6;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.957944;
    var_0.blue = 0.747583;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 1;
    var_0._id_8FD2 = 0;
    var_0._id_8FBF = 0;
    var_0._id_4776 = 1;
    var_0._id_8FC6 = ( 1.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 180;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 0;
    var_0._id_85CE = 0;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.276477, 0.396808, 0.460938 );
    var_0.atmosfoghazecolor = ( 0.315204, 0.411132, 0.539063 );
    var_0.atmosfoghazestrength = 0.75;
    var_0.atmosfoghazespread = 0.25;
    var_0.atmosfogextinctionstrength = 0.0445922;
    var_0.atmosfoginscatterstrength = 22.0724;
    var_0.atmosfoghalfplanedistance = 1732.58;
    var_0.atmosfogstartdistance = 500;
    var_0.atmosfogdistancescale = 0.400038;
    var_0.atmosfogskydistance = 24576;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 90;
    var_0.atmosfogskyfalloffanglerange = 90.8932;
    var_0.atmosfogsundirection = ( -0.548014, -0.464835, 0.69542 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = 0;
    var_0.atmosfogheightfoghalfplanedistance = 1000;
    var_0 = maps\mp\_art::_id_23DF( "" );
    var_0._id_8D08 = 3764.17;
    var_0._id_4500 = 19391;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.925269;
    var_0.blue = 0.847076;
    var_0._id_4774 = 12.2088;
    var_0._id_5A47 = 0.7;
    var_0._id_971C = 0;
    var_0._id_85CD = 0;
    var_0._id_85CF = 0;
    var_0._id_85CE = 0;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
}

_id_8317()
{

}
