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

_id_4C7A()
{
    var_0 = [];
    var_0["surprise_stop"] = %surprise_stop_v1;
    var_0["trans_to_combat"] = %casual_stand_idle_trans_out;
    var_0["smg_trans_to_combat"] = %smg_casual_stand_idle_trans_out;
    var_0["drop_rpg_stand"] = %rpg_stand_throw;
    var_0["drop_rpg_crouch"] = %rpg_crouch_throw;
    var_0["pistol_to_primary"] = %pistol_stand_switch;
    var_0["primary_to_pistol"] = %pistol_stand_pullout;
    var_0["rpg_death"] = %rpg_stand_death;
    var_0["rpg_death_stagger"] = %rpg_stand_death_stagger;
    var_0["trans_from_corner_standr"] = %h1_cornerstndr_alert_2_exposedstand;
    var_0["trans_from_corner_standl"] = %h1_cornerstndl_alert_2_exposedstand;
    anim._id_0CCA["soldier"]["combat"] = var_0;
}

main()
{
    if ( isdefined( self._id_60EE ) )
        return;

    if ( isdefined( self._id_2533 ) )
    {
        if ( isdefined( self._id_2533["combat"] ) )
        {
            [[ self._id_2533["combat"] ]]();
            return;
        }
    }

    self endon( "killanimscript" );
    [[ self._id_33E5["exposed"] ]]();
    animscripts\utility::_id_4DD7( "combat" );
    self.a._id_0D29 = undefined;

    if ( isdefined( self.node_relinquished ) && self.node_relinquished.unlockpoints == "Ambush" && self _meth_8163( self.node_relinquished ) )
        self._id_0B6A = self.node_relinquished;

    _id_971E();
    _id_2C80();

    if ( isdefined( self._id_8A2F ) )
        animscripts\stop::_id_8A30();

    _id_803F();
    _id_358E();
    self notify( "stop_deciding_how_to_shoot" );
}

end_script()
{
    self._id_0B6A = undefined;
    _id_2061();
}

_id_2C80()
{
    if ( self.team != "allies" )
        return;

    if ( self _meth_81d2() && self.primaryattachment2 == "move" && self.a._id_6E5A == "stand" && !isdefined( self._id_2B12 ) )
    {
        if ( isdefined( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) < squared( 128 ) )
            return;

        if ( !isdefined( self.a._id_0CD8 ) )
            return;

        if ( isdefined( self.a._id_0CD8["surprise_stop"] ) )
            var_0 = animscripts\utility::_id_0C4E( "surprise_stop" );
        else if ( self.tactical )
        {
            var_0 = animscripts\swim::_id_4100( "surprise_stop" );

            if ( !isdefined( var_0 ) )
                return;
        }
        else
            var_0 = animscripts\utility::_id_5863( "combat", "surprise_stop" );

        _id_7444();
        self setflaggedanimknoballrestart( "react", var_0, %animscript_root, 1, 0.2, self._id_0C78 );
        _id_2088( var_0, "run" );
        animscripts\shared::_id_2D06( "react" );
    }
}

transitionfromcoverstand()
{
    if ( self.a._id_6E5A == "stand" )
    {
        var_0 = undefined;
        var_1 = undefined;

        if ( self.primaryattachment2 == "cover_right" )
        {
            var_0 = [ %corner_standr_alert_idle, %corner_standr_alert_twitch01, %corner_standr_alert_twitch04, %corner_standr_alert_twitch05, %corner_standr_alert_twitch06, %corner_standr_alert_twitch07 ];
            var_1 = "trans_from_corner_standr";
        }
        else if ( self.primaryattachment2 == "cover_left" )
        {
            var_0 = [ %corner_standl_alert_idle, %corner_standl_alert_twitch01, %corner_standl_alert_twitch03, %corner_standl_alert_twitch04, %corner_standl_alert_twitch06, %corner_standl_alert_twitch07 ];
            var_1 = "trans_from_corner_standl";
        }

        if ( isdefined( var_0 ) )
        {
            var_2 = 0;

            foreach ( var_4 in var_0 )
            {
                if ( self _meth_8152( var_4 ) != 0.0 )
                {
                    var_2 = 1;
                    break;
                }
            }

            if ( var_2 )
            {
                _id_7444();
                self _meth_8193( "face current" );
                var_6 = animscripts\utility::_id_5863( "combat", var_1 );
                self setflaggedanimknoballrestart( "transition", var_6, %animscript_root, 1, 0.2, 1 );
                animscripts\shared::_id_2D06( "transition" );
            }
        }
    }
}

transitionfrompronemove()
{
    if ( isdefined( self.enablepronetocombattransition ) && self.a._id_6E5A == "prone" )
    {
        var_0 = undefined;
        var_1 = undefined;

        if ( self.primaryattachment2 == "move" )
        {
            self _meth_8192( "angle deltas", 0 );
            self _meth_8193( "face current" );
            self setflaggedanimknoballrestart( "transition", %h1_crawl_2_prone, %animscript_root, 1, 0.4, 1 );
            animscripts\shared::_id_2D06( "transition" );
            _id_7444();
        }
    }
}

_id_971E()
{
    if ( isdefined( self._id_8A2F ) || isdefined( self._id_255D ) )
        return;

    if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
    {
        if ( !isdefined( self.enemy ) )
            return;

        if ( self.a._id_6E5A == "crouch" )
        {
            if ( self.primaryattachment2 == "cover_right" )
            {
                _id_7444();
                self _meth_8193( "face current" );
                var_0 = animscripts\utility::_id_5863( "combat", "trans_from_crouch_r" );
                self setflaggedanimknoballrestart( "transition", var_0, %animscript_root, 1, 0.2, 1 );
                wait(getanimlength( var_0 ));
            }
            else if ( self.primaryattachment2 == "cover_left" )
            {
                _id_7444();
                self _meth_8193( "face current" );
                var_0 = animscripts\utility::_id_5863( "combat", "trans_from_crouch_l" );
                self setflaggedanimknoballrestart( "transition", var_0, %animscript_root, 1, 0.2, 1 );
                wait(getanimlength( var_0 ));
            }
        }
    }

    transitionfromcoverstand();
    transitionfrompronemove();

    if ( isdefined( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) < 262144 )
        return;

    if ( self.primaryattachment2 == "stop" && !animscripts\utility::_id_50E9() && self.a._id_6E5A == "stand" && !self _meth_8167() )
    {
        _id_7444();
        var_0 = undefined;

        if ( animscripts\utility::_id_9C3B() )
            var_0 = animscripts\utility::_id_5863( "combat", "smg_trans_to_combat" );
        else
            var_0 = animscripts\utility::_id_5863( "combat", "trans_to_combat" );

        self setflaggedanimknoballrestart( "transition", var_0, %animscript_root, 1, 0.2, 1.2 * self._id_0C78 );
        _id_2088( var_0, "run" );
        animscripts\shared::_id_2D06( "transition" );
    }
}

_id_804F()
{
    if ( self.a._id_6E5A == "stand" )
        animscripts\animset::_id_7DD2();
    else if ( self.a._id_6E5A == "crouch" )
        animscripts\animset::_id_7DC5();
    else if ( self.a._id_6E5A == "prone" )
        animscripts\animset::_id_7DCE();
    else
    {

    }
}

_id_803F()
{
    if ( animscripts\utility::_id_9C3A() && self _meth_81cf( "stand" ) )
        _id_971D( "stand" );

    _id_804F();
    _id_7DB6();
    thread _id_8F02();
    self._id_6F67 = 0.0;
    self _meth_8144( %animscript_root, 0.2 );
    var_0 = 0.2;

    if ( isdefined( self._id_097C ) )
        var_0 = self._id_097C;

    animscripts\combat_utility::_id_82F8( var_0 );

    if ( self.doaimidlethread )
        thread animscripts\combat_utility::_id_0979();

    self.a._id_5B90 = "aim";
    _id_27ED();
}

_id_8F02()
{
    self endon( "killanimscript" );
    wait 0.2;
    self.a._id_5F5B = "stop";
}

_id_7E0D()
{
    if ( self.tactical )
    {
        if ( animscripts\utility::_id_51B0() )
        {
            self.useable = 90;
            self.downaimlimit = -90;
            self.riotshield_hit = 45;
            self.lifecount = -45;
        }
        else
        {
            self.useable = 90;
            self.downaimlimit = -120;
        }
    }
}

_id_7E08( var_0 )
{
    if ( isdefined( var_0 ) )
        self _meth_8177( var_0 );
    else
        self _meth_8177();

    _id_7E0D();
}

_id_7DB6()
{
    _id_7E08();

    if ( self.a._id_6E5A == "stand" && !self.tactical )
    {
        self.useable = 60;
        self.downaimlimit = -60;
    }

    self._id_993A = self._id_27A0;
}

_id_8314()
{
    thread animscripts\track::_id_9512();
    thread _id_7179();
    thread animscripts\shoot_behavior::_id_2743( "normal" );
    thread _id_A258();
    _id_744B();

    if ( isdefined( self.a._id_58DE ) )
    {
        animscripts\weaponlist::_id_72B1();
        self.a._id_58DE = undefined;
    }

    self.a._id_2D2F = gettime() + randomintrange( 500, 1500 );
}

_id_3591( var_0 )
{
    if ( animscripts\utility::_id_9C36() && animscripts\utility::_id_8495( var_0 ) )
    {
        if ( self.a._id_6E5A != "stand" && self.a._id_6E5A != "crouch" )
            _id_971D( "crouch" );

        if ( self.a._id_6E5A == "stand" )
            animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_stand" ) );
        else
            animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_crouch" ) );

        self _meth_8144( %animscript_root, 0.2 );
        animscripts\combat_utility::_id_315E();
        _id_804F();
        animscripts\combat_utility::_id_8D17();
        return 1;
    }

    return 0;
}

_id_358D( var_0 )
{
    if ( self.a._id_6E5A != "stand" && self _meth_81cf( "stand" ) )
    {
        if ( var_0 < 81225 )
        {
            _id_971D( "stand" );
            return 1;
        }

        if ( _id_8B08() )
            return 1;
    }

    if ( var_0 > 262144 && self.a._id_6E5A != "crouch" && self _meth_81cf( "crouch" ) && !self.tactical && !animscripts\utility::_id_9C3A() && !isdefined( self._id_4795 ) && gettime() >= self.a._id_2D2F && lengthsquared( self._id_83F7 ) < 10000 )
    {
        if ( !isdefined( self._id_840F ) || sighttracepassed( self.origin + ( 0, 0, 36 ), self._id_840F, 0, undefined ) )
        {
            _id_971D( "crouch" );
            return 1;
        }
    }

    return 0;
}

_id_358C( var_0 )
{
    if ( !animscripts\utility::_id_9C3A() )
    {
        if ( isdefined( self._id_39C7 ) && self.a._id_6E5A == "stand" )
        {
            if ( _id_98D6() )
                return 1;
        }

        if ( animscripts\combat_utility::issniper() && var_0 < 262144 )
        {
            if ( _id_98D6() )
                return 1;
        }
    }

    if ( animscripts\combat_utility::_id_6089( 0 ) )
    {
        if ( !animscripts\utility::_id_9C3A() && !animscripts\utility::_id_9C36() && animscripts\utility::_id_9C33() && var_0 < 262144 && self _meth_81cf( "stand" ) )
        {
            if ( self.a._id_6E5A != "stand" )
            {
                _id_971D( "stand" );
                return 1;
            }

            if ( _id_98D6() )
                return 1;
        }

        if ( _id_3592( 0 ) )
            return 1;
    }

    return 0;
}

_id_358B( var_0 )
{
    if ( animscripts\utility::_id_9C3A() && self.a._id_6E5A == "stand" && !isdefined( self._id_39C7 ) )
    {
        if ( var_0 > 262144 || self.combatmode == "ambush_nodes_only" && ( !isdefined( self.enemy ) || !self _meth_81c2( self.enemy ) ) )
            _id_9080( animscripts\utility::_id_5863( "combat", "pistol_to_primary" ) );
    }
}

_id_3590()
{
    if ( isdefined( self._id_4795 ) && self _meth_8165() )
        self _meth_81cb( self.nogrenadereturnthrow, self.node_relinquished.angles );
}

_id_358F()
{
    if ( _id_608A() )
    {
        var_0 = 0.25;

        if ( isdefined( self._id_83F6 ) && !issentient( self._id_83F6 ) )
            var_0 = 1.5;

        var_1 = animscripts\shared::_id_4096( var_0 );

        if ( _id_993D( var_1 ) )
            return 1;
    }

    return 0;
}

_id_358E()
{
    self endon( "killanimscript" );
    _id_8314();
    _id_7444( 0 );

    if ( animscripts\utility::_id_51B0() )
    {
        var_0 = ( 0, self.angles[1], 0 );
        self _meth_8193( "face angle 3d", var_0 );
    }
    else
        self _meth_8193( "face angle", self.angles[1] );

    for (;;)
    {
        if ( animscripts\utility::_id_9C36() )
            self._id_2660 = undefined;

        animscripts\utility::_id_9B2B();

        if ( _id_A039() )
            continue;

        _id_98A1();
        _id_3590();

        if ( !isdefined( self._id_840F ) )
        {
            _id_1AF5();
            continue;
        }

        _id_744B();
        var_1 = lengthsquared( self.origin - self._id_840F );

        if ( _id_3591( var_1 ) )
            continue;

        if ( _id_358F() )
            continue;

        if ( _id_2152() )
            continue;

        if ( _id_358C( var_1 ) )
            continue;

        if ( animscripts\utility::_id_9C36() && self.a._id_6E5A != "crouch" && randomfloat( 1 ) > 0.65 )
            self._id_2660 = ::_id_7669;

        _id_358B( var_1 );

        if ( _id_358D( var_1 ) )
        {
            if ( animscripts\utility::using_improved_transitions() )
                self _meth_8193( "face current" );

            continue;
        }

        if ( animscripts\combat_utility::_id_0976() )
        {
            _id_8416();
            animscripts\combat_utility::_id_4873();
            continue;
        }

        _id_3595();
    }
}

_id_3595()
{
    if ( !isdefined( self.enemy ) || !self _meth_81c2( self.enemy ) )
    {
        self endon( "enemy" );
        self endon( "shoot_behavior_change" );
        wait(0.2 + randomfloat( 0.1 ));
        self waittill( "do_slow_things" );
    }
    else
        wait 0.05;
}

_id_8B08()
{
    if ( isdefined( self.enemy ) && ( !self _meth_81c2( self.enemy ) || !self _meth_81c1() ) && sighttracepassed( self.origin + ( 0, 0, 64 ), self.enemy getshootatpos(), 0, undefined ) )
    {
        self.a._id_2D2F = gettime() + 3000;
        _id_971D( "stand" );
        return 1;
    }

    return 0;
}

_id_608A()
{
    var_0 = self._id_840F;

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = self.angles[1] - vectortoyaw( var_0 - self.origin );
    var_2 = distancesquared( self.origin, var_0 );

    if ( var_2 < 65536 )
    {
        var_3 = sqrt( var_2 );

        if ( var_3 > 3 )
            var_1 += asin( -3 / var_3 );
    }

    return animscripts\utility::_id_06C4( var_1 ) > self._id_993A;
}

_id_A039()
{
    var_0 = self.a._id_6E5A;

    if ( isdefined( self.a._id_6451 ) )
    {
        wait 0.1;
        return 1;
    }

    if ( var_0 == "stand" && isdefined( self._id_4795 ) )
        return 0;

    if ( !self _meth_81cf( var_0 ) )
    {
        var_1 = "crouch";

        if ( var_0 == "crouch" )
            var_1 = "stand";

        var_2 = "prone";

        if ( var_0 == "prone" )
        {
            var_1 = "stand";
            var_2 = "crouch";
        }

        if ( self _meth_81cf( var_1 ) )
        {
            if ( var_0 == "stand" && animscripts\utility::_id_9C3A() )
                return 0;

            _id_971D( var_1 );
            return 1;
        }
        else if ( self _meth_81cf( var_2 ) )
        {
            if ( var_0 == "stand" && animscripts\utility::_id_9C3A() )
                return 0;

            _id_971D( var_2 );
            return 1;
        }
        else
        {

        }
    }

    return 0;
}

_id_1AF5()
{
    if ( self.a._id_6E5A != "stand" && self _meth_81cf( "stand" ) && _id_8B08() )
        return 1;

    var_0 = gettime();
    self.a._id_2D2F = var_0 + 1500;

    if ( isdefined( self._id_441A ) && isdefined( self._id_441A.forward ) )
    {
        var_1 = angleclamp180( self.angles[1] - vectortoyaw( self._id_441A.forward ) );

        if ( _id_993D( var_1 ) )
            return 1;
    }

    if ( isdefined( self.node_relinquished ) && isdefined( anim._id_50E4[self.node_relinquished.unlockpoints] ) )
    {
        var_1 = angleclamp180( self.angles[1] - self.node_relinquished.angles[1] );

        if ( _id_993D( var_1 ) )
            return 1;
    }
    else if ( isdefined( self.enemy ) && self _meth_81c3( self.enemy, 2 ) || var_0 > self.a._id_7B46 + 1200 )
    {
        var_1 = undefined;
        var_2 = self _meth_8196();

        if ( isdefined( var_2 ) )
            var_1 = angleclamp180( self.angles[1] - var_2[1] );
        else if ( isdefined( self.node_relinquished ) )
            var_1 = angleclamp180( self.angles[1] - self.node_relinquished.angles[1] );
        else if ( isdefined( self.enemy ) )
        {
            var_2 = vectortoangles( self _meth_81c5( self.enemy ) - self.origin );
            var_1 = angleclamp180( self.angles[1] - var_2[1] );
        }

        if ( isdefined( var_1 ) && _id_993D( var_1 ) )
            return 1;
    }
    else if ( isdefined( self._id_4795 ) && self _meth_8164() )
    {
        var_1 = angleclamp180( self.angles[1] - self.node_relinquished.angles[1] );

        if ( _id_993D( var_1 ) )
            return 1;
    }

    if ( _id_2152() )
        return 1;

    var_3 = self.a._id_60CA < var_0;
    var_4 = 0;

    if ( var_3 )
        var_4 = 0.99999;

    if ( _id_3592( var_4 ) )
        return 1;

    if ( var_3 && animscripts\utility::_id_9C3A() )
    {
        if ( _id_9080( animscripts\utility::_id_5863( "combat", "pistol_to_primary" ) ) )
            return 1;
    }

    _id_1AF6();
    return 1;
}

_id_1AF6()
{
    self endon( "shoot_behavior_change" );
    wait(0.4 + randomfloat( 0.4 ));
    self waittill( "do_slow_things" );
}

_id_744B()
{
    self.a._id_60CA = gettime() + randomintrange( 2000, 4000 );
}

_id_993D( var_0 )
{
    if ( var_0 < 0 - self._id_993A )
    {
        _id_2D88( "left", 0 - var_0 );
        _id_A537::_id_2A4D();
        return 1;
    }

    if ( var_0 > self._id_993A )
    {
        _id_2D88( "right", var_0 );
        _id_A537::_id_2A4D();
        return 1;
    }

    return 0;
}

_id_A258()
{
    self endon( "killanimscript" );
    self._id_83F7 = ( 0, 0, 0 );
    var_0 = undefined;
    var_1 = self.origin;
    var_2 = 0.15;

    for (;;)
    {
        if ( isdefined( self._id_83F6 ) && isdefined( var_0 ) && self._id_83F6 == var_0 )
        {
            var_3 = self._id_83F6.origin;
            self._id_83F7 = ( var_3 - var_1 ) * 1 / var_2;
            var_1 = var_3;
        }
        else
        {
            if ( isdefined( self._id_83F6 ) )
                var_1 = self._id_83F6.origin;
            else
                var_1 = self.origin;

            var_0 = self._id_83F6;
            self._id_83F7 = ( 0, 0, 0 );
        }

        wait(var_2);
    }
}

_id_84B7()
{
    return 0;
}

_id_2D13( var_0 )
{
    self endon( "killanimscript" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_35BA()
{
    self endon( "killanimscript" );
    self notify( "facing_enemy_immediately" );
    self endon( "facing_enemy_immediately" );
    var_0 = 5;

    for (;;)
    {
        var_1 = 0 - animscripts\utility::_id_4175();

        if ( abs( var_1 ) < 2 )
            break;

        if ( abs( var_1 ) > var_0 )
            var_1 = var_0 * common_scripts\utility::_id_856D( var_1 );

        self _meth_8193( "face angle", self.angles[1] + var_1 );
        wait 0.05;
    }

    self _meth_8193( "face current" );
    self notify( "can_stop_turning" );
}

_id_50F0( var_0 )
{
    var_1 = getmovedelta( var_0, 0, 1 );
    var_2 = self localtoworldcoords( var_1 );
    return self _meth_8161( var_2 ) && self _meth_81c7( var_2 );
}

_id_50B8( var_0 )
{
    var_1 = getmovedelta( var_0, 0, 1 );
    var_2 = self localtoworldcoords( var_1 );
    return self _meth_8161( var_2 );
}

_id_2D88( var_0, var_1 )
{
    var_2 = isdefined( self._id_840F );
    var_3 = 1;
    var_4 = 0.2;
    var_5 = isdefined( self.enemy ) && !isdefined( self._id_993E ) && self _meth_81c3( self.enemy, 2 ) && distancesquared( self.enemy.origin, self.origin ) < 262144;

    if ( self.a._id_7B46 + 500 > gettime() )
    {
        var_4 = 0.25;

        if ( var_5 )
            thread _id_35BA();
    }
    else if ( var_5 )
    {
        var_6 = 1.0 - distance( self.enemy.origin, self.origin ) / 512;
        var_3 = 1 + var_6 * 1;

        if ( var_3 > 2 )
            var_4 = 0.05;
        else if ( var_3 > 1.3 )
            var_4 = 0.1;
        else
            var_4 = 0.15;
    }

    var_7 = 0;

    if ( var_1 > 157.5 )
        var_7 = 180;
    else if ( var_1 > 112.5 )
        var_7 = 135;
    else if ( var_1 > 67.5 )
        var_7 = 90;
    else
        var_7 = 45;

    var_8 = "turn_" + var_0 + "_" + var_7;
    var_9 = animscripts\utility::_id_0C4E( var_8 );

    if ( isdefined( self._id_993E ) )
        self _meth_8192( "angle deltas", 0 );
    else if ( isdefined( self.node_relinquished ) && isdefined( anim._id_50E3[self.node_relinquished.unlockpoints] ) && distancesquared( self.origin, self.node_relinquished.origin ) < 256 )
        self _meth_8192( "angle deltas", 0 );
    else if ( _id_50B8( var_9 ) )
        _id_7444();
    else
        self _meth_8192( "angle deltas", 0 );

    self _meth_8149( %exposed_aiming, %body, 1, var_4 );

    if ( !isdefined( self._id_993E ) )
        _id_9930( var_4 );

    self _meth_814e( %turn, 1, var_4 );

    if ( isdefined( self._id_4795 ) )
        var_3 = min( 1.0, var_3 );
    else if ( isdefined( self._id_993E ) )
        var_3 = max( 1.5, var_3 );

    self setflaggedanimknoblimitedrestart( "turn", var_9, 1, var_4, var_3 );
    _id_2088( var_9, "aim" );
    self notify( "turning" );

    if ( var_2 && !isdefined( self._id_993E ) && !isdefined( self._id_4795 ) )
        thread _id_841C();

    _id_2D89();
    self _meth_814e( %turn, 0, 0.2 );

    if ( !isdefined( self._id_993E ) )
        _id_992F( 0.2 );

    if ( !isdefined( self._id_993E ) )
    {
        self _meth_8144( %turn, 0.2 );
        self _meth_8145( %exposed_aiming, 1, 0.2, 1 );
    }
    else
        self _meth_8144( %exposed_modern, 0.3 );

    if ( isdefined( self._id_9931 ) )
    {
        self._id_9931 = undefined;
        thread _id_35BA();
    }

    _id_7444( 0 );
    self notify( "done turning" );
}

_id_2D89()
{
    self endon( "can_stop_turning" );
    animscripts\shared::_id_2D06( "turn" );
}

_id_5949()
{
    self endon( "killanimscript" );
    self endon( "done turning" );
    var_0 = self.angles[1];
    wait 0.3;

    if ( self.angles[1] == var_0 )
    {
        self notify( "turning_isnt_working" );
        self._id_9931 = 1;
    }
}

_id_9930( var_0 )
{
    self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 0, var_0 );
    self _meth_814d( %add_idle, 0, var_0 );

    if ( !animscripts\utility::_id_A2CF() )
        self _meth_8144( %add_fire, 0.2 );
}

_id_992F( var_0 )
{
    self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 1, var_0 );
    self _meth_814d( %add_idle, 1, var_0 );
}

_id_841C()
{
    self endon( "killanimscript" );
    self endon( "done turning" );

    if ( animscripts\utility::_id_9C36() )
        return;

    animscripts\combat_utility::_id_8417();
    self _meth_8144( %add_fire, 0.2 );
}

_id_8416()
{
    thread _id_A227();
    self endon( "need_to_turn" );
    thread _id_52E3();
    animscripts\combat_utility::_id_8417();
    self notify( "stop_watching_for_need_to_turn" );
    self notify( "stop_trying_to_melee" );
}

_id_A227()
{
    self endon( "killanimscript" );
    self endon( "stop_watching_for_need_to_turn" );
    var_0 = gettime() + 4000 + randomint( 2000 );

    for (;;)
    {
        if ( gettime() > var_0 || _id_608A() )
        {
            self notify( "need_to_turn" );
            break;
        }

        wait 0.1;
    }
}

_id_2152()
{
    if ( !animscripts\combat_utility::_id_6036() )
        return 0;

    self.a._id_60CC = gettime() + 300;

    if ( self.grenadeammo <= 0 )
        return 0;

    if ( isdefined( anim._id_933B ) && isalive( level.playercardbackground ) )
    {
        if ( _id_989B( level.playercardbackground, 200 ) )
            return 1;
    }

    if ( isdefined( self.enemy ) && _id_989B( self.enemy, self._id_5C65 ) )
        return 1;

    return 0;
}

_id_989B( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( self._id_2D34 ) || isdefined( var_0._id_2D2B ) )
        return 0;

    if ( !isdefined( self.a._id_0CD8["exposed_grenade"] ) )
        return 0;

    var_3 = var_0.origin;

    if ( !self _meth_81c2( var_0 ) )
    {
        if ( isdefined( self.enemy ) && var_0 == self.enemy && isdefined( self._id_840F ) )
            var_3 = self._id_840F;
    }

    if ( !self _meth_81c2( var_0 ) )
        var_1 = 100;

    if ( distancesquared( self.origin, var_3 ) > var_1 * var_1 && self.a._id_6E5A == self.a._id_440C )
    {
        var_4 = animscripts\utility::_id_4177( var_3 );

        if ( abs( var_4 ) < 60 )
        {
            var_5 = [];

            foreach ( var_7 in self.a._id_0CD8["exposed_grenade"] )
            {
                if ( _id_50F0( var_7 ) )
                    var_5[var_5.size] = var_7;
            }

            if ( var_5.size > 0 )
            {
                self _meth_814d( %exposed_aiming, 0, 0.1 );
                _id_2061();
                self _meth_8192( "zonly_physics" );
                animscripts\track::_id_7F21( 0, 0 );
                var_2 = animscripts\combat_utility::_id_989D( var_0, var_5[randomint( var_5.size )] );
                self _meth_814d( %exposed_aiming, 1, 0.1 );
                _id_2088( undefined, "aim" );

                if ( var_2 )
                    animscripts\track::_id_7F21( 1, 0.5 );
                else
                    animscripts\track::_id_7F21( 1, 0 );
            }
        }
    }

    if ( var_2 )
        _id_A537::_id_2A4D();

    return var_2;
}

_id_971D( var_0 )
{
    if ( var_0 == self.a._id_6E5A )
        return;

    var_1 = self.a._id_6E5A + "_2_" + var_0;

    if ( !isdefined( self.a._id_0CD8 ) )
        return;

    var_2 = self.a._id_0CD8[var_1];

    if ( !isdefined( var_2 ) )
        return;

    self _meth_8144( %animscript_root, 0.3 );
    animscripts\combat_utility::_id_315E();

    if ( var_0 == "stand" )
        var_3 = 2;
    else
        var_3 = 1.5;

    if ( !animhasnotetrack( var_2, "anim_pose = \"" + var_0 + "\"" ) )
    {

    }

    self setflaggedanimknoballrestart( "trans", var_2, %body, 1, 0.2, var_3 );
    _id_2088( var_2, "run" );
    var_4 = getanimlength( var_2 ) / var_3;
    var_5 = var_4 - 0.3;

    if ( var_5 < 0.2 )
        var_5 = 0.2;

    animscripts\notetracks::_id_2D0B( var_5, "trans" );
    self.a._id_6E5A = var_0;
    _id_804F();
    animscripts\combat_utility::_id_8D17();
    _id_A537::_id_2A4D();
}

_id_52E3()
{
    self endon( "killanimscript" );
    self endon( "stop_trying_to_melee" );
    self endon( "done turning" );
    self endon( "need_to_turn" );
    self endon( "shoot_behavior_change" );

    for (;;)
    {
        wait(0.2 + randomfloat( 0.3 ));

        if ( isdefined( self.enemy ) )
        {
            if ( isplayer( self.enemy ) )
                var_0 = 40000;
            else
                var_0 = 10000;

            if ( distancesquared( self.enemy.origin, self.origin ) < var_0 )
                _id_98A1();
        }
    }
}

_id_98A1()
{
    animscripts\melee::_id_5B7B();
}

_id_27ED()
{
    if ( isdefined( self._id_614B ) )
        return;

    if ( isplayer( self.enemy ) )
        return;

    animscripts\melee::_id_5B71( self.enemy );
}

_id_3592( var_0 )
{
    if ( animscripts\combat_utility::_id_6089( var_0 ) )
    {
        self.a._id_3593 = 1;
        animscripts\combat_utility::_id_315E();
        var_1 = undefined;

        if ( isdefined( self._id_8A35 ) )
        {
            var_1 = self [[ self._id_8A35 ]]();
            self.key1 = 1;
        }
        else
        {
            var_1 = animscripts\utility::_id_0C51( "reload" );

            if ( self.a._id_6E5A == "stand" && animscripts\utility::_id_0C4F( "reload_crouchhide" ) && common_scripts\utility::_id_2006() )
                var_1 = animscripts\utility::_id_0C51( "reload_crouchhide" );
        }

        thread _id_52E3();
        self._id_3798 = 0;

        if ( weaponclass( self.weapon_switch_invalid ) == "pistol" )
            self _meth_8193( "face default" );

        _id_2D77( var_1, var_0 > 0.05 );
        self notify( "abort_reload" );
        self _meth_8193( "face current" );

        if ( self._id_3798 )
            animscripts\weaponlist::_id_72B1();

        self _meth_8144( %reload, 0.2 );
        self.key1 = 0;
        self notify( "stop_trying_to_melee" );
        self.a._id_3593 = 0;
        self._id_3798 = undefined;
        _id_A537::_id_2A4D();
        animscripts\combat_utility::_id_8D17();
        return 1;
    }

    return 0;
}

_id_2D77( var_0, var_1 )
{
    self endon( "abort_reload" );

    if ( var_1 )
        thread _id_06C0();

    var_2 = 1;

    if ( !animscripts\utility::_id_9C3A() && !animscripts\utility::_id_51A3( self.weapon_switch_invalid ) && isdefined( self.enemy ) && self _meth_81c2( self.enemy ) && distancesquared( self.enemy.origin, self.origin ) < 1048576 )
        var_2 = 1.2;

    var_3 = "reload_" + animscripts\combat_utility::_id_4143();
    self _meth_8144( %animscript_root, 0.2 );
    self setflaggedanimrestart( var_3, var_0, 1, 0.2, var_2 );
    _id_2088( var_0, "run" );
    thread _id_6232( "abort_reload", var_3 );
    self endon( "start_aim" );
    animscripts\shared::_id_2D06( var_3 );
    self._id_3798 = 1;
}

_id_06C0()
{
    self endon( "abort_reload" );
    self endon( "killanimscript" );

    for (;;)
    {
        if ( isdefined( self._id_83F6 ) && self _meth_81c2( self._id_83F6 ) )
            break;

        wait 0.05;
    }

    self notify( "abort_reload" );
}

_id_6232( var_0, var_1 )
{
    self endon( var_0 );
    self waittillmatch( var_1, "start_aim" );
    self._id_3798 = 1;
    self notify( "start_aim" );
}

_id_3799( var_0 )
{
    self endon( "killanimscript" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_2F6A()
{
    _id_A558::_id_2F96();
    animscripts\weaponlist::_id_72B1();
    self.a._id_6084 = 0;
    self notify( "dropped_gun" );
    _id_A558::_id_74A9();
}

_id_33E6()
{
    _id_2F6A();
}

_id_98D6()
{
    if ( isdefined( self.secondaryweapon ) && animscripts\utility::_id_51A3( self.secondaryweapon ) )
        return 0;

    if ( isdefined( self._id_6109 ) )
        return 0;

    self.a._id_6E5A = "stand";
    _id_9081( animscripts\utility::_id_5863( "combat", "primary_to_pistol" ) );
    return 1;
}

_id_9081( var_0 )
{
    self endon( "killanimscript" );
    thread animscripts\combat_utility::_id_7066();
    thread removeswapanimonkillanimscript( "switched_to_sidearm" );
    animscripts\combat_utility::_id_315E();
    self._id_900F = var_0;
    self setflaggedanimknoballrestart( "weapon swap", var_0, %body, 1, 0.2, animscripts\combat_utility::_id_367A() );
    _id_2088( var_0, "run" );
    _id_2D12( "weapon swap", ::_id_466D, "end_weapon_swap" );
    self _meth_8144( self._id_900F, 0.2 );
    self notify( "facing_enemy_immediately" );
    self notify( "switched_to_sidearm" );
    self._id_900F = undefined;
    _id_A537::_id_2A4D();
}

removeswapanimonkillanimscript( var_0 )
{
    self endon( var_0 );
    self waittill( "killanimscript" );
    self._id_900F = undefined;
}

_id_2D12( var_0, var_1, var_2 )
{
    self endon( var_2 );
    animscripts\notetracks::_id_2D11( var_0, var_1 );
}

_id_35B9( var_0 )
{
    self endon( "killanimscript" );
    wait(var_0);
    _id_35BA();
}

_id_466D( var_0 )
{
    if ( var_0 == "pistol_pickup" )
    {
        self _meth_8144( animscripts\utility::_id_0C4E( "straight_level" ), 0 );
        animscripts\animset::_id_7DD2();
        thread _id_35B9( 0.25 );
    }
    else if ( var_0 == "start_aim" )
    {
        animscripts\combat_utility::_id_8D17();

        if ( _id_608A() )
            self notify( "end_weapon_swap" );
    }
}

_id_9080( var_0, var_1 )
{
    self endon( "killanimscript" );

    if ( animscripts\utility::_id_51A3( self.primaryweapon ) && ( isdefined( self._id_A154 ) && !self._id_A154 ) && self._id_560F == animscripts\utility::_id_3EE5() )
        return 0;

    thread removeswapanimonkillanimscript( "switched_to_lastweapon" );
    animscripts\combat_utility::_id_315E();
    self._id_900F = var_0;
    self setflaggedanimknoballrestart( "weapon swap", var_0, %body, 1, 0.1, 1 );
    _id_2088( var_0, "run" );

    if ( isdefined( var_1 ) )
        _id_2D12( "weapon swap", ::_id_464E, "end_weapon_swap" );
    else
        _id_2D12( "weapon swap", ::_id_4672, "end_weapon_swap" );

    self _meth_8144( self._id_900F, 0.2 );
    self notify( "switched_to_lastweapon" );
    self._id_900F = undefined;
    _id_A537::_id_2A4D();
    return 1;
}

_id_4672( var_0 )
{
    if ( var_0 == "pistol_putaway" )
    {
        self _meth_8144( animscripts\utility::_id_0C4E( "straight_level" ), 0 );
        animscripts\animset::_id_7DD2();
        thread animscripts\combat_utility::_id_7066();
    }
    else if ( var_0 == "start_aim" )
    {
        animscripts\combat_utility::_id_8D17();

        if ( _id_608A() )
            self notify( "end_weapon_swap" );
    }
}

_id_464E( var_0 )
{
    if ( var_0 == "pistol_putaway" )
        thread animscripts\combat_utility::_id_7066();
    else if ( issubstr( var_0, "anim_gunhand" ) )
        self notify( "end_weapon_swap" );
}

_id_7669()
{
    if ( !animscripts\utility::_id_9C36() || self._id_18B0 == 0 )
        return 0;

    if ( randomfloat( 1 ) > 0.5 )
        var_0 = animscripts\utility::_id_5863( "combat", "rpg_death" );
    else
        var_0 = animscripts\utility::_id_5863( "combat", "rpg_death_stagger" );

    self setflaggedanimknoball( "deathanim", var_0, %animscript_root, 1, 0.05, 1 );
    _id_2088( var_0, "death" );
    animscripts\shared::_id_2D06( "deathanim" );
    animscripts\shared::_id_2F6C();
    return;
}

_id_7179()
{
    self endon( "killanimscript" );
    self.a._id_3593 = 0;

    for (;;)
    {
        wait 0.2;

        if ( isdefined( self.enemy ) && !self _meth_81c3( self.enemy, 2 ) )
        {
            if ( self.combatmode == "ambush" || self.combatmode == "ambush_nodes_only" )
                continue;
        }

        _id_989A();
    }
}

_id_989A()
{
    if ( self.fixednode )
        return;

    if ( !isdefined( self.enemy ) )
    {
        self._id_7177 = 0;
        return;
    }

    if ( isdefined( self._id_6F4E ) && self._id_6F4E != self.enemy )
    {
        self._id_7177 = 0;
        self._id_6F4E = undefined;
        return;
    }

    self._id_6F4E = self.enemy;

    if ( self _meth_81c2( self.enemy ) )
    {
        if ( self _meth_81c1() || isdefined( self._id_900F ) )
        {
            self._id_7177 = 0;
            return;
        }
    }

    if ( isdefined( self._id_3798 ) && !self._id_3798 )
    {
        self._id_7177 = 0;
        return;
    }

    if ( !isdefined( self._id_7178 ) || !self._id_7178 )
    {
        var_0 = vectornormalize( self.enemy.origin - self.origin );
        var_1 = anglestoforward( self.angles );

        if ( vectordot( var_0, var_1 ) < 0.5 )
        {
            self._id_7177 = 0;
            return;
        }
    }

    if ( self.a._id_3593 && animscripts\combat_utility::_id_6089( 0.25 ) && self.enemy.helmet > self.enemy.maxturnspeed * 0.5 )
    {
        self._id_7177 = 0;
        return;
    }

    if ( animscripts\combat_utility::_id_849C() && self._id_7177 < 3 )
        self._id_7177 = 3;

    switch ( self._id_7177 )
    {
        case 0:
            if ( self _meth_81f5( 32 ) )
                return;

            break;
        case 1:
            if ( self _meth_81f5( 64 ) )
            {
                self._id_7177 = 0;
                return;
            }

            break;
        case 2:
            if ( self _meth_81f5( 96 ) )
            {
                self._id_7177 = 0;
                return;
            }

            break;
        case 3:
            if ( animscripts\combat_utility::_id_98A4( 0 ) )
            {
                self._id_7177 = 0;
                return;
            }

            break;
        case 4:
            if ( !self _meth_81c2( self.enemy ) )
                self _meth_81fa();

            break;
        default:
            if ( self._id_7177 > 15 )
            {
                self._id_7177 = 0;
                return;
            }

            break;
    }

    self._id_7177++;
}

_id_7444( var_0 )
{
    var_1 = var_0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( self.tactical )
        self _meth_8192( "nogravity", var_1 );
    else
        self _meth_8192( "zonly_physics", var_1 );
}

_id_2088( var_0, var_1 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, var_1, self._id_35C7 );
}

_id_2061()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}
