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

_id_5F70()
{
    var_0 = [[ self._id_1D46 ]]( "stand" );

    switch ( var_0 )
    {
        case "stand":
            if ( animscripts\setposemovement::_id_8B0F() )
                return;

            if ( isdefined( self._id_76AF ) )
            {
                animscripts\move::_id_5F7C( self._id_76AF, self._id_76AE );
                return;
            }

            if ( _id_8B10() )
                return;

            if ( _id_8B11() )
                return;

            animscripts\utility::_id_9B2B();

            if ( animscripts\utility::_id_5124() )
                _id_8B12();
            else
                _id_8B13();

            break;
        case "crouch":
            if ( animscripts\setposemovement::_id_2484() )
                return;

            if ( isdefined( self._id_2485 ) )
                _id_2487();
            else
                _id_2486();

            break;
        default:
            if ( animscripts\setposemovement::_id_7027() )
                return;

            _id_7023();
            break;
    }
}

_id_40BD()
{
    if ( !isdefined( self.a._id_5F43 ) )
    {
        var_0 = animscripts\utility::_id_5863( "run", "straight" );
        return var_0;
    }

    var_1 = animscripts\stairs_utility::isonstairs();

    if ( !self.facemotion && !self _meth_8195() )
    {
        var_2 = abs( self _meth_8194() );

        if ( !var_1 || var_2 > 45 )
        {
            var_0 = animscripts\utility::_id_402D( "move_f" );
            return var_0;
        }
    }

    if ( var_1 )
    {
        var_3 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
        var_0 = animscripts\utility::_id_402D( var_3 );
        return var_0;
    }
    else if ( animscripts\utility::_id_9C3B() )
    {
        var_0 = animscripts\utility::_id_402D( "smg_straight" );
        return var_0;
    }

    if ( animscripts\utility::_id_5124() || isdefined( self._id_6165 ) && self._id_6165 || isdefined( self.a._id_135B ) && self.a._id_135B )
    {
        var_0 = animscripts\utility::_id_402D( "straight" );
        return var_0;
    }

    if ( !isdefined( self.a._id_76D4 ) )
        return animscripts\utility::_id_402D( "straight" );

    var_4 = animscripts\utility::_id_402D( "straight_twitch" );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
    {
        var_0 = animscripts\utility::_id_402D( "straight" );
        return var_0;
    }

    var_5 = animscripts\utility::_id_40A6( self.a._id_76D4, 4 );

    if ( var_5 == 0 )
    {
        var_0 = animscripts\utility::gettwitchanim( var_4 );
        return var_0;
    }

    var_0 = animscripts\utility::_id_402D( "straight" );
    return var_0;
}

_id_3F43()
{
    if ( !isdefined( self.a._id_5F43 ) )
    {
        if ( animscripts\utility::_id_9C3B() )
            return animscripts\utility::_id_5863( "smg_crouch_run", "crouch" );
        else
            return animscripts\utility::_id_5863( "run", "crouch" );
    }

    return animscripts\utility::_id_402D( "crouch" );
}

_id_7023()
{
    self.a._id_5F5B = "run";
    self _meth_8154( "runanim", animscripts\utility::_id_402D( "prone" ), 1, 0.3, self._id_5F65 );
    _id_76A8();
    animscripts\notetracks::_id_2D0B( 0.25, "runanim" );
}
#using_animtree("generic_human");

_id_4E05()
{
    if ( !isdefined( self._id_76D6 ) )
    {
        self notify( "stop_move_anim_update" );
        self._id_9AC9 = undefined;
        self _meth_8144( %combatrun_backward, 0.2 );
        self _meth_8144( %combatrun_right, 0.2 );
        self _meth_8144( %combatrun_left, 0.2 );
        self _meth_8144( %w_aim_2, 0.2 );
        self _meth_8144( %w_aim_4, 0.2 );
        self _meth_8144( %w_aim_6, 0.2 );
        self _meth_8144( %w_aim_8, 0.2 );
        self._id_76D6 = 1;
    }
}

_id_8F00()
{
    if ( isdefined( self._id_76D6 ) )
    {
        self _meth_8144( %run_n_gun, 0.2 );
        self._id_76D6 = undefined;
    }

    return 0;
}

_id_76D6( var_0 )
{
    if ( var_0 )
    {
        var_1 = _id_4098( 0.2 );
        var_2 = var_1 < 0;
    }
    else
    {
        var_1 = 0;
        var_2 = self._id_76DA < 0;
    }

    var_3 = self._id_5A52;
    var_4 = self._id_76D9;
    var_5 = self._id_76D8;

    if ( !var_0 || squared( var_1 ) > var_3 * var_3 )
    {
        self _meth_8144( %add_fire, 0 );

        if ( squared( self._id_76DA ) < var_5 * var_5 )
        {
            self._id_76DA = 0;
            self._id_76D6 = undefined;
            return 0;
        }
        else if ( self._id_76DA > 0 )
            self._id_76DA -= var_5;
        else
            self._id_76DA += var_5;
    }
    else
    {
        var_6 = var_1 / var_3;
        var_7 = var_6 - self._id_76DA;

        if ( abs( var_7 ) < var_4 * 0.7 )
            self._id_76DA = var_6;
        else if ( var_7 > 0 )
            self._id_76DA += var_5;
        else
            self._id_76DA -= var_5;
    }

    _id_4E05();
    runngun_animate( var_4, var_2 );
    _id_76B3( undefined );
    self.a._id_0AA5 = gettime() + 500;

    if ( var_0 && isplayer( self.enemy ) )
        self _meth_81ed();

    return 1;
}

runngun_animate( var_0, var_1 )
{
    var_2 = 1 - var_1;
    var_3 = abs( self._id_76DA );
    var_4 = animscripts\utility::_id_5864( "run_n_gun" );

    if ( animscripts\stairs_utility::isonstairs() )
    {
        var_5 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
        var_6 = var_4[var_5];
        self _meth_8144( %body, 0.1 );
        var_7 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

        if ( var_7 == "in" )
            var_8 = 0.1;
        else
            var_8 = 0.2;

        self.laststairrunngunanimplayed = var_6;
        self _meth_8154( "runanim", var_6, 1, var_8, 1, 1 );
    }
    else
    {
        if ( isdefined( self.laststairrunngunanimplayed ) )
        {
            self _meth_8144( self.laststairrunngunanimplayed, 0.1 );
            self.laststairrunngunanimplayed = undefined;
        }

        self _meth_8144( %h1_stairs, 0.1 );

        if ( var_3 > var_0 )
        {
            var_9 = ( var_3 - var_0 ) / var_0;
            var_9 = clamp( var_9, 0, 1 );
            self _meth_8144( var_4["F"], 0.2 );
            self _meth_814e( var_4["L"], ( 1.0 - var_9 ) * var_1, 0.2 );
            self _meth_814e( var_4["R"], ( 1.0 - var_9 ) * var_2, 0.2 );
            self _meth_814e( var_4["LB"], var_9 * var_1, 0.2 );
            self _meth_814e( var_4["RB"], var_9 * var_2, 0.2 );
        }
        else
        {
            var_9 = clamp( var_3 / var_0, 0, 1 );
            self _meth_814e( var_4["F"], 1.0 - var_9, 0.2 );
            self _meth_814e( var_4["L"], var_9 * var_1, 0.2 );
            self _meth_814e( var_4["R"], var_9 * var_2, 0.2 );

            if ( var_0 < 1 )
            {
                self _meth_8144( var_4["LB"], 0.2 );
                self _meth_8144( var_4["RB"], 0.2 );
            }
        }

        var_7 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

        if ( var_7 != "none" )
            var_8 = 0.1;
        else
            var_8 = 0.3;

        self _meth_8154( "runanim", %run_n_gun, 1, var_8, 0.8 );
    }
}

_id_76D7()
{
    _id_4E05();
    var_0 = animscripts\utility::_id_5863( "run_n_gun", "move_back" );
    self _meth_8154( "runanim", var_0, 1, 0.3, 0.8 );
    _id_76B3( var_0 );

    if ( isplayer( self.enemy ) )
        self _meth_81ed();

    animscripts\notetracks::_id_2D0B( 0.2, "runanim" );
    self _meth_8144( var_0, 0.2 );
}

_id_71D1()
{
    self endon( "killanimscript" );

    for (;;)
    {
        wait 0.2;

        if ( !isdefined( self._id_717B ) )
            break;

        if ( !isdefined( self.pathgoalpos ) || distancesquared( self.pathgoalpos, self.origin ) < squared( 80 ) )
        {
            _id_31C1();
            self notify( "interrupt_react_to_bullet" );
            break;
        }
    }
}

_id_31C1()
{
    self _meth_8193( "face default" );
    self._id_717B = undefined;
    self._id_7409 = undefined;
}

_id_76E3()
{
    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
        return;

    _id_315D();
    self endon( "interrupt_react_to_bullet" );
    self._id_717B = 1;
    self _meth_8193( "face motion" );
    var_0 = animscripts\utility::_id_5864( "running_react_to_bullets" );
    var_1 = randomint( var_0.size );

    if ( var_1 == anim._id_55D5 )
        var_1 = ( var_1 + 1 ) % var_0.size;

    anim._id_55D5 = var_1;
    var_2 = var_0[var_1];
    self setflaggedanimknobrestart( "reactanim", var_2, 1, 0.5, 1 );
    _id_76B3( var_2 );
    thread _id_71D1();
    animscripts\shared::_id_2D06( "reactanim" );
    _id_31C1();
}

_id_2568()
{
    _id_315D();
    self._id_717B = 1;
    self _meth_8193( "face motion" );
    var_0 = randomint( self._id_76B1.size );
    var_1 = self._id_76B1[var_0];
    self setflaggedanimknobrestart( "reactanim", var_1, 1, 0.5, 1.0 );
    _id_76B3( var_1 );
    thread _id_71D1();
    animscripts\shared::_id_2D06( "reactanim" );
    _id_31C1();
}

_id_40E3()
{
    var_0 = undefined;

    if ( isdefined( self.grenade ) )
        var_0 = animscripts\utility::_id_402D( "sprint_short" );

    if ( !isdefined( var_0 ) )
        var_0 = animscripts\utility::_id_402D( "sprint" );

    return var_0;
}

_id_84B1()
{
    if ( isdefined( self._id_8AA8 ) )
        return 1;

    if ( isdefined( self.grenade ) && isdefined( self.enemy ) && self.frontshieldanglecos == 1 )
        return distancesquared( self.origin, self.enemy.origin ) > 90000;

    return 0;
}

_id_84B2()
{
    if ( isdefined( self._id_6097 ) )
        return 0;

    if ( !self.facemotion || animscripts\stairs_utility::isonstairs() )
        return 0;

    var_0 = gettime();

    if ( isdefined( self._id_25F1 ) )
    {
        if ( var_0 < self._id_25F1 )
            return 1;

        if ( var_0 - self._id_25F1 < 6000 )
            return 0;
    }

    if ( !isdefined( self.enemy ) || !issentient( self.enemy ) )
        return 0;

    if ( randomint( 100 ) < 25 && self _meth_81c4( self.enemy ) + 2000 > var_0 )
    {
        self._id_25F1 = var_0 + 2000 + randomint( 1000 );
        return 1;
    }

    return 0;
}

_id_402E()
{
    var_0 = self._id_5F65;

    if ( animscripts\stairs_utility::isonstairs() )
        var_0 = 1;

    return var_0;
}

recentlydisabledcqb()
{
    if ( isdefined( self.cqbdisabledtime ) )
    {
        var_0 = gettime() - self.cqbdisabledtime;
        return var_0 < 500;
    }

    return 0;
}

_id_8B12()
{
    var_0 = _id_402E();
    var_1 = animscripts\stairs_utility::isonstairs();

    if ( !var_1 )
        self _meth_8145( %combatrun, 1.0, 0.5, var_0 );

    var_2 = 0;
    var_3 = !var_1 && isdefined( self._id_7409 ) && gettime() - self._id_7409 < 100;
    var_4 = animscripts\utility::getreacttobulletchance();

    if ( var_3 && randomfloat( 1 ) < var_4 )
    {
        _id_8F00();
        _id_800D( 0 );
        _id_76E3();
        return;
    }

    if ( !var_1 && _id_84B1() )
    {
        var_5 = _id_40E3();
        self _meth_8154( "runanim", var_5, 1, 0.5, 1.0 );
        _id_76B3( var_5 );
        _id_800D( 0 );
        var_2 = 1;
    }
    else if ( isdefined( self.enemy ) && animscripts\move::_id_5A61() )
    {
        _id_800D( 1 );

        if ( !var_1 && !self.facemotion )
            thread _id_35B6();
        else if ( self._id_8415 != "none" && !isdefined( self._id_6163 ) )
        {
            _id_315D();

            if ( _id_1AE9() )
                var_2 = _id_76D6( 1 );
            else if ( !var_1 && _id_1AE8() )
            {
                _id_76D7();
                return;
            }
        }
        else if ( isdefined( self._id_76DA ) && self._id_76DA != 0 )
            var_2 = _id_76D6( 0 );
    }
    else if ( isdefined( self._id_76DA ) && self._id_76DA != 0 )
    {
        _id_800D( 0 );
        var_2 = _id_76D6( 0 );
    }
    else
        _id_800D( 0 );

    if ( !var_2 )
    {
        _id_8F00();
        var_4 = animscripts\utility::getreacttobulletchance();

        if ( var_3 && var_4 != 0 )
        {
            _id_76E3();
            return;
        }

        if ( !var_1 && _id_84B2() )
            var_6 = animscripts\utility::_id_402D( "sprint_short" );
        else
            var_6 = _id_40BD();

        if ( recentlydisabledcqb() )
            var_7 = 0.3;
        else
            var_7 = 0.1;

        standrun_combatnormal_animate( var_6, var_7 );
    }

    animscripts\notetracks::_id_2D0B( 0.2, "runanim" );
}

standrun_combatnormal_animate( var_0, var_1 )
{
    if ( !animscripts\stairs_utility::isonstairs() )
    {
        self _meth_8144( %h1_stairs, var_1 );
        self _meth_8155( "runanim", var_0, 1, var_1, 1, 1 );
        _id_76B3( var_0 );
        _id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ), self._id_855F );
        thread _id_7F3E( "run" );
    }
    else
    {
        self notify( "stop_move_anim_update" );
        self._id_9AC9 = undefined;
        self _meth_8144( %body, var_1 );
        self _meth_8154( "runanim", var_0, 1, var_1, 1, 1 );
        _id_76B3( var_0 );
    }
}

_id_40E5( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "none";

    if ( var_0 == var_1 )
        return undefined;

    var_3 = undefined;

    switch ( var_0 )
    {
        case "up":
            var_3 = "stairs_up_out";
            break;
        case "down":
            var_3 = "stairs_down_out";
            break;
        case "turn_L90":
            var_3 = "turn_90l_2_stairs_" + var_1;
            break;
        case "turn_R90":
            var_3 = "turn_90r_2_stairs_" + var_1;
            break;
        case "none":
            var_3 = "stairs_" + var_1 + "_in";
            break;
        default:
            break;
    }

    var_4 = isdefined( self.enemy ) && animscripts\utility::_id_5124() && !isdefined( self._id_6163 ) && _id_1AE9() && isdefined( self._id_8415 ) && self._id_8415 != "none";
    var_3 = var_3 + "_" + var_2;

    if ( animscripts\utility::_id_848B() )
        return animscripts\utility::_id_5863( "cqb", var_3 );
    else if ( var_4 )
        return animscripts\utility::_id_5863( "run_n_gun", var_3 );
    else if ( isdefined( self.a._id_5F43 ) )
        return animscripts\utility::_id_402D( var_3 );
    else
        return animscripts\utility::_id_5863( "run", var_3 );
}

_id_35B6()
{
    if ( isdefined( self._id_0972 ) )
        return;

    self._id_0972 = 1;
    self endon( "killanimscript" );
    self endon( "end_face_enemy_tracking" );
    self _meth_8177();
    var_0 = undefined;

    if ( isdefined( self._id_20B3 ) && isdefined( self._id_20B3["walk_aims"] ) )
    {
        self _meth_814e( self._id_20B3["walk_aims"]["walk_aim_2"] );
        self _meth_814e( self._id_20B3["walk_aims"]["walk_aim_4"] );
        self _meth_814e( self._id_20B3["walk_aims"]["walk_aim_6"] );
        self _meth_814e( self._id_20B3["walk_aims"]["walk_aim_8"] );
    }
    else
    {
        var_1 = "walk";

        if ( animscripts\utility::_id_848B() && isdefined( animscripts\utility::_id_5863( "cqb", "aim_2" ) ) )
            var_1 = "cqb";

        var_2 = animscripts\utility::_id_5864( var_1 );
        self _meth_814e( var_2["aim_2"] );
        self _meth_814e( var_2["aim_4"] );
        self _meth_814e( var_2["aim_6"] );
        self _meth_814e( var_2["aim_8"] );

        if ( isdefined( var_2["aim_5"] ) )
        {
            self _meth_814e( var_2["aim_5"] );
            var_0 = %w_aim_5;
        }
    }

    animscripts\track::_id_9502( %w_aim_2, %w_aim_4, %w_aim_6, %w_aim_8, var_0 );
}

_id_315D()
{
    self._id_0972 = undefined;
    self notify( "end_face_enemy_tracking" );
}

_id_800D( var_0 )
{
    var_1 = isdefined( self._id_182C );

    if ( var_0 )
    {
        self._id_182C = var_0;

        if ( !var_1 )
        {
            thread _id_76CA();
            thread _id_76E9();
        }
    }
    else
    {
        self._id_182C = undefined;

        if ( var_1 )
        {
            self notify( "end_shoot_while_moving" );
            self notify( "end_face_enemy_tracking" );
            self._id_83E7 = undefined;
            self._id_0972 = undefined;
            self._id_76D6 = undefined;
        }
    }
}

_id_76CA()
{
    self endon( "killanimscript" );
    self endon( "end_shoot_while_moving" );
    animscripts\shoot_behavior::_id_2743( "normal" );
}

_id_76E9()
{
    self endon( "killanimscript" );
    self endon( "end_shoot_while_moving" );
    animscripts\move::_id_841B();
}

_id_0977()
{
    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_0 = animscripts\combat_utility::_id_3DB2( self.enemy );
    else
        var_0 = self.enemy getshootatpos();

    var_1 = self _meth_81bd();
    var_2 = vectortoangles( var_0 - self _meth_81bc() );

    if ( animscripts\utility::_id_06C4( var_1[1] - var_2[1] ) > 15 )
        return 0;

    return animscripts\utility::_id_06C4( var_1[0] - var_2[0] ) <= 20;
}

_id_1AE9()
{
    if ( ( !isdefined( self._id_76DA ) || self._id_76DA == 0 ) && abs( self _meth_8194() ) > self._id_5A52 )
        return 0;

    return 1;
}

_id_1AE8()
{
    if ( 180 - abs( self _meth_8194() ) >= 45 )
        return 0;

    var_0 = _id_4098( 0.2 );

    if ( abs( var_0 ) > 30 )
        return 0;

    return 1;
}

_id_1AE7()
{
    return animscripts\move::_id_5A61() && isdefined( self.enemy ) && ( _id_1AE9() || _id_1AE8() );
}

_id_4098( var_0 )
{
    var_1 = self.origin;
    var_2 = self.angles[1] + self _meth_8194();
    var_1 += ( cos( var_2 ), sin( var_2 ), 0 ) * length( self.velocity ) * var_0;
    var_3 = self.angles[1] - vectortoyaw( self.enemy.origin - var_1 );
    var_3 = angleclamp180( var_3 );
    return var_3;
}

_id_5F06()
{
    if ( !animscripts\stairs_utility::using_h1_stairs_system() )
        return 0;

    if ( isdefined( self._id_993B ) && self._id_993B == gettime() )
        return 0;

    var_0 = animscripts\move::getexpectedcurrentmoveanim();
    self.stairstransition = undefined;
    var_1 = animscripts\stairs_utility::getstairstransition( var_0["anim"], 1, var_0["updateTime"] );

    if ( !isdefined( var_1 ) )
        return 0;

    animscripts\stairs_utility::preparedetectedstairstransition();
    var_2 = var_1["transitionAnim"];

    if ( !isdefined( var_2 ) )
        return 0;

    self notify( "stop_move_anim_update" );
    self._id_9AC9 = undefined;
    self.isinstairstransition = 1;
    var_3 = 1 / self._id_5F65;
    var_4 = getnotetracktimes( var_2, "stair_edge" );
    var_5 = getanimlength( var_2 );

    if ( isdefined( self.stairstransition["startTime"] ) )
        var_6 = var_4[0] - self.stairstransition["startTime"];
    else
        var_6 = var_4[0] * var_5 / var_3;

    var_7 = var_1["currentContext"];

    if ( var_7 == "turn_L90" || var_7 == "turn_R90" )
    {
        var_8 = var_6 * 0.85;
        self._id_4BB7 = 1;
    }
    else
        var_8 = min( var_6, 0.1 );

    self _meth_8144( %body, var_8 );
    self setflaggedanimknoballrestart( "runanim", var_2, %body, 1, var_8, var_3 );
    _id_76B3( var_2 );

    if ( isdefined( self.stairstransition["startTime"] ) )
        self setanimtime( var_2, self.stairstransition["startTime"] );

    var_9 = isdefined( var_1["inStairTransitionIn"] ) && var_1["inStairTransitionIn"];
    var_10 = 0.05 * var_3 / var_5;
    childthread animscripts\stairs_utility::stairupdatepos( var_2, self.origin, self.stairstransition, var_4[0], var_9, var_10 );
    thread animscripts\stairs_utility::waitforstairedge( var_2, var_4[0] );
    animscripts\shared::_id_2D06( "runanim" );
    self._id_4BB7 = undefined;
    self.lastfinishedstairtransitiontime = gettime();

    if ( var_9 )
        self.lastfinishedstairtransitiontype = "in";
    else
        self.lastfinishedstairtransitiontype = "out";

    self.isinstairstransition = undefined;
    return 1;
}

_id_8B13()
{
    self endon( "movemode" );
    var_0 = animscripts\stairs_utility::isonstairs();

    if ( !var_0 )
        self _meth_8144( %combatrun, 0.6 );
    else
        self _meth_8144( %body, 0.1 );

    if ( !var_0 && _id_84B1() )
        var_1 = _id_40E3();
    else
        var_1 = _id_40BD();

    var_2 = standrun_noncombatnormal_gettranstime();
    standrun_noncombatnormal_animate( var_1, var_2 );
    var_3 = 0;

    if ( self.leanamount > 0 && self.leanamount < 0.998 )
        var_3 = 1;
    else if ( self.leanamount < 0 && self.leanamount > -0.998 )
        var_3 = -1;

    var_4 = max( 0.2, var_2 );
    animscripts\notetracks::_id_2D0B( var_4, "runanim" );
}

standrun_noncombatnormal_gettranstime()
{
    var_0 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

    if ( var_0 == "none" && !animscripts\stairs_utility::isonstairs() )
        return 0.3;
    else
        return 0.1;
}

standrun_noncombatnormal_animate( var_0, var_1 )
{
    var_2 = animscripts\stairs_utility::isonstairs();
    var_3 = _id_402E();

    if ( !var_2 )
    {
        self _meth_8144( %h1_stairs, 0.1 );
        self _meth_8149( %combatrun, %body, 1, 0.2, var_3 );
    }

    self _meth_8154( "runanim", var_0, 1, var_1, 1, 1 );
    _id_76B3( var_0 );

    if ( !var_2 )
    {
        _id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ) );
        thread _id_7F3E( "run" );
    }
    else
    {
        self notify( "stop_move_anim_update" );
        self._id_9AC9 = undefined;
    }
}

_id_2487()
{
    self endon( "movemode" );
    self setflaggedanimknoball( "runanim", self._id_2485, %body, 1, 0.4, self._id_5F65 );
    _id_76B3( self._id_2485 );
    animscripts\shared::_id_2D06( "runanim" );
}

_id_2486()
{
    self endon( "movemode" );
    var_0 = _id_3F43();
    self _meth_8145( var_0, 1, 0.4 );
    var_1 = "run";

    if ( animscripts\utility::_id_9C3B() )
        var_1 = "smg_crouch_run";

    thread _id_9B3B( "crouchrun", var_0, animscripts\utility::_id_5863( var_1, "crouch_b" ), animscripts\utility::_id_5863( var_1, "crouch_l" ), animscripts\utility::_id_5863( var_1, "crouch_r" ) );
    self setflaggedanimknoball( "runanim", %crouchrun, %body, 1, 0.2, self._id_5F65 );
    _id_76B3( undefined );
    animscripts\notetracks::_id_2D0B( 0.2, "runanim" );
}

_id_8B11()
{
    var_0 = isdefined( self.a._id_0AA5 ) && self.a._id_0AA5 > gettime();
    var_0 = var_0 || isdefined( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) < 65536;

    if ( var_0 )
    {
        if ( !animscripts\combat_utility::_id_6089( 0 ) )
            return 0;
    }
    else if ( !animscripts\combat_utility::_id_6089( 0.5 ) )
        return 0;

    if ( isdefined( self.grenade ) )
        return 0;

    if ( !self.facemotion || animscripts\stairs_utility::isonstairs() )
        return 0;

    if ( isdefined( self._id_2D3B ) || isdefined( self._id_6164 ) )
        return 0;

    if ( _id_1AE7() && !animscripts\combat_utility::_id_6089( 0 ) )
        return 0;

    if ( !isdefined( self.pathgoalpos ) || distancesquared( self.origin, self.pathgoalpos ) < 65536 )
        return 0;

    var_1 = getdvarfloat( "ai_runReload_minLookahead", 320 );

    if ( var_1 > 0 && self.lookaheaddist < var_1 )
        return 0;

    var_2 = angleclamp180( self _meth_8194() );

    if ( abs( var_2 ) > 25 )
        return 0;

    if ( !animscripts\utility::_id_9C35() )
        return 0;

    if ( !_id_76D5() )
        return 0;

    if ( animscripts\utility::_id_848B() )
        animscripts\cqb::_id_22D7();
    else
        _id_8B14();

    self notify( "abort_reload" );
    self _meth_8193( "face default" );
    return 1;
}

_id_8B14()
{
    self endon( "movemode" );
    self endon( "should_stairs_transition" );
    self _meth_8193( "face motion" );
    var_0 = "reload_" + animscripts\combat_utility::_id_4143();
    var_1 = animscripts\utility::_id_5863( "run", "reload" );

    if ( isarray( var_1 ) )
        var_1 = var_1[randomint( var_1.size )];

    self setflaggedanimknoballrestart( var_0, var_1, %body, 1, 0.25 );
    _id_76B3( var_1 );
    self._id_9ACA = 1;
    _id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ) );
    thread _id_7F3E( "run" );
    childthread animscripts\stairs_utility::threadcheckstairstransition( var_1, 0, 0.3 );
    animscripts\shared::_id_2D06( var_0 );
    self._id_9ACA = undefined;
    self notify( "killThreadCheckStairsTransition" );
}

_id_76D5()
{
    var_0 = self _meth_8151( %walk_and_run_loops );
    var_1 = getanimlength( animscripts\utility::_id_5863( "run", "straight" ) ) / 3.0;
    var_0 *= 3.0;

    if ( var_0 > 3 )
        var_0 -= 2.0;
    else if ( var_0 > 2 )
        var_0 -= 1.0;

    if ( var_0 < 0.15 / var_1 )
        return 1;

    if ( var_0 > 1 - 0.3 / var_1 )
        return 1;

    return 0;
}

_id_7FB7( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    self _meth_8146( var_0, 1, 0.1, var_3, 1 );
    self _meth_8146( var_1, 1, 0.1, var_3, 1 );
    self _meth_8146( var_2, 1, 0.1, var_3, 1 );
}

_id_7F3E( var_0 )
{
    _id_9B3B( var_0, %combatrun_forward, %combatrun_backward, %combatrun_left, %combatrun_right );
}

_id_9B3B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_9AC9 ) && self._id_9AC9 == var_0 )
        return;

    self notify( "stop_move_anim_update" );
    self._id_9AC9 = var_0;
    self._id_A1C8 = undefined;
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    self endon( "stop_move_anim_update" );

    for (;;)
    {
        _id_9B5D( var_1, var_2, var_3, var_4 );
        wait 0.05;
        waitframe;
    }
}

_id_9B5D( var_0, var_1, var_2, var_3 )
{
    if ( self.facemotion && !animscripts\utility::_id_848B() && !isdefined( self._id_9ACA ) && !( isdefined( self._id_5A7A ) && self._id_5A7A ) )
    {
        if ( !isdefined( self._id_A1C8 ) )
        {
            self._id_A1C8 = 1;
            var_4 = 0.2;

            if ( isdefined( self._id_8F1E ) )
                var_4 = self._id_8F1E;

            self _meth_814d( var_0, 1, var_4, 1, 1 );
            self _meth_814d( var_1, 0, var_4, 1, 1 );
            self _meth_814d( var_2, 0, var_4, 1, 1 );
            self _meth_814d( var_3, 0, var_4, 1, 1 );
        }
    }
    else
    {
        self._id_A1C8 = undefined;
        var_5 = animscripts\utility::_id_7082( self _meth_8194() );

        if ( isdefined( self._id_9ACA ) )
        {
            var_5["back"] = 0.0;

            if ( var_5["front"] < 0.2 )
                var_5["front"] = 0.2;
        }

        var_4 = 0.2;

        if ( isdefined( self._id_8F1E ) )
            var_4 = self._id_8F1E;

        var_6 = var_5["front"];

        if ( var_6 < 0.001 )
            var_6 = 0.001;

        self _meth_814d( var_0, var_6, var_4, 1, 1 );
        self _meth_814d( var_1, var_5["back"], var_4, 1, 1 );
        self _meth_814d( var_2, var_5["left"], var_4, 1, 1 );
        self _meth_814d( var_3, var_5["right"], var_4, 1, 1 );
    }
}

_id_8B10()
{
    var_0 = isdefined( self._id_A154 ) && self._id_A154;
    var_1 = animscripts\utility::_id_51A3( self.weapon );

    if ( var_0 == var_1 )
        return 0;

    if ( animscripts\stairs_utility::isonstairs() )
        return 0;

    if ( !isdefined( self.pathgoalpos ) || distancesquared( self.origin, self.pathgoalpos ) < 65536 )
        return 0;

    if ( animscripts\utility::_id_9C3A() )
        return 0;

    if ( self.weapon == self.primaryweapon )
    {
        if ( !var_0 )
            return 0;

        if ( !animscripts\utility::_id_51A3( self.secondaryweapon ) )
            return 0;
    }
    else
    {
        if ( var_0 )
            return 0;

        if ( animscripts\utility::_id_51A3( self.primaryweapon ) )
            return 0;
    }

    var_2 = angleclamp180( self _meth_8194() );

    if ( abs( var_2 ) > 25 )
        return 0;

    if ( !_id_76D5() )
        return 0;

    if ( var_0 )
        _id_8445( "shotgunPullout", animscripts\utility::_id_5863( "cqb", "shotgun_pullout" ), "gun_2_chest", "none", self.secondaryweapon, "shotgun_pickup" );
    else
        _id_8445( "shotgunPutaway", animscripts\utility::_id_5863( "cqb", "shotgun_putaway" ), "gun_2_back", "back", self.primaryweapon, "shotgun_pickup" );

    self notify( "switchEnded" );
    return 1;
}

_id_8445( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "movemode" );
    self endon( "should_stairs_transition" );
    self setflaggedanimknoballrestart( var_0, var_1, %body, 1, 0.25 );
    _id_76B3( var_1 );
    self._id_9ACA = 1;
    _id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ) );
    thread _id_7F3E( "run" );
    thread _id_A259( var_0, var_2, var_3, var_4, var_5 );
    childthread animscripts\stairs_utility::threadcheckstairstransition( var_1, 0, 0.3 );
    animscripts\notetracks::_id_2D0D( getanimlength( var_1 ) - 0.25, var_0, ::_id_4EAB );
    self._id_9ACA = undefined;
    self notify( "killThreadCheckStairsTransition" );
}

_id_4EAB( var_0 )
{
    if ( var_0 == "gun_2_chest" || var_0 == "gun_2_back" )
        return 1;
}

_id_A259( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killanimscript" );
    self endon( "movemode" );
    self endon( "switchEnded" );
    self waittillmatch( var_0, var_1 );
    animscripts\shared::_id_6869( self.weapon, var_2 );
    thread _id_8444( var_3 );
    self waittillmatch( var_0, var_4 );
    self notify( "complete_weapon_switch" );
}

_id_8444( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_A069( "killanimscript", "movemode", "switchEnded", "complete_weapon_switch" );
    self._id_560F = self.weapon;
    animscripts\shared::_id_6869( var_0, "right" );
    self._id_18B0 = weaponclipsize( self.weapon );
}

_id_76B3( var_0 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, "run", self._id_35C7 );
}

_id_76A8()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}
