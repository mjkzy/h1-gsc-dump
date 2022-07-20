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

_id_1181( var_0, var_1 )
{

}

_id_11A2()
{
    if ( isdefined( level._id_055B._id_9EB3 ) )
        return;

    if ( !isdefined( level._id_055B._id_9EB3 ) )
        level._id_055B._id_9EB3 = spawnstruct();

    var_0 = _id_11B1();
    var_0._id_4D6A = gettime();
    var_0._id_1A04 = [];
    var_0._id_6F20 = [];
    var_0._id_6F22 = [];
    var_0._id_76DD = 0;
    var_0._id_2768 = "alias";
    var_0._id_2771 = 0;
    var_0._id_2769 = 1.0;
    var_0._id_276A = 1.0;
    var_0._id_2777 = 0;
    var_0._id_2776 = ( 0, 0, 0 );
    var_0._id_2775 = 1.0;
    var_0._id_2774 = 1.0;
    var_0._id_276D = "distance";
    var_0._id_276F = "volume";
    var_0._id_2770 = 1.0;
    var_0._id_2772 = 50;
    soundscripts\_snd::_id_874D( "snd_register_vehicle", ::_id_874E );
    soundscripts\_snd::_id_874D( "snd_start_vehicle", ::_id_8771 );
    soundscripts\_snd::_id_874D( "snd_stop_vehicle", ::_id_8779 );
    _id_11A3( "distance2d", ::_id_4E48 );
    _id_11A3( "distance", ::_id_4E47 );
    _id_11A3( "throttle", ::_id_4E57 );
    _id_11A3( "speed", ::_id_4E55 );
    _id_11A3( "relative_speed", ::_id_4E54 );
    _id_11A3( "doppler", ::_id_4E49 );
    _id_11A3( "doppler_exaggerated", ::_id_4E4A );
    _id_11A3( "doppler_subtle", ::_id_4E4B );
    _id_11A3( "speed_mph", ::_id_4E56 );
    _id_11A3( "acceleration_g", ::_id_4E45 );
    _id_11A3( "jerk_gps", ::_id_4E4C );
    _id_11A3( "pitch", ::_id_4E51 );
    _id_11A3( "yaw", ::_id_4E58 );
    _id_11A3( "pitch_roll_max", ::_id_4E52 );
    _id_11A3( "degrees_from_upright", ::_id_4E46 );
    _id_11A3( "jetbike_thrust", ::_id_4E4F );
    _id_11A3( "jetbike_drag", ::_id_4E4E );
    _id_11A3( "jetbike_anti_slip", ::_id_4E4D );
    _id_11A3( "jetbike_total_repulsor", ::_id_4E50 );
    _id_11A3( "jetbike_height", ::_id_4E53 );
    _id_11A3( "hovertank_anti_slip_magnitude", ::_id_4E6B );
    _id_11A3( "hovertank_anti_slip_direction", ::_id_4E6A );
    _id_11A3( "hovertank_auto_yaw_magnitude", ::_id_4E6E );
    _id_11A3( "hovertank_auto_yaw_direction", ::_id_4E6D );
    _id_11A3( "hovertank_repulsor_front_left", ::_id_4E71 );
    _id_11A3( "hovertank_repulsor_front_right", ::_id_4E72 );
    _id_11A3( "hovertank_repulsor_back_left", ::_id_4E6F );
    _id_11A3( "hovertank_repulsor_back_right", ::_id_4E70 );
    _id_11A3( "hovertank_throttle_magnitude", ::_id_4E76 );
    _id_11A3( "hovertank_throttle_direction", ::_id_4E75 );
    _id_11A3( "hovertank_uprighting", ::_id_4E79 );
    _id_11A3( "hovertank_turret_yaw", ::_id_4E78 );
    _id_11A3( "hovertank_turret_pitch", ::_id_4E77 );
    _id_11A3( "diveboat_throttle", ::_id_4E66 );
    _id_11A3( "diveboat_drag", ::_id_4E64 );
    _id_11A3( "diveboat_drag_with_mph", ::_id_4E65 );
    _id_11A3( "player_pdrone_look", ::_id_4E7C );
}

_id_874E( var_0, var_1 )
{
    var_2 = _id_11B1();
    var_2._id_6F20[var_0] = var_1;
}

_id_8771( var_0 )
{
    var_1 = _id_11B1();

    if ( isstring( var_0 ) )
    {
        var_2 = var_0;
        var_0 = spawnstruct();
        var_0._id_6F21 = var_2;
    }

    var_2 = var_0._id_6F21;
    var_3 = soundscripts\_audio::_id_0F30( var_1._id_2771, var_0._id_6BA1 );
    var_4 = soundscripts\_audio::_id_0F30( var_1._id_2769, var_0._id_35F0 );
    var_5 = soundscripts\_audio::_id_0F30( var_1._id_276A, var_0._id_35F5 );
    var_6 = soundscripts\_audio::_id_0F30( var_1._id_2776, var_0._id_6379 );
    var_7 = soundscripts\_audio::_id_0F30( undefined, var_0._id_4DD4 );
    self._id_86FE = thread _id_11E1( var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_8779( var_0, var_1 )
{
    var_2 = self;
    var_3 = _id_11B1();
    var_4 = var_2._id_86FE;
    var_2._id_86FE = undefined;
    var_5 = var_4 _id_11BC();
    var_6 = soundscripts\_audio::_id_0F30( var_4._id_35F5, var_5._id_4777._id_35F5 );
    var_4._id_35F5 = soundscripts\_audio::_id_0F30( var_6, var_0 );
    var_1 = soundscripts\_audio::_id_0F30( 0, var_1 );
    var_4 maps\_utility::_id_27EF( var_1, ::_id_11EA, var_4._id_35F5 );
}

_id_1194()
{
    var_0 = common_scripts\utility::_id_8959();
    var_0._id_9EC3 = 1;
    return var_0;
}

_id_11CD()
{
    return isdefined( self._id_9EC3 ) && self._id_9EC3 == 1;
}

_id_118C( var_0, var_1 )
{
    var_2 = _id_11B1();
    _id_11E0( var_0 );
    _id_11DA( var_1 );
    var_2._id_9D66 = self;
}

_id_1187( var_0, var_1, var_2 )
{
    var_3 = _id_11B1();
    self._id_586A = spawnstruct();
    self._id_586A._id_588F = [];
    self._id_586A._id_279C = spawnstruct();
    self._id_586A._id_279C._id_35F5 = soundscripts\_audio::_id_0F30( var_3._id_276A, var_0 );
    self._id_586A._id_279C._id_8691 = soundscripts\_audio::_id_0F30( var_3._id_2775, var_1 );
    self._id_586A._id_279C._id_868C = soundscripts\_audio::_id_0F30( var_3._id_2774, var_2 );
}

_id_1188( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isarray( var_0 ) )
        var_6 = var_0;
    else
        var_6 = [ var_0 ];

    var_1 = soundscripts\_audio::_id_0F30( self._id_586A._id_279C._id_35F5, var_1 );
    var_2 = soundscripts\_audio::_id_0F30( self._id_586A._id_279C._id_8691, var_2 );
    var_3 = soundscripts\_audio::_id_0F30( self._id_586A._id_279C._id_868C, var_3 );
    var_4 = soundscripts\_audio::_id_0F30( var_0, var_4 );
    var_5 = soundscripts\_audio::_id_0F30( "alias", var_5 );
    var_10 = spawnstruct();
    var_10.nearz = var_4;
    var_10._id_35F5 = var_1;
    var_10._id_0D5F = var_5;
    var_10._id_0D5E = var_6;
    var_10._id_6F21 = _id_11C5();
    var_10._id_6681 = [];
    var_10 _id_11D6( var_2, var_3 );
    self._id_586A._id_588F[var_10.nearz] = var_10;
    self._id_586A._id_5878 = var_10;
}

_id_11D5( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self._id_586A ) && isdefined( self._id_586A._id_5878 ) )
    {
        var_1 = self._id_586A._id_5878;

        if ( isdefined( self._id_13A3 ) )
        {

        }
    }
    else if ( isdefined( self._id_6497 ) && isdefined( self._id_6497._id_649D ) )
        var_1 = self._id_6497._id_649D;
    else if ( isdefined( self._id_13A3 ) && isdefined( self._id_13A3._id_13A5 ) )
        var_1 = self._id_13A3._id_13A5;

    return var_1;
}

_id_11D4( var_0 )
{
    var_1 = undefined;
    var_2 = _id_11D5( var_0 );

    if ( isdefined( var_2 ) )
        var_1 = var_2._id_6E00;

    return var_1;
}

_id_11D6( var_0, var_1 )
{
    var_2 = _id_11B1();
    self._id_6680 = spawnstruct();
    var_3 = soundscripts\_audio::_id_0F30( var_2._id_2775, self._id_6680._id_8691 );
    var_4 = soundscripts\_audio::_id_0F30( var_2._id_2774, self._id_6680._id_868C );
    self._id_6680._id_8691 = soundscripts\_audio::_id_0F30( var_3, var_0 );
    self._id_6680._id_868C = soundscripts\_audio::_id_0F30( var_4, var_1 );
    self._id_6680._id_4E7B = var_2._id_276D;
    self._id_6680._id_65C7 = var_2._id_276F;
    self._id_6680._id_4E7A = [];
}

_id_118B( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    var_3 = var_0;

    if ( !isstring( var_3 ) )
        var_3 = "";

    var_4 = _id_11D5( var_3 );
    var_3 = var_0;
    var_6 = spawnstruct();
    var_6._id_3337 = [];
    var_6._id_4E7B = var_0;
    var_6._id_8691 = soundscripts\_audio::_id_0F30( var_4._id_6680._id_8691, var_1 );
    var_6._id_868C = soundscripts\_audio::_id_0F30( var_4._id_6680._id_868C, soundscripts\_audio::_id_0F30( var_1, var_2 ) );
    var_6._id_276F = var_4._id_6680._id_65C7;
    var_6._id_8691 = _id_1190( var_6._id_8691, 0.1, 0.1 );
    var_6._id_868C = _id_1190( var_6._id_868C, 0.1, 0.1 );
    var_4._id_6681[var_3] = var_6;
    var_4._id_6E00 = var_6;
}

_id_1193( var_0, var_1 )
{
    return var_1 * ( 1 - var_0 ) / var_0;
}

_id_1191( var_0, var_1 )
{
    return var_1 / ( var_0 + var_1 );
}

_id_1190( var_0, var_1, var_2 )
{
    var_3 = _id_1193( var_0, var_1 );
    var_4 = _id_1191( var_3, var_2 );
    return var_4;
}

_id_11A6( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
    {
        _id_118B( var_4, var_1, var_2 );
        _id_119B();
    }
}

_id_1183( var_0, var_1, var_2 )
{
    if ( isstring( var_1 ) )
        var_2 = soundscripts\_audio::_id_0F30( var_1, var_2 );

    var_3 = _id_11D4( var_2 );
    var_4 = var_1;

    if ( !isstring( var_4 ) )
        var_4 = "???";

    var_5 = spawnstruct();
    var_5._id_0D5D = var_1;
    var_5._id_65C7 = var_0;
    var_3._id_3337[var_2] = var_5;
}

_id_119B()
{
    var_0 = _id_11D5( "UNKNOWN param_map being terminated by AVM_end_param_map()" );

    if ( isdefined( var_0 ) )
        var_0._id_6E00 = undefined;
}

_id_1198()
{
    self._id_586A._id_5878 = undefined;
}

_id_1197()
{

}

_id_1189( var_0 )
{
    var_1 = _id_11B1();
    self._id_6497 = spawnstruct();
    self._id_6497._id_64A2 = [];
    self._id_6497._id_279C = spawnstruct();
    self._id_6497._id_279C._id_35F5 = soundscripts\_audio::_id_0F30( var_1._id_276A, var_0 );
}

_id_118A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_11B1();
    var_1 = soundscripts\_audio::_id_0F30( undefined, var_1 );
    var_2 = soundscripts\_audio::_id_0F30( self._id_6497._id_279C._id_35F5, var_2 );
    var_3 = soundscripts\_audio::_id_0F30( 1, var_3 );
    var_4 = soundscripts\_audio::_id_0F30( var_0, var_4 );
    var_5 = soundscripts\_audio::_id_0F30( var_6._id_2768, var_5 );
    var_7 = var_4;

    if ( isstring( var_4 ) )
        var_7 = [ var_4 ];

    var_11 = spawnstruct();
    var_11.nearz = var_0;
    var_11._id_0D5E = var_7;
    var_11._id_0D5F = var_5;
    var_11._id_2FB4 = var_1;
    var_11._id_35F5 = var_2;
    var_11._id_649C = var_3;
    var_11._id_6681 = [];
    var_11._id_86D9 = [];
    var_11 _id_11D6();
    self._id_6497._id_64A2[var_11.nearz] = var_11;
    self._id_6497._id_649D = var_11;
}

_id_11DF( var_0 )
{
    var_1 = self._id_6497._id_649D;
    var_1._id_649E = var_0;
}

_id_119A()
{
    self._id_6497._id_649D = undefined;
}

_id_1199()
{

}

_id_1185( var_0, var_1 )
{
    self._id_13A3 = spawnstruct();
    self._id_13A3._id_13A6 = [];
    self._id_13A3._id_279C = spawnstruct();
    self._id_13A3._id_279C._id_8691 = var_0;
    self._id_13A3._id_279C._id_868C = var_1;
}

_id_1186( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_11B1();
    var_6 = spawnstruct();
    var_6._id_64A2 = [];
    var_6._id_588F = [];
    var_6._id_6F21 = _id_11C5();
    var_6._id_6681 = [];
    var_6.nearz = var_0;
    var_6._id_20E0 = var_1;
    var_3 = soundscripts\_audio::_id_0F30( self._id_13A3._id_279C._id_8691, var_3 );
    var_4 = soundscripts\_audio::_id_0F30( self._id_13A3._id_279C._id_868C, var_4 );
    var_6 _id_11D6( var_3, var_4 );
    self._id_13A3._id_13A6[var_6.nearz] = var_6;
    self._id_13A3._id_13A5 = var_6;

    if ( isarray( var_2 ) )
        _id_11A6( var_2, self._id_13A3._id_279C._id_8691, self._id_13A3._id_279C._id_868C );
}

_id_117F( var_0 )
{
    self._id_13A3._id_13A5._id_4D60 = var_0;
}

_id_117E( var_0 )
{
    self._id_13A3._id_13A5._id_4C0E = var_0;
}

_id_1182( var_0 )
{
    if ( isstring( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_2 in var_0 )
    {
        var_3 = self._id_13A3._id_13A5;
        var_3._id_64A2[var_2] = var_2;
    }
}

_id_1180( var_0 )
{
    var_1 = self._id_13A3._id_13A5;

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

_id_1196()
{
    self._id_13A3._id_13A5 = undefined;
}

_id_1195()
{

}

_id_118D( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_0 *= 1000;

    var_2 = _id_11B1();
    self._id_8D59 = spawnstruct();
    self._id_8D59._id_8D5B = [];
    self._id_8D59._id_279C = spawnstruct();
    self._id_8D59._id_279C._id_6FBE = soundscripts\_audio::_id_0F30( var_2._id_2772, var_1 );
    self._id_8D59._id_279C._id_5C34 = soundscripts\_audio::_id_0F30( var_2._id_2777, var_0 );
}

_id_118F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
        var_4 *= 1000;

    var_5 = spawnstruct();
    var_5.nearz = var_0;
    var_5._id_4DD3 = [ var_1, var_2 ];
    var_5._id_6FBE = soundscripts\_audio::_id_0F30( self._id_8D59._id_279C._id_6FBE, var_3 );
    var_5._id_5C34 = soundscripts\_audio::_id_0F30( self._id_8D59._id_279C._id_5C34, var_4 );
    var_5._id_8D67 = [];
    self._id_8D59._id_8D5B[var_0] = var_5;
    self._id_8D59._id_4437 = var_5;
}

_id_118E( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_1 *= 1000;

    var_3 = self._id_8D59._id_4437;
    var_4 = var_3.nearz;
    var_5 = spawnstruct();
    var_5.nearz = var_0;
    var_5._id_9719 = [];
    var_5._id_6FBE = soundscripts\_audio::_id_0F30( var_3._id_6FBE, var_2 );
    var_5._id_5C34 = soundscripts\_audio::_id_0F30( var_3._id_5C34, var_1 );
    var_5._id_6F21 = _id_11C5();
    var_3._id_8D67[var_0] = var_5;
    self._id_8D59._id_4437._id_8D64 = var_5;
}

_id_1184( var_0, var_1 )
{
    var_3 = self._id_8D59._id_4437._id_8D64;
    var_3._id_9719[var_3._id_9719.size] = [ var_0, var_1 ];
}

_id_119E()
{
    self._id_8D59._id_4437._id_8D64 = undefined;
}

_id_119F()
{
    self._id_8D59._id_4437 = undefined;
}

_id_119D()
{

}

_id_117D( var_0, var_1 )
{
    if ( isstring( var_0 ) )
        var_0 = tolower( var_0 );

    var_4 = _id_11B1();

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

_id_119C()
{
    var_0 = _id_11B1();
    self._id_2156 = [];

    foreach ( var_8, var_2 in self._id_586A._id_588F )
    {
        var_3 = var_8;
        var_4 = var_2;

        foreach ( var_7, var_6 in var_4._id_6681 )
            self._id_2156[var_7] = _id_11B5( var_7 );
    }

    foreach ( var_8, var_2 in self._id_6497._id_64A2 )
    {
        var_10 = var_8;
        var_11 = var_2;

        foreach ( var_7, var_6 in var_11._id_6681 )
            self._id_2156[var_7] = _id_11B5( var_7 );
    }

    foreach ( var_8, var_2 in self._id_13A3._id_13A6 )
    {
        var_14 = var_8;
        var_15 = var_2;

        foreach ( var_7, var_6 in var_15._id_6681 )
            self._id_2156[var_7] = _id_11B5( var_7 );
    }

    var_0._id_9D66 = undefined;
}

_id_11C1()
{
    return self._id_59D9;
}

_id_9ED9()
{
    return self._id_86FE;
}

_id_9ED7()
{
    return _id_11BB();
}

_id_11A4( var_0, var_1 )
{
    thread _id_11DB( var_0, var_1 );
}

_id_11DB( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 _id_11BB();
    var_4 = var_2 _id_11CA();
    var_0 = clamp( var_0, 0, 1 );
    var_1 = clamp( soundscripts\_audio::_id_0F30( 1, var_1 ), 0, 60 );
    var_5 = var_3;
    var_2 notify( var_5 );
    var_2 endon( var_5 );
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_2 _id_11BB() );
    var_4 endon( "death" );
    var_6 = _id_11A1();
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

_id_11A0( var_0 )
{
    return _id_11B1()._id_76DD;
}

_id_11A1()
{
    return 0.1;
}

_id_9ED8( var_0 )
{
    var_1 = 0;
    var_2 = _id_11B1();

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

_id_11AE( var_0 )
{
    var_1 = _id_11B1();
    var_2 = var_1._id_6F20[var_0];
    var_3 = spawnstruct();
    var_3._id_4227 = spawnstruct();
    var_3._id_9C0F = spawnstruct();
    var_3._id_4777 = spawnstruct();
    var_3._id_4E88 = [];
    var_3._id_4777._id_6F21 = soundscripts\_audio::_id_0F30( undefined, var_0 );
    var_3._id_4777._id_35F0 = var_1._id_2769;
    var_3._id_4777._id_35F5 = var_1._id_276A;
    var_3._id_4777._id_88A1 = var_1._id_2776;
    var_3 [[ var_2 ]]();
    var_3 _id_11A9();
    return var_3;
}

_id_11A9()
{
    var_0 = _id_11B1();
    var_0._id_6F22[self._id_4777._id_6F21] = self;
}

_id_9EDE()
{
    var_0 = _id_11B1();
    var_0._id_6F22[self._id_4777._id_6F21] = undefined;
}

_id_11A7()
{
    var_0 = _id_11B1();
    var_0._id_6F22[self._id_6F21]._id_4E88[self._id_4E87] = self;
    var_0._id_76DD++;
}

_id_11D7()
{
    var_0 = _id_11B1();
    var_0._id_6F22[self._id_6F21]._id_4E88[self._id_4E87] = undefined;
}

_id_11B0( var_0 )
{
    var_1 = self._id_4777._id_6F21 + "_" + _id_11A0();

    if ( isdefined( var_0 ) && var_0 == 1 )
        var_1 += "_player";

    return var_1;
}

_id_11A3( var_0, var_1, var_2 )
{
    _id_11B1()._id_1A04[var_0] = [ var_1, var_2 ];
}

_id_11C0( var_0 )
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

_id_11B2( var_0 )
{
    var_1 = self;
    return var_1._id_13A4[var_0];
}

_id_11C9( var_0 )
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

_id_11B3( var_0 )
{
    var_1 = self;
    return var_1._id_13A3._id_13A6[var_0];
}

_id_11AC( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self;
    var_6 = spawnstruct();
    var_6._id_9C0F = spawnstruct();
    var_6._id_6F21 = var_5 _id_11C5();
    var_6._id_4E87 = var_5 _id_11B0( var_4 );
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
        var_9._id_24CF = var_6 _id_11AD( var_8 );
        var_9._id_86D9 = [];
        var_9._id_9F3C = 1.0;
        var_6._id_5876[var_8.nearz] = var_9;
    }

    var_6._id_649A = [];

    foreach ( var_8 in var_5._id_6497._id_64A2 )
    {
        var_9 = spawnstruct();
        var_9._id_704A = var_8;
        var_9._id_24CF = var_6 _id_11AD( var_8 );
        var_9._id_86D9 = [];
        var_6._id_649A[var_8.nearz] = var_9;
    }

    var_6._id_13A4 = [];

    foreach ( var_8 in var_5._id_13A3._id_13A6 )
    {
        var_9 = spawnstruct();
        var_9._id_704A = var_8;
        var_9._id_24CF = var_6 _id_11AD( var_8 );
        var_6._id_13A4[var_8.nearz] = var_9;
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

_id_11E1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self;

    if ( var_6 _id_11CD() == 0 )
        var_6 vehicle_turnengineoff();

    var_7 = _id_11C4( var_0 );

    if ( !isdefined( var_7 ) )
        var_7 = _id_11AE( var_0 );

    var_8 = var_7 _id_11AC( var_6, var_2, var_3, var_4, var_1 );
    var_8 _id_11A7();
    var_8 thread _id_11EF();
    var_8 thread _id_11CE( var_5 );
    var_6 thread _id_11D1( var_8 );
    return var_8;
}

_id_11EA( var_0 )
{
    if ( !isdefined( self._id_5085 ) )
    {
        self._id_5085 = 1;
        var_1 = self;
        var_2 = var_1 _id_11BC();
        var_3 = var_1 _id_11BB();
        var_0 = max( 0.01, soundscripts\_audio::_id_0F30( var_1._id_35F5, var_0 ) );
        level notify( "msg_snd_vehicle_stop_" + var_3 );

        foreach ( var_5 in var_1._id_5876 )
        {
            var_6 = soundscripts\_audio::_id_0F30( var_5._id_704A._id_35F5, var_0 );
            var_5 thread _id_11AF( var_6 );
        }

        foreach ( var_9 in var_1._id_649A )
        {
            var_6 = soundscripts\_audio::_id_0F30( var_9._id_704A._id_35F5, var_0 );
            var_9 thread _id_11AF( var_6 );
        }

        wait(var_0 + 0.05);
        var_1 _id_11D7();
    }
}

_id_11D1( var_0 )
{
    var_1 = var_0 _id_11BB();
    level endon( "msg_snd_vehicle_stop_" + var_1 );
    self waittill( "death" );
    var_0 thread _id_11EA();
}

_id_11AD( var_0 )
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

_id_11B6()
{
    return self._id_24CF._id_8695;
}

_id_11BE()
{
    return self._id_24CF._id_67F7;
}

_id_11BF()
{
    var_0 = _id_11BE();
    var_1 = var_0["volume"];

    if ( !isdefined( var_1 ) )
        var_1 = 1.0;

    return var_1;
}

_id_11EF()
{
    var_0 = self;
    var_1 = _id_11BC();
    var_2 = _id_11CA();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + _id_11BB() );
    var_2 endon( "death" );
    var_3 = undefined;

    for (;;)
    {
        var_0 _id_11EE();

        foreach ( var_5 in var_0._id_5876 )
        {
            if ( var_5._id_697F == 1 )
            {
                var_6 = var_5._id_704A.nearz;
                var_0 _id_11D0( var_5, var_3 );
                var_0 _id_11ED( var_5 );
            }
        }

        var_3 = gettime();
        var_8 = distance2d( var_0._id_9C78.origin, level.playercardbackground.origin );

        if ( var_8 < 400 )
            var_9 = 1.0;
        else if ( var_8 > 1500 )
            var_9 = 10.0;
        else
            var_9 = 1.0 + 9.0 * ( var_8 - 400 ) / 1100;

        wait(0.1 * var_9);
    }
}

_id_11DC( var_0, var_1 )
{
    var_2 = self;

    switch ( var_0._id_704A._id_0D5F )
    {
        case "alias":
            if ( var_1 == 1 && var_0._id_697F != 1 )
            {
                var_2 _id_11E2( var_0 );
                var_0._id_697F = 1;
            }
            else if ( var_1 == 0 && var_0._id_697F != 0 )
            {
                var_2 _id_11EB( var_0 );
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

_id_11D0( var_0, var_1 )
{
    if ( var_0._id_704A._id_6681.size == 0 )
        return;

    var_2 = self;
    var_3 = _id_11BC();
    var_4 = var_0._id_704A;
    var_5 = var_0._id_24CF;
    var_6 = gettime();
    var_1 = soundscripts\_audio::_id_0F30( var_6 - 100, var_1 );
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

_id_11EE()
{
    self._id_586B = 1.0;

    foreach ( var_1 in self._id_6498 )
        self._id_586B *= var_1;
}

_id_11ED( var_0 )
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
            var_5 _id_11F1( var_7, var_3 );
    }
}

_id_11A5( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = var_3._id_5876[var_0];
    var_5 = 1.0;

    if ( var_1 == 1 )
        var_5 = 0;

    var_2 = soundscripts\_audio::_id_0F30( 0.05, var_2 );
    var_6 = var_5 - var_4._id_9F3C;
    var_7 = max( 1, var_2 / _id_11A1() );
    var_8 = var_6 / var_7;
    var_3 thread _id_11DD( var_4, var_5, var_8, _id_11A1() );
}

_id_11DD( var_0, var_1, var_2, var_3 )
{
    var_4 = self;
    var_5 = var_4 _id_11CA();
    var_6 = var_0._id_704A.nearz;
    var_4 notify( var_6 );
    var_4 endon( var_6 );
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_4 _id_11BB() );
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

_id_11CE( var_0 )
{
    var_1 = self;
    var_2 = _id_11BC();

    foreach ( var_10, var_4 in var_2._id_8D59._id_8D5B )
    {
        var_5 = var_4._id_4DD3;

        if ( isarray( var_0 ) )
            var_5 = var_0[var_10];

        var_6 = var_5[0];
        var_7 = var_5[1];
        var_8 = var_1._id_8D5A[var_10][var_6];
        var_9 = var_1._id_13A4[var_7];
        var_1 _id_11D0( var_9 );
        var_1 thread _id_11E5( var_8, var_9, 1 );
    }
}

_id_11E5( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = var_3 _id_11BC();
    var_5 = var_0._id_704A;
    var_6 = var_3 _id_11CA();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + _id_11BB() );
    var_6 endon( "death" );
    var_0._id_8CC5 = gettime();
    var_3 _id_11E6( var_0, var_1 );
    var_3 _id_11E8( var_0, var_1 );
    var_3 _id_11E7( var_0, var_1 );

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
            var_3 _id_11D0( var_1 );
            var_3 [[ var_1._id_704A._id_4C0E ]]( var_1._id_24CF._id_8695, var_3._id_9C0F );
        }

        foreach ( var_14 in var_5._id_9719 )
        {
            var_15 = var_14[0];
            var_16 = var_14[1];
            var_17 = var_14[2];
            var_18 = var_3 _id_11C0( var_15 );
            var_19 = var_3 _id_11B2( var_16 );
            var_20 = var_18._id_704A;
            var_21 = var_19._id_704A;

            if ( gettime() - var_18._id_8CC5 < var_20._id_5C34 )
                continue;

            var_3 _id_11D0( var_19, var_11 );
            var_22 = var_3 _id_11E4( var_18, var_19 );

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
        var_24 = distance2d( var_3._id_9C78.origin, level.playercardbackground.origin );

        if ( var_24 < 400 )
            var_25 = 1.0;
        else if ( var_24 > 1500 )
            var_25 = 10.0;
        else
            var_25 = 1.0 + 9.0 * ( var_24 - 400 ) / 1100;

        wait(0.1 * var_25);
    }

    var_3 _id_11D9( var_8, var_9 );
    var_26 = var_3 _id_11B4( var_8 );
    var_27 = var_26.size > 0;
    var_3 thread _id_11E9( var_1, var_27 );

    if ( var_12 && !var_2 )
    {

    }

    var_3 thread _id_11E5( var_7, var_8, 0 );
}

_id_11E6( var_0, var_1 )
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

_id_11E9( var_0, var_1 )
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
                var_11 thread _id_11EC( var_9 );
        }
    }
}

_id_9EDB( var_0 )
{
    var_1 = self;
    var_0 = max( 0.01, soundscripts\_audio::_id_0F30( 0.05, var_0 ) );

    switch ( var_1._id_704A._id_0D5F )
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

_id_11E4( var_0, var_1 )
{
    var_2 = 0;
    var_3 = self;
    var_2 = var_3 [[ var_1._id_704A._id_20E0 ]]( var_1._id_24CF._id_8695, var_3._id_9C0F );
    return var_2;
}

_id_11E8( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 _id_11BC();
    var_4 = var_0._id_704A;
    var_5 = var_1._id_704A;
    var_6 = var_1._id_649B;

    if ( !isdefined( var_6 ) )
        var_6 = var_5._id_64A2;

    foreach ( var_8 in var_6 )
    {
        var_9 = var_2._id_649A[var_8];
        var_10 = var_9._id_704A;
        var_11 = var_2 _id_11C2( var_8 );
        var_12 = var_2 _id_11C3( var_8 );

        if ( var_10._id_0D5F == "alias" )
        {
            var_2 _id_11D0( var_9 );

            for ( var_13 = 0; var_13 < var_10._id_0D5E.size; var_13++ )
            {
                var_14 = var_2 _id_11E3( var_9, var_13 );

                foreach ( var_17, var_16 in var_9._id_24CF._id_67F7 )
                    var_14 _id_11F1( var_17, var_16 );

                if ( var_12 )
                    var_2 thread _id_11AB( var_9, var_14 );

                if ( var_11 == 1 || var_11 == 2 )
                    var_9._id_86D9[var_13] = var_14;
            }

            var_2 thread _id_11CB( var_9 );
        }
    }
}

_id_11AB( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 _id_11CA();
    var_4 = _id_11A1();
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_2 _id_11BB() );
    var_3 endon( "death" );
    wait(var_4);

    while ( isdefined( var_1 ) )
    {
        var_2 _id_11D0( var_0 );

        if ( isdefined( var_1 ) )
        {
            foreach ( var_7, var_6 in var_0._id_24CF._id_67F7 )
                var_1 _id_11F1( var_7, var_6 );
        }

        wait(var_4);
    }
}

_id_11E7( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 _id_11BC();
    var_4 = var_0._id_704A;
    var_5 = var_1._id_704A;
    var_6 = var_5._id_588F;

    if ( isdefined( var_6[0] ) )
    {
        if ( var_6[0] == "all" )
        {
            foreach ( var_9, var_8 in var_2._id_5876 )
                _id_11DC( var_8, 1 );
        }
        else if ( var_6[0] == "none" )
        {
            foreach ( var_9, var_8 in var_2._id_5876 )
                _id_11DC( var_8, 0 );
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
            _id_11DC( var_8, 1 );

        foreach ( var_9, var_8 in var_12 )
            _id_11DC( var_8, 0 );
    }
}

_id_4E48()
{
    var_0 = _id_11CA();
    return distance2d( var_0.origin, level.playercardbackground.origin );
}

_id_4E47()
{
    var_0 = _id_11CA();
    return distance( var_0.origin, level.playercardbackground.origin );
}

_id_4E57()
{
    var_0 = _id_11CA();
    return var_0 vehicle_getthrottle();
}

_id_4E55()
{
    var_0 = _id_11CA();
    var_1 = length( var_0 vehicle_getvelocity() * 0.0568182 );
    return var_1;
}

_id_4E54()
{
    var_0 = _id_11CA();
    var_1 = var_0 vehicle_getvelocity();
    var_2 = level.playercardbackground getvelocity();
    var_3 = var_1 - var_2;
    var_4 = length( var_3 ) * 0.0568182;
    return var_4;
}

_id_4E56()
{
    var_0 = _id_11CA();

    if ( isdefined( var_0._id_3653 ) )
        return var_0._id_3653;

    return var_0 maps\_shg_utility::_id_3D3D() * 0.0568182;
}

_id_4E45()
{
    var_0 = _id_11CA();
    return length( var_0 maps\_shg_utility::_id_3D3B() ) * 0.00125;
}

_id_4E4C()
{
    var_0 = _id_11CA();
    return length( var_0 maps\_shg_utility::_id_3D3C() ) * 0.00125;
}

_id_4E49()
{
    var_0 = _id_11CA();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.playercardbackground.origin, level.playercardbackground getvelocity() );
}

_id_4E4A()
{
    var_0 = _id_11CA();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.playercardbackground.origin, level.playercardbackground getvelocity(), 2, 5 );
}

_id_4E4B()
{
    var_0 = _id_11CA();
    return dopplerpitch( var_0.origin, var_0 vehicle_getvelocity(), level.playercardbackground.origin, level.playercardbackground getvelocity(), 1, 0.5 );
}

_id_1192( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
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
    var_0 = _id_11CA();
    var_1 = var_0.angles[0];
    return var_1;
}

_id_4E58()
{
    var_0 = _id_11CA();
    var_1 = var_0.angles[1];
    return var_1;
}

_id_4E52()
{
    var_0 = _id_11CA();
    return max( abs( angleclamp180( var_0.angles[0] ) ), abs( angleclamp180( var_0.angles[2] ) ) );
}

_id_4E46()
{
    var_0 = _id_11CA();
    return acos( anglestoup( var_0.angles )[2] );
}

_id_4E4F()
{
    var_0 = _id_11CA();
    return var_0 _meth_844c();
}

_id_4E4E()
{
    var_0 = _id_11CA();
    return var_0 _meth_844d();
}

_id_4E4D()
{
    var_0 = _id_11CA();
    return var_0 _meth_844e();
}

_id_4E50()
{
    var_0 = _id_11CA();
    return var_0 _meth_844f();
}

_id_4E53()
{
    var_0 = 0;
    var_1 = _id_11CA();
    var_2 = 0.1;

    if ( _id_11CC() )
    {
        if ( !isdefined( var_1._id_0B91 ) )
            var_1._id_0B91 = 0;

        var_3 = gettime();

        if ( var_3 > var_1._id_0B91 + var_2 )
        {
            var_1._id_0B91 = var_3;
            var_4 = bullettrace( var_1.origin, var_1.origin - ( 0, 0, 360 ), 0 );
            var_1._id_0B92 = var_4["fraction"];

            if ( !isdefined( var_1._id_0B92 ) )
                var_1._id_0B92 = 0;
        }

        var_0 = clamp( var_1._id_0B92, 0, 1.0 );
    }

    return var_0;
}

_id_4E69()
{
    var_0 = _id_11CA();
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
    var_0 = _id_11CA();
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
    var_0 = _id_11CA();
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
    var_0 = _id_11CA();
    return var_0 _meth_846f();
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
    var_0 = _id_11CA();
    return var_0 _meth_8472();
}

_id_4E77()
{
    var_0 = _id_11CA();
    var_1 = var_0._id_9940 _meth_8475();
    var_1 = abs( var_1 );
    var_1 = clamp( var_1, 0, 90 );
    var_1 = _id_11D3( var_1, 0, 90 );
    var_2 = level.playercardbackground getnormalizedcameramovement();
    var_3 = abs( var_2[0] );
    return 0;
}

_id_4E78()
{
    var_0 = _id_11CA();
    var_1 = var_0._id_9940 _meth_8474();
    var_1 = abs( var_1 );
    var_2 = var_0._id_9940 _meth_8475();
    var_2 = abs( var_2 );
    var_3 = length2d( ( var_1, var_2, 0 ) );
    var_3 = clamp( var_3, 0, 135 );
    var_4 = _id_11D3( var_3, 0, 135 );
    var_5 = level.playercardbackground getnormalizedcameramovement();
    var_6 = length2d( var_5 );
    return var_4 * var_6;
}

_id_4E66()
{
    var_0 = _id_11CA();

    if ( isdefined( level._id_0E57._id_2B91 ) && level._id_0E57._id_2B91 == 1 )
    {
        level._id_0E57._id_2B93 *= 0.94;
        return level._id_0E57._id_2B93;
    }
    else
    {
        var_1 = var_0 _meth_8512();

        if ( var_1 != 0 )
            level._id_0E57._id_2B93 = var_1;

        return var_1;
    }
}

_id_4E64()
{
    var_0 = _id_11CA();
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
    var_0 = level.playercardbackground getnormalizedcameramovement();
    var_1 = abs( var_0[0] );
    var_2 = abs( var_0[1] );

    if ( var_1 > var_2 )
        return var_1;
    else
        return var_2;
}

_id_11E3( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_0._id_704A;
    var_4 = undefined;
    var_5 = var_2 _id_11C6( var_3, var_1 );

    if ( isstring( var_5 ) )
    {
        var_6 = var_2 _id_11CA();
        var_4 = spawn( "script_origin", var_6.origin );
        var_4 linkto( var_6, "tag_origin", var_2._id_88A1, ( 0, 0, 0 ) );
        var_4 scalevolume( 0 );
        var_4 soundscripts\_snd_playsound::_id_872A( var_5, "sound_done" );
        var_4 thread _id_11D2( "sound_done" );
    }

    return var_4;
}

_id_11D2( var_0 )
{
    self endon( "death" );
    self waittill( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_11CC()
{
    return isdefined( self._id_6BA1 ) && self._id_6BA1;
}

_id_11C6( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_0._id_0D5E[soundscripts\_audio::_id_0F30( 0, var_1 )];

    if ( isdefined( var_3 ) && var_2 _id_11CC() )
        var_3 += "_plr";

    return var_3;
}

_id_11C7( var_0 )
{
    return var_0._id_0D5E.size;
}

_id_11F1( var_0, var_1 )
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

_id_11CB( var_0 )
{
    var_1 = self;
    var_2 = var_0._id_704A;
    var_1 _id_11A8( var_2.nearz );
    var_1 _id_11F0( var_0 );
    var_1 _id_11D8( var_2.nearz );
}

_id_11F0( var_0 )
{
    var_1 = self;
    var_2 = var_1 _id_11BC();
    var_3 = var_0._id_704A;
    level endon( "msg_snd_vehicle_stop" );
    level endon( "msg_snd_vehicle_stop_" + var_1 _id_11BB() );
    var_1 _id_11CA() endon( "death" );

    if ( isdefined( var_3._id_2FB4 ) )
    {
        var_4 = var_2 _id_11B7( var_3._id_2FB4 );
        var_5 = soundscripts\_audio::_id_0F2E( var_4 );
        var_6 = 0;
        var_7 = var_5[1];

        for ( var_8 = var_3.nearz; _id_11AA( var_0._id_86D9 ) && var_6 < var_7; var_6 += 0.1 )
        {
            var_9 = var_0 _id_11BF();
            var_10 = var_2 _id_11CF( var_6, var_3._id_2FB4 );
            var_10 = 1.0 - var_9 * ( 1.0 - var_10 );
            var_1 _id_11DE( var_8, var_10 );
            wait 0.1;
        }
    }
}

_id_11AA( var_0 )
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

_id_11A8( var_0 )
{
    self._id_6498[var_0] = 1.0;
}

_id_11D8( var_0 )
{
    self._id_6498[var_0] = undefined;
}

_id_11DE( var_0, var_1 )
{
    self._id_6498[var_0] = var_1;
}

_id_11D3( var_0, var_1, var_2 )
{
    return ( var_0 - var_1 ) / ( var_2 - var_1 );
}

_id_11B1()
{
    return level._id_055B._id_9EB3;
}

_id_11B5( var_0 )
{
    return _id_11B1()._id_1A04[var_0][0];
}

_id_11C5()
{
    return self._id_4777._id_6F21;
}

_id_11E0( var_0 )
{
    self._id_4777._id_6F21 = var_0;
}

_id_11DA( var_0 )
{
    self._id_4227._id_4E86 = var_0;
}

_id_11BB()
{
    return self._id_4E87;
}

_id_11BD()
{
    return self._id_6F21;
}

_id_11BC()
{
    return _id_11C4( self._id_6F21 );
}

_id_11C4( var_0 )
{
    var_1 = _id_11B1();
    return var_1._id_6F22[var_0];
}

_id_11BA( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = _id_11B1();

    if ( isstring( var_1 ) )
    {
        var_4 = _id_11C4( var_1 );

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

_id_11CA()
{
    return self._id_9C78;
}

_id_11C8()
{
    return self._id_86FE;
}

_id_11B8()
{
    return self._id_4777._id_35F0;
}

_id_11B9()
{
    return self._id_4777._id_35F5;
}

_id_11D9( var_0, var_1 )
{
    var_0._id_649B = var_1;
}

_id_11B4( var_0 )
{
    var_1 = self;
    var_2 = [];
    var_3 = var_0._id_704A;
    var_4 = _id_11C4( var_3._id_6F21 );
    var_5 = var_0._id_649B;

    if ( !isdefined( var_5 ) )
        var_5 = var_3._id_64A2;

    foreach ( var_7 in var_5 )
    {
        if ( var_1 _id_11C2( var_7 ) == 1 )
            var_2[var_7] = var_7;
    }

    return var_2;
}

_id_11C2( var_0 )
{
    var_1 = self;
    var_2 = var_1._id_649A[var_0]._id_704A;
    return var_2._id_649C;
}

_id_11C3( var_0 )
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

_id_11B7( var_0 )
{
    return self._id_3333[var_0];
}

_id_11CF( var_0, var_1 )
{
    var_2 = self;
    var_3 = var_2 _id_11B7( var_1 );

    if ( isdefined( var_3._id_3335 ) )
        var_4 = [[ var_3._id_3335 ]]( var_0 );
    else
        var_4 = piecewiselinearlookup( var_0, var_3._id_3332 );

    return var_4;
}

_id_11E2( var_0 )
{
    var_1 = self;
    var_2 = var_1 _id_11BC();
    var_3 = var_1 _id_11CA();
    var_4 = var_0._id_704A;
    var_5 = var_2 _id_11C7( var_4 );
    var_6 = var_1._id_88A1;
    var_7 = var_0._id_704A._id_35F5;
    var_8 = 1.0;
    var_0._id_35DE = 0.1 / var_7;
    var_0._id_35E0 = 0;

    for ( var_9 = 0; var_9 < var_5; var_9++ )
    {
        var_10 = var_1 _id_11C6( var_4, var_9 );
        var_11 = spawn( "script_origin", var_3.origin );
        var_11 linkto( var_3, "tag_origin", var_6, ( 0, 0, 0 ) );
        var_11 scalevolume( 0 );
        var_11 soundscripts\_snd_playsound::_id_873E( var_10 );
        var_0._id_86D9[var_10] = var_11;
    }
}

_id_11EB( var_0 )
{
    var_1 = self;
    var_2 = var_0._id_86D9;
    var_0._id_86D9 = [];

    foreach ( var_4 in var_2 )
        var_4 thread _id_11EC( var_0._id_704A._id_35F5 );
}

_id_11EC( var_0 )
{
    var_1 = self;
    var_0 = max( 0.05, soundscripts\_audio::_id_0F30( 0.05, var_0 ) );

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
        var_3 _id_11AF( var_0 );

    foreach ( var_6 in var_1._id_649A )
        var_6 _id_11AF( var_0 );
}

_id_11AF( var_0 )
{
    var_1 = self;

    switch ( var_1._id_704A._id_0D5F )
    {
        case "alias":
            foreach ( var_4, var_3 in var_1._id_86D9 )
            {
                var_3 _id_11EC( var_0 );
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
        switch ( var_2._id_704A._id_0D5F )
        {
            case "alias":
                var_2._id_86D9 thread _id_11EC( 0.05 );
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
            var_7 thread _id_11EC( 0.05 );

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

_id_11F2()
{
    var_0 = 0;

    if ( _id_11CD() == 0 )
        var_0 = self vehicle_getspeed();

    return var_0;
}
