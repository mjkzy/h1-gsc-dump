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
    var_0 = maps\mp\_art::_id_23DF( "mp_citystreets" );
    var_0._id_8D08 = 17346.3;
    var_0._id_4500 = 32487.6;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.957944;
    var_0._id_14C5 = 0.747583;
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
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.836823, 0.764401, 0.691978 );
    var_0._id_0DB7 = ( 0.48, 0.357, 0.199 );
    var_0._id_0DB9 = 0.9;
    var_0._id_0DB8 = 0.25;
    var_0._id_0DB5 = 0.35;
    var_0._id_0DBD = 19.5;
    var_0._id_0DB6 = 1500;
    var_0._id_0DC2 = 700;
    var_0._id_0DB3 = 0.9;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 360;
    var_0._id_0DC3 = ( -0.173, 0.464, 0.8686 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 0;
    var_0._id_0DBC = 1000;
    var_0 = maps\mp\_art::_id_23DF( "" );
    var_0._id_8D08 = 3764.17;
    var_0._id_4500 = 19391;
    var_0._id_7299 = 1;
    var_0._id_43D8 = 0.925269;
    var_0._id_14C5 = 0.847076;
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
