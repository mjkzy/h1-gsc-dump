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

_id_7FF1( var_0, var_1 )
{
    if ( var_0 == "" )
    {
        if ( self.a._id_6E5A == "prone" && ( var_1 == "walk" || var_1 == "run" ) )
            var_0 = "crouch";
        else
            var_0 = self.a._id_6E5A;
    }

    if ( !isdefined( var_1 ) || var_1 == "" )
        var_1 = self.a._id_5F5B;

    return [[ anim._id_7FF2[var_0][var_1] ]]();
}

_id_4E02()
{
    anim._id_7FF2["stand"]["stop"] = ::_id_8B17;
    anim._id_7FF2["stand"]["walk"] = ::_id_8B1C;
    anim._id_7FF2["stand"]["run"] = ::_id_8B0F;
    anim._id_7FF2["crouch"]["stop"] = ::_id_248E;
    anim._id_7FF2["crouch"]["walk"] = ::_id_2497;
    anim._id_7FF2["crouch"]["run"] = ::_id_2484;
    anim._id_7FF2["prone"]["stop"] = ::_id_7029;
    anim._id_7FF2["prone"]["walk"] = ::_id_7034;
    anim._id_7FF2["prone"]["run"] = ::_id_7027;
}

_id_8B17()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    return 0;
                case "walk":
                    _id_8B1E();
                    break;
                default:
                    _id_8B16();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2494();
                    break;
                case "walk":
                    _id_2499();
                    break;
                default:
                    _id_248C();
                    break;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_7031();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
    }

    return 1;
}

_id_8B1C()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    if ( animscripts\stairs_utility::isonstairs() )
                        return 0;

                    _id_14A5();
                    break;
                case "walk":
                    return 0;
                default:
                    _id_14A5();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2496();
                    break;
                case "walk":
                    _id_14A5();
                    break;
                default:
                    _id_14A5();
                    break;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_7033();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
    }

    return 1;
}

_id_8B0F()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                case "walk":
                    if ( animscripts\stairs_utility::isonstairs() )
                        return 0;

                    return _id_14A4();
                default:
                    return 0;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    return _id_2495();
                default:
                    return _id_14A4();
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_7032();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
    }

    return 1;
}

_id_248E()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B18();
                    break;
                case "walk":
                    _id_8B1D();
                    break;
                case "run":
                    _id_8B15();
                    break;
                default:
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    return 0;
                case "walk":
                    _id_2498();
                    break;
                case "run":
                    _id_2488();
                    break;
                default:
            }

            break;
        case "prone":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_702C();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
        default:
    }

    return 1;
}

_id_2497()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B18();
                    _id_14A3();
                    break;
                case "walk":
                    _id_14A3();
                    break;
                default:
                    _id_14A3();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2490();
                    break;
                case "walk":
                    return 0;
                default:
                    _id_14A3();
                    break;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_702E();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
    }

    return 1;
}

_id_2484()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B18();
                    _id_14A2();
                    break;
                default:
                    _id_14A2();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_248F();
                    break;
                case "walk":
                    _id_14A2();
                    break;
                default:
                    return 0;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_702D();
                    break;
                default:
                    _id_7024();
                    break;
            }

            break;
    }

    return 1;
}

_id_7029()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B19();
                    break;
                case "walk":
                    _id_8B19();
                    break;
                case "run":
                    _id_2489();
                    break;
                default:
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2491();
                    break;
                case "walk":
                    _id_2491();
                    break;
                case "run":
                    _id_2489();
                    break;
                default:
            }

            break;
        case "prone":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    return 0;
                case "run":
                case "walk":
                    _id_7024();
                    break;
                default:
            }

            break;
        default:
    }

    return 1;
}

_id_7034()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B1B();
                    break;
                default:
                    _id_248B();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2493();
                    break;
                default:
                    _id_248B();
                    break;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_7030();
                    break;
                default:
                    self.a._id_5F5B = "walk";
                    return 0;
            }

            break;
    }

    return 1;
}

_id_7027()
{
    switch ( self.a._id_6E5A )
    {
        case "stand":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_8B1A();
                    break;
                default:
                    _id_248A();
                    break;
            }

            break;
        case "crouch":
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_2492();
                    break;
                default:
                    _id_248A();
                    break;
            }

            break;
        default:
            switch ( self.a._id_5F5B )
            {
                case "stop":
                    _id_7030();
                    break;
                default:
                    self.a._id_5F5B = "run";
                    return 0;
            }

            break;
    }

    return 1;
}
#using_animtree("generic_human");

_id_6A30( var_0, var_1, var_2, var_3 )
{
    var_4 = gettime() + var_1 * 1000;

    if ( isarray( var_0 ) )
        var_0 = var_0[randomint( var_0.size )];

    self setflaggedanimknoball( "blendTransition", var_0, %body, 1, var_1, 1 );
    animscripts\notetracks::_id_2D0B( var_1 / 2, "blendTransition" );
    self.a._id_6E5A = var_2;
    self.a._id_5F5B = var_3;
    var_5 = ( var_4 - gettime() ) / 1000;

    if ( var_5 < 0.05 )
        var_5 = 0.05;

    animscripts\notetracks::_id_2D0B( var_5, "blendTransition" );
}

_id_6DEA( var_0, var_1 )
{
    _id_6DE7( var_0, "stand", "walk", var_1 );
}

_id_8B1E()
{
    self.a._id_5F5B = "stop";
}

_id_8B1D()
{
    _id_8B1E();
    _id_8B18();
}

_id_8B16()
{
    self.a._id_5F5B = "stop";
}

_id_8B15()
{
    self.a._id_5F5B = "stop";
    self.a._id_6E5A = "crouch";
}

_id_6A31( var_0 )
{
    var_1 = 0.3;

    if ( self.a._id_5F5B != "stop" )
    {
        self endon( "movemode" );
        var_1 = 1.0;
    }

    var_2 = animscripts\stairs_utility::getstairtransitionfinishedthisframe();

    if ( var_2 != "none" )
        var_1 = 0.1;

    _id_6A30( var_0, var_1, "stand", "run" );
}

_id_14A4()
{
    if ( !self.facemotion )
    {
        self.a._id_5F5B = "run";
        self.a._id_6E5A = "stand";
        return 0;
    }

    if ( isdefined( self._id_76AF ) )
    {
        self _meth_8144( %h1_stairs, 0.1 );

        if ( animscripts\stairs_utility::isonstairs() )
        {
            var_0 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
            var_1 = animscripts\utility::_id_402D( var_0 );
            _id_6A31( var_1 );
            return 1;
        }

        _id_6A31( self._id_76AF );
        return 1;
    }

    var_2 = 0.1;

    if ( self.a._id_5F5B != "stop" && self.start_move == "none" )
        var_2 = 0.5;

    if ( isdefined( self._id_8AA8 ) )
        self _meth_8146( animscripts\utility::_id_402D( "sprint" ), 1, var_2, 1 );
    else
        self _meth_8146( animscripts\run::_id_40BD(), 1, var_2, 1 );

    animscripts\run::_id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ), self._id_855F );
    thread animscripts\run::_id_7F3E( "run" );
    wait 0.05;
    _id_6A31( %combatrun );
    return 1;
}

_id_14A5()
{
    if ( self.a._id_5F5B != "stop" )
        self endon( "movemode" );

    if ( !isdefined( self._id_0B0D ) && self.a._id_6E5A != "prone" )
        animscripts\run::_id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ) );

    self.a._id_6E5A = "stand";
    self.a._id_5F5B = "walk";
}

_id_2494()
{
    var_0 = 1;

    if ( isdefined( self._id_3682 ) )
    {
        var_0 = 1.8;
        self._id_3682 = undefined;
    }

    if ( animscripts\utility::_id_9C3A() )
        _id_6DE7( %pistol_crouchaimstraight2stand, "stand", "stop", undefined, var_0 );
    else
    {
        animscripts\utility::_id_7129();
        _id_6DE7( %crouch2stand, "stand", "stop", undefined, var_0 );
    }
}

_id_2490()
{
    _id_14A3();
}

_id_2496()
{
    _id_2490();
    _id_14A5();
}

_id_2498()
{
    self.a._id_5F5B = "stop";
}

_id_2499()
{
    _id_2498();
    _id_2494();
}

_id_2488()
{
    self.a._id_5F5B = "stop";
}

_id_248C()
{
    _id_2488();
    _id_2494();
}

_id_248F()
{
    if ( self _meth_8152( %casual_crouch_idle ) != 0.0 || self _meth_8152( %casual_crouch_idle_in ) != 0.0 )
        _id_6DE7( %casual_crouch_idle_out, "crouch", "stop" );

    _id_14A2();
}

_id_2495()
{
    if ( self _meth_8152( %casual_crouch_idle ) != 0.0 || self _meth_8152( %casual_crouch_idle_in ) != 0.0 )
        _id_6DE7( %casual_crouch_idle_out, "crouch", "stop" );

    _id_6DE7( %crouch_2run_f, "stand", "run" );
    return 1;
}

_id_14A2()
{
    if ( isdefined( self._id_2485 ) )
        _id_6A30( self._id_2485, 0.6, "crouch", "run" );
    else
    {
        var_0 = %crouchrun;
        var_1 = 0.4;
        var_2 = self.a._id_5F5B == "stop" && self.a._id_6E5A == "crouch";

        if ( var_2 )
        {
            var_0 = %crouchwalk_2_crouch_start_8;
            var_1 = 0.1;
        }

        self _meth_8145( var_0, 1, var_1, self._id_5F65 );

        if ( var_2 )
        {
            var_3 = 0.27;

            if ( isdefined( self.crouchtransitionoverridewait ) )
                var_3 = self.crouchtransitionoverridewait;

            wait(var_3);
        }

        if ( animscripts\utility::_id_9C3B() && self.a._id_5F5B == "run" && !( isdefined( self._id_2563 ) && isdefined( self._id_2563["run"] ) ) )
        {
            var_4 = "smg_crouch_run";
            thread animscripts\run::_id_9B3B( "crouchrun", animscripts\utility::_id_5863( var_4, "crouch" ), animscripts\utility::_id_5863( var_4, "crouch_b" ), animscripts\utility::_id_5863( var_4, "crouch_l" ), animscripts\utility::_id_5863( var_4, "crouch_r" ) );
        }
        else
            thread animscripts\run::_id_9B3B( "crouchrun", animscripts\utility::_id_402D( "crouch" ), animscripts\utility::_id_402D( "crouch_b" ), animscripts\utility::_id_402D( "crouch_l" ), animscripts\utility::_id_402D( "crouch_r" ) );

        wait 0.05;
        _id_6A30( var_0, var_1, "crouch", "run" );
    }
}

_id_702D()
{
    animscripts\move::_id_414A( 0.4 );
}

_id_7032()
{
    animscripts\move::_id_414A( 0.4 );
}

_id_702E()
{
    animscripts\move::_id_414A( 0.4 );
}

_id_14A3()
{
    if ( isdefined( self._id_2485 ) )
    {
        self _meth_8149( self._id_2485, %body, 1, 0.4 );
        _id_6A30( self._id_2485, 0.6, "crouch", "walk" );
        self notify( "BlendIntoCrouchWalk" );
    }
    else
    {
        self _meth_8145( %crouchrun, 1, 0.4, self._id_5F65 );
        thread animscripts\run::_id_9B3B( "crouchrun", animscripts\utility::_id_402D( "crouch" ), animscripts\utility::_id_402D( "crouch_b" ), animscripts\utility::_id_402D( "crouch_l" ), animscripts\utility::_id_402D( "crouch_r" ) );
        wait 0.05;
        _id_6A30( %crouchrun, 0.4, "crouch", "run" );
    }
}

_id_8B18()
{
    animscripts\utility::_id_7129();
    var_0 = 1;

    if ( isdefined( self._id_3679 ) )
    {
        var_0 = 1.8;
        self._id_3679 = undefined;
    }

    _id_6DE7( %exposed_stand_2_crouch, "crouch", "stop", undefined, var_0 );
}

_id_702C()
{
    animscripts\utility::_id_7129();
    animscripts\move::_id_414A( 0.4 );
}

_id_7031()
{
    animscripts\move::_id_414A( 0.4 );
}

_id_7033()
{
    _id_7031();
    _id_14A5();
}

_id_702F( var_0 )
{
    if ( isdefined( self.custompronetopronetransitionfunc ) )
    {
        [[ self.custompronetopronetransitionfunc ]]();
        return;
    }

    _id_7025( 0.1 );
    _id_6DE7( %h1_crawlstart_f, "prone", var_0, %prone_crawl );
    animscripts\cover_prone::_id_9B50( 0.1 );
}

_id_7030()
{
    _id_702F( "run" );
}

_id_7024()
{
    _id_7025( 0.1 );
    animscripts\cover_prone::_id_9B50( 0.1 );
    _id_6DE7( %h1_crawl_2_prone, "prone", "stop", undefined, self._id_5F65 );
}

_id_2491()
{
    self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( 1.0 );
    _id_7025( 0.3 );
    animscripts\cover_prone::_id_9B50( 0.1 );
    _id_6DE7( %crouch_2_prone, "prone", "stop" );
}

_id_2493()
{
    _id_2491();
    _id_7030();
}

_id_2492()
{
    _id_2491();
    _id_7030();
}

_id_8B19()
{
    self endon( "entered_poseprone" );
    var_0 = 0.5;
    thread _id_6DE9( %stand_2_prone, "prone", "stop", undefined, var_0 );
    self waittillmatch( "transAnimDone2", "anim_pose = \"crouch\"" );
    waitframe;
    self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( var_0 );
    self.a._id_5F5B = "stop";
    animscripts\cover_prone::_id_9B50( 0.1 );
    self waittillmatch( "transAnimDone2", "end" );
    _id_7025( 0.2 );
    self _meth_814d( %prone_aim_idle, 1, 0.1 );
}

_id_8B1B()
{
    _id_8B19();
    _id_7030();
}

_id_8B1A()
{
    _id_8B19();
    _id_7030();
}

_id_2489()
{
    self notify( "stop_move_anim_update" );
    self._id_9AC9 = undefined;
    var_0 = 0.5;
    self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( var_0 );
    _id_7025( 0.2 );
    animscripts\cover_prone::_id_9B50( 0.1 );
    var_1 = animscripts\utility::_id_40A0( self _meth_8194() );
    var_2 = %crouch_2_prone;
    var_3 = getmovedelta( var_2, 0, 1 );
    var_4 = self localtoworldcoords( var_3 );

    if ( self _meth_81c7( var_4 ) )
        _id_6DE7( var_2, "prone", "stop", undefined, var_0 );
    else
        _id_6DE7( %crouch_2_prone_firing, "prone", "stop", undefined, var_0 );
}

_id_248B()
{
    _id_2489();
    _id_7030();
}

_id_248A()
{
    _id_2489();
    _id_7030();
}

_id_6DE9( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killanimscript" );
    self endon( "entered_pose" + var_1 );
    _id_6DE8( var_0, var_1, var_2, var_3, var_4, 0 );
}

_id_6DE7( var_0, var_1, var_2, var_3, var_4 )
{
    _id_6DE8( var_0, var_1, var_2, var_3, var_4, 1 );
}

_id_6DE8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 1;

    self.movetransitionanimation = var_0;
    self.movetransitionendpose = var_1;

    if ( var_5 )
        thread _id_A057( getanimlength( var_0 ) / 2.0, "killtimerscript", var_1 );

    self setflaggedanimknoballrestart( "transAnimDone2", var_0, %body, 1, 0.2, var_4 );

    if ( !isdefined( self.a._id_6E5A ) )
        self._id_6E5A = "undefined";

    if ( !isdefined( self.a._id_5F5B ) )
        self._id_5F5B = "undefined";

    var_6 = "";
    animscripts\shared::_id_2D06( "transAnimDone2", undefined, var_6 );
    self notify( "killtimerscript" );
    self.a._id_6E5A = var_1;
    self notify( "entered_pose" + var_1 );
    self.a._id_5F5B = var_2;
    self.movetransitionanimation = undefined;
    self.movetransitionendpose = undefined;

    if ( isdefined( var_3 ) )
        self _meth_8149( var_3, %body, 1, 0.3, var_4 );
    else
        self _meth_8144( var_0, 0.1 );
}

_id_A057( var_0, var_1, var_2 )
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( var_1 );
    var_3 = self.a._id_6E5A;
    wait(var_0);

    if ( var_3 != "prone" && var_2 == "prone" )
    {
        animscripts\cover_prone::_id_9B50( 0.1 );
        animscripts\utility::_id_3308( 1.0 );
    }
    else if ( var_3 == "prone" && var_2 != "prone" )
    {
        animscripts\utility::_id_344B( 1.0 );
        self _meth_8193( "face default" );
    }
}

_id_7025( var_0 )
{
    self _meth_8149( %prone_legsstraight, %body, 1, var_0, self._id_5F65 );
}
