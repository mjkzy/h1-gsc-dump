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
    var_0 = maps\_utility::_id_23DF( "bog_a" );
    var_0._id_8D08 = 1267.61;
    var_0._id_4500 = 2049;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.784136;
    var_0._id_14C5 = 0.675201;
    var_0._id_4774 = 4.59;
    var_0._id_5A47 = 0.378365;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0, 0, 0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 48.0714;
    var_0._id_85CE = 96.2788;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 206.435;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.764161, 0.829042, 0.883625 );
    var_0._id_0DB7 = ( 1, 0.823587, 0.581871 );
    var_0._id_0DB9 = 0.0938697;
    var_0._id_0DB8 = 0.0507663;
    var_0._id_0DB5 = 0.902375;
    var_0._id_0DBD = 3.04598;
    var_0._id_0DB6 = 2587.2;
    var_0._id_0DC2 = 1042.47;
    var_0._id_0DB3 = 1.01533;
    var_0._id_0DBF = 655936;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 4.06833;
    var_0._id_0DC0 = 24;
    var_0._id_0DC3 = ( -0.329722, -0.943133, 0.042224 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = -42;
    var_0._id_0DBC = 961;
    var_0 = maps\_utility::_id_23DF( "bog_a_bog_eh" );
    var_0._id_8D08 = 1267.61;
    var_0._id_4500 = 2049;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.784136;
    var_0._id_14C5 = 0.675201;
    var_0._id_4774 = 4.59;
    var_0._id_5A47 = 0.378365;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0, 0, 0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 48.0714;
    var_0._id_85CE = 96.2788;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 206.435;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.537148, 0.417229, 0.356128 );
    var_0._id_0DB7 = ( 0.558988, 0.447577, 0.415477 );
    var_0._id_0DB9 = 0.501789;
    var_0._id_0DB8 = 0.831624;
    var_0._id_0DB5 = 0.75;
    var_0._id_0DBD = 5.85015;
    var_0._id_0DB6 = 2437.05;
    var_0._id_0DC2 = 1847.83;
    var_0._id_0DB3 = 0.803994;
    var_0._id_0DBF = 23654;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 4.06833;
    var_0._id_0DC0 = 12;
    var_0._id_0DC3 = ( -0.540005, -0.832721, 0.12235 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = -42;
    var_0._id_0DBC = 170;
    var_0 = maps\_utility::_id_23DF( "bog_a_flare" );
    var_0._id_8D08 = 1267.61;
    var_0._id_4500 = 2049;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.784136;
    var_0._id_14C5 = 0.675201;
    var_0._id_4774 = 4.59;
    var_0._id_5A47 = 0.378365;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0, 0, 0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 48.0714;
    var_0._id_85CE = 96.2788;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 206.435;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.520692, 0.601151, 0.689173 );
    var_0._id_0DB7 = ( 1, 0.828125, 0.586609 );
    var_0._id_0DB9 = 0.132769;
    var_0._id_0DB8 = 0.0507663;
    var_0._id_0DB5 = 0.97;
    var_0._id_0DBD = 2;
    var_0._id_0DB6 = 2587.2;
    var_0._id_0DC2 = 5.4;
    var_0._id_0DB3 = 1.01533;
    var_0._id_0DBF = 655936;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 8.06833;
    var_0._id_0DC0 = 338;
    var_0._id_0DC3 = ( -0.323832, -0.944262, 0.0422794 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = -42.6706;
    var_0._id_0DBC = 3242;
    var_0 = maps\_utility::_id_23DF( "bog_a_nightvision" );
    var_0._id_8D08 = 1267.61;
    var_0._id_4500 = 2049;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.784136;
    var_0._id_14C5 = 0.675201;
    var_0._id_4774 = 4.59;
    var_0._id_5A47 = 0.378365;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 0;
    var_0._id_8FD9 = 0.5;
    var_0._id_8FD2 = 0.5;
    var_0._id_8FBF = 0.5;
    var_0._id_4776 = -8;
    var_0._id_8FC6 = ( 0, 0, 0 );
    var_0._id_8FBD = 0;
    var_0._id_8FC9 = 1;
    var_0._id_615E = 1;
    var_0._id_85CD = 0;
    var_0._id_85CF = 48.0714;
    var_0._id_85CE = 96.2788;
    var_0._id_479F = 1;
    var_0._id_479E = 0;
    var_0._id_47A0 = 206.435;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.615273, 0.477913, 0.407925 );
    var_0._id_0DB7 = ( 0.902738, 0.722815, 0.670975 );
    var_0._id_0DB9 = 0.501789;
    var_0._id_0DB8 = 0.831624;
    var_0._id_0DB5 = 0.75;
    var_0._id_0DBD = 5.85015;
    var_0._id_0DB6 = 2437.05;
    var_0._id_0DC2 = 1847.83;
    var_0._id_0DB3 = 0.803994;
    var_0._id_0DBF = 94463;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 4.06833;
    var_0._id_0DC0 = 12;
    var_0._id_0DC3 = ( -0.273865, -0.959554, 0.0652224 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = -42;
    var_0._id_0DBC = 170;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.precache = ( -5.27893, -115.812, 0 );
    maps\_art::_id_8FCD( "default", 0 );
}
