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

set_cloth_wibble( var_0 )
{
    _func_2e8( 0, "x", 1.0 );
    _func_2e8( 0, "y", var_0 );
}

setup_wibble_triggers( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_3 )
        set_cloth_wibble( 1.0 );

    level.current_wibble_location = var_2;

    if ( var_4 && var_2 == "exterior" && !var_3 )
        set_cloth_wibble( 0.5 );

    var_5 = getentarray( "trigger_wibble", "targetname" );
    common_scripts\utility::_id_0D13( var_5, ::wibble_trigger_think, var_0, var_1, var_4 );
    thread setup_wibble_helis( var_0, var_1 );
}

setup_wibble_helis( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        common_scripts\utility::_id_384A( var_1 );

    if ( var_0 )
    {
        wait 2;
        level endon( "wibble_heli_check_stop" );
        var_2 = 1690000;

        for (;;)
        {
            var_3 = 0;

            if ( isdefined( level._id_4816 ) )
            {
                level._id_4816 = common_scripts\utility::_id_0D01( level._id_4816 );

                foreach ( var_5 in level._id_4816 )
                {
                    var_6 = distancesquared( level.playercardbackground.origin, var_5.origin );

                    if ( var_6 <= var_2 )
                    {
                        var_3 = 0.5;
                        break;
                    }
                }
            }

            set_cloth_wibble( var_3 );
            wait 0.5;
        }
    }
    else
        set_cloth_wibble( 0.5 );
}

wibble_trigger_think( var_0, var_1, var_2 )
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( self.script_parentname != level.current_wibble_location )
        {
            switch ( self.script_parentname )
            {
                case "exterior":
                    if ( var_2 )
                    {
                        set_cloth_wibble( 0.5 );
                        break;
                    }
                    else
                    {
                        thread setup_wibble_helis( var_0, var_1 );
                        break;
                    }
                case "interior":
                    level notify( "wibble_heli_check_stop" );
                    set_cloth_wibble( 0.0 );
                    break;
            }

            level.current_wibble_location = self.script_parentname;
        }
    }
}

wibble_add_heli_to_track( var_0 )
{
    if ( !isdefined( level._id_4816 ) )
        level._id_4816 = [];

    level._id_4816 = common_scripts\utility::_id_0CDA( level._id_4816, var_0 );
}
