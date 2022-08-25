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
    var_0 = maps\mp\_art::_id_23DF( "mp_crossfire" );
    var_0._id_8D08 = 1423.51;
    var_0._id_4500 = 6300.3;
    var_0._id_7299 = 0.742358;
    var_0._id_43D8 = 0.671204;
    var_0.blue = 0.594049;
    var_0._id_4774 = 14.4306;
    var_0._id_5A47 = 1;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0.529689;
    var_0._id_85CF = 46.4867;
    var_0._id_85CE = 78;
    var_0._id_479F = 1;
    var_0._id_479E = 14.2465;
    var_0._id_47A0 = 389.981;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.79, 0.9, 0.91 );
    var_0.atmosfoghazecolor = ( 0.99, 0.88, 0.71 );
    var_0.atmosfoghazestrength = 0.25;
    var_0.atmosfoghazespread = 0.039;
    var_0.atmosfogextinctionstrength = 0.81;
    var_0.atmosfoginscatterstrength = 20;
    var_0.atmosfoghalfplanedistance = 7400;
    var_0.atmosfogstartdistance = 1000;
    var_0.atmosfogdistancescale = 0.81;
    var_0.atmosfogskydistance = 25259;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 35;
    var_0.atmosfogskyfalloffanglerange = 32;
    var_0.atmosfogsundirection = ( -0.45, 0.57, 0.68 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = 356;
    var_0.atmosfogheightfoghalfplanedistance = 347;
    var_0 = maps\mp\_art::_id_23DF( "mp_crossfire_interior" );
    var_0._id_8D08 = 1423.51;
    var_0._id_4500 = 6300.3;
    var_0._id_7299 = 0.742358;
    var_0._id_43D8 = 0.671204;
    var_0.blue = 0.594049;
    var_0._id_4774 = 14.4306;
    var_0._id_5A47 = 1;
    var_0._id_971C = 2;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0.0, 0.0, 0.0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0.529689;
    var_0._id_85CF = 46.4867;
    var_0._id_85CE = 78;
    var_0._id_479F = 1;
    var_0._id_479E = 14.2465;
    var_0._id_47A0 = 389.981;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.79, 0.95, 0.93 );
    var_0.atmosfoghazecolor = ( 0.99, 0.88, 0.71 );
    var_0.atmosfoghazestrength = 0.25;
    var_0.atmosfoghazespread = 0.039;
    var_0.atmosfogextinctionstrength = 0.7;
    var_0.atmosfoginscatterstrength = 19;
    var_0.atmosfoghalfplanedistance = 7400;
    var_0.atmosfogstartdistance = 1000;
    var_0.atmosfogdistancescale = 0.75;
    var_0.atmosfogskydistance = 25259;
    var_0.atmosfogskyangularfalloffenabled = 1;
    var_0.atmosfogskyfalloffstartangle = 35;
    var_0.atmosfogskyfalloffanglerange = 32;
    var_0.atmosfogsundirection = ( -0.45, 0.57, 0.68 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = 356;
    var_0.atmosfogheightfoghalfplanedistance = 347;
}
