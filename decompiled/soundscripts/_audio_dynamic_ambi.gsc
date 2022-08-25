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

_id_25B6()
{
    if ( !isdefined( level._audio ) )
        level._audio = spawnstruct();

    if ( !isdefined( level._audio._id_25B3 ) )
    {
        level._audio._id_25B3 = spawnstruct();
        level._audio._id_25B3._id_5875 = 0;
        level._audio._id_25B3._id_858B = 0;
        level._audio._id_25B3._id_6499 = 0;
        level._audio._id_25B3._id_7D9D = 1;
        level._audio._id_25B3.playing = [];
        level._audio._id_25B3.playing["zone"] = [];
        level._audio._id_25B3.playing["free"] = [];
        level._audio._id_25B3._id_20D6 = [];
        level._audio._id_25B3.callbacks = [];
        level._audio._id_25B3._id_6F1F = [];
        level._audio._id_25B3._id_20D5 = [];
        level._audio._id_25B3._id_5869 = [];
        level._audio._id_25B3._id_9BE7 = 0;
        level._audio._id_25B3._id_3316 = 0;
        level._audio._id_25B3._id_586D = 0;
        level._audio._id_25B3._id_5A04 = 15;
    }
}

_id_25BC( var_0 )
{
    level._audio._id_25B3._id_5A04 = var_0;
}

_id_25C7()
{
    level._audio._id_25B3._id_9BE7 = 1;
}

_id_25C8( var_0, var_1 )
{
    _id_25E7( "zone", var_0, undefined, var_1 );
}

_id_25BF( var_0, var_1, var_2, var_3 )
{
    _id_25E7( "free", var_0, var_1, var_2, undefined, undefined, undefined, var_3 );
}

_id_25C0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_3 ) )
        thread _id_25DD( var_0, var_1, var_2, var_3, var_4, var_5 );
    else
        _id_25E7( "free", var_0, var_2, undefined, var_1, undefined, undefined, var_5 );
}

_id_25C4( var_0, var_1, var_2 )
{
    if ( isstring( var_1 ) )
        var_3 = var_1;
    else
        var_3 = var_0;

    level notify( var_3 + "dist_monitor_stop" );
    _id_25C3( var_3, var_2 );
}

_id_25B8( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5.point = var_1;
    var_5.label = var_2;
    var_5._id_5C22 = var_3;
    var_5._id_59FC = var_4;
    return var_5;
}

_id_25DD( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isstring( var_2 ) )
        level endon( var_2 + "dist_monitor_stop" );
    else
        level endon( var_0 + "dist_monitor_stop" );

    var_6 = 1.0;

    if ( isdefined( var_4 ) )
        var_6 = var_4;

    var_7 = 1;

    for (;;)
    {
        var_8 = distance( level.player.origin, var_1 );

        if ( var_8 < var_3 )
        {
            if ( var_7 )
            {
                var_7 = 0;
                _id_25E7( "free", var_0, var_2, undefined, var_1, undefined, undefined, var_5 );
            }
        }
        else if ( !var_7 )
        {
            var_7 = 1;

            if ( isdefined( var_2 ) )
                _id_25E8( "free", var_2, var_6 );
            else
                _id_25E8( "free", var_0, var_6 );
        }

        wait 1;
    }
}

_id_25C1( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "attach";

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    _id_25E7( "free", var_0, var_2, var_4, undefined, var_1, var_5 );
}

_id_25C2( var_0, var_1 )
{
    var_2 = 2.0;

    if ( isdefined( var_0 ) )
        var_2 = var_0;

    var_3 = "all";

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( var_3 == "free" || var_3 == "all" )
    {
        foreach ( var_6, var_5 in level._audio._id_25B3.playing["free"] )
            _id_25C3( var_6, var_2 );
    }

    if ( var_3 == "zone" || var_3 == "all" )
    {
        foreach ( var_6, var_5 in level._audio._id_25B3.playing["zone"] )
            _id_25C9( var_6, var_2 );
    }
}

_id_25C5( var_0 )
{
    _id_25E8( "zone", undefined, var_0 );
}

_id_25C9( var_0, var_1 )
{
    _id_25E8( "zone", var_0, var_1 );
}

_id_25C3( var_0, var_1 )
{
    _id_25E8( "free", var_0, var_1 );
}

_id_25BB( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        if ( var_1 == 0 )
            _id_25C9( var_0, 2.0 );
        else
            _id_25C8( var_0, var_1 );
    }

    if ( isdefined( var_2 ) && var_2 != "none" )
    {
        if ( var_3 == 0 )
            _id_25C9( var_2, 2.0 );
        else
            _id_25C8( var_2, var_3 );
    }
}

_id_25BD( var_0, var_1 )
{
    if ( !isdefined( level._audio._id_25B3.callback ) )
        level._audio._id_25B3.callback = [];

    level._audio._id_25B3.callback[var_0] = var_1;
}

_id_25BE( var_0, var_1 )
{
    var_2 = [];

    if ( isdefined( level._audio._id_25B3._id_6F1F[var_0] ) )
        var_2 = level._audio._id_25B3._id_6F1F[var_0];
    else if ( level._audio._id_25B3._id_9BE7 )
    {
        var_2 = _id_25D9( var_0, 1 );
        level._audio._id_25B3._id_6F1F[var_0] = var_2;
    }
    else
    {
        var_2 = _id_25D9( var_0, 0 );
        level._audio._id_25B3._id_6F1F[var_0] = var_2;
    }

    foreach ( var_4 in var_2["components"] )
        _id_25BD( var_4, var_1 );
}

_id_25BA( var_0, var_1 )
{
    var_2 = "free";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( isdefined( level._audio._id_25B3.playing[var_2][var_0] ) )
        level._audio._id_25B3.playing[var_2][var_0]["paused"] = 1;
}

_id_25C6( var_0, var_1 )
{
    var_2 = "free";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( isdefined( level._audio._id_25B3.playing[var_2][var_0] ) )
    {
        level._audio._id_25B3.playing[var_2][var_0]["paused"] = 0;
        level notify( var_2 + "_" + var_0 + "_event" );
    }
}

_id_25B9( var_0, var_1 )
{
    var_2 = "free";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( isdefined( level._audio._id_25B3.playing[var_2][var_0] ) )
        level notify( var_2 + "_" + var_0 + "_event" );
}

_id_25B7( var_0, var_1, var_2, var_3 )
{
    var_4 = "free";

    if ( isdefined( level._audio._id_25B3.playing[var_4][var_0] ) && isdefined( level._audio._id_25B3.playing[var_4][var_1] ) )
    {
        var_2 = min( var_2, var_3 );
        var_3 = max( var_2, var_3 );

        if ( !isdefined( level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"] ) )
            level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"] = [];

        var_5 = level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"].size;
        level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"][var_5] = spawnstruct();
        level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"][var_5].name = var_1;
        level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"][var_5]._id_5C22 = max( var_2, 0 );
        level._audio._id_25B3.playing[var_4][var_0]["linked_dambs"][var_5]._id_59FC = max( var_3, 0 );
    }
}

_id_25E7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 1.0;

    if ( isdefined( var_3 ) )
        var_8 = var_3;

    var_9 = var_1;

    if ( isstring( var_2 ) )
        var_9 = var_2;

    if ( !isdefined( level._audio._id_25B3.playing[var_0][var_9] ) )
    {
        var_10 = _id_25D4( var_1 );

        if ( !isdefined( var_10 ) )
            return;

        level._audio._id_25B3.playing[var_0][var_9] = var_10;
        level._audio._id_25B3.playing[var_0][var_9]["prob_scale"] = var_8;
        level._audio._id_25B3.playing[var_0][var_9]["paused"] = 0;

        if ( isdefined( var_7 ) )
            _id_25E6( var_9, var_7 );

        if ( isdefined( var_5 ) )
        {
            level._audio._id_25B3.playing[var_0][var_9]["entity"] = var_5;
            level._audio._id_25B3.playing[var_0][var_9]["mode"] = var_6;
        }

        thread _id_25E4( var_0, var_9, var_4 );
    }
    else if ( level._audio._id_25B3.playing[var_0][var_9]["prob_scale"] != var_8 )
        level._audio._id_25B3.playing[var_0][var_9]["prob_scale"] = var_8;
}

_id_25E6( var_0, var_1 )
{
    if ( isarray( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            _id_25E7( "free", var_3.name, var_3.label, undefined, var_3.point );
            _id_25BA( var_3.label );
            _id_25B7( var_0, var_3.label, var_3._id_5C22, var_3._id_59FC );
        }
    }
    else
    {
        _id_25E7( "free", var_1.name, var_1.label, undefined, var_1.point );
        _id_25BA( var_1.label );
        _id_25B7( var_0, var_1.label, var_1._id_5C22, var_1._id_59FC );
    }
}

_id_25E8( var_0, var_1, var_2 )
{
    var_3 = 2.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    if ( var_0 == "zone" && !isdefined( var_1 ) )
    {
        if ( isdefined( level._audio._id_25B3.playing[var_0] ) )
        {
            foreach ( var_1, var_5 in level._audio._id_25B3.playing[var_0] )
            {
                level._audio._id_25B3.playing[var_0][var_1]["fade"] = var_3;
                level notify( var_0 + "_" + var_1 + "_stop" );
            }
        }
    }
    else if ( isdefined( level._audio._id_25B3.playing[var_0][var_1] ) )
    {
        level._audio._id_25B3.playing[var_0][var_1]["fade"] = var_3;
        level notify( var_0 + "_" + var_1 + "_stop" );
    }
}

_id_25EB( var_0, var_1, var_2 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );
    var_3 = level._audio._id_25B3.playing[var_0][var_1]["event_time"];
    var_4 = min( var_3[0], var_3[1] );
    var_5 = max( var_3[0], var_3[1] );
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( level._audio._id_25B3.playing[var_0][var_1]["first_event"] ) )
    {
        var_3 = level._audio._id_25B3.playing[var_0][var_1]["first_event"];
        var_6 = min( var_3[0], var_3[1] );
        var_7 = max( var_3[0], var_3[1] );
    }

    var_8 = undefined;

    if ( isdefined( var_6 ) )
        var_8 = randomfloatrange( var_6, var_7 );
    else
        var_8 = randomfloatrange( var_4, var_5 );

    for (;;)
    {
        if ( !level._audio._id_25B3.playing[var_0][var_1]["paused"] )
            wait(var_8);

        if ( level._audio._id_25B3.playing[var_0][var_1]["paused"] )
            level waittill( var_0 + "_" + var_1 + "_event" );

        var_9 = _id_25E3( var_0, var_1 );

        if ( !isdefined( var_9 ) )
            continue;

        var_10 = _id_25D0( var_0, var_1, var_9, var_1 );

        if ( var_10._id_9C23 )
        {
            if ( var_10._id_9C20 && !isdefined( var_10._id_32D5 ) )
            {
                level notify( var_0 + "_" + var_1 + "_stop" );
                break;
            }

            var_11 = _id_25CD( var_10, var_1, var_9 );

            if ( var_11._id_8FAC )
            {
                if ( level._audio._id_25B3._id_7D9D )
                    _id_25E1( var_0, var_1, var_11 );
                else
                    thread _id_25E1( var_0, var_1, var_11 );
            }
        }
        else
            soundscripts\_audio::aud_print_warning( "Dynamic ambience is playing back serially and using components which do not define oneshots or loops" );

        var_8 = randomfloatrange( var_4, var_5 );
    }
}

_id_25E5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_2["single_loops"] ) )
    {
        foreach ( var_6 in var_2["single_loops"] )
        {
            var_7 = undefined;

            if ( isdefined( var_4 ) )
                var_7 = spawn( "script_origin", var_4.origin );
            else if ( isdefined( var_3 ) )
                var_7 = spawn( "script_origin", var_3 );
            else
                var_7 = spawn( "script_origin", level.player.origin );

            level._audio._id_25B3._id_586D++;
            var_7 playloopsound( var_6 );

            if ( isdefined( var_4 ) )
                var_7 linkto( var_4 );

            var_8 = level._audio._id_25B3._id_858B;
            level._audio._id_25B3.playing[var_0][var_1]["single_loops"][var_8] = var_7;
            level._audio._id_25B3._id_858B++;
        }
    }
}

_id_25D0( var_0, var_1, var_2, var_1 )
{
    var_3 = spawnstruct();
    var_3._id_9C23 = 0;

    if ( !isdefined( var_1["single_loops"] ) )
        var_3._id_858C = 0;
    else
        var_3._id_858C = 1;

    if ( isdefined( var_1["oneshots"] ) || isdefined( var_1["loops"] ) )
    {
        var_3._id_9C23 = 1;

        if ( !isdefined( var_1["radius"] ) )
            var_1["radius"] = [ 0.0, 0.01 ];

        var_3._id_5C32 = min( var_1["radius"][0], var_1["radius"][1] );
        var_3._id_5A12 = max( var_1["radius"][0], var_1["radius"][1] );

        if ( isarray( var_1["event_time"] ) )
        {
            var_3.min_time = min( var_1["event_time"][0], var_1["event_time"][1] );
            var_3.max_time = max( var_1["event_time"][0], var_1["event_time"][1] );
        }

        if ( isarray( var_1["first_event"] ) )
        {
            var_3._id_380A = 1;
            var_3._id_380C = min( var_1["first_event"][0], var_1["first_event"][1] );
            var_3._id_380B = max( var_1["first_event"][0], var_1["first_event"][1] );
        }

        if ( isarray( var_1["pitch"] ) )
        {
            var_3._id_5C2E = min( var_1["pitch"][0], var_1["pitch"][1] );
            var_3._id_5A0C = max( var_1["pitch"][0], var_1["pitch"][1] );
        }

        if ( isarray( var_1["travel_time"] ) )
        {
            var_3._id_5C3A = min( var_1["travel_time"][0], var_1["travel_time"][1] );
            var_3._id_5A1A = max( var_1["travel_time"][0], var_1["travel_time"][1] );

            if ( isarray( var_1["delta"] ) )
            {
                var_3._id_5C23 = min( var_1["delta"][0], var_1["delta"][1] );
                var_3._id_59FD = max( var_1["delta"][0], var_1["delta"][1] );
            }
            else
            {
                var_3._id_5C24 = min( var_1["delta_angle"][0], var_1["delta_angle"][1] );
                var_3._id_59FE = max( var_1["delta_angle"][0], var_1["delta_angle"][1] );
            }
        }

        if ( isarray( var_1["pitch_time"] ) )
        {
            var_3._id_5C30 = min( var_1["pitch_time"][0], var_1["pitch_time"][1] );
            var_3._id_5A0E = max( var_1["pitch_time"][0], var_1["pitch_time"][1] );
        }

        if ( isdefined( var_1["cone"] ) )
        {
            var_3._id_5C39 = min( var_1["cone"][0], var_1["cone"][1] );
            var_3._id_5A19 = max( var_1["cone"][0], var_1["cone"][1] );
        }
    }
    else
        var_3._id_9C23 = 0;

    var_3._id_9C20 = 0;

    if ( isdefined( level._audio._id_25B3.playing[var_1][var_2]["entity"] ) )
    {
        var_3._id_9C20 = 1;
        var_3._id_32D5 = level._audio._id_25B3.playing[var_1][var_2]["entity"];
        var_3._id_5D35 = level._audio._id_25B3.playing[var_1][var_2]["mode"];
    }

    var_3._id_6FDA = level._audio._id_25B3.playing[var_1][var_2]["prob_scale"];
    return var_3;
}

_id_25DE( var_0, var_1, var_2 )
{
    for (;;)
    {
        if ( !isdefined( var_2 ) )
            level notify( var_0 + "_" + var_1 + "_stop" );

        wait 1.0;
    }
}

_id_25CD( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();

    if ( randomfloat( 1.0 ) < var_0._id_6FDA )
    {
        var_4._id_8FAC = 1;

        if ( isdefined( level._audio._id_25B3.callbacks[var_1] ) )
            thread [[ level._audio._id_25B3.callback[var_1] ]]();
        else
        {
            var_4.alias = _id_25E2( var_2 );
            var_4.point = var_3;
            var_4._id_32D5 = var_0._id_32D5;
            var_4._id_5D35 = var_0._id_5D35;
            var_5 = randomfloatrange( var_0._id_5C32, var_0._id_5A12 );
            var_6 = undefined;

            if ( isdefined( var_0._id_5C39 ) )
                var_6 = randomfloatrange( var_0._id_5C39, var_0._id_5A19 );
            else
                var_6 = randomfloatrange( 0, 360 );

            var_7 = var_5 * cos( var_6 );
            var_8 = var_5 * sin( var_6 );
            var_4._id_8C42 = ( var_7, var_8, 0 );

            if ( isdefined( var_0._id_5C3A ) )
            {
                var_4._id_9728 = randomfloatrange( var_0._id_5C3A, var_0._id_5A1A );

                if ( isdefined( var_0._id_5C23 ) )
                {
                    var_5 = randomfloatrange( var_0._id_5C23, var_0._id_59FD );
                    var_6 = randomfloatrange( 0, 360 );
                    var_7 = var_5 * cos( var_6 );
                    var_8 = var_5 * sin( var_6 );
                    var_4._id_313F = var_4._id_8C42 + ( var_7, var_8, 0 );
                }
                else
                {
                    var_9 = randomfloatrange( var_0._id_5C24, var_0._id_59FE );
                    var_9 *= 0.5;
                    var_10 = level.player.origin;

                    if ( isdefined( var_3 ) )
                        var_10 = var_3;

                    var_11 = var_4._id_8C42 - var_10;
                    var_7 = var_11[0] * cos( var_9 ) - var_11[1] * sin( var_9 );
                    var_8 = var_11[0] * sin( var_9 ) + var_11[1] * cos( var_9 );
                    var_4._id_313F = var_4._id_8C42 + ( var_7, var_8, 0 );
                }
            }

            if ( isdefined( var_0._id_5C2E ) )
                var_4._id_8C2D = randomfloatrange( var_0._id_5C2E, var_0._id_5A0C );

            if ( isdefined( var_0._id_5C30 ) )
            {
                var_4._id_313D = randomfloatrange( var_0._id_5C2E, var_0._id_5A0C );
                var_4._id_6857 = randomfloatrange( var_0._id_5C30, var_0._id_5A0E );
            }
        }
    }
    else
        var_4._id_8FAC = 0;

    return var_4;
}

_id_25E9( var_0, var_1 )
{
    wait(var_1);
    _id_25B9( var_0 );
}

_id_25DC( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0._id_380A ) )
        var_1 = randomfloatrange( var_0._id_380C, var_0._id_380B );
    else
        var_1 = randomfloatrange( var_0.min_time, var_0.max_time );

    return var_1;
}

_id_25EA( var_0, var_1, var_2, var_3 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );
    var_4 = _id_25D0( var_0, var_1, var_2, var_1 );

    if ( var_4._id_858C )
    {
        _id_25E5( var_0, var_1, var_2, var_3, var_4._id_32D5 );

        if ( var_4._id_9C20 && !var_4._id_9C23 )
            thread _id_25DE( var_0, var_1, var_4._id_32D5 );
    }

    if ( var_4._id_9C23 )
    {
        var_5 = _id_25DC( var_4 );

        for (;;)
        {
            if ( !level._audio._id_25B3.playing[var_0][var_1]["paused"] )
                wait(var_5);

            if ( level._audio._id_25B3.playing[var_0][var_1]["paused"] )
                level waittill( var_0 + "_" + var_1 + "_event" );

            if ( var_4._id_9C20 && !isdefined( var_4._id_32D5 ) )
            {
                level notify( var_0 + "_" + var_1 + "_stop" );
                break;
            }

            if ( isdefined( level._audio._id_25B3.playing[var_0][var_1]["linked_dambs"] ) )
            {
                foreach ( var_7 in level._audio._id_25B3.playing[var_0][var_1]["linked_dambs"] )
                {
                    var_8 = randomfloatrange( var_7._id_5C22, var_7._id_59FC );
                    thread _id_25E9( var_7.name, var_8 );
                }
            }

            var_4._id_6FDA = level._audio._id_25B3.playing[var_0][var_1]["prob_scale"];
            var_10 = _id_25CD( var_4, var_1, var_2, var_3 );

            if ( var_10._id_8FAC )
                thread _id_25E1( var_0, var_1, var_10 );

            var_5 = randomfloatrange( var_4.min_time, var_4.max_time );
        }
    }
}

_id_25EC( var_0, var_1, var_2, var_3 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );
    var_3 waittill( "sounddone" );

    if ( isdefined( level._audio._id_25B3.playing[var_0][var_1]["oneshots"][var_2] ) )
    {
        var_3 delete();
        _id_275D();
        level._audio._id_25B3.playing[var_0][var_1]["oneshots"][var_2] = undefined;
    }
}

_id_25E1( var_0, var_1, var_2 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );

    if ( var_2.alias["type"] == "loop" )
        _id_25DF( var_0, var_1, var_2 );
    else
        _id_25E0( var_0, var_1, var_2 );
}

_id_25E0( var_0, var_1, var_2 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );
    var_3 = level.player.origin;

    if ( isdefined( var_2._id_32D5 ) )
        var_3 = var_2._id_32D5.origin;
    else if ( isdefined( var_2.point ) )
        var_3 = var_2.point;

    if ( level._audio._id_25B3._id_3316 < level._audio._id_25B3._id_5A04 )
    {
        var_4 = spawn( "script_origin", var_3 + var_2._id_8C42 );

        if ( isdefined( var_2._id_32D5 ) && var_2._id_5D35 == "attach" )
            var_4 linkto( var_2._id_32D5 );

        var_4 playsound( var_2.alias["name"], "sounddone" );
        var_4 thread soundscripts\_audio::aud_check_sound_done();

        if ( !var_4._id_88AA )
        {
            var_5 = level._audio._id_25B3._id_6499;
            level._audio._id_25B3.playing[var_0][var_1]["oneshots"][var_5] = var_4;
            level._audio._id_25B3._id_6499++;
            _id_4C3A();

            if ( isdefined( var_2._id_313F ) && !isdefined( var_2.entity ) )
            {
                var_6 = 0.1 * var_2._id_9728;
                var_4 moveto( var_3 + var_2._id_313F, var_2._id_9728, var_6, var_6 );
            }

            if ( isdefined( var_2._id_8C2D ) )
                var_4 scalepitch( var_2._id_8C2D );

            if ( isdefined( var_2._id_6857 ) )
            {
                wait 0.05;

                if ( isdefined( var_4 ) && !var_4._id_88AA )
                    var_4 scalepitch( var_2._id_313D, var_2._id_6857 );
            }

            thread _id_25EC( var_0, var_1, var_5, var_4 );
            var_4 waittill( "sounddone" );
            return;
        }

        var_4 delete();
        return;
    }
    else
        soundscripts\_audio::aud_print_warning( "TRYING TO PLAY ONESHOT WITH DAMB REF COUNT AT MAXIMUM!" );
}

_id_25DF( var_0, var_1, var_2 )
{
    level endon( var_0 + "_" + var_1 + "_stop" );

    if ( level._audio._id_25B3._id_3316 < level._audio._id_25B3._id_5A04 )
    {
        var_3 = level.player.origin;

        if ( isdefined( var_2._id_32D5 ) )
            var_3 = var_2._id_32D5.origin;
        else if ( isdefined( var_2.point ) )
            var_3 = var_2.point;

        var_4 = var_2.alias["name"];
        var_5 = _id_25D8( var_4 );

        if ( !isdefined( var_5 ) )
            return;

        var_6 = min( var_5["duration"][0], var_5["duration"][1] );
        var_7 = max( var_5["duration"][0], var_5["duration"][1] );
        var_8 = randomfloatrange( var_6, var_7 );
        var_9 = var_5["loop_alias"];
        var_10 = var_5["fade_in"];
        var_11 = var_5["fade_out"];
        var_12 = undefined;

        if ( isdefined( var_5["end_alias"] ) )
            var_12 = var_5["end_alias"];

        var_13 = spawn( "script_origin", var_3 + var_2._id_8C42 );

        if ( isdefined( var_2._id_32D5 ) && var_2._id_5D35 == "attach" )
            var_13 linkto( var_2._id_32D5 );

        var_13 playloopsound( var_9 );

        if ( isdefined( var_10 ) )
        {
            var_13 scalevolume( 0.0 );
            wait 0.05;
            var_13 scalevolume( 1.0, var_10 );
        }

        var_13 thread soundscripts\_audio::aud_check_sound_done();

        if ( !var_13._id_88AA )
        {
            var_14 = level._audio._id_25B3._id_5875;
            level._audio._id_25B3.playing[var_0][var_1]["loops"][var_14] = var_13;
            _id_4C3A();
            level._audio._id_25B3._id_5875++;
            var_15 = 0;

            if ( isdefined( var_2._id_5D35 ) && var_2._id_5D35 == "free" && isdefined( var_2._id_313F ) )
                var_15 = 1;
            else if ( !isdefined( var_2._id_5D35 ) && isdefined( var_2._id_313F ) )
                var_15 = 1;

            if ( var_15 )
            {
                var_16 = 0.1 * var_2._id_9728;
                var_13 moveto( var_3 + var_2._id_313F, var_2._id_9728, var_16, var_16 );
            }

            if ( isdefined( var_2._id_8C2D ) )
                var_13 setpitch( var_2._id_8C2D );

            if ( isdefined( var_2._id_6857 ) )
            {
                wait 0.05;

                if ( isdefined( var_13 ) && !var_13._id_88AA )
                    var_13 setpitch( var_2._id_313D, var_2._id_6857 );
            }

            wait(var_8);

            if ( !var_13._id_88AA )
            {
                if ( isdefined( level._audio._id_25B3.playing[var_0][var_1]["loops"][var_14] ) )
                {
                    if ( isdefined( var_12 ) )
                    {
                        var_17 = spawn( "script_origin", var_13.origin );
                        var_17 playsound( var_12, "sounddone" );
                        var_18 = level._audio._id_25B3._id_6499;
                        level._audio._id_25B3._id_6499++;
                        level._audio._id_25B3.playing[var_0][var_1]["oneshots"][var_18] = var_17;
                        _id_4C3A();
                        thread _id_25EC( var_0, var_1, var_18, var_17 );
                    }

                    if ( isdefined( var_11 ) )
                        thread soundscripts\_audio::aud_fade_loop_out_and_delete( var_13, var_11 );
                    else
                    {
                        var_13 stoploopsound();
                        wait 0.05;
                        var_13 delete();
                    }

                    _id_275D();
                    level._audio._id_25B3.playing[var_0][var_1]["loops"][var_14] = undefined;
                    return;
                }

                return;
            }

            var_13 stoploopsound();
            var_13 delete();
            _id_275D();
            level._audio._id_25B3.playing[var_0][var_1]["loops"][var_14] = undefined;
            return;
            return;
        }

        var_13 delete();
        return;
    }
    else
        soundscripts\_audio::aud_print_warning( "TRYING TO PLAY LOOP WITH DAMB REF COUNT AT MAXIMUM!" );
}

_id_25E3( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in level._audio._id_25B3.playing[var_0][var_1]["components"] )
    {
        var_5 = var_4[1];
        var_2 += var_5;
    }

    var_7 = randomfloat( var_2 );
    var_8 = 0.0;
    var_9 = undefined;

    foreach ( var_4 in level._audio._id_25B3.playing[var_0][var_1]["components"] )
    {
        var_11 = var_8 + var_4[1];

        if ( var_7 >= var_8 && var_7 < var_11 )
        {
            var_9 = var_4[0];
            break;
        }

        var_8 = var_11;
    }

    var_13 = _id_25D3( var_9 );

    if ( !isdefined( var_13 ) )
        return;

    var_13["name"] = var_9;
    return var_13;
}

_id_25E2( var_0 )
{
    var_1 = var_0["loops"];
    var_2 = var_0["oneshots"];
    var_3 = undefined;

    if ( !isdefined( level._audio._id_25B3._id_20D6[var_0["name"]] ) )
    {
        var_3 = 0;

        if ( isdefined( var_1 ) )
        {
            if ( isstring( var_1[0] ) )
                var_3 += var_1[1];
            else
            {
                foreach ( var_5 in var_1 )
                    var_3 += var_5[1];
            }
        }

        if ( isdefined( var_2 ) )
        {
            if ( isstring( var_2[0] ) )
                var_3 += var_2[1];
            else
            {
                foreach ( var_5 in var_2 )
                    var_3 += var_5[1];
            }
        }

        level._audio._id_25B3._id_20D6[var_0["name"]] = var_3;
    }
    else
        var_3 = level._audio._id_25B3._id_20D6[var_0["name"]];

    var_9 = randomfloatrange( 0.0, var_3 );
    var_10 = undefined;
    var_11 = undefined;
    var_12 = 0.0;

    if ( isdefined( var_1 ) )
    {
        if ( isstring( var_1[0] ) )
        {
            var_13 = var_12 + var_1[1];

            if ( var_9 >= var_12 && var_9 < var_13 )
            {
                var_10 = var_1[0];
                var_11 = "loop";
            }
            else
                var_12 = var_13;
        }
        else
        {
            foreach ( var_5 in var_1 )
            {
                var_13 = var_12 + var_5[1];

                if ( var_9 >= var_12 && var_9 < var_13 )
                {
                    var_10 = var_5[0];
                    var_11 = "loop";
                    break;
                }
                else
                    var_12 = var_13;
            }
        }
    }

    if ( !isdefined( var_10 ) && isdefined( var_2 ) )
    {
        if ( isarray( var_2 ) )
        {
            foreach ( var_5 in var_2 )
            {
                var_13 = var_12 + var_5[1];

                if ( var_9 >= var_12 && var_9 < var_13 )
                {
                    var_10 = var_5[0];
                    var_11 = "oneshot";
                    break;
                }
                else
                    var_12 = var_13;
            }
        }
        else
        {
            var_13 = var_12 + var_2[1];

            if ( var_9 >= var_12 && var_9 < var_13 )
            {
                var_10 = var_2[0];
                var_11 = "oneshot";
            }
            else
                var_12 = var_13;
        }
    }

    var_18 = [];
    var_18["name"] = var_10;
    var_18["type"] = var_11;
    return var_18;
}

_id_25D8( var_0 )
{
    var_1 = [];

    if ( isdefined( level._audio._id_25B3._id_5869[var_0] ) )
        var_1 = level._audio._id_25B3._id_5869[var_0];
    else
        var_1 = _id_25D6( var_0, 1 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._audio._id_25B3._id_5869[var_0] = var_1;
    return var_1;
}

_id_25D3( var_0 )
{
    if ( !isdefined( level._audio._id_25B3._id_20D5 ) )
        level._audio._id_25B3._id_20D5 = [];

    var_1 = [];

    if ( isdefined( level._audio._id_25B3._id_20D5[var_0] ) )
        var_1 = level._audio._id_25B3._id_20D5[var_0];

    var_1 = _id_25D1( var_0, 1 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._audio._id_25B3._id_20D5[var_0] = var_1;
    return var_1;
}

_id_25E4( var_0, var_1, var_2 )
{
    level._audio._id_25B3.playing[var_0][var_1]["loops"] = [];
    level._audio._id_25B3.playing[var_0][var_1]["single_loops"] = [];
    level._audio._id_25B3.playing[var_0][var_1]["oneshots"] = [];

    if ( !isdefined( level._audio._id_25B3.playing[var_0][var_1]["event_time"] ) )
    {
        foreach ( var_4 in level._audio._id_25B3.playing[var_0][var_1]["components"] )
        {
            var_5 = _id_25D3( var_4 );

            if ( !isdefined( var_5 ) )
                return;

            var_5["name"] = var_4;
            thread _id_25EA( var_0, var_1, var_5, var_2 );
        }
    }
    else
        thread _id_25EB( var_0, var_1, var_2 );

    level waittill( var_0 + "_" + var_1 + "_stop" );
    wait 0.1;

    foreach ( var_8 in level._audio._id_25B3.playing[var_0][var_1]["loops"] )
        thread _id_25CE( var_8, level._audio._id_25B3.playing[var_0][var_1]["fade"], 0 );

    foreach ( var_8 in level._audio._id_25B3.playing[var_0][var_1]["single_loops"] )
        thread _id_25CE( var_8, level._audio._id_25B3.playing[var_0][var_1]["fade"], 1 );

    foreach ( var_8 in level._audio._id_25B3.playing[var_0][var_1]["oneshots"] )
        thread _id_25CF( var_8, level._audio._id_25B3.playing[var_0][var_1]["fade"] );

    level._audio._id_25B3.playing[var_0][var_1] = undefined;
}

_id_25CF( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_0 scalevolume( 0.0, var_1 );
        wait(var_1);
        var_0 stopsounds();
        wait 0.05;
        var_0 delete();
        _id_275D();
    }
}

_id_25CE( var_0, var_1, var_2 )
{
    var_0 scalevolume( 0.0, var_1 );
    wait(var_1);

    if ( isdefined( var_0 ) )
    {
        var_0 stoploopsound();
        wait 0.05;
        var_0 delete();
    }

    if ( var_2 )
        level._audio._id_25B3._id_586D--;
    else
        _id_275D();
}

_id_25D5( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    if ( isdefined( var_3 ) )
        var_4 = var_3;

    var_5 = [];
    var_6 = 0;
    var_7 = strtok( var_0, "+" );
    var_8 = 0;

    for ( var_9 = 0; var_9 < var_7.size; var_9++ )
    {
        var_10 = strtok( var_7[var_9], " " );

        if ( var_10.size == 1 && var_10[0] != "" )
        {
            var_5[var_5.size] = var_10[0];
            continue;
        }

        var_11 = var_5.size;
        var_5[var_11] = [];
        var_5[var_11][0] = var_10[0];
        var_5[var_11][1] = float( var_10[1] );
    }

    if ( !var_6 && var_4 )
    {
        var_12 = [];

        for ( var_9 = 0; var_9 < var_5.size; var_9++ )
        {
            var_13 = var_12.size;
            var_12[var_13] = [];
            var_12[var_13][0] = var_5[var_9];
            var_12[var_13][1] = 1.0;
        }

        var_5 = var_12;
    }

    return var_5;
}

_id_25D6( var_0, var_1 )
{
    var_2 = "soundtables/sp_defaults.csv";
    var_3 = soundscripts\_audio::_id_3D2B();
    var_4 = [];

    if ( var_1 )
        var_4 = _id_25D7( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = _id_25D7( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

_id_25D7( var_0, var_1 )
{
    var_2 = [];
    var_3 = 8;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;
    var_8 = [];
    var_9 = packedtablesectionlookup( var_0, "loop_defs", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_9 ) )
    {
        for ( var_10 = 0; var_10 < var_3; var_10++ )
        {
            var_11 = packedtablelookupwithrange( var_0, 0, "loop_defs", var_10, var_9[0], var_9[1] );

            if ( !isdefined( var_11 ) || var_11 == "" )
                return;

            var_12 = packedtablelookupwithrange( var_0, 0, var_1, var_10, var_9[0], var_9[1] );

            if ( var_12 != "" && var_11 != "comments" )
            {
                switch ( var_11 )
                {
                    case "loop_alias":
                        var_4 = var_12;
                        continue;
                    case "fade_in":
                        if ( isdefined( var_12 ) && var_12 != "" )
                            var_6 = max( float( var_12 ), 0.0 );

                        continue;
                    case "fade_out":
                        if ( isdefined( var_12 ) && var_12 != "" )
                            var_7 = max( float( var_12 ), 0.0 );

                        continue;
                    case "end_alias":
                        if ( isdefined( var_12 ) && var_12 != "" )
                            var_5 = var_12;

                        continue;
                    case "duration_min":
                        if ( isdefined( var_12 ) && var_12 != "" )
                            var_8[0] = float( var_12 );

                        continue;
                    case "duration_max":
                        if ( isdefined( var_12 ) && var_12 != "" )
                            var_8[1] = float( var_12 );

                        continue;
                    default:
                        continue;
                }
            }
        }

        var_2["loop_alias"] = var_4;

        if ( isdefined( var_6 ) )
            var_2["fade_in"] = var_6;

        if ( isdefined( var_7 ) )
            var_2["fade_out"] = var_7;

        if ( isdefined( var_5 ) )
            var_2["end_alias"] = var_5;

        if ( isdefined( var_8[0] ) )
            var_2["duration"] = _id_25DB( var_8 );

        return var_2;
    }
}

_id_25DB( var_0 )
{
    var_1 = [];
    var_1[0] = float( var_0[0] );
    var_1[1] = float( var_0[1] );
    return var_1;
}

_id_25D2( var_0, var_1 )
{
    var_2 = [];
    var_3 = 21;
    var_4 = 8;
    var_5 = [];
    var_6 = [];
    var_7 = [];
    var_8 = [];
    var_9 = [];
    var_10 = [];
    var_11 = [];
    var_12 = [];
    var_13 = [];
    var_14 = [];
    var_15 = [];
    var_16 = 0;
    var_17 = packedtablesectionlookup( var_0, "components", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_17 ) )
    {
        for ( var_18 = 1; var_18 < var_3; var_18++ )
        {
            var_19 = packedtablelookupwithrange( var_0, 0, "components", var_18, var_17[0], var_17[1] );

            if ( !isdefined( var_19 ) )
                return;

            var_20 = packedtablelookupwithrange( var_0, 0, var_1, var_18, var_17[0], var_17[1] );

            if ( var_20 != "" && var_19 != "comments" )
            {
                var_16++;

                switch ( var_19 )
                {
                    case "oneshots":
                        var_5 = _id_25D5( var_20, "component definition", "oneshots", 1 );
                        continue;
                    case "loops":
                        var_6 = _id_25D5( var_20, "component definition", "loops", 1 );
                        continue;
                    case "single_loops":
                        var_7 = _id_25D5( var_20, "component definition", "single_loops", 0 );
                        continue;
                    case "first_event_min":
                        var_8[0] = float( var_20 );
                        continue;
                    case "first_event_max":
                        var_8[1] = float( var_20 );
                        continue;
                    case "event_time_min":
                        var_9[0] = float( var_20 );
                        continue;
                    case "event_time_max":
                        var_9[1] = float( var_20 );
                        continue;
                    case "dist_min":
                        var_10[0] = float( var_20 );
                        continue;
                    case "dist_max":
                        var_10[1] = float( var_20 );
                        continue;
                    case "cone_min":
                        var_11[0] = float( var_20 );
                        continue;
                    case "cone_max":
                        var_11[1] = float( var_20 );
                        continue;
                    case "travel_min":
                        var_12[0] = float( var_20 );
                        continue;
                    case "travel_max":
                        var_12[1] = float( var_20 );
                        continue;
                    case "travel_time_min":
                        var_13[0] = float( var_20 );
                        continue;
                    case "travel_time_max":
                        var_13[1] = float( var_20 );
                        continue;
                    case "pitch_min":
                        var_14[0] = float( var_20 );
                        continue;
                    case "pitch_max":
                        var_14[1] = float( var_20 );
                        continue;
                    case "pitch_time_min":
                        var_15[0] = float( var_20 );
                        continue;
                    case "pitch_time_max":
                        var_15[1] = float( var_20 );
                        continue;
                    default:
                        continue;
                }
            }
        }

        if ( var_16 > 0 )
        {
            if ( isdefined( var_5[0] ) )
            {
                if ( isstring( var_5[0] ) )
                    var_5[1] = 1.0;

                var_2["oneshots"] = var_5;
            }

            if ( isdefined( var_6[0] ) )
                var_2["loops"] = var_6;

            if ( isdefined( var_7[0] ) )
                var_2["single_loops"] = var_7;

            if ( isdefined( var_8[0] ) )
                var_2["first_event"] = _id_25DB( var_8 );

            if ( isdefined( var_9[0] ) )
                var_2["event_time"] = _id_25DB( var_9 );

            if ( isdefined( var_10[0] ) )
                var_2["radius"] = _id_25DB( var_10 );

            if ( isdefined( var_11[0] ) )
                var_2["cone"] = _id_25DB( var_11 );

            if ( isdefined( var_12[0] ) )
                var_2["delta"] = _id_25DB( var_12 );

            if ( isdefined( var_13[0] ) )
                var_2["travel_time"] = _id_25DB( var_13 );

            if ( isdefined( var_14[0] ) )
                var_2["pitch"] = _id_25DB( var_14 );

            if ( isdefined( var_15[0] ) )
                var_2["pitch_time"] = _id_25DB( var_15 );

            if ( !isdefined( var_2["radius"] ) )
                var_2["radius"] = [ 0.0, 0.01 ];
        }

        return var_2;
    }
}

_id_25D1( var_0, var_1 )
{
    var_2 = soundscripts\_audio::_id_3D2A();
    var_3 = "soundtables/sp_defaults.csv";
    var_4 = [];

    if ( var_1 )
        var_4 = _id_25D2( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = _id_25D2( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

_id_25DA( var_0, var_1 )
{
    var_2 = 7;
    var_3 = [];
    var_4 = [];
    var_5 = [];
    var_6 = [];
    var_7 = packedtablesectionlookup( var_0, "dynamic_ambience_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_7 ) )
    {
        for ( var_8 = 1; var_8 < var_2; var_8++ )
        {
            var_9 = packedtablelookupwithrange( var_0, 0, "dynamic_ambience_names", var_8, var_7[0], var_7[1] );
            var_10 = packedtablelookupwithrange( var_0, 0, var_1, var_8, var_7[0], var_7[1] );
            var_11 = 0;

            if ( var_10 != "" && var_9 != "comments" )
            {
                switch ( var_9 )
                {
                    case "components":
                        var_4 = _id_25D5( var_10, "preset definition", "components" );
                        continue;
                    case "first_event_min":
                        if ( isdefined( var_10 ) && var_10 != "" )
                            var_5[0] = float( var_10 );

                        continue;
                    case "first_event_max":
                        if ( isdefined( var_10 ) && var_10 != "" )
                            var_5[1] = float( var_10 );

                        continue;
                    case "event_time_min":
                        if ( isdefined( var_10 ) && var_10 != "" )
                            var_6[0] = float( var_10 );

                        continue;
                    case "event_time_max":
                        if ( isdefined( var_10 ) && var_10 != "" )
                            var_6[1] = float( var_10 );
                    case "comment":
                        continue;
                    default:
                        continue;
                }
            }
        }

        var_11 = 0;

        if ( isdefined( var_5[0] ) )
        {
            var_11 = 1;
            var_3["first_event"] = var_5;
        }

        if ( isdefined( var_6[0] ) )
        {
            var_11 = 1;
            var_3["event_time"] = var_6;
        }

        if ( var_11 )
        {
            if ( isdefined( var_4[0][1] ) )
                var_3["components"] = var_4;
            else
            {
                var_3["components"] = [];

                for ( var_8 = 0; var_8 < var_4.size; var_8++ )
                    var_3["components"][var_3["components"].size] = [ var_4[0], 1.0 ];

                if ( var_3["components"].size == 0 )
                    var_3["components"] = undefined;
            }
        }
        else if ( var_4.size != 0 )
            var_3["components"] = var_4;

        return var_3;
    }
}

_id_25D9( var_0, var_1 )
{
    var_2 = soundscripts\_audio::_id_3D2C();
    var_3 = "soundtables/sp_defaults.csv";
    var_4 = [];

    if ( var_1 )
        var_4 = _id_25DA( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = _id_25DA( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

_id_25D4( var_0 )
{
    var_1 = [];

    if ( isdefined( level._audio._id_25B3._id_6F1F[var_0] ) )
        var_1 = level._audio._id_25B3._id_6F1F[var_0];
    else
        var_1 = _id_25D9( var_0, 1 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._audio._id_25B3._id_6F1F[var_0] = var_1;
    var_1["name"] = var_0;
    return var_1;
}

_id_4C3A()
{
    level._audio._id_25B3._id_3316++;
}

_id_275D()
{
    level._audio._id_25B3._id_3316--;
}
