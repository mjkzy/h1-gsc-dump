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

_id_5F4C()
{
    cqb_checkchangeweapon();

    if ( self.a._id_6E5A != "stand" )
    {
        self _meth_8144( %animscript_root, 0.2 );

        if ( self.a._id_6E5A == "prone" )
            animscripts\utility::_id_344B( 1 );

        self.a._id_6E5A = "stand";
    }

    self.a._id_5F5B = self.movemode;
    _id_22DF();
    self _meth_8144( %h1_stairs, 0.1 );

    if ( cqb_checkreload() )
        return;

    var_0 = _id_29A6();
    var_1 = cqb_gettranstime();
    var_2 = 0.2;
    thread cqb_scaleforslowdown( var_0, var_2 );
    cqb_animate( var_0, var_2, var_1 );
    _id_22D5( var_0 );
    animscripts\notetracks::_id_2D0B( var_2, "runanim" );
}

cqb_checkchangeweapon()
{
    if ( !animscripts\stairs_utility::isonstairs() )
        animscripts\run::_id_8B10();
}

cqb_checkreload()
{
    return !animscripts\stairs_utility::isonstairs() && animscripts\run::_id_8B11();
}

cqb_gettranstime()
{
    var_0 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

    if ( var_0 == "none" && !animscripts\stairs_utility::isonstairs() )
        return 0.3;
    else
        return 0.1;
}

cqb_animate( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_9369 ) )
        var_3 = self._id_9369;
    else
        var_3 = 0;

    self._id_9369 = gettime();

    if ( !animscripts\stairs_utility::isonstairs() )
    {
        var_4 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();
        var_5 = %walk_and_run_loops;

        if ( self._id_9369 - var_3 > var_1 * 1000 && var_4 == "none" )
            var_5 = %stand_and_crouch;

        self setflaggedanimknoball( "runanim", var_0, var_5, 1, var_2, self._id_5F65 * self.cqb_slowdown_scale, 1 );
        animscripts\run::_id_7FB7( animscripts\utility::_id_5863( "cqb", "move_b" ), animscripts\utility::_id_5863( "cqb", "move_l" ), animscripts\utility::_id_5863( "cqb", "move_r" ) );
        thread animscripts\run::_id_7F3E( "cqb" );
    }
    else
    {
        self notify( "stop_move_anim_update" );
        self._id_9AC9 = undefined;
        var_5 = %body;
        self setflaggedanimknoball( "runanim", var_0, var_5, 1, var_2, self._id_5F65 * self.cqb_slowdown_scale, 1 );
    }
}

_id_29A6()
{
    if ( isdefined( self._id_2563 ) && isdefined( self._id_2563["cqb"] ) )
        return animscripts\run::_id_40BD();

    if ( animscripts\stairs_utility::isonstairs() )
    {
        var_0 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
        return animscripts\utility::_id_5863( "cqb", var_0 );
    }

    if ( self.movemode == "walk" )
        return animscripts\utility::_id_5863( "cqb", "move_f" );

    if ( isdefined( self.a.bdisablemovetwitch ) && self.a.bdisablemovetwitch )
        return animscripts\utility::_id_5863( "cqb", "straight" );

    if ( !isdefined( self.a._id_76D4 ) )
        return animscripts\utility::_id_5863( "cqb", "straight" );

    var_1 = animscripts\utility::_id_5863( "cqb", "straight_twitch" );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return animscripts\utility::_id_5863( "cqb", "straight" );

    var_2 = animscripts\utility::_id_40A6( self.a._id_76D4, 4 );

    if ( var_2 == 0 )
        return animscripts\utility::gettwitchanim( var_1 );

    return animscripts\utility::_id_5863( "cqb", "straight" );
}

_id_22D7()
{
    self endon( "movemode" );
    self endon( "should_stairs_transition" );
    self _meth_8193( "face motion" );
    var_0 = "reload_" + animscripts\combat_utility::_id_4143();
    var_1 = animscripts\utility::_id_5863( "cqb", "reload" );

    if ( isarray( var_1 ) )
        var_1 = var_1[randomint( var_1.size )];

    thread cqb_scaleforslowdown( var_1, getanimlength( var_1 ) );
    self setflaggedanimknoballrestart( var_0, var_1, %body, 1, 0.25, self._id_5F65 * self.cqb_slowdown_scale );
    _id_22D5( var_1 );
    animscripts\run::_id_7FB7( animscripts\utility::_id_5863( "cqb", "move_b" ), animscripts\utility::_id_5863( "cqb", "move_l" ), animscripts\utility::_id_5863( "cqb", "move_r" ) );
    thread animscripts\run::_id_7F3E( "cqb" );
    childthread animscripts\stairs_utility::threadcheckstairstransition( var_1, 0, 0.3 );
    animscripts\shared::_id_2D06( var_0 );
    self notify( "killThreadCheckStairsTransition" );
}

_id_22DF()
{
    var_0 = animscripts\stairs_utility::isonstairs();
    var_1 = !var_0 && animscripts\move::_id_5A61();
    animscripts\run::_id_800D( var_1 );

    if ( var_0 )
        animscripts\run::_id_315D();
    else
        thread animscripts\run::_id_35B6();
}

_id_8308()
{
    level._id_22DE = [];
    var_0 = getentarray( "cqb_point_of_interest", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level._id_22DE[var_1] = var_0[var_1].origin;
        var_0[var_1] delete();
    }
}

_id_377E()
{
    if ( isdefined( anim._id_3781 ) )
        return;

    anim._id_3781 = 1;

    if ( !level._id_22DE.size )
        return;

    for (;;)
    {
        var_0 = getaiarray();
        var_1 = 0;

        foreach ( var_3 in var_0 )
        {
            if ( isalive( var_3 ) && var_3 animscripts\utility::_id_50E9() && !isdefined( var_3._id_2A8B ) )
            {
                var_4 = var_3.a._id_5F5B != "stop";
                var_5 = ( var_3.origin[0], var_3.origin[1], var_3 getshootatpos()[2] );
                var_6 = var_5;
                var_7 = anglestoforward( var_3.angles );

                if ( var_4 )
                {
                    var_8 = bullettrace( var_6, var_6 + var_7 * 128, 0, undefined );
                    var_6 = var_8["position"];
                }

                var_9 = -1;
                var_10 = 1048576;

                for ( var_11 = 0; var_11 < level._id_22DE.size; var_11++ )
                {
                    var_12 = level._id_22DE[var_11];
                    var_13 = distancesquared( var_12, var_6 );

                    if ( var_13 < var_10 )
                    {
                        if ( var_4 )
                        {
                            if ( distancesquared( var_12, var_5 ) < 4096 )
                                continue;

                            var_14 = vectordot( vectornormalize( var_12 - var_5 ), var_7 );

                            if ( var_14 < 0.643 || var_14 > 0.966 )
                                continue;
                        }
                        else if ( var_13 < 2500 )
                            continue;

                        if ( !sighttracepassed( var_6, var_12, 0, undefined ) )
                            continue;

                        var_10 = var_13;
                        var_9 = var_11;
                    }
                }

                if ( var_9 < 0 )
                    var_3._id_22D6 = undefined;
                else
                    var_3._id_22D6 = level._id_22DE[var_9];

                wait 0.05;
                var_1 = 1;
            }
        }

        if ( !var_1 )
            wait 0.25;
    }
}

_id_22D5( var_0 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, "run", self._id_35C7 );
}

_id_22D0()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}

cqb_scaleforslowdown( var_0, var_1 )
{
    self.cqb_slowdown_anim = var_0;
    self.cqb_slowdown_move_time = var_1;

    if ( isdefined( self.cqb_slowdown_watcher_running ) )
        return;

    self.cqb_slowdown_watcher_running = 1;
    thread cqb_slowdownwatcher_ender();
    cqb_slowdownwatcher();
    self.cqb_slowdown_watcher_running = undefined;
}

cqb_slowdownwatcher()
{
    self notify( "end_cqb_slowdown_watcher" );
    self endon( "death" );
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    self endon( "end_cqb_slowdown_watcher" );

    if ( isdefined( self.cqb_slowdown_scale ) && self.cqb_slowdown_scale != 1 )
        self waittill( "slow_down_stop" );

    for (;;)
    {
        cqb_slowdownscale( 1 );
        self waittill( "slow_down_start" );
        cqb_slowdownscale( 0.75 );
        self waittill( "slow_down_stop" );
    }
}

cqb_slowdownscale( var_0 )
{
    self.cqb_slowdown_scale = var_0;
    self _meth_83C5( self.cqb_slowdown_anim, self._id_5F65 * self.cqb_slowdown_scale );
}

cqb_slowdownwatcher_ender()
{
    self endon( "death" );
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    wait(self.cqb_slowdown_move_time);

    while ( animscripts\utility::_id_848B() )
        wait(self.cqb_slowdown_move_time);

    self notify( "end_cqb_slowdown_watcher" );
}
