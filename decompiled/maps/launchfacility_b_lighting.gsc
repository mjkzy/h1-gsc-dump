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
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    thread setup_spinning_ents();
    thread setup_emissive_pulsing();
    level.default_clut = "clut_launchfacility_b";
    level.default_lightset = "launchfacility_b";
    level.default_visionset = "launchfacility_b";
    level.nightvisionlightset = "launchfacility_b_nightvision";
    _func_144( "launchfacility_b_nightvision" );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_9E6E( "launchfacility_b", 0 );
    level.player maps\_utility::set_light_set_player( "launchfacility_b" );
    level.player _meth_848C( "clut_launchfacility_b", 0.0 );
}

setup_spinning_ents()
{
    var_0 = common_scripts\utility::_id_8959();
    var_1 = getentarray( "spinning", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getent( var_3._id_7A26, "script_linkname" );
        wait 1.0;

        if ( isdefined( var_4 ) )
        {
            var_3 linkto( var_0 );
            var_3 thread maps\_utility::yaw_ent_by_linked( 1.0 );
            var_4 thread maps\_utility::rotate_ent_with_ent( var_3 );
        }
    }
}

setup_emissive_pulsing()
{
    var_0 = getentarray( "emissive_pulsing", "targetname" );
    common_scripts\utility::array_thread( var_0, ::emissive_pulsing );
}

emissive_pulsing()
{
    var_0 = 0.5;
    var_1 = 0.2;
    var_2 = 0.5;
    var_3 = 1.0;

    if ( isdefined( self.script_noteworthy ) )
    {
        var_4 = strtok( self.script_noteworthy, " " );

        if ( isdefined( var_4[0] ) )
            var_2 = float( var_4[0] );

        if ( isdefined( var_4[1] ) )
            var_3 = float( var_4[1] );
    }

    var_5 = 0.05;
    var_6 = var_3;
    var_7 = 0.0 - ( var_3 - var_2 ) / ( var_0 / var_5 );
    var_8 = ( var_3 - var_2 ) / ( var_1 / var_5 );

    for (;;)
    {
        var_6 = emissive_ramp( var_0, var_6, var_7, var_2, var_3 );
        wait 1;
        var_6 = emissive_ramp( var_1, var_6, var_8, var_2, var_3 );
        wait 0.5;
    }
}

emissive_ramp( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 0.05;

    while ( var_5 < var_0 )
    {
        var_1 += var_2;
        var_1 = clamp( var_1, var_3, var_4 );
        self _meth_83A5( var_1, 0.0 );
        var_5 += var_6;
        wait(var_6);
    }

    return var_1;
}
