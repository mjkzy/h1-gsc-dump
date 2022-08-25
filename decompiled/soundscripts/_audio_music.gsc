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

_id_5FF4()
{
    ams_init();

    if ( !isdefined( level._audio ) )
        level._audio = spawnstruct();

    level._audio._id_5FFB = spawnstruct();
    level._audio._id_5FFB._id_24B3 = [];
    level._audio._id_5FFB._id_24CC = "";
    level._audio._id_5FFB._id_6F37 = "";
    level._audio._id_5FFB._id_30A2 = 0;
    level._audio._id_5FFB._id_3336 = [ [ 0.0, 0.5 ], [ 0.9, 1.0 ], [ 1.0, 1.0 ] ];
    thread _id_600F();
}

_id_5FF7( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_5 = undefined;
    var_6 = _id_5FF3();
    var_7 = _id_600C( var_0 );
    var_8 = var_7["fade_in_time"];

    if ( isdefined( var_1 ) )
        var_8 = var_1;

    var_9 = 2.0;

    if ( isdefined( var_6 ) )
    {
        if ( isdefined( var_2 ) )
            var_9 = var_2;
        else if ( isdefined( var_1 ) )
            var_9 = var_1;
        else if ( isdefined( var_6["fade_out_time"] ) )
            var_9 = var_6["fade_out_time"];
    }

    var_10 = var_7["volume"];

    if ( isdefined( var_3 ) )
        var_10 = var_3;

    _id_6010( var_7["name"], var_8, var_9, var_10, var_4 );
}

_id_5FF8( var_0 )
{
    var_1 = 3.0;

    if ( _id_5FF5() )
    {
        var_2 = _id_600E( level._audio._id_5FFB._id_24CC );
        var_1 = var_2["fade_out_time"];
    }

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_6011( var_1 );
}

_id_5FF5()
{
    return isdefined( level._audio._id_5FFB._id_24CC ) && level._audio._id_5FFB._id_24CC != "";
}

_id_5FF3()
{
    var_0 = undefined;

    if ( _id_5FF5() )
        var_0 = _id_600E( level._audio._id_5FFB._id_24CC );

    return var_0;
}

_id_600C( var_0 )
{
    var_1 = _id_600E( var_0 );

    if ( !isdefined( var_1 ) )
    {
        var_1 = [];
        var_1["alias"] = var_0;
        var_1["volume"] = 1.0;
        var_1["fade_in_time"] = 1.5;
        var_1["fade_out_time"] = 1.5;
        var_1["auto_mix"] = 0;
        var_1["name"] = var_0;
        _id_600B( var_1 );
    }

    return var_1;
}

_id_6010( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;

    if ( isdefined( var_4 ) )
        var_5 = var_4;

    if ( var_0 == level._audio._id_5FFB._id_24CC && !var_5 )
        return;
    else
    {
        var_6 = level._audio._id_5FFB._id_6F37;
        var_7 = level._audio._id_5FFB._id_24CC;
        level._audio._id_5FFB._id_6F37 = level._audio._id_5FFB._id_24CC;
        level._audio._id_5FFB._id_24CC = var_0;
        var_8 = _id_600E( level._audio._id_5FFB._id_24CC );
        var_9 = _id_600E( level._audio._id_5FFB._id_6F37 );
        var_10 = undefined;

        if ( isdefined( var_9 ) )
            var_10 = var_9["alias"];

        soundscripts\_audio_stream_manager::_id_8655( var_8["alias"], var_1, var_2, var_3, var_10 );
    }
}

_id_6011( var_0 )
{
    soundscripts\_audio_stream_manager::_id_8659( var_0 );
}

_id_600D()
{
    return level._audio._id_5FFB._id_30A2;
}

_id_600E( var_0 )
{
    return level._audio._id_5FFB._id_24B3[var_0];
}

_id_600B( var_0 )
{
    level._audio._id_5FFB._id_24B3[var_0["name"]] = var_0;
}

_id_600F()
{
    if ( _id_600D() )
    {
        var_0 = 1.0;

        for (;;)
        {
            wait(var_0);

            if ( _id_600D() )
            {
                var_1 = soundscripts\_audio::aud_get_threat_level();
                var_2 = soundscripts\_audio::_id_2899( var_1, level._audio._id_5FFB._id_3336 );
            }
        }
    }
}

ams_init()
{
    level._snd._ams = spawnstruct();
    level._snd._ams._id_24CE = 0;
    level._snd._ams._id_24D2 = "";
    soundscripts\_snd::_id_874D( "ams_start", ::ams_start );
    soundscripts\_snd::_id_874D( "ams_stop", ::ams_stop );
    soundscripts\_snd::_id_874D( "ams_set_state", ::ams_set_state );
    soundscripts\_snd::_id_874D( "ams_set_proxy_vehicle", ::ams_set_proxy_vehicle );
    soundscripts\_snd::_id_874D( "ams_set_intensity", ::ams_set_intensity );
    soundscripts\_audio_vehicle_manager::avm_register_callback( "ams_intensity", ::ams_intensity );
    soundscripts\_audio_vehicle_manager::avm_register_callback( "ams_proxy_vehicle_speed", ::ams_proxy_vehicle_speed );
}

ams_start( var_0, var_1, var_2, var_3 )
{
    var_4 = amsx_get();
    var_4._id_7045 = soundscripts\_audio_vehicle_manager::avm_create_vehicle_proxy();
    var_5 = 3;
    var_6 = 3;

    if ( isdefined( var_0 ) && !isstring( var_0 ) )
    {
        var_7 = var_0;
        var_0 = var_7._id_6F21;
        var_1 = var_7._id_4DD2;
        var_2 = var_7._id_35F0;
        var_3 = var_7._id_35F5;
    }
    else
    {

    }

    ams_set_state( var_1 );
    var_8 = spawnstruct();
    var_8._id_6F21 = var_0;
    var_8._id_35F0 = soundscripts\_audio::aud_get_optional_param( var_5, var_2 );
    var_8._id_35F5 = soundscripts\_audio::aud_get_optional_param( var_6, var_3 );
    var_4._id_7045 soundscripts\_snd::_id_870C( "snd_start_vehicle", var_8 );
}

ams_stop( var_0 )
{
    var_0 = soundscripts\_audio::aud_get_optional_param( 3.0, var_0 );
    var_1 = amsx_get_proxy();
    var_1 soundscripts\_snd::_id_870C( "snd_stop_vehicle", var_0 );
    var_1 delete();
}

ams_get_state()
{
    return level._snd._ams._id_24D2;
}

ams_set_state( var_0 )
{
    level._snd._ams._id_24D2 = var_0;
}

ams_set_intensity( var_0 )
{
    var_1 = amsx_get();
    var_1._id_24CE = var_0;
}

ams_set_proxy_vehicle( var_0 )
{
    level._snd._ams._id_7045._id_9C78 = var_0;
}

ams_intensity()
{
    return amsx_get()._id_24CE;
}

ams_player_health()
{
    return level.player.health;
}

ams_proxy_vehicle_speed()
{
    var_0 = 0;
    var_1 = soundscripts\_audio_vehicle_manager::avmx_get_vehicle_entity();
    var_2 = amsx_get_proxy_vehicle_ent();

    if ( isdefined( var_2 ) )
        var_0 = var_2 vehicle_getspeed();

    return var_0;
}

amsx_get()
{
    return level._snd._ams;
}

amsx_get_proxy()
{
    return level._snd._ams._id_7045;
}

amsx_get_proxy_vehicle_ent()
{
    var_0 = undefined;
    var_1 = amsx_get_proxy();

    if ( isdefined( var_1 ) )
        var_0 = level._snd._ams._id_7045._id_9C78;

    return var_0;
}
