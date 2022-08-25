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

main()
{
    self endon( "killanimscript" );

    if ( !isalive( self.enemy ) )
        _id_20AC();
    else
    {
        if ( isplayer( self.enemy ) )
        {
            _id_5B81();
            return;
        }

        _id_5B92();
    }
}

_id_5374()
{
    self endon( "pvd_melee_interrupted" );

    if ( !isdefined( self._id_5B8B._id_6C50 ) )
        return;

    var_0 = self._id_5B8B._id_6C50;

    if ( isdefined( var_0._id_6B7D ) )
        return;

    var_0._id_6B7D = 1;

    if ( maps\_utility::_id_536C( self._id_5B8B ) )
    {
        _id_53C0( self._id_5B8B, self );
        return;
    }

    self._id_5B8B._id_8A2B = 1;
    self._id_5B8B setcandamage( 1 );
    playfxontag( level._effect["dog_bite_blood"], var_0, "tag_torso" );
    wait 1;

    if ( !isdefined( self ) || !isdefined( self._id_5B8B ) )
        return;

    var_1 = _id_503A();
    self._id_5B8B enablehealthshield( 0 );

    if ( !isalive( self._id_5B8B ) )
        return;

    self._id_5B8B _id_2CB5( self );
    self._id_5B8B shellshock( "default", 5 );
    waitframe;
    setdvar( "ui_deadquote", "" );
    thread _id_2C97( self._id_5B8B, var_1 );
}
#using_animtree("dog");

_id_53C0( var_0, var_1 )
{
    var_0._id_2C9D = 1;
    var_2 = _id_2CBB();
    self setflaggedanimknobrestart( "meleeanim", %german_shepherd_player_getoff, 1, 0.1, var_2 );
    var_0._id_6C50 notify( "pvd_melee_interrupted" );
    var_0._id_6C50 notify( "pvd_melee_done" );
    var_0._id_6C50 _id_6D7B( var_0 );

    if ( !maps\_utility::_id_536C( var_0 ) )
        var_0 _id_2CB5( var_1 );
}

_id_2CB5( var_0 )
{
    if ( maps\_utility::_id_55E1() )
        self enabledeathshield( 0 );

    self disableinvulnerability();

    if ( isalive( var_0 ) )
        self kill( self.origin, var_0 );
    else
        self kill( self.origin );
}

_id_2C97( var_0, var_1 )
{
    if ( maps\_utility::_id_5083() )
        return;

    wait 1.5;
    thread _id_2C9A( var_0 );
    var_2 = newclienthudelem( var_0 );
    var_2.x = 0;
    var_2.y = 15;

    if ( var_1 )
        var_2 setshader( "hud_hyena_melee", 50, 50 );
    else
        var_2 setshader( "hud_dog_melee", 50, 50 );

    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2.horzalign = "center";
    var_2.vertalign = "middle";
    var_2.foreground = 1;
    var_2.alpha = 0;
    var_2 fadeovertime( 1 );
    var_2.alpha = 1;
}

_id_2C9A( var_0 )
{
    var_1 = var_0 maps\_hud_util::_id_23ED( "default", 1 );
    var_1.color = ( 1.0, 1.0, 1.0 );
    var_1 settext( level._id_2C98 );
    var_1.x = 0;
    var_1.y = -30;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.foreground = 1;
    var_1.alpha = 0;
    var_1 fadeovertime( 1 );
    var_1.alpha = 1;
}

attackmiss()
{
    self _meth_8144( %root, 0.1 );
    var_0 = %german_shepherd_attack_player_miss_b;

    if ( isdefined( self.enemy ) )
    {
        var_1 = anglestoforward( ( 0, self.desiredangle, 0 ) );
        var_2 = vectornormalize( self.enemy.origin - self.origin );
        var_3 = self.enemy.origin - self.origin + var_1 * 40;

        if ( vectordot( var_2, var_1 ) > 0.707 || vectordot( var_3, var_1 ) > 0 )
            thread animscripts\dog\dog_stop::_id_585C( "normal" );
        else
        {
            self._id_85C3 = 1;
            thread attackmisstracktargetthread();

            if ( var_2[0] * var_1[1] - var_2[1] * var_1[0] > 0 )
                var_0 = %german_shepherd_attack_player_miss_turnr;
            else
                var_0 = %german_shepherd_attack_player_miss_turnl;
        }
    }

    self setflaggedanimrestart( "miss_anim", var_0, 1, 0, 1 );
    var_4 = getanimlength( var_0 );
    animscripts\notetracks::_id_2D0B( var_4 - 0.1, "miss_anim" );
    self notify( "stop tracking" );
}

attackmisstracktargetthread()
{
    self endon( "killanimscript" );
    wait 0.6;
    self _meth_8193( "face enemy" );
}

_id_53C3( var_0 )
{
    var_0 endon( "death" );
    var_0 allowads( 0 );
    wait 0.75;
    var_0 allowads( 1 );
}

_id_2CD3()
{
    if ( isdefined( self._id_5B8B ) )
    {
        if ( isdefined( self._id_5B8B._id_9C29 ) && self._id_5B8B._id_9C29 )
            self._id_5B8B notify( "force_out_of_uav" );

        if ( self._id_5B8B islinked() && common_scripts\utility::_id_3839( "price_picked_up" ) && !common_scripts\utility::_id_382E( "price_picked_up" ) )
            return undefined;

        if ( self._id_5B8B ismantling() )
            return undefined;

        if ( self._id_5B8B.laststand && self._id_5B8B.ignoreme )
            return undefined;
    }

    if ( isdefined( self.enemy ) )
    {
        if ( distance2d( self.origin, self.enemy.origin ) < 32 )
            return self _meth_81EC();
    }

    return self _meth_81EC( anglestoforward( self.angles ) );
}

_id_4666( var_0 )
{
    switch ( var_0 )
    {
        case "dog_melee":
            var_1 = _id_2CD3();

            if ( isdefined( var_1 ) )
            {
                if ( isplayer( var_1 ) )
                {
                    if ( getdvarint( "survival_chaos" ) != 1 )
                    {
                        var_1 shellshock( "dog_bite", 1 );
                        thread _id_53C3( var_1 );
                    }
                }
            }
            else
            {
                attackmiss();
                return 1;
            }

            break;
        case "stop_tracking":
            self _meth_8193( "face current" );
            break;
    }
}

addsafetyhealth()
{
    var_0 = self._id_5B8B getnormalhealth();

    if ( var_0 == 0 )
        return 0;

    if ( var_0 < 0.25 )
    {
        self._id_5B8B setnormalhealth( var_0 + 0.25 );
        return 1;
    }

    return 0;
}

_id_73D7()
{
    var_0 = self._id_5B8B getnormalhealth();

    if ( var_0 > 0.25 )
        self._id_5B8B setnormalhealth( var_0 - 0.25 );
    else
        self._id_5B8B setnormalhealth( 0.01 );
}

_id_4668( var_0 )
{
    switch ( var_0 )
    {
        case "dog_melee":
            var_1 = addsafetyhealth();
            var_2 = _id_2CD3();

            if ( isdefined( var_2 ) && isplayer( var_2 ) && isalive( self._id_5B8B ) )
            {
                if ( var_1 )
                    _id_73D7();

                self._id_85C3 = undefined;
                self._id_5B8B._id_6C50 = _id_6D82( self );

                if ( self._id_5B8B._id_6C50 _id_6D83( self ) )
                    self setcandamage( 0 );
            }
            else
            {
                if ( var_1 )
                    _id_73D7();

                attackmiss();
                return 1;
            }

            break;
        case "dog_early":
            self notify( "dog_early_notetrack" );
            thread show_prepare_dog_hint_h1();
            thread destroy_dog_hint_on_dog_death_h1();
            var_3 = 0.45 + 0.8 * level._id_2CB0[level._id_2CAF];
            var_3 *= _id_2CBB();
            level._id_2CAF++;

            if ( level._id_2CAF >= level._id_2CB0.size )
            {
                level._id_2CAF = 0;
                level._id_2CB0 = common_scripts\utility::array_randomize( level._id_2CB0 );
            }

            self setflaggedanimlimited( "meleeanim", %german_shepherd_attack_player, 1, 0.2, var_3 );
            self setflaggedanimlimited( "meleeanim", %german_shepherd_attack_player_late, 1, 0.2, var_3 );
            self._id_5B8B._id_6C50 _id_6D7F( var_3 );
            break;
        case "dog_lunge":
            thread _id_7E7C();
            var_3 = _id_2CBB();
            self setflaggedanim( "meleeanim", %german_shepherd_attack_player, 1, 0.2, var_3 );
            self._id_5B8B._id_6C50 _id_6D7E( var_3 );
            break;
        case "dogbite_damage":
            thread _id_5374();
            break;
        case "stop_tracking":
            self _meth_8193( "face current" );
            break;
    }
}

destroy_dog_hint_on_dog_death_h1()
{
    self waittill( "death" );
    destroy_dog_hint();
}

_id_4555( var_0 )
{
    switch ( var_0 )
    {
        case "dogbite_damage":
            thread _id_5374();
            break;
    }
}

_id_7E7C()
{
    wait 0.1;
    self.press_time = self._id_5B8B._id_4441._id_2CB6 / _id_2CBB();
    thread dog_hint_h1();
    self._id_5B37 = gettime();
}

_id_6C8F()
{
    self._id_5596 = 0;
    self._id_2CD5 = 0;
}

_id_5B81()
{
    thread maps\_utility::_id_69C4( "anml_dog_attack_jump" );
    self._id_5B8B = self.enemy;

    if ( !isdefined( self._id_5B8B._id_2CCF ) )
        self._id_5B8B _id_6C8F();

    var_0 = 30;
    var_1 = self.meleeattackdist + var_0;

    for (;;)
    {
        if ( !isalive( self.enemy ) )
            break;

        if ( !isplayer( self.enemy ) )
            break;

        if ( maps\_utility::_id_5062( self.enemy ) )
        {
            _id_20AC();
            continue;
        }

        if ( isdefined( self._id_5B8B.syncedmeleetarget ) && self._id_5B8B.syncedmeleetarget != self || isdefined( self._id_5B8B._id_6C50 ) && isdefined( self._id_5B8B._id_6C50._id_4E82 ) )
        {
            if ( _id_1CFC( var_1 ) )
                break;
            else
            {
                _id_20AC();
                continue;
            }
        }

        if ( _id_84BC() )
        {
            _id_20AC();
            continue;
        }

        self _meth_8193( "face enemy" );
        self _meth_8192( "zonly_physics" );
        self.safetochangescript = 0;
        _id_6F19();
        self _meth_8144( %root, 0.1 );
        self _meth_81FF();
        self._id_5B8B _id_7FBD( 500 );

        if ( _id_2C92() )
        {
            self._id_5B8B._id_5596 = gettime();
            self._id_5B8B._id_2CD5++;
            self setflaggedanimrestart( "meleeanim", %german_shepherd_run_attack_b, 1, 0.2, 1 );
            animscripts\shared::_id_2D06( "meleeanim", ::_id_4666 );
        }
        else
        {
            thread _id_2CAE();
            self._id_5B8B.attacked_by_dog = 1;
            self._id_5B8B.laststand = 0;
            self._id_5B8B.achieve_downed_kills = undefined;
            thread _id_1ECC();
            self setflaggedanimrestart( "meleeanim", %german_shepherd_attack_player, 1, 0.2, 1 );
            self setflaggedanimrestart( "meleeanim", %german_shepherd_attack_player_late, 1, 0, 1 );
            self _meth_814E( %attack_player, 1, 0, 1 );
            self _meth_814E( %attack_player_late, 0.01, 0, 1 );
            animscripts\shared::_id_2D06( "meleeanim", ::_id_4668 );
            self notify( "dog_no_longer_melee_able" );
            self setcandamage( 1 );
            self unlink();
        }

        self.safetochangescript = 1;
        wait 0.05;

        if ( _id_1CFC( var_1 ) )
            break;
    }

    self.safetochangescript = 1;
    self _meth_8192( "none" );
}

_id_1ECC()
{
    self waittill( "death" );
    self._id_5B8B.attacked_by_dog = undefined;
}

_id_2C92()
{
    if ( isdefined( self._id_5B8B._id_2CD9 ) )
        return 1;

    if ( getdvarint( "survival_chaos" ) == 1 )
        return 1;

    if ( maps\_utility::_id_5062( self._id_5B8B ) )
        return 1;

    if ( isdefined( self._id_5B8B._id_8626 ) )
        return 1;

    if ( gettime() - self._id_5B8B._id_5596 > 8000 )
        self._id_5B8B._id_2CD5 = 0;

    return self._id_5B8B._id_2CD5 < self._id_5B8B._id_4441._id_2CA7 && self._id_5B8B.health > 25;
}

_id_84BC()
{
    return isdefined( self.enemy._id_2CC2 ) && gettime() < self.enemy._id_2CC2;
}

_id_7FBD( var_0 )
{
    self._id_2CC2 = gettime() + var_0;
}

_id_5B92()
{
    if ( !isalive( self.enemy ) )
        return;

    self.enemy notify( "dog_attacks_ai" );

    if ( isdefined( self.enemy.syncedmeleetarget ) || _id_84BC() || !isai( self.enemy ) || isdefined( self.enemy._id_51DA ) )
        _id_20AC();
    else
    {
        self.enemy _id_7FBD( 500 );
        self.safetochangescript = 0;
        self _meth_8192( "zonly_physics" );
        self.pushable = 0;
        self _meth_81FF();
        self._id_5B8C = !isdefined( self.enemy._id_58D7 ) && ( isdefined( self.enemy.a._id_2CE7 ) || isdefined( self._id_5B7F ) || randomint( 100 ) > 50 );
        var_0 = [];
        var_1[0] = %root;
        var_1[1] = %german_shepherd_attack_ai_01_start_a;
        var_1[2] = %german_shepherd_attack_ai_02_idle_a;

        if ( self._id_5B8C )
        {
            var_1[3] = %german_shepherd_attack_ai_03_pushed_a;
            var_1[4] = %german_shepherd_attack_ai_04_middle_a;
            var_1[5] = %german_shepherd_attack_ai_05_kill_a;
            var_2 = 5;
        }
        else
        {
            var_1[3] = %german_shepherd_attack_ai_03_shot_a;
            var_2 = 3;
        }

        var_3 = vectortoangles( self.origin - self.enemy.origin );
        var_3 = ( 0, var_3[1], 0 );
        self._id_65A6 = self.enemy;
        self setcandamage( 0 );
        self _meth_8144( var_1[0], 0.1 );
        self _meth_8142( "meleeanim", self.enemy.origin, var_3, var_1[1] );
        animscripts\shared::_id_2D06( "meleeanim", ::_id_4680 );
        self setcandamage( 1 );
        self _meth_8192( "zonly_physics" );

        for ( var_4 = 1; var_4 < var_2; var_4++ )
        {
            self _meth_8144( var_1[var_4], 0 );

            if ( !_id_4E92() )
                break;

            if ( !self._id_5B8C && var_4 + 1 == var_2 )
                self.health = 1;

            self setflaggedanimrestart( "meleeanim", var_1[var_4 + 1], 1, 0, 1 );
            animscripts\shared::_id_2D06( "meleeanim" );
        }

        self unlink();

        if ( !self._id_5B8C )
        {
            self kill();
            return;
        }

        self.pushable = 1;
        self.safetochangescript = 1;
        self._id_38A8 = 0;
    }
}

_id_20AC()
{
    self _meth_8193( "face enemy" );
    self _meth_8144( %root, 0.1 );
    self _meth_8192( "zonly_physics" );
    var_0 = [];
    var_0[0] = %german_shepherd_attackidle_b;
    var_0[1] = %german_shepherd_attackidle_bark;
    var_0[2] = %german_shepherd_attackidle_growl;
    var_1 = common_scripts\utility::_id_710E( var_0 );
    thread _id_20AD();
    self setflaggedanimrestart( "combat_idle", var_1, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "combat_idle" );
    self notify( "combatIdleEnd" );
}

_id_20AD()
{
    self endon( "killanimscript" );
    self endon( "combatIdleEnd" );

    for (;;)
    {
        wait 0.1;
        var_0 = getentarray( "player", "classname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];

            if ( !isdefined( var_2.syncedmeleetarget ) || var_2.syncedmeleetarget == self )
                continue;

            var_3 = var_2.origin - self.origin;

            if ( var_3[2] * var_3[2] > 6400 )
                continue;

            var_3 = ( var_3[0], var_3[1], 0 );
            var_4 = length( var_3 );

            if ( var_4 < 1 )
                var_3 = anglestoforward( self.angles );

            if ( var_4 < 30 )
            {
                var_3 *= 3 / var_4;
                self _meth_81CB( self.origin - var_3, ( 0.0, 30.0, 0.0 ) );
            }
        }
    }
}

_id_4E92()
{
    return isdefined( self.enemy ) && isdefined( self.enemy.syncedmeleetarget ) && self.enemy.syncedmeleetarget == self;
}

_id_4680( var_0 )
{
    if ( var_0 != "ai_attack_start" )
        return 0;

    if ( !isdefined( self.enemy ) )
        return 1;

    if ( self.enemy != self._id_65A6 )
        return 1;

    if ( isdefined( self.enemy.syncedmeleetarget ) )
        return 1;

    self._id_38A8 = 1;
    self.enemy.syncedmeleetarget = self;
    self.enemy _meth_819E( ::_id_5B97 );
}

_id_1CFC( var_0 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    var_1 = distancesquared( self.origin, self.enemy.origin );
    return var_1 > var_0 * var_0;
}

_id_6F19()
{
    if ( _id_503A() )
    {
        level._id_2C98 = &"NEW_HYENA_DEATH_DO_NOTHING_ALT";
        level._id_8857 = "@NEW_HYENA_DEATH_DO_NOTHING_ALT";
    }
    else
    {
        level._id_2C98 = &"NEW_DOG_DEATH_DO_NOTHING_ALT";
        level._id_8857 = "@NEW_DOG_DEATH_DO_NOTHING_ALT";
    }

    level._id_2C99 = "nothing";
    var_0 = distance( self.origin, self.enemy.origin );

    if ( var_0 > self.meleeattackdist )
    {
        var_1 = self.enemy.origin - self.origin;
        var_2 = ( var_0 - self.meleeattackdist ) / var_0;
        var_1 = ( var_1[0] * var_2, var_1[1] * var_2, var_1[2] * var_2 );
        thread attackteleportthread( var_1 );
    }
}

attackteleportthread( var_0 )
{
    self endon( "death" );
    self endon( "killanimscript" );
    var_1 = 5;
    var_2 = ( var_0[0] / var_1, var_0[1] / var_1, var_0[2] / var_1 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self _meth_81C9( self.origin + var_2 );
        wait 0.05;
    }
}

_id_6A62()
{
    return isalive( self._id_5B8B ) && self._id_5B8B meleebuttonpressed();
}

destroy_dog_hint()
{
    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    self._id_5B8B._id_2CCE maps\_hud_util::destroyElem();

    if ( isdefined( self._id_5B8B.doghintbackerblur ) )
    {
        self._id_5B8B.doghintbackerblur maps\_hud_util::destroyElem();
        self._id_5B8B.doghintbackerbordertop maps\_hud_util::destroyElem();
        self._id_5B8B.doghintbackerborderbottom maps\_hud_util::destroyElem();
    }
    else
        self._id_5B8B.doghintstar maps\_hud_util::destroyElem();

    level notify( "clearing_dog_hint" );
}

show_prepare_dog_hint_h1()
{
    if ( isdefined( self._id_5B8B._id_2CCE ) )
        destroy_dog_hint();

    if ( level.player common_scripts\utility::_id_5064() )
    {
        var_0 = 1.5;

        if ( level.console )
        {
            var_1 = getkeybinding( "+melee" );

            if ( var_1["count"] == 0 )
                var_1 = getkeybinding( "+melee_breath" );

            if ( var_1["count"] == 0 )
                var_1 = getkeybinding( "+melee_zoom" );

            foreach ( var_4, var_3 in var_1 )
            {
                if ( var_4 == "count" )
                    continue;

                if ( var_3 == &"KEY_BUTTON_RSTICK" || var_3 == &"KEY_BUTTON_LSTICK" )
                {
                    var_0 = 1.15;
                    break;
                }
            }
        }

        self._id_5B8B._id_2CCE = self._id_5B8B maps\_hud_util::_id_23ED( "timer", var_0 );
        self._id_5B8B._id_2CCE.color = ( 1.0, 1.0, 1.0 );
        self._id_5B8B._id_2CCE settext( &"SCRIPT_PLATFORM_DOG_HINT" );
        self._id_5B8B._id_2CCE.x = 0;
        self._id_5B8B._id_2CCE.y = 20;
        self._id_5B8B._id_2CCE.alignx = "center";
        self._id_5B8B._id_2CCE.aligny = "middle";
        self._id_5B8B._id_2CCE.horzalign = "center";
        self._id_5B8B._id_2CCE.vertalign = "middle";
        self._id_5B8B._id_2CCE.foreground = 1;
        self._id_5B8B._id_2CCE.alpha = 0.1;
        self._id_5B8B._id_2CCE.sort = -1;
        self._id_5B8B.doghintstar = maps\_hud_util::createIcon( "h1_dog_melee_prompt_star", 0, 0 );
        self._id_5B8B.doghintstar.color = ( 1.0, 1.0, 1.0 );
        self._id_5B8B.doghintstar.x = 0;
        self._id_5B8B.doghintstar.y = 20;
        self._id_5B8B.doghintstar.alignx = "center";
        self._id_5B8B.doghintstar.aligny = "middle";
        self._id_5B8B.doghintstar.horzalign = "center";
        self._id_5B8B.doghintstar.vertalign = "middle";
        self._id_5B8B.doghintstar.foreground = 1;
        self._id_5B8B.doghintstar.alpha = 0;
        self._id_5B8B.doghintstar.sort = -2;
    }
    else
    {
        self._id_5B8B._id_2CCE = self._id_5B8B maps\_hud_util::_id_23ED( "timer", 0.5 );
        self._id_5B8B._id_2CCE.color = ( 1.0, 1.0, 1.0 );
        self._id_5B8B._id_2CCE settext( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD" );
        self._id_5B8B._id_2CCE.x = 0;
        self._id_5B8B._id_2CCE.y = 20;
        self._id_5B8B._id_2CCE.font = "timer";
        self._id_5B8B._id_2CCE.alignx = "center";
        self._id_5B8B._id_2CCE.aligny = "middle";
        self._id_5B8B._id_2CCE.horzalign = "center";
        self._id_5B8B._id_2CCE.vertalign = "middle";
        self._id_5B8B._id_2CCE.foreground = 1;
        self._id_5B8B._id_2CCE.alpha = 0.25;
        self._id_5B8B._id_2CCE.sort = -1;
        self._id_5B8B.doghintbackerblur = maps\_hud_util::createIcon( "h1_hud_tutorial_blur", 225, 20 );
        self._id_5B8B.doghintbackerbordertop = maps\_hud_util::createIcon( "h1_hud_tutorial_border", 225, 1 );
        self._id_5B8B.doghintbackerborderbottom = maps\_hud_util::createIcon( "h1_hud_tutorial_border", 225, 1 );
        self._id_5B8B.doghintbackerblur.x = 0;
        self._id_5B8B.doghintbackerblur.y = 20;
        self._id_5B8B.doghintbackerblur.sort = -3;
        self._id_5B8B.doghintbackerblur.alignx = "center";
        self._id_5B8B.doghintbackerblur.aligny = "middle";
        self._id_5B8B.doghintbackerblur.horzalign = "center";
        self._id_5B8B.doghintbackerblur.vertalign = "middle";
        self._id_5B8B.doghintbackerblur.foreground = 1;
        self._id_5B8B.doghintbackerblur.hidewheninmenu = 1;
        self._id_5B8B.doghintbackerblur.alpha = 0.225;
        self._id_5B8B.doghintbackerbordertop.x = 0;
        self._id_5B8B.doghintbackerbordertop.y = 10;
        self._id_5B8B.doghintbackerbordertop.sort = -2;
        self._id_5B8B.doghintbackerbordertop.alignx = "center";
        self._id_5B8B.doghintbackerbordertop.aligny = "middle";
        self._id_5B8B.doghintbackerbordertop.horzalign = "center";
        self._id_5B8B.doghintbackerbordertop.vertalign = "middle";
        self._id_5B8B.doghintbackerbordertop.foreground = 1;
        self._id_5B8B.doghintbackerbordertop.hidewheninmenu = 1;
        self._id_5B8B.doghintbackerbordertop.alpha = 0.0125;
        self._id_5B8B.doghintbackerborderbottom.x = 0;
        self._id_5B8B.doghintbackerborderbottom.y = 30;
        self._id_5B8B.doghintbackerborderbottom.sort = -2;
        self._id_5B8B.doghintbackerborderbottom.alignx = "center";
        self._id_5B8B.doghintbackerborderbottom.aligny = "middle";
        self._id_5B8B.doghintbackerborderbottom.horzalign = "center";
        self._id_5B8B.doghintbackerborderbottom.vertalign = "middle";
        self._id_5B8B.doghintbackerborderbottom.foreground = 1;
        self._id_5B8B.doghintbackerborderbottom.hidewheninmenu = 1;
        self._id_5B8B.doghintbackerborderbottom.alpha = 0.0125;
    }

    maps\_cheat::melonhead_remove_melon( 1, 1 );
}

dog_hint_h1()
{
    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    level endon( "clearing_dog_hint" );
    thread dog_hint_succeed_effect();
    self._id_5B8B._id_2CCE.alpha = 1;
    var_0 = self.press_time / 1000;

    if ( isdefined( self._id_5B8B.doghintstar ) )
    {
        var_1 = self._id_5B8B.doghintstar;
        var_2 = 0.11;
        var_3 = 64;
        var_4 = 64;

        for ( var_0 -= 0.05; var_0 >= var_2; var_0 -= 0.05 )
        {
            var_1.alpha = 0.75;
            var_1 scaleovertime( var_2, var_3, var_4 );
            wait 0.05;
            var_0 -= 0.05;
            var_1 fadeovertime( var_2 * 0.5 );
            var_1.alpha = 0;
            wait(var_2);
            var_0 -= var_2;
            var_1 scaleovertime( 0.05, 0, 0 );
            wait 0.05;
        }
    }
    else
    {
        self._id_5B8B.doghintbackerborderbottom.alpha = 0.05;
        self._id_5B8B.doghintbackerbordertop.alpha = 0.05;
        self._id_5B8B.doghintbackerblur.alpha = 0.9;
        wait(var_0);
    }

    if ( !maps\_utility::_id_32D8( "neck_snapped" ) )
        thread dog_hint_fail_effect();
}

dog_hint_succeed_effect()
{
    level endon( "clearing_dog_hint" );
    maps\_utility::_id_32E0( "neck_snapped" );

    if ( !isdefined( self ) )
        return;

    destroy_dog_hint();
}

dog_hint_fail_effect()
{
    self endon( "neck_snapped" );
    level endon( "clearing_dog_hint" );

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    if ( isdefined( self._id_5B8B.doghintbackerblur ) )
    {
        var_0 = 1.0;
        self._id_5B8B._id_2CCE settext( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD_FAIL" );
        wait 0.05;
        self._id_5B8B._id_2CCE fadeovertime( var_0 );
        self._id_5B8B.doghintbackerblur fadeovertime( var_0 );
        self._id_5B8B.doghintbackerbordertop fadeovertime( var_0 );
        self._id_5B8B.doghintbackerborderbottom fadeovertime( var_0 );
        self._id_5B8B._id_2CCE.alpha = 0;
        self._id_5B8B.doghintbackerblur.alpha = 0;
        self._id_5B8B.doghintbackerbordertop.alpha = 0;
        self._id_5B8B.doghintbackerborderbottom.alpha = 0;
        wait(var_0);
        destroy_dog_hint();
    }
    else
    {
        self._id_5B8B.doghintstar.alpha = 0;
        wait 0.05;
        var_0 = 0.25;
        self._id_5B8B._id_2CCE fadeovertime( var_0 );
        self._id_5B8B._id_2CCE.alpha = 0;
        wait(var_0);
        destroy_dog_hint();
    }
}

_id_2C9C()
{
    wait 0.7;

    if ( isdefined( self ) )
        self unlink();
}

_id_2C9B()
{
    self endon( "death" );
    wait 1.5;

    if ( isdefined( self ) )
        self setcandamage( 1 );
}

_id_2CAE()
{
    self endon( "killanimscript" );
    self endon( "dog_no_longer_melee_able" );

    if ( !maps\_utility::_id_32DC( "neck_snapped" ) )
        maps\_utility::_id_32DD( "neck_snapped" );

    var_0 = 0;
    self waittill( "dog_early_notetrack" );

    while ( _id_6A62() )
        wait 0.05;

    var_1 = 0;

    for (;;)
    {
        if ( !var_0 )
        {
            if ( _id_6A62() )
            {
                var_0 = 1;

                if ( isdefined( self._id_5B37 ) && isalive( self._id_5B8B ) )
                {
                    if ( gettime() - self._id_5B37 <= self.press_time )
                    {
                        self._id_5B8B _id_7E7B( var_1 );
                        self._id_5B8B._id_6C50._id_607A = 1;
                        maps\_utility::_id_32DE( "neck_snapped" );
                        self notify( "melee_stop" );
                        self setflaggedanimknobrestart( "dog_death_anim", %german_shepherd_player_neck_snap, 1, 0.2, 1 );
                        thread _id_2C9B();
                        self setcandamage( 0 );
                        maps\_utility::_id_41DD( "DOWN_BOY_DOWN" );
                        self waittillmatch( "dog_death_anim", "dog_death" );
                        thread common_scripts\utility::_id_69C2( "dog_neckbreak", self geteye() );
                        self setcandamage( 1 );
                        self.a._id_612E = 1;
                        self._id_2CB2 = 1;
                        var_2 = self._id_5B8B.origin - self.origin;
                        var_2 = ( var_2[0], var_2[1], 0 );
                        maps\_utility::arcademode_kill( self.origin, "melee", 50 );
                        thread _id_2C9C();
                        self kill( self geteye() - var_2, self._id_5B8B );
                        self notify( "killanimscript" );
                    }
                    else
                    {
                        self._id_5B8B _id_7E7B( var_1 );
                        self._id_5B8B._id_6C50 _id_6D7D();
                        self _meth_814E( %attack_player, 0.01, 0.2, 1 );
                        self _meth_814E( %attack_player_late, 1, 0.2, 1 );

                        if ( _id_503A() )
                        {
                            level._id_2C98 = &"NEW_HYENA_DEATH_TOO_LATE_ALT";
                            level._id_8857 = "@NEW_HYENA_DEATH_TOO_LATE_ALT";
                        }
                        else
                        {
                            level._id_2C98 = &"NEW_DOG_DEATH_TOO_LATE_ALT";
                            level._id_8857 = "@NEW_DOG_DEATH_TOO_LATE_ALT";
                        }

                        level._id_2C99 = "late";
                    }

                    return;
                }

                var_1 = 1;

                if ( self._id_5B8B _id_1A48() )
                {
                    if ( _id_503A() )
                    {
                        level._id_2C98 = &"NEW_HYENA_DEATH_TOO_SOON_ALT";
                        level._id_8857 = "@NEW_HYENA_DEATH_TOO_SOON_ALT";
                    }
                    else
                    {
                        level._id_2C98 = &"NEW_DOG_DEATH_TOO_SOON_ALT";
                        level._id_8857 = "@NEW_DOG_DEATH_TOO_SOON_ALT";
                    }

                    level._id_2C99 = "soon";
                    var_3 = _id_2CBB();
                    self setflaggedanimknobrestart( "meleeanim", %german_shepherd_player_neck_miss, 1, 0.2, var_3 );
                    self._id_5B8B._id_6C50 _id_6D80( var_3 );
                    return;
                }
            }
        }
        else if ( !_id_6A62() )
            var_0 = 0;

        wait 0.05;
    }
}

_id_1A48()
{
    if ( self._id_3BFE == 3 )
        return 1;

    if ( isdefined( self._id_2CD4 ) && self._id_2CD4 )
        return 1;

    return 0;
}

_id_7E7B( var_0 )
{
    if ( !var_0 )
        return;

    if ( level._id_3BFE > 1 && !isdefined( self._id_2CD4 ) )
        self._id_2CD4 = 1;
}
#using_animtree("generic_human");

_id_5B97()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "end_melee_struggle" );
    self endon( "end_melee_all" );

    if ( !isdefined( self.syncedmeleetarget ) )
        return;

    self _meth_8193( "face point", self.syncedmeleetarget.origin, 1 );
    self _meth_8192( "gravity" );
    self.a._id_6E5A = "stand";
    self.a._id_8A1A = "none";

    if ( animscripts\utility::_id_9C3A() )
        animscripts\shared::_id_6869( self.primaryweapon, "right" );

    var_0 = [];
    var_0[0] = %root;
    var_0[1] = %ai_attacked_german_shepherd_01_start_a;
    var_0[2] = %ai_attacked_german_shepherd_02_idle_a;

    if ( self.syncedmeleetarget._id_5B8C )
    {
        var_0[3] = %ai_attacked_german_shepherd_03_push_a;
        var_0[4] = %ai_attacked_german_shepherd_04_middle_a;
        var_0[5] = %ai_attacked_german_shepherd_05_death_a;
        var_1 = 5;
    }
    else
    {
        var_0[3] = %ai_attacked_german_shepherd_03_shoot_a;
        var_1 = 3;
    }

    self._id_5B8F = 0;
    thread _id_5B9A();
    self _meth_8144( var_0[0], 0.1 );
    self setflaggedanimrestart( "aianim", var_0[1], 1, 0.1, 1 );
    wait 0.15;
    self.syncedmeleetarget linkto( self, "tag_sync", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self waittillmatch( "aianim", "end" );
    self._id_5B8F = 1;

    while ( self._id_5B8F < var_1 )
    {
        self _meth_8144( var_0[self._id_5B8F], 0 );
        self._id_5B8F++;

        if ( var_1 == 3 && self._id_5B8F == 3 )
            _id_7FBD( getanimlength( var_0[self._id_5B8F] ) * 1000 - 1000 );

        self setflaggedanimrestart( "aianim", var_0[self._id_5B8F], 1, 0, 1 );
        animscripts\shared::_id_2D06( "aianim" );

        if ( !isdefined( self.syncedmeleetarget ) || !isalive( self.syncedmeleetarget ) )
        {
            if ( self._id_5B8F == 3 && var_1 == 5 )
            {
                var_0[4] = %ai_attacked_german_shepherd_04_getup_a;
                var_1 = 4;
            }
        }

        if ( self._id_5B8F == 5 )
        {
            if ( !isdefined( self._id_58D7 ) )
            {
                self.a._id_612E = 1;
                animscripts\shared::_id_2F6C();
                self kill();
            }
        }
    }

    _id_5B99();
}

_id_5B9A()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "end_melee_all" );
    var_0 = [];
    var_0[1] = %ai_attacked_german_shepherd_02_getup_a;
    var_0[2] = %ai_attacked_german_shepherd_02_getup_a;

    if ( self.syncedmeleetarget._id_5B8C )
        var_0[4] = %ai_attacked_german_shepherd_04_getup_a;

    for (;;)
    {
        if ( !isdefined( self.syncedmeleetarget ) || !isalive( self.syncedmeleetarget ) )
            break;

        wait 0.1;
    }

    if ( self._id_5B8F > 0 )
    {
        if ( !isdefined( var_0[self._id_5B8F] ) )
            return;

        self _meth_8144( %melee_dog, 0.1 );
        self setflaggedanimrestart( "getupanim", var_0[self._id_5B8F], 1, 0.1, 1 );
        animscripts\shared::_id_2D06( "getupanim" );
    }

    _id_5B99();
}

_id_5B99()
{
    self _meth_8193( "face default" );
    self.syncedmeleetarget = undefined;
    self._id_5B8F = undefined;
    self.allowpain = 1;
    _id_7FBD( 1000 );
    self notify( "end_melee_all" );
}
#using_animtree("player");

_id_6D82( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_5B8B.origin );
    var_1.angles = var_0._id_5B8B.angles;
    var_1 setmodel( level._id_6C51 );
    var_1 useanimtree( #animtree );
    var_1 hide();
    var_1 _meth_855D();
    return var_1;
}

_id_466E( var_0 )
{
    switch ( var_0 )
    {
        case "allow_player_save":
            if ( isdefined( self.dog ) )
            {
                wait 1;
                self.dog setcandamage( 1 );
            }

            break;
        case "blood_pool":
            if ( !isdefined( self.dog._id_5B8B ) )
                break;

            if ( maps\_utility::_id_536C( self.dog._id_5B8B ) )
                break;

            var_1 = self gettagorigin( "tag_torso" );
            var_2 = self gettagangles( "tag_torso" );
            var_3 = anglestoforward( var_2 );
            var_4 = anglestoup( var_2 );
            var_5 = anglestoright( var_2 );
            var_1 = var_1 + var_3 * -8.5 + var_4 * 5 + var_5 * 0;
            playfx( level._effect["deathfx_bloodpool"], var_1, var_3, var_4 );
            break;
    }
}

_id_6D7C( var_0 )
{
    self endon( "pvd_melee_interrupted" );
    var_1 = var_0._id_5B8B;
    self.dog = var_0;
    thread _id_6D7A( var_1 );
    self setflaggedanimrestart( "viewanim", %player_view_dog_knockdown );
    self setflaggedanimrestart( "viewanim", %player_view_dog_knockdown_late );
    self _meth_814E( %knockdown, 1, 0, 1 );
    self _meth_814E( %knockdown_late, 0.01, 0, 1 );
    animscripts\shared::_id_2D06( "viewanim", ::_id_466E );
    self dontinterpolate();
    self.dog = undefined;
    _id_6D7B( var_1 );
    self notify( "pvd_melee_done" );
}

_id_6D7A( var_0 )
{
    self endon( "pvd_melee_done" );
    self.dog common_scripts\utility::_id_A069( "death", "pain", "melee_stop" );

    if ( !isdefined( var_0._id_8A2B ) && isalive( var_0 ) )
    {
        self notify( "pvd_melee_interrupted" );
        self.dog notify( "pvd_melee_interrupted" );
        _id_6D7B( var_0 );
    }
}

_id_6D83( var_0 )
{
    if ( isdefined( self._id_4E82 ) )
        return 0;

    var_1 = var_0._id_5B8B;

    if ( isdefined( var_1 ) && isdefined( var_1._id_686B ) )
        var_1 notify( "sentry_placement_canceled" );

    var_1 notify( "dog_attacks_player" );
    self._id_4E82 = 1;

    if ( isalive( var_1 ) )
        var_1 hidehud();

    var_1 setstance( "stand" );
    var_1.syncedmeleetarget = var_0;
    var_1._id_6C50 _id_6D81( var_1 );
    var_2 = var_0.origin - var_1.origin;
    self.angles = vectortoangles( var_2 );
    self.angles = ( 0, self.angles[1], 0 );
    self._id_8CFF = self.angles;
    var_3 = var_1.origin;
    var_4 = var_1 _meth_813E( var_1.origin );

    if ( isdefined( var_4 ) )
        self.origin = var_4;
    else
        self.origin = var_1.origin;

    thread _id_6D7C( var_0 );
    self dontinterpolate();
    var_1 playerlinktoabsolute( self, "tag_player" );
    var_0 linkto( self, "tag_sync", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5 = self gettagangles( "tag_sync" );
    var_0 _meth_8193( "face angle", var_5[1] );
    var_0 _meth_8193( "face default" );
    var_1 allowstand( 1 );
    var_1 allowlean( 0 );
    var_1 allowcrouch( 0 );
    var_1 allowprone( 0 );
    var_1 freezecontrols( 1 );
    var_1 setcandamage( 0 );
    return 1;
}

_id_7819( var_0 )
{
    wait 0.5;
    var_0 playsound( "saved_from_dog" );
}

_id_6B2B()
{
    self endon( "death" );
    self _meth_847D();
    self enableweapons();
}

_id_6D7B( var_0 )
{
    var_0 showhud();

    if ( isalive( var_0 ) )
    {
        self _meth_8144( %player_view_dog_knockdown, 0.1 );

        if ( isdefined( self._id_607A ) )
            self setflaggedanimrestart( "viewanim", %player_view_dog_knockdown_neck_snap, 1, 0.2, 1 );
        else if ( isdefined( var_0._id_2C9D ) )
            self setflaggedanimknobrestart( "viewanim", %player_view_dog_knockdown_laststand, 1, 0.1, 1 );
        else
        {
            thread _id_7819( var_0 );
            self setflaggedanimrestart( "viewanim", %player_view_dog_knockdown_saved );
        }

        if ( !isdefined( var_0._id_2C9D ) )
        {
            var_0 maps\_utility::_id_27EF( 2.5, ::_id_6B2B );
            animscripts\shared::_id_2D06( "viewanim" );
            var_0 notify( "player_saved_from_dog" );
        }
        else
        {
            animscripts\shared::_id_2D06( "viewanim" );
            var_0 notify( "deathshield", 1000000, self.dog );
            var_0 _meth_847D();
        }

        _id_6D84( var_0 );
    }
    else
        setsaveddvar( "compass", 0 );

    var_0.syncedmeleetarget = undefined;
    var_0._id_2C9D = undefined;
    _id_74B0( var_0 );
}

_id_6D84( var_0 )
{
    var_0 show();
    var_0 unlink();
    var_0 setorigin( self.origin );
    var_0 setplayerangles( self._id_8CFF );
    var_0 setcandamage( 1 );
    var_1 = var_0._id_6C50;

    if ( isdefined( var_1 ) )
    {
        var_1 delete();
        var_0._id_6C50 = undefined;
    }
}

_id_74B0( var_0 )
{
    var_0 allowlean( 1 );
    var_0 allowcrouch( 1 );
    var_0 allowprone( 1 );
    var_0 freezecontrols( 0 );
    var_0.attacked_by_dog = undefined;
}

_id_6D81( var_0 )
{
    self showonclient( var_0 );
    var_0 _meth_847E();
    var_0 disableweapons();
}

_id_6D7F( var_0 )
{
    self setflaggedanimlimited( "viewanim", %player_view_dog_knockdown, 1, 0.2, var_0 );
    self setflaggedanimlimited( "viewanim", %player_view_dog_knockdown_late, 1, 0.2, var_0 );
}

_id_6D7E( var_0 )
{
    self setflaggedanimlimited( "viewanim", %player_view_dog_knockdown, 1, 0.2, var_0 );
    self setflaggedanimlimited( "viewanim", %player_view_dog_knockdown_late, 1, 0.2, var_0 );
}

_id_6D80( var_0 )
{
    self setflaggedanimknobrestart( "viewanim", %player_view_dog_knockdown_neck_miss, 1, 0.2, var_0 );
}

_id_6D7D()
{
    self _meth_814E( %knockdown, 0.01, 0.2, 1 );
    self _meth_814E( %knockdown_late, 1, 0.2, 1 );
}

_id_2CBB()
{
    return 1;
}

_id_503A()
{
    if ( issubstr( self.classname, "hyena" ) )
        return 1;

    return 0;
}
