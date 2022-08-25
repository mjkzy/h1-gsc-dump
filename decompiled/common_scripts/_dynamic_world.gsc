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

init()
{
    common_scripts\utility::array_thread( getentarray( "com_wall_fan_blade_rotate_slow", "targetname" ), ::_id_366A, "veryslow" );
    common_scripts\utility::array_thread( getentarray( "com_wall_fan_blade_rotate", "targetname" ), ::_id_366A, "slow" );
    common_scripts\utility::array_thread( getentarray( "com_wall_fan_blade_rotate_fast", "targetname" ), ::_id_366A, "fast" );
    var_0 = [];
    var_0["trigger_multiple_dyn_metal_detector"] = ::_id_5BBA;
    var_0["trigger_multiple_dyn_creaky_board"] = ::_id_2395;
    var_0["trigger_multiple_dyn_photo_copier"] = ::_id_67EF;
    var_0["trigger_multiple_dyn_copier_no_light"] = ::_id_67F3;
    var_0["trigger_radius_motion_light"] = ::_id_5EF1;
    var_0["trigger_radius_dyn_motion_dlight"] = ::_id_65B7;
    var_0["trigger_multiple_dog_bark"] = ::_id_2C91;
    var_0["trigger_radius_bird_startle"] = ::bird_startle;
    var_0["trigger_multiple_dyn_motion_light"] = ::_id_5EF1;
    var_0["trigger_multiple_dyn_door"] = ::_id_976F;
    _id_6B59();

    foreach ( var_4, var_2 in var_0 )
    {
        var_3 = getentarray( var_4, "classname" );
        common_scripts\utility::array_thread( var_3, ::_id_981C );
        common_scripts\utility::array_thread( var_3, var_2 );
    }

    common_scripts\utility::array_thread( getentarray( "vending_machine", "targetname" ), ::_id_9D84 );
    common_scripts\utility::array_thread( getentarray( "toggle", "targetname" ), ::_id_9BEA );
    common_scripts\utility::array_thread( getentarray( "sliding_door", "targetname" ), ::_id_8628 );
    level thread _id_64C8();
    var_5 = getent( "civilian_jet_origin", "targetname" );

    if ( isdefined( var_5 ) )
        var_5 thread _id_1DD1();

    thread _id_4EA4();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connecting", var_0 );
        var_0 thread _id_5F5F();
    }
}

_id_6B59()
{
    if ( common_scripts\utility::_id_51AE() )
    {
        foreach ( var_1 in level.players )
        {
            var_1._id_940F = [];
            var_1 thread _id_5F5F();
        }
    }
}

ai_init()
{
    self._id_940F = [];
    thread _id_5F5F();
}

_id_1DD1()
{
    level endon( "game_ended" );
    _id_5237();
    level waittill( "prematch_over" );

    for (;;)
    {
        thread _id_5242();
        self waittill( "start_flyby" );
        thread _id_5235();
        self waittill( "flyby_done" );
        _id_523C();
    }
}

_id_5237()
{
    self._id_523A = getentarray( self.target, "targetname" );
    self._id_5236 = getent( "civilian_jet_flyto", "targetname" );
    self._id_32D2 = getentarray( "engine_fx", "targetname" );
    self._id_389F = getentarray( "flash_fx", "targetname" );
    self._id_522E = loadfx( "fx/fire/jet_afterburner" );
    self._id_5232 = loadfx( "vfx/lights/aircraft_light_wingtip_red" );
    self._id_5231 = loadfx( "vfx/lights/aircraft_light_wingtip_green" );
    self._id_5230 = loadfx( "vfx/lights/aircraft_light_red_blink" );
    level._id_1E10 = undefined;
    var_0 = vectornormalize( self.origin - self._id_5236.origin ) * 20000;
    self._id_5236.origin -= var_0;
    self.origin += var_0;

    foreach ( var_2 in self._id_523A )
    {
        var_2.origin += var_0;
        var_2._id_63B1 = var_2.origin;
        var_2 hide();
    }

    foreach ( var_5 in self._id_32D2 )
        var_5.origin += var_0;

    foreach ( var_8 in self._id_389F )
        var_8.origin += var_0;

    var_10 = self.origin;
    var_11 = self._id_5236.origin;
    self._id_5234 = var_11 - var_10;
    var_12 = 2000;
    var_13 = abs( distance( var_10, var_11 ) );
    self._id_5233 = var_13 / var_12;
}

_id_523C()
{
    foreach ( var_1 in self._id_523A )
    {
        var_1.origin = var_1._id_63B1;
        var_1 hide();
    }
}

_id_5242()
{
    level endon( "game_ended" );
    var_0 = _id_412A();
    var_1 = max( 10, var_0 );
    var_1 = min( var_1, 100 );

    if ( getdvar( "jet_flyby_timer" ) != "" )
        level._id_1E11 = 5 + getdvarint( "jet_flyby_timer" );
    else
        level._id_1E11 = ( 0.25 + randomfloatrange( 0.3, 0.7 ) ) * 60 * var_1;

    wait(level._id_1E11);

    while ( isdefined( level.airstrikeinprogress ) || isdefined( level.ac130player ) || isdefined( level.chopper ) || isdefined( level._id_7328 ) )
        wait 0.05;

    self notify( "start_flyby" );
    level._id_1E10 = 1;
    self waittill( "flyby_done" );
    level._id_1E10 = undefined;
}

_id_412A()
{
    if ( common_scripts\utility::_id_51AE() )
        return 10.0;

    if ( isdefined( game["status"] ) && game["status"] == "overtime" )
        return 1.0;
    else
        return _id_415E( "timelimit" );
}

_id_415E( var_0 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( isdefined( level._id_662C ) && isdefined( level._id_662C[var_0] ) )
        return level._id_662C[var_0];

    return level._id_A214[var_0]._id_9C53;
}

_id_5235()
{
    foreach ( var_1 in self._id_523A )
        var_1 show();

    var_3 = [];
    var_4 = [];

    foreach ( var_6 in self._id_32D2 )
    {
        var_7 = spawn( "script_model", var_6.origin );
        var_7 setmodel( "tag_origin" );
        var_7.angles = var_6.angles;
        var_3[var_3.size] = var_7;
    }

    foreach ( var_10 in self._id_389F )
    {
        var_11 = spawn( "script_model", var_10.origin );
        var_11 setmodel( "tag_origin" );
        var_11.color = var_10.script_noteworthy;
        var_11.angles = var_10.angles;
        var_4[var_4.size] = var_11;
    }

    thread _id_523B( self._id_523A[0], level.mapcenter );
    wait 0.05;

    foreach ( var_7 in var_3 )
        playfxontag( self._id_522E, var_7, "tag_origin" );

    foreach ( var_11 in var_4 )
    {
        if ( isdefined( var_11.color ) && var_11.color == "blink" )
        {
            playfxontag( self._id_5230, var_11, "tag_origin" );
            continue;
        }

        if ( isdefined( var_11.color ) && var_11.color == "red" )
        {
            playfxontag( self._id_5232, var_11, "tag_origin" );
            continue;
        }

        playfxontag( self._id_5231, var_11, "tag_origin" );
    }

    foreach ( var_1 in self._id_523A )
        var_1 moveto( var_1.origin + self._id_5234, self._id_5233 );

    foreach ( var_7 in var_3 )
        var_7 moveto( var_7.origin + self._id_5234, self._id_5233 );

    foreach ( var_11 in var_4 )
        var_11 moveto( var_11.origin + self._id_5234, self._id_5233 );

    wait(self._id_5233 + 1);

    foreach ( var_7 in var_3 )
        var_7 delete();

    foreach ( var_11 in var_4 )
        var_11 delete();

    self notify( "flyby_done" );
}

_id_523B( var_0, var_1 )
{
    var_0 thread _id_6DD9( "veh_mig29_dist_loop" );

    while ( !_id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 thread _id_6DD9( "veh_mig29_close_loop" );

    while ( _id_91D2( var_0, var_1 ) )
        wait 0.05;

    wait 0.5;
    var_0 thread _id_6DD8( "veh_mig29_sonic_boom" );

    while ( _id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_close_loop" );
    self waittill( "flyby_done" );
    var_0 notify( "stop soundveh_mig29_dist_loop" );
}

_id_6DD8( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 1.0 ) );
    var_3 hide();

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_3.origin = var_1;

    if ( isdefined( var_2 ) && var_2 )
        var_3 playsoundasmaster( var_0 );
    else
        var_3 playsound( var_0 );

    wait 10.0;
    var_3 delete();
}

_id_6DD9( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2 hide();
    var_2 endon( "death" );
    thread common_scripts\utility::_id_2825( var_2 );

    if ( isdefined( var_1 ) )
    {
        var_2.origin = self.origin + var_1;
        var_2.angles = self.angles;
        var_2 linkto( self );
    }
    else
    {
        var_2.origin = self.origin;
        var_2.angles = self.angles;
        var_2 linkto( self );
    }

    var_2 playloopsound( var_0 );
    self waittill( "stop sound" + var_0 );
    var_2 stoploopsound( var_0 );
    var_2 delete();
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) );
    var_3 = vectornormalize( common_scripts\utility::_id_38C9( var_1 ) - var_0.origin );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_91D1( var_0, var_1 )
{
    var_2 = _id_91D2( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = common_scripts\utility::_id_38C9( var_0.origin );
    var_5 = var_4 + anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) ) * ( var_3 * 100000 );
    var_6 = pointonsegmentnearesttopoint( var_4, var_5, var_1 );
    var_7 = distance( var_4, var_6 );

    if ( var_7 < 3000 )
        return 1;
    else
        return 0;
}

_id_9D84()
{
    level endon( "game_ended" );
    self endon( "death" );
    self setcursorhint( "HINT_ACTIVATE" );
    self._id_9EC7 = getent( self.target, "targetname" );
    var_0 = getent( self._id_9EC7.target, "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    self._id_9EC4 = var_2.origin;
    var_3 = getent( var_2.target, "targetname" );
    self._id_9EC5 = var_3.origin;

    if ( isdefined( var_3.target ) )
        self._id_9EBE = getent( var_3.target, "targetname" ).origin;

    self._id_9EC7 setcandamage( 1 );
    self._id_9EC8 = self._id_9EC7.model;
    self._id_9EBB = self._id_9EC7.script_noteworthy;
    self._id_9ECE = var_0.model;
    self._id_9ED0 = var_0.origin;
    self._id_9ECF = var_0.angles;
    self._id_9ED2 = var_1.origin;
    self._id_9ED1 = var_1.angles;
    precachemodel( self._id_9EBB );
    var_0 delete();
    var_1 delete();
    var_2 delete();
    var_3 delete();
    self._id_8859 = [];
    self._id_885C = 12;
    self._id_885D = undefined;
    self._id_4AA4 = 400;
    thread _id_9D85( self._id_9EC7 );
    self playloopsound( "vending_machine_hum" );

    for (;;)
    {
        self waittill( "trigger", var_4 );
        self playsound( "vending_machine_button_press" );

        if ( !self._id_885C )
            continue;

        if ( isdefined( self._id_885D ) )
            _id_885B();

        _id_885A( _id_8954() );
        wait 0.05;
    }
}

_id_9D85( var_0 )
{
    level endon( "game_ended" );
    var_1 = "mod_grenade mod_projectile mod_explosive mod_grenade_splash mod_projectile_splash splash";
    var_2 = loadfx( "fx/explosions/tv_explosion" );

    for (;;)
    {
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_0 waittill( "damage", var_3, var_4, var_5, var_6, var_7 );

        if ( isdefined( var_7 ) )
        {
            if ( issubstr( var_1, tolower( var_7 ) ) )
                var_3 *= 3;

            self._id_4AA4 -= var_3;

            if ( self._id_4AA4 > 0 )
                continue;

            self notify( "death" );
            self.origin += ( 0.0, 0.0, 10000.0 );

            if ( !isdefined( self._id_9EBE ) )
                var_8 = self._id_9EC7.origin + ( 37.0, -31.0, 52.0 );
            else
                var_8 = self._id_9EBE;

            playfx( var_2, var_8 );
            self._id_9EC7 setmodel( self._id_9EBB );

            while ( self._id_885C > 0 )
            {
                if ( isdefined( self._id_885D ) )
                    _id_885B();

                _id_885A( _id_8954() );
                wait 0.05;
            }

            self stoploopsound( "vending_machine_hum" );
            return;
        }
    }
}

_id_8954()
{
    var_0 = spawn( "script_model", self._id_9ED0 );
    var_0 setmodel( self._id_9ECE );
    var_0.origin = self._id_9ED0;
    var_0.angles = self._id_9ECF;
    return var_0;
}

_id_885A( var_0 )
{
    var_0 moveto( self._id_9ED2, 0.2 );
    var_0 playsound( "vending_machine_soda_drop" );
    wait 0.2;
    self._id_885D = var_0;
    self._id_885C--;
}

_id_885B()
{
    self endon( "death" );

    if ( isdefined( self._id_885D._id_3022 ) && self._id_885D._id_3022 == 1 )
        return;

    var_0 = 1;
    var_1 = var_0 * -999;
    var_2 = int( 40000 );
    var_3 = ( int( var_2 / 2 ), int( var_2 / 2 ), 0 ) - ( randomint( var_2 ), randomint( var_2 ), 0 );
    var_4 = vectornormalize( self._id_9EC5 - self._id_9EC4 + var_3 );
    var_5 = var_4 * randomfloatrange( var_1, var_0 );
    self._id_885D physicslaunch( self._id_9EC4, var_5 );
    self._id_885D._id_3022 = 1;
}

_id_3A27()
{
    level endon( "game_ended" );
    var_0 = "briefcase_bomb_mp";
    precacheitem( var_0 );

    for (;;)
    {
        self waittill( "trigger_enter", var_1 );

        if ( !var_1 hasweapon( var_0 ) )
        {
            var_1 playsound( "freefall_death" );
            var_1 giveweapon( var_0 );
            var_1 setweaponammostock( var_0, 0 );
            var_1 setweaponammoclip( var_0, 0 );
            var_1 switchtoweapon( var_0 );
        }
    }
}

_id_5BBA()
{
    level endon( "game_ended" );
    var_0 = getent( self.target, "targetname" );
    var_0 enablegrenadetouchdamage();
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    var_4 = getent( var_3.target, "targetname" );
    var_5 = [];
    var_6 = min( var_1.origin[0], var_2.origin[0] );
    var_5[0] = var_6;
    var_7 = max( var_1.origin[0], var_2.origin[0] );
    var_5[1] = var_7;
    var_8 = min( var_1.origin[1], var_2.origin[1] );
    var_5[2] = var_8;
    var_9 = max( var_1.origin[1], var_2.origin[1] );
    var_5[3] = var_9;
    var_10 = min( var_1.origin[2], var_2.origin[2] );
    var_5[4] = var_10;
    var_11 = max( var_1.origin[2], var_2.origin[2] );
    var_5[5] = var_11;
    var_1 delete();
    var_2 delete();

    if ( !common_scripts\utility::_id_51AE() )
        self.alarm_interval = 7;
    else
        self.alarm_interval = 2;

    self.alarm_playing = 0;
    self.alarm_annoyance = 0;
    self._id_93E0 = 0;
    thread _id_5BBB( var_0 );
    thread _id_5BBC();
    thread _id_5BBD( var_5, "weapon_claymore", "weapon_c4" );
    var_12 = ( var_3.origin[0], var_3.origin[1], var_11 );
    var_13 = ( var_4.origin[0], var_4.origin[1], var_11 );
    var_14 = loadfx( "fx/props/metal_detector_light" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "dmg_triggered", "touch_triggered", "weapon_triggered" );
        thread _id_6DD7( "alarm_metal_detector", var_14, var_12, var_13 );
    }
}

_id_6DD7( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );

    if ( !self.alarm_playing )
    {
        self.alarm_playing = 1;
        thread annoyance_tracker();

        if ( !self.alarm_annoyance )
            self playsound( var_0 );

        playfx( var_1, var_2 );
        playfx( var_1, var_3 );
        wait(self.alarm_interval);
        self.alarm_playing = 0;
    }
}

annoyance_tracker()
{
    level endon( "game_ended" );

    if ( !self._id_93E0 )
        return;

    var_0 = self.alarm_interval + 0.15;

    if ( self._id_93E0 )
        self._id_93E0--;
    else
        self.alarm_annoyance = 1;

    var_1 = gettime();
    var_2 = 7;

    if ( common_scripts\utility::_id_51AE() )
        var_2 = 2;

    _id_A06F( "dmg_triggered", "touch_triggered", "weapon_triggered", var_2 + 2 );
    var_3 = gettime() - var_1;

    if ( var_3 > var_2 * 1000 + 1150 )
    {
        self.alarm_annoyance = 0;
        self._id_93E0 = 0;
    }
}

_id_A06F( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    self endon( var_0 );
    self endon( var_1 );
    self endon( var_2 );
    wait(var_3);
}

_id_5BBD( var_0, var_1, var_2 )
{
    level endon( "game_ended" );

    for (;;)
    {
        _id_A0CA();
        var_3 = getentarray( "grenade", "classname" );

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5.model ) && ( var_5.model == var_1 || var_5.model == var_2 ) )
            {
                if ( _id_5121( var_5, var_0 ) )
                    thread _id_A2C8( var_5, var_0 );
            }
        }
    }
}

_id_A0CA()
{
    level endon( "game_ended" );
    self endon( "dmg_triggered" );
    self waittill( "touch_triggered" );
}

_id_A2C8( var_0, var_1 )
{
    var_0 endon( "death" );

    while ( _id_5121( var_0, var_1 ) )
    {
        self notify( "weapon_triggered" );
        wait(self.alarm_interval);
    }
}

_id_5121( var_0, var_1 )
{
    var_2 = var_1[0];
    var_3 = var_1[1];
    var_4 = var_1[2];
    var_5 = var_1[3];
    var_6 = var_1[4];
    var_7 = var_1[5];
    var_8 = var_0.origin[0];
    var_9 = var_0.origin[1];
    var_10 = var_0.origin[2];

    if ( _id_5122( var_8, var_2, var_3 ) )
    {
        if ( _id_5122( var_9, var_4, var_5 ) )
        {
            if ( _id_5122( var_10, var_6, var_7 ) )
                return 1;
        }
    }

    return 0;
}

_id_5122( var_0, var_1, var_2 )
{
    if ( var_0 > var_1 && var_0 < var_2 )
        return 1;

    return 0;
}

_id_5BBB( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_5 ) && alarm_validate_damage( var_5 ) )
            self notify( "dmg_triggered" );
    }
}

_id_5BBC()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( anythingtouchingtrigger( self ) )
        {
            self notify( "touch_triggered" );
            wait(self.alarm_interval);
        }
    }
}

alarm_validate_damage( var_0 )
{
    var_1 = "mod_melee melee mod_grenade mod_projectile mod_explosive mod_impact";
    var_2 = strtok( var_1, " " );

    foreach ( var_4 in var_2 )
    {
        if ( tolower( var_4 ) == tolower( var_0 ) )
            return 1;
    }

    return 0;
}

_id_2395()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger_enter", var_0 );
        var_0 thread _id_2BBA( self );
    }
}

_id_2BBA( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self playsound( "step_walk_plr_woodcreak_on" );

    for (;;)
    {
        self waittill( "trigger_leave", var_1 );

        if ( var_0 != var_1 )
            continue;

        self playsound( "step_walk_plr_woodcreak_off" );
        return;
    }
}

_id_5EF1()
{
    level endon( "game_ended" );
    self._id_5F95 = 1;
    self._id_575E = 0;
    var_0 = getentarray( self.target, "targetname" );
    common_scripts\utility::_id_6166( [ "com_two_light_fixture_off", "com_two_light_fixture_on" ], ::precachemodel );

    foreach ( var_2 in var_0 )
    {
        var_2._id_5743 = [];
        var_3 = getent( var_2.target, "targetname" );

        if ( !isdefined( var_3.target ) )
            continue;

        var_2._id_5743 = getentarray( var_3.target, "targetname" );
    }

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( anythingtouchingtrigger( self ) )
        {
            var_5 = 0;

            foreach ( var_7 in self._id_940D )
            {
                if ( isdefined( var_7._id_2B7F ) && var_7._id_2B7F > 5.0 )
                    var_5 = 1;
            }

            if ( var_5 )
            {
                if ( !self._id_575E )
                {
                    self._id_575E = 1;
                    var_0[0] playsound( "switch_auto_lights_on" );

                    foreach ( var_2 in var_0 )
                    {
                        var_2 setlightintensity( 1.0 );

                        if ( isdefined( var_2._id_5743 ) )
                        {
                            foreach ( var_11 in var_2._id_5743 )
                                var_11 setmodel( "com_two_light_fixture_on" );
                        }
                    }
                }

                thread _id_5EF2( var_0, 10.0 );
            }

            wait 0.05;
        }
    }
}

_id_5EF2( var_0, var_1 )
{
    self notify( "motion_light_timeout" );
    self endon( "motion_light_timeout" );
    wait(var_1);

    foreach ( var_3 in var_0 )
    {
        var_3 setlightintensity( 0 );

        if ( isdefined( var_3._id_5743 ) )
        {
            foreach ( var_5 in var_3._id_5743 )
                var_5 setmodel( "com_two_light_fixture_off" );
        }
    }

    var_0[0] playsound( "switch_auto_lights_off" );
    self._id_575E = 0;
}

_id_65B7()
{
    if ( !isdefined( level._id_65B9 ) )
        level._id_65B9 = loadfx( "vfx/lights/outdoor_motion_light" );

    level endon( "game_ended" );
    self._id_5F95 = 1;
    self._id_575E = 0;
    var_0 = getent( self.target, "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    common_scripts\utility::_id_6166( [ "com_two_light_fixture_off", "com_two_light_fixture_on" ], ::precachemodel );

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( anythingtouchingtrigger( self ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_940D )
            {
                if ( isdefined( var_4._id_2B7F ) && var_4._id_2B7F > 5.0 )
                    var_2 = 1;
            }

            if ( var_2 )
            {
                if ( !self._id_575E )
                {
                    self._id_575E = 1;
                    var_0 playsound( "switch_auto_lights_on" );
                    var_0 setmodel( "com_two_light_fixture_on" );

                    foreach ( var_7 in var_1 )
                    {
                        var_7._id_5716 = spawn( "script_model", var_7.origin );
                        var_7._id_5716 setmodel( "tag_origin" );
                        playfxontag( level._id_65B9, var_7._id_5716, "tag_origin" );
                    }
                }

                thread _id_65B8( var_0, var_1, 10.0 );
            }

            wait 0.05;
        }
    }
}

_id_65B8( var_0, var_1, var_2 )
{
    self notify( "motion_light_timeout" );
    self endon( "motion_light_timeout" );
    wait(var_2);

    foreach ( var_4 in var_1 )
        var_4._id_5716 delete();

    var_0 playsound( "switch_auto_lights_off" );
    var_0 setmodel( "com_two_light_fixture_off" );
    self._id_575E = 0;
}

_id_2C91()
{
    level endon( "game_ended" );
    self._id_5F95 = 1;
    var_0 = getent( self.target, "targetname" );

    for (;;)
    {
        self waittill( "trigger_enter", var_1 );

        while ( anythingtouchingtrigger( self ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_940D )
            {
                if ( isdefined( var_4._id_2B7F ) && var_4._id_2B7F > var_2 )
                    var_2 = var_4._id_2B7F;
            }

            if ( var_2 > 6.0 )
            {
                var_0 playsound( "dyn_anml_dog_bark" );
                wait(randomfloatrange( 16 / var_2, 16 / var_2 + randomfloat( 1.0 ) ));
                continue;
            }

            wait 0.05;
        }
    }
}

_id_976F()
{
    var_0 = getent( self.target, "targetname" );
    self._id_2D5E = var_0;
    self._id_2D5C = _id_4152( vectornormalize( self getorigin() - var_0 getorigin() ) );
    var_0.baseyaw = var_0.angles[1];
    var_1 = 1.0;

    for (;;)
    {
        self waittill( "trigger_enter", var_2 );
        var_0 thread _id_2D68( var_1, _id_3F6C( var_2 ) );

        if ( anythingtouchingtrigger( self ) )
            self waittill( "trigger_empty" );

        wait 3.0;

        if ( anythingtouchingtrigger( self ) )
            self waittill( "trigger_empty" );

        var_0 thread _id_2D5D( var_1 );
    }
}

_id_2D68( var_0, var_1 )
{
    if ( var_1 )
        self rotateto( ( 0, self.baseyaw + 90, 1 ), var_0, 0.1, 0.75 );
    else
        self rotateto( ( 0, self.baseyaw - 90, 1 ), var_0, 0.1, 0.75 );

    self playsound( "door_generic_house_open" );
    wait(var_0 + 0.05);
}

_id_2D5D( var_0 )
{
    self rotateto( ( 0, self.baseyaw, 1 ), var_0 );
    self playsound( "door_generic_house_close" );
    wait(var_0 + 0.05);
}

_id_3F6C( var_0 )
{
    return vectordot( self._id_2D5C, vectornormalize( var_0.origin - self._id_2D5E getorigin() ) ) > 0;
}

_id_4152( var_0 )
{
    return ( var_0[1], 0 - var_0[0], var_0[2] );
}

_id_9BEA()
{
    if ( self.classname != "trigger_use_touch" )
        return;

    var_0 = getentarray( self.target, "targetname" );
    self._id_575E = 1;

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( 1.5 * self._id_575E );

    for (;;)
    {
        self waittill( "trigger" );
        self._id_575E = !self._id_575E;

        if ( self._id_575E )
        {
            foreach ( var_2 in var_0 )
                var_2 setlightintensity( 1.5 );

            self playsound( "switch_auto_lights_on" );
            continue;
        }

        foreach ( var_2 in var_0 )
            var_2 setlightintensity( 0 );

        self playsound( "switch_auto_lights_off" );
    }
}

bird_startle()
{

}

_id_67F1( var_0 )
{
    self._id_21CE = _id_3E1D( var_0 );

    if ( isdefined( self._id_21CE ) )
    {
        var_1 = getent( self._id_21CE.target, "targetname" );

        if ( isdefined( var_1 ) )
        {
            var_2 = getent( var_1.target, "targetname" );

            if ( isdefined( var_2 ) )
            {
                var_2._id_4E9E = var_2 getlightintensity();
                var_2 setlightintensity( 0 );
                var_0._id_21D4 = var_1;
                var_0._id_8C41 = var_1.origin;
                var_0.light = var_2;
                var_3 = self._id_21CE.angles + ( 0.0, 90.0, 0.0 );
                var_4 = anglestoforward( var_3 );
                var_0._id_313E = var_0._id_8C41 + var_4 * 30;
            }
        }
    }
}

_id_3E1D( var_0 )
{
    if ( !isdefined( var_0.target ) )
    {
        var_1 = getentarray( "destructible_toy", "targetname" );
        var_2 = var_1[0];

        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4.destructible_type ) && var_4.destructible_type == "toy_copier" )
            {
                if ( distance( var_0.origin, var_2.origin ) > distance( var_0.origin, var_4.origin ) )
                    var_2 = var_4;
            }
        }
    }
    else
    {
        var_2 = getent( var_0.target, "targetname" );

        if ( isdefined( var_2 ) )
            var_2 setcandamage( 1 );
    }

    return var_2;
}

_id_A07A()
{
    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    self waittill( "trigger_enter" );
}

_id_67EF()
{
    level endon( "game_ended" );
    _id_67F1( self );

    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );
    thread _id_67F4();

    for (;;)
    {
        _id_A07A();
        self playsound( "mach_copier_run" );

        if ( isdefined( self._id_21D4 ) )
        {
            _id_7427( self );
            thread _id_67F0();
            thread _id_67F2();
        }

        wait 3;
    }
}

_id_67F3()
{
    level endon( "game_ended" );
    self endon( "death" );

    if ( common_scripts\utility::_id_3E94() == "hamburg" )
        return;

    self._id_21CE = _id_3E1D( self );

    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );

    for (;;)
    {
        _id_A07A();
        self playsound( "mach_copier_run" );
        wait 3;
    }
}

_id_7427( var_0 )
{
    var_0._id_21D4 moveto( var_0._id_8C41, 0.2 );
    var_0.light setlightintensity( 0 );
}

_id_67F0()
{
    self._id_21CE notify( "bar_goes" );
    self._id_21CE endon( "bar_goes" );
    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    var_0 = self._id_21D4;
    wait 2.0;
    var_0 moveto( self._id_313E, 1.6 );
    wait 1.8;
    var_0 moveto( self._id_8C41, 1.6 );
    wait 1.6;
    var_1 = self.light;
    var_2 = 0.2;
    var_3 = var_2 / 0.05;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_4 * 0.05;
        var_5 /= var_2;
        var_5 = 1 - var_5 * var_1._id_4E9E;

        if ( var_5 > 0 )
            var_1 setlightintensity( var_5 );

        wait 0.05;
    }
}

_id_67F2()
{
    self._id_21CE notify( "light_on" );
    self._id_21CE endon( "light_on" );
    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    var_0 = self.light;
    var_1 = 0.2;
    var_2 = var_1 / 0.05;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_3 * 0.05;
        var_4 /= var_1;
        var_0 setlightintensity( var_4 * var_0._id_4E9E );
        wait 0.05;
    }

    _id_67F5( var_0 );
}

_id_67F4()
{
    self._id_21CE waittill( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    _id_7427( self );
}

_id_67F5( var_0 )
{
    var_0 setlightintensity( 1 );
    wait 0.05;
    var_0 setlightintensity( 0 );
    wait 0.1;
    var_0 setlightintensity( 1 );
    wait 0.05;
    var_0 setlightintensity( 0 );
    wait 0.1;
    var_0 setlightintensity( 1 );
}

_id_366A( var_0 )
{
    var_1 = 0;
    var_2 = 20000;
    var_3 = 1.0;

    if ( isdefined( self.speed ) )
        var_3 = self.speed;

    if ( var_0 == "slow" )
    {
        if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "lockedspeed" )
            var_1 = 180;
        else
            var_1 = randomfloatrange( 100 * var_3, 360 * var_3 );
    }
    else if ( var_0 == "fast" )
        var_1 = randomfloatrange( 720 * var_3, 1000 * var_3 );
    else if ( var_0 == "veryslow" )
        var_1 = randomfloatrange( 1 * var_3, 2 * var_3 );
    else
    {

    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "lockedspeed" )
        wait 0;
    else
        wait(randomfloatrange( 0, 1 ));

    if ( !isdefined( self ) )
        return;

    var_4 = self.angles;
    var_5 = anglestoright( self.angles ) * 100;
    var_5 = vectornormalize( var_5 );

    for (;;)
    {
        var_6 = abs( vectordot( var_5, ( 1.0, 0.0, 0.0 ) ) );
        var_7 = abs( vectordot( var_5, ( 0.0, 1.0, 0.0 ) ) );
        var_8 = abs( vectordot( var_5, ( 0.0, 0.0, 1.0 ) ) );

        if ( var_6 > 0.9 )
            self rotatevelocity( ( var_1, 0, 0 ), var_2 );
        else if ( var_7 > 0.9 )
            self rotatevelocity( ( var_1, 0, 0 ), var_2 );
        else if ( var_8 > 0.9 )
            self rotatevelocity( ( 0, var_1, 0 ), var_2 );
        else
            self rotatevelocity( ( 0, var_1, 0 ), var_2 );

        wait(var_2);
    }
}

_id_981C( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self._id_331C = self getentitynumber();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !isplayer( var_2 ) && !isdefined( var_2._id_3797 ) )
            continue;

        if ( !isalive( var_2 ) )
            continue;

        if ( !isdefined( var_2._id_940F[self._id_331C] ) )
            var_2 thread _id_6D71( self, var_0, var_1 );
    }
}

_id_6D71( var_0, var_1, var_2 )
{
    var_0 endon( "deleted" );

    if ( !isplayer( self ) )
        self endon( "death" );

    if ( !common_scripts\utility::_id_51AE() )
        var_3 = self.guid;
    else
        var_3 = "player" + gettime();

    var_0._id_940D[var_3] = self;

    if ( isdefined( var_0._id_5F95 ) )
        self._id_5F96++;

    var_0 notify( "trigger_enter", self );
    self notify( "trigger_enter", var_0 );

    if ( isdefined( var_1 ) )
        self thread [[ var_1 ]]( var_0 );

    self._id_940F[var_0._id_331C] = var_0;

    while ( isalive( self ) && self istouching( var_0 ) && ( common_scripts\utility::_id_51AE() || !level.gameended ) )
        wait 0.05;

    if ( isdefined( self ) )
    {
        self._id_940F[var_0._id_331C] = undefined;

        if ( isdefined( var_0._id_5F95 ) )
            self._id_5F96--;

        self notify( "trigger_leave", var_0 );

        if ( isdefined( var_2 ) )
            self thread [[ var_2 ]]( var_0 );
    }

    if ( !common_scripts\utility::_id_51AE() && level.gameended )
        return;

    var_0._id_940D[var_3] = undefined;
    var_0 notify( "trigger_leave", self );

    if ( !anythingtouchingtrigger( var_0 ) )
        var_0 notify( "trigger_empty" );
}

_id_5F5F()
{
    if ( isdefined( level._id_2B1D ) )
        return;

    self endon( "disconnect" );

    if ( !isplayer( self ) )
        self endon( "death" );

    self._id_5F96 = 0;
    self._id_2B7F = 0;

    for (;;)
    {
        self waittill( "trigger_enter" );
        var_0 = self.origin;

        while ( self._id_5F96 )
        {
            self._id_2B7F = distance( var_0, self.origin );
            var_0 = self.origin;
            wait 0.05;
        }

        self._id_2B7F = 0;
    }
}

anythingtouchingtrigger( var_0 )
{
    return var_0._id_940D.size;
}

_id_6D70( var_0, var_1 )
{
    return isdefined( var_0._id_940F[var_1._id_331C] );
}

_id_4EA4()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    if ( var_0.size )
    {
        common_scripts\utility::_id_6166( [ "com_tv2_d", "com_tv1_d", "com_tv1", "com_tv2", "com_tv1_testpattern", "com_tv2_testpattern" ], ::precachemodel );
        level.breakables_fx["tv_explode"] = loadfx( "fx/explosions/tv_explosion" );
    }

    level._id_99D2 = getentarray( "interactive_tv_light", "targetname" );
    common_scripts\utility::array_thread( getentarray( "interactive_tv", "targetname" ), ::_id_99D3 );
}

_id_99D3()
{
    self setcandamage( 1 );
    self._id_25A7 = undefined;
    self._id_6378 = undefined;

    if ( issubstr( self.model, "cinematic" ) )
    {
        self._id_6378 = "com_tv1_cinematic";
        self._id_25A7 = "com_tv1_cinematic_d";
    }
    else if ( issubstr( self.model, "1" ) )
    {
        self._id_6378 = "com_tv1";
        self._id_64BC = "com_tv1_testpattern";
        self._id_25A7 = "com_tv1_d";
    }
    else if ( issubstr( self.model, "2" ) )
    {
        self._id_25A7 = "com_tv2_d";
        self._id_6378 = "com_tv2";
        self._id_64BC = "com_tv2_testpattern";
    }

    if ( isdefined( self.target ) )
    {
        if ( isdefined( level._id_2AAF ) )
        {
            var_0 = getent( self.target, "targetname" );

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
        else
        {
            self._id_9C1A = getent( self.target, "targetname" );
            self._id_9C1A usetriggerrequirelookat();
            self._id_9C1A setcursorhint( "HINT_NOICON" );
        }
    }

    var_1 = common_scripts\utility::_id_3CCB( self.origin, level._id_99D2, undefined, undefined, 64 );

    if ( var_1.size )
    {
        self._id_57A7 = var_1[0];
        level._id_99D2 = common_scripts\utility::array_remove( level._id_99D2, self._id_57A7 );
        self._id_57A9 = self._id_57A7 getlightintensity();
    }

    thread _id_99CF();

    if ( isdefined( self._id_9C1A ) )
        thread _id_99D6();
}

_id_99D6()
{
    self._id_9C1A endon( "death" );

    for (;;)
    {
        wait 0.2;
        self._id_9C1A waittill( "trigger" );
        self notify( "off" );

        if ( self.model == self._id_6378 )
        {
            self setmodel( self._id_64BC );

            if ( isdefined( self._id_57A7 ) )
                self._id_57A7 setlightintensity( self._id_57A9 );

            continue;
        }

        self setmodel( self._id_6378 );

        if ( isdefined( self._id_57A7 ) )
            self._id_57A7 setlightintensity( 0 );
    }
}

_id_99CF()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    self notify( "off" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A notify( "death" );

    self setmodel( self._id_25A7 );

    if ( isdefined( self._id_57A7 ) )
        self._id_57A7 setlightintensity( 0 );

    playfxontag( level.breakables_fx["tv_explode"], self, "tag_fx" );
    self playsound( "tv_shot_burst" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A delete();
}

_id_8628()
{
    if ( !isdefined( self._id_651C ) )
        self._id_651C = 1;

    var_0 = getentarray( self.target, "script_linkname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3.classname == "script_origin" )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        var_3 _id_2D46( self._id_651C );
    }

    var_0 = common_scripts\utility::array_remove_array( var_0, var_1 );

    for (;;)
    {
        if ( !isdefined( level.characters ) )
        {
            wait 1;
            continue;
        }

        var_5 = vehicle_getarray();
        var_6 = common_scripts\utility::array_combine( level.characters, var_5 );
        var_7 = 0;

        foreach ( var_9 in var_6 )
        {
            if ( var_9 istouching( self ) )
            {
                var_7++;
                break;
            }
        }

        if ( var_7 > 0 )
            _id_6504( var_0 );
        else
        {
            var_11 = 1;
            thread _id_1FCD( var_0, var_11 );
        }

        wait 0.05;
    }
}

_id_2D46( var_0 )
{
    self._id_8C42 = self.origin;
    self._id_8629 = "closed";
    var_1 = getent( self.target, "targetname" );
    self._id_6517 = var_1.origin;
    self._id_651E = distance( self._id_6517, self.origin ) / var_0;
}

_id_6504( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_8629 == "open" || var_2._id_8629 == "opening" )
            continue;

        var_2 thread _id_6509();
    }
}

_id_6509()
{
    self._id_8629 = "opening";
    var_0 = distance( self.origin, self._id_6517 ) / self._id_651E;

    if ( var_0 < 0.05 )
        var_0 = 0.05;

    self moveto( self._id_6517, var_0 );
    self playsound( "glass_door_open" );
    wait(var_0);
    self._id_8629 = "open";
}

_id_1FCD( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_8629 == "closed" || var_3._id_8629 == "opening" )
            continue;

        var_3 moveto( var_3._id_8C42, var_1 );
        self playsound( "glass_door_close" );
        var_3._id_8629 = "closed";
    }
}
