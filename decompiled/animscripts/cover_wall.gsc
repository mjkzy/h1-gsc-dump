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

_id_4C81()
{
    var_0 = [];
    var_0["add_aim_up"] = %covercrouch_aim8_add;
    var_0["add_aim_down"] = %covercrouch_aim2_add;
    var_0["add_aim_left"] = %covercrouch_aim4_add;
    var_0["add_aim_right"] = %covercrouch_aim6_add;
    var_0["straight_level"] = %covercrouch_aim5;
    var_0["hide_idle"] = %covercrouch_hide_idle;
    var_0["hide_idle_twitch"] = animscripts\utility::array( %covercrouch_twitch_2, %covercrouch_twitch_3, %covercrouch_twitch_4 );
    var_0["hide_idle_flinch"] = animscripts\utility::array();
    var_0["hide_2_crouch"] = %covercrouch_hide_2_aim;
    var_0["hide_2_stand"] = %covercrouch_hide_2_stand;
    var_0["hide_2_lean"] = %covercrouch_hide_2_lean;
    var_0["hide_2_right"] = %covercrouch_hide_2_right;
    var_0["hide_2_left"] = %covercrouch_hide_2_left;
    var_0["crouch_2_hide"] = %covercrouch_aim_2_hide;
    var_0["stand_2_hide"] = %covercrouch_stand_2_hide;
    var_0["lean_2_hide"] = %covercrouch_lean_2_hide;
    var_0["right_2_hide"] = %covercrouch_right_2_hide;
    var_0["left_2_hide"] = %covercrouch_left_2_hide;
    var_0["smg_hide_2_stand"] = %smg_covercrouch_hide_2_stand;
    var_0["smg_stand_2_hide"] = %smg_covercrouch_stand_2_hide;
    var_0["crouch_aim"] = %covercrouch_aim5;
    var_0["stand_aim"] = %exposed_aim_5;
    var_0["lean_aim"] = %covercrouch_lean_aim5;
    var_0["fire"] = %exposed_shoot_auto_v2;
    var_0["semi2"] = %exposed_shoot_semi2;
    var_0["semi3"] = %exposed_shoot_semi3;
    var_0["semi4"] = %exposed_shoot_semi4;
    var_0["semi5"] = %exposed_shoot_semi5;
    var_0["single"] = [ %exposed_shoot_semi1 ];
    var_0["burst2"] = %exposed_shoot_burst3;
    var_0["burst3"] = %exposed_shoot_burst3;
    var_0["burst4"] = %exposed_shoot_burst4;
    var_0["burst5"] = %exposed_shoot_burst5;
    var_0["burst6"] = %exposed_shoot_burst6;
    var_0["blind_fire"] = animscripts\utility::array( %covercrouch_blindfire_1, %covercrouch_blindfire_2, %covercrouch_blindfire_3, %covercrouch_blindfire_4 );
    var_0["reload"] = %covercrouch_reload_hide;
    var_0["shotgun_reload"] = %shotgun_covercrouch_reload;
    var_0["grenade_safe"] = animscripts\utility::array( %covercrouch_grenadea, %covercrouch_grenadeb );
    var_0["grenade_exposed"] = animscripts\utility::array( %covercrouch_grenadea, %covercrouch_grenadeb );
    var_0["exposed_idle"] = animscripts\utility::array( %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 );
    var_0["look"] = animscripts\utility::array( %covercrouch_hide_look );
    anim.archetypes["soldier"]["cover_crouch"] = var_0;
    var_0 = [];
    var_0["add_aim_up"] = %coverstandaim_aim8_add;
    var_0["add_aim_down"] = %coverstandaim_aim2_add;
    var_0["add_aim_left"] = %coverstandaim_aim4_add;
    var_0["add_aim_right"] = %coverstandaim_aim6_add;
    var_0["straight_level"] = %coverstandaim_aim5;
    var_0["hide_idle"] = %coverstand_hide_idle;
    var_0["hide_idle_twitch"] = animscripts\utility::array( %coverstand_hide_idle_twitch01, %coverstand_hide_idle_twitch03, %coverstand_hide_idle_twitch04, %coverstand_hide_idle_twitch05 );
    var_0["hide_idle_flinch"] = animscripts\utility::array( %coverstand_react01, %coverstand_react02, %coverstand_react03, %coverstand_react04 );
    var_0["hide_2_stand"] = %coverstand_hide_2_aim;
    var_0["stand_2_hide"] = %coverstand_aim_2_hide;
    var_0["smg_hide_2_stand"] = %smg_coverstand_hide_2_aim;
    var_0["smg_stand_2_hide"] = %smg_coverstand_aim_2_hide;
    var_0["hide_2_over"] = %coverstand_2_coverstandaim;
    var_0["over_2_hide"] = %coverstandaim_2_coverstand;
    var_0["over_aim"] = %coverstandaim_aim5;
    var_0["fire"] = %coverstandaim_autofire;
    var_0["semi2"] = %coverstandaim_fire;
    var_0["semi3"] = %coverstandaim_fire;
    var_0["semi4"] = %coverstandaim_fire;
    var_0["semi5"] = %coverstandaim_fire;
    var_0["single"] = animscripts\utility::array( %coverstandaim_fire );
    var_0["burst2"] = %coverstandaim_autofire;
    var_0["burst3"] = %coverstandaim_autofire;
    var_0["burst4"] = %coverstandaim_autofire;
    var_0["burst5"] = %coverstandaim_autofire;
    var_0["burst6"] = %coverstandaim_autofire;
    var_0["blind_fire"] = animscripts\utility::array( %coverstand_blindfire_1, %coverstand_blindfire_2 );
    var_0["reload"] = %coverstand_reloada;
    var_0["look"] = animscripts\utility::array( %coverstand_look_quick, %coverstand_look_quick_v2 );
    var_0["grenade_safe"] = animscripts\utility::array( %coverstand_grenadea, %coverstand_grenadeb );
    var_0["grenade_exposed"] = animscripts\utility::array( %coverstand_grenadea, %coverstand_grenadeb );
    var_0["exposed_idle"] = animscripts\utility::array( %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 );
    var_0["hide_to_look"] = %coverstand_look_moveup;
    var_0["look_idle"] = %coverstand_look_idle;
    var_0["look_to_hide"] = %coverstand_look_movedown;
    var_0["look_to_hide_fast"] = %coverstand_look_movedown_fast;
    anim.archetypes["soldier"]["cover_stand"] = var_0;
}

_id_229A( var_0 )
{
    self endon( "killanimscript" );
    self._id_22BA = self.node;
    self._id_22CB = var_0;

    if ( !isdefined( self.node._id_9940 ) )
        animscripts\cover_behavior::_id_993F( 0 );

    if ( var_0 == "crouch" )
    {
        _id_80A1( "unknown" );
        self._id_22BA _id_4DA4();
    }
    else
    {
        _id_80A4( "unknown" );
        self._id_22BA _id_4DA5();
    }

    self.a.aimidlethread = undefined;
    self _meth_8193( "face angle", self._id_22BA.angles[1] );

    if ( isdefined( self.weapon ) && animscripts\utility::_id_9C2E() && isdefined( self.node ) && isdefined( self.node._id_99B3 ) && canspawnturret() )
    {
        if ( var_0 == "crouch" )
        {
            if ( _id_5195( self.weapon ) )
                var_1 = "rpd_bipod_crouch";
            else
                var_1 = "saw_bipod_crouch";
        }
        else if ( _id_5195( self.weapon ) )
            var_1 = "rpd_bipod_stand";
        else
            var_1 = "saw_bipod_stand";

        if ( _id_5195( self.weapon ) )
            var_2 = "weapon_rpd_MG_Setup";
        else
            var_2 = "weapon_saw_MG_Setup";

        if ( ismuzzleoptimizedsmall( self.weapon ) && turretoptimizedsmallversionexists( var_1 ) )
            var_1 += "_muzzle_small";

        _id_9C12( var_1, var_2, 0 );
    }
    else if ( isdefined( self.node ) && isdefined( self.node._id_9940 ) )
        _id_9C15();

    self _meth_8192( "normal" );

    if ( var_0 == "crouch" && self.a._id_6E5A == "stand" )
    {
        var_3 = animscripts\utility::animarray( "stand_2_hide" );

        if ( animscripts\utility::_id_9C3B() )
            var_3 = animscripts\utility::animarray( "smg_stand_2_hide" );

        var_4 = getanimlength( var_3 );
        self _meth_814B( var_3, %body, 1, 0.2, animscripts\combat_utility::_id_367A() );
        thread animscripts\shared::_id_5F94( self._id_22BA, var_4 );
        wait(var_4);
        self.a._id_22AB = "hide";
    }
    else
    {
        var_5 = 0.4;
        var_6 = _id_5884( var_5 );

        if ( distancesquared( self.origin, self._id_22BA.origin ) > 1 )
        {
            thread animscripts\shared::_id_5F94( self._id_22BA, var_6 );
            wait(var_6 / 2);

            if ( var_0 == "crouch" )
                self.a._id_6E5A = "crouch";

            wait(var_6 / 2);
        }
        else if ( var_6 == var_5 )
            wait 0.1;
        else
            wait(var_6);
    }

    _id_7F4E();

    if ( var_0 == "crouch" )
    {
        if ( self.a._id_6E5A == "prone" )
            animscripts\utility::_id_344B( 1 );

        self.a._id_6E5A = "crouch";
    }

    if ( self._id_22CB == "stand" )
        self.a._id_8A1A = "cover_stand";
    else
        self.a._id_8A1A = "cover_crouch";

    var_7 = spawnstruct();

    if ( !self.fixednode )
        var_7._id_5F93 = animscripts\cover_behavior::_id_5F93;

    var_7.reload = ::_id_22BE;
    var_7._id_5667 = ::_id_6E49;
    var_7.look = ::look;
    var_7._id_367E = ::_id_367E;
    var_7._id_4B63 = ::_id_4B63;
    var_7._id_38DF = ::_id_38DF;
    var_7.grenade = ::_id_98A5;
    var_7._id_4401 = ::_id_98A6;
    var_7.blindfire = ::blindfire;
    animscripts\cover_behavior::main( var_7 );
}

_id_5195( var_0 )
{
    return getsubstr( var_0, 0, 3 ) == "rpd" && ( var_0.size == 3 || var_0[3] == "_" );
}

ismuzzleoptimizedsmall( var_0 )
{
    return isendstr( var_0, "_muzzle_small" );
}

turretoptimizedsmallversionexists( var_0 )
{
    return var_0 == "rpd_bipod_crouch" || var_0 == "rpd_bipod_stand" || var_0 == "saw_bipod_crouch";
}

_id_4DA4()
{
    if ( isdefined( self._id_2482 ) )
        return;

    var_0 = ( 0.0, 0.0, 42.0 );
    var_1 = anglestoforward( self.angles );
    self._id_2482 = sighttracepassed( self.origin + var_0, self.origin + var_0 + var_1 * 64, 0, undefined );
}

_id_4DA5()
{
    if ( isdefined( self._id_58AE ) )
        return;

    var_0 = ( 0.0, 0.0, 48.0 );
    var_1 = anglestoforward( self.angles );
    self._id_58AE = sighttracepassed( self.origin + var_0, self.origin + var_0 + var_1 * 64, 0, undefined );
}

_id_80A1( var_0 )
{
    animscripts\combat::_id_7E08( self._id_22BA );
    _id_80AA( var_0 );
}

_id_80A4( var_0 )
{
    animscripts\combat::_id_7E08( self._id_22BA );
    _id_82B1( var_0 );
}

_id_22BE()
{
    var_0 = animscripts\utility::animarray( "reload" );

    if ( animscripts\utility::_id_51A3( self.weapon ) && isdefined( self.a.array["shotgun_reload"] ) )
        var_0 = animscripts\utility::animarray( "shotgun_reload" );

    var_1 = animscripts\combat_utility::reload( 2.0, var_0 );

    if ( isdefined( var_1 ) && var_1 )
        return 1;

    return 0;
}

_id_6E49()
{
    self.keepclaimednodeifvalid = 1;

    if ( isdefined( self._id_7109 ) && randomfloat( 1 ) < self._id_7109 )
    {
        if ( _id_7104() )
            return 1;
    }

    if ( !_id_6E43() )
        return 0;

    _id_83EA();
    animscripts\combat_utility::_id_315E();

    if ( isdefined( self._id_840F ) )
    {
        var_0 = lengthsquared( self.origin - self._id_840F );

        if ( animscripts\utility::_id_9C36() && animscripts\utility::_id_8495( var_0 ) )
        {
            if ( self.a._id_6E5A == "stand" )
                animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_stand" ) );
            else
                animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_crouch" ) );
        }
    }

    _id_4240();
    self._id_22A0 = undefined;
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_83EA()
{
    self endon( "return_to_cover" );
    maps\_gameskill::_id_2A4D();

    for (;;)
    {
        if ( isdefined( self._id_84A7 ) )
            break;

        if ( !isdefined( self._id_840F ) )
        {
            self waittill( "do_slow_things" );
            waitframe;

            if ( isdefined( self._id_840F ) )
                continue;

            break;
        }

        if ( !self.bulletsinclip )
            break;

        if ( self._id_22CB == "crouch" && _id_6086() )
            break;

        _id_8419();
        self _meth_8144( %add_fire, 0.2 );
    }
}

_id_8419()
{
    if ( self._id_22CB == "crouch" )
        thread anglerangethread();

    thread animscripts\combat_utility::aimidlethread();
    animscripts\combat_utility::_id_8417();
}

_id_7104()
{
    if ( !animscripts\utility::_id_472C() )
        return 0;

    var_0 = "rambo";

    if ( randomint( 10 ) < 2 )
        var_0 = "rambo_fail";

    if ( !animscripts\utility::animarrayanyexist( var_0 ) )
        return 0;

    if ( self._id_22CB == "crouch" && !self._id_22BA._id_2482 )
        return 0;

    var_1 = _id_40C9( self._id_22BA.origin + animscripts\utility::_id_404D( self._id_22BA ) );

    if ( var_1 > 15 )
        return 0;

    var_2 = anglestoforward( self.angles );
    var_3 = self.origin + var_2 * -16;

    if ( !self _meth_81C7( var_3 ) )
        return 0;

    self._id_22BC = gettime();
    _id_7F4E();
    self.keepclaimednodeifvalid = 1;
    self._id_5187 = 1;
    self.a._id_6F4D = "rambo";
    self._id_1C86 = 1;
    thread animscripts\shared::_id_7106( 0 );
    var_4 = animscripts\utility::animarraypickrandom( var_0 );
    self setflaggedanimknoballrestart( "rambo", var_4, %body, 1, 0.2, 1 );
    _id_2299( var_4 );
    animscripts\shared::_id_2D06( "rambo" );
    self notify( "rambo_aim_end" );
    self._id_1C86 = 0;
    self.keepclaimednodeifvalid = 0;
    self._id_55D1 = gettime();
    self._id_1C86 = 0;
    self._id_5187 = undefined;
    return 1;
}

_id_4B63()
{
    self endon( "end_idle" );

    for (;;)
    {
        var_0 = randomint( 2 ) == 0 && animscripts\utility::animarrayanyexist( "hide_idle_twitch" );

        if ( var_0 )
            var_1 = animscripts\utility::animarraypickrandom( "hide_idle_twitch" );
        else
            var_1 = animscripts\utility::animarray( "hide_idle" );

        _id_6DAC( var_1, var_0 );
    }
}

_id_38DF()
{
    if ( !animscripts\utility::animarrayanyexist( "hide_idle_flinch" ) )
        return 0;

    var_0 = anglestoforward( self.angles );
    var_1 = self.origin + var_0 * -16;

    if ( !self _meth_81C7( var_1, !self.swimmer ) )
        return 0;

    _id_7F4E();
    self.keepclaimednodeifvalid = 1;
    var_2 = animscripts\utility::animarraypickrandom( "hide_idle_flinch" );
    _id_6DAC( var_2, 1 );
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_6DAC( var_0, var_1 )
{
    if ( var_1 )
        self setflaggedanimknoballrestart( "idle", var_0, %body, 1, 0.25, 1 );
    else
        self setflaggedanimknoball( "idle", var_0, %body, 1, 0.25, 1 );

    _id_2299( var_0 );
    self.a._id_22AB = "hide";
    animscripts\shared::_id_2D06( "idle" );
}

look( var_0 )
{
    if ( !isdefined( self.a.array["hide_to_look"] ) )
        return 0;

    if ( !_id_67B9() )
        return 0;

    animscripts\shared::_id_6DC1( animscripts\utility::animarray( "look_idle" ), var_0 );
    var_1 = undefined;

    if ( animscripts\utility::_id_51C3() )
        var_1 = animscripts\utility::animarray( "look_to_hide_fast" );
    else
        var_1 = animscripts\utility::animarray( "look_to_hide" );

    self setflaggedanimknoballrestart( "looking_end", var_1, %body, 1, 0.1 );
    _id_2299( var_1 );
    animscripts\shared::_id_2D06( "looking_end" );
    return 1;
}

_id_67B9()
{
    if ( isdefined( self._id_22BA._id_79A9 ) )
        return 0;

    var_0 = animscripts\utility::animarray( "hide_to_look" );
    self setflaggedanimknoball( "looking_start", var_0, %body, 1, 0.2 );
    _id_2299( var_0 );
    animscripts\shared::_id_2D06( "looking_start" );
    return 1;
}

_id_367E()
{
    var_0 = animscripts\utility::animarraypickrandom( "look" );
    self setflaggedanimknoballrestart( "look", var_0, %body, 1, 0.1 );
    _id_2299( var_0 );
    animscripts\shared::_id_2D06( "look" );
    return 1;
}

_id_6E44()
{
    if ( self.a._id_22AB == "left" || self.a._id_22AB == "right" || self.a._id_22AB == "over" )
        return 1;

    return animscripts\combat_utility::_id_711F();
}

_id_6E43()
{
    var_0 = _id_3F14();
    var_1 = 0.1;
    var_2 = animscripts\utility::animarray( "hide_2_" + var_0 );
    var_3 = !self.swimmer;

    if ( !self _meth_81C7( animscripts\utility::_id_3EFC( var_2 ), var_3 ) )
        return 0;

    if ( self.script == "cover_crouch" && var_0 == "lean" )
        self._id_22A0 = 1;

    if ( self._id_22CB == "crouch" )
        _id_80A1( var_0 );
    else
        _id_80A4( var_0 );

    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;

    if ( self._id_22CB == "stand" )
    {
        if ( animscripts\utility::_id_9C3B() )
            self.a._id_8A1A = "smg_cover_stand_aim";
        else
            self.a._id_8A1A = "cover_stand_aim";
    }
    else
        self.a._id_8A1A = "cover_crouch_aim";

    self._id_1C86 = 1;
    self notify( "done_changing_cover_pos" );
    _id_7F4E();
    var_4 = _id_6E44();
    self setflaggedanimknoballrestart( "pop_up", var_2, %body, 1, 0.1, var_4 );
    thread _id_2D0A( "pop_up" );

    if ( animhasnotetrack( var_2, "start_aim" ) )
    {
        self waittillmatch( "pop_up", "start_aim" );
        var_1 = getanimlength( var_2 ) / var_4 * ( 1 - self _meth_8151( var_2 ) );
    }
    else
    {
        self waittillmatch( "pop_up", "end" );
        var_1 = 0.1;
    }

    self _meth_8144( var_2, var_1 + 0.05 );
    self.a._id_22AB = var_0;
    self.a._id_6F4D = var_0;
    _id_8041( var_1 );
    thread animscripts\track::_id_9512();
    wait(var_1);

    if ( animscripts\combat_utility::issniper() )
        thread animscripts\shoot_behavior::_id_87D5();

    self._id_1C86 = 0;
    self._id_22BC = gettime();
    self notify( "stop_popup_donotetracks" );
    return 1;
}

_id_2D0A( var_0 )
{
    self endon( "killanimscript" );
    self endon( "stop_popup_donotetracks" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_8041( var_0 )
{
    if ( self.a._id_22AB == "left" || self.a._id_22AB == "right" )
        var_1 = "crouch";
    else
        var_1 = self.a._id_22AB;

    self _meth_8149( animscripts\utility::animarray( var_1 + "_aim" ), %body, 1, var_0 );

    if ( var_1 == "crouch" )
    {
        self _meth_814E( animscripts\utility::_id_5863( "cover_crouch", "add_aim_down" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_crouch", "add_aim_left" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_crouch", "add_aim_up" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_crouch", "add_aim_right" ), 1, 0 );
    }
    else if ( var_1 == "stand" )
    {
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_down" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_left" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_up" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_right" ), 1, 0 );
    }
    else if ( var_1 == "stand_tall" )
    {
        self _meth_814E( animscripts\utility::_id_5863( "old_default_stand", "add_aim_down" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "old_default_stand", "add_aim_left" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "old_default_stand", "add_aim_up" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "old_default_stand", "add_aim_right" ), 1, 0 );
    }
    else if ( var_1 == "lean" )
    {
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_down" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_left" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_up" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "default_stand", "add_aim_right" ), 1, 0 );
    }
    else if ( var_1 == "over" )
    {
        self _meth_814E( animscripts\utility::_id_5863( "cover_stand", "add_aim_down" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_stand", "add_aim_left" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_stand", "add_aim_up" ), 1, 0 );
        self _meth_814E( animscripts\utility::_id_5863( "cover_stand", "add_aim_right" ), 1, 0 );
    }
}

_id_4240()
{
    self notify( "return_to_cover" );
    self._id_1C86 = 1;
    self notify( "done_changing_cover_pos" );
    animscripts\combat_utility::_id_3156();
    var_0 = _id_6E44();

    if ( self.team == "allies" )
        wait(randomfloatrange( 0.0, 1.0 ));

    self setflaggedanimknoball( "go_to_hide", animscripts\utility::animarray( self.a._id_22AB + "_2_hide" ), %body, 1, 0.2, var_0 );
    self _meth_8144( %exposed_modern, 0.2 );
    animscripts\shared::_id_2D06( "go_to_hide" );
    self.a._id_22AB = "hide";

    if ( self._id_22CB == "stand" )
        self.a._id_8A1A = "cover_stand";
    else
        self.a._id_8A1A = "cover_crouch";

    self._id_1C86 = 0;
}

_id_98A6( var_0 )
{
    return _id_98A5( var_0, 1 );
}

_id_98A5( var_0, var_1 )
{
    if ( isdefined( self._id_2D34 ) || isdefined( var_0._id_2D2B ) )
        return 0;

    var_2 = undefined;

    if ( isdefined( self._id_7109 ) && randomfloat( 1.0 ) < self._id_7109 )
        var_2 = animscripts\utility::animarraypickrandom( "grenade_rambo" );
    else if ( isdefined( var_1 ) && var_1 )
        var_2 = animscripts\utility::animarraypickrandom( "grenade_safe" );
    else
        var_2 = animscripts\utility::animarraypickrandom( "grenade_exposed" );

    _id_7F4E();
    self.keepclaimednodeifvalid = 1;
    var_3 = animscripts\combat_utility::_id_989D( var_0, var_2 );
    self.keepclaimednodeifvalid = 0;
    return var_3;
}

blindfire()
{
    if ( !animscripts\utility::animarrayanyexist( "blind_fire" ) )
        return 0;

    _id_7F4E();
    self.keepclaimednodeifvalid = 1;
    self setflaggedanimknoballrestart( "blindfire", animscripts\utility::animarraypickrandom( "blind_fire" ), %body, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "blindfire" );
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_2449( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_4 = spawnturret( "misc_turret", var_0.origin, var_1 );
    var_4.angles = var_0.angles;
    var_4.aiowner = self;
    var_4 setmodel( var_2 );

    if ( var_3 )
        var_4 makeusable();

    var_4 _meth_815C( 0 );

    if ( isdefined( var_0.leftarc ) )
        var_4.leftarc = var_0.leftarc;

    if ( isdefined( var_0.rightarc ) )
        var_4.rightarc = var_0.rightarc;

    if ( isdefined( var_0.toparc ) )
        var_4.toparc = var_0.toparc;

    if ( isdefined( var_0.bottomarc ) )
        var_4.bottomarc = var_0.bottomarc;

    return var_4;
}

_id_2853( var_0 )
{
    self endon( "death" );
    self endon( "being_used" );
    wait 0.1;

    if ( isdefined( var_0 ) )
        var_0 notify( "turret_use_failed" );

    self delete();
}

_id_9C12( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = _id_2449( self.node._id_99B3, var_0, var_1, var_2 );

    if ( self _meth_818E( var_3 ) )
    {
        var_3 thread _id_2853( self );

        if ( isdefined( self._id_995C ) )
            thread [[ self._id_995C ]]( var_3 );

        self waittill( "turret_use_failed" );
    }
    else
        var_3 delete();
}

_id_9C15()
{
    var_0 = self.node._id_9940;

    if ( !var_0._id_519E )
        return;

    thread maps\_mg_penetration::_id_4476( var_0 );
    self waittill( "continue_cover_script" );
}

_id_80AA( var_0 )
{
    if ( animscripts\utility::_id_502C() )
    {
        self.a.array = animscripts\utility::_id_5864( "free_run_cover_crouch" );
        return;
    }

    self.a.array = animscripts\utility::_id_5864( "cover_crouch" );

    if ( animscripts\utility::_id_A2CF() )
    {
        if ( var_0 == "lean" || var_0 == "stand" )
            self.a.array["single"] = animscripts\utility::_id_5863( "shotgun_stand", "single" );
        else
            self.a.array["single"] = animscripts\utility::_id_5863( "shotgun_crouch", "single" );
    }

    if ( isdefined( anim._id_7108 ) )
    {
        self.a.array["rambo"] = anim._id_7108._id_229D;
        self.a.array["rambo_fail"] = anim._id_7108._id_229E;
        self.a.array["grenade_rambo"] = anim._id_7108._id_229F;
    }
}

_id_82B1( var_0 )
{
    self.a.array = animscripts\utility::_id_5864( "cover_stand" );

    if ( var_0 != "over" )
    {
        if ( var_0 == "stand_tall" && maps\_utility::_id_76FF() )
        {
            var_1 = animscripts\utility::_id_5864( "old_default_stand" );
            self.a.array["stand_tall_aim"] = var_1["straight_level"];
        }
        else
            var_1 = animscripts\utility::_id_5864( "default_stand" );

        self.a.array["add_aim_left"] = var_1["add_aim_left"];
        self.a.array["add_aim_right"] = var_1["add_aim_right"];
        self.a.array["add_aim_up"] = var_1["add_aim_up"];
        self.a.array["add_aim_down"] = var_1["add_aim_down"];
        self.a.array["stand_aim"] = var_1["straight_level"];
        self.a.array["fire"] = var_1["fire_corner"];
        self.a.array["semi2"] = var_1["semi2"];
        self.a.array["semi3"] = var_1["semi3"];
        self.a.array["semi4"] = var_1["semi4"];
        self.a.array["semi5"] = var_1["semi5"];

        if ( animscripts\utility::_id_A2CF() )
            self.a.array["single"] = animscripts\utility::_id_5863( "shotgun_stand", "single" );
        else
            self.a.array["single"] = var_1["single"];

        self.a.array["burst2"] = var_1["burst2"];
        self.a.array["burst3"] = var_1["burst3"];
        self.a.array["burst4"] = var_1["burst4"];
        self.a.array["burst5"] = var_1["burst5"];
        self.a.array["burst6"] = var_1["burst6"];
    }

    if ( isdefined( anim._id_7108 ) )
    {
        self.a.array["rambo"] = anim._id_7108._id_22C3;
        self.a.array["rambo_fail"] = anim._id_7108._id_22C4;
        self.a.array["grenade_rambo"] = anim._id_7108._id_22C5;
    }
}

_id_5884( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.1;

    var_1 = var_0;

    if ( self._id_22CB == "stand" && self _meth_8152( %exposed_aiming ) != 0.0 )
    {
        self _meth_8149( %exposed_stand_2_coverstand_hide, %body, 1, var_0 );
        var_1 = getanimlength( %exposed_stand_2_coverstand_hide );
    }
    else
        self _meth_814B( animscripts\utility::animarray( "hide_idle" ), %body, 1, var_0 );

    self.a._id_22AB = "hide";
    return var_1;
}

anglerangethread()
{
    self endon( "killanimscript" );
    self notify( "newAngleRangeCheck" );
    self endon( "newAngleRangeCheck" );
    self endon( "return_to_cover" );

    for (;;)
    {
        if ( _id_6086() )
            break;

        wait 0.1;
    }

    self notify( "stopShooting" );
}

_id_6086()
{
    if ( self._id_22CB != "crouch" )
        return 0;

    var_0 = _id_40C9( self geteye() );

    if ( self.a._id_22AB == "lean" )
        return var_0 < 10;
    else
        return var_0 > 45;
}

_id_3F14()
{
    var_0 = [];

    if ( self._id_22CB == "stand" )
    {
        if ( !self._id_22BA._id_58AE && ( isdefined( self.animarchetype ) && self.animarchetype == "s1_soldier" ) )
        {
            var_0 = self._id_22BA getvalidcoverpeekouts();
            var_0[var_0.size] = "stand_tall";
        }
        else
        {
            var_0 = self._id_22BA getvalidcoverpeekouts();

            if ( isdefined( self.animarchetype ) && self.animarchetype == "s1_soldier" )
                var_0[var_0.size] = "over";
            else
                var_0[var_0.size] = "stand";
        }
    }
    else
    {
        var_1 = _id_40C9( self._id_22BA.origin + animscripts\utility::_id_404D( self._id_22BA ) );

        if ( self.a.atconcealmentnode )
        {
            if ( var_1 > 30 )
                return "lean";

            if ( var_1 > 10 || !self._id_22BA._id_2482 )
                return "stand";
        }
        else
        {
            if ( var_1 > 20 )
                return "lean";

            if ( ( var_1 > 0 || !self._id_22BA._id_2482 ) && ( !isdefined( self.force_crouch ) || !self.force_crouch ) )
                return "stand";
        }

        var_0 = self._id_22BA getvalidcoverpeekouts();
        var_0[var_0.size] = "crouch";
    }

    var_2 = 0;

    while ( var_2 < var_0.size )
    {
        if ( !isdefined( self.a.array["hide_2_" + var_0[var_2]] ) )
        {
            var_0[var_2] = var_0[var_0.size - 1];
            var_0[var_0.size - 1] = undefined;
            continue;
        }

        var_2++;
    }

    return animscripts\combat_utility::_id_40A4( var_0 );
}

_id_40C9( var_0 )
{
    var_1 = animscripts\utility::_id_3F7D();
    return angleclamp180( vectortoangles( var_1 - var_0 )[0] );
}

_id_7F4E()
{
    if ( self.swimmer )
        self _meth_8192( "nogravity" );
    else
        self _meth_8192( "zonly_physics" );
}

_id_2299( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "run";

    self._id_35C7 = animscripts\face::_id_6D9B( var_0, var_1, self._id_35C7 );
}

_id_2291()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}
