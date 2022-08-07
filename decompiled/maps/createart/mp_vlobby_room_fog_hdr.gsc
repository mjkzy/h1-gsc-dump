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
    var_0 = maps\mp\_art::_id_23DF( "mp_vlobby_room" );
    var_0._id_8D08 = 17346.3;
    var_0._id_4500 = 32487.6;
    var_0._id_7299 = 0.583682;
    var_0._id_43D8 = 0.52939;
    var_0._id_14C5 = 0.302793;
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
    var_0._id_0DC4 = ( 0.383217, 0.5, 0.5 );
    var_0._id_0DB7 = ( 0.714819, 0.658974, 0.603129 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 1;
    var_0._id_0DB6 = 32487.6;
    var_0._id_0DC2 = 17346.3;
    var_0._id_0DB3 = 1;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 80;
    var_0._id_0DC3 = ( 0.718692, 0.298338, 0.628073 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 0;
    var_0._id_0DBC = 1000;
    var_0 = maps\mp\_art::_id_23DF( "mp_vlobby_room_depot" );
    var_0._id_8D08 = 17346.3;
    var_0._id_4500 = 32487.6;
    var_0._id_7299 = 0.583682;
    var_0._id_43D8 = 0.52939;
    var_0._id_14C5 = 0.302793;
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
    var_0._id_0DC4 = ( 0.383217, 0.5, 0.5 );
    var_0._id_0DB7 = ( 0.714819, 0.658974, 0.603129 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 1;
    var_0._id_0DB6 = 32487.6;
    var_0._id_0DC2 = 17346.3;
    var_0._id_0DB3 = 1;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 80;
    var_0._id_0DC3 = ( 0.718692, 0.298338, 0.628073 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 0;
    var_0._id_0DBC = 1000;
    var_0 = maps\mp\_art::_id_23DF( "mp_vlobby_room_firerange_h1" );
    var_0._id_8D08 = 17346.3;
    var_0._id_4500 = 32487.6;
    var_0._id_7299 = 0.583682;
    var_0._id_43D8 = 0.52939;
    var_0._id_14C5 = 0.302793;
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
    var_0._id_0DC4 = ( 0.383217, 0.5, 0.5 );
    var_0._id_0DB7 = ( 0.714819, 0.658974, 0.603129 );
    var_0._id_0DB9 = 0.5;
    var_0._id_0DB8 = 0.5;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 1;
    var_0._id_0DB6 = 32487.6;
    var_0._id_0DC2 = 17346.3;
    var_0._id_0DB3 = 1;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 1;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 80;
    var_0._id_0DC3 = ( 0.718692, 0.298338, 0.628073 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = 0;
    var_0._id_0DBC = 1000;
}

_id_8317()
{

}
