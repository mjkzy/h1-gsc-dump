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

_id_86DD()
{
    _id_86F6();
    _id_86F7();
    _id_8705();
    _id_8706();
}

_id_8755( var_0 )
{
    level._snd._id_24E4._id_5685 = var_0;
    level.player seteqlerp( var_0, 0 );
}

_id_86E2()
{
    return level._snd._id_24E4._id_5685;
}

_id_86F6()
{
    var_0 = spawnstruct();
    var_0._id_6048 = [];
    var_0._id_6048[0] = "";
    var_0._id_6048[1] = "";
    var_0._id_5685 = 0;
    level._snd._id_24E4 = var_0;
}

_id_86E3( var_0 )
{
    return level._snd._id_24E4._id_6048[var_0];
}

_id_8751( var_0, var_1 )
{
    level._snd._id_24E4._id_6048[var_0] = var_1;
}

_id_86F7()
{
    var_0 = spawnstruct();
    var_0.name = "";
    level._snd._id_24F2 = var_0;
    _id_8752( "" );
}

_id_86E4()
{
    return level._snd._id_24F2.name;
}

_id_8752( var_0 )
{
    level._snd._id_24F2.name = var_0;
}

_id_8704()
{
    var_0 = soundscripts\_snd::_id_871B( "DSP bus", [ "sounddata/dspbuses.csv" ], 2, "name", "name" );

    if ( isdefined( var_0 ) )
        level._snd._id_2FAE = var_0;
    else
        level._snd._id_2FAE = [];
}

_id_86E6()
{
    var_0 = [];

    foreach ( var_2 in level._snd._id_2FAE )
        var_0[var_0.size] = var_2.name;

    return var_0;
}

_id_86FF( var_0 )
{
    return isdefined( level._snd._id_2FAE[var_0] );
}

_id_86E7()
{
    return "sounddata/dspbuses.csv";
}

_id_8705()
{
    level._snd._id_36CD = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level.script + ".csv";
    level._snd._id_36CD._id_6F22 = soundscripts\_snd::_id_871B( "Filter", var_0, 6, "filter_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_8754( var_0, var_1, var_2 )
{
    if ( isdefined( level.player._id_32D8 ) && isdefined( level.player._id_32D8["player_has_red_flashing_overlay"] ) && level.player maps\_utility::_id_32D8( "player_has_red_flashing_overlay" ) )
        return;

    var_3 = 0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && ( var_0 == "" || var_0 == "none" ) )
    {
        _id_8751( var_3, "" );
        level.player deactivateeq( var_3 );
        return;
    }

    var_4 = _id_86E8( var_0 );

    if ( !isdefined( var_4 ) )
        return;

    if ( _id_86E3( var_3 ) != var_0 )
    {
        _id_8751( var_3, var_0 );
        thread _id_8756( var_3, var_4 );
    }
}

_id_8799( var_0 )
{
    self endon( "fade_begin" );
    var_1 = 0.0;
    var_2 = 0.05 / var_0;

    while ( var_1 < 1.0 )
    {
        _id_8755( var_1 );
        var_1 += var_2;
        wait 0.05;
    }

    _id_8755( 1.0 );
}

_id_86DB( var_0, var_1 )
{
    self notify( "fade_begin" );
    _id_8755( 0 );
    _id_86C2( 0 );
    _id_86C2( 1 );
    _id_8754( var_0 );
    thread _id_8799( var_1 );
}

_id_879A( var_0 )
{
    self endon( "fade_begin" );
    var_1 = _id_86E2();
    var_2 = var_1 * 0.05 / var_0;

    while ( var_1 > 0.0 )
    {
        _id_8755( var_1 );
        var_1 -= var_2;
        wait 0.05;
    }

    _id_8755( 0.0 );
}

_id_86DC( var_0 )
{
    self notify( "fade_begin" );
    thread _id_879A( var_0 );
}

_id_86E8( var_0 )
{
    if ( isdefined( level._snd._id_36CD._id_6F22[var_0] ) )
        return level._snd._id_36CD._id_6F22[var_0];

    return undefined;
}

_id_879B( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_2FAD = var_1;
    var_3.index = var_0;
    var_3.type = var_2["type"];
    var_3._id_3BD1 = var_2["gain"];
    var_3._id_3A36 = var_2["freq"];
    var_3._id_7072 = var_2["q"];
    return var_3;
}

_id_8756( var_0, var_1 )
{
    var_2 = soundscripts\_snd::_id_86EE();
    var_3 = [];

    foreach ( var_5 in var_1._id_8034 )
    {
        var_6 = var_5["dsp_bus_name"];

        if ( var_6 == "all" || var_6 == "set_all" )
        {
            var_7 = _id_86E6();

            foreach ( var_9 in var_7 )
                var_3[var_9] = _id_879B( var_0, var_9, var_5 );

            continue;
        }

        if ( _id_86FF( var_6 ) )
        {
            var_3[var_6] = _id_879B( var_0, var_6, var_5 );
            continue;
        }
    }

    foreach ( var_13 in var_3 )
    {
        level.player seteq( var_13._id_2FAD, var_13.index, var_13.type, var_13._id_3BD1, var_13._id_3A36, var_13._id_7072 );
        var_2 soundscripts\_snd::_id_877A();
    }
}

_id_86C2( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_8754( undefined, var_1 );
}

_id_8706()
{
    level._snd._id_6330 = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level.script + ".csv";
    level._snd._id_6330._id_6F22 = soundscripts\_snd::_id_871B( "Filter", var_0, 6, "occlusion_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_8757( var_0 )
{
    if ( isdefined( level.player._id_32D8 ) && isdefined( level.player._id_32D8["player_has_red_flashing_overlay"] ) && level.player maps\_utility::_id_32D8( "player_has_red_flashing_overlay" ) )
        return;

    if ( !isdefined( var_0 ) )
    {
        _id_8752( "" );
        thread _id_86CC();
        return;
    }

    var_1 = _id_86EA( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_86E4() != var_0 )
    {
        _id_8752( var_0 );
        thread _id_8758( var_1._id_8034 );
    }
}

_id_86EA( var_0 )
{
    if ( isdefined( level._snd._id_6330._id_6F22[var_0] ) )
        return level._snd._id_6330._id_6F22[var_0];

    return undefined;
}

_id_8758( var_0 )
{
    var_1 = soundscripts\_snd::_id_86EE();

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3["dsp_bus_name"];

        if ( var_4 == "all" )
        {
            var_5 = _id_86E6();

            foreach ( var_7 in var_5 )
            {
                level.player setocclusion( var_7, var_3["freq"], var_3["type"], var_3["gain"], var_3["q"] );
                var_1 soundscripts\_snd::_id_877A();
            }

            break;
        }
        else
        {
            if ( _id_86FF( var_4 ) )
                level.player setocclusion( var_4, var_3["freq"], var_3["type"], var_3["gain"], var_3["q"] );
            else
            {

            }

            var_1 soundscripts\_snd::_id_877A();
        }
    }
}

_id_86D2()
{
    level._snd._id_6330._id_501E = 1;
}

_id_86CC()
{
    var_0 = soundscripts\_snd::_id_86EE();
    var_1 = _id_86E6();

    foreach ( var_3 in var_1 )
    {
        level.player deactivateocclusion( var_3 );
        var_0 soundscripts\_snd::_id_877A();
    }
}

_id_86CB()
{
    level._snd._id_6330._id_501E = 0;
    thread _id_86CC();
}

_id_86CF()
{
    level._snd._id_A3E1 = undefined;
}

_id_86D4()
{
    level._snd._id_A3E1 = 1;
}

_id_86F0()
{
    return isdefined( level._snd._id_A3E1 );
}

_id_86D0()
{
    _id_8754( undefined, 0 );
    _id_8754( undefined, 1 );
    _id_86CB();
    _id_86CF();
}

_id_86D5()
{
    var_0 = undefined;
    var_1 = "default";

    if ( isdefined( level._audio._id_A3E9._id_2507 ) && isdefined( level._audio._id_A3E9._id_A3F6[level._audio._id_A3E9._id_2507] ) )
    {
        var_2 = soundscripts\_audio_zone_manager::azm_get_current_zone();
        var_3 = level._audio._id_A3E9._id_A3F6[var_2];

        if ( isdefined( var_3["occlusion"] ) && var_3["occlusion"] != "none" )
            var_1 = var_3["occlusion"];

        if ( isdefined( var_3["filter"] ) && var_3["filter"] != "none" )
            var_0 = var_3["filter"];
    }

    if ( _id_86E4() != var_1 )
        var_1 = _id_86E4();

    _id_86D4();
    _id_8754( var_0, 0 );
    _id_8754( undefined, 1 );
    _id_8757( var_1 );
}
