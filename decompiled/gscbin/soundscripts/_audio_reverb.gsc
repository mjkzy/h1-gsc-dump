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

_id_76F0( var_0 )
{
    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    level._id_055B._id_74EC = spawnstruct();
    level._id_055B._id_74EC._id_9BE7 = 0;
    level._id_055B._id_74EC._id_24F8 = "";
}

_id_76F4()
{
    level._id_055B._id_74EC._id_9BE7 = 1;
}

_id_76F1( var_0, var_1 )
{
    var_1 = clamp( var_1, 0, 1.0 );
    var_0._id_2FA3 = var_1;
}

_id_76F2( var_0, var_1 )
{
    var_1 = clamp( var_1, 0, 1.0 );
    var_0._id_A2FB = var_1;
}

_id_76ED( var_0, var_1 )
{
    if ( !isdefined( level._id_055B._id_74EC._id_0C9E ) || level._id_055B._id_74EC._id_0C9E != var_0 )
    {
        level._id_055B._id_74EC._id_0C9E = var_0;
        var_2 = undefined;

        if ( isdefined( var_1 ) )
            var_2 = var_1;
        else
            var_2 = var_0._id_35F8;

        level.playercardbackground setreverb( var_0._id_6FBE, var_0._id_75DE, var_0._id_2FA3, var_0._id_A2FB, var_2 );
    }
}

_id_76F3( var_0, var_1 )
{
    if ( isdefined( level.playercardbackground._id_32D8 ) && isdefined( level.playercardbackground._id_32D8["player_has_red_flashing_overlay"] ) && level.playercardbackground _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
    {
        if ( isdefined( var_0 ) && var_0 != "none" )
        {
            var_2 = _id_76F8( var_0 );

            if ( !isdefined( var_2 ) )
            {
                _id_A5DC::_id_102D( "Failed to load reverb preset: " + var_0 );
                return;
            }

            if ( var_0 != "deathsdoor" )
            {
                _id_76FA( var_0, var_2 );
                level._id_055B._id_2668._id_74EC = var_0;
            }
        }
        else
        {
            _id_76FA( "none", undefined );
            level._id_055B._id_2668._id_74EC = "none";
        }

        return;
    }

    if ( ( isdefined( var_0 ) && var_0 == "none" || !isdefined( var_0 ) ) && isdefined( level._id_055B._id_24F8 ) )
    {
        level.playercardbackground deactivatereverb( "snd_enveffectsprio_level", 1 );
        level._id_055B._id_24F8 = undefined;
        level._id_055B._id_74EC._id_24F8 = "";
        return;
    }
    else if ( !isdefined( var_0 ) || isdefined( var_0 ) && var_0 == "none" )
        return;

    var_2 = _id_76F8( var_0 );

    if ( !isdefined( var_2 ) )
    {
        _id_A5DC::_id_102D( "Failed to load reverb preset: " + var_0 );
        return;
    }

    level._id_055B._id_24F8 = var_0;

    if ( var_0 != "deathsdoor" )
        _id_76FA( var_0, var_2 );

    if ( level._id_055B._id_74EC._id_24F8 != var_0 )
    {
        level._id_055B._id_74EC._id_24F8 = var_0;
        _id_76ED( var_2, var_1 );
    }
}

_id_76FA( var_0, var_1 )
{
    if ( var_0 != "deathsdoor" )
    {
        level._id_74F2 = var_0;

        if ( var_0 == "none" && !isdefined( level._id_0B3D["none"] ) )
            level._id_0B3D["none"] = 1;
        else if ( !isdefined( level._id_0B3D[var_0] ) )
        {
            level._id_0B3D[var_0] = [];
            level._id_0B3D[var_0]["priority"] = "snd_enveffectsprio_level";
            level._id_0B3D[var_0]["roomtype"] = var_1._id_75DE;
            level._id_0B3D[var_0]["drylevel"] = var_1._id_2FA3;
            level._id_0B3D[var_0]["wetlevel"] = var_1._id_A2FB;
            level._id_0B3D[var_0]["fadetime"] = var_1._id_35F8;
        }
    }
}

_id_76EE()
{
    level._id_74F2 = "";
    level.playercardbackground deactivatereverb( "snd_enveffectsprio_level", 2 );
    level._id_055B._id_24F8 = undefined;
    level._id_055B._id_74EC._id_24F8 = "";
}

_id_76EF()
{
    var_0 = undefined;

    if ( isdefined( level._id_055B._id_74EC._id_0C9E ) )
        var_0 = level._id_055B._id_74EC._id_0C9E;

    return var_0;
}

_id_76F7( var_0, var_1 )
{
    var_2 = _id_A5DC::_id_3E53();
    var_3 = "soundtables/sp_defaults.csv";
    var_4 = [];

    if ( var_1 )
        var_4 = _id_76F9( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = _id_76F9( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

_id_76F9( var_0, var_1 )
{
    var_2 = [];
    var_3 = "";
    var_4 = "";
    var_5 = packedtablesectionlookup( var_0, "reverb_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_5 ) )
    {
        var_6 = 6;

        for ( var_7 = 1; var_7 < var_6; var_7++ )
        {
            var_3 = packedtablelookupwithrange( var_0, 0, "reverb_names", var_7, var_5[0], var_5[1] );
            var_4 = packedtablelookupwithrange( var_0, 0, var_1, var_7, var_5[0], var_5[1] );

            if ( var_3 != "comments" && var_4 != "" )
            {
                if ( var_3 != "roomtype" )
                {
                    var_2[var_3] = float( var_4 );
                    continue;
                }

                var_2[var_3] = var_4;
            }
        }

        return var_2;
    }
}

_id_76F5()
{
    while ( !isdefined( level.playercardbackground ) )
        wait 0.5;

    _id_76ED( level._id_055B._id_74EC._id_2789 );
}

_id_76F8( var_0 )
{
    if ( !isdefined( level._id_055B._id_74EC._id_6F1F ) )
        level._id_055B._id_74EC._id_6F1F = [];

    var_1 = _id_76F6();
    var_2 = [];

    if ( isdefined( level._id_055B._id_56B7 ) )
        var_2 = [[ level._id_055B._id_56B7 ]]( var_0, var_2 );
    else if ( isdefined( level._id_055B._id_74EC._id_6F1F[var_0] ) )
        var_2 = level._id_055B._id_74EC._id_6F1F[var_0];
    else if ( level._id_055B._id_74EC._id_9BE7 )
    {
        var_2 = _id_76F7( var_0, 1 );

        if ( !isdefined( var_2 ) )
            return;

        level._id_055B._id_74EC._id_6F1F[var_0] = var_2;
    }
    else
    {
        var_2 = _id_76F7( var_0, 0 );

        if ( !isdefined( var_2 ) )
            return;

        level._id_055B._id_74EC._id_6F1F[var_0] = var_2;
    }

    var_1.nearz = var_0;
    var_1._id_75DE = var_2["roomtype"];
    var_1._id_2FA3 = var_2["drylevel"];
    var_1._id_A2FB = var_2["wetlevel"];
    var_1._id_35F8 = var_2["fadetime"];
    return var_1;
}

_id_76F6()
{
    var_0 = spawnstruct();
    var_0._id_75DE = "generic";
    var_0._id_2FA3 = 1.0;
    var_0._id_A2FB = 0.5;
    var_0._id_35F8 = 0;
    var_0._id_6FBE = "snd_enveffectsprio_level";
    return var_0;
}
