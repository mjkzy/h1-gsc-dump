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
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    level._effect["animated_rat_death"] = loadfx( "vfx/blood/dlc_blood_splash_sm" );
    var_0 = getentarray( "animated_rat", "targetname" );
    common_scripts\utility::array_thread( var_0, ::init_rats );
}

init_rats()
{
    if ( !isdefined( self.script_noteworthy ) )
        return;

    switch ( self.script_noteworthy )
    {
        case "frantic":
            thread run_rat( "h1_mp_rat_frantic_idle", [ "h1_mp_rat_death_01", "h1_mp_rat_death_01" ] );
            break;
        case "run":
            thread run_rat( "h1_mp_rat_run_01", [ "h1_mp_rat_death_03" ] );
            break;
        default:
    }
}

run_rat( var_0, var_1 )
{
    precachempanim( var_0 );

    foreach ( var_3 in var_1 )
        precachempanim( var_3 );

    self setcandamage( 1 );
    self.health = 1;
    self _meth_8277( var_0 );
    self waittill( "damage", var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    playfx( common_scripts\utility::_id_3FA8( "animated_rat_death" ), self.origin, ( 0.0, 0.0, 1.0 ) );
    self _meth_8277( common_scripts\utility::_id_710E( var_1 ) );
}
