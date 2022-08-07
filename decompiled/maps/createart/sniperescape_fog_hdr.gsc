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
    var_0 = maps\_utility::_id_23DF( "sniperescape" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.505446, 0.505446, 0.505446 );
    var_0._id_0DB7 = ( 0.546875, 0.546875, 0.546875 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 17.3299;
    var_0._id_0DB6 = 2997.63;
    var_0._id_0DC2 = 2324.79;
    var_0._id_0DB3 = 1.00042;
    var_0._id_0DBF = 98304;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = -1.36411;
    var_0._id_0DC0 = 37.2449;
    var_0._id_0DC3 = ( -0.599104, 0.707538, 0.374786 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
    var_0 = maps\_utility::_id_23DF( "sniperescape_ferriswheel" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.505446, 0.505446, 0.505446 );
    var_0._id_0DB7 = ( 0.546875, 0.546875, 0.546875 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 17.3299;
    var_0._id_0DB6 = 2997.63;
    var_0._id_0DC2 = 2324.79;
    var_0._id_0DB3 = 1.00042;
    var_0._id_0DBF = 98304;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = -1.36411;
    var_0._id_0DC0 = 37.2449;
    var_0._id_0DC3 = ( -0.599104, 0.707538, 0.374786 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
    var_0 = maps\_utility::_id_23DF( "sniperescape_scope" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.411217, 0.453531, 0.474196 );
    var_0._id_0DB7 = ( 0.546875, 0.546875, 0.546875 );
    var_0._id_0DB9 = 0.101563;
    var_0._id_0DB8 = 0.0859375;
    var_0._id_0DB5 = 0.585938;
    var_0._id_0DBD = 19.3299;
    var_0._id_0DB6 = 1566.48;
    var_0._id_0DC2 = 5951.76;
    var_0._id_0DB3 = 1;
    var_0._id_0DBF = 81920;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 5.31512;
    var_0._id_0DC0 = 88.761;
    var_0._id_0DC3 = ( -0.599104, 0.707538, 0.374786 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
    var_0 = maps\_utility::_id_23DF( "sniperescape_interior" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.505446, 0.505446, 0.505446 );
    var_0._id_0DB7 = ( 0.546875, 0.546875, 0.546875 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 17.3299;
    var_0._id_0DB6 = 2997.63;
    var_0._id_0DC2 = 2324.79;
    var_0._id_0DB3 = 1.00042;
    var_0._id_0DBF = 98304;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = -1.36411;
    var_0._id_0DC0 = 37.2449;
    var_0._id_0DC3 = ( -0.599104, 0.707538, 0.374786 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
    var_0 = maps\_utility::_id_23DF( "sniperescape_pool" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.505446, 0.505446, 0.505446 );
    var_0._id_0DB7 = ( 0.546875, 0.546875, 0.546875 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 17.3299;
    var_0._id_0DB6 = 2997.63;
    var_0._id_0DC2 = 2324.79;
    var_0._id_0DB3 = 1.00042;
    var_0._id_0DBF = 98304;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = -1.36411;
    var_0._id_0DC0 = 37.2449;
    var_0._id_0DC3 = ( -0.599104, 0.707538, 0.374786 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
    var_0 = maps\_utility::_id_23DF( "sniperescape_hotel" );
    var_0._id_8D08 = 0;
    var_0._id_4500 = 5000;
    var_0._id_7299 = 0;
    var_0._id_43D8 = 0;
    var_0._id_14C5 = 0;
    var_0._id_4774 = 1;
    var_0._id_5A47 = 0;
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
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.851562, 0.93042, 1.0 );
    var_0._id_0DB7 = ( 0.5, 0.5, 0.5 );
    var_0._id_0DB9 = 0.0625;
    var_0._id_0DB8 = 0.0390625;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 17.5799;
    var_0._id_0DB6 = 8967.51;
    var_0._id_0DC2 = 4110.6;
    var_0._id_0DB3 = 0.5625;
    var_0._id_0DBF = 72850;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = -0.947922;
    var_0._id_0DC0 = 24.0658;
    var_0._id_0DC3 = ( -0.678183, 0.697714, 0.230787 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 357.422;
    var_0._id_0DBC = 256.269;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.precache = ( -21.4618, 129.498, 0.0 );
    maps\_art::_id_8FCD( "default", 0 );
}
