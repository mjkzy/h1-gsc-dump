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

azm_init()
{
    if ( !isdefined( level._audio._id_A3E9 ) )
    {
        level._audio._id_A3E9 = spawnstruct();
        level._audio._id_A3E9._id_2507 = "";
        level._audio._id_A3E9._id_A3F6 = [];
        level._audio._id_A3E9._id_662B = spawnstruct();
        level._audio._id_A3E9._id_662B._id_77DD = [];
        level._audio._id_A3E9._id_662B._id_25B3 = [];
        level._audio._id_A3E9._id_662B._id_5CE8 = [];
        level._audio._id_A3E9._id_662B._id_74E4 = [];
        level._audio._id_A3E9._id_662B._id_632E = [];
        azm_set_quad_enable( 1 );
        azm_set_damb_enable( 1 );
        azm_set_mix_enable( 1 );
        azm_set_reverb_enable( 1 );
        azm_set_filter_enable( 1 );
        azm_set_occlusion_enable( 1 );
        azm_set_mix_bypass( 0 );
        azm_set_reverb_bypass( 0 );
        azm_set_filter_bypass( 0 );
        azm_set_occlusion_bypass( 0 );
        level._audio._id_A3E9._id_9BE7 = 0;
    }

    if ( !isdefined( level._audio._id_9BDE ) )
        level._audio._id_56B8 = undefined;
}

azm_use_string_table()
{
    level._audio._id_A3E9._id_9BE7 = 1;
}

azm_start_zone( var_0, var_1, var_2 )
{
    if ( level._audio._id_A3E9._id_2507 == var_0 )
        return;
    else if ( level._audio._id_A3E9._id_2507 != "" )
        azm_stop_zone( level._audio._id_A3E9._id_2507, var_1 );

    level._audio._id_A3E9._id_2507 = var_0;

    if ( isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) && isdefined( level._audio._id_A3E9._id_A3F6[var_0]["state"] ) && level._audio._id_A3E9._id_A3F6[var_0]["state"] != "stopping" )
    {
        soundscripts\_audio::aud_print_warning( "ZONEM_start_zone(\"" + var_0 + "\") being called even though audio zone, \"" + var_0 + "\", is already started." );
        return;
    }

    var_3 = 2.0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( !isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) )
    {
        var_4 = azmx_load_zone( var_0 );

        if ( !isdefined( var_4 ) )
            return;

        level._audio._id_A3E9._id_A3F6[var_0] = var_4;
    }

    var_4 = level._audio._id_A3E9._id_A3F6[var_0];
    soundscripts\_audio::aud_print_zone( "ZONE START: " + var_0 );
    level._audio._id_A3E9._id_A3F6[var_0]["state"] = "playing";
    var_5 = var_4["priority"];
    var_6 = var_4["interrupt_fade"];

    if ( isdefined( var_4["streamed_ambience"] ) )
    {
        if ( var_4["streamed_ambience"] != "none" )
            soundscripts\_audio_stream_manager::_id_8656( var_4["streamed_ambience"], var_3, var_5, var_6 );
        else
            soundscripts\_audio_stream_manager::_id_8657( var_3 );
    }

    if ( isdefined( var_4["dynamic_ambience"] ) )
    {
        if ( var_4["dynamic_ambience"] != "none" )
            soundscripts\_audio_dynamic_ambi::_id_25C8( var_4["dynamic_ambience"], 1.0 );
        else
            soundscripts\_audio_dynamic_ambi::_id_25C5( 1.0 );
    }

    if ( isdefined( var_4["occlusion"] ) && !azm_get_occlusion_bypass() )
    {
        if ( var_4["occlusion"] != "none" )
            soundscripts\_snd_filters::_id_8757( var_4["occlusion"] );
        else
            soundscripts\_snd_filters::_id_8757( undefined );
    }

    if ( isdefined( var_4["filter"] ) && !azm_get_filter_bypass() )
    {
        soundscripts\_snd_filters::_id_8754( var_4["filter"], 0 );
        soundscripts\_snd_filters::_id_8755( 1 );
    }

    if ( isdefined( var_4["reverb"] ) && !azm_get_reverb_bypass() )
    {
        if ( var_4["reverb"] != "none" )
            soundscripts\_audio_reverb::_id_76F3( var_4["reverb"] );
        else
            soundscripts\_audio_reverb::_id_76EE();
    }

    if ( isdefined( var_4["mix"] ) && !azm_get_mix_bypass() )
    {
        if ( var_4["mix"] != "none" )
            soundscripts\_audio_mix_manager::_id_5D01( var_4["mix"] );
        else
            soundscripts\_audio_mix_manager::_id_5CF9( undefined, 1.0 );
    }

    if ( isdefined( var_4["context"] ) )
        soundscripts\_snd_common::_id_86D3( var_4["context"] );
}

azm_set_zone_streamed_ambience( var_0, var_1, var_2 )
{
    var_3 = azmx_set_param_internal( var_0, "streamed_ambience", var_1, ::azmx_restart_stream, var_2 );

    if ( !var_3 )
    {
        if ( !isdefined( var_1 ) )
            var_1 = "none";

        level._audio._id_A3E9._id_662B._id_77DD[var_0] = var_1;
    }
}

azm_set_zone_dynamic_ambience( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    azmx_set_param_internal( var_0, "dynamic_ambience", var_1, ::azmx_restart_damb, var_2 );
    level._audio._id_A3E9._id_662B._id_25B3[var_0] = var_1;
}

azm_set_zone_reverb( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    azmx_set_param_internal( var_0, "reverb", var_1, ::azmx_restart_reverb, var_2 );
    level._audio._id_A3E9._id_662B._id_74E4[var_0] = var_1;
}

azm_set_zone_occlusion( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    azmx_set_param_internal( var_0, "occlusion", var_1, ::azmx_restart_occlusion, var_2 );
    level._audio._id_A3E9._id_662B._id_5CE8[var_1] = var_1;
}

azm_set_zone_mix( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    azmx_set_param_internal( var_0, "mix", var_1, ::azmx_restart_mix, var_2 );
    level._audio._id_A3E9._id_662B._id_5CE8[var_1] = var_1;
}

azm_stop_zones( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    soundscripts\_audio::aud_print_zone( "ZONE STOP ALL" );

    foreach ( var_3 in level._audio._id_A3E9._id_A3F6 )
        azm_stop_zone( var_3["name"], var_1, 0 );
}

azm_stop_zone( var_0, var_1, var_2 )
{
    if ( isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) && isdefined( level._audio._id_A3E9._id_A3F6[var_0]["state"] ) && level._audio._id_A3E9._id_A3F6[var_0]["state"] != "stopping" )
    {
        var_3 = 1.0;

        if ( isdefined( var_1 ) )
            var_3 = var_1;

        var_4 = level._audio._id_A3E9._id_A3F6[var_0];
        var_5 = 0;

        if ( isdefined( var_2 ) )
            var_5 = var_2;

        if ( var_5 )
            soundscripts\_audio::aud_print_zone( "ZONE STOP ZONE: " + var_0 );

        if ( isdefined( var_4["streamed_ambience"] ) )
            soundscripts\_audio_stream_manager::_id_8658( var_4["streamed_ambience"], var_3 );

        if ( isdefined( var_4["dynamic_ambience"] ) )
            soundscripts\_audio_dynamic_ambi::_id_25C9( var_4["dynamic_ambience"], var_3 );

        if ( isdefined( var_4["mix"] ) && !azm_get_mix_bypass() )
            soundscripts\_audio_mix_manager::_id_5CF9( var_4["mix"], var_3 );

        if ( isdefined( var_4["context"] ) )
            soundscripts\_snd_common::_id_86CD( var_4["context"] );

        level._audio._id_A3E9._id_A3F6[var_0]["state"] = "stopping";
        thread azmx_wait_till_fade_done_and_remove_zone( var_0, var_3 );
    }
}

azm_get_current_zone()
{
    return level._audio._id_A3E9._id_2507;
}

azm_set_current_zone( var_0 )
{
    level._audio._id_A3E9._id_2507 = var_0;
}

azm_print_enter_blend( var_0, var_1, var_2 )
{

}

azm_print_exit_blend( var_0 )
{

}

azm_print_progress( var_0 )
{

}

azm_set_quad_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_7080 = var_0;
}

azm_get_quad_enable()
{
    return level._audio._id_A3E9._id_662B._id_7080;
}

azm_set_damb_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_25B5 = var_0;
}

azm_get_damb_enable()
{
    return level._audio._id_A3E9._id_662B._id_25B5;
}

azm_set_mix_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_5CEB = var_0;
}

azm_get_mix_enable()
{
    return level._audio._id_A3E9._id_662B._id_5CEB;
}

azm_set_reverb_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_74F0 = var_0;
}

azm_get_reverb_enable()
{
    return level._audio._id_A3E9._id_662B._id_74F0;
}

azm_set_filter_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_36C6 = var_0;
}

azm_get_filter_enable()
{
    return level._audio._id_A3E9._id_662B._id_36C6;
}

azm_set_occlusion_enable( var_0 )
{
    level._audio._id_A3E9._id_662B._id_6332 = var_0;
}

azm_get_occlusion_enable()
{
    return level._audio._id_A3E9._id_662B._id_6332;
}

azm_set_mix_bypass( var_0 )
{
    level._audio._id_A3E9._id_662B._id_5CE9 = var_0;
}

azm_get_mix_bypass()
{
    return level._audio._id_A3E9._id_662B._id_5CE9;
}

azm_set_reverb_bypass( var_0 )
{
    level._audio._id_A3E9._id_662B._id_74EF = var_0;
}

azm_get_reverb_bypass()
{
    return level._audio._id_A3E9._id_662B._id_74EF;
}

azm_set_filter_bypass( var_0 )
{
    level._audio._id_A3E9._id_662B._id_36C5 = var_0;
}

azm_get_filter_bypass()
{
    return isdefined( level._id_6015 ) && level._id_6015 || level._audio._id_A3E9._id_662B._id_36C5;
}

azm_set_occlusion_bypass( var_0 )
{
    level._audio._id_A3E9._id_662B._id_6331 = var_0;
}

azm_get_occlusion_bypass()
{
    return level._audio._id_A3E9._id_662B._id_6331;
}

azmx_load_zone( var_0 )
{
    if ( isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) )
        return;

    if ( !isdefined( level._audio._id_A3E9._id_6F1F ) )
        level._audio._id_A3E9._id_6F1F = [];

    var_1 = [];

    if ( isdefined( level._audio._id_A3E9._id_6F1F[var_0] ) )
        var_1 = level._audio._id_A3E9._id_6F1F[var_0];
    else
        var_1 = azmx_get_preset_from_string_table( var_0, 1 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._audio._id_A3E9._id_6F1F[var_0] = var_1;
    var_2 = 0;

    if ( azm_get_quad_enable() && isdefined( level._audio._id_A3E9._id_662B._id_77DD[var_0] ) )
    {
        if ( level._audio._id_A3E9._id_662B._id_77DD[var_0] == "none" )
            var_1["streamed_ambience"] = undefined;
        else
            var_1["streamed_ambience"] = level._audio._id_A3E9._id_662B._id_77DD[var_0];

        var_2 = 1;
        level._audio._id_A3E9._id_662B._id_77DD[var_0] = undefined;
    }

    if ( azm_get_damb_enable() && isdefined( level._audio._id_A3E9._id_662B._id_25B3[var_0] ) )
    {
        if ( level._audio._id_A3E9._id_662B._id_25B3[var_0] == "none" )
            var_1["dynamic_ambience"] = undefined;
        else
            var_1["dynamic_ambience"] = level._audio._id_A3E9._id_662B._id_25B3[var_0];

        var_2 = 1;
        level._audio._id_A3E9._id_662B._id_25B3[var_0] = undefined;
    }

    if ( azm_get_reverb_enable() && isdefined( level._audio._id_A3E9._id_662B._id_74E4[var_0] ) )
    {
        if ( level._audio._id_A3E9._id_662B._id_74E4[var_0] == "none" )
            var_1["reverb"] = undefined;
        else
            var_1["reverb"] = level._audio._id_A3E9._id_662B._id_74E4[var_0];

        var_2 = 1;
        level._audio._id_A3E9._id_662B._id_74E4[var_0] = undefined;
    }

    if ( azm_get_occlusion_enable() && isdefined( level._audio._id_A3E9._id_662B._id_632E[var_0] ) )
    {
        if ( level._audio._id_A3E9._id_662B._id_632E[var_0] == "none" )
            var_1["occlusion"] = undefined;
        else
            var_1["occlusion"] = level._audio._id_A3E9._id_662B._id_632E[var_0];

        var_2 = 1;
        level._audio._id_A3E9._id_662B._id_632E[var_0] = undefined;
    }

    if ( azm_get_filter_enable() && isdefined( level._audio._id_A3E9._id_662B._id_5CE8[var_0] ) )
    {
        if ( level._audio._id_A3E9._id_662B._id_5CE8[var_0] == "none" )
            var_1["mix"] = undefined;
        else
            var_1["mix"] = level._audio._id_A3E9._id_662B._id_5CE8[var_0];

        var_2 = 1;
        level._audio._id_A3E9._id_662B._id_5CE8[var_0] = undefined;
    }

    if ( var_2 )
        level._audio._id_A3E9._id_6F1F[var_0] = var_1;

    var_1["name"] = var_0;

    if ( !isdefined( var_1["priority"] ) )
        var_1["priority"] = 1;

    if ( !isdefined( var_1["interrupt_fade"] ) )
        var_1["interrupt_fade"] = 0.1;

    return var_1;
}

azmx_get_preset_from_string_table( var_0, var_1 )
{
    var_2 = "soundtables/sp_defaults.csv";
    var_3 = soundscripts\_audio::_id_3ED7();
    var_4 = [];

    if ( var_1 )
        var_4 = azmx_get_zone_preset_from_stringtable_internal( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = azmx_get_zone_preset_from_stringtable_internal( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

azmx_get_zone_preset_from_stringtable_internal( var_0, var_1 )
{
    var_2 = [];
    var_3 = "";
    var_4 = "";
    var_5 = packedtablesectionlookup( var_0, "zone_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_5 ) )
    {
        var_6 = 9;

        for ( var_7 = 1; var_7 < var_6; var_7++ )
        {
            if ( var_3 != "comments" && var_4 != "" )
                var_2[var_3] = var_4;

            var_3 = packedtablelookupwithrange( var_0, 0, "zone_names", var_7, var_5[0], var_5[1] );
            var_4 = packedtablelookupwithrange( var_0, 0, var_1, var_7, var_5[0], var_5[1] );

            if ( var_3 != "comment" && var_3 != "comments" && var_4 != "" )
            {
                switch ( var_3 )
                {
                    case "streamed_ambience":
                        var_2["streamed_ambience"] = var_4;
                        continue;
                    case "dynamic_ambience":
                        var_2["dynamic_ambience"] = var_4;
                        continue;
                    case "mix":
                        var_2["mix"] = var_4;
                        continue;
                    case "reverb":
                        var_2["reverb"] = var_4;
                        continue;
                    case "filter":
                        var_2["filter"] = var_4;
                        continue;
                    case "occlusion":
                        var_2["occlusion"] = var_4;
                        continue;
                    case "context":
                        var_2["context"] = var_4;
                        continue;
                    default:
                        continue;
                }
            }
        }

        return var_2;
    }
}

azmx_restart_stream( var_0, var_1 )
{
    var_2 = level._audio._id_A3E9._id_A3F6[var_0]["streamed_ambience"];

    if ( isdefined( var_2 ) )
        soundscripts\_audio_stream_manager::_id_8656( var_2, var_1 );
    else
        soundscripts\_audio_stream_manager::_id_8657( var_1 );
}

azmx_restart_damb( var_0, var_1 )
{
    var_2 = 1.0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    var_3 = level._audio._id_A3E9._id_A3F6[var_0]["dynamic_ambience"];

    if ( isdefined( var_3 ) )
        soundscripts\_audio_dynamic_ambi::_id_25C8( var_3, var_2 );
    else
        soundscripts\_audio_dynamic_ambi::_id_25C9( undefined, var_2 );
}

azmx_restart_reverb( var_0, var_1 )
{
    var_2 = level._audio._id_A3E9._id_A3F6[var_0]["reverb"];

    if ( isdefined( var_2 ) && !azm_get_reverb_bypass() )
        soundscripts\_audio_reverb::_id_76F3( var_2 );
}

azmx_restart_occlusion( var_0, var_1 )
{
    var_2 = level._audio._id_A3E9._id_A3F6[var_0]["occlusion"];

    if ( isdefined( var_2 ) && !azm_get_occlusion_bypass() )
        soundscripts\_snd_filters::_id_8757( var_2 );
}

azmx_restart_mix( var_0, var_1 )
{
    var_2 = level._audio._id_A3E9._id_A3F6[var_0]["mix"];

    if ( !azm_get_mix_bypass() )
    {
        if ( isdefined( var_2 ) )
            soundscripts\_audio_mix_manager::_id_5D01( var_2 );
        else
            soundscripts\_audio_mix_manager::_id_5CF9( undefined, var_1 );
    }
}

azmx_set_param_internal( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) )
    {
        if ( isdefined( level._audio._id_A3E9._id_A3F6[var_0][var_1] ) && level._audio._id_A3E9._id_A3F6[var_0][var_1] != var_2 || !isdefined( level._audio._id_A3E9._id_A3F6[var_0][var_1] ) && ( isdefined( var_2 ) && var_2 != "none" ) )
        {
            if ( var_2 == "none" )
                level._audio._id_A3E9._id_A3F6[var_0][var_1] = undefined;
            else
                level._audio._id_A3E9._id_A3F6[var_0][var_1] = var_2;

            if ( var_0 == azm_get_current_zone() )
                [[ var_3 ]]( var_0, var_4 );
        }

        return 1;
    }
    else
        return 0;
}

azmx_wait_till_fade_done_and_remove_zone( var_0, var_1 )
{
    wait(var_1);
    wait 0.05;

    if ( level._audio._id_A3E9._id_A3F6[var_0]["state"] == "stopping" )
        return;
}

azmx_get_blend_args( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_A3E4 = var_0;
    var_2._id_A3EE = var_1;
    var_2._id_77DE = undefined;
    var_2._id_77DF = undefined;
    var_2._id_25CA = undefined;
    var_2._id_25CB = undefined;
    var_2._id_6333 = undefined;
    var_2._id_6334 = undefined;
    var_2._id_36CA = undefined;
    var_2._id_36CB = undefined;
    var_2._id_74F3 = undefined;
    var_2._id_74F4 = undefined;
    var_2._id_5CEE = undefined;
    var_2._id_5CF0 = undefined;
    var_2.context1 = undefined;
    var_2.context2 = undefined;

    if ( !isdefined( level._audio._id_A3E9._id_A3F6[var_0] ) )
    {
        var_3 = azmx_load_zone( var_0 );

        if ( !isdefined( var_3 ) )
        {
            soundscripts\_audio::aud_print_warning( "Couldn't find zone: " + var_0 );
            return;
        }

        level._audio._id_A3E9._id_A3F6[var_0] = var_3;
    }

    var_4 = level._audio._id_A3E9._id_A3F6[var_0];

    if ( !isdefined( level._audio._id_A3E9._id_A3F6[var_1] ) )
    {
        var_3 = azmx_load_zone( var_1 );

        if ( !isdefined( var_3 ) )
        {
            soundscripts\_audio::aud_print_warning( "Couldn't find zone: " + var_1 );
            return;
        }

        level._audio._id_A3E9._id_A3F6[var_1] = var_3;
    }

    var_5 = level._audio._id_A3E9._id_A3F6[var_1];
    var_2._id_6333 = var_4["occlusion"];
    var_2._id_6334 = var_5["occlusion"];
    var_2._id_36CA = var_4["filter"];
    var_2._id_36CB = var_5["filter"];
    var_2._id_74F3 = var_4["reverb"];
    var_2._id_74F4 = var_5["reverb"];
    var_2._id_5CED = var_4["mix"];
    var_2._id_5CEF = var_5["mix"];
    var_2.context1 = var_4["context"];
    var_2.context2 = var_5["context"];
    var_2._id_77DE = var_4["streamed_ambience"];
    var_2._id_77DF = var_5["streamed_ambience"];
    var_6 = level._audio._id_25B3.playing["zone"].size;

    if ( var_6 > 1 )
        soundscripts\_audio_dynamic_ambi::_id_25C2( 1.0, "zone" );

    var_2._id_25CA = var_4["dynamic_ambience"];
    var_2._id_25CB = var_5["dynamic_ambience"];
    return var_2;
}

azmx_is_valid_mix_blend_request( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

azmx_is_valid_damb_blend_request( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

azmx_is_valid_samb_blend_request( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

azmx_blend_zones( var_0, var_1, var_2 )
{
    if ( azmx_is_valid_samb_blend_request( var_2._id_77DE, var_2._id_77DF ) )
    {
        var_3 = [];
        var_4 = 0;

        if ( isdefined( var_2._id_77DE ) && var_2._id_77DE != "" )
        {
            var_5 = level._audio._id_A3E9._id_A3F6[var_2._id_A3E4];
            var_3[var_4] = spawnstruct();
            var_3[var_4].alias = var_2._id_77DE;
            var_3[var_4]._id_9F37 = var_0;
            var_3[var_4]._id_35D9 = var_5["interrupt_fade"];
            var_3[var_4]._id_6FBE = var_5["priority"];
            var_4++;
        }

        if ( isdefined( var_2._id_77DF ) && var_2._id_77DF != "" )
        {
            var_6 = level._audio._id_A3E9._id_A3F6[var_2._id_A3EE];
            var_3[var_4] = spawnstruct();
            var_3[var_4].alias = var_2._id_77DF;
            var_3[var_4]._id_9F37 = var_1;
            var_3[var_4]._id_35D9 = var_6["interrupt_fade"];
            var_3[var_4]._id_6FBE = var_6["priority"];
        }

        if ( var_3.size > 0 )
            soundscripts\_audio_stream_manager::_id_8654( var_3 );
    }

    if ( azmx_is_valid_damb_blend_request( var_2._id_25CA, var_2._id_25CB ) )
        soundscripts\_audio_dynamic_ambi::_id_25BB( var_2._id_25CA, var_0, var_2._id_25CB, var_1 );

    if ( azmx_is_valid_mix_blend_request( var_2._id_5CED, var_2._id_5CEF ) && !azm_get_mix_bypass() )
        soundscripts\_audio_mix_manager::_id_5CF4( var_2._id_5CED, var_0, var_2._id_5CEF, var_1 );

    if ( isdefined( var_2._id_36CA ) )
    {
        if ( !azm_get_filter_bypass() )
            soundscripts\_snd_filters::_id_8754( var_2._id_36CA, 0, 0 );
    }
    else if ( !azm_get_filter_bypass() )
        soundscripts\_snd_filters::_id_8754( undefined, 0, 0 );

    if ( isdefined( var_2._id_36CB ) )
    {
        if ( !azm_get_filter_bypass() )
            soundscripts\_snd_filters::_id_8754( var_2._id_36CB, 1, 0 );
    }
    else if ( !azm_get_filter_bypass() )
        soundscripts\_snd_filters::_id_8754( undefined, 1, 0 );

    if ( isdefined( var_2._id_36CA ) || isdefined( var_2._id_36CB ) )
    {
        if ( !azm_get_filter_bypass() )
            soundscripts\_snd_filters::_id_8755( var_0 );
    }

    if ( var_0 >= 0.75 )
    {
        if ( isdefined( var_2._id_74F3 ) && !azm_get_reverb_bypass() )
        {
            if ( var_2._id_74F3 == "none" )
                soundscripts\_audio_reverb::_id_76F3( undefined );
            else
                soundscripts\_audio_reverb::_id_76F3( var_2._id_74F3 );
        }

        if ( isdefined( var_2._id_6333 ) && !azm_get_occlusion_bypass() )
        {
            if ( var_2._id_6333 == "none" )
                soundscripts\_snd_filters::_id_8757( undefined );
            else
                soundscripts\_snd_filters::_id_8757( var_2._id_6333 );
        }

        if ( isdefined( var_2.context2 ) )
            soundscripts\_snd_common::_id_86CD( var_2.context2 );

        if ( isdefined( var_2.context1 ) )
            soundscripts\_snd_common::_id_86D3( var_2.context1 );
    }
    else if ( var_1 >= 0.75 )
    {
        if ( isdefined( var_2._id_74F4 ) && !azm_get_reverb_bypass() )
        {
            if ( var_2._id_74F4 == "none" )
                soundscripts\_audio_reverb::_id_76F3( undefined );
            else
                soundscripts\_audio_reverb::_id_76F3( var_2._id_74F4 );
        }

        if ( isdefined( var_2._id_6334 ) && !azm_get_occlusion_bypass() )
        {
            if ( var_2._id_6334 == "none" )
                soundscripts\_snd_filters::_id_8757( undefined );
            else
                soundscripts\_snd_filters::_id_8757( var_2._id_6334 );
        }

        if ( isdefined( var_2.context1 ) )
            soundscripts\_snd_common::_id_86CD( var_2.context1 );

        if ( isdefined( var_2.context2 ) )
            soundscripts\_snd_common::_id_86D3( var_2.context2 );
    }
}
