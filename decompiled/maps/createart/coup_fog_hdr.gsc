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
    var_0 = maps\_utility::_id_23DF( "coup" );
    var_0._id_8D08 = 104.384;
    var_0._id_4500 = 25679.4;
    var_0._id_7299 = 0.806017;
    var_0._id_43D8 = 0.722864;
    var_0._id_14C5 = 0.678453;
    var_0._id_4774 = 12.2088;
    var_0._id_5A47 = 0.7;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.732365;
    var_0._id_8FD2 = 0.439419;
    var_0._id_8FBF = 0.217694;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0.137935, 0.629085, 0.765001 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 180;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 0;
    var_0._id_85CE = 0;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.735453, 0.658574, 0.49044 );
    var_0._id_0DB7 = ( 0.807856, 0.618924, 0.370057 );
    var_0._id_0DB9 = 0.197062;
    var_0._id_0DB8 = 0.00734394;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 21.5115;
    var_0._id_0DB6 = 35000;
    var_0._id_0DC2 = 1000;
    var_0._id_0DB3 = 1.5;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 52.6096;
    var_0._id_0DC3 = ( 0.162276, 0.622061, 0.765967 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 200;
    var_0._id_0DBC = 1050;
    var_0 = maps\_utility::_id_23DF( "coup_end" );
    var_0._id_8D08 = 104.384;
    var_0._id_4500 = 25679.4;
    var_0._id_7299 = 0.806017;
    var_0._id_43D8 = 0.722864;
    var_0._id_14C5 = 0.678453;
    var_0._id_4774 = 12.2088;
    var_0._id_5A47 = 0.7;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.732365;
    var_0._id_8FD2 = 0.439419;
    var_0._id_8FBF = 0.217694;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0.137935, 0.629085, 0.765001 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 180;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 0;
    var_0._id_85CE = 0;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.696391, 0.652812, 0.652812 );
    var_0._id_0DB7 = ( 0.807856, 0.618924, 0.370057 );
    var_0._id_0DB9 = 0.197062;
    var_0._id_0DB8 = 0.00734394;
    var_0._id_0DB5 = 0.231334;
    var_0._id_0DBD = 21.5115;
    var_0._id_0DB6 = 9548.09;
    var_0._id_0DC2 = 4686.66;
    var_0._id_0DB3 = 5.20196;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 52.6096;
    var_0._id_0DC3 = ( 0.162276, 0.622061, 0.765967 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 200;
    var_0._id_0DBC = 1050;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.precache = ( -18.8014, 88.3258, 0 );
    maps\_art::_id_8FCD( "default", 0 );
}
