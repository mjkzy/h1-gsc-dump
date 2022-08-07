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

main()
{
    self endon( "killanimscript" );
    self endon( "abort_approach" );

    if ( self.tactical )
    {
        animscripts\swim::_id_9035();
        return;
    }

    if ( isdefined( self._id_2552 ) )
    {
        [[ self._id_2552 ]]();
        return;
    }

    var_0 = self._id_0CBB;
    var_1 = animscripts\utility::_id_5863( "cover_trans", self._id_0CBC )[var_0];

    if ( !isdefined( self._id_4795 ) )
        thread _id_06BE();

    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "coverArrival", var_1, 1, 0.2, self._id_5F97 );
    animscripts\face::_id_6D9B( var_1, "run" );
    animscripts\shared::_id_2D06( "coverArrival", ::_id_467F );
    var_2 = anim._id_0D24[self._id_0CBC];

    if ( isdefined( var_2 ) )
        self.a._id_6E5A = var_2;

    self.a._id_5F5B = "stop";
    self.a._id_0D29 = self._id_0CBC;
    self _meth_8144( %animscript_root, 0.2 );
    self._id_5575 = undefined;
}

_id_467F( var_0 )
{
    if ( var_0 == "start_aim" )
    {
        if ( isdefined( self.a.dontstartaim ) && self.a.dontstartaim )
            return;

        if ( self.a._id_6E5A == "stand" )
            animscripts\animset::_id_7DD2();
        else if ( self.a._id_6E5A == "crouch" )
            animscripts\animset::_id_7DC5();
        else
        {

        }

        animscripts\combat::_id_7DB6();
        self._id_6F67 = 0.0;
        animscripts\combat_utility::_id_82F8( 0.2 );
        thread animscripts\track::_id_9512();
    }
}

_id_51D4()
{
    if ( !isdefined( self.node_relinquished ) )
        return 0;

    if ( isdefined( self.enemy ) && self _meth_81c3( self.enemy, 1.5 ) && distancesquared( self.origin, self.enemy.origin ) < 250000 )
        return !self _meth_81f4();

    return 0;
}

_id_06BE()
{
    self endon( "killanimscript" );

    for (;;)
    {
        if ( !isdefined( self.node_relinquished ) )
            return;

        if ( _id_51D4() )
        {
            self _meth_8144( %animscript_root, 0.3 );
            self notify( "abort_approach" );
            self._id_5575 = gettime();
            return;
        }

        wait 0.1;
    }
}

_id_1AFC( var_0 )
{
    if ( !animscripts\utility::_id_9C2E() )
        return 0;

    if ( !isdefined( var_0._id_99B3 ) )
        return 0;

    if ( var_0.unlockpoints != "Cover Stand" && var_0.unlockpoints != "Cover Prone" && var_0.unlockpoints != "Cover Crouch" )
        return 0;

    if ( isdefined( self.enemy ) && distancesquared( self.enemy.origin, var_0.origin ) < 65536 )
        return 0;

    if ( animscripts\utility::_id_4050() > 40 || animscripts\utility::_id_4050() < -40 )
        return 0;

    return 1;
}

_id_29A9( var_0 )
{
    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
        return "exposed";

    var_1 = var_0.unlockpoints;

    if ( animscripts\utility::_id_502C() && var_1 == "Cover Crouch" )
        return "free_run_into_cover_crouch";

    if ( var_1 == "Cover Multi" )
    {
        if ( !isdefined( self.cover ) )
            self.cover = spawnstruct();

        var_2 = animscripts\cover_multi::_id_22B1( [ "over", [ "left", "right" ] ] );
        self.cover._id_0D25 = var_2;
        var_3 = animscripts\cover_multi::_id_22B4( var_0, var_2 );
        var_1 = animscripts\utility::_id_3F3F( var_0, var_3 );
    }

    if ( _id_1AFC( var_0 ) )
    {
        if ( var_1 == "Cover Stand" )
            return "stand_saw";

        if ( var_1 == "Cover Crouch" )
            return "crouch_saw";
        else if ( var_1 == "Cover Prone" )
            return "prone_saw";
    }

    if ( !isdefined( anim._id_0CB6[var_1] ) )
        return;

    if ( isdefined( var_0._id_0D27 ) )
        var_4 = var_0._id_0D27;
    else if ( isdefined( var_0.classname ) && var_0.classname == "script_origin" )
        var_4 = "stand";
    else
        var_4 = var_0 gethighestnodestance();

    if ( var_4 == "prone" )
        var_4 = "crouch";

    var_5 = anim._id_0CB6[var_1][var_4];

    if ( _id_9C11() && var_5 == "exposed" )
        var_5 = "exposed_ready";

    if ( animscripts\utility::_id_51DE() )
    {
        if ( var_5 == "exposed" )
        {
            var_5 = "exposed_unstable";

            if ( self.mw3prestige == "run" )
                var_5 += "_run";

            return var_5;
        }
        else if ( var_5 == "stand" )
        {
            var_5 = "stand_unstable";

            if ( self.mw3prestige == "run" )
                var_5 += "_run";

            return var_5;
        }
    }

    if ( animscripts\utility::_id_848B() )
    {
        var_6 = var_5 + "_cqb";

        if ( isdefined( anim._id_0CCA["soldier"]["cover_trans"][var_6] ) )
            var_5 = var_6;
    }

    return var_5;
}

_id_29A7( var_0 )
{
    if ( isdefined( self._id_4795 ) )
        return "heat";

    if ( isdefined( var_0._id_0D27 ) )
        var_1 = var_0._id_0D27;
    else
        var_1 = var_0 gethighestnodestance();

    if ( var_1 == "prone" )
        var_1 = "crouch";

    if ( var_1 == "crouch" )
        var_2 = "exposed_crouch";
    else
        var_2 = "exposed";

    if ( var_2 == "exposed" && _id_9C11() )
        var_2 += "_ready";

    if ( var_2 == "exposed" && animscripts\utility::_id_51DE() )
    {
        var_2 = "exposed_unstable";

        if ( self.mw3prestige == "run" )
            var_2 += "_run";

        return var_2;
    }

    if ( animscripts\utility::_id_848B() )
        return var_2 + "_cqb";

    return var_2;
}

_id_19E4( var_0, var_1 )
{
    var_2 = anglestoright( var_0 );
    var_3 = anglestoforward( var_0 );
    return var_3 * var_1[0] + var_2 * ( 0 - var_1[1] );
}

_id_3F00()
{
    if ( isdefined( self.secondaryattachment1 ) )
        return self.secondaryattachment1;

    if ( isdefined( self.node_relinquished ) )
        return self.node_relinquished;

    return undefined;
}

_id_3F01( var_0, var_1 )
{
    if ( var_1 == "stand_saw" )
    {
        var_2 = ( var_0._id_99B3.origin[0], var_0._id_99B3.origin[1], var_0.origin[2] );
        var_3 = anglestoforward( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_4 = anglestoright( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_2 = var_2 + var_3 * -32.545 - var_4 * 6.899;
    }
    else if ( var_1 == "crouch_saw" )
    {
        var_2 = ( var_0._id_99B3.origin[0], var_0._id_99B3.origin[1], var_0.origin[2] );
        var_3 = anglestoforward( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_4 = anglestoright( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_2 = var_2 + var_3 * -32.545 - var_4 * 6.899;
    }
    else if ( var_1 == "prone_saw" )
    {
        var_2 = ( var_0._id_99B3.origin[0], var_0._id_99B3.origin[1], var_0.origin[2] );
        var_3 = anglestoforward( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_4 = anglestoright( ( 0, var_0._id_99B3.angles[1], 0 ) );
        var_2 = var_2 + var_3 * -37.36 - var_4 * 13.279;
    }
    else if ( isdefined( self.secondaryattachment1 ) )
        var_2 = self.goalpos;
    else
        var_2 = var_0.origin;

    return var_2;
}

_id_1CF3()
{
    if ( isdefined( self getnegotiationstartnode() ) )
        return 0;

    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return 0;

    return 1;
}

_id_1CF2( var_0, var_1, var_2 )
{
    if ( isdefined( anim._id_3594[var_0] ) )
        return 0;

    if ( var_0 == "stand" || var_0 == "crouch" || var_0 == "stand_unstable" )
    {
        if ( animscripts\utility::_id_06C4( vectortoyaw( var_1 ) - var_2.angles[1] + 180 ) < 60 )
            return 0;
    }

    if ( _id_51D4() || isdefined( self._id_5575 ) && self._id_5575 + 500 > gettime() )
        return 0;

    return 1;
}

_id_82FC( var_0 )
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_4795 ) )
    {
        thread _id_2CEB();
        return;
    }

    if ( var_0 )
        self.requirement_beat50waves = 1;

    if ( self.tactical == 1 )
    {
        thread animscripts\swim::_id_9064();
        return;
    }

    self.a._id_0D29 = undefined;
    thread _id_2CEB();
    self waittill( "cover_approach", var_1 );

    if ( !_id_1CF3() )
        return;

    thread _id_82FC( 0 );
    var_2 = "exposed";
    var_3 = self.pc;
    var_4 = vectortoyaw( var_1 );
    var_5 = var_4;
    var_6 = _id_3F00();

    if ( isdefined( var_6 ) )
    {
        var_2 = _id_29A9( var_6 );

        if ( isdefined( var_2 ) && var_2 != "exposed" )
        {
            var_3 = _id_3F01( var_6, var_2 );
            var_4 = var_6.angles[1];
            var_5 = animscripts\utility::_id_404B( var_6 );
        }
    }
    else if ( _id_9C11() )
    {
        if ( animscripts\utility::_id_848B() )
            var_2 = "exposed_ready_cqb";
        else
            var_2 = "exposed_ready";
    }

    if ( !_id_1CF2( var_2, var_1, var_6 ) )
        return;

    _id_8D06( var_2, var_3, var_4, var_5, var_1 );
}

_id_229C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return 0;

    if ( abs( self _meth_8194() ) > 45 && isdefined( self.enemy ) && vectordot( anglestoforward( self.angles ), vectornormalize( self.enemy.origin - self.origin ) ) > 0.8 )
        return 0;

    if ( self.a._id_6E5A != "stand" || self.a._id_5F5B != "run" && !animscripts\utility::_id_50EA() )
        return 0;

    if ( animscripts\utility::_id_06C4( var_4 - self.angles[1] ) > 30 )
    {
        if ( isdefined( self.enemy ) && self _meth_81c2( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) < 65536 )
        {
            if ( vectordot( anglestoforward( self.angles ), self.enemy.origin - self.origin ) > 0 )
                return 0;
        }
    }

    if ( !_id_1CF9( var_0, var_1, var_2, var_3, 0 ) )
        return 0;

    return 1;
}

_id_0CBE( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_3 = undefined;

    for (;;)
    {
        if ( !isdefined( self.pc ) )
            _id_A026();

        var_4 = distance( self.origin, self.pc );

        if ( isdefined( var_2 ) )
        {
            var_5 = calculateapproachdir();
            var_6 = calculatedesiredfacingyaw( var_5 );
            var_7 = calculatelastminuteanimdistance( var_5, var_6, var_0, 1, var_2._id_0CBC );
            var_8 = vectornormalize( var_2.approachpoint - self.origin );
            var_3 = _id_1CF4( var_2.approachpoint, var_2.approachfinalyaw, var_2._id_0CBC, var_8, var_2._id_5A2F, var_2._id_33E8, var_2.arrivalfromfront );

            if ( var_3._id_0CBB > 0 )
                var_1 = length( animscripts\utility::_id_5868( "cover_trans_dist", var_2._id_0CBC, var_3._id_0CBB ) );
        }

        if ( var_4 <= var_1 + 8 )
            break;

        var_9 = self._id_5F65;

        if ( level.script_context == "scoutsniper" && self _meth_8152( %h1_sprint_loop ) > 0.5 )
            var_9 *= 1.25;

        var_10 = ( var_4 - var_1 ) / 250 * var_9 - 0.1;

        if ( var_10 < 0.05 )
            var_10 = 0.05;

        wait(var_10);
    }

    return var_3;
}

_id_8D06( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killanimscript" );
    self endon( "cover_approach" );

    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return;

    var_5 = _id_3F00();
    var_6 = animscripts\exit_node::_id_401A( var_5 );
    var_7 = var_6._id_5A2F;
    var_8 = var_6._id_33E8;
    var_9 = vectordot( var_4, anglestoforward( var_5.angles ) ) >= 0;
    var_6 = _id_1CF4( var_1, var_3, var_0, var_4, var_7, var_8, var_9 );

    if ( var_6._id_0CBB < 0 )
        return;

    var_10 = var_6._id_0CBB;

    if ( var_10 <= 6 && var_9 )
    {
        self endon( "goal_changed" );

        if ( isdefined( self._id_0C4D ) && isdefined( anim._id_0CCA[self._id_0C4D] ) && isdefined( anim._id_0CCA[self._id_0C4D]["CoverTransLongestDist"][var_0] ) )
            self._id_0D28 = anim._id_0CCA[self._id_0C4D]["CoverTransLongestDist"][var_0];
        else if ( isdefined( anim._id_0CCA["soldier"]["CoverTransLongestDist"][var_0] ) )
            self._id_0D28 = anim._id_0CCA["soldier"]["CoverTransLongestDist"][var_0];
        else
            self._id_0D28 = 8;

        _id_0CBE( var_5, self._id_0D28 );
        var_11 = vectornormalize( var_1 - self.origin );
        var_6 = _id_1CF4( var_1, var_3, var_0, var_11, var_7, var_8, var_9 );
        self._id_0D28 = length( animscripts\utility::_id_5868( "cover_trans_dist", var_0, var_10 ) );
        var_12 = spawnstruct();
        var_12._id_0CBC = var_0;
        var_12.approachpoint = var_1;
        var_12.arrivalfromfront = var_9;
        var_12._id_33E8 = var_8;
        var_12._id_5A2F = var_7;
        var_12.approachfinalyaw = var_3;
        var_6 = _id_0CBE( var_5, self._id_0D28, var_12 );

        if ( !self _meth_81c7( var_1 ) )
        {
            self._id_0D28 = undefined;
            return;
        }

        if ( var_6._id_0CBB < 0 )
        {
            self._id_0D28 = undefined;
            return;
        }

        var_10 = var_6._id_0CBB;
        var_13 = var_3 - animscripts\utility::_id_5868( "cover_trans_angles", var_0, var_10 );
    }
    else
    {
        self _meth_8162( self._id_22A2 );
        self waittill( "runto_arrived" );
        var_13 = var_3 - animscripts\utility::_id_5868( "cover_trans_angles", var_0, var_10 );

        if ( !_id_229C( var_1, var_3, var_0, var_10, var_13 ) )
            return;
    }

    self._id_0CBB = var_10;
    self._id_0CBC = var_0;
    self._id_0D28 = undefined;

    if ( animscripts\utility::using_cover_transition_angle_correction() )
    {
        self._id_0D23 = animscripts\utility::_id_5863( "cover_trans", self._id_0CBC )[self._id_0CBB];
        var_14 = animscripts\utility::_id_5868( "cover_trans_move_end", var_0, self._id_0CBB );
        self.arrivalangles = self _meth_8567( self._id_22A2, var_13, 0, self._id_0D23, var_14 );
    }
    else
        self.arrivalangles = self _meth_81e7( self._id_22A2, var_13, 0 );
}

_id_1CF4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    animscripts\exit_node::_id_19E5( var_7, var_2, 1, var_1, var_3, var_4, var_5 );
    animscripts\exit_node::_id_8897( var_7, var_4 );
    var_8 = spawnstruct();
    var_9 = ( 0, 0, 0 );
    var_8._id_0CBB = -1;
    var_10 = 2;

    for ( var_11 = 1; var_11 <= var_10; var_11++ )
    {
        var_8._id_0CBB = var_7._id_970C[var_11];

        if ( !_id_1CF9( var_0, var_1, var_2, var_8._id_0CBB, var_6 ) )
            continue;

        break;
    }

    if ( var_11 > var_10 )
    {
        var_8._id_0CBB = -1;
        return var_8;
    }

    var_12 = distancesquared( var_0, self.origin );
    var_13 = distancesquared( var_0, self._id_22A2 );

    if ( var_12 < var_13 * 2 * 2 )
    {
        if ( var_12 < var_13 )
        {
            var_8._id_0CBB = -1;
            return var_8;
        }

        if ( !var_6 )
        {
            var_14 = vectornormalize( self._id_22A2 - self.origin );
            var_15 = var_1 - animscripts\utility::_id_5868( "cover_trans_angles", var_2, var_8._id_0CBB );
            var_16 = anglestoforward( ( 0, var_15, 0 ) );
            var_17 = vectordot( var_14, var_16 );

            if ( var_17 < 0.707 )
            {
                var_8._id_0CBB = -1;
                return var_8;
            }
        }
    }

    return var_8;
}

_id_2CEB()
{
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    self notify( "doing_last_minute_exposed_approach" );
    self endon( "doing_last_minute_exposed_approach" );
    thread _id_A22D();

    for (;;)
    {
        _id_2CEA();

        for (;;)
        {
            common_scripts\utility::_id_A069( "goal_changed", "goal_changed_previous_frame" );

            if ( isdefined( self._id_22A2 ) && isdefined( self.pc ) && distance2d( self._id_22A2, self.pc ) < 1 )
                continue;

            break;
        }
    }
}

_id_A22D()
{
    self endon( "killanimscript" );
    self endon( "doing_last_minute_exposed_approach" );

    for (;;)
    {
        self waittill( "goal_changed" );
        wait 0.05;
        self notify( "goal_changed_previous_frame" );
    }
}

_id_3589( var_0, var_1 )
{
    if ( !isdefined( self.pc ) )
        return 0;

    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return 0;

    if ( isdefined( self._id_0CB7 ) )
    {
        if ( !self [[ self._id_0CB7 ]]( var_0 ) )
            return 0;
    }
    else
    {
        if ( !self.facemotion && ( !isdefined( var_0 ) || var_0.unlockpoints == "Path" || var_0.unlockpoints == "Path 3D" ) )
            return 0;

        if ( self.a._id_6E5A != "stand" )
            return 0;
    }

    if ( _id_51D4() || isdefined( self._id_5575 ) && self._id_5575 + 500 > gettime() )
        return 0;

    if ( !self _meth_81c7( self.pc, 1, 0, level.h1_arrival_ignores_player ) )
        return 0;

    return 1;
}

_id_358A()
{
    for (;;)
    {
        if ( !isdefined( self.pc ) )
            _id_A026();

        var_0 = _id_3F00();

        if ( isdefined( var_0 ) && !isdefined( self._id_4795 ) )
            var_1 = var_0.origin;
        else
            var_1 = self.pc;

        var_2 = distance( self.origin, var_1 );
        var_3 = 0;

        if ( isdefined( self._id_0C4D ) && isdefined( anim._id_0CCA[self._id_0C4D] ) && isdefined( anim._id_0CCA[self._id_0C4D]["longestExposedApproachDist"] ) )
            var_3 = anim._id_0CCA[self._id_0C4D]["longestExposedApproachDist"];
        else
            var_3 = anim._id_0CCA["soldier"]["longestExposedApproachDist"];

        if ( var_2 <= var_3 + 8 )
            break;

        var_4 = ( var_2 - var_3 ) / 250 * self._id_5F65 - 0.1;

        if ( var_4 < 0 )
            break;

        if ( var_4 < 0.05 )
            var_4 = 0.05;

        wait(var_4);
    }
}

_id_35B8( var_0 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( isdefined( self._id_4795 ) && isdefined( var_0 ) )
        return 0;

    if ( self.combatmode == "cover" && issentient( self.enemy ) && gettime() - self _meth_81c4( self.enemy ) > 15000 )
        return 0;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        return self _meth_81c2( self.enemy );

    return sighttracepassed( self.enemy getshootatpos(), self.pc + ( 0, 0, 60 ), 0, undefined );
}

calculatelastminuteanimdistance( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_35B7 ) )
        var_1 = self.angles[1];
    else if ( _id_35B8( var_2 ) )
        var_1 = vectortoyaw( self.enemy.origin - self.pc );
    else
    {
        var_5 = isdefined( var_2 ) && var_3;
        var_5 = var_5 && var_2.unlockpoints != "Path" && var_2.unlockpoints != "Path 3D" && ( var_2.unlockpoints != "Ambush" || !animscripts\utility::_id_7262() );

        if ( var_5 )
            var_1 = animscripts\utility::_id_404B( var_2 );
        else
        {
            var_6 = self _meth_8196();

            if ( isdefined( var_6 ) )
                var_1 = var_6[1];
        }
    }

    var_7 = spawnstruct();
    animscripts\exit_node::_id_19E5( var_7, var_4, 1, var_1, var_0, 9, -1 );
    var_8 = 1;

    for ( var_9 = 2; var_9 <= 9; var_9++ )
    {
        if ( var_7._id_9719[var_9] > var_7._id_9719[var_8] )
            var_8 = var_9;
    }

    self._id_0CBB = var_7._id_970C[var_8];
    self._id_0CBC = var_4;
    var_10 = animscripts\utility::_id_5868( "cover_trans", var_4, self._id_0CBB );

    if ( !isdefined( var_10 ) || isdefined( self._id_2AF2 ) )
        return;

    var_11 = length( animscripts\utility::_id_5868( "cover_trans_dist", var_4, self._id_0CBB ) );
    return var_11;
}

calculatelastminuterequireddistsq( var_0 )
{
    var_1 = var_0 + 8;
    var_1 *= var_1;
    return var_1;
}

calculateapproachdir()
{
    var_0 = vectornormalize( self.pc - self.origin );
    return var_0;
}

calculatedesiredfacingyaw( var_0 )
{
    var_1 = vectortoyaw( var_0 );
    return var_1;
}

_id_2CEA()
{
    self endon( "goal_changed" );
    self endon( "move_interrupt" );

    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return;

    if ( isdefined( self getnegotiationstartnode() ) )
        return;

    _id_358A();

    if ( isdefined( self.grenade ) && isdefined( self.grenade.activator ) && self.grenade.activator == self )
        return;

    var_0 = "exposed";
    var_1 = 1;

    if ( isdefined( self._id_0CBD ) )
        var_0 = self [[ self._id_0CBD ]]();
    else if ( animscripts\utility::_id_51DE() )
    {
        var_0 = "exposed_unstable";

        if ( self.mw3prestige == "run" )
            var_0 += "_run";
    }
    else if ( _id_9C11() )
    {
        if ( animscripts\utility::_id_848B() )
            var_0 = "exposed_ready_cqb";
        else
            var_0 = "exposed_ready";
    }
    else if ( animscripts\utility::_id_848B() )
        var_0 = "exposed_cqb";
    else if ( isdefined( self._id_4795 ) )
    {
        var_0 = "heat";
        var_1 = 4096;
    }
    else if ( animscripts\utility::_id_9C3B() )
        var_0 = "exposed_smg";

    var_2 = _id_3F00();

    if ( isdefined( var_2 ) && isdefined( self.pc ) && !isdefined( self._id_2AFC ) )
        var_3 = distancesquared( self.pc, var_2.origin ) < var_1;
    else
        var_3 = 0;

    if ( var_3 && !isdefined( self._id_0CBD ) )
        var_0 = _id_29A7( var_2 );

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
        var_0 = "exposed";

    var_4 = calculateapproachdir();
    var_5 = calculatedesiredfacingyaw( var_4 );
    var_6 = calculatelastminuteanimdistance( var_4, var_5, var_2, var_3, var_0 );

    if ( !isdefined( var_6 ) )
        return;

    var_7 = calculatelastminuterequireddistsq( var_6 );

    while ( isdefined( self.pc ) && isdefined( var_7 ) && distancesquared( self.origin, self.pc ) > var_7 )
    {
        var_4 = calculateapproachdir();
        var_5 = calculatedesiredfacingyaw( var_4 );
        var_6 = calculatelastminuteanimdistance( var_4, var_5, var_2, var_3, var_0 );
        var_7 = calculatelastminuterequireddistsq( var_6 );
        wait 0.05;
    }

    if ( isdefined( self._id_0D28 ) && self._id_0D28 < var_6 + 8 )
        return;

    if ( !_id_3589( var_2, var_3 ) )
        return;

    var_8 = distance( self.origin, self.pc );

    if ( abs( var_8 - var_6 ) > 8 )
        return;

    var_9 = vectortoyaw( self.pc - self.origin );

    if ( isdefined( self._id_4795 ) && var_3 )
    {
        var_10 = var_5 - animscripts\utility::_id_5868( "cover_trans_angles", var_0, self._id_0CBB );
        var_11 = _id_3F06( self.pc, var_5, var_0, self._id_0CBB );
    }
    else if ( isdefined( self.a.forceapproachfacenodeyaw ) && self.a.forceapproachfacenodeyaw )
    {
        var_5 = var_2.angles[1];
        var_10 = var_5 - animscripts\utility::_id_5868( "cover_trans_angles", var_0, self._id_0CBB );
        var_11 = _id_3F06( self.pc, var_5, var_0, self._id_0CBB );
    }
    else if ( var_6 > 0 )
    {
        var_12 = animscripts\utility::_id_5868( "cover_trans_dist", var_0, self._id_0CBB );
        var_13 = atan( var_12[1] / var_12[0] );

        if ( !isdefined( self._id_35B7 ) || self.facemotion )
        {
            var_10 = var_9 - var_13;

            if ( animscripts\utility::_id_06C4( var_10 - self.angles[1] ) > 30 )
                return;
        }
        else
            var_10 = self.angles[1];

        var_14 = var_8 - var_6;
        var_11 = self.origin + vectornormalize( self.pc - self.origin ) * var_14;
    }
    else
    {
        var_10 = self.angles[1];
        var_11 = self.origin;
    }

    self._id_0CBC = var_0;

    if ( animscripts\utility::using_cover_transition_angle_correction() )
    {
        self._id_0D23 = animscripts\utility::_id_5863( "cover_trans", self._id_0CBC )[self._id_0CBB];
        var_15 = animscripts\utility::_id_5868( "cover_trans_move_end", var_0, self._id_0CBB );
        self.arrivalangles = self _meth_8567( var_11, var_10, 0, self._id_0D23, var_15 );
    }
    else
        self.arrivalangles = self _meth_81e7( var_11, var_10, 0 );
}

_id_A026()
{
    for (;;)
    {
        if ( isdefined( self.pc ) )
            return;

        wait 0.1;
    }
}

_id_2565()
{
    if ( !isdefined( self._id_8D2F ) )
        return;

    self _meth_8192( "zonly_physics", 0 );
    self _meth_8193( "face current" );
    self setflaggedanimknoballrestart( "move", self._id_8D2F, %animscript_root, 1 );
    animscripts\face::_id_6D9B( self._id_8D2F, "run" );

    if ( animhasnotetrack( self._id_8D2F, "code_move" ) )
    {
        animscripts\shared::_id_2D06( "move" );
        self _meth_8193( "face motion" );
        self _meth_8192( "none", 0 );
    }

    animscripts\shared::_id_2D06( "move" );
}

_id_2560()
{
    if ( !isdefined( self._id_8D20 ) )
        return;

    var_0 = self._id_0CBB;
    var_1 = self._id_8D20;

    if ( !isdefined( self._id_4795 ) )
        thread _id_06BE();

    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "coverArrival", var_1, 1, 0.2, self._id_5F97 );
    animscripts\face::_id_6D9B( var_1, "run" );
    animscripts\shared::_id_2D06( "coverArrival", ::_id_467F );
    var_2 = anim._id_0D24[self._id_0CBC];

    if ( isdefined( var_2 ) )
        self.a._id_6E5A = var_2;

    self.a._id_5F5B = "stop";
    self.a._id_0D29 = self._id_0CBC;
    self _meth_8144( %animscript_root, 0.3 );
    self._id_5575 = undefined;
}

_id_8F1D( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "{undefined}";

    return var_0;
}

_id_2DEB( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_2 * 100; var_4++ )
        wait 0.05;
}

_id_2DCF( var_0 )
{
    self endon( "killanimscript" );

    for (;;)
    {
        if ( !isdefined( self.node_relinquished ) )
            break;

        wait 0.05;
    }
}

_id_3F06( var_0, var_1, var_2, var_3 )
{
    var_4 = ( 0, var_1 - animscripts\utility::_id_5868( "cover_trans_angles", var_2, var_3 ), 0 );
    var_5 = anglestoforward( var_4 );
    var_6 = anglestoright( var_4 );
    var_7 = animscripts\utility::_id_5868( "cover_trans_dist", var_2, var_3 );
    var_8 = var_5 * var_7[0];
    var_9 = var_6 * var_7[1];
    return var_0 - var_8 + var_9;
}

_id_3F05( var_0, var_1, var_2, var_3 )
{
    var_4 = ( 0, var_1 - animscripts\utility::_id_5868( "cover_trans_angles", var_2, var_3 ), 0 );
    var_5 = anglestoforward( var_4 );
    var_6 = anglestoright( var_4 );
    var_7 = animscripts\utility::_id_5868( "cover_trans_predist", var_2, var_3 );
    var_8 = var_5 * var_7[0];
    var_9 = var_6 * var_7[1];
    return var_0 - var_8 + var_9;
}

_id_1CF9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_3F06( var_0, var_1, var_2, var_3 );
    self._id_22A2 = var_5;

    if ( var_3 <= 6 && var_4 )
        return 1;

    if ( !self _meth_81c8( var_5, var_0 ) )
        return 0;

    if ( var_3 <= 6 || isdefined( anim._id_3594[var_2] ) )
        return 1;

    var_6 = _id_3F05( var_5, var_1, var_2, var_3 );
    self._id_22A2 = var_6;
    return self _meth_81c8( var_6, var_5 );
}

_id_9C11()
{
    if ( !isdefined( anim._id_71E1 ) )
        return 0;

    if ( !anim._id_71E1 )
        return 0;

    if ( !isdefined( self._id_1944 ) )
        return 0;

    if ( !self._id_1944 )
        return 0;

    return 1;
}

_id_267B()
{
    return 0;
}

_id_267A( var_0 )
{
    if ( !_id_267B() )
        return;
}
