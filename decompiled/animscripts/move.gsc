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
#using_animtree("generic_human");

_id_4C88()
{
    var_0 = [];
    var_0["fire"] = %exposed_shoot_auto_v3;
    var_0["single"] = [ %exposed_shoot_semi1 ];
    var_0["single_shotgun"] = [ %shotgun_stand_fire_1a, %shotgun_stand_fire_1b ];
    var_0["burst2"] = %exposed_shoot_burst3;
    var_0["burst3"] = %exposed_shoot_burst3;
    var_0["burst4"] = %exposed_shoot_burst4;
    var_0["burst5"] = %exposed_shoot_burst5;
    var_0["burst6"] = %exposed_shoot_burst6;
    var_0["semi2"] = %exposed_shoot_semi2;
    var_0["semi3"] = %exposed_shoot_semi3;
    var_0["semi4"] = %exposed_shoot_semi4;
    var_0["semi5"] = %exposed_shoot_semi5;
    anim._id_0CCA["soldier"]["shoot_while_moving"] = var_0;
    var_0 = [];
    var_0["shuffle_start_from_cover_left"] = %cornercrl_alert_2_shuffle;
    var_0["shuffle_start_from_cover_right"] = %cornercrr_alert_2_shuffle;
    var_0["shuffle_start_left"] = %covercrouch_hide_2_shufflel;
    var_0["shuffle_start_right"] = %covercrouch_hide_2_shuffler;
    var_0["shuffle_to_cover_left"] = %covercrouch_shufflel;
    var_0["shuffle_end_to_cover_left"] = %cornercrl_shuffle_2_alert;
    var_0["shuffle_to_cover_right"] = %covercrouch_shuffler;
    var_0["shuffle_end_to_cover_right"] = %cornercrr_shuffle_2_alert;
    var_0["shuffle_start_left_stand_to_stand"] = %coverstand_hide_2_shufflel;
    var_0["shuffle_left_stand_to_stand"] = %coverstand_shufflel;
    var_0["shuffle_end_left_stand_to_stand"] = %coverstand_shufflel_2_hide;
    var_0["shuffle_start_right_stand_to_stand"] = %coverstand_hide_2_shuffler;
    var_0["shuffle_right_stand_to_stand"] = %coverstand_shuffler;
    var_0["shuffle_end_right_stand_to_stand"] = %coverstand_shuffler_2_hide;
    var_0["shuffle_to_left_crouch"] = %covercrouch_shufflel;
    var_0["shuffle_end_to_left_stand"] = %coverstand_shufflel_2_hide;
    var_0["shuffle_end_to_left_crouch"] = %covercrouch_shufflel_2_hide;
    var_0["shuffle_to_right_crouch"] = %covercrouch_shuffler;
    var_0["shuffle_end_to_right_stand"] = %coverstand_shuffler_2_hide;
    var_0["shuffle_end_to_right_crouch"] = %covercrouch_shuffler_2_hide;
    anim._id_0CCA["soldier"]["shuffle"] = var_0;
}

_id_4CAC()
{
    var_0 = [];
    var_0["fire"] = %smg_exposed_shoot_auto_v3;
    var_0["single"] = [ %smg_exposed_shoot_semi1 ];
    var_0["single_shotgun"] = [ %shotgun_stand_fire_1a, %shotgun_stand_fire_1b ];
    var_0["burst2"] = %smg_exposed_shoot_burst3;
    var_0["burst3"] = %smg_exposed_shoot_burst3;
    var_0["burst4"] = %smg_exposed_shoot_burst4;
    var_0["burst5"] = %smg_exposed_shoot_burst5;
    var_0["burst6"] = %smg_exposed_shoot_burst6;
    var_0["semi2"] = %smg_exposed_shoot_semi2;
    var_0["semi3"] = %smg_exposed_shoot_semi3;
    var_0["semi4"] = %smg_exposed_shoot_semi4;
    var_0["semi5"] = %smg_exposed_shoot_semi5;
    anim._id_0CCA["soldier"]["smg_shoot_while_moving"] = var_0;
}

main()
{
    if ( isdefined( self._id_2533 ) )
    {
        if ( isdefined( self._id_2533["move"] ) )
        {
            [[ self._id_2533["move"] ]]();
            return;
        }
    }

    self endon( "killanimscript" );
    [[ self._id_33E5["move"] ]]();
    var_0 = ::_id_66D9;

    if ( isdefined( self._id_66D8 ) )
        var_0 = self._id_66D8;

    self thread [[ var_0 ]]();
    self.movetransitionanimation = undefined;
    self.movetransitionendpose = undefined;
    _id_5F53();
    _id_414A();
    animscripts\utility::_id_4DD7( "move" );
    var_1 = _id_A1CF();

    if ( var_1 && isdefined( self._id_8547 ) )
    {
        pathchange_ignoreearlyturns();
        _id_5F48();
        _id_5F4B();
    }
    else if ( isdefined( self._id_132D ) && self._id_132D )
    {
        var_2 = var_1;
        _id_5F7D( var_2 );
        animscripts\battlechatter::_id_6A2E();
    }

    if ( animscripts\stairs_utility::using_h1_stairs_system() )
        thread animscripts\stairs_utility::lookaheadhitstairslistener();

    thread _id_0C6A();
    var_3 = animscripts\utility::using_exit_node_to_cover_arrival_early_out();

    if ( var_3 )
        thread waittolistenforcoverapproach();

    animscripts\exit_node::_id_8D2E();
    self._id_2CE8 = undefined;
    self._id_4BB7 = undefined;
    pathchange_readytoturn();
    thread _id_8D40();

    if ( var_3 )
        self notify( "StartListeningForCoverApproach" );
    else
        _id_57A3();

    self._id_83E7 = undefined;
    self._id_0972 = undefined;
    self._id_76D6 = undefined;

    if ( !isdefined( self.h1_melee_animations_enabled ) )
        self.h1_melee_animations_enabled = 1;

    _id_5F57( 1 );
}

end_script()
{
    if ( isdefined( self._id_63D1 ) )
    {
        self.groundentchanged = self._id_63D1;
        self._id_63D1 = undefined;
    }

    self._id_91F1 = undefined;
    self._id_5C7A = undefined;
    self._id_4BB7 = undefined;
    self._id_8547 = undefined;
    self._id_8549 = undefined;
    self._id_76D6 = undefined;
    self._id_717B = undefined;
    self._id_7409 = undefined;
    self._id_2513 = undefined;
    self._id_5F56 = undefined;
    animscripts\run::_id_800D( 0 );

    if ( self.tactical )
        animscripts\swim::_id_9046();

    self _meth_8144( %head, 0.2 );
    self._id_35C7 = undefined;
}

_id_5F53()
{
    self._id_717B = undefined;
    self._id_7409 = undefined;
    self._id_9AC9 = undefined;
    self._id_9ACA = undefined;
    self._id_76DA = 0;
    self._id_0D28 = undefined;
}

_id_414A( var_0 )
{
    if ( self.a._id_6E5A == "prone" )
    {
        var_1 = animscripts\utility::_id_1D45( "stand" );

        if ( var_1 != "prone" )
        {
            self _meth_8193( "face current" );
            self _meth_8192( "zonly_physics", 0 );
            var_2 = 1;

            if ( isdefined( self.grenade ) )
                var_2 = 2;

            animscripts\cover_prone::_id_702B( var_1, var_2, var_0 );
            self _meth_8192( "none", 0 );
            self _meth_8193( "face default" );
            self notify( "stop_move_anim_update" );
            self.a._id_5F5B = "stop";
            self._id_9AC9 = undefined;
        }
    }
}

_id_A1CF()
{
    switch ( self.primaryattachment2 )
    {
        case "cover_crouch":
        case "cover_stand":
        case "hide":
        case "turret":
        case "cover_left":
        case "cover_right":
        case "cover_prone":
        case "cover_multi":
        case "cover_swim_left":
        case "cover_swim_right":
        case "cover_wide_left":
        case "cover_wide_right":
        case "concealment_crouch":
        case "concealment_prone":
        case "concealment_stand":
            return 1;
    }

    return 0;
}

_id_5F7D( var_0 )
{
    if ( self.mw3prestige == "run" )
        animscripts\battlechatter_ai::_id_33B5( var_0 );
}

_id_5F57( var_0 )
{
    _id_5F58( var_0 );
    self notify( "abort_reload" );
}

_id_0CC8()
{
    if ( isdefined( self._id_0C4D ) && self._id_0C4D != self._id_6F6E )
        return 1;
    else if ( !isdefined( self._id_0C4D ) && self._id_6F6E != "none" )
        return 1;

    return 0;
}

_id_9B3C( var_0 )
{
    if ( var_0 != self._id_6F6F || _id_0CC8() )
    {
        if ( isdefined( self._id_2563 ) && isdefined( self._id_2563[var_0] ) )
            self.a._id_5F43 = self._id_2563[var_0];
        else
        {
            self.a._id_5F43 = animscripts\utility::_id_5864( var_0 );

            if ( ( self.combatmode == "ambush" || self.combatmode == "ambush_nodes_only" ) && ( isdefined( self.pc ) && distancesquared( self.origin, self.pc ) > squared( 100 ) ) )
            {
                self._id_855F = 1;
                animscripts\animset::_id_7DBA();
            }
            else
                self._id_855F = 1.35;
        }

        self._id_6F6F = var_0;

        if ( isdefined( self._id_0C4D ) )
            self._id_6F6E = self._id_0C4D;
    }
}

_id_5F58( var_0 )
{
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    var_1 = self _meth_8151( %walk_and_run_loops );
    self.a._id_76D4 = randomint( 10000 );
    self._id_6F6F = "none";
    self._id_6F6E = "none";
    self._id_5F55 = undefined;

    for (;;)
    {
        var_2 = self _meth_8151( %walk_and_run_loops );

        if ( var_2 < var_1 )
            self.a._id_76D4++;

        var_1 = var_2;
        var_3 = self.mw3prestige;

        if ( isdefined( self.overridemovemode ) )
            var_3 = self.overridemovemode;

        _id_9B3C( var_3 );

        if ( isdefined( self._id_5F5A ) )
            self [[ self._id_5F5A ]]( var_3 );
        else
            _id_5F59( var_3 );

        if ( isdefined( self._id_5F55 ) )
        {
            self [[ self._id_5F55 ]]();
            self._id_5F55 = undefined;
        }

        self notify( "abort_reload" );
    }
}

_id_72E5( var_0 )
{
    self._id_6DF5 = var_0;
}

_id_1ECD()
{
    self._id_6DF5 = undefined;
}

_id_5F59( var_0 )
{
    self endon( "move_loop_restart" );
    animscripts\face::_id_7F90( anim._id_09D2 );

    if ( animscripts\run::_id_5F06() )
        return;

    if ( isdefined( self._id_5F56 ) )
        self [[ self._id_5F56 ]]();
    else if ( isdefined( self._id_6DF5 ) )
        self [[ self._id_6DF5 ]]();
    else if ( animscripts\utility::_id_848B() )
        animscripts\cqb::_id_5F4C();
    else if ( self.tactical )
        animscripts\swim::_id_5F80();
    else if ( var_0 == "run" )
        animscripts\run::_id_5F70();
    else
        animscripts\walk::_id_5F9C();

    self._id_7409 = undefined;
}

_id_5A61()
{
    if ( self.weapon_switch_invalid == "none" )
        return 0;

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
    {
        if ( self.mw3prestige == "run" )
            return 0;
    }

    var_0 = weaponclass( self.weapon_switch_invalid );

    if ( !animscripts\utility::_id_9C35() )
        return 0;

    if ( animscripts\combat_utility::issniper() )
    {
        if ( !animscripts\utility::_id_50E9() && self.facemotion )
            return 0;
    }

    if ( isdefined( self._id_2D3B ) )
        return 0;

    return 1;
}

_id_841B()
{
    self endon( "killanimscript" );
    self notify( "doing_shootWhileMoving" );
    self endon( "doing_shootWhileMoving" );
    var_0 = animscripts\utility::_id_5864( "shoot_while_moving" );

    if ( animscripts\utility::_id_9C3B() )
        var_0 = animscripts\utility::_id_5864( "smg_shoot_while_moving" );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3, var_2 in var_0 )
            self.a._id_0CD8[var_3] = var_2;
    }

    if ( isdefined( self._id_20B3 ) && isdefined( self._id_20B3["fire"] ) )
        self.a._id_0CD8["fire"] = self._id_20B3["fire"];

    if ( isdefined( self.weapon_switch_invalid ) && animscripts\utility::_id_A2CF() )
        self.a._id_0CD8["single"] = animscripts\utility::_id_5863( "shotgun_stand", "single" );

    for (;;)
    {
        if ( !self._id_18B0 )
        {
            if ( animscripts\utility::_id_50EA() )
            {
                self._id_0B78 = 0;
                animscripts\combat_utility::_id_1CAE();
            }

            if ( !self._id_18B0 )
            {
                wait 0.5;
                continue;
            }
        }

        animscripts\combat_utility::_id_8417();
        self _meth_8144( %exposed_aiming, 0.2 );
    }
}

_id_8D40()
{
    self endon( "killanimscript" );
    wait 0.05;
    thread _id_18B2();

    if ( getdvarint( "ai_canMeleeWhilstMoving", 0 ) )
        thread _id_5B80();

    thread animscripts\door::_id_4C46();
}

_id_7490( var_0 )
{
    self endon( "killanimscript" );

    if ( !var_0 )
        animscripts\exit_node::_id_8D2E();

    self._id_4BB7 = undefined;
    self _meth_8144( %animscript_root, 0.1 );
    self _meth_8193( "face default" );
    self _meth_8192( "none", 0 );
    self.requirement_beat50waves = 1;
    _id_5F57( !var_0 );
}

pathchange_readytoturn()
{
    self.readyforpathchange = 1;
    self notify( "ready_for_path_change" );
}

pathchange_ignoreearlyturns()
{
    self.ignoreearlypathchange = 1;
}

_id_66D9()
{
    self endon( "killanimscript" );
    self endon( "move_interrupt" );

    if ( isdefined( level.h1_turn_animations_enabled ) && !level.h1_turn_animations_enabled )
        return;

    self.readyforpathchange = 0;
    self.ignoreearlypathchange = getdvarint( "ai_turnAnim_handleEarlyNotifies", 1 ) == 0;
    self.turret_no_vis = 0;

    for (;;)
    {
        self waittill( "path_changed", var_0, var_1, var_2 );

        if ( !self.readyforpathchange )
        {
            if ( self.ignoreearlypathchange )
                continue;

            self waittill( "ready_for_path_change" );

            if ( self.ignoreearlypathchange )
                continue;
        }

        if ( isdefined( self._id_4BB7 ) || isdefined( self._id_623F ) )
            continue;

        if ( isdefined( var_0 ) && var_0 )
            continue;

        if ( !self.facemotion && !self _meth_8195() )
        {
            if ( !isdefined( self._id_5A7A ) )
                continue;
        }

        if ( self.a._id_6E5A != "stand" )
            continue;

        self notify( "stop_move_anim_update" );
        self._id_9AC9 = undefined;
        var_3 = vectortoangles( var_1 );
        var_4 = angleclamp180( self.angles[1] - var_3[1] );
        var_5 = angleclamp180( self.angles[0] - var_3[0] );
        var_6 = _id_66D7( var_4, var_5 );

        if ( isdefined( var_6 ) )
        {
            self._id_992D = var_6;
            self._id_993B = gettime();
            self._id_5F56 = ::_id_66D6;
            self notify( "move_loop_restart" );
            animscripts\run::_id_315D();
        }
    }
}

getturnaniminfo()
{
    var_0 = 0;

    if ( self.tactical )
        var_1 = animscripts\swim::_id_4100( "turn" );
    else if ( animscripts\utility::_id_51DE() )
        var_1 = animscripts\utility::_id_5864( "unstable_run_turn" );
    else if ( isdefined( self.canpatrolturn ) && self.canpatrolturn && maps\_patrol::is_patrolling() )
    {
        if ( isdefined( self.leftfootdown ) && self.leftfootdown )
        {
            var_1[1] = level._id_78AC["generic"]["patrol_turn_l135_rfoot"];
            var_1[2] = level._id_78AC["generic"]["patrol_turn_l90_rfoot"];
            var_1[3] = level._id_78AC["generic"]["patrol_turn_l45_rfoot"];
            var_1[5] = level._id_78AC["generic"]["patrol_turn_r45_rfoot"];
            var_1[6] = level._id_78AC["generic"]["patrol_turn_r90_rfoot"];
            var_1[7] = level._id_78AC["generic"]["patrol_turn_r135_rfoot"];
        }
        else
        {
            var_1[1] = level._id_78AC["generic"]["patrol_turn_l135_lfoot"];
            var_1[2] = level._id_78AC["generic"]["patrol_turn_l90_lfoot"];
            var_1[3] = level._id_78AC["generic"]["patrol_turn_l45_lfoot"];
            var_1[5] = level._id_78AC["generic"]["patrol_turn_r45_lfoot"];
            var_1[6] = level._id_78AC["generic"]["patrol_turn_r90_lfoot"];
            var_1[7] = level._id_78AC["generic"]["patrol_turn_r135_lfoot"];
        }

        var_0 = 0;
    }
    else if ( self.mw3prestige == "walk" )
    {
        var_2 = "cqb_turn";
        var_0 = 1;

        if ( isdefined( self._id_0C4D ) && isdefined( anim._id_0CCA[self._id_0C4D]["walk_turn"] ) || isdefined( anim._id_0CCA["soldier"]["walk_turn"] ) )
        {
            var_2 = "walk_turn";
            var_0 = 0;
        }

        var_1 = animscripts\utility::_id_5864( var_2 );
    }
    else if ( animscripts\utility::_id_848B() )
    {
        var_1 = animscripts\utility::_id_5864( "cqb_run_turn" );
        var_0 = 1;
    }
    else if ( animscripts\utility::_id_9C3B() )
        var_1 = animscripts\utility::_id_5864( "smg_run_turn" );
    else
        var_1 = animscripts\utility::_id_5864( "run_turn" );

    var_3["animArray"] = var_1;
    var_3["isCQB"] = var_0;
    return var_3;
}

_id_66D7( var_0, var_1 )
{
    if ( isdefined( self._id_66F5 ) )
        return [[ self._id_66F5 ]]( var_0, var_1 );

    var_2 = undefined;
    var_3 = undefined;
    var_4 = getturnaniminfo();
    var_5 = var_4["animArray"];
    var_6 = var_4["isCQB"];

    if ( animscripts\utility::using_tight_turn_anims() )
        var_7 = 22.5;
    else
        var_7 = 10;

    var_8 = var_6 && animscripts\utility::using_cqb_tight_turn_20();

    if ( var_0 < 0 )
    {
        if ( !var_8 && var_0 > -45 + var_7 )
            return undefined;
        else if ( var_0 > -32.5 && var_8 )
            var_9 = 9;
        else
            var_9 = int( ceil( ( var_0 + 180 - var_7 ) / 45 ) );
    }
    else if ( !var_8 && var_0 < 45 - var_7 )
        return undefined;
    else if ( var_0 < 32.5 - var_7 && var_8 )
        var_9 = 10;
    else
        var_9 = int( floor( ( var_0 + 180 + var_7 ) / 45 ) );

    var_2 = var_5[var_9];

    if ( isdefined( var_2 ) )
    {
        if ( isarray( var_2 ) )
        {
            while ( var_2.size > 0 )
            {
                var_10 = randomint( var_2.size );

                if ( _id_66D4( var_2[var_10] ) )
                    return var_2[var_10];

                var_2[var_10] = var_2[var_2.size - 1];
                var_2[var_2.size - 1] = undefined;
            }
        }
        else if ( _id_66D4( var_2 ) )
            return var_2;
    }

    var_11 = -1;

    if ( var_0 < -60 )
    {
        var_11 = int( ceil( ( var_0 + 180 ) / 45 ) );

        if ( var_11 == var_9 )
            var_11 = var_9 - 1;
    }
    else if ( var_0 > 60 )
    {
        var_11 = int( floor( ( var_0 + 180 ) / 45 ) );

        if ( var_11 == var_9 )
            var_11 = var_9 + 1;
    }

    if ( var_11 >= 0 && var_11 < 9 )
        var_3 = var_5[var_11];

    if ( isdefined( var_3 ) )
    {
        if ( isarray( var_3 ) )
            var_3 = var_3[0];

        if ( _id_66D4( var_3 ) )
            return var_3;
    }

    return undefined;
}

_id_66D4( var_0 )
{
    if ( !isdefined( self.pc ) )
        return 0;

    var_1 = getnotetracktimes( var_0, "code_move" );

    if ( var_1.size <= 0 )
    {

    }

    var_2 = var_1[0];
    var_3 = getmovedelta( var_0, 0, var_2 );
    var_4 = self localtoworldcoords( var_3 );

    if ( isdefined( self._id_0D28 ) && squared( self._id_0D28 ) > distancesquared( self.pc, var_4 ) )
        return 0;

    var_3 = getmovedelta( var_0, 0, 1 );
    var_5 = self localtoworldcoords( var_3 );
    var_5 = var_4 + vectornormalize( var_5 - var_4 ) * 20;
    var_6 = !self.tactical;
    var_7 = self _meth_81c8( var_4, var_5, var_6, 1 );
    var_8 = !animscripts\utility::using_tight_turn_anims() && getdvarint( "ai_turnAnim_checkFullTrace", 0 );

    if ( !var_7 || !var_8 )
        return var_7;

    var_9 = var_4;
    var_10 = getnotetracktimes( var_0, "align" );

    if ( var_10.size > 0 )
    {
        var_3 = getmovedelta( var_0, 0, var_10[0] );
        var_11 = self localtoworldcoords( var_3 );
        var_7 = self _meth_81c8( var_11, var_4, var_6, 1 );

        if ( !var_7 )
            return 0;

        var_9 = var_11;
    }
    else
    {

    }

    var_7 = self _meth_81c8( self.origin, var_9, var_6, 1 );
    return var_7;
}

_id_66D6()
{
    self endon( "killanimscript" );
    self endon( "should_stairs_transition" );
    self._id_5F56 = undefined;
    var_0 = self._id_992D;

    if ( gettime() > self._id_993B + 50 )
        return;

    if ( self.tactical )
        self _meth_8192( "nogravity", 0 );
    else
        self _meth_8192( "zonly_physics", 0 );

    var_1 = 0.1;

    if ( isdefined( self._id_66F4 ) )
        var_1 = self._id_66F4;

    self _meth_8144( %body, var_1 );
    self._id_5F55 = ::_id_66D5;
    self._id_4BB7 = 1;
    var_1 = 0.05;

    if ( self _meth_8152( %cornercrl_trans_out_mf ) > 0.5 )
        var_1 = 0.2;

    if ( isdefined( self._id_66F4 ) )
        var_1 = self._id_66F4;

    self notify( "turn_start" );
    self.turret_no_vis = 1;
    self setflaggedanimrestart( "turnAnim", var_0, 1, var_1, self._id_5F65 );

    if ( animscripts\utility::_id_51B0() )
        self _meth_8193( "face angle 3d", self.angles );
    else
        self _meth_8193( "face angle", self.angles[1] );

    if ( isdefined( self._id_2FF3 ) )
        childthread _id_595D( var_0, 1, "code_move" );

    if ( var_0 == %run_tight_turn_r90 || var_0 == %run_tight_turn_l90 )
        var_2 = 0.3;
    else
        var_2 = 0.1;

    if ( animscripts\stairs_utility::isonstairs() )
        var_3 = 0.2;
    else
        var_3 = 0.05;

    maps\_utility::_id_27CF( var_3, animscripts\stairs_utility::threadcheckstairstransition, var_0, 0, var_2, undefined, "inOnly" );
    animscripts\shared::_id_2D06( "turnAnim" );
    self.turret_no_vis = 0;
    self._id_4BB7 = undefined;
    self _meth_8193( "face motion" );
    self _meth_8192( "none", 0 );
    animscripts\shared::_id_2D06( "turnAnim" );
    self notify( "turn_end" );
    self notify( "killThreadCheckStairsTransition" );
}

_id_3F45()
{
    var_0 = self _meth_84eb();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1]["animation"] == %combatrun_forward )
        {
            if ( var_0[var_1 + 1].size > 2 )
                return var_0[var_1 + 1];
            else
                return undefined;
        }
    }

    return undefined;
}

_id_595D( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = 45;
    var_4 = getnotetracktimes( var_0, var_2 );
    var_5 = self.origin;
    var_6 = self.angles;
    var_5 = getstartorigin( var_5, var_6, var_0 );
    var_6 = getstartangles( var_5, var_6, var_0 );
    var_7 = getanimlength( var_0 ) * var_4[0];
    var_8 = int( maps\_utility::_id_7612( var_7 * 20, 0, 0 ) );

    if ( var_8 < 1 )
        return;

    var_9 = 1.0 / var_8;
    var_10 = 0;
    var_11 = self.origin;

    for (;;)
    {
        var_12 = var_10 * var_9;
        var_13 = 1.0 - ( var_8 * var_9 - var_12 );
        var_10++;

        if ( !isdefined( self._id_4BB7 ) && var_1 || var_12 > 1.0 )
            break;

        var_14 = getmovedelta( var_0, 0, var_12 );
        var_15 = getangledelta3d( var_0, 0, var_12 );
        var_16 = transformmove( var_5, var_6, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_14, var_15 );
        var_17 = var_16["origin"];
        var_18 = var_16["angles"];
        var_19 = self.lookforward;
        var_20 = vectortoangles( self.lookforward )[1];
        var_21 = var_18[1];
        var_22 = angleclamp180( var_20 - var_21 );
        var_23 = var_22 * var_13;
        var_23 = abs( clamp( var_23, -1 * var_3, var_3 ) );
        var_19 = vectorlerp( anglestoforward( var_18 ), self.lookforward, var_23 / var_3 * var_13 );
        self _meth_8193( "face direction", var_19 );
        waittillframeend;
    }
}

_id_66D5()
{
    self._id_4BB7 = undefined;
    self.turret_no_vis = 0;
    self _meth_8193( "face default" );
    var_0 = [[ self._id_1D46 ]]();
    var_1 = 0.1;

    if ( var_0 != "stand" )
        var_1 = 0.4;

    self _meth_8144( %animscript_root, var_1 );
    self _meth_8192( "none", 0 );

    if ( self.tactical )
        animscripts\swim::_id_9033();
}

_id_2C2D()
{
    self _meth_81a7( 1 );
    self _meth_8192( "zonly_physics", 0 );
    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "dodgeAnim", self._id_2513, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dodgeAnim" );
    self _meth_8192( "none", 0 );
    self _meth_8193( "face default" );

    if ( animhasnotetrack( self._id_2513, "code_move" ) )
        animscripts\shared::_id_2D06( "dodgeAnim" );

    self _meth_8144( %civilian_dodge, 0.2 );
    self _meth_81a7( 0 );
    self._id_2513 = undefined;
    self._id_5F56 = undefined;
    return 1;
}

_id_9899( var_0, var_1 )
{
    var_2 = ( self.lookforward[1], -1 * self.lookforward[0], 0 );
    var_3 = self.lookforward * var_1[0];
    var_4 = var_2 * var_1[1];
    var_5 = self.origin + var_3 - var_4;
    self _meth_81a7( 1 );

    if ( self _meth_81c7( var_5 ) )
    {
        self._id_2513 = var_0;
        self._id_5F56 = ::_id_2C2D;
        self notify( "move_loop_restart" );
        return 1;
    }

    self _meth_81a7( 0 );
    return 0;
}

_id_0C6A()
{
    if ( !isdefined( self._id_2C2A ) || !isdefined( self._id_2C2E ) )
        return;

    self endon( "killanimscript" );
    self endon( "move_interrupt" );

    for (;;)
    {
        self waittill( "path_need_dodge", var_0, var_1 );
        animscripts\utility::_id_9B2B();

        if ( animscripts\utility::_id_5124() )
        {
            self.noncombat = 0;
            return;
        }

        if ( !issentient( var_0 ) )
            continue;

        var_2 = vectornormalize( var_1 - self.origin );

        if ( self.lookforward[0] * var_2[1] - var_2[0] * self.lookforward[1] > 0 )
        {
            if ( !_id_9899( self._id_2C2E, self._id_2C2F ) )
                _id_9899( self._id_2C2A, self._id_2C2B );
        }
        else if ( !_id_9899( self._id_2C2A, self._id_2C2B ) )
            _id_9899( self._id_2C2E, self._id_2C2F );

        if ( isdefined( self._id_2513 ) )
        {
            wait(getanimlength( self._id_2513 ));
            continue;
        }

        wait 0.1;
    }
}

_id_7F53( var_0, var_1 )
{
    self.noncombat = 1;
    self._id_2C2A = var_0;
    self._id_2C2E = var_1;
    var_2 = 1;

    if ( animhasnotetrack( var_0, "code_move" ) )
        var_2 = getnotetracktimes( var_0, "code_move" )[0];

    self._id_2C2B = getmovedelta( var_0, 0, var_2 );
    var_2 = 1;

    if ( animhasnotetrack( var_1, "code_move" ) )
        var_2 = getnotetracktimes( var_1, "code_move" )[0];

    self._id_2C2F = getmovedelta( var_1, 0, var_2 );
    self.invisible = 80;
}

_id_1EE8()
{
    self.noncombat = 0;
    self._id_2C2A = undefined;
    self._id_2C2E = undefined;
    self._id_2C2B = undefined;
    self._id_2C2F = undefined;
}

_id_5B80()
{
    self endon( "killanimscript" );

    for (;;)
    {
        if ( isdefined( self.enemy ) && ( isai( self.enemy ) || isdefined( self._id_5B8D ) ) )
        {
            if ( abs( self _meth_8194() ) <= 135 )
                animscripts\melee::_id_5B7B();
        }

        wait 0.1;
    }
}

canreacttobulletsagain()
{
    return !isdefined( self.lastreacttobullettime ) || gettime() - self.lastreacttobullettime > getdvarint( "ai_reactToBulletCooldown" );
}

_id_18B2()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2AF7 ) )
        return;

    for (;;)
    {
        self waittill( "bulletwhizby", var_0 );

        if ( isdefined( self._id_2AF7 ) )
            return;

        if ( self.mw3prestige != "run" || !self.facemotion || self.a._id_6E5A != "stand" || isdefined( self._id_717B ) )
            continue;

        if ( animscripts\stairs_utility::isonstairs() )
            continue;

        if ( !canreacttobulletsagain() )
            continue;

        if ( !isdefined( self.enemy ) && !self.ignoreforfixednodesafecheck && self getthreatbiasgroup() != "oblivious" && isdefined( var_0.team ) && isenemyteam( self.team, var_0.team ) )
        {
            self._id_A316 = var_0;
            self _meth_819e( animscripts\reactions::_id_18B4 );
            continue;
        }

        if ( self.looktarget || self.lookright < 100 || self.lookright < anim.longestrunwizby )
            continue;

        if ( isdefined( self.pc ) && distancesquared( self.origin, self.pc ) < 10000 )
        {
            wait 0.2;
            continue;
        }

        self._id_7409 = gettime();
        self.lastreacttobullettime = self._id_7409;
        self notify( "move_loop_restart" );
        animscripts\run::_id_315D();
    }
}

_id_3E61( var_0, var_1 )
{
    var_2 = var_1.unlockpoints;

    if ( var_2 == "Cover Multi" )
        var_2 = animscripts\utility::_id_3F3F( var_1 );

    if ( var_2 == "Cover Left" )
        return animscripts\utility::_id_5863( "shuffle", "shuffle_start_from_cover_left" );
    else if ( var_2 == "Cover Right" )
        return animscripts\utility::_id_5863( "shuffle", "shuffle_start_from_cover_right" );
    else if ( var_0 )
        return animscripts\utility::_id_5863( "shuffle", "shuffle_start_left" );
    else
        return animscripts\utility::_id_5863( "shuffle", "shuffle_start_right" );
}

_id_829F( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = var_2.unlockpoints;

    if ( var_4 == "Cover Multi" )
        var_4 = animscripts\utility::_id_3F3F( var_2 );

    if ( var_4 == "Cover Left" )
    {
        var_3["shuffle_start"] = _id_3E61( var_0, var_1 );
        var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_to_cover_left" );
        var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_cover_left" );
    }
    else if ( var_4 == "Cover Right" )
    {
        var_3["shuffle_start"] = _id_3E61( var_0, var_1 );
        var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_to_cover_right" );
        var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_cover_right" );
    }
    else if ( var_4 == "Cover Stand" && var_1.unlockpoints == var_4 )
    {
        if ( var_0 )
        {
            var_3["shuffle_start"] = animscripts\utility::_id_5863( "shuffle", "shuffle_start_left_stand_to_stand" );
            var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_left_stand_to_stand" );
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_left_stand_to_stand" );
        }
        else
        {
            var_3["shuffle_start"] = animscripts\utility::_id_5863( "shuffle", "shuffle_start_right_stand_to_stand" );
            var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_right_stand_to_stand" );
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_right_stand_to_stand" );
        }
    }
    else if ( var_0 )
    {
        var_3["shuffle_start"] = _id_3E61( var_0, var_1 );
        var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_to_left_crouch" );

        if ( var_4 == "Cover Stand" )
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_left_stand" );
        else
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_left_crouch" );
    }
    else
    {
        var_3["shuffle_start"] = _id_3E61( var_0, var_1 );
        var_3["shuffle"] = animscripts\utility::_id_5863( "shuffle", "shuffle_to_right_crouch" );

        if ( var_4 == "Cover Stand" )
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_right_stand" );
        else
            var_3["shuffle_end"] = animscripts\utility::_id_5863( "shuffle", "shuffle_end_to_right_crouch" );
    }

    self.a._id_0CD8 = var_3;
}

_id_5F4A( var_0, var_1 )
{
    if ( self.a._id_6E5A == "stand" && ( var_1.unlockpoints != "Cover Stand" || var_0.unlockpoints != "Cover Stand" ) )
    {
        self.a._id_6E5A = "crouch";
        return 0;
    }

    return 1;
}

_id_5F49( var_0 )
{
    if ( self.a._id_6E5A == "crouch" && var_0.unlockpoints == "Cover Stand" )
    {
        self.a._id_6E5A = "stand";
        return 0;
    }

    return 1;
}

_id_5F48()
{
    self endon( "killanimscript" );
    self endon( "goal_changed" );
    var_0 = self._id_8549;
    self._id_8547 = undefined;
    self._id_8549 = undefined;
    self._id_8548 = 1;

    if ( !isdefined( self.primaryattachment1 ) )
        return;

    if ( !isdefined( self.node_relinquished ) || !isdefined( var_0 ) || self.node_relinquished != var_0 )
        return;

    var_1 = self.primaryattachment1;
    var_2 = self.node_relinquished;
    var_3 = var_2.origin - self.origin;

    if ( lengthsquared( var_3 ) < 1 )
        return;

    var_3 = vectornormalize( var_3 );
    var_4 = anglestoforward( var_2.angles );
    var_5 = var_4[0] * var_3[1] - var_4[1] * var_3[0] > 0;

    if ( _id_5F4D( var_5, var_1, var_2 ) )
        return;

    if ( _id_5F4A( var_1, var_2 ) )
        var_6 = 0.1;
    else
        var_6 = 0.4;

    _id_829F( var_5, var_1, var_2 );
    self _meth_8192( "zonly_physics", 0 );
    self _meth_8144( %body, var_6 );
    var_7 = animscripts\utility::_id_0C4E( "shuffle_start" );
    var_8 = animscripts\utility::_id_0C4E( "shuffle" );
    var_9 = animscripts\utility::_id_0C4E( "shuffle_end" );

    if ( animhasnotetrack( var_7, "finish" ) )
        var_10 = getnotetracktimes( var_7, "finish" )[0];
    else
        var_10 = 1;

    var_11 = length( getmovedelta( var_7, 0, var_10 ) );
    var_12 = length( getmovedelta( var_8, 0, 1 ) );
    var_13 = length( getmovedelta( var_9, 0, 1 ) );
    var_14 = distance( self.origin, var_2.origin );

    if ( var_14 > var_11 )
    {
        self _meth_8193( "face angle", animscripts\utility::_id_404B( var_1 ) );
        self setflaggedanimrestart( "shuffle_start", var_7, 1, var_6 );
        animscripts\shared::_id_2D06( "shuffle_start" );
        self _meth_8144( var_7, 0.2 );
        var_14 -= var_11;
        var_6 = 0.2;
    }
    else
        self _meth_8193( "face angle", var_2.angles[1] );

    var_15 = 0;

    if ( var_14 > var_13 )
    {
        var_15 = 1;
        var_14 -= var_13;
    }

    var_16 = getanimlength( var_8 );
    var_17 = var_16 * var_14 / var_12 * 0.9;
    var_17 = floor( var_17 * 20 ) * 0.05;
    self setflaggedanim( "shuffle", var_8, 1, var_6 );
    animscripts\notetracks::_id_2D0B( var_17, "shuffle" );

    for ( var_18 = 0; var_18 < 2; var_18++ )
    {
        var_14 = distance( self.origin, var_2.origin );

        if ( var_15 )
            var_14 -= var_13;

        if ( var_14 < 4 )
            break;

        var_17 = var_16 * var_14 / var_12 * 0.9;
        var_17 = floor( var_17 * 20 ) * 0.05;

        if ( var_17 < 0.05 )
            break;

        animscripts\notetracks::_id_2D0B( var_17, "shuffle" );
    }

    if ( var_15 )
    {
        if ( _id_5F49( var_2 ) )
            var_6 = 0.2;
        else
            var_6 = 0.4;

        self _meth_8144( var_8, var_6 );
        self setflaggedanim( "shuffle_end", var_9, 1, var_6 );
        animscripts\shared::_id_2D06( "shuffle_end" );
    }

    self _meth_81cb( var_2.origin );
    self _meth_8192( "normal" );
    self._id_8548 = undefined;
}

_id_5F4B()
{
    if ( isdefined( self._id_8548 ) )
    {
        self _meth_8144( %cover_shuffle, 0.2 );
        self._id_8548 = undefined;
        self _meth_8192( "none", 0 );
        self _meth_8193( "face default" );
    }
    else
    {
        wait 0.2;
        self _meth_8144( %cover_shuffle, 0.2 );
    }
}

_id_5F4D( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_1.unlockpoints == "Cover Right" && var_2.unlockpoints == "Cover Left" && !var_0 )
        var_3 = %corner_standr_door_r2l;
    else if ( var_1.unlockpoints == "Cover Left" && var_2.unlockpoints == "Cover Right" && var_0 )
        var_3 = %corner_standl_door_l2r;

    if ( !isdefined( var_3 ) )
        return 0;

    self _meth_8192( "zonly_physics", 0 );
    self _meth_8193( "face current" );
    self setflaggedanimrestart( "sideToSide", var_3, 1, 0.2 );
    animscripts\shared::_id_2D06( "sideToSide", ::_id_467E );
    var_4 = self _meth_8151( var_3 );
    var_5 = var_2.origin - var_1.origin;
    var_5 = vectornormalize( ( var_5[0], var_5[1], 0 ) );
    var_6 = getmovedelta( var_3, var_4, 1 );
    var_7 = var_2.origin - self.origin;
    var_7 = ( var_7[0], var_7[1], 0 );
    var_8 = vectordot( var_7, var_5 ) - abs( var_6[1] );

    if ( var_8 > 2 )
    {
        var_9 = getnotetracktimes( var_3, "slide_end" )[0];
        var_10 = ( var_9 - var_4 ) * getanimlength( var_3 );
        var_11 = int( ceil( var_10 / 0.05 ) );
        var_12 = var_5 * var_8 / var_11;
        thread _id_8625( var_12, var_11 );
    }

    animscripts\shared::_id_2D06( "sideToSide" );
    self _meth_81cb( var_2.origin );
    self _meth_8192( "none" );
    self _meth_8193( "face default" );
    self._id_8548 = undefined;
    wait 0.2;
    return 1;
}

_id_467E( var_0 )
{
    if ( var_0 == "slide_start" )
        return 1;
}

_id_8625( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( "goal_changed" );

    while ( var_1 > 0 )
    {
        self _meth_81cb( self.origin + var_0 );
        var_1--;
        wait 0.05;
    }
}

_id_5F7C( var_0, var_1 )
{
    self endon( "movemode" );
    self _meth_8144( %combatrun, 0.6 );
    var_2 = animscripts\stairs_utility::isonstairs();

    if ( !var_2 )
        self _meth_8149( %combatrun, %body, 1, 0.5, self._id_5F65 );

    var_3 = animscripts\utility::getreacttobulletchance();

    if ( !var_2 && isdefined( self._id_7409 ) && gettime() - self._id_7409 < 100 && isdefined( self._id_76B1 ) && randomfloat( 1 ) < var_3 )
        animscripts\run::_id_2568();
    else
    {
        var_4 = undefined;
        self _meth_8144( %h1_stairs, 0.1 );

        if ( var_2 )
        {
            var_5 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
            var_4 = animscripts\utility::_id_402D( var_5 );
        }

        if ( !isdefined( var_4 ) )
        {
            if ( isarray( var_0 ) )
            {
                if ( isdefined( self._id_76AE ) )
                    var_4 = common_scripts\utility::_id_1D3F( var_0, var_1 );
                else
                    var_4 = var_0[randomint( var_0.size )];
            }
            else
                var_4 = var_0;
        }

        if ( !var_2 )
            var_6 = common_scripts\utility::_id_9294( isdefined( self.movestand_moveoverride_overrideanimrate ), self.movestand_moveoverride_overrideanimrate, self._id_5F65 );
        else
            var_6 = 1.0;

        var_7 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

        if ( var_7 == "in" )
            self _meth_8154( "moveanim", var_4, 1, 0.1, var_6 );
        else
            self _meth_8154( "moveanim", var_4, 1, 0.2, var_6 );

        if ( !var_2 )
        {
            animscripts\shared::_id_2D06( "moveanim" );
            return;
        }

        animscripts\notetracks::_id_2D0B( 0.2, "moveanim" );
    }
}

_id_57A3()
{
    thread animscripts\cover_arrival::_id_82FC( 1 );
}

waittolistenforcoverapproach()
{
    self endon( "killanimscript" );
    self waittill( "StartListeningForCoverApproach" );
    _id_57A3();
}

getexpectedcurrentmoveanim()
{
    if ( animscripts\utility::_id_848B() )
    {
        var_0["anim"] = animscripts\cqb::_id_29A6();
        var_0["updateTime"] = 0.2;
    }
    else if ( self.mw3prestige == "walk" || self.a._id_5F5B == "walk" )
    {
        if ( isdefined( self.a._id_5F43 ) )
            var_0["anim"] = animscripts\walk::_id_415B( "straight" );
        else
            var_0["anim"] = animscripts\utility::_id_5863( "walk", "straight" );

        var_0["updateTime"] = 0.2;
    }
    else
    {
        var_0["anim"] = animscripts\run::_id_40BD();
        var_0["updateTime"] = 0.2;
    }

    return var_0;
}
