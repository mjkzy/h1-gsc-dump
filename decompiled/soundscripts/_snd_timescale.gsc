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

_id_877C()
{
    _id_8707();
    _id_8753( "" );
}

_id_8753( var_0 )
{
    level._snd._id_937D._id_24F6 = var_0;
}

_id_86E5()
{
    return level._snd._id_937D._id_24F6;
}

_id_8707()
{
    level._snd._id_937D = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level.script + ".csv";
    level._snd._id_937D._id_6F22 = soundscripts\_snd::_id_871B( "Timescale", var_0, 3, "timescale_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_875A( var_0 )
{
    var_1 = _id_86EF( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_86E5() != var_0 )
        thread _id_875F( var_1 );
}

_id_86EF( var_0 )
{
    if ( isdefined( level._snd._id_937D._id_6F22 ) && isdefined( level._snd._id_937D._id_6F22[var_0] ) )
        return level._snd._id_937D._id_6F22[var_0];

    return undefined;
}

_id_875F( var_0 )
{
    var_1 = soundscripts\_snd::_id_86EE();

    foreach ( var_3 in var_0._id_8034 )
    {
        var_4 = var_3["dsp_bus_name"];

        if ( var_4 == "all" )
        {
            var_5 = soundscripts\_snd_filters::_id_86E6();

            foreach ( var_7 in var_5 )
            {
                soundsettimescalefactor( var_7, var_3["scalefactor"] );
                var_1 soundscripts\_snd::_id_877A();
            }

            continue;
        }

        soundsettimescalefactor( var_4, var_3["scalefactor"] );
    }
}

_id_875B( var_0 )
{
    thread _id_875C( var_0 );
}

_id_875C( var_0 )
{
    var_1 = soundscripts\_snd::_id_86EE();
    var_2 = soundscripts\_snd_filters::_id_86E6();

    foreach ( var_4 in var_2 )
    {
        soundsettimescalefactor( var_4, var_0 );
        var_1 soundscripts\_snd::_id_877A();
    }
}

_id_875D( var_0, var_1 )
{
    thread _id_875E( var_0, var_1 );
}

_id_875E( var_0, var_1 )
{
    var_2 = soundscripts\_snd::_id_86EE();

    foreach ( var_4 in var_0 )
    {
        soundsettimescalefactor( var_4, var_1 );
        var_2 soundscripts\_snd::_id_877A();
    }
}
