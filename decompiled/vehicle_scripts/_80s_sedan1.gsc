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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::build_template( "80s_sedan1", var_0, var_1, var_2 );
    maps\_vehicle::build_localinit( ::_id_4D10 );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_brn", "vehicle_80s_sedan1_brn_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_green", "vehicle_80s_sedan1_green_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_red", "vehicle_80s_sedan1_red_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_silv", "vehicle_80s_sedan1_silv_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_tan", "vehicle_80s_sedan1_tan_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_80s_sedan1_yel", "vehicle_80s_sedan1_yel_destroyed" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_brn_destructible", "vehicle_80s_sedan1_brn" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_green_destructible", "vehicle_80s_sedan1_green" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_red_destructible", "vehicle_80s_sedan1_red" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_silv_destructible", "vehicle_80s_sedan1_silv" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_tan_destructible", "vehicle_80s_sedan1_tan" );
    maps\_vehicle::build_destructible( "vehicle_80s_sedan1_yel_destructible", "vehicle_80s_sedan1_yel" );
    maps\_vehicle::build_drive( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    maps\_vehicle::build_treadfx();
    maps\_vehicle::build_life( 999, 500, 1500 );
    maps\_vehicle::build_team( "allies" );
    maps\_vehicle::build_aianims( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 1; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[0]._id_4B63 = %luxurysedan_driver_idle;
    return var_0;
}
