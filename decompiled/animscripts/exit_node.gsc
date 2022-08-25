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

_id_8D2E()
{
    if ( isdefined( self._id_2564 ) )
    {
        _id_2564();
        return;
    }

    self endon( "killanimscript" );

    if ( !_id_1D23() )
        return;

    var_0 = self.origin;
    var_1 = self.angles[1];
    var_2 = "exposed";
    var_3 = 0;
    var_4 = _id_3F8B();

    if ( isdefined( self.exittypefunc ) )
        var_2 = self [[ self.exittypefunc ]]( var_4 );
    else if ( isdefined( var_4 ) )
    {
        var_5 = _id_29AA( var_4 );

        if ( isdefined( var_5 ) )
        {
            var_2 = var_5;
            var_3 = 1;

            if ( isdefined( self._id_4795 ) )
                var_2 = _id_29A8( var_4, var_2 );

            if ( !isdefined( anim._id_3594[var_2] ) && var_2 != "stand_unstable" && var_2 != "stand_unstable_run" && var_2 != "stand_saw" && var_2 != "crouch_saw" )
            {
                var_6 = animscripts\utility::absangleclamp180( self.angles[1] - animscripts\utility::_id_404B( var_4 ) );

                if ( var_6 < 5 )
                {
                    if ( !isdefined( self._id_4795 ) )
                        var_0 = var_4.origin;

                    var_1 = animscripts\utility::_id_404B( var_4 );
                }
            }
        }
    }

    if ( isdefined( self.exitconditioncheckfunc ) )
    {
        if ( !self [[ self.exitconditioncheckfunc ]]( var_4 ) )
            return;
    }
    else if ( !_id_1D22( var_2, var_4 ) )
        return;

    var_7 = isdefined( anim._id_3594[var_2] );

    if ( !var_3 && !isdefined( self.exittypefunc ) )
        var_2 = _id_29AB();

    var_8 = ( -1 * self.lookaheaddir[0], -1 * self.lookaheaddir[1], 0 );
    var_9 = _id_401A( var_4 );
    var_10 = var_9._id_5A2F;
    var_11 = var_9._id_33E8;
    var_12 = spawnstruct();
    calculatenodetransitionangles( var_12, var_2, 0, var_1, var_8, var_10, var_11 );
    _id_8897( var_12, var_10 );
    var_13 = -1;
    var_14 = 3;

    if ( var_7 )
        var_14 = 1;

    for ( var_15 = 1; var_15 <= var_14; var_15++ )
    {
        var_13 = var_12._id_970C[var_15];

        if ( _id_1D12( var_0, var_1, var_2, var_7, var_13 ) )
            break;
    }

    if ( var_15 > var_14 )
        return;

    var_16 = distancesquared( self.origin, self._id_22A6 ) * 1.25;

    if ( distancesquared( self.origin, self.pathgoalpos ) < var_16 )
        return;

    _id_2D04( var_2, var_13 );
}

_id_29AA( var_0 )
{
    if ( animscripts\utility::_id_502C() && var_0.type == "Cover Crouch" )
        return "free_run_out_of_cover_crouch";

    if ( animscripts\cover_arrival::_id_1AFC( var_0 ) )
    {
        if ( var_0.type == "Cover Stand" )
            return "stand_saw";

        if ( var_0.type == "Cover Crouch" )
            return "crouch_saw";
        else if ( var_0.type == "Cover Prone" )
            return "prone_saw";
    }

    if ( !isdefined( anim.approach_types[var_0.type] ) )
        return;

    if ( isdefined( anim._id_740B[var_0.type] ) && anim._id_740B[var_0.type] != self.a._id_6E5A )
        return;

    var_1 = self.a._id_6E5A;

    if ( var_1 == "prone" && !isdefined( self.enableproneexitnode ) )
        var_1 = "crouch";

    var_2 = anim.approach_types[var_0.type][var_1];

    if ( animscripts\cover_arrival::_id_9C11() && var_2 == "exposed" )
        var_2 = "exposed_ready";

    if ( animscripts\utility::_id_51DE() )
    {
        if ( var_2 == "exposed" )
        {
            var_2 = "exposed_unstable";

            if ( self.movemode == "run" )
                var_2 += "_run";

            return var_2;
        }
        else if ( var_2 == "stand" )
        {
            var_2 = "stand_unstable";

            if ( self.movemode == "run" )
                var_2 += "_run";

            return var_2;
        }
    }

    if ( animscripts\utility::_id_848B() )
    {
        var_3 = var_2 + "_cqb";

        if ( isdefined( anim.archetypes["soldier"]["cover_exit"][var_3] ) )
            var_2 = var_3;
    }

    return var_2;
}

_id_1D23()
{
    if ( !isdefined( self.pathgoalpos ) )
        return 0;

    if ( isdefined( self._id_2B0E ) && self._id_2B0E )
        return 0;

    if ( isdefined( self.exitconditioncheckfunc ) )
        return 1;

    if ( !self _meth_8195() )
        return 0;

    if ( self.a._id_6E5A == "prone" && !isdefined( self.enableproneexitnode ) )
        return 0;

    if ( self.stairsstate != "none" )
        return 0;

    if ( !self _meth_81CF( "stand" ) && !isdefined( self._id_4795 ) && !isdefined( self.enableproneexitnode ) )
        return 0;

    if ( !self _meth_8572( 100 ) )
        return 0;

    return 1;
}

_id_1D22( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "exposed" || isdefined( self._id_4795 ) )
    {
        if ( self.a._id_6E5A != "stand" && self.a._id_6E5A != "crouch" )
            return 0;

        if ( self.a._id_5F5B != "stop" )
            return 0;
    }

    if ( !isdefined( self._id_4795 ) && isdefined( self.enemy ) && vectordot( self.lookaheaddir, self.enemy.origin - self.origin ) < 0 )
    {
        if ( animscripts\utility::_id_1AE2() && distancesquared( self.origin, self.enemy.origin ) < 90000 )
            return 0;
    }

    return 1;
}

_id_29AB( var_0 )
{
    if ( self.a._id_6E5A == "stand" )
        var_0 = "exposed";
    else
        var_0 = "exposed_crouch";

    if ( animscripts\cover_arrival::_id_9C11() )
        var_0 = "exposed_ready";

    if ( var_0 == "exposed" && animscripts\utility::_id_51DE() )
    {
        var_0 = "exposed_unstable";

        if ( self.movemode == "run" )
            var_0 += "_run";

        return var_0;
    }

    if ( animscripts\utility::_id_848B() )
        var_0 += "_cqb";
    else if ( isdefined( self._id_4795 ) )
        var_0 = "heat";

    return var_0;
}

_id_401A( var_0 )
{
    var_1 = spawnstruct();

    if ( isdefined( var_0 ) && isdefined( anim._id_5A2F[var_0.type] ) )
    {
        var_1._id_5A2F = anim._id_5A2F[var_0.type];
        var_1._id_33E8 = anim._id_33E8[var_0.type];
    }
    else
    {
        var_1._id_5A2F = 9;
        var_1._id_33E8 = -1;
    }

    return var_1;
}

calculatenodetransitionangles( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_0._id_9719 = [];
    var_0._id_970C = [];
    var_7 = undefined;
    var_8 = 1;
    var_9 = 0;

    if ( var_2 )
    {
        var_7 = animscripts\utility::_id_5863( "cover_trans_angles", var_1 );
        var_8 = -1;
        var_9 = 0;
    }
    else
    {
        var_7 = animscripts\utility::_id_5863( "cover_exit_angles", var_1 );
        var_8 = 1;
        var_9 = 180;
    }

    for ( var_10 = 1; var_10 <= var_5; var_10++ )
    {
        var_0._id_970C[var_10] = var_10;

        if ( var_10 == 5 || var_10 == var_6 || !isdefined( var_7[var_10] ) )
        {
            var_0._id_9719[var_10] = -1.0003;
            continue;
        }

        var_11 = ( 0, var_3 + var_8 * var_7[var_10] + var_9, 0 );
        var_12 = vectornormalize( anglestoforward( var_11 ) );
        var_0._id_9719[var_10] = vectordot( var_4, var_12 );
    }
}

_id_8897( var_0, var_1 )
{
    for ( var_2 = 2; var_2 <= var_1; var_2++ )
    {
        var_3 = var_0._id_9719[var_0._id_970C[var_2]];
        var_4 = var_0._id_970C[var_2];

        for ( var_5 = var_2 - 1; var_5 >= 1; var_5-- )
        {
            if ( var_3 < var_0._id_9719[var_0._id_970C[var_5]] )
                break;

            var_0._id_970C[var_5 + 1] = var_0._id_970C[var_5];
        }

        var_0._id_970C[var_5 + 1] = var_4;
    }
}

_id_1D12( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = ( 0, var_1, 0 );
    var_6 = anglestoforward( var_5 );
    var_7 = anglestoright( var_5 );
    var_8 = animscripts\utility::_id_5868( "cover_exit_dist", var_2, var_4 );
    var_9 = var_6 * var_8[0];
    var_10 = var_7 * var_8[1];
    var_11 = var_0 + var_9 - var_10;
    self._id_22A6 = var_11;

    if ( !var_3 && !self _meth_81E9( var_11 ) )
        return 0;

    if ( !self _meth_81C8( self.origin, var_11 ) )
        return 0;

    if ( var_4 <= 6 || var_3 )
        return 1;

    var_12 = animscripts\utility::_id_5868( "cover_exit_postdist", var_2, var_4 );
    var_9 = var_6 * var_12[0];
    var_10 = var_7 * var_12[1];
    var_13 = var_11 + var_9 - var_10;
    self._id_22A6 = var_13;
    return self _meth_81C8( var_11, var_13 );
}

_id_2D04( var_0, var_1 )
{
    var_2 = animscripts\utility::_id_5868( "cover_exit", var_0, var_1 );

    if ( self.a._id_6E5A == "prone" && !isdefined( self.enableproneexitnode ) )
        return;

    donodeexitanimation_impl( var_2 );
}
#using_animtree("generic_human");

donodeexitcleanupfunc()
{
    self _meth_8144( %animscript_root, 0.2 );
    self _meth_8193( "face default" );
    self _meth_8192( "normal", 0 );
}

donodeexitanimation_impl( var_0 )
{
    self endon( "should_stairs_transition" );
    var_1 = 0.2;

    if ( self.swimmer )
        self _meth_8192( "nogravity", 0 );
    else
        self _meth_8192( "zonly_physics", 0 );

    self _meth_8193( "face angle", self.angles[1] );
    self._id_4BB7 = 1;
    animscripts\move::pathchange_ignoreearlyturns();
    self setflaggedanimknoballrestart( "coverexit", var_0, %body, 1, var_1, self._id_5F97 );
    childthread animscripts\stairs_utility::threadcheckstairstransition( var_0, 0, 0.1, ::donodeexitcleanupfunc );
    animscripts\shared::_id_2D06( "coverexit" );
    self notify( "StartListeningForCoverApproach" );
    self notify( "killThreadCheckStairsTransition" );

    if ( !isdefined( self.enableproneexitnode ) || self.a._id_6E5A != "prone" )
        self.a._id_6E5A = "stand";

    self.a._id_5F5B = "run";
    self._id_4BB7 = undefined;
    animscripts\move::pathchange_readytoturn();
    animscripts\utility::checkforturnwithanim( var_0 );
    self _meth_8193( "face motion" );
    self _meth_8192( "none", 0 );
    childthread animscripts\stairs_utility::threadcheckstairstransition( var_0, 0, 0.1 );
    _id_3794( "coverexit", var_0 );
    self notify( "killThreadCheckStairsTransition" );
    self _meth_8144( %animscript_root, 0.2 );
    self _meth_8193( "face default" );
    self _meth_8192( "normal", 0 );
}

_id_3794( var_0, var_1 )
{
    self endon( "move_loop_restart" );
    self endon( "should_stairs_transition" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_29A8( var_0, var_1 )
{
    if ( var_0.type == "Cover Right" )
        var_1 = "heat_right";
    else if ( var_0.type == "Cover Left" )
        var_1 = "heat_left";

    return var_1;
}

_id_3F8B()
{
    var_0 = undefined;

    if ( !isdefined( self._id_4795 ) )
        var_1 = 400;
    else
        var_1 = 4096;

    if ( animscripts\utility::_id_51B0() )
        var_1 = 1024;

    if ( isdefined( self.node ) && distancesquared( self.origin, self.node.origin ) < var_1 )
        var_0 = self.node;
    else if ( isdefined( self.prevnode ) && distancesquared( self.origin, self.prevnode.origin ) < var_1 )
        var_0 = self.prevnode;

    if ( isdefined( var_0 ) && isdefined( self._id_4795 ) && animscripts\utility::absangleclamp180( self.angles[1] - var_0.angles[1] ) > 30 )
        return undefined;

    return var_0;
}

_id_2564()
{
    var_0 = self._id_2564;

    if ( !isdefined( self._id_67D8 ) )
        self._id_2564 = undefined;

    var_1 = [[ var_0 ]]();

    if ( !isdefined( self._id_67D8 ) )
        self._id_8D2F = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 0.2;

    self _meth_8144( %animscript_root, var_1 );
    self _meth_8193( "face default" );
    self _meth_8192( "none", 0 );
}

_id_267A( var_0 )
{
    if ( !animscripts\cover_arrival::_id_267B() )
        return;
}
