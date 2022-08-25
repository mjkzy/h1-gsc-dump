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

avm_add_oneshot( var_0, var_1 )
{

}

avm_init()
{
    if ( isdefined( level._audio._id_9EB3 ) )
        return;

    if ( !isdefined( level._audio._id_9EB3 ) )
        level._audio._id_9EB3 = spawnstruct();

    var_0 = avmx_get();
    var_0._id_4D6A = gettime();
    var_0.callbacks = [];
    var_0._id_6F20 = [];
    var_0._id_6F22 = [];
    var_0._id_76DD = 0;
    var_0._id_2768 = "alias";
    var_0._id_2771 = 0;
    var_0._id_2769 = 1.0;
    var_0._id_276A = 1.0;
    var_0._id_2777 = 0;
    var_0._id_2776 = ( 0.0, 0.0, 0.0 );
    var_0._id_2775 = 1.0;
    var_0._id_2774 = 1.0;
    var_0._id_276D = "distance";
    var_0._id_276F = "volume";
    var_0._id_2770 = 1.0;
    var_0._id_2772 = 50;
    soundscripts\_snd::_id_874D( "snd_register_vehicle", ::_id_874E );
    soundscripts\_snd::_id_874D( "snd_start_vehicle", ::_id_8771 );
    soundscripts\_snd::_id_874D( "snd_stop_vehicle", ::_id_8779 );
    avm_register_callback( "distance2d", ::_id_4E48 );
    avm_register_callback( "distance", ::_id_4E47 );
    avm_register_callback( "throttle", ::_id_4E57 );
    avm_register_callback( "speed", ::_id_4E55 );
    avm_register_callback( "relative_speed", ::_id_4E54 );
    avm_register_callback( "doppler", ::_id_4E49 );
    avm_register_callback( "doppler_exaggerated", ::_id_4E4A );
    avm_register_callback( "doppler_subtle", ::_id_4E4B );
    avm_register_callback( "speed_mph", ::_id_4E56 );
    avm_register_callback( "acceleration_g", ::_id_4E45 );
    avm_register_callback( "jerk_gps", ::_id_4E4C );
    avm_register_callback( "pitch", ::_id_4E51 );
    avm_register_callback( "yaw", ::_id_4E58 );
    avm_register_callback( "pitch_roll_max", ::_id_4E52 );
    avm_register_callback( "degrees_from_upright", ::_id_4E46 );
    avm_register_callback( "jetbike_thrust", ::_id_4E4F );
    avm_register_callback( "jetbike_drag", ::_id_4E4E );
    avm_register_callback( "jetbike_anti_slip", ::_id_4E4D );
    avm_register_callback( "jetbike_total_repulsor", ::_id_4E50 );
    avm_register_callback( "jetbike_height", ::_id_4E53 );
    avm_register_callback( "hovertank_anti_slip_magnitude", ::_id_4E6B );
    avm_register_callback( "hovertank_anti_slip_direction", ::_id_4E6A );
    avm_register_callback( "hovertank_auto_yaw_magnitude", ::_id_4E6E );
    avm_register_callback( "hovertank_auto_yaw_direction", ::_id_4E6D );
    avm_register_callback( "hovertank_repulsor_front_left", ::_id_4E71 );
    avm_register_callback( "hovertank_repulsor_front_right", ::_id_4E72 );
    avm_register_callback( "hovertank_repulsor_back_left", ::_id_4E6F );
    avm_register_callback( "hovertank_repulsor_back_right", ::_id_4E70 );
    avm_register_callback( "hovertank_throttle_magnitude", ::_id_4E76 );
    avm_register_callback( "hovertank_throttle_direction", ::_id_4E75 );
    avm_register_callback( "hovertank_uprighting", ::_id_4E79 );
    avm_register_callback( "hovertank_turret_yaw", ::_id_4E78 );
    avm_register_callback( "hovertank_turret_pitch", ::_id_4E77 );
    avm_register_callback( "diveboat_throttle", ::_id_4E66 );
    avm_register_callback( "diveboat_drag", ::_id_4E64 );
    avm_register_callback( "diveboat_drag_with_mph", ::_id_4E65 );
    avm_register_callback( "player_pdrone_look", ::_id_4E7C );
}

_id_874E( var_0, var_1 )
{
    var_2 = avmx_get();
    var_2._id_6F20[var_0] = var_1;
}

_id_8771( var_0 )
{
    var_1 = avmx_get();

    if ( isstring( var_0 ) )
    {
        var_2 = var_0;
        var_0 = spawnstruct();
        var_0._id_6F21 = var_2;
    }

    var_2 = var_0._id_6F21;
    var_3 = soundscripts\_audio::aud_get_optional_param( var_1._id_2771, var_0._id_6BA1 );
    var_4 = soundscripts\_audio::aud_get_optional_param( var_1._id_2769, var_0._id_35F0 );
    var_5 = soundscripts\_audio::aud_get_optional_param( var_1._id_276A, var_0._id_35F5 );
    var_6 = soundscripts\_audio::aud_get_optional_param( var_1._id_2776, var_0._id_6379 );
    var_7 = soundscripts\_audio::aud_get_optional_param( undefined, var_0._id_4DD4 );
    self._id_86FE = thread avmx_start_instance( var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_8779( var_0, var_1 )
{
    var_2 = self;
    var_3 = avmx_get();
    var_4 = var_2._id_86FE;
    var_2._id_86FE = undefined;
    var_5 = var_4 avmx_get_instance_preset();
    var_6 = soundscripts\_audio::aud_get_optional_param( var_4._id_35F5, var_5._id_4777._id_35F5 );
    var_4._id_35F5 = soundscripts\_audio::aud_get_optional_param( var_6, var_0 );
    var_1 = soundscripts\_audio::aud_get_optional_param( 0, var_1 );
    var_4 maps\_utility::_id_27EF( var_1, ::avmx_stop_instance, var_4._id_35F5 );
}

avm_create_vehicle_proxy()
{
    var_0 = common_scripts\utility::_id_8959();
    var_0._id_9EC3 = 1;
    return var_0;
}

avmx_is_vehicle_proxy()
{
    return isdefined( self._id_9EC3 ) && self._id_9EC3 == 1;
}

avm_begin_preset_def( var_0, var_1 )
{
    var_2 = avmx_get();
    avmx_set_preset_name( var_0 );
    avmx_set_instance_init_callback( var_1 );
    var_2._id_9D66 = self;
}

avm_begin_loop_data( var_0, var_1, var_2 )
{
    var_3 = avmx_get();
    self._id_586A = spawnstruct();
    self._id_586A._id_588F = [];
    self._id_586A._id_279C = spawnstruct();
    self._id_586A._id_279C._id_35F5 = soundscripts\_audio::aud_get_optional_param( var_3._id_276A, var_0 );
    self._id_586A._id_279C._id_8691 = soundscripts\_audio::aud_get_optional_param( var_3._id_2775, var_1 );
    self._id_586A._id_279C._id_868C = soundscripts\_audio::aud_get_optional_param( var_3._id_2774, var_2 );
}

avm_begin_loop_def( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isarray( var_0 ) )
        var_6 = var_0;
    else
        var_6 = [ var_0 ];

    var_1 = soundscripts\_audio::aud_get_optional_param( self._id_586A._id_279C._id_35F5, var_1 );
    var_2 = soundscripts\_audio::aud_get_optional_param( self._id_586A._id_279C._id_8691, var_2 );
    var_3 = soundscripts\_audio::aud_get_optional_param( self._id_586A._id_279C._id_868C, var_3 );
    var_4 = soundscripts\_audio::aud_get_optional_param( var_0, var_4 );
    var_5 = soundscripts\_audio::aud_get_optional_param( "alias", var_5 );
    var_10 = spawnstruct();
    var_10.name = var_4;
    var_10._id_35F5 = var_1;
    var_10.asset_type = var_5;
    var_10.asset_names = var_6;
    var_10._id_6F21 = avmx_get_preset_name();
    var_10._id_6681 = [];
    var_10 avmx_preset_set_param_map_defaults( var_2, var_3 );
    self._id_586A._id_588F[var_10.name] = var_10;
    self._id_586A._id_5878 = var_10;
}

avmx_preset_determine_param_map_owner( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self._id_586A ) && isdefined( self._id_586A._id_5878 ) )
    {
        var_1 = self._id_586A._id_5878;

        if ( isdefined( self.behavior_data ) )
        {

        }
    }
    else if ( isdefined( self._id_6497 ) && isdefined( self._id_6497._id_649D ) )
        var_1 = self._id_6497._id_649D;
    else if ( isdefined( self.behavior_data ) && isdefined( self.behavior_data.behavior_under_construction ) )
        var_1 = self.behavior_data.behavior_under_construction;

    return var_1;
}

avmx_preset_determine_param_map_env_owner( var_0 )
{
    var_1 = undefined;
    var_2 = avmx_preset_determine_param_map_owner( var_0 );

    if ( isdefined( var_2 ) )
        var_1 = var_2._id_6E00;

    return var_1;
}

avmx_preset_set_param_map_defaults( var_0, var_1 )
{
    var_2 = avmx_get();
    self._id_6680 = spawnstruct();
    var_3 = soundscripts\_audio::aud_get_optional_param( var_2._id_2775, self._id_6680._id_8691 );
    var_4 = soundscripts\_audio::aud_get_optional_param( var_2._id_2774, self._id_6680._id_868C );
    self._id_6680._id_8691 = soundscripts\_audio::aud_get_optional_param( var_3, var_0 );
    self._id_6680._id_868C = soundscripts\_audio::aud_get_optional_param( var_4, var_1 );
    self._id_6680._id_4E7B = var_2._id_276D;
    self._id_6680._id_65C7 = var_2._id_276F;
    self._id_6680._id_4E7A = [];
}

avm_begin_param_map( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_3 = var_0;

    if ( !isstring( var_3 ) )
        var_3 = "";

    var_4 = avmx_preset_determine_param_map_owner( var_3 );
    var_3 = var_0;
    var_6 = spawnstruct();
    var_6._id_3337 = [];
    var_6._id_4E7B = var_0;
    var_6._id_8691 = soundscripts\_audio::aud_get_optional_param( var_4._id_6680._id_8691, var_1 );
    var_6._id_868C = soundscripts\_audio::aud_get_optional_param( var_4._id_6680._id_868C, soundscripts\_audio::aud_get_optional_param( var_1, var_2 ) );
    var_6._id_276F = var_4._id_6680._id_65C7;
    var_6._id_8691 = avm_change_smoothing_rate( var_6._id_8691, 0.1, 0.1 );
    var_6._id_868C = avm_change_smoothing_rate( var_6._id_868C, 0.1, 0.1 );
    var_4._id_6681[var_3] = var_6;
    var_4._id_6E00 = var_6;
}

avm_compute_smoothing_rc_from_alpha( var_0, var_1 )
{
    return var_1 * ( 1 - var_0 ) / var_0;
}

avm_compute_alpha_from_rc( var_0, var_1 )
{
    return var_1 / ( var_0 + var_1 );
}

avm_change_smoothing_rate( var_0, var_1, var_2 )
{
    var_3 = avm_compute_smoothing_rc_from_alpha( var_0, var_1 );
    var_4 = avm_compute_alpha_from_rc( var_3, var_2 );
    return var_4;
}

avmx_add_behavior_shortcut_param_maps( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
    {
        avm_begin_param_map( var_4, var_1, var_2 );
        avm_end_param_map();
    }
}

avm_add_param_map_env( var_0, var_1, var_2 )
{
    if ( isstring( var_1 ) )
        var_2 = soundscripts\_audio::aud_get_optional_param( var_1, var_2 );

    var_3 = avmx_preset_determine_param_map_env_owner( var_2 );
    var_4 = var_1;

    if ( !isstring( var_4 ) )
        var_4 = "???";

    var_5 = spawnstruct();
    var_5.asset_name = var_1;
    var_5._id_65C7 = var_0;
    var_3._id_3337[var_2] = var_5;
}

avm_end_param_map()
{
    var_0 = avmx_preset_determine_param_map_owner( "UNKNOWN param_map being terminated by AVM_end_param_map()" );

    if ( isdefined( var_0 ) )
        var_0._id_6E00 = undefined;
}

avm_end_loop_def()
{
    self._id_586A._id_5878 = undefined;
}

avm_end_loop_data()
{

}

avm_begin_oneshot_data( var_0 )
{
    var_1 = avmx_get();
    self._id_6497 = spawnstruct();
    self._id_6497._id_64A2 = [];
    self._id_6497._id_279C = spawnstruct();
    self._id_6497._id_279C._id_35F5 = soundscripts\_audio::aud_get_optional_param( var_1._id_276A, var_0 );
}

avm_begin_oneshot_def( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = avmx_get();
    var_1 = soundscripts\_audio::aud_get_optional_param( undefined, var_1 );
    var_2 = soundscripts\_audio::aud_get_optional_param( self._id_6497._id_279C._id_35F5, var_2 );
    var_3 = soundscripts\_audio::aud_get_optional_param( 1, var_3 );
    var_4 = soundscripts\_audio::aud_get_optional_param( var_0, var_4 );
    var_5 = soundscripts\_audio::aud_get_optional_param( var_6._id_2768, var_5 );
    var_7 = var_4;

    if ( isstring( var_4 ) )
        var_7 = [ var_4 ];

    var_11 = spawnstruct();
    var_11.name = var_0;
    var_11.asset_names = var_7;
    var_11.asset_type = var_5;
    var_11._id_2FB4 = var_1;
    var_11._id_35F5 = var_2;
    var_11._id_649C = var_3;
    var_11._id_6681 = [];
    var_11._id_86D9 = [];
    var_11 avmx_preset_set_param_map_defaults();
    self._id_6497._id_64A2[var_11.name] = var_11;
    self._id_6497._id_649D = var_11;
}

avmx_set_oneshot_update_mode( var_0 )
{
    var_1 = self._id_6497._id_649D;
    var_1._id_649E = var_0;
}

avm_end_oneshot_def()
{
    self._id_6497._id_649D = undefined;
}

avm_end_oneshot_data()
{

}

avm_begin_behavior_data( var_0, var_1 )
{
    self.behavior_data = spawnstruct();
    self.behavior_data.behaviors = [];
    self.behavior_data._id_279C = spawnstruct();
    self.behavior_data._id_279C._id_8691 = var_0;
    self.behavior_data._id_279C._id_868C = var_1;
}

avm_begin_behavior_def( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = avmx_get();
    var_6 = spawnstruct();
    var_6._id_64A2 = [];
    var_6._id_588F = [];
    var_6._id_6F21 = avmx_get_preset_name();
    var_6._id_6681 = [];
    var_6.name = var_0;
    var_6._id_20E0 = var_1;
    var_3 = soundscripts\_audio::aud_get_optional_param( self.behavior_data._id_279C._id_8691, var_3 );
    var_4 = soundscripts\_audio::aud_get_optional_param( self.behavior_data._id_279C._id_868C, var_4 );
    var_6 avmx_preset_set_param_map_defaults( var_3, var_4 );
    self.behavior_data.behaviors[var_6.name] = var_6;
    self.behavior_data.behavior_under_construction = var_6;

    if ( isarray( var_2 ) )
        avmx_add_behavior_shortcut_param_maps( var_2, self.behavior_data._id_279C._id_8691, self.behavior_data._id_279C._id_868C );
}

avm_add_init_state_callback( var_0 )
{
    self.behavior_data.behavior_under_construction._id_4D60 = var_0;
}

avm_add_in_state_callback( var_0 )
{
    self.behavior_data.behavior_under_construction._id_4C0E = var_0;
}

avm_add_oneshots( var_0 )
{
    if ( isstring( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_2 in var_0 )
    {
        var_3 = self.behavior_data.behavior_under_construction;
        var_3._id_64A2[var_2] = var_2;
    }
}

avm_add_loops( var_0 )
{
    var_1 = self.behavior_data.behavior_under_construction;

    if ( !isdefined( var_0 ) || var_0.size == 0 )
        var_0 = "none";

    if ( isstring( var_0 ) )
    {
        if ( tolower( var_0 ) == "all" )
            var_1._id_588F[0] = "all";
        else if ( tolower( var_0 ) == "none" )
            var_1._id_588F[0] = "none";
        else
            var_1._id_588F[var_0] = var_0;
    }
    else
    {
        var_1._id_588F[0] = undefined;

        foreach ( var_3 in var_0 )
        {
            if ( var_3 != "all" && var_3 != "none" )
            {

            }

            var_1._id_588F[var_3] = var_3;
        }
    }
}

avm_end_behavior_def()
{
    self.behavior_data.behavior_under_construction = undefined;
}

avm_end_behavior_data()
{

}

avm_begin_state_data( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_0 *= 1000;

    var_2 = avmx_get();
    self._id_8D59 = spawnstruct();
    self._id_8D59._id_8D5B = [];
    self._id_8D59._id_279C = spawnstruct();
    self._id_8D59._id_279C._id_6FBE = soundscripts\_audio::aud_get_optional_param( var_2._id_2772, var_1 );
    self._id_8D59._id_279C._id_5C34 = soundscripts\_audio::aud_get_optional_param( var_2._id_2777, var_0 );
}

avm_begin_state_group( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
        var_4 *= 1000;

    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5._id_4DD3 = [ var_1, var_2 ];
    var_5._id_6FBE = soundscripts\_audio::aud_get_optional_param( self._id_8D59._id_279C._id_6FBE, var_3 );
    var_5._id_5C34 = soundscripts\_audio::aud_get_optional_param( self._id_8D59._id_279C._id_5C34, var_4 );
    var_5._id_8D67 = [];
    self._id_8D59._id_8D5B[var_0] = var_5;
    self._id_8D59._id_4437 = var_5;
}

avm_begin_state_def( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_1 *= 1000;

    var_3 = self._id_8D59._id_4437;
    var_4 = var_3.name;
    var_5 = spawnstruct();
    var_5.name = var_0;
    var_5._id_9719 = [];
    var_5._id_6FBE = soundscripts\_audio::aud_get_optional_param( var_3._id_6FBE, var_2 );
    var_5._id_5C34 = soundscripts\_audio::aud_get_optional_param( var_3._id_5C34, var_1 );
    var_5._id_6F21 = avmx_get_preset_name();
    var_3._id_8D67[var_0] = var_5;
    self._id_8D59._id_4437._id_8D64 = var_5;
}

avm_add_state_transition( var_0, var_1 )
{
    var_3 = self._id_8D59._id_4437._id_8D64;
    var_3._id_9719[var_3._id_9719.size] = [ var_0, var_1 ];
}

avm_end_state_def()
{
    self._id_8D59._id_4437._id_8D64 = undefined;
}

avm_end_state_group()
{
    self._id_8D59._id_4437 = undefined;
}

avm_end_state_data()
{

}

avm_add_envelope( var_0, var_1 )
{
    if ( isstring( var_0 ) )
        var_0 = tolower( var_0 );

    var_4 = avmx_get();

    if ( !isdefined( self._id_3333 ) )
        self._id_3333 = [];

    var_5 = spawnstruct();

    if ( isarray( var_1 ) )
    {
        var_5._id_3332 = [];

        if ( getdvarint( "enableMW1GetArrayKeysAndForEach" ) != 0 )
        {
            for ( var_6 = 0; var_6 < var_1.size; var_6++ )
            {
                var_7 = var_1[var_6];
                var_5._id_3332[var_5._id_3332.size] = ( var_7[0], var_7[1], 0 );
            }
        }
        else
        {
            foreach ( var_7 in var_1 )
                var_5._id_3332[var_5._id_3332.size] = ( var_7[0], var_7[1], 0 );
        }
    }
    else
        var_5._id_3335 = var_1;

    self._id_3333[var_0] = var_5;
}

avm_end_preset_def()
{
    var_0 = avmx_get();
    self._id_2156 = [];

    foreach ( var_8, var_2 in self._id_586A._id_588F )
    {
        var_3 = var_8;
        var_4 = var_2;

        foreach ( var_7, var_6 in var_4._id_6681 )
            self._id_2156[var_7] = avmx_get_callback( var_7 );
    }

    foreach ( var_8, var_2 in self._id_6497._id_64A2 )
    {
        var_10 = var_8;
        var_11 = var_2;

        foreach ( var_7, var_6 in var_11._id_6681 )
            self._id_2156[var_7] = avmx_get_callback( var_7 );
    }

    foreach ( var_8, var_2 in self.behavior_data.behaviors )
    {
        var_14 = var_8;
        var_15 = var_2;

        foreach ( var_7, var_6 in var_15._id_6681 )
            self._id_2156[var_7] = avmx_get_callback( var_7 );
    }

    var_0._id_9D66 = undefined;
}

avmx_get_master_volume()
{
    return self._id_59D9;
}

_id_9ED9()
{
    return self._id_86FE;
}

_id_9ED7()
{
    return avmx_get_instance_name();
}

avm_set_instance_master_volume( var_0, var_1 )
{
    thread avmx_set_instance_master_volume( var_0, var_1 );
}

avmx_set_instance_master_volume( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 avmx_get_instance_name();
    var_4 = var_2 avmx_get_vehicle_entity();
    var_0 = clamp( var_0, 0, 1 );
    var_1 = clamp( soundscripts\_audio::aud_get_optional_param( 1, var_1 ), 0, 60 );
    var_5 = var_3;
    var_2 notify( var_5 );
    var_2 endon( var_5 );
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_2 avmx_get_instance_name() );
    var_4 endon( "death" );
    var_6 = avm_get_update_rate();
    var_7 = var_0 - var_2._id_59D9;
    var_8 = max( 1, var_1 / var_6 );
    var_9 = var_7 / var_8;

    for (;;)
    {
        if ( var_9 < 0 )
        {
            if ( var_2._id_59D9 > var_0 )
                var_2._id_59D9 = max( 0, var_2._id_59D9 + var_9 );
            else
                break;
        }
        else if ( var_9 > 0 )
        {
            if ( var_2._id_59D9 < var_0 )
                var_2._id_59D9 = min( 1.0, var_2._id_59D9 + var_9 );
            else
                break;
        }

        wait(var_6);
    }
}

avm_get_running_instance_count( var_0 )
{
    return avmx_get()._id_76DD;
}

avm_get_update_rate()
{
    return 0.1;
}

_id_9ED8( var_0 )
{
    var_1 = 0;
    var_2 = avmx_get();

    if ( isstring( var_0 ) )
    {
        var_3 = var_2._id_6F22[var_0];

        if ( isdefined( var_3 ) & isarray( var_3._id_4E88 ) )
            var_1 = var_3._id_4E88.size;
    }
    else
    {
        foreach ( var_3 in var_2._id_6F22 )
        {
            if ( isarray( var_3._id_4E88 ) )
                var_1 += var_3._id_4E88.size;
        }
    }

    return var_1;
}

avmx_create_preset( var_0 )
{
    var_1 = avmx_get();
    var_2 = var_1._id_6F20[var_0];
    var_3 = spawnstruct();
    var_3._id_4227 = spawnstruct();
    var_3._id_9C0F = spawnstruct();
    var_3._id_4777 = spawnstruct();
    var_3._id_4E88 = [];
    var_3._id_4777._id_6F21 = soundscripts\_audio::aud_get_optional_param( undefined, var_0 );
    var_3._id_4777._id_35F0 = var_1._id_2769;
    var_3._id_4777._id_35F5 = var_1._id_276A;
    var_3._id_4777._id_88A1 = var_1._id_2776;
    var_3 [[ var_2 ]]();
    var_3 avmx_add_preset();
    return var_3;
}

avmx_add_preset()
{
    var_0 = avmx_get();
    var_0._id_6F22[self._id_4777._id_6F21] = self;
}

_id_9EDE()
{
    var_0 = avmx_get();
    var_0._id_6F22[self._id_4777._id_6F21] = undefined;
}

avmx_add_instance()
{
    var_0 = avmx_get();
    var_0._id_6F22[self._id_6F21]._id_4E88[self._id_4E87] = self;
    var_0._id_76DD++;
}

avmx_remove_instance()
{
    var_0 = avmx_get();
    var_0._id_6F22[self._id_6F21]._id_4E88[self._id_4E87] = undefined;
}

avmx_generate_instance_name( var_0 )
{
    var_1 = self._id_4777._id_6F21 + "_" + avm_get_running_instance_count();

    if ( isdefined( var_0 ) && var_0 == 1 )
        var_1 += "_player";

    return var_1;
}

avm_register_callback( var_0, var_1, var_2 )
{
    avmx_get().callbacks[var_0] = [ var_1, var_2 ];
}

avmx_get_instance_state_struct( var_0 )
{
    var_1 = self;
    var_2 = undefined;

    foreach ( var_4 in var_1._id_8D5A )
    {
        var_2 = var_4[var_0];

        if ( isdefined( var_2 ) )
            break;
    }

    return var_2;
}

avmx_get_behavior_instance_struct( var_0 )
{
    var_1 = self;
    return var_1.behavior_list[var_0];
}

avmx_get_state_preset_struct( var_0 )
{
    var_1 = self;
    var_2 = undefined;

    foreach ( var_4 in var_1._id_8D59._id_8D5B )
    {
        var_2 = var_4._id_8D67[var_0];

        if ( isdefined( var_2 ) )
            break;
    }

    return var_2;
}

avmx_get_behavior_preset_struct( var_0 )
{
    var_1 = self;
    return var_1.behavior_data.behaviors[var_0];
}

avmx_create_instance_struct( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self;
    var_6 = spawnstruct();
    var_6._id_9C0F = spawnstruct();
    var_6._id_6F21 = var_5 avmx_get_preset_name();
    var_6._id_4E87 = var_5 avmx_generate_instance_name( var_4 );
    var_6._id_9C78 = var_0;
    var_6._id_35F0 = var_1;
    var_6._id_35F5 = var_2;
    var_6._id_88A1 = var_3;
    var_6._id_6BA1 = var_4;
    var_6._id_586B = 1.0;
    var_6._id_6498 = [];
    var_6._id_59D9 = 1.0;
    var_6._id_5876 = [];

    foreach ( var_8 in var_5._id_586A._id_588F )
    {
        var_9 = spawnstruct();
        var_9._id_704A = var_8;
        var_9._id_697F = 0;
        var_9._id_24CF = var_6 avmx_create_param_io_struct( var_8 );
        var_9._id_86D9 = [];
        var_9._id_9F3C = 1.0;
        var_6._id_5876[var_8.name] = var_9;
    }

    var_6._id_649A = [];

    foreach ( var_8 in var_5._id_6497._id_64A2 )
    {
        var_9 = spawnstruct();
        var_9._id_704A = var_8;
        var_9._id_24CF = var_6 avmx_create_param_io_struct( var_8 );
        var_9._id_86D9 = [];
        var_6._id_649A[var_8.name] = var_9;
    }

    var_6.behavior_list = [];

    foreach ( var_8 in var_5.behavior_data.behaviors )
    {
        var_9 = spawnstruct();
        var_9._id_704A = var_8;
        var_9._id_24CF = var_6 avmx_create_param_io_struct( var_8 );
        var_6.behavior_list[var_8.name] = var_9;
    }

    var_6._id_8D5A = [];

    foreach ( var_21, var_16 in var_5._id_8D59._id_8D5B )
    {
        var_6._id_8D5A[var_21] = [];

        foreach ( var_20, var_18 in var_16._id_8D67 )
        {
            var_19 = spawnstruct();
            var_19._id_704A = var_18;
            var_19._id_8CC5 = 0;
            var_6._id_8D5A[var_21][var_20] = var_19;
        }
    }

    if ( isdefined( var_5._id_4227._id_4E86 ) )
        var_6 [[ var_5._id_4227._id_4E86 ]]( var_6._id_9C0F );

    return var_6;
}

avmx_start_instance( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self;

    if ( var_6 avmx_is_vehicle_proxy() == 0 )
        var_6 vehicle_turnengineoff();

    var_7 = avmx_get_preset( var_0 );

    if ( !isdefined( var_7 ) )
        var_7 = avmx_create_preset( var_0 );

    var_8 = var_7 avmx_create_instance_struct( var_6, var_2, var_3, var_4, var_1 );
    var_8 avmx_add_instance();
    var_8 thread avmx_update_loops();
    var_8 thread avmx_launch_state_machines( var_5 );
    var_6 thread avmx_monitor_death( var_8 );
    return var_8;
}

avmx_stop_instance( var_0 )
{
    if ( !isdefined( self._id_5085 ) )
    {
        self._id_5085 = 1;
        var_1 = self;
        var_2 = var_1 avmx_get_instance_preset();
        var_3 = var_1 avmx_get_instance_name();
        var_0 = max( 0.01, soundscripts\_audio::aud_get_optional_param( var_1._id_35F5, var_0 ) );
        level notify( "msg_snd_vehicle_stop_" + var_3 );

        foreach ( var_5 in var_1._id_5876 )
        {
            var_6 = soundscripts\_audio::aud_get_optional_param( var_5._id_704A._id_35F5, var_0 );
            var_5 thread avmx_fade_stop_and_delete_sound_obj( var_6 );
        }

        foreach ( var_9 in var_1._id_649A )
        {
            var_6 = soundscripts\_audio::aud_get_optional_param( var_9._id_704A._id_35F5, var_0 );
            var_9 thread avmx_fade_stop_and_delete_sound_obj( var_6 );
        }

        wait(var_0 + 0.05);
        var_1 avmx_remove_instance();
    }
}

avmx_monitor_death( var_0 )
{
    var_1 = var_0 avmx_get_instance_name();
    level endon( "msg_snd_vehicle_stop_" + var_1 );
    self waittill( "death" );
    var_0 thread avmx_stop_instance();
}

avmx_create_param_io_struct( var_0 )
{
    var_1 = self;
    var_2 = spawnstruct();
    var_2._id_8695 = [];
    var_2._id_67F7 = [];

    foreach ( var_4 in var_0._id_6681 )
    {
        var_2._id_8695[var_4._id_4E7B] = 0;

        foreach ( var_6 in var_4._id_3337 )
        {
            if ( !isdefined( var_2._id_67F7[var_6._id_65C7] ) )
                var_2._id_67F7[var_6._id_65C7] = 1.0;
        }
    }

    if ( !isdefined( var_2._id_67F7["volume"] ) )
        var_2._id_67F7["volume"] = 1.0;

    if ( !isdefined( var_2._id_67F7["pitch"] ) )
        var_2._id_67F7["pitch"] = 1.0;

    return var_2;
}

_id_9EDD( var_0 )
{
    var_1 = self;

    foreach ( var_4, var_3 in var_0._id_8695 )
        var_0._id_8695[var_4] = 0;

    foreach ( var_4, var_3 in var_0._id_67F7 )
        var_0._id_67F7[var_4] = 1.0;
}

avmx_get_current_instance_sound_item_input()
{
    return self._id_24CF._id_8695;
}

avmx_get_instance_sound_item_output()
{
    return self._id_24CF._id_67F7;
}

avmx_get_instance_sound_item_volume()
{
    var_0 = avmx_get_instance_sound_item_output();
    var_1 = var_0["volume"];

    if ( !isdefined( var_1 ) )
        var_1 = 1.0;

    return var_1;
}

avmx_update_loops()
{
    var_0 = self;
    var_1 = avmx_get_instance_preset();
    var_2 = avmx_get_vehicle_entity();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + avmx_get_instance_name() );
    var_2 endon( "death" );
    var_3 = undefined;

    for (;;)
    {
        var_0 avmx_update_loop_ducking_scalar();

        foreach ( var_5 in var_0._id_5876 )
        {
            if ( var_5._id_697F == 1 )
            {
                var_6 = var_5._id_704A.name;
                var_0 avmx_map_io( var_5, var_3 );
                var_0 avmx_update_instance_loop_assets( var_5 );
            }
        }

        var_3 = gettime();
        var_8 = distance2d( var_0._id_9C78.origin, level.player.origin );

        if ( var_8 < 400 )
            var_9 = 1.0;
        else if ( var_8 > 1500 )
            var_9 = 10.0;
        else
            var_9 = 1.0 + 9.0 * ( var_8 - 400 ) / 1100;

        wait(0.1 * var_9);
    }
}

avmx_set_loop_play_state( var_0, var_1 )
{
    var_2 = self;

    switch ( var_0._id_704A.asset_type )
    {
        case "alias":
            if ( var_1 == 1 && var_0._id_697F != 1 )
            {
                var_2 avmx_start_loop( var_0 );
                var_0._id_697F = 1;
            }
            else if ( var_1 == 0 && var_0._id_697F != 0 )
            {
                var_2 avmx_stop_loop( var_0 );
                var_0._id_697F = 0;
            }
            else
            {

            }

            break;
        case "soundevent":
            break;
        case "damb":
            break;
        default:
            break;
    }
}

avmx_map_io( var_0, var_1 )
{
    if ( var_0._id_704A._id_6681.size == 0 )
        return;

    var_2 = self;
    var_3 = avmx_get_instance_preset();
    var_4 = var_0._id_704A;
    var_5 = var_0._id_24CF;
    var_6 = gettime();
    var_1 = soundscripts\_audio::aud_get_optional_param( var_6 - 100, var_1 );
    var_5._id_67F7 = [];
    var_7 = [];

    foreach ( var_10, var_9 in var_3._id_2156 )
        var_7[var_10] = var_2 [[ var_9 ]]();

    foreach ( var_12 in var_4._id_6681 )
    {
        var_13 = var_12._id_4E7B;
        var_14 = var_7[var_13];
        var_15 = var_5._id_8695[var_13];

        if ( var_14 > var_15 )
            var_16 = var_12._id_8691;
        else
            var_16 = var_12._id_868C;

        var_17 = ( var_6 - var_1 ) / 100.0;
        var_16 = 1.0 - pow( 1 - var_16, var_17 );
        var_18 = var_15 + var_16 * ( var_14 - var_15 );

        foreach ( var_23, var_20 in var_12._id_3337 )
        {
            var_21 = var_3._id_3333[var_23];
            var_22 = piecewiselinearlookup( var_18, var_21._id_3332 );

            if ( isdefined( var_5._id_67F7[var_20._id_65C7] ) )
            {
                var_5._id_67F7[var_20._id_65C7] *= var_22;
                continue;
            }

            var_5._id_67F7[var_20._id_65C7] = var_22;
        }

        var_5._id_8695[var_13] = var_18;
    }
}

avmx_update_loop_ducking_scalar()
{
    self._id_586B = 1.0;

    foreach ( var_1 in self._id_6498 )
        self._id_586B *= var_1;
}

avmx_update_instance_loop_assets( var_0 )
{
    var_1 = self;

    foreach ( var_7, var_3 in var_0._id_24CF._id_67F7 )
    {
        if ( var_7 == "volume" )
        {
            var_3 *= ( var_1._id_586B * var_0._id_9F3C );

            if ( isdefined( var_0._id_35E0 ) )
            {
                var_0._id_35E0 = min( var_0._id_35E0 + var_0._id_35DE, 1.0 );
                var_3 *= var_0._id_35E0;

                if ( var_0._id_35E0 >= 1.0 )
                    var_0._id_35E0 = undefined;
            }
        }

        foreach ( var_5 in var_0._id_86D9 )
            var_5 avmx_update_sound_ent_output_param( var_7, var_3 );
    }
}

avm_set_loop_mute_state( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = var_3._id_5876[var_0];
    var_5 = 1.0;

    if ( var_1 == 1 )
        var_5 = 0;

    var_2 = soundscripts\_audio::aud_get_optional_param( 0.05, var_2 );
    var_6 = var_5 - var_4._id_9F3C;
    var_7 = max( 1, var_2 / avm_get_update_rate() );
    var_8 = var_6 / var_7;
    var_3 thread avmx_set_loop_volume( var_4, var_5, var_8, avm_get_update_rate() );
}

avmx_set_loop_volume( var_0, var_1, var_2, var_3 )
{
    var_4 = self;
    var_5 = var_4 avmx_get_vehicle_entity();
    var_6 = var_0._id_704A.name;
    var_4 notify( var_6 );
    var_4 endon( var_6 );
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_4 avmx_get_instance_name() );
    var_5 endon( "death" );

    for (;;)
    {
        if ( var_2 < 0 )
        {
            if ( var_0._id_9F3C > var_1 )
                var_0._id_9F3C = max( 0, var_0._id_9F3C + var_2 );
            else
                break;
        }
        else if ( var_2 > 0 )
        {
            if ( var_0._id_9F3C < var_1 )
                var_0._id_9F3C = min( 1.0, var_0._id_9F3C + var_2 );
            else
                break;
        }

        wait(var_3);
    }
}

avmx_launch_state_machines( var_0 )
{
    var_1 = self;
    var_2 = avmx_get_instance_preset();

    foreach ( var_10, var_4 in var_2._id_8D59._id_8D5B )
    {
        var_5 = var_4._id_4DD3;

        if ( isarray( var_0 ) )
            var_5 = var_0[var_10];

        var_6 = var_5[0];
        var_7 = var_5[1];
        var_8 = var_1._id_8D5A[var_10][var_6];
        var_9 = var_1.behavior_list[var_7];
        var_1 avmx_map_io( var_9 );
        var_1 thread avmx_state_enter_action_function( var_8, var_9, 1 );
    }
}

avmx_state_enter_action_function( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = var_3 avmx_get_instance_preset();
    var_5 = var_0._id_704A;
    var_6 = var_3 avmx_get_vehicle_entity();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + avmx_get_instance_name() );
    var_6 endon( "death" );
    var_0._id_8CC5 = gettime();
    var_3 avmx_state_enter_action_init_data( var_0, var_1 );
    var_3 avmx_state_enter_action_play_oneshots( var_0, var_1 );
    var_3 avmx_state_enter_action_play_loops( var_0, var_1 );

    if ( isdefined( var_1._id_704A._id_4D60 ) )
        var_3 [[ var_1._id_704A._id_4D60 ]]( var_3._id_9C0F );

    var_7 = undefined;
    var_8 = undefined;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;
    var_12 = 1;

    for (;;)
    {
        if ( isdefined( var_1._id_704A._id_4C0E ) )
        {
            var_3 avmx_map_io( var_1 );
            var_3 [[ var_1._id_704A._id_4C0E ]]( var_1._id_24CF._id_8695, var_3._id_9C0F );
        }

        foreach ( var_14 in var_5._id_9719 )
        {
            var_15 = var_14[0];
            var_16 = var_14[1];
            var_17 = var_14[2];
            var_18 = var_3 avmx_get_instance_state_struct( var_15 );
            var_19 = var_3 avmx_get_behavior_instance_struct( var_16 );
            var_20 = var_18._id_704A;
            var_21 = var_19._id_704A;

            if ( gettime() - var_18._id_8CC5 < var_20._id_5C34 )
                continue;

            var_3 avmx_map_io( var_19, var_11 );
            var_22 = var_3 avmx_state_condition_function( var_18, var_19 );

            if ( isarray( var_22 ) )
            {
                var_10 = var_22;
                var_22 = 1;
            }

            if ( var_22 )
            {
                if ( !isdefined( var_7 ) || var_20._id_6FBE > var_7._id_704A._id_6FBE )
                {
                    var_7 = var_18;
                    var_8 = var_19;
                    var_9 = var_10;
                    var_10 = undefined;
                }
            }
        }

        if ( isdefined( var_7 ) )
            break;

        var_12 = 0;
        var_11 = gettime();
        var_24 = distance2d( var_3._id_9C78.origin, level.player.origin );

        if ( var_24 < 400 )
            var_25 = 1.0;
        else if ( var_24 > 1500 )
            var_25 = 10.0;
        else
            var_25 = 1.0 + 9.0 * ( var_24 - 400 ) / 1100;

        wait(0.1 * var_25);
    }

    var_3 avmx_set_behavior_oneshot_overrides( var_8, var_9 );
    var_26 = var_3 avmx_get_behavior_restricted_oneshots( var_8 );
    var_27 = var_26.size > 0;
    var_3 thread avmx_state_exit_action_function( var_1, var_27 );

    if ( var_12 && !var_2 )
    {

    }

    var_3 thread avmx_state_enter_action_function( var_7, var_8, 0 );
}

avmx_state_enter_action_init_data( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_1._id_704A;

    if ( isdefined( var_3._id_588F[0] ) )
    {
        if ( var_3._id_588F[0] == "all" )
        {
            foreach ( var_5 in var_2._id_5876 )
                var_5._id_9F3C = 1.0;
        }
    }
    else
    {
        foreach ( var_8 in var_3._id_588F )
        {
            var_5 = var_2._id_5876[var_8];
            var_5._id_9F3C = 1.0;
        }
    }
}

avmx_state_exit_action_function( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_0._id_704A._id_64A2;

    foreach ( var_5 in var_3 )
    {
        var_6 = var_2._id_649A[var_5];
        var_7 = var_6._id_704A._id_649C;

        if ( var_7 == 2 || var_7 == 1 && var_1 )
        {
            var_8 = var_6._id_86D9;
            var_6._id_86D9 = [];
            var_9 = var_6._id_704A._id_35F5;

            foreach ( var_12, var_11 in var_8 )
                var_11 thread avmx_stop_snd_ent( var_9 );
        }
    }
}

_id_9EDB( var_0 )
{
    var_1 = self;
    var_0 = max( 0.01, soundscripts\_audio::aud_get_optional_param( 0.05, var_0 ) );

    switch ( var_1._id_704A.asset_type )
    {
        case "alias":
            foreach ( var_4, var_3 in var_1._id_86D9 )
            {
                if ( isdefined( var_3 ) )
                {
                    var_3 setvolume( 0, var_0 );
                    wait(var_0);

                    if ( isdefined( var_3 ) )
                        var_3 stopsounds();
                }
            }

            break;
        case "soundevent":
            break;
        case "damb":
            break;
        default:
            break;
    }
}

avmx_state_condition_function( var_0, var_1 )
{
    var_2 = 0;
    var_3 = self;
    var_2 = var_3 [[ var_1._id_704A._id_20E0 ]]( var_1._id_24CF._id_8695, var_3._id_9C0F );
    return var_2;
}

avmx_state_enter_action_play_oneshots( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 avmx_get_instance_preset();
    var_4 = var_0._id_704A;
    var_5 = var_1._id_704A;
    var_6 = var_1._id_649B;

    if ( !isdefined( var_6 ) )
        var_6 = var_5._id_64A2;

    foreach ( var_8 in var_6 )
    {
        var_9 = var_2._id_649A[var_8];
        var_10 = var_9._id_704A;
        var_11 = var_2 avmx_get_oneshot_poly_mode( var_8 );
        var_12 = var_2 avmx_get_oneshot_update_mode( var_8 );

        if ( var_10.asset_type == "alias" )
        {
            var_2 avmx_map_io( var_9 );

            for ( var_13 = 0; var_13 < var_10.asset_names.size; var_13++ )
            {
                var_14 = var_2 avmx_start_oneshot_alias( var_9, var_13 );

                foreach ( var_17, var_16 in var_9._id_24CF._id_67F7 )
                    var_14 avmx_update_sound_ent_output_param( var_17, var_16 );

                if ( var_12 )
                    var_2 thread avmx_continuously_update_snd_ent( var_9, var_14 );

                if ( var_11 == 1 || var_11 == 2 )
                    var_9._id_86D9[var_13] = var_14;
            }

            var_2 thread avmx_handle_oneshot_ducking( var_9 );
        }
    }
}

avmx_continuously_update_snd_ent( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 avmx_get_vehicle_entity();
    var_4 = avm_get_update_rate();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_2 avmx_get_instance_name() );
    var_3 endon( "death" );
    wait(var_4);

    while ( isdefined( var_1 ) )
    {
        var_2 avmx_map_io( var_0 );

        if ( isdefined( var_1 ) )
        {
            foreach ( var_7, var_6 in var_0._id_24CF._id_67F7 )
                var_1 avmx_update_sound_ent_output_param( var_7, var_6 );
        }

        wait(var_4);
    }
}

avmx_state_enter_action_play_loops( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 avmx_get_instance_preset();
    var_4 = var_0._id_704A;
    var_5 = var_1._id_704A;
    var_6 = var_5._id_588F;

    if ( isdefined( var_6[0] ) )
    {
        if ( var_6[0] == "all" )
        {
            foreach ( var_9, var_8 in var_2._id_5876 )
                avmx_set_loop_play_state( var_8, 1 );
        }
        else if ( var_6[0] == "none" )
        {
            foreach ( var_9, var_8 in var_2._id_5876 )
                avmx_set_loop_play_state( var_8, 0 );
        }
        else
        {

        }
    }
    else if ( var_6.size > 0 )
    {
        var_11 = [];
        var_12 = [];

        foreach ( var_9, var_8 in var_2._id_5876 )
        {
            if ( isdefined( var_6[var_9] ) )
            {
                var_11[var_9] = var_8;
                continue;
            }

            var_12[var_9] = var_8;
        }

        foreach ( var_9, var_8 in var_11 )
            avmx_set_loop_play_state( var_8, 1 );

        foreach ( var_9, var_8 in var_12 )
            avmx_set_loop_play_state( var_8, 0 );
    }
}

_id_4E48()
{
    var_0 = avmx_get_vehicle_entity();
    return distance2d( var_0.origin, level.player.origin );
}

_id_4E47()
{
    var_0 = avmx_get_vehicle_entity();
    return distance( var_0.origin, level.player.origin );
}

_id_4E57()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 vehicle_getthrottle();
}

_id_4E55()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = length( var_0 vehicle_getvelocity() * 0.0568182 );
    return var_1;
}

_id_4E54()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0 vehicle_getvelocity();
    var_2 = level.player getvelocity();
    var_3 = var_1 - var_2;
    var_4 = length( var_3 ) * 0.0568182;
    return var_4;
}

_id_4E56()
{
    var_0 = avmx_get_vehicle_entity();

    if ( isdefined( var_0._id_3653 ) )
        return var_0._id_3653;

    return var_0 maps\_shg_utility::_id_3D3D() * 0.0568182;
}

_id_4E45()
{
    var_0 = avmx_get_vehicle_entity();
    return length( var_0 maps\_shg_utility::_id_3D3B() ) * 0.00125;
}

_id_4E4C()
{
    var_0 = avmx_get_vehicle_entity();
    return length( var_0 maps\_shg_utility::_id_3D3C() ) * 0.00125;
}

_id_4E49()
{
    var_0 = avmx_get_vehicle_entity();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.player.origin, level.player getvelocity() );
}

_id_4E4A()
{
    var_0 = avmx_get_vehicle_entity();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.player.origin, level.player getvelocity(), 2, 5 );
}

_id_4E4B()
{
    var_0 = avmx_get_vehicle_entity();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.player.origin, level.player getvelocity(), 1, 0.5 );
}

avm_compute_doppler_pitch( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 13397;

    if ( var_4 != 1 )
    {
        var_7 = var_1 - var_3;
        var_8 = vectornormalize( var_7 );
        var_9 = var_2 - var_0;
        var_10 = var_8 * vectordot( var_8, var_9 );
        var_11 = var_9 - var_10;
        var_2 = var_0 + var_10 + var_11 / var_4;
    }

    var_12 = vectornormalize( var_0 - var_2 );
    var_13 = vectordot( var_1, var_12 );
    var_14 = vectordot( var_3, var_12 );
    var_15 = ( var_6 + var_14 ) / ( var_6 + var_13 );
    var_15 = pow( var_15, var_5 );
    var_15 = clamp( var_15, 0.1, 1.99 );
    return var_15;
}

_id_4E51()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0.angles[0];
    return var_1;
}

_id_4E58()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0.angles[1];
    return var_1;
}

_id_4E52()
{
    var_0 = avmx_get_vehicle_entity();
    return max( abs( angleclamp180( var_0.angles[0] ) ), abs( angleclamp180( var_0.angles[2] ) ) );
}

_id_4E46()
{
    var_0 = avmx_get_vehicle_entity();
    return acos( anglestoup( var_0.angles )[2] );
}

_id_4E4F()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_844C();
}

_id_4E4E()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_844D();
}

_id_4E4D()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_844E();
}

_id_4E50()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_844F();
}

_id_4E53()
{
    var_0 = 0;
    var_1 = avmx_get_vehicle_entity();
    var_2 = 0.1;

    if ( avmx_is_player_mode() )
    {
        if ( !isdefined( var_1.amv_jetbike_height_time ) )
            var_1.amv_jetbike_height_time = 0;

        var_3 = gettime();

        if ( var_3 > var_1.amv_jetbike_height_time + var_2 )
        {
            var_1.amv_jetbike_height_time = var_3;
            var_4 = bullettrace( var_1.origin, var_1.origin - ( 0.0, 0.0, 360.0 ), 0 );
            var_1.amv_jetbike_height_val = var_4["fraction"];

            if ( !isdefined( var_1.amv_jetbike_height_val ) )
                var_1.amv_jetbike_height_val = 0;
        }

        var_0 = clamp( var_1.amv_jetbike_height_val, 0, 1.0 );
    }

    return var_0;
}

_id_4E69()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_8471();
}

_id_4E6B()
{
    var_0 = _id_4E69();
    return var_0[0];
}

_id_4E6A()
{
    var_0 = _id_4E69();
    return var_0[1];
}

_id_4E6C()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_8473();
}

_id_4E6E()
{
    var_0 = _id_4E6C();
    return var_0[0];
}

_id_4E6D()
{
    var_0 = _id_4E6C();
    return var_0[1];
}

_id_4E73()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_8470();
}

_id_4E71()
{
    var_0 = _id_4E73();
    return var_0[0];
}

_id_4E72()
{
    var_0 = _id_4E73();
    return var_0[1];
}

_id_4E6F()
{
    var_0 = _id_4E73();
    return var_0[2];
}

_id_4E70()
{
    var_0 = _id_4E73();
    return var_0[3];
}

_id_4E74()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_846F();
}

_id_4E76()
{
    var_0 = _id_4E74();
    return var_0[0];
}

_id_4E75()
{
    var_0 = _id_4E74();
    return var_0[1];
}

_id_4E79()
{
    var_0 = avmx_get_vehicle_entity();
    return var_0 _meth_8472();
}

_id_4E77()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0._id_9940 _meth_8475();
    var_1 = abs( var_1 );
    var_1 = clamp( var_1, 0, 90 );
    var_1 = avmx_normalize_ranged_value( var_1, 0, 90 );
    var_2 = level.player getnormalizedcameramovement();
    var_3 = abs( var_2[0] );
    return 0;
}

_id_4E78()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0._id_9940 _meth_8474();
    var_1 = abs( var_1 );
    var_2 = var_0._id_9940 _meth_8475();
    var_2 = abs( var_2 );
    var_3 = length2d( ( var_1, var_2, 0 ) );
    var_3 = clamp( var_3, 0, 135 );
    var_4 = avmx_normalize_ranged_value( var_3, 0, 135 );
    var_5 = level.player getnormalizedcameramovement();
    var_6 = length2d( var_5 );
    return var_4 * var_6;
}

_id_4E66()
{
    var_0 = avmx_get_vehicle_entity();

    if ( isdefined( level.aud._id_2B91 ) && level.aud._id_2B91 == 1 )
    {
        level.aud._id_2B93 *= 0.94;
        return level.aud._id_2B93;
    }
    else
    {
        var_1 = var_0 _meth_8512();

        if ( var_1 != 0 )
            level.aud._id_2B93 = var_1;

        return var_1;
    }
}

_id_4E64()
{
    var_0 = avmx_get_vehicle_entity();
    var_1 = var_0 _meth_8513();
    return var_1;
}

_id_4E65()
{
    var_0 = _id_4E64();
    var_1 = _id_4E56();
    var_2 = var_1 + abs( var_0 ) * 0.1;
    return var_1 + abs( var_0 ) * 0.1;
}

_id_4E7C()
{
    var_0 = level.player getnormalizedcameramovement();
    var_1 = abs( var_0[0] );
    var_2 = abs( var_0[1] );

    if ( var_1 > var_2 )
        return var_1;
    else
        return var_2;
}

avmx_start_oneshot_alias( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_0._id_704A;
    var_4 = undefined;
    var_5 = var_2 avmx_get_sound_alias( var_3, var_1 );

    if ( isstring( var_5 ) )
    {
        var_6 = var_2 avmx_get_vehicle_entity();
        var_4 = spawn( "script_origin", var_6.origin );
        var_4 linkto( var_6, "tag_origin", var_2._id_88A1, ( 0.0, 0.0, 0.0 ) );
        var_4 scalevolume( 0 );
        var_4 soundscripts\_snd_playsound::_id_872A( var_5, "sound_done" );
        var_4 thread avmx_monitor_oneshot_done( "sound_done" );
    }

    return var_4;
}

avmx_monitor_oneshot_done( var_0 )
{
    self endon( "death" );
    self waittill( var_0 );

    if ( isdefined( self ) )
        self delete();
}

avmx_is_player_mode()
{
    return isdefined( self._id_6BA1 ) && self._id_6BA1;
}

avmx_get_sound_alias( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_0.asset_names[soundscripts\_audio::aud_get_optional_param( 0, var_1 )];

    if ( isdefined( var_3 ) && var_2 avmx_is_player_mode() )
        var_3 += "_plr";

    return var_3;
}

avmx_get_sound_alias_count( var_0 )
{
    return var_0.asset_names.size;
}

avmx_update_sound_ent_output_param( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "volume":
            self scalevolume( var_1, 0.1 );
            break;
        case "pitch":
            self scalepitch( var_1, 0.1 );
            break;
        default:
            break;
    }
}

avmx_handle_oneshot_ducking( var_0 )
{
    var_1 = self;
    var_2 = var_0._id_704A;
    var_1 avmx_add_oneshot_ducking_scalar( var_2.name );
    var_1 avmx_update_oneshot_duck_scalar( var_0 );
    var_1 avmx_remove_oneshot_ducking_scalar( var_2.name );
}

avmx_update_oneshot_duck_scalar( var_0 )
{
    var_1 = self;
    var_2 = var_1 avmx_get_instance_preset();
    var_3 = var_0._id_704A;
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_1 avmx_get_instance_name() );
    var_1 avmx_get_vehicle_entity() endon( "death" );

    if ( isdefined( var_3._id_2FB4 ) )
    {
        var_4 = var_2 avmx_get_envelope( var_3._id_2FB4 );
        var_5 = soundscripts\_audio::aud_get_envelope_domain( var_4 );
        var_6 = 0;
        var_7 = var_5[1];

        for ( var_8 = var_3.name; avmx_are_all_defined( var_0._id_86D9 ) && var_6 < var_7; var_6 += 0.1 )
        {
            var_9 = var_0 avmx_get_instance_sound_item_volume();
            var_10 = var_2 avmx_map_input( var_6, var_3._id_2FB4 );
            var_10 = 1.0 - var_9 * ( 1.0 - var_10 );
            var_1 avmx_set_oneshot_ducking_scalar( var_8, var_10 );
            wait 0.1;
        }
    }
}

avmx_are_all_defined( var_0 )
{
    var_1 = 1;

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
        {
            var_1 = 0;
            break;
        }
    }

    return var_1;
}

avmx_add_oneshot_ducking_scalar( var_0 )
{
    self._id_6498[var_0] = 1.0;
}

avmx_remove_oneshot_ducking_scalar( var_0 )
{
    self._id_6498[var_0] = undefined;
}

avmx_set_oneshot_ducking_scalar( var_0, var_1 )
{
    self._id_6498[var_0] = var_1;
}

avmx_normalize_ranged_value( var_0, var_1, var_2 )
{
    return ( var_0 - var_1 ) / ( var_2 - var_1 );
}

avmx_get()
{
    return level._audio._id_9EB3;
}

avmx_get_callback( var_0 )
{
    return avmx_get().callbacks[var_0][0];
}

avmx_get_preset_name()
{
    return self._id_4777._id_6F21;
}

avmx_set_preset_name( var_0 )
{
    self._id_4777._id_6F21 = var_0;
}

avmx_set_instance_init_callback( var_0 )
{
    self._id_4227._id_4E86 = var_0;
}

avmx_get_instance_name()
{
    return self._id_4E87;
}

avmx_get_instance_preset_name()
{
    return self._id_6F21;
}

avmx_get_instance_preset()
{
    return avmx_get_preset( self._id_6F21 );
}

avmx_get_preset( var_0 )
{
    var_1 = avmx_get();
    return var_1._id_6F22[var_0];
}

avmx_get_instance( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = avmx_get();

    if ( isstring( var_1 ) )
    {
        var_4 = avmx_get_preset( var_1 );

        if ( isdefined( var_4 ) )
            var_2 = var_4._id_4E88[var_0];
    }
    else
    {
        foreach ( var_4 in var_3._id_6F22 )
        {
            foreach ( var_7 in var_4._id_4E88 )
            {
                if ( var_7._id_4E87 == var_0 )
                {
                    var_2 = var_7;
                    break;
                }
            }
        }
    }

    return var_2;
}

avmx_get_vehicle_entity()
{
    return self._id_9C78;
}

avmx_get_sound_instance()
{
    return self._id_86FE;
}

avmx_get_fadein_time()
{
    return self._id_4777._id_35F0;
}

avmx_get_fadeout_time()
{
    return self._id_4777._id_35F5;
}

avmx_set_behavior_oneshot_overrides( var_0, var_1 )
{
    var_0._id_649B = var_1;
}

avmx_get_behavior_restricted_oneshots( var_0 )
{
    var_1 = self;
    var_2 = [];
    var_3 = var_0._id_704A;
    var_4 = avmx_get_preset( var_3._id_6F21 );
    var_5 = var_0._id_649B;

    if ( !isdefined( var_5 ) )
        var_5 = var_3._id_64A2;

    foreach ( var_7 in var_5 )
    {
        if ( var_1 avmx_get_oneshot_poly_mode( var_7 ) == 1 )
            var_2[var_7] = var_7;
    }

    return var_2;
}

avmx_get_oneshot_poly_mode( var_0 )
{
    var_1 = self;
    var_2 = var_1._id_649A[var_0]._id_704A;
    return var_2._id_649C;
}

avmx_get_oneshot_update_mode( var_0 )
{
    var_1 = self;
    var_2 = 0;

    if ( isstring( var_0 ) )
        var_3 = var_1._id_649A[var_0]._id_704A;
    else
        var_3 = var_0._id_704A;

    var_2 = var_3._id_649E;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    return var_2;
}

avmx_get_envelope( var_0 )
{
    return self._id_3333[var_0];
}

avmx_map_input( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 avmx_get_envelope( var_1 );

    if ( isdefined( var_3._id_3335 ) )
        var_4 = [[ var_3._id_3335 ]]( var_0 );
    else
        var_4 = piecewiselinearlookup( var_0, var_3._id_3332 );

    return var_4;
}

avmx_start_loop( var_0 )
{
    var_1 = self;
    var_2 = var_1 avmx_get_instance_preset();
    var_3 = var_1 avmx_get_vehicle_entity();
    var_4 = var_0._id_704A;
    var_5 = var_2 avmx_get_sound_alias_count( var_4 );
    var_6 = var_1._id_88A1;
    var_7 = var_0._id_704A._id_35F5;
    var_8 = 1.0;
    var_0._id_35DE = 0.1 / var_7;
    var_0._id_35E0 = 0;

    for ( var_9 = 0; var_9 < var_5; var_9++ )
    {
        var_10 = var_1 avmx_get_sound_alias( var_4, var_9 );
        var_11 = spawn( "script_origin", var_3.origin );
        var_11 linkto( var_3, "tag_origin", var_6, ( 0.0, 0.0, 0.0 ) );
        var_11 scalevolume( 0 );
        var_11 soundscripts\_snd_playsound::_id_873E( var_10 );
        var_0._id_86D9[var_10] = var_11;
    }
}

avmx_stop_loop( var_0 )
{
    var_1 = self;
    var_2 = var_0._id_86D9;
    var_0._id_86D9 = [];

    foreach ( var_4 in var_2 )
        var_4 thread avmx_stop_snd_ent( var_0._id_704A._id_35F5 );
}

avmx_stop_snd_ent( var_0 )
{
    var_1 = self;
    var_0 = max( 0.05, soundscripts\_audio::aud_get_optional_param( 0.05, var_0 ) );

    if ( isdefined( var_1 ) )
    {
        var_1 setvolume( 0, var_0 );
        wait(var_0);

        if ( isdefined( var_1 ) )
            var_1 stopsounds();

        wait 0.05;

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
}

_id_9EDC( var_0 )
{
    var_1 = self;

    foreach ( var_3 in var_1._id_5876 )
        var_3 avmx_fade_stop_and_delete_sound_obj( var_0 );

    foreach ( var_6 in var_1._id_649A )
        var_6 avmx_fade_stop_and_delete_sound_obj( var_0 );
}

avmx_fade_stop_and_delete_sound_obj( var_0 )
{
    var_1 = self;

    switch ( var_1._id_704A.asset_type )
    {
        case "alias":
            foreach ( var_4, var_3 in var_1._id_86D9 )
            {
                var_3 avmx_stop_snd_ent( var_0 );
                var_1._id_86D9[var_4] = undefined;
            }

            break;
        case "soundevent":
            break;
        case "damb":
            break;
    }
}

_id_9EDA()
{
    var_0 = self;

    foreach ( var_2 in var_0._id_5876 )
    {
        switch ( var_2._id_704A.asset_type )
        {
            case "alias":
                var_2._id_86D9 thread avmx_stop_snd_ent( 0.05 );
                var_2._id_86D9 = [];
                continue;
            case "soundevent":
                continue;
            case "damb":
                continue;
            default:
                continue;
        }
    }

    foreach ( var_5 in var_0._id_649A )
    {
        foreach ( var_7 in var_5._id_86D9 )
            var_7 thread avmx_stop_snd_ent( 0.05 );

        var_5._id_86D9 = [];
    }
}

_id_9A2A( var_0 )
{
    return var_0 * 0.0277778;
}

_id_A3B3( var_0 )
{
    return var_0 * 36;
}

_id_2B71( var_0 )
{
    return var_0 * 0.0277778;
}

_id_A3B2( var_0 )
{
    return var_0 * 36;
}

avmx_vehicle_getspeed()
{
    var_0 = 0;

    if ( avmx_is_vehicle_proxy() == 0 )
        var_0 = self vehicle_getspeed();

    return var_0;
}
