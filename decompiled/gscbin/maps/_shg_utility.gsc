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

_id_5F21( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_8C36 + "_playerstart";

    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        maps\_utility::_id_923E( var_1 );
}

_id_88FC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_4 = getentarray( var_1, "script_noteworthy" );
    var_5 = [];
    var_6 = 0;
    var_7 = [];

    foreach ( var_9 in var_4 )
    {
        if ( isspawner( var_9 ) )
            var_5[var_5.size] = var_9;
    }

    var_11 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_12 = 0;

    foreach ( var_14 in var_5 )
    {
        var_15 = var_14 maps\_utility::_id_88C3( 1 );

        if ( var_2 )
            var_15 thread maps\_utility::_id_7402();

        var_15 _meth_81ca( var_11.origin, var_11.angles );
        var_15 _meth_81aa( var_15.origin );
        var_7 = common_scripts\utility::_id_0CDA( var_7, var_15 );
        var_12++;

        if ( isdefined( var_3 ) && var_12 >= var_3 )
            return var_7;
    }

    return var_7;
}

_id_8264( var_0, var_1 )
{
    self allowmelee( 0 );
    self disableweapons();
    self disableoffhandweapons();
    self allowstand( 1 );
    self allowcrouch( 0 );
    self allowprone( 0 );
    self allowsprint( 0 );
    setsaveddvar( "ammoCounterHide", 1 );

    if ( isdefined( var_0 ) && var_0 )
    {
        var_2 = 0;

        for ( var_3 = 0; self getstance() != "stand"; var_3 += 0.05 )
        {
            self setstance( "stand" );
            waittillframeend;
        }

        while ( self isthrowinggrenade() || self isswitchingweapon() || self getcurrentweapon( 0 ) != "none" )
        {
            waittillframeend;
            var_3 += 0.05;
        }

        if ( isdefined( var_1 ) && var_1 > var_3 )
            wait(var_1 - var_3);
    }
}

_id_8263()
{
    setsaveddvar( "ammoCounterHide", 0 );
    self allowsprint( 1 );
    self allowprone( 1 );
    self allowcrouch( 1 );
    self allowstand( 1 );
    self enableoffhandweapons();
    self enableweapons();
    self allowmelee( 1 );
}

_id_5EBC()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1._id_87E2 ) )
        {
            var_1._id_87E2 = var_1 maps\_hud_util::_id_23ED( "default", 1.75 );
            var_1._id_87E2.hostquits = "center";
            var_1._id_87E2.visionsetnight = "top";
            var_1._id_87E2.alignx = "center";
            var_1._id_87E2.aligny = "top";
            var_1._id_87E2.xpmaxmultipliertimeplayed = 0;
            var_1._id_87E2._id_0538 = 20;
            var_1._id_87E2 settext( &"VARIABLE_SCOPE_SNIPER_ZOOM" );
            var_1._id_87E2.alpha = 0;
            var_1._id_87E2.space = 0.5;
            var_1._id_87E2.foreground = 1;
        }

        var_1._id_3A03 = 1;
    }

    var_3 = 0;
    level.players[0]._id_87D2 = "cg_playerFovScale0";

    if ( level.players.size == 2 )
        level.players[1]._id_87D2 = "cg_playerFovScale1";

    foreach ( var_1 in level.players )
    {
        var_1 thread _id_5E7E();
        var_1 thread _id_2B2C();
    }

    if ( !isdefined( level._id_9C64 ) )
        level._id_9C64 = [];

    var_6 = undefined;
    var_7 = undefined;

    for (;;)
    {
        var_8 = 0;
        var_7 = var_6;
        var_6 = undefined;

        foreach ( var_10 in level._id_9C64 )
        {
            foreach ( var_1 in level.players )
            {
                if ( var_1 getcurrentweapon() == var_10 && isalive( var_1 ) )
                {
                    var_8 = 1;
                    var_6 = var_1;
                    break;
                }
            }

            if ( var_8 )
                break;
        }

        if ( var_8 && !var_6 isreloading() && !var_6 isswitchingweapon() )
        {
            if ( var_6 maps\_utility::_id_50A9() && var_6 adsbuttonpressed() )
            {
                var_6 _id_9939( var_3 );
                var_3 = 1;

                if ( isdefined( level._id_9C63 ) )
                {
                    var_14 = undefined;
                    var_15 = undefined;
                    var_16 = anglestoforward( var_6 getplayerangles() );
                    var_17 = var_6.origin;

                    foreach ( var_19 in level._id_9C63 )
                    {
                        var_20 = anglestoforward( vectortoangles( var_19 - var_17 ) );
                        var_21 = vectordot( var_16, var_20 );

                        if ( !isdefined( var_14 ) || var_21 > var_15 )
                        {
                            var_14 = var_19;
                            var_15 = var_21;
                        }
                    }

                    if ( isdefined( var_14 ) )
                        setsaveddvar( "sm_sunShadowCenter", var_14 );
                }
            }
            else if ( var_3 )
            {
                var_3 = 0;

                if ( isdefined( var_6 ) )
                    var_6 _id_9933();

                setsaveddvar( "sm_sunShadowCenter", "0 0 0" );
            }
        }
        else if ( var_3 )
        {
            var_3 = 0;

            if ( isdefined( var_7 ) )
                var_7 _id_9933();

            setsaveddvar( "sm_sunShadowCenter", "0 0 0" );
        }

        wait 0.05;
    }
}

_id_9939( var_0 )
{
    self disableoffhandweapons();
    setsaveddvar( self._id_87D2, self._id_3A03 );
    self._id_87E2.alpha = 1;

    if ( !var_0 )
        level notify( "variable_sniper_hud_enter" );
}

_id_9933()
{
    level notify( "variable_sniper_hud_exit" );
    self enableoffhandweapons();
    setsaveddvar( self._id_87D2, 1 );
    self._id_87E2.alpha = 0;
}

_id_5E7E()
{
    notifyoncommand( "mag_cycle", "+melee_zoom" );
    notifyoncommand( "mag_cycle", "+sprint_zoom" );

    for (;;)
    {
        self waittill( "mag_cycle" );

        if ( self._id_87E2.alpha )
        {
            if ( self._id_3A03 == 0.5 )
            {
                self._id_3A03 = 1;
                continue;
            }

            self._id_3A03 = 0.5;
        }
    }
}

_id_2B2C()
{
    self waittill( "death" );
    _id_9933();
}

_id_2A38( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_reminders" );
    level endon( "missionfailed" );
    var_5 = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = 10;

    if ( !isdefined( var_4 ) )
        var_4 = 20;

    while ( !common_scripts\utility::_id_382E( var_1 ) )
    {
        var_6 = randomfloatrange( var_3, var_4 );
        var_7 = common_scripts\utility::_id_710E( var_2 );

        if ( isdefined( var_5 ) && var_7 == var_5 )
            continue;
        else
        {
            var_5 = var_7;
            wait(var_6);

            if ( !common_scripts\utility::_id_382E( var_1 ) )
            {
                if ( isstring( var_0 ) && var_0 == "radio" )
                {
                    _id_219E();
                    maps\_utility::_id_70BD( var_7 );
                    _id_219F();
                    continue;
                }

                _id_219E();
                var_0 maps\_utility::_id_2A32( var_7 );
                _id_219F();
            }
        }
    }
}

_id_219E()
{
    if ( !common_scripts\utility::_id_3839( "flag_conversation_in_progress" ) )
        common_scripts\utility::_id_383D( "flag_conversation_in_progress" );

    common_scripts\utility::_id_3857( "flag_conversation_in_progress" );
    common_scripts\utility::_id_383F( "flag_conversation_in_progress" );
}

_id_219F()
{
    common_scripts\utility::_id_3831( "flag_conversation_in_progress" );
}

_id_0CE2( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( var_2, var_4 ) ) )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( var_2, var_4 ) ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_54E2( var_0 )
{
    var_0 endon( "remove_laser_targeting_device" );
    var_0._id_560A = undefined;
    var_0._id_54F5 = 0;
    var_0 setweaponhudiconoverride( "actionslot4", "dpad_laser_designator" );
    var_0 thread _id_1E8B();
    var_0 notifyonplayercommand( "use_laser", "+actionslot 4" );
    var_0 notifyonplayercommand( "fired_laser", "+attack" );
    var_0 notifyonplayercommand( "fired_laser", "+attack_akimbo_accessible" );
    var_0._id_54EE = 1;
    var_0._id_54EF = 20;
    var_0 childthread _id_5E78();

    for (;;)
    {
        var_0 waittill( "use_laser" );

        if ( var_0._id_54F5 || !var_0._id_54EE || var_0 _id_849A() )
        {
            var_0 notify( "cancel_laser" );
            var_0 laseroff();
            var_0._id_54F5 = 0;
            var_0 allowads( 1 );
            wait 0.2;
            var_0 allowfire( 1 );
            continue;
        }

        var_0 laseron();
        var_0 allowfire( 0 );
        var_0._id_54F5 = 1;
        var_0 allowads( 0 );
        var_0 thread _id_54C7();
    }
}

_id_849A()
{
    var_0 = self getcurrentweapon();

    if ( var_0 == "rpg" )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "gl" ) )
        return 1;

    if ( isdefined( level._id_54C9 ) && isarray( level._id_54C9 ) )
    {
        foreach ( var_2 in level._id_54C9 )
        {
            if ( var_0 == var_2 )
                return 1;
        }
    }

    if ( self isreloading() )
        return 1;

    if ( self isthrowinggrenade() )
        return 1;

    return 0;
}

_id_1E8B()
{
    self waittill( "remove_laser_targeting_device" );
    self setweaponhudiconoverride( "actionslot4", "none" );
    self notify( "cancel_laser" );
    self laseroff();
    self._id_54F5 = undefined;
    self allowfire( 1 );
    self allowads( 1 );
}

_id_5E78()
{
    for (;;)
    {
        if ( _id_849A() && isdefined( self._id_54F5 ) && self._id_54F5 )
        {
            self notify( "use_laser" );
            wait 2.0;
        }

        wait 0.05;
    }
}

_id_54C7()
{
    self endon( "cancel_laser" );

    for (;;)
    {
        self waittill( "fired_laser" );
        var_0 = _id_3DB0();
        var_1 = var_0["position"];
        var_2 = var_0["entity"];
        level notify( "laser_coordinates_received" );
        var_3 = undefined;

        if ( isdefined( level._id_54E3 ) && isdefined( var_2 ) && common_scripts\utility::_id_0CE4( level._id_54E3, var_2 ) )
        {
            var_3 = var_2;
            level._id_54E3 = common_scripts\utility::_id_0CF6( level._id_54E3, var_2 );
        }
        else
            var_3 = _id_4109( var_1 );

        if ( isdefined( var_3 ) )
        {
            thread _id_54C3( var_3 );
            level notify( "laser_target_painted" );
            wait 0.5;
            self notify( "use_laser" );
        }
    }
}

_id_4109( var_0 )
{
    if ( !isdefined( level._id_54E4 ) || level._id_54E4.size == 0 )
        return undefined;

    foreach ( var_2 in level._id_54E4 )
    {
        var_3 = distance2d( var_0, var_2.origin );
        var_4 = var_0[2] - var_2.origin[2];

        if ( !isdefined( var_2.rank ) )
            continue;

        if ( !isdefined( var_2.hidewhendead ) )
            continue;

        if ( var_3 <= var_2.rank && var_4 <= var_2.hidewhendead && var_4 >= 0 )
        {
            level._id_54E4 = common_scripts\utility::_id_0CF6( level._id_54E4, var_2 );
            return getent( var_2._not_team, "script_noteworthy" );
        }
    }

    return undefined;
}

_id_3DB0()
{
    var_0 = self geteye();
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = var_0 + var_2 * 7000;
    var_4 = bullettrace( var_0, var_3, 1, self );
    var_5 = var_4["entity"];

    if ( isdefined( var_5 ) )
        var_4["position"] = var_5.origin;

    return var_4;
}

_id_54C3( var_0 )
{
    level.playercardbackground endon( "remove_laser_targeting_device" );
    level.playercardbackground._id_54EE = 0;
    self setweaponhudiconoverride( "actionslot4", "dpad_killstreak_hellfire_missile_inactive" );
    maps\_utility::_id_38CC( "allies" );
    var_1 = level.playercardbackground;
    wait 2.5;

    if ( !isdefined( var_0._id_7A18 ) )
        var_0._id_7A18 = 99;

    wait 1;

    if ( isdefined( var_0._id_7A0A ) )
    {
        var_2 = _id_3D87( "geo_before", var_0._id_7A0A );

        if ( var_2.size > 0 )
            common_scripts\utility::_id_0CDB( var_2, ::hide );

        var_3 = _id_3D87( "geo_after", var_0._id_7A0A );

        if ( var_3.size > 0 )
            common_scripts\utility::_id_0CDB( var_3, ::show );
    }

    wait(level.playercardbackground._id_54EF);
    level.playercardbackground._id_54EE = 1;
    self setweaponhudiconoverride( "actionslot4", "dpad_laser_designator" );
}

_id_3D87( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_7A0A ) && var_5._id_7A0A == var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_576C( var_0, var_1, var_2, var_3, var_4 )
{
    return var_3 + ( var_0 - var_1 ) * ( var_4 - var_3 ) / ( var_2 - var_1 );
}

_id_576D( var_0, var_1, var_2, var_3, var_4 )
{
    return clamp( _id_576C( var_0, var_1, var_2, var_3, var_4 ), min( var_3, var_4 ), max( var_3, var_4 ) );
}

_id_2A56()
{
    var_0 = gettime() * 0.001;

    if ( !isdefined( self._id_2A5B ) )
    {
        self._id_2A5B = var_0;
        self._id_2A5A = self.origin;
        self._id_2A5C = ( 0, 0, 0 );
        self._id_2A59 = ( 0, 0, 0 );
        self._id_2A58 = ( 0, 0, 0 );
        self._id_2A57 = ( 0, 0, 0 );
        self._id_2A5E = ( 0, 0, 0 );
        self._id_2A5D = 0;
    }
    else if ( self._id_2A5B != var_0 )
    {
        var_1 = var_0 - self._id_2A5B;
        self._id_2A5B = var_0;
        self._id_2A58 = ( self._id_2A57 - self._id_2A59 ) / var_1;
        self._id_2A59 = self._id_2A57;
        self._id_2A57 = ( self._id_2A5E - self._id_2A5C ) / var_1;
        self._id_2A5C = self._id_2A5E;
        self._id_2A5E = ( self.origin - self._id_2A5A ) / var_1;
        self._id_2A5A = self.origin;
        self._id_2A5D = length( self._id_2A5E );
    }
}

_id_3D3D()
{
    _id_2A56();
    return self._id_2A5D;
}

_id_3D3E()
{
    _id_2A56();
    return self._id_2A5E;
}

_id_3D3B()
{
    _id_2A56();
    return self._id_2A57;
}

_id_3D3C()
{
    _id_2A56();
    return self._id_2A58;
}

_id_84E9( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
        setsaveddvar( "g_friendlyNameDist", var_0 );
    else
        setsaveddvar( "g_friendlyNameDist", 15000 );

    if ( isdefined( var_1 ) )
        setsaveddvar( "compass", var_1 );
    else
        setsaveddvar( "compass", "1" );

    if ( isdefined( var_2 ) )
        setsaveddvar( "ammoCounterHide", var_2 );
    else
        setsaveddvar( "ammoCounterHide", "0" );

    if ( isdefined( var_3 ) )
        setsaveddvar( "actionSlotsHide", var_3 );
    else
        setsaveddvar( "actionSlotsHide", "0" );

    if ( isdefined( var_4 ) )
        setsaveddvar( "hud_showStance", var_4 );
    else
        setsaveddvar( "hud_showStance", "1" );
}

_id_4863( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
        setsaveddvar( "g_friendlyNameDist", var_0 );
    else
        setsaveddvar( "g_friendlyNameDist", 0 );

    if ( isdefined( var_1 ) )
        setsaveddvar( "compass", var_1 );
    else
        setsaveddvar( "compass", "0" );

    if ( isdefined( var_2 ) )
        setsaveddvar( "ammoCounterHide", var_2 );
    else
        setsaveddvar( "ammoCounterHide", "1" );

    if ( isdefined( var_3 ) )
        setsaveddvar( "actionSlotsHide", var_3 );
    else
        setsaveddvar( "actionSlotsHide", "1" );

    if ( isdefined( var_4 ) )
        setsaveddvar( "hud_showStance", var_4 );
    else
        setsaveddvar( "hud_showStance", "0" );
}

_id_2AA3( var_0 )
{
    _id_4863();
}

_id_30C1( var_0 )
{
    _id_84E9();
}

_id_45FB( var_0, var_1, var_2 )
{
    level.playercardbackground endon( "death" );
    level endon( "missionfailed" );

    if ( isdefined( var_2 ) && isstring( var_2 ) )
        level endon( var_2 );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_3 = getent( var_1, "targetname" );

    if ( !isdefined( var_3 ) )
        var_3 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_3 ) )
        return;

    var_3 enableportalgroup( 0 );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        var_3 enableportalgroup( 1 );
        common_scripts\utility::_id_3857( var_0 );
        var_3 enableportalgroup( 0 );
        wait 0.05;
    }
}

_id_6E56( var_0, var_1 )
{
    level.playercardbackground endon( "death" );
    level endon( "missionfailed" );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_2 ) )
        return;

    var_2 enableportalgroup( 0 );
    common_scripts\utility::_id_384A( var_0 );
    var_2 enableportalgroup( 1 );
}

_id_6E55( var_0, var_1 )
{
    level.playercardbackground endon( "death" );
    level endon( "missionfailed" );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_2 ) )
        return;

    common_scripts\utility::_id_384A( var_0 );
    var_2 enableportalgroup( 0 );
}

_id_591F()
{
    if ( !isdefined( level._id_3078 ) )
        level._id_3078 = [];

    level._id_3078 = common_scripts\utility::_id_0CDA( level._id_3078, self );
    self waittill( "death" );
    level._id_3078 = common_scripts\utility::_id_0CF6( level._id_3078, self );
}

_id_6955( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_3B58 = common_scripts\utility::_id_3FA8( var_0 );
    var_4.entity = var_1;
    var_4.tag_aim_animated = var_2;

    if ( isdefined( var_3 ) && var_3 )
    {
        var_4.tag_rail_master_off = common_scripts\utility::_id_8959();
        var_4.tag_rail_master_off linkto( var_1, var_4.tag_aim_animated, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        playfxontag( var_4._id_3B58, var_4.tag_rail_master_off, "tag_origin" );
        _id_5314( var_4 );
    }
    else
        playfxontag( var_4._id_3B58, var_4.entity, var_4.tag_aim_animated );

    return var_4;
}

_id_5314( var_0 )
{
    thread _id_5315( var_0 );
}

_id_5315( var_0 )
{
    var_0.entity waittill( "death" );
    _id_5313( var_0 );
}

_id_5313( var_0 )
{
    if ( isdefined( var_0.tag_rail_master_off ) )
    {
        killfxontag( var_0._id_3B58, var_0.tag_rail_master_off, "tag_origin" );
        var_0.tag_rail_master_off common_scripts\utility::_id_27CD( 0.05, ::delete );
        var_0.tag_rail_master_off = undefined;
        var_0.entity = undefined;
    }
    else if ( isdefined( var_0.entity ) )
    {
        killfxontag( var_0._id_3B58, var_0.entity, var_0.tag_aim_animated );
        var_0.entity = undefined;
    }
}

_id_48C2( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 200;

    return _id_48BE( var_0, self.origin, undefined, var_1, undefined, self );
}

_id_48C1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    return _id_48B8( var_0, var_1, var_2, var_3, 0, var_4, var_5 );
}

_id_48BE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = common_scripts\utility::_id_8959();

    if ( !isdefined( var_1 ) )
    {
        if ( isdefined( var_5 ) )
            var_1 = var_5.origin;
        else
            var_1 = self.origin;
    }

    var_6.origin = var_1;
    return var_6 _id_48B8( var_0, "tag_origin", var_2, var_3, 1, var_4, var_5 );
}

_id_48B8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = newclienthudelem( level.playercardbackground );
    var_7.alignx = "center";
    var_7.aligny = "middle";
    var_7.fontscale = 3;
    var_7.font = "buttonprompt";
    var_7.predicted_projectile_impact = 1;

    if ( isdefined( self ) )
    {
        if ( isdefined( var_1 ) )
            var_7 settargetent( self, var_1 );
        else
            var_7 settargetent( self );
    }

    var_8 = _id_48BF( var_0 );
    var_7 settext( var_8 );
    var_7.hindlegstraceoffset = 1;
    var_7.space = -1;
    var_7.alpha = 1;

    if ( !isdefined( var_5 ) || !var_5 )
        var_7 thread _id_782E( self, var_1, level.playercardbackground, var_2, var_3, var_6 );

    var_7._id_62E1 = self;

    if ( isdefined( var_4 ) && var_4 )
        var_7._id_2858 = 1;

    return var_7;
}

_id_782E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    var_0 endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = getdvarint( "player_useradius" );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_6 = 0;
    self.fontscale = 2;
    self.font = "buttonprompt";

    for (;;)
    {
        if ( isdefined( var_1 ) )
            var_6 = distance( var_0 gettagorigin( var_1 ), var_2 geteye() );
        else
            var_6 = distance( var_0, var_2 geteye() );

        if ( var_4 != 0 && var_6 > var_4 )
            self.alpha = 0;
        else if ( var_3 != 0 && var_6 > var_3 )
        {
            if ( var_4 - var_3 > 0 )
                self.alpha = ( 1 - ( var_6 - var_3 ) / ( var_4 - var_3 ) ) * 0.3;
            else
                self.alpha = 0.3;
        }
        else if ( isdefined( var_5 ) && isdefined( var_5.classname ) && issubstr( var_5.classname, "trigger" ) )
        {
            var_7 = var_2 _meth_8516();

            if ( isdefined( var_7 ) && var_7 == var_5 )
                self.alpha = 1;
            else
                self.alpha = 0.3;
        }
        else
            self.alpha = 1;

        waittillframeend;
    }
}

_id_48BF( var_0 )
{
    switch ( var_0 )
    {
        case "reload":
        case "x":
        case "use":
        case "usereload":
        case "activate":
            return "^3[{+activate}]^7";
        case "a":
        case "jump":
        case "gostand":
            return "^3[{+gostand}]^7";
        case "y":
        case "weapnext":
            return "^3[{weapnext}]^7";
        case "crouch":
        case "b":
        case "stance":
            return "^3[{+stance}]^7";
        case "melee":
        case "rs":
            return "^3[{+melee}]^7";
        case "sprint":
        case "ls":
        case "breath":
            return "^3[{+sprint}]^7";
        case "rt":
        case "r1":
        case "attack":
            return "^3[{+attack}]^7";
        case "grenade":
        case "rb":
        case "r2":
        case "frag":
            return "^3[{+frag}]^7";
        case "lt":
        case "l1":
        case "ads":
            if ( level.perk1 )
                return "^3[{+ads}]^7";
            else if ( level.playercardbackground _meth_834c() )
                return "^3[{+speed_throw}]^7";
            else
                return "^3[{+toggleads_throw}]^7";
        case "flashbang":
        case "lb":
        case "l2":
        case "smoke":
        case "flash":
            return "^3[{+smoke}]^7";
        case "start":
        case "pause":
            return "^3[{pause}]^7";
        case "up":
            return "^3[{+actionslot 1}]^7";
        case "down":
            return "^3[{+actionslot 2}]^7";
        case "left":
            return "^3[{+actionslot 3}]^7";
        case "right":
            return "^3[{+actionslot 4}]^7";
        default:
            break;
    }
}

_id_48B6()
{
    if ( isdefined( self._id_2858 ) && self._id_2858 )
        self._id_62E1 delete();

    if ( isdefined( self ) )
        self destroy();
}

_id_48BA( var_0, var_1 )
{
    while ( isdefined( self ) )
    {
        var_2 = self.alpha;
        self fadeovertime( var_0 / 3 );
        self.alpha = var_1;
        wait(var_0);

        if ( !isdefined( self ) )
            return;

        self fadeovertime( var_0 / 3 );
        self.alpha = var_2;
        wait(var_0);
    }
}

_id_1950( var_0, var_1, var_2, var_3 )
{
    self endon( var_2 );
    level.playercardbackground endon( var_2 );
    self endon( "death" );
    thread maps\_utility::_id_48B0( var_0 );
    var_4 = var_1 + "_button_mash_dynamic_hint";
    thread _id_195E( var_2, var_4, var_1, var_3 );
    level.playercardbackground notifyonplayercommand( var_4, var_1 );

    if ( isdefined( var_3 ) )
        level.playercardbackground notifyonplayercommand( var_4, var_3 );

    for (;;)
    {
        self waittill( var_4 );
        level._id_4903.alpha = 0.2;
        level._id_4903 fadeovertime( 0.3 );
        level._id_4903.alpha = 1;
        waittillframeend;
    }
}

_id_195E( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    common_scripts\utility::_id_A06A( self, var_0, level.playercardbackground, var_0 );
    thread maps\_utility::_id_48CB();
    level.playercardbackground _meth_8498( var_1, var_2 );

    if ( isdefined( var_3 ) )
        level.playercardbackground _meth_8498( var_1, var_3 );
}

_id_48B9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    self endon( "death" );
    var_7 = common_scripts\utility::_id_8959();
    var_7.origin = self gettagorigin( var_0 );
    var_7.origin += var_3;
    var_7 linkto( self, var_0 );
    var_1 = var_7 _id_48B8( var_1, "TAG_ORIGIN", var_4, var_5, 1, 1 );

    if ( isdefined( var_6 ) )
        var_1.fontscale = var_6;

    var_1 thread _id_48BA( 0.15, 0.1 );
    common_scripts\utility::_id_A06A( self, var_2, level.playercardbackground, var_2 );
    var_1 _id_48B6();
}

_id_6A1C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 1;

    var_8 = undefined;

    if ( isdefined( var_2 ) || isdefined( var_3 ) || isdefined( var_4 ) || isdefined( var_5 ) )
    {
        var_8 = [];
        var_8["top"] = var_2;
        var_8["left"] = var_3;
        var_8["bottom"] = var_4;
        var_8["right"] = var_5;
    }

    var_9 = [];
    var_9["add"] = 0;
    var_9["blend"] = 1;
    var_9["blend_add"] = 2;
    var_9["screen_add"] = 3;
    var_9["multiply"] = 4;
    var_9["replace"] = 5;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_10 = var_9[var_1];
    var_11 = getdvarint( "cg_cinematicfullscreen" );
    setsaveddvar( "cg_cinematicfullscreen", 0 );
    var_12 = [];

    if ( isdefined( var_8 ) )
    {
        var_12["top"] = getomnvar( "ui_videolog_pos_top" );
        var_12["left"] = getomnvar( "ui_videolog_pos_left" );
        var_12["bottom"] = getomnvar( "ui_videolog_pos_bottom" );
        var_12["right"] = getomnvar( "ui_videolog_pos_right" );
        setomnvar( "ui_videolog_pos_top", var_8["top"] );
        setomnvar( "ui_videolog_pos_left", var_8["left"] );
        setomnvar( "ui_videolog_pos_bottom", var_8["bottom"] );
        setomnvar( "ui_videolog_pos_right", var_8["right"] );
    }

    setomnvar( "ui_videolog", 1 );
    var_13 = getomnvar( "ui_videolog_blendfunc" );
    setomnvar( "ui_videolog_blendfunc", var_10 );
    setomnvar( "ui_videolog_blur_bkgrnd", var_6 );

    if ( !isdefined( var_7 ) )
        var_7 = level._id_065D._id_2791;

    cinematicingame( var_0, 0, var_7, 1 );

    while ( !iscinematicplaying() )
        waittillframeend;

    while ( iscinematicplaying() )
        waittillframeend;

    setomnvar( "ui_videolog", 0 );
    setomnvar( "ui_videolog_blendfunc", var_13 );
    setsaveddvar( "cg_cinematicfullscreen", var_11 );

    if ( isdefined( var_8 ) )
    {
        setomnvar( "ui_videolog_pos_top", var_12["top"] );
        setomnvar( "ui_videolog_pos_left", var_12["left"] );
        setomnvar( "ui_videolog_pos_bottom", var_12["bottom"] );
        setomnvar( "ui_videolog_pos_right", var_12["right"] );
    }
}

_id_8ED3()
{
    if ( iscinematicplaying() )
        stopcinematicingame();
}

_id_68AD( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( "chyron_video_done" );
    var_3 = newclienthudelem( level.playercardbackground );
    var_3 setshader( "black", 1280, 720 );
    var_3.hostquits = "fullscreen";
    var_3.visionsetnight = "fullscreen";
    var_3.alpha = 1;
    var_3.foreground = 0;
    cinematicingame( var_0 );
    var_4 = getdvarint( "cg_cinematicCanPause", 0 );
    setsaveddvar( "cg_cinematicCanPause", 1 );

    while ( !iscinematicplaying() )
        waittillframeend;

    while ( iscinematicplaying() )
        waittillframeend;

    common_scripts\utility::_id_383F( "chyron_video_done" );

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( isdefined( var_2 ) )
    {
        var_3 fadeovertime( var_2 );
        var_3.alpha = 0;
        wait(var_2);
    }

    setsaveddvar( "cg_cinematicCanPause", var_4 );
    var_3 destroy();
}

_id_6E1A( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = level.playercardbackground;

    return vectordot( vectornormalize( var_0 - var_2 geteye() ), anglestoforward( var_2 getplayerangles() ) ) > cos( var_1 );
}

_id_3313( var_0, var_1, var_2, var_3 )
{
    return _id_6E1A( var_0.origin, atan( tan( 0.5 * var_2 ) * var_3 / 320.0 ), var_1 );
}
