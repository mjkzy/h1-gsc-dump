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

_id_6EFB()
{
    precacheitem( "turret_attackheli" );
    precacheitem( "missile_attackheli" );
    _id_0E20();
    thread init();
}

_id_0E20()
{
    if ( getdvarint( "sm_enable" ) && getdvar( "r_zfeather" ) != "0" )
        level._effect["_attack_heli_spotlight"] = loadfx( "fx/misc/hunted_spotlight_model" );
    else
        level._effect["_attack_heli_spotlight"] = loadfx( "fx/misc/spotlight_large" );
}

init()
{
    if ( isdefined( level._id_0E37 ) )
        return;

    while ( !isdefined( level._id_3BFE ) )
        wait 0.05;

    if ( !isdefined( level._id_2235 ) )
        level._id_2235 = [];

    if ( !isdefined( level._id_2235["25"] ) )
        level._id_2235["25"] = cos( 25 );

    if ( !isdefined( level._id_2235["35"] ) )
        level._id_2235["35"] = cos( 35 );

    if ( !isdefined( level._id_0E3F ) )
        level._id_0E3F = 3500;

    if ( !isdefined( level._id_0E3B ) )
        level._id_0E3B = 0;

    if ( !isdefined( level._id_0E39 ) )
        level._id_0E39 = cos( 30 );

    level._id_0E37 = 1;
    level._id_0E3C = 3;
    level._id_0E40 = 6;
    level._id_0E3D = 3;

    switch ( level._id_3BFE )
    {
        case 0:
            level._id_0E3E = 9;
            level._id_0E41 = 1;
            break;
        case 1:
            level._id_0E3E = 7;
            level._id_0E41 = 2;
            break;
        case 2:
            level._id_0E3E = 5;
            level._id_0E41 = 3;
            break;
        case 3:
            level._id_0E3E = 3;
            level._id_0E41 = 5;
            break;
    }
}

_id_8B37( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "kill_heli";

    var_1 = _id_A5A8::_id_8979( var_0 );
    var_1 = _id_136E( var_1 );
    return var_1;
}

_id_136E( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "heli_players_dead" );

    if ( level._id_3BFE == 0 || level._id_3BFE == 1 )
    {
        var_2 = spawn( "script_origin", var_0.origin + ( 0, 0, -20 ) );
        var_2 linkto( var_0 );
        var_0 thread common_scripts\utility::_id_2825( var_2 );
        var_3 = undefined;

        if ( level._id_3BFE == 0 )
            var_3 = 2800;
        else
            var_3 = 2200;

        if ( !isdefined( var_0._id_60F0 ) )
        {
            var_0._id_0E54 = missile_createattractorent( var_2, var_3, 10000, level.playercardbackground );

            if ( _id_A5A4::_id_500C() )
                var_0._id_0E55 = missile_createattractorent( var_2, var_3, 10000, level._id_6C5B );
        }
    }

    var_0 _meth_81b9();
    var_0._id_8D26 = spawn( "script_origin", var_0.origin );
    var_0 thread common_scripts\utility::_id_2825( var_0._id_8D26 );

    if ( !isdefined( var_0._id_1D75 ) )
        var_0._id_1D75 = 0;

    var_0._id_0AAF = 1;
    var_0._id_3805 = 0;
    var_0._id_5F9E = 1;
    var_0._id_51C8 = 0;
    var_0._id_47CC = undefined;
    var_0 thread _id_6200();
    var_0 thread _id_6204();
    thread _id_5319( var_0, var_1 );
    var_0._id_99C5 = undefined;
    var_0 _id_47B7();
    var_0 thread _id_298D();

    switch ( var_0.visionsetnaked )
    {
        case "hind":
        case "hind_blackice":
        case "ny_harbor_hind":
            var_0._id_99C5 = "default";
            break;
        case "mi17":
        case "nh90":
        case "mi28":
            var_0._id_99C5 = "default";
            break;
        case "apache":
            var_0._id_99C5 = "default";
            break;
        case "littlebird":
        case "littlebird_spotlight":
            var_0 setyawspeed( 90, 30, 20 );
            var_0 setmaxpitchroll( 40, 40 );
            var_0 sethoverparams( 100, 20, 5 );
            var_0 _id_8235();
            break;
        default:
            break;
    }

    var_0._id_338A = var_0._id_91C4;

    if ( isdefined( var_0._id_7AD4 ) && var_0._id_7AD4 == 1 && !isdefined( var_0._id_8A85 ) )
        var_0 thread _id_47EA( undefined, 1 );

    var_0 thread _id_0E1F();
    return var_0;
}

_id_298D()
{
    foreach ( var_1 in level.players )
        var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );

    _id_A5A4::_id_2BDD();
    self notify( "heli_players_dead" );
}

_id_47B7()
{
    var_0 = undefined;
    var_1 = undefined;

    switch ( self.visionsetnaked )
    {
        case "hind":
        case "hind_blackice":
        case "ny_harbor_hind":
            var_1 = 600;
            var_0 = -100;
            break;
        case "mi17":
        case "nh90":
        case "mi28":
            var_1 = 600;
            var_0 = -100;
            break;
        case "apache":
            var_1 = 600;
            var_0 = -100;
            break;
        case "littlebird":
        case "littlebird_spotlight":
            var_1 = 600;
            var_0 = -204;
            break;
        default:
            break;
    }

    self._id_91C4 = spawn( "script_origin", self.origin );
    self._id_91C4.angles = self.angles;
    self._id_91C4.origin = self.origin;
    var_2 = spawnstruct();
    var_2.entity = self._id_91C4;
    var_2.forward = var_1;
    var_2.upgradepurchased = var_0;
    var_2 _id_A5A4::_id_9723();
    self._id_91C4 linkto( self );
    self._id_91C4 thread _id_47B6( self );
}

_id_3EAA()
{
    if ( isdefined( self._id_99BB ) )
        return self._id_99BB;

    _id_8235();
    return self._id_99BB;
}

_id_8235()
{
    self._id_99C5 = "miniguns";
    self._id_5C71 = 0;
    self._id_3804 = 0;

    if ( !isdefined( self._id_5BD5 ) )
        return;

    self._id_99BB = self._id_5BD5;
    common_scripts\utility::_id_0D13( self._id_99BB, ::_id_57B6, self );
}

_id_47B6( var_0 )
{
    var_0 common_scripts\utility::_id_A087( "death", "crash_done" );

    if ( isdefined( self ) )
        self delete();
}

_id_8B5E( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "kill_heli";

    var_2 = _id_A5A8::_id_8979( var_0 );
    var_2._id_8D26 = spawn( "script_origin", var_2.origin );
    var_2 thread common_scripts\utility::_id_2825( var_2._id_8D26 );
    var_2._id_1D75 = 1;
    var_2._id_0AAF = 1;
    var_2._id_3805 = 0;
    var_2 thread _id_6200();
    var_2 thread _id_6204();
    thread _id_5319( var_2, var_1 );
    return var_2;
}

_id_5319( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = _id_A5A8::_id_8979( "kill_heli" );
        var_0._id_0AAF = 1;
        var_0._id_3805 = 0;
        var_0 thread _id_6200();
        var_0 thread _id_6204();
    }

    var_2 = undefined;

    if ( !isdefined( var_0._id_7930 ) )
        var_2 = 40;
    else
        var_2 = var_0._id_7930;

    if ( !isdefined( level._id_324E ) )
        level._id_324E = 0;

    if ( !isdefined( level._id_20BC ) )
        level._id_20BC = 0;

    if ( !isdefined( level._id_324D ) )
        level._id_324D = 0;

    level._id_0E21 = undefined;
    var_3 = getentarray( "attack_heli_safe_volume", "script_noteworthy" );

    if ( var_3.size > 0 )
        level._id_0E21 = var_3;

    if ( !level._id_324E )
        thread _id_29EE( var_0 );

    if ( !isdefined( var_0._id_4811 ) )
    {
        switch ( var_0.visionsetnaked )
        {
            case "mi17":
            case "nh90":
            case "mi28":
                target_set( var_0, ( 0, 0, -80 ) );
                break;
            case "hind":
            case "hind_blackice":
            case "ny_harbor_hind":
                target_set( var_0, ( 0, 0, -96 ) );
                break;
            case "apache":
                target_set( var_0, ( 0, 0, -96 ) );
                break;
            case "littlebird":
            case "littlebird_spotlight":
                target_set( var_0, ( 0, 0, -80 ) );
                break;
            default:
                break;
        }

        target_setjavelinonly( var_0, 1 );
    }

    var_0 thread _id_47B1();
    var_0 thread _id_47B3();
    var_0 endon( "death" );
    var_0 endon( "heli_players_dead" );
    var_0 endon( "returning_home" );
    var_0 setvehweapon( "turret_attackheli" );

    if ( !isdefined( var_0._id_1D75 ) )
        var_0._id_1D75 = 0;

    if ( !var_0._id_1D75 )
    {
        var_0 neargoalnotifydist( 100 );

        if ( !isdefined( var_0._id_2D3E ) )
            var_0 waittill( "reached_dynamic_path_end" );
    }
    else
    {
        var_0 neargoalnotifydist( 500 );
        var_0 waittill( "near_goal" );
    }

    var_0 thread _id_47E0();

    if ( var_0._id_1D75 )
        var_0 thread _id_47A9( var_1, var_2 );
    else
        var_0 thread _id_47C8( var_2 );
}

_id_47A9( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "attack_heli_circle_node";

    var_2 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_2 ) || var_2.size < 1 )
        var_2 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    var_3 = self;
    var_3 endon( "stop_circling" );
    var_3 endon( "death" );
    var_3 endon( "returning_home" );
    var_3 endon( "heli_players_dead" );

    for (;;)
    {
        var_3 vehicle_setspeed( var_1, var_1 / 4, var_1 / 4 );
        var_3 neargoalnotifydist( 100 );
        var_4 = _id_A5A4::_id_3CFF( var_3.origin );
        var_5 = var_4.origin;
        var_3 setlookatent( var_4 );
        var_6 = common_scripts\utility::_id_3F33( var_5, var_2 );
        var_7 = getentarray( var_6._not_team, "targetname" );

        if ( !isdefined( var_7 ) || var_7.size < 1 )
            var_7 = common_scripts\utility::_id_40FD( var_6._not_team, "targetname" );

        var_8 = var_7[randomint( var_7.size )];
        var_3 setgoalpos( var_8.origin, 1 );
        var_3 waittill( "near_goal" );

        if ( !isdefined( var_4._id_500B ) )
        {
            wait 1;
            wait(randomfloatrange( 0.8, 1.3 ));
        }
    }
}

_id_47C8( var_0 )
{
    self endon( "death" );
    var_1 = getentarray( "kill_heli_spot", "targetname" );
    var_2 = self;
    var_3 = common_scripts\utility::_id_3F33( var_2.origin, var_1 );
    var_4 = var_3;
    var_2 endon( "death" );
    var_2 endon( "returning_home" );
    var_2 endon( "heli_players_dead" );
    var_5 = undefined;

    for (;;)
    {
        wait 0.05;
        var_2 vehicle_setspeed( var_0, var_0 / 2, var_0 / 10 );
        var_2 neargoalnotifydist( 100 );
        var_6 = _id_A5A4::_id_3CFF( var_2.origin );
        var_7 = var_6.origin;

        if ( var_3 == var_4 && var_2._id_51C8 )
        {
            var_8 = _id_3DBF( var_2, var_3, var_1, var_6, var_7 );
            var_3 = common_scripts\utility::_id_3F33( var_7, var_8 );
        }

        var_2 setgoalpos( var_3.origin, 1 );
        var_2._id_5F9E = 1;
        var_6 = _id_A5A4::_id_3CFF( var_2.origin );

        if ( isdefined( self._id_338A ) && isdefined( self._id_338A.classname ) && self._id_338A.classname == "script_origin" )
            var_5 = var_6;
        else if ( isdefined( self._id_338A ) )
            var_5 = self._id_338A;
        else
            var_5 = self._id_91C4;

        var_2 setlookatent( var_5 );
        var_2 waittill( "near_goal" );
        var_2._id_5F9E = 0;

        if ( !_id_A5A4::_id_500C() )
        {
            if ( level._id_3BFE == 0 || level._id_3BFE == 1 )
            {
                while ( _id_6B6A( var_2 ) )
                    wait 0.5;

                wait 3;
            }
        }

        var_6 = _id_A5A4::_id_3CFF( var_2.origin );
        var_7 = var_6.origin;
        var_8 = _id_3DBF( var_2, var_3, var_1, var_6, var_7 );
        var_8[var_8.size] = var_3;
        var_4 = var_3;
        var_9 = common_scripts\utility::_id_3F33( var_7, var_1 );
        var_10 = common_scripts\utility::_id_3F33( var_7, var_8 );

        foreach ( var_12 in var_8 )
        {
            if ( var_6 _meth_81db( var_12.origin, var_2 ) != 1 )
            {
                var_8 = common_scripts\utility::_id_0CF6( var_8, var_12 );
                continue;
            }
        }

        var_14 = common_scripts\utility::_id_3F33( var_7, var_8 );

        if ( var_8.size < 2 )
            var_3 = var_10;
        else if ( var_14 != var_9 )
            var_3 = var_14;
        else
        {
            var_15 = [];
            var_15[0] = var_14;
            var_8 = common_scripts\utility::_id_3CCB( var_7, var_8, var_15, 2 );
            var_16 = randomint( var_8.size );

            if ( randomint( 100 ) > 50 )
                var_3 = var_8[var_16];
            else
                var_3 = var_9;
        }

        var_17 = randomfloatrange( level._id_0E3D - 0.5, level._id_0E3D + 0.5 );
        common_scripts\utility::_id_A0A0( "damage_by_player", var_17 );
    }
}

_id_6B6A( var_0 )
{
    if ( !level.playercardbackground _id_9C2B() )
        return 0;

    if ( !level.playercardbackground adsbuttonpressed() )
        return 0;

    var_1 = level.playercardbackground geteye();

    if ( sighttracepassed( var_1, var_0.origin, 0, level.playercardbackground ) )
        return 1;

    return 0;
}

_id_47E0()
{
    self endon( "stop_shooting" );
    self endon( "death" );
    self endon( "heli_players_dead" );
    thread _id_47D5();
    var_0 = level._id_0E3F * level._id_0E3F;
    level._id_0E3A = 0;

    while ( isdefined( self ) )
    {
        wait(randomfloatrange( 0.8, 1.3 ));

        if ( !_id_47CA() || !_id_47C9() )
        {
            var_1 = _id_47C6();

            if ( isplayer( var_1 ) )
                self._id_338A = var_1;
        }

        if ( _id_47C9() && level.players.size > 1 )
        {
            var_2 = _id_A5A4::_id_3CFF( self.origin );

            if ( self._id_338A != var_2 )
            {
                var_1 = _id_47C6();

                if ( isplayer( var_1 ) )
                    self._id_338A = var_1;
            }
        }

        if ( _id_47C9() )
        {
            if ( !_id_47A8() || level._id_0E3A == 1 )
            {
                var_1 = _id_47C5();
                self._id_338A = var_1;
            }
        }

        if ( isdefined( self._id_47CC ) && isplayer( self._id_47CC ) )
            self._id_338A = self._id_47CC;
        else if ( !_id_47CA() )
        {
            var_1 = _id_47C5();
            self._id_338A = var_1;
        }

        if ( !_id_47CA() )
            continue;

        if ( self._id_338A _id_5037( self ) )
            continue;

        if ( _id_47CA() && distancesquared( self._id_338A.origin, self.origin ) > var_0 )
            continue;

        if ( self._id_99C5 == "default" && _id_47C9() )
        {
            _id_5C8A( self._id_338A );
            wait(randomfloatrange( 0.8, 1.3 ));
            _id_5C8A( self._id_338A );
            wait(randomfloatrange( 0.8, 1.3 ));

            while ( _id_1A50( self._id_338A ) && !self._id_338A _id_5037( self ) )
            {
                _id_37B4();
                wait(randomfloatrange( 2.0, 4.0 ));
            }

            continue;
        }

        if ( isplayer( self._id_338A ) || isai( self._id_338A ) )
            _id_37B4();

        if ( isplayer( self._id_338A ) )
            thread _id_6B2E( self );

        common_scripts\utility::_id_A0A0( "damage_by_player", level._id_0E40 );
    }
}

_id_6B2E( var_0 )
{
    level notify( "player_is_heli_target" );
    level endon( "player_is_heli_target" );
    level._id_0E3A = 1;
    var_0 common_scripts\utility::_id_A0A0( "damage_by_player", level._id_0E3E );
    level._id_0E3A = 0;
}

_id_47A8()
{
    if ( !isdefined( self._id_338A ) )
        return 0;

    var_0 = self._id_338A.origin + ( 0, 0, 32 );

    if ( isplayer( self._id_338A ) )
        var_0 = self._id_338A geteye();

    var_1 = self gettagorigin( "tag_flash" );
    var_2 = sighttracepassed( var_1, var_0, 0, self );
    return var_2;
}

_id_47C9()
{
    if ( !isdefined( self._id_338A ) )
        return 0;

    if ( isplayer( self._id_338A ) )
        return 1;
    else
        return 0;
}

_id_47CA()
{
    if ( !isdefined( self._id_338A ) )
        return 0;

    if ( !isalive( self._id_338A ) )
        return 0;

    if ( self._id_338A == self._id_91C4 )
        return 0;
    else
        return 1;
}

_id_47C4()
{
    var_0 = _id_A53F::_id_3F7F( level._id_0E3F, level._id_0E39, 1, 1, 0, 1, level._id_0E38 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        var_0 = self._id_91C4;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_91C4;

    return var_0;
}

_id_47C6()
{
    var_0 = getaiarray( "allies" );
    var_1 = _id_A53F::_id_3F7F( level._id_0E3F, level._id_0E39, 1, 0, 0, 0, var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_91C4;

    return var_1;
}

_id_47C5()
{
    var_0 = _id_A53F::_id_3F7F( level._id_0E3F, level._id_0E39, 1, 1, 0, 1, level.players );

    if ( !isdefined( var_0 ) )
        var_0 = self._id_91C4;

    return var_0;
}

_id_47D5()
{
    if ( !isdefined( self._id_7A3A ) )
        return;

    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "stop_shooting" );
    var_0 = undefined;
    var_1 = "turret_attackheli";
    var_2 = "missile_attackheli";
    var_3 = undefined;
    var_4 = undefined;
    var_5 = [];

    switch ( self.visionsetnaked )
    {
        case "mi28":
            var_0 = 1;
            var_3 = 1;
            var_4 = 0.5;
            var_5[0] = "tag_store_L_2_a";
            var_5[1] = "tag_store_R_2_a";
            var_5[2] = "tag_store_L_2_b";
            var_5[3] = "tag_store_R_2_b";
            var_5[4] = "tag_store_L_2_c";
            var_5[5] = "tag_store_R_2_c";
            var_5[6] = "tag_store_L_2_d";
            var_5[7] = "tag_store_R_2_d";
            break;
        case "apache":
        case "littlebird":
            var_0 = 1;
            var_3 = 1;
            var_4 = 0.5;
            var_5[0] = "tag_missile_left";
            var_5[1] = "tag_missile_right";
            break;
        default:
            break;
    }

    var_6 = -1;

    for (;;)
    {
        wait 0.05;
        self waittill( "fire_missiles", var_7 );

        if ( !isplayer( var_7 ) )
            continue;

        var_8 = var_7;

        if ( !_id_6B6D( var_8 ) )
            continue;

        for ( var_9 = 0; var_9 < var_0; var_9++ )
        {
            var_6++;

            if ( var_6 >= var_5.size )
                var_6 = 0;

            self setvehweapon( var_2 );
            self._id_3805 = 1;
            var_10 = self fireweapon( var_5[var_6], var_8 );
            var_10 thread _id_5CBE( var_4 );
            var_10 thread _id_5C95();

            if ( var_9 < var_0 - 1 )
                wait(var_3);
        }

        self._id_3805 = 0;
        self setvehweapon( var_1 );
        wait 10;
    }
}

_id_6B6D( var_0 )
{
    if ( self._id_5F9E )
        return 0;
    else
        return 1;
}

_id_5C95()
{
    if ( distancesquared( self.origin, level.playercardbackground.origin ) > 9000000 )
        return;

    var_0 = self.origin;

    while ( isdefined( self ) )
    {
        var_0 = self.origin;
        wait 0.1;
    }

    earthquake( 0.7, 1.5, var_0, 1600 );
}

_id_5CBE( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    wait(var_0);

    if ( isdefined( self ) )
        self _meth_81de();
}

_id_3D3A( var_0 )
{
    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( var_0 != level.players[var_1] )
            return level.players[var_1];
    }

    return level.players[0];
}

_id_6200()
{
    self notify( "notify_disable_thread" );
    self endon( "notify_disable_thread" );
    self endon( "death" );
    self endon( "heli_players_dead" );

    for (;;)
    {
        self waittill( "disable_turret" );
        self._id_0AAF = 0;
    }
}

_id_6204()
{
    self notify( "notify_enable_thread" );
    self endon( "notify_enable_thread" );
    self endon( "death" );
    self endon( "heli_players_dead" );

    for (;;)
    {
        self waittill( "enable_turret" );
        self._id_0AAF = 1;
    }
}

_id_37B4()
{
    switch ( self._id_99C5 )
    {
        case "default":
            var_0 = randomintrange( 5, 10 );
            var_1 = weaponfiretime( "turret_attackheli" );
            _id_9954( self._id_338A, var_0, var_1 );
            break;
        case "miniguns":
            var_0 = _id_3F20( self._id_338A );

            if ( self._id_0AAF && !self._id_3805 )
                _id_9970( self._id_338A, var_0 );

            break;
        default:
            break;
    }
}

_id_3F20( var_0 )
{
    var_1 = undefined;

    if ( !isplayer( var_0 ) )
    {
        var_1 = level._id_0E37;
        return var_1;
    }

    switch ( level._id_3BFE )
    {
        case 0:
        case 1:
        case 2:
        case 3:
            var_1 = randomintrange( 2, 3 );
            break;
    }

    return var_1;
}

_id_37BB( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    wait(var_0);

    if ( !isplayer( self._id_338A ) )
        return;

    self notify( "fire_missiles", self._id_338A );
}

_id_9954( var_0, var_1, var_2 )
{
    thread _id_37BB( randomfloatrange( 0.2, 2 ) );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self setturrettargetent( var_0, common_scripts\utility::_id_712D( 50 ) + ( 0, 0, 32 ) );

        if ( self._id_0AAF && !self._id_3805 )
            self fireweapon();

        wait(var_2);
    }
}

_id_9970( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self notify( "firing_miniguns" );
    self endon( "firing_miniguns" );
    var_3 = _id_3EAA();
    common_scripts\utility::_id_0D13( var_3, ::_id_9971, var_0, self );

    if ( !self._id_5C71 )
    {
        self._id_3804 = 1;
        thread _id_A5A4::_id_69C5( "littlebird_gatling_spinup", "tag_flash" );
        wait 2.1;
        thread _id_A5A4::_id_6976( "littlebird_minigun_spinloop", "tag_flash" );
    }

    self._id_5C71 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 3;

    var_4 = 0.5;

    if ( var_4 > var_2 )
        var_4 = var_2;

    if ( var_4 > 0 )
        wait(randomfloatrange( var_4, var_2 ));

    _id_5C6C( var_0, var_1 );
    var_3 = _id_3EAA();
    common_scripts\utility::_id_0CDB( var_3, ::stopfiring );
    thread _id_5C6E( var_0 );
    self notify( "stopping_firing" );
}

_id_5C6C( var_0, var_1 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( isplayer( var_0 ) )
        self endon( "cant_see_player" );

    var_2 = _id_3EAA();
    common_scripts\utility::_id_0CDB( var_2, ::startfiring );
    wait(randomfloatrange( 1, 2 ));

    if ( isplayer( var_0 ) )
        thread _id_91BE( var_0 );

    if ( isplayer( var_0 ) )
    {
        var_3 = randomfloatrange( 0.5, 3 );
        thread _id_37BB( var_3 );
    }

    wait(var_1);
}

_id_91BE( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "stopping_firing" );
    self notify( "tracking_player" );
    self endon( "tracking_player" );

    for (;;)
    {
        if ( !_id_1A50( var_0 ) )
            break;

        wait 0.5;
    }

    wait(level._id_0E41);
    self notify( "cant_see_player" );
}

_id_9971( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "heli_players_dead" );
    self notify( "miniguns_have_new_target" );
    self endon( "miniguns_have_new_target" );

    if ( !isplayer( var_0 ) && isai( var_0 ) && level._id_0E3B == 0 )
    {
        var_2 = spawn( "script_origin", var_0.origin + ( 0, 0, 100 ) );
        var_2 linkto( var_0 );
        thread _id_5C6A( var_2 );
        var_0 = var_2;
    }

    for (;;)
    {
        wait 0.5;
        self settargetentity( var_0 );
    }
}

_id_5C6A( var_0 )
{
    common_scripts\utility::_id_A087( "death", "miniguns_have_new_target" );
    var_0 delete();
}

_id_5C6E( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "firing_miniguns" );

    if ( isplayer( var_0 ) )
        wait(randomfloatrange( 3, 4 ));
    else
        wait(randomfloatrange( 1, 2 ));

    thread _id_5C6F();
    self._id_3804 = 0;
}

_id_5C6F()
{
    self notify( "stop soundlittlebird_minigun_spinloop" );
    self._id_5C71 = 0;
    _id_A5A4::_id_69C5( "littlebird_gatling_cooldown", "tag_flash" );
}

_id_5C8A( var_0 )
{
    var_1 = anglestoforward( level.playercardbackground.angles );
    var_2 = var_1 * 400;
    var_3 = var_2 + common_scripts\utility::_id_712D( 50 );
    var_4 = randomintrange( 10, 20 );
    var_5 = weaponfiretime( "turret_attackheli" );

    for ( var_6 = 0; var_6 < var_4; var_6++ )
    {
        var_3 = var_2 + common_scripts\utility::_id_712D( 50 );
        self setturrettargetent( var_0, var_3 );

        if ( self._id_0AAF )
            self fireweapon();

        wait(var_5);
    }
}

_id_1A50( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = ( 0, 0, 0 );

    if ( isplayer( var_0 ) )
        var_2 = var_0 geteye();
    else
        var_2 = var_0.origin;

    if ( sighttracepassed( var_1, var_2, 0, undefined ) )
        return 1;
    else
        return 0;
}

_id_3DBF( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_6 = strtok( var_1._id_7A26, " " );

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        for ( var_8 = 0; var_8 < var_6.size; var_8++ )
        {
            if ( var_2[var_7].script_origin == var_6[var_8] )
                var_5[var_5.size] = var_2[var_7];
        }
    }

    foreach ( var_10 in var_5 )
    {
        if ( var_10.origin[2] < var_4[2] )
        {
            var_5 = common_scripts\utility::_id_0CF6( var_5, var_10 );
            continue;
        }
    }

    return var_5;
}

_id_47B1()
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "crashing" );
    self endon( "leaving" );
    self.damagetaken = 0;
    self._id_7C56 = undefined;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( var_1 ) || !isplayer( var_1 ) )
            continue;

        self notify( "damage_by_player" );
        thread _id_47B2();
        thread _id_1A4D( var_1 );

        if ( _id_A5A4::_id_5011() )
            var_1 thread _id_9B0D();

        if ( _id_A5A4::_id_5012() )
            var_1 thread _id_9B0E();
    }
}

_id_47B2()
{
    self notify( "taking damage" );
    self endon( "taking damage" );
    self endon( "death" );
    self endon( "heli_players_dead" );
    self._id_51C8 = 1;
    wait 1;
    self._id_51C8 = 0;
}

_id_1A4D( var_0 )
{
    self notify( "attacker_seen" );
    self endon( "attacker_seen" );
    self._id_7C56 = var_0;
    self._id_47CC = var_0;
    wait(level._id_0E3C);
    self._id_47CC = undefined;
    self._id_7C56 = undefined;
}

_id_5037( var_0 )
{
    if ( isdefined( var_0._id_7C56 ) )
    {
        if ( var_0._id_7C56 == self )
            return 0;
    }

    if ( isdefined( level._id_0E21 ) )
    {
        foreach ( var_2 in level._id_0E21 )
        {
            if ( self istouching( var_2 ) )
                return 1;
        }
    }

    return 0;
}

_id_9B0D()
{
    if ( !isplayer( self ) )
        return;

    self._id_4AB7 setshader( "damage_feedback", 24, 48 );
    self._id_4AB7.alpha = 1;
    self._id_4AB7 fadeovertime( 1 );
    self._id_4AB7.alpha = 0;
}

_id_9B0E()
{
    if ( !isplayer( self ) )
        return;

    self playlocalsound( "player_feedback_hit_alert" );
}

_id_257D()
{
    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        var_1 = level.players[var_0];
        var_1._id_4AB7 = newclienthudelem( var_1 );
        var_1._id_4AB7.hostquits = "center";
        var_1._id_4AB7.visionsetnight = "middle";
        var_1._id_4AB7.xpmaxmultipliertimeplayed = -12;
        var_1._id_4AB7._id_0538 = -12;
        var_1._id_4AB7.alpha = 0;
        var_1._id_4AB7.archived = 1;
        var_1._id_4AB7 setshader( "damage_feedback", 24, 48 );
    }
}

_id_47B3()
{
    self waittill( "death" );
    level notify( "attack_heli_destroyed" );
    level._id_324E = 1;
    wait 15;
    level._id_324D = 0;
}

_id_29EE( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "heli_players_dead" );
    wait 30;

    if ( !level._id_324D )
        return;

    _id_20BB( "co_cf_cmd_heli_small_fire" );

    if ( !level._id_324D )
        return;

    _id_20BB( "co_cf_cmd_rpg_stinger" );
    wait 30;

    if ( !level._id_324D )
        return;

    _id_20BB( "co_cf_cmd_heli_wonders" );
}

_id_20BB( var_0 )
{
    while ( level._id_20BC )
        wait 1;

    level._id_20BC = 1;
    level.playercardbackground playsound( var_0, "sounddone" );
    level.playercardbackground waittill( "sounddone" );
    wait 0.5;
    level._id_20BC = 0;
}

_id_9C2B()
{
    var_0 = self getcurrentweapon();

    if ( !isdefined( var_0 ) )
        return 0;

    if ( issubstr( tolower( var_0 ), "rpg" ) )
        return 1;

    if ( issubstr( tolower( var_0 ), "stinger" ) )
        return 1;

    if ( issubstr( tolower( var_0 ), "at4" ) )
        return 1;

    return 0;
}

_id_47E5( var_0 )
{
    common_scripts\utility::_id_A069( "death", "crash_done", "turn_off_spotlight" );
    self._id_8A85 = undefined;

    if ( isdefined( self ) )
        stopfxontag( common_scripts\utility::_id_3FA8( "_attack_heli_spotlight" ), self, var_0 );
}

_id_47E6( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    var_1 = self._id_91C4;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    var_1.teambalanced = "original_ent";
    self._id_5676 = spawn( "script_origin", var_1.origin );
    self._id_5676.origin = var_1.origin;
    self._id_5676.angles = var_1.angles;
    self._id_5676.teambalanced = "left_ent";
    self._id_751E = spawn( "script_origin", var_1.origin );
    self._id_751E.origin = var_1.origin;
    self._id_751E.angles = var_1.angles;
    self._id_751E.teambalanced = "right_ent";
    var_2 = spawnstruct();
    var_2.entity = self._id_5676;
    var_2.riotshield_damaged = 250;
    var_2 _id_A5A4::_id_9723();
    self._id_5676 linkto( self );
    var_3 = spawnstruct();
    var_3.entity = self._id_751E;
    var_3.riotshield_damaged = -250;
    var_3 _id_A5A4::_id_9723();
    self._id_751E linkto( self );
    var_4 = [];
    var_4[0] = var_1;
    var_4[1] = self._id_5676;
    var_4[2] = self._id_751E;
    level._id_8A86 = var_4;
    self._id_8A90 = var_1;
}

_id_47E7()
{
    if ( isdefined( level._id_8A86 ) )
    {
        foreach ( var_1 in level._id_8A86 )
        {
            if ( isdefined( var_1 ) )
                var_1 delete();
        }
    }
}

_id_47E3( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( self.visionsetnaked != "littlebird" )
        return;

    thread _id_47ED( var_0 );
    var_1 = undefined;

    for (;;)
    {
        wait 0.05;

        switch ( self.visionsetnaked )
        {
            case "littlebird":
            case "littlebird_spotlight":
                var_1 = self._id_8A90;
                break;
            default:
                var_1 = self._id_338A;
                break;
        }

        if ( isdefined( var_1 ) )
            self setturrettargetent( var_1, ( 0, 0, 0 ) );
    }
}

_id_47ED( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    _id_47E6();
    common_scripts\utility::_id_0D13( level._id_8A86, ::_id_47E4, self );

    if ( isdefined( var_0 ) )
        self thread [[ var_0 ]]();
    else
    {
        for (;;)
        {
            wait(randomfloatrange( 1, 3 ));

            if ( _id_47C9() && !_id_A34A() )
            {
                self._id_8A90 = self._id_338A;
                continue;
            }

            var_1 = randomint( level._id_8A86.size );
            self._id_91C4 = level._id_8A86[var_1];
            self._id_8A90 = self._id_91C4;
        }
    }
}

_id_A34A()
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( !isdefined( self._id_338A ) )
        return 0;

    if ( !isplayer( self._id_338A ) )
        return 0;

    var_0 = self._id_338A;
    var_1 = common_scripts\utility::_id_A347( var_0 geteye(), var_0 getplayerangles(), self.origin, level._id_2235["35"] );
    return var_1;
}

_id_47E4( var_0 )
{
    var_0 common_scripts\utility::_id_A087( "death", "crash_done" );

    if ( isdefined( self ) )
        self delete();
}

_id_57B6( var_0 )
{
    var_1 = self;
    var_1 _id_A5AA::_id_9985( "manual" );

    if ( isdefined( var_0._id_91C4 ) )
        var_1 settargetentity( var_0._id_91C4 );

    var_1 setmode( "manual" );
    var_0 waittill( "death" );

    if ( isdefined( var_0._id_3804 ) && var_0._id_3804 == 1 )
        thread _id_5C6F();
}

_id_0E1F()
{
    common_scripts\utility::_id_A087( "death", "crash_done" );

    if ( isdefined( self._id_0E54 ) )
        missile_deleteattractor( self._id_0E54 );

    if ( isdefined( self._id_0E55 ) )
        missile_deleteattractor( self._id_0E55 );
}

_id_47B5( var_0 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "stop_default_heli_missiles" );
    self._id_6EF5 = undefined;

    while ( isdefined( self ) )
    {
        wait 0.05;
        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        self._id_6EF5 = undefined;
        var_4 = undefined;

        if ( isdefined( self._id_251D ) && isdefined( self._id_251D._not_team ) )
            var_4 = _id_A5A4::_id_3F82( self._id_251D._not_team, "targetname" );

        if ( isdefined( var_4 ) && isdefined( var_4._id_7A26 ) )
            self._id_6EF5 = _id_A5A4::_id_3F82( var_4._id_7A26, "script_linkname" );

        if ( isdefined( self._id_6EF5 ) )
        {
            var_1 = self._id_6EF5;
            var_2 = var_1._id_7AC2;
            var_3 = var_1.script_lightset;
            var_4 waittill( "trigger" );
        }
        else
            common_scripts\utility::_id_A069( "near_goal", "goal" );

        if ( isdefined( var_1 ) )
            thread _id_47BD( var_1, var_2, var_3, var_0 );
    }
}

_id_47B4()
{
    self notify( "stop_default_heli_missiles" );
}

_id_47EA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "tag_barrel";

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    playfxontag( common_scripts\utility::_id_3FA8( "_attack_heli_spotlight" ), self, var_0 );
    self._id_8A85 = 1;
    thread _id_47E5( var_0 );

    if ( var_2 )
        self setturrettargetent( level.playercardbackground );
    else if ( var_1 )
    {
        self endon( "death" );
        self endon( "heli_players_dead" );
        var_3 = self gettagorigin( "tag_origin" );

        if ( !isdefined( self._id_91C4 ) )
            _id_47B7();

        self setturrettargetent( self._id_91C4 );
        thread _id_47E3();
    }
}

_id_47E9()
{
    self notify( "turn_off_spotlight" );
}

_id_47EC()
{
    self endon( "death" );
    self endon( "heli_players_dead" );
    self endon( "stop_spotlight_random_targets" );

    if ( !isdefined( self._id_91C4 ) )
        thread _id_47B7();

    if ( !isdefined( self._id_5676 ) )
        thread _id_47ED();

    while ( isdefined( self ) )
    {
        wait 0.05;
        self setturrettargetent( self._id_91C4, ( 0, 0, 0 ) );
    }
}

_id_47EB()
{
    self notify( "stop_spotlight_random_targets" );
}

_id_47BD( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( isdefined( self._id_27A2 ) )
        var_4 = self._id_27A2;
    else
        var_4 = "turret_attackheli";

    var_5 = "missile_attackheli";

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    var_6 = undefined;
    var_7 = [];
    self setvehweapon( var_4 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_0.classname ) )
    {
        if ( !isdefined( self._id_2FC5 ) )
        {
            self._id_2FC5 = spawn( "script_origin", var_0.origin );
            thread common_scripts\utility::_id_2825( self._id_2FC5 );
        }

        self._id_2FC5.origin = var_0.origin;
        var_0 = self._id_2FC5;
    }

    switch ( self.visionsetnaked )
    {
        case "mi28":
            var_6 = 0.5;
            var_7[0] = "tag_store_L_2_a";
            var_7[1] = "tag_store_R_2_a";
            var_7[2] = "tag_store_L_2_b";
            var_7[3] = "tag_store_R_2_b";
            var_7[4] = "tag_store_L_2_c";
            var_7[5] = "tag_store_R_2_c";
            var_7[6] = "tag_store_L_2_d";
            var_7[7] = "tag_store_R_2_d";
            break;
        case "apache":
        case "littlebird":
            var_6 = 0.5;
            var_7[0] = "tag_missile_left";
            var_7[1] = "tag_missile_right";
            break;
        case "hind_battle":
            var_7[0] = "tag_missile_left";
            var_7[1] = "tag_missile_right";
            break;
        default:
            break;
    }

    var_8 = -1;

    for ( var_9 = 0; var_9 < var_1; var_9++ )
    {
        var_8++;

        if ( var_8 >= var_7.size )
            var_8 = 0;

        self setvehweapon( var_5 );
        self._id_3805 = 1;
        var_10 = self fireweapon( var_7[var_8], var_0 );
        var_10 thread _id_5C95();

        if ( var_9 < var_1 - 1 )
            wait(var_2);
    }

    self._id_3805 = 0;
    self setvehweapon( var_4 );
}

_id_1563()
{
    self waittill( "trigger", var_0 );
    var_1 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );
    var_1 = _id_A5A4::_id_0CEC( var_1 );
    _id_1562( var_0, var_1 );
}

_id_1564()
{
    self waittill( "trigger", var_0 );
    var_1 = _id_A5A4::_id_3DC0();
    var_1 = _id_A5A4::_id_0CEC( var_1 );
    _id_1562( var_0, var_1 );
}

_id_1562( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = "tag_missile_right";
    var_2[1] = "tag_missile_left";

    if ( var_0.visionsetnaked == "cobra" )
    {
        var_2[0] = "tag_store_L_1_a";
        var_2[1] = "tag_store_R_1_a";
    }

    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_3[var_4] = spawn( "script_origin", var_1[var_4].origin );
        var_0 setvehweapon( "littlebird_FFAR" );
        var_0 setturrettargetent( var_3[var_4] );
        var_5 = var_0 fireweapon( var_2[var_4 % var_2.size], var_3[var_4], ( 0, 0, 0 ) );
        var_5 common_scripts\utility::_id_27CD( 1, ::_meth_81de );
        wait(randomfloatrange( 0.2, 0.3 ));
    }

    wait 2;

    foreach ( var_7 in var_3 )
        var_7 delete();
}
