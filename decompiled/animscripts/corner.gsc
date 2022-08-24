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

_id_2222( var_0, var_1 )
{
    self endon( "killanimscript" );
    self._id_0C50["exposed"]["stand"] = ::_id_7EC0;
    self._id_0C50["exposed"]["crouch"] = ::_id_7DFA;
    self._id_22BA = self.node;
    self._id_2225 = var_0;
    self.a._id_2227 = "unknown";
    self.a._id_0979 = undefined;
    animscripts\cover_behavior::_id_993F( var_1 );
    _id_7DF6();
    self._id_51A0 = 0;
    self._id_94C2 = 0;
    self._id_2223 = 0;
    animscripts\track::_id_7F21( 0 );
    self._id_475F = 0;
    var_2 = spawnstruct();

    if ( !self.fixednode )
        var_2._id_5F93 = animscripts\cover_behavior::_id_5F93;

    var_2._id_590A = ::_id_590A;
    var_2.reload = ::_id_2228;
    var_2._id_5667 = ::_id_8E29;
    var_2.look = ::_id_5860;
    var_2._id_367E = ::_id_367E;
    var_2._id_4B63 = ::_id_4B63;
    var_2.grenade = ::_id_98A5;
    var_2._id_4401 = ::_id_98A6;
    var_2._id_14AB = ::_id_14AB;
    animscripts\cover_behavior::main( var_2 );
}

_id_3143()
{
    self._id_8E2A = undefined;
    self.a._id_565E = undefined;
}

_id_7DF6()
{
    if ( self.a._id_6E5A == "crouch" )
        _id_7DBC( "crouch" );
    else if ( self.a._id_6E5A == "stand" )
        _id_7DBC( "stand" );
    else
    {
        animscripts\utility::_id_344B( 1 );
        self.a._id_6E5A = "crouch";
        _id_7DBC( "crouch" );
    }
}

_id_8488()
{
    if ( !isdefined( self.allowstancechangesforfun ) )
        return 0;

    if ( !isdefined( self.enemy ) )
        return 0;

    if ( !isdefined( self._id_1C82 ) )
        self._id_1C82 = gettime() + randomintrange( 5000, 20000 );

    if ( gettime() > self._id_1C82 )
    {
        self._id_1C82 = gettime() + randomintrange( 5000, 20000 );

        if ( isdefined( self._id_7109 ) && self.a._id_6E5A == "stand" )
            return 0;

        self.a._id_6F4D = undefined;
        return 1;
    }

    return 0;
}

_id_590A()
{
    var_0 = gettime();
    var_1 = "stand";

    if ( self.a._id_6E5A == "crouch" )
    {
        var_1 = "crouch";

        if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
        {
            if ( self.script == "cover_right" )
                var_1 = "crouch_r";
            else if ( self.script == "cover_left" )
                var_1 = "crouch_l";
        }

        if ( self._id_22BA doesnodeallowstance( "stand" ) )
        {
            if ( !self._id_22BA doesnodeallowstance( "crouch" ) || _id_8488() )
                var_1 = "stand";
        }
    }
    else if ( self._id_22BA doesnodeallowstance( "crouch" ) )
    {
        if ( !self._id_22BA doesnodeallowstance( "stand" ) || _id_8488() )
        {
            var_1 = "crouch";

            if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
            {
                if ( self.script == "cover_right" )
                    var_1 = "crouch_r";
                else if ( self.script == "cover_left" )
                    var_1 = "crouch_l";
            }
        }
    }

    if ( self._id_475F )
    {
        if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
        {
            if ( var_1 == "crouch_l" || var_1 == "crouch_r" )
                var_1 = "crouch";
        }

        _id_9720( var_1 );
    }
    else
    {
        var_2 = undefined;

        if ( self.a._id_6E5A == var_1 )
        {
            var_3 = 0.4;

            if ( isdefined( self.cover ) && isdefined( self.cover._id_4880 ) && self.cover._id_4880 == "back" )
                var_4 = animscripts\utility::_id_0C4E( "alert_idle_back" );
            else if ( var_1 == "crouch" && shouldplayalerttransition( self ) )
            {
                var_4 = animscripts\utility::_id_0C4E( "AW_to_MW_alert_trans" );
                var_3 = getanimlength( var_4 );
            }
            else if ( var_1 == "stand" && shouldplayalerttransition( self ) )
            {
                var_4 = animscripts\utility::_id_0C4E( "exposed_2_alert" );
                var_3 = getanimlength( var_4 );
            }
            else
                var_4 = animscripts\utility::_id_0C4E( "alert_idle" );

            _id_4281( var_4, 0.3, var_3 );
        }
        else
        {
            if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
            {
                if ( var_1 == "crouch_l" )
                {
                    var_2 = animscripts\utility::_id_5863( "combat", "trans_to_crouch_l" );
                    var_1 = "crouch";
                }
                else if ( var_1 == "crouch_r" )
                {
                    var_2 = animscripts\utility::_id_5863( "combat", "trans_to_crouch_r" );
                    var_1 = "crouch";
                }
            }

            if ( !isdefined( var_2 ) )
                var_2 = animscripts\utility::_id_0C4E( "stance_change" );

            _id_4281( var_2, 0.3, getanimlength( var_2 ) );
            _id_7DBC( var_1 );
        }

        self._id_475F = 1;
    }

    return gettime() - var_0 > 0;
}
#using_animtree("generic_human");

hasonekneeup()
{
    var_0 = [ %cornercrr_alert_painc, %cornercrr_alert_paina, %cornercrl_painb, %exposed_crouch_pain_headsnap, %exposed_crouch_pain_flinch, %exposed_crouch_pain_chest, %exposed_crouch_pain_left_arm, %exposed_crouch_pain_right_arm, %exposed_stand_2_crouch, %cornercrl_lean_2_alert, %run_2_crouch_f, %run_2_crouch_90l, %run_2_crouch_90r, %run_2_crouch_180l, %run_2_crouch_idle_1, %run_2_crouch_idle_3, %run_2_crouch_idle_7, %run_2_crouch_idle_9, %cornercrr_lean_2_alert, %cornercrl_reloada, %cornercrr_reload, %cornercrl_cqb_trans_in_1, %cornercrl_cqb_trans_in_2, %cornercrl_cqb_trans_in_3, %cornercrl_cqb_trans_in_4, %cornercrl_cqb_trans_in_6, %cornercrl_cqb_trans_in_7, %cornercrl_cqb_trans_in_8, %grenade_return_cornercrl_1knee_throw, %grenade_return_cornercrr_1knee_throw ];

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_8152( var_2 ) != 0.0 )
            return 1;
    }

    return 0;
}

shouldplayalerttransition( var_0 )
{
    if ( !animscripts\utility::using_improved_transitions() )
        return 0;

    var_1 = [ %cornercrl_trans_a_2_alert, %cornercrr_trans_a_2_alert, %cornercrl_trans_b_2_alert, %cornercrr_trans_b_2_alert, %cornercrouchr_crouchidle_2_alert, %cornercrouchl_crouchidle_2_alert, %h1_cornercrr_alert_paina_2, %h1_cornercrr_alert_painb_2, %h1_cornercrr_alert_painc_2, %h1_cornercrl_painb_2, %h1_cornercrl_trans_2_2knees, %h1_cornercrouch_trans_2_2knee, %h1_cornercrr_alert_paina_2, %h1_cornercrr_alert_painb_2, %h1_cornercrr_alert_painc_2, %cornercrr_reloada, %cornercrr_reloadb, %cornercrl_reloadb ];
    var_2 = [ %walk_backward, %walk_left, %walk_right, %walk_forward ];

    foreach ( var_4 in var_1 )
    {
        if ( var_0 _meth_8152( var_4 ) != 0.0 )
            return 0;
    }

    if ( var_0 hasonekneeup() )
        return 1;

    if ( var_0 _meth_8152( %exposed_modern ) != 0.0 && var_0 _meth_8152( %exposed_aiming ) != 0.0 )
        return 1;

    foreach ( var_7 in var_2 )
    {
        if ( var_0 _meth_8152( var_7 ) != 0.0 )
            return 1;
    }

    return 0;
}

_id_6FBA()
{
    wait 2;

    for (;;)
    {
        _id_6FBB();
        wait 0.05;
    }
}

_id_1AE4( var_0, var_1 )
{
    var_2 = var_1 animscripts\utility::_id_4176( var_0 );

    if ( var_2 > 60 || var_2 < -60 )
        return 0;

    if ( animscripts\utility::_id_515B( var_1 ) && var_2 > 14 )
        return 0;

    if ( animscripts\utility::_id_515E( var_1 ) && var_2 < -12 )
        return 0;

    return 1;
}

_id_8410()
{
    if ( !isdefined( self._id_840F ) )
        return 0;

    var_0 = self._id_22BA animscripts\utility::_id_4176( self._id_840F );

    if ( self.a._id_2227 == "over" )
        return var_0 < self.leftaimlimit || self.rightaimlimit < var_0;

    if ( self._id_2225 == "up" )
        return var_0 < -50 || var_0 > 50;
    else if ( self._id_2225 == "left" )
    {
        if ( self.a._id_2227 == "B" )
            return var_0 < 0 - self._id_06B4 || var_0 > 14;
        else if ( self.a._id_2227 == "A" )
            return var_0 > 0 - self._id_06B4;
        else
            return var_0 < -50 || var_0 > 8;
    }
    else if ( self.a._id_2227 == "B" )
        return var_0 > self._id_06B4 || var_0 < -12;
    else if ( self.a._id_2227 == "A" )
        return var_0 < self._id_06B4;
    else
        return var_0 > 50 || var_0 < -8;
}

_id_3F3D( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    if ( isdefined( var_1 ) )
        var_3 = var_0 animscripts\utility::_id_4176( var_1 );

    var_4 = [];

    if ( isdefined( var_0 ) && self.a._id_6E5A == "crouch" && ( var_3 > self.leftaimlimit && self.rightaimlimit > var_3 ) )
        var_4 = var_0 getvalidcoverpeekouts();

    if ( self._id_2225 == "up" )
    {
        if ( animscripts\utility::_id_51B0() )
        {
            var_5 = 0;

            if ( isdefined( var_1 ) )
            {
                var_6 = anglestoup( self.angles );
                var_5 = animscripts\combat_utility::_id_4083( var_1, self geteye() + ( var_6[0] * 12, var_6[1] * 12, var_6[2] * 12 ) );
            }

            if ( _id_1ACD( var_5, -5, 80 ) )
            {
                var_2 = _id_849E();
                var_4[var_4.size] = "lean";
                var_4[var_4.size] = "lean";
            }

            if ( !var_2 )
                var_4[var_4.size] = "A";
        }
        else
            var_4[var_4.size] = "A";
    }
    else if ( self._id_2225 == "left" )
    {
        if ( _id_1ACD( var_3, -40, 0 ) )
        {
            var_2 = _id_849E();

            if ( var_2 )
                var_4[var_4.size] = "lean";
        }

        if ( !var_2 && var_3 < 14 )
        {
            if ( var_3 < 0 - self._id_06B4 )
                var_4[var_4.size] = "A";
            else
                var_4[var_4.size] = "B";
        }
    }
    else
    {
        if ( _id_1ACD( var_3, 0, 40 ) )
        {
            var_2 = _id_849E();

            if ( var_2 )
                var_4[var_4.size] = "lean";
        }

        if ( !var_2 && var_3 > -12 )
        {
            if ( var_3 > self._id_06B4 )
                var_4[var_4.size] = "A";
            else
                var_4[var_4.size] = "B";
        }
    }

    return animscripts\combat_utility::_id_40A4( var_4 );
}

_id_3F18()
{
    var_0 = 0;

    if ( animscripts\utility::_id_1AEF() )
        var_0 = self._id_22BA animscripts\utility::_id_4176( animscripts\utility::_id_3F7E() );
    else if ( self.doingambush && isdefined( self._id_840F ) )
        var_0 = self._id_22BA animscripts\utility::_id_4176( self._id_840F );

    if ( self.a._id_2227 == "lean" )
        return "lean";

    if ( self.a._id_2227 == "over" )
        return "over";
    else if ( self.a._id_2227 == "B" )
    {
        if ( self._id_2225 == "left" )
        {
            if ( var_0 < 0 - self._id_06B4 )
                return "A";
        }
        else if ( self._id_2225 == "right" )
        {
            if ( var_0 > self._id_06B4 )
                return "A";
        }

        return "B";
    }
    else if ( self.a._id_2227 == "A" )
    {
        if ( self._id_2225 == "up" )
            return "A";
        else if ( self._id_2225 == "left" )
        {
            if ( var_0 > 0 - self._id_06B4 )
                return "B";
        }
        else if ( self._id_2225 == "right" )
        {
            if ( var_0 < self._id_06B4 )
                return "B";
        }

        return "A";
    }
}

_id_1C83()
{
    self endon( "killanimscript" );
    var_0 = _id_3F18();

    if ( var_0 == self.a._id_2227 )
        return 0;

    self._id_1C86 = 1;
    self notify( "done_changing_cover_pos" );
    var_1 = self.a._id_2227 + "_to_" + var_0;
    var_2 = animscripts\utility::_id_0C51( var_1 );

    if ( animscripts\utility::_id_51B0() && ( var_1 == "A_to_B" || var_1 == "B_to_A" ) )
        return 0;

    var_3 = !self.swimmer;
    var_4 = _id_4097();

    if ( !self _meth_81c7( var_4, var_3 ) )
        return 0;

    if ( !self _meth_81c8( var_4, animscripts\utility::_id_3EFC( var_2 ), var_3 ) )
        return 0;

    animscripts\combat_utility::_id_3156();
    _id_8EDD( 0.3 );
    var_5 = self.a._id_6E5A;
    self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 0, 0.2 );
    self _meth_8154( "changeStepOutPos", var_2, 1, 0.2, 1.2 );
    _id_2221( var_2 );
    thread _id_2D13( "changeStepOutPos" );
    var_6 = animhasnotetrack( var_2, "start_aim" );

    if ( var_6 )
        self waittillmatch( "changeStepOutPos", "start_aim" );
    else
        self waittillmatch( "changeStepOutPos", "end" );

    thread _id_8CFC( undefined, 0, 0.3 );

    if ( var_6 )
        self waittillmatch( "changeStepOutPos", "end" );

    self _meth_8144( var_2, 0.1 );
    self.a._id_2227 = var_0;
    self._id_1C86 = 0;
    self._id_22BC = gettime();

    if ( self.a._id_6E5A != var_5 )
        _id_7DBC( self.a._id_6E5A );

    thread _id_1C7D( undefined, 1, 0.3 );
    return 1;
}

_id_1ACD( var_0, var_1, var_2 )
{
    if ( self.a._id_6096 )
        return 0;

    return var_1 <= var_0 && var_0 <= var_2;
}

_id_849E()
{
    if ( !animscripts\utility::using_improved_transitions() && self.a._id_6E5A != "stand" )
        return 0;

    if ( self.team == "allies" )
        return 1;

    if ( animscripts\utility::_id_516E() )
        return 1;

    return 0;
}

_id_2D13( var_0 )
{
    self endon( "killanimscript" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_8CFC( var_0, var_1, var_2 )
{
    self._id_2223 = 1;

    if ( self.a._id_2227 == "lean" )
        self.a._id_565E = 1;
    else
        self.a._id_565E = undefined;

    _id_7F18( var_0, var_1, var_2 );
}

_id_1C7D( var_0, var_1, var_2 )
{
    if ( self.a._id_2227 == "lean" )
        self.a._id_565E = 1;
    else
        self.a._id_565E = undefined;

    _id_7F18( var_0, var_1, var_2 );
}

_id_8EDD( var_0 )
{
    self._id_2223 = 0;
    self _meth_8144( %add_fire, var_0 );
    animscripts\track::_id_7F21( 0, var_0 );
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}

_id_7F18( var_0, var_1, var_2 )
{
    self._id_8A7D = var_0;
    self _meth_814e( %exposed_modern, 1, var_2 );
    self _meth_814e( %exposed_aiming, 1, var_2 );
    self _meth_814e( %add_idle, 1, var_2 );
    animscripts\track::_id_7F21( 1, var_2 );
    _id_2220( undefined );
    var_3 = undefined;

    if ( isdefined( self.a._id_0CD8["lean_aim_straight"] ) )
        var_3 = self.a._id_0CD8["lean_aim_straight"];

    thread animscripts\combat_utility::_id_0979();

    if ( isdefined( self.a._id_565E ) )
    {
        self _meth_814e( var_3, 1, var_2 );
        self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 0, 0 );
        self _meth_8146( animscripts\utility::_id_0C4E( "lean_aim_left" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "lean_aim_right" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "lean_aim_up" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "lean_aim_down" ), 1, var_2 );
    }
    else if ( var_1 )
    {
        self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 1, var_2 );

        if ( isdefined( var_3 ) )
            self _meth_814e( var_3, 0, 0 );

        self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_up" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_down" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_left" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_right" ), 1, var_2 );
    }
    else
    {
        self _meth_814e( animscripts\utility::_id_0C4E( "straight_level" ), 0, var_2 );

        if ( isdefined( var_3 ) )
            self _meth_814e( var_3, 0, 0 );

        self _meth_8146( animscripts\utility::_id_0C4E( "add_turn_aim_up" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_turn_aim_down" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_turn_aim_left" ), 1, var_2 );
        self _meth_8146( animscripts\utility::_id_0C4E( "add_turn_aim_right" ), 1, var_2 );
    }
}

_id_8E28()
{
    if ( self.a._id_2227 == "over" )
        return 1;

    return animscripts\combat_utility::_id_711F();
}

_id_8E27()
{
    self.a._id_2227 = "alert";

    if ( isdefined( self.disablestepout ) && self.disablestepout )
        return 0;

    _id_7F48();

    if ( self.a._id_6E5A == "stand" )
        self._id_06B4 = 38;
    else
        self._id_06B4 = 31;

    var_0 = self.a._id_6E5A;
    _id_7DBC( var_0 );
    animscripts\combat::_id_7E08();
    var_1 = "none";

    if ( animscripts\utility::_id_472C() )
        var_1 = _id_3F3D( self._id_22BA, animscripts\utility::_id_3F7E() );
    else
        var_1 = _id_3F3D( self._id_22BA );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = "alert_to_" + var_1;

    if ( !animscripts\utility::_id_0C4F( var_2 ) )
        return 0;

    var_3 = animscripts\utility::_id_0C51( var_2 );

    if ( var_1 == "lean" && !_id_5171() )
        return 0;

    if ( var_1 != "over" && !_id_516F( var_3, var_1 != "lean" ) )
        return 0;

    self.a._id_2227 = var_1;
    self.a._id_6F4D = var_1;

    if ( self.a._id_2227 == "lean" )
        animscripts\combat::_id_7E08( self._id_22BA );

    if ( var_1 == "A" || var_1 == "B" )
        self.a._id_8A1A = "cover_" + self._id_2225 + "_" + self.a._id_6E5A + "_" + var_1;
    else if ( var_1 == "over" )
        self.a._id_8A1A = "cover_crouch_aim";
    else
        self.a._id_8A1A = "none";

    self.keepclaimednodeifvalid = 1;
    var_4 = 0;
    self._id_1C86 = 1;
    self notify( "done_changing_cover_pos" );
    var_5 = _id_8E28();
    self.pushable = 0;
    self setflaggedanimknoballrestart( "stepout", var_3, %animscript_root, 1, 0.2, var_5 );
    _id_2221( var_3 );
    thread _id_2D13( "stepout" );
    var_4 = animhasnotetrack( var_3, "start_aim" );

    if ( var_4 )
    {
        self._id_8E2A = self.angles[1] + getangledelta( var_3, 0, 1 );
        self waittillmatch( "stepout", "start_aim" );
    }
    else
        self waittillmatch( "stepout", "end" );

    if ( var_1 == "B" && common_scripts\utility::_id_2006() && self._id_2225 == "right" )
        self.a._id_8A1A = "corner_right_martyrdom";

    _id_7DBD( var_0 );
    var_6 = var_1 == "over" || animscripts\utility::_id_51B0();
    _id_8CFC( undefined, var_6, 0.3 );
    thread animscripts\track::_id_9512();

    if ( var_4 )
    {
        self waittillmatch( "stepout", "end" );
        self._id_8E2A = undefined;
    }

    _id_1C7D( undefined, 1, 0.2 );
    self _meth_8144( %cover, 0.1 );
    self _meth_8144( %corner, 0.1 );
    self._id_1C86 = 0;
    self._id_22BC = gettime();
    self.pushable = 1;
    return 1;
}

_id_8E29()
{
    self.keepclaimednodeifvalid = 1;

    if ( isdefined( self._id_7109 ) && randomfloat( 1 ) < self._id_7109 )
    {
        if ( _id_7104() )
            return 1;
    }

    if ( !_id_8E27() )
        return 0;

    _id_83EA();

    if ( isdefined( self._id_840F ) )
    {
        var_0 = lengthsquared( self.origin - self._id_840F );

        if ( animscripts\utility::_id_9C36() && animscripts\utility::_id_8495( var_0 ) )
        {
            if ( self.a._id_6E5A == "stand" )
                animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_stand" ) );
            else
                animscripts\shared::_id_933A( animscripts\utility::_id_5863( "combat", "drop_rpg_crouch" ) );

            thread _id_76C9();
            return;
        }
    }

    _id_74E1();
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_4761( var_0 )
{
    if ( !isdefined( self._id_55D1 ) )
        return 1;

    return gettime() - self._id_55D1 > var_0 * 1000;
}

_id_7104()
{
    if ( !animscripts\utility::_id_472C() )
        return 0;

    var_0 = 0;
    var_1 = 90;
    var_2 = self._id_22BA animscripts\utility::_id_4176( animscripts\utility::_id_3F7E() );

    if ( self._id_2225 == "left" )
        var_2 = 0 - var_2;

    if ( var_2 > 30 )
    {
        var_1 = 45;

        if ( self._id_2225 == "left" )
            var_0 = 45;
        else
            var_0 = -45;
    }

    var_3 = "rambo" + var_1;

    if ( !animscripts\utility::_id_0C4F( var_3 ) )
        return 0;

    var_4 = animscripts\utility::_id_0C51( var_3 );
    var_5 = _id_4097( 48 );

    if ( !self _meth_81c7( var_5, !self.swimmer ) )
        return 0;

    self._id_22BC = gettime();
    _id_7F48();
    self.keepclaimednodeifvalid = 1;
    self._id_5187 = 1;
    self.a._id_6F4D = "rambo";
    self._id_1C86 = 1;
    thread animscripts\shared::_id_7106( var_0 );
    self setflaggedanimknoballrestart( "rambo", var_4, %body, 1, 0, 1 );
    _id_2221( var_4 );
    animscripts\shared::_id_2D06( "rambo" );
    self notify( "rambo_aim_end" );
    self._id_1C86 = 0;
    self.keepclaimednodeifvalid = 0;
    self._id_55D1 = gettime();
    self._id_1C86 = 0;
    self._id_5187 = undefined;
    return 1;
}

_id_83EA()
{
    maps\_gameskill::_id_2A4D();

    for (;;)
    {
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

            if ( !self._id_18B0 )
                break;

            if ( _id_8410() )
            {
                if ( !_id_1C83() )
                {
                    if ( _id_3F18() == self.a._id_2227 )
                        break;

                    _id_841A( 0.2 );
                    continue;
                }

                if ( _id_8410() )
                    break;
            }
            else
            {
                _id_8418( 1 );
                self _meth_8144( %add_fire, 0.2 );
            }
        }

        if ( _id_1ADB( self.a._id_2227 != "lean" ) )
            break;

        if ( _id_8410() && _id_1C83() )
            continue;

        _id_841A( 0.2 );
    }
}

_id_841A( var_0 )
{
    thread _id_6236( var_0 );
    var_1 = gettime();
    _id_8418( 0 );
    self notify( "stopNotifyStopShootingAfterTime" );
    var_2 = ( gettime() - var_1 ) / 1000;

    if ( var_2 < var_0 )
        wait(var_0 - var_2);
}

_id_6236( var_0 )
{
    self endon( "killanimscript" );
    self endon( "stopNotifyStopShootingAfterTime" );
    wait(var_0);
    self notify( "stopShooting" );
}

_id_8418( var_0 )
{
    self endon( "return_to_cover" );

    if ( var_0 )
        thread _id_0B99();

    thread animscripts\combat_utility::_id_0979();
    animscripts\combat_utility::_id_8417();
}

_id_0B99()
{
    self endon( "killanimscript" );
    self notify( "newAngleRangeCheck" );
    self endon( "newAngleRangeCheck" );
    self endon( "take_cover_at_corner" );

    for (;;)
    {
        if ( _id_8410() )
            break;

        wait 0.1;
    }

    self notify( "stopShooting" );
}

_id_852E()
{
    self.enemy endon( "death" );
    self endon( "enemy" );
    self endon( "stopshowstate" );

    for (;;)
        wait 0.05;
}

_id_1ADB( var_0 )
{
    var_1 = !self.swimmer;

    if ( var_0 )
    {
        var_2 = _id_4097();

        if ( !self _meth_81c7( var_2, var_1 ) )
            return 0;

        return self _meth_81c8( var_2, self._id_22BA.origin, var_1 );
    }
    else
        return self _meth_81c7( self._id_22BA.origin, var_1 );
}

_id_74E1()
{
    animscripts\combat_utility::_id_315E();
    var_0 = animscripts\utility::_id_51C3();
    self notify( "take_cover_at_corner" );
    self._id_1C86 = 1;
    self notify( "done_changing_cover_pos" );
    var_1 = self.a._id_2227 + "_to_alert";
    var_2 = animscripts\utility::_id_0C51( var_1 );
    _id_8EDD( 0.3 );
    var_3 = 0;

    if ( self.a._id_2227 != "lean" && var_0 && animscripts\utility::_id_0C4F( var_1 + "_reload" ) && randomfloat( 100 ) < 75 )
    {
        var_2 = animscripts\utility::_id_0C51( var_1 + "_reload" );
        var_3 = 1;
    }

    var_4 = _id_8E28();

    if ( animscripts\utility::_id_51B0() )
        self _meth_8144( %exposed_modern, 0.2 );
    else
        self _meth_8144( %body, 0.1 );

    self setflaggedanimrestart( "hide", var_2, 1, 0.1, var_4 );
    _id_2221( var_2 );
    animscripts\shared::_id_2D06( "hide" );

    if ( var_3 )
        animscripts\weaponlist::_id_72B1();

    self._id_1C86 = 0;

    if ( self._id_2225 == "up" )
        self.a._id_8A1A = "cover_up";
    else if ( self._id_2225 == "left" )
        self.a._id_8A1A = "cover_left";
    else
        self.a._id_8A1A = "cover_right";

    self.keepclaimednodeifvalid = 0;
    self _meth_8144( var_2, 0.2 );
}

_id_14AB()
{
    if ( !animscripts\utility::_id_0C4F( "blind_fire" ) )
        return 0;

    behaviorstransitiontocorrectpose();
    _id_7F48();
    self.keepclaimednodeifvalid = 1;
    var_0 = animscripts\utility::_id_0C51( "blind_fire" );
    self setflaggedanimknoballrestart( "blindfire", var_0, %body, 1, 0, 1 );
    _id_2221( var_0 );
    animscripts\shared::_id_2D06( "blindfire" );
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_5776( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 1.0, 1.0, 1.0 );

    for ( var_3 = 0; var_3 < 100; var_3++ )
        wait 0.05;
}

_id_98A6( var_0 )
{
    if ( self.a._id_6E5A == "crouch" && shouldplayalerttransition( self ) )
        return 0;

    return _id_98A5( var_0, 1 );
}

_id_98A5( var_0, var_1 )
{
    if ( !self _meth_81c7( _id_4097() ) )
        return 0;

    if ( isdefined( self._id_2D34 ) || isdefined( var_0._id_2D2B ) )
        return 0;

    if ( self.a._id_6E5A == "crouch" && shouldplayalerttransition( self ) )
        return 0;

    var_2 = undefined;

    if ( isdefined( self._id_7109 ) && randomfloat( 1 ) < self._id_7109 )
    {
        if ( isdefined( self.a._id_0CD8["grenade_rambo"] ) )
            var_2 = animscripts\utility::_id_0C4E( "grenade_rambo" );
    }

    if ( !isdefined( var_2 ) )
    {
        if ( isdefined( var_1 ) && var_1 )
        {
            if ( !isdefined( self.a._id_0CD8["grenade_safe"] ) )
                return 0;

            var_2 = animscripts\utility::_id_0C4E( "grenade_safe" );
        }
        else
        {
            if ( !isdefined( self.a._id_0CD8["grenade_exposed"] ) )
                return 0;

            var_2 = animscripts\utility::_id_0C4E( "grenade_exposed" );
        }
    }

    _id_7F48();
    self.keepclaimednodeifvalid = 1;
    var_3 = animscripts\combat_utility::_id_989D( var_0, var_2 );
    self.keepclaimednodeifvalid = 0;
    return var_3;
}

_id_6FBB()
{

}

_id_5860( var_0 )
{
    if ( !isdefined( self.a._id_0CD8["alert_to_look"] ) )
        return 0;

    _id_7F48();
    self.keepclaimednodeifvalid = 1;

    if ( !_id_67B9() )
        return 0;

    behaviorstransitiontocorrectpose();
    animscripts\shared::_id_6DC1( animscripts\utility::_id_0C4E( "look_idle" ), var_0, ::_id_1AEE );
    var_1 = undefined;

    if ( animscripts\utility::_id_51C3() )
        var_1 = animscripts\utility::_id_0C4E( "look_to_alert_fast" );
    else
        var_1 = animscripts\utility::_id_0C4E( "look_to_alert" );

    self setflaggedanimknoballrestart( "looking_end", var_1, %body, 1, 0.1, 1.0 );
    _id_2221( var_1 );
    animscripts\shared::_id_2D06( "looking_end" );
    _id_7F48();
    self.keepclaimednodeifvalid = 0;
    return 1;
}

_id_5171()
{
    var_0 = self._id_22BA.angles;

    if ( animscripts\utility::_id_51B0() )
        var_0 = animscripts\utility::_id_413B( self._id_22BA );

    var_1 = self geteye();
    var_2 = anglestoright( var_0 );
    var_3 = anglestoup( var_0 );

    if ( self._id_2225 == "right" )
        var_1 += var_2 * 30;
    else if ( self._id_2225 == "left" )
        var_1 -= var_2 * 30;
    else
        var_1 += var_3 * 30;

    if ( self.team == "allies" && level.player maps\_utility::_id_50A9() )
    {
        if ( maps\_utility::_id_6B91( var_1, 0.95, undefined, level.player ) )
            return 0;
    }

    var_4 = var_1 + anglestoforward( var_0 ) * 30;
    return sighttracepassed( var_1, var_4, 1, self );
}

_id_67B9()
{
    if ( isdefined( self._id_22BA._id_79A9 ) )
        return 0;

    if ( isdefined( self._id_60D9 ) && gettime() < self._id_60D9 )
        return 0;

    if ( !_id_5171() )
    {
        self._id_60D9 = gettime() + 3000;
        return 0;
    }

    var_0 = animscripts\utility::_id_0C4E( "alert_to_look" );
    self setflaggedanimknoball( "looking_start", var_0, %body, 1, 0.2, 1 );
    _id_2221( var_0 );
    animscripts\shared::_id_2D06( "looking_start" );
    return 1;
}

_id_1AEE()
{
    return self _meth_81c7( self._id_22BA.origin, !self.swimmer );
}

_id_367E()
{
    return 0;
}

_id_2228()
{
    if ( self.a._id_6E5A == "crouch" && shouldplayalerttransition( self ) )
    {
        animscripts\weaponlist::_id_72B1();
        return 0;
    }

    var_0 = "reload";

    if ( animscripts\utility::_id_51A3( self.weapon ) && animscripts\utility::_id_0C4F( "shotgun_reload" ) )
        var_0 = "shotgun_reload";

    var_1 = animscripts\utility::_id_0C51( var_0 );
    self setflaggedanimknobrestart( "cornerReload", var_1, 1, 0.2 );
    _id_2221( var_1 );
    animscripts\shared::_id_2D06( "cornerReload" );
    self notify( "abort_reload" );
    animscripts\weaponlist::_id_72B1();
    self _meth_814f( animscripts\utility::_id_0C4E( "alert_idle" ), 1, 0.2 );
    self _meth_8144( var_1, 0.2 );
    return 1;
}

_id_516F( var_0, var_1 )
{
    var_2 = !self.swimmer;

    if ( var_1 )
    {
        var_3 = _id_4097();

        if ( !self _meth_81c7( var_3, var_2 ) )
            return 0;

        if ( self.swimmer )
            return 1;

        return self _meth_81c8( var_3, animscripts\utility::_id_3EFC( var_0 ), var_2 );
    }
    else
    {
        if ( self.swimmer )
            return 1;

        return self _meth_81c7( animscripts\utility::_id_3EFC( var_0 ), var_2 );
    }
}

_id_4097( var_0 )
{
    var_1 = self._id_22BA.angles;
    var_2 = anglestoright( var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 36;

    var_3 = self.script;

    if ( var_3 == "cover_multi" )
    {
        if ( self.cover._id_8D56 == "right" )
            var_3 = "cover_right";
        else if ( self.cover._id_8D56 == "left" )
            var_3 = "cover_left";
    }

    if ( var_3 == "cover_swim_up" )
    {
        var_4 = anglestoup( var_1 );
        return self._id_22BA.origin + var_4 * var_0;
    }

    switch ( var_3 )
    {
        case "cover_left":
        case "cover_swim_left":
            var_2 *= ( 0 - var_0 );
            break;
        case "cover_right":
        case "cover_swim_right":
            var_2 *= var_0;
            break;
        default:
    }

    return self._id_22BA.origin + ( var_2[0], var_2[1], 0 );
}

behaviorstransitiontocorrectpose()
{
    if ( self.a._id_6E5A == "crouch" && shouldplayalerttransition( self ) )
    {
        var_0 = animscripts\utility::_id_0C4E( "1knee_2_2knees" );
        var_1 = getanimlength( var_0 );
        _id_4281( var_0, 0.3, var_1 );
    }
}

_id_4B63()
{
    self endon( "end_idle" );

    for (;;)
    {
        behaviorstransitiontocorrectpose();
        var_0 = randomint( 2 ) == 0 && isdefined( self.a._id_0CD8["alert_idle_twitch"] ) && animscripts\utility::_id_0C4F( "alert_idle_twitch" );

        if ( var_0 )
            var_1 = animscripts\utility::_id_0C51( "alert_idle_twitch" );
        else
            var_1 = animscripts\utility::_id_0C4E( "alert_idle" );

        _id_6DAC( var_1, var_0 );
    }
}

_id_38DF()
{
    if ( !animscripts\utility::_id_0C4F( "alert_idle_flinch" ) )
        return 0;

    _id_6DAC( animscripts\utility::_id_0C51( "alert_idle_flinch" ), 1 );
    return 1;
}

_id_6DAC( var_0, var_1 )
{
    if ( var_1 )
        self setflaggedanimknoballrestart( "idle", var_0, %body, 1, 0.1, 1 );
    else
        self setflaggedanimknoball( "idle", var_0, %body, 1, 0.1, 1 );

    _id_2221( var_0 );
    animscripts\shared::_id_2D06( "idle" );
}

_id_7DBC( var_0 )
{
    [[ self._id_0C50["hiding"][var_0] ]]();
    [[ self._id_0C50["exposed"][var_0] ]]();
}

_id_7DBD( var_0 )
{
    [[ self._id_0C50["exposed"][var_0] ]]();
}

_id_9720( var_0 )
{
    if ( self.a._id_6E5A == var_0 )
    {
        _id_7DBC( var_0 );
        return;
    }

    var_1 = animscripts\utility::_id_0C4E( "stance_change" );
    self setflaggedanimknoballrestart( "changeStance", var_1, %body );
    _id_2221( var_1 );
    _id_7DBC( var_0 );
    animscripts\shared::_id_2D06( "changeStance" );
    wait 0.2;
}

_id_4281( var_0, var_1, var_2 )
{
    var_3 = animscripts\utility::_id_4048();
    var_4 = animscripts\utility::_id_3F2F();
    var_5 = var_3 + self._id_4884;

    if ( animscripts\utility::_id_51B0() )
        self notify( "force_space_rotation_update", 0, 0 );
    else
        self _meth_8193( "face angle", var_5 );

    self _meth_8192( "normal" );

    if ( isdefined( var_4 ) )
        thread animscripts\shared::_id_5F94( var_4, var_1 );

    self setflaggedanimknoballrestart( "coveranim", var_0, %body, 1, var_1 );
    _id_2221( var_0 );
    animscripts\notetracks::_id_2D0B( var_2, "coveranim" );

    while ( animscripts\utility::_id_06C4( self.angles[1] - var_5 ) > 1 )
    {
        animscripts\notetracks::_id_2D0B( 0.1, "coveranim" );
        var_3 = animscripts\utility::_id_4048();
        var_5 = var_3 + self._id_4884;
    }

    _id_7F48();

    if ( self._id_2225 == "left" )
        self.a._id_8A1A = "cover_left";
    else if ( self._id_2225 == "right" )
        self.a._id_8A1A = "cover_right";
    else
        self.a._id_8A1A = "cover_up";
}

_id_2DDD()
{
    self endon( "killanimscript" );

    for (;;)
        wait 0.05;
}

_id_7EC0()
{
    if ( self.swimmer && isdefined( self.node ) )
    {
        _id_7ECC();
        return;
    }

    if ( !isdefined( self.a._id_0CD8 ) )
    {

    }

    var_0 = animscripts\utility::_id_5864( "default_stand" );
    self.a._id_0CD8["add_aim_up"] = var_0["add_aim_up"];
    self.a._id_0CD8["add_aim_down"] = var_0["add_aim_down"];
    self.a._id_0CD8["add_aim_left"] = var_0["add_aim_left"];
    self.a._id_0CD8["add_aim_right"] = var_0["add_aim_right"];
    self.a._id_0CD8["add_turn_aim_up"] = var_0["add_turn_aim_up"];
    self.a._id_0CD8["add_turn_aim_down"] = var_0["add_turn_aim_down"];
    self.a._id_0CD8["add_turn_aim_left"] = var_0["add_turn_aim_left"];
    self.a._id_0CD8["add_turn_aim_right"] = var_0["add_turn_aim_right"];
    self.a._id_0CD8["straight_level"] = var_0["straight_level"];

    if ( self.a._id_2227 == "lean" )
    {
        var_1 = self.a._id_0CD8["lean_fire"];
        var_2 = self.a._id_0CD8["lean_single"];
        self.a._id_0CD8["fire"] = var_1;
        self.a._id_0CD8["single"] = animscripts\utility::_id_0CD8( var_2 );
        self.a._id_0CD8["semi2"] = var_2;
        self.a._id_0CD8["semi3"] = var_2;
        self.a._id_0CD8["semi4"] = var_2;
        self.a._id_0CD8["semi5"] = var_2;
        self.a._id_0CD8["burst2"] = var_1;
        self.a._id_0CD8["burst3"] = var_1;
        self.a._id_0CD8["burst4"] = var_1;
        self.a._id_0CD8["burst5"] = var_1;
        self.a._id_0CD8["burst6"] = var_1;
    }
    else
    {
        self.a._id_0CD8["fire"] = var_0["fire_corner"];
        self.a._id_0CD8["semi2"] = var_0["semi2"];
        self.a._id_0CD8["semi3"] = var_0["semi3"];
        self.a._id_0CD8["semi4"] = var_0["semi4"];
        self.a._id_0CD8["semi5"] = var_0["semi5"];

        if ( animscripts\utility::_id_A2CF() )
            self.a._id_0CD8["single"] = animscripts\utility::_id_5863( "shotgun_stand", "single" );
        else
            self.a._id_0CD8["single"] = var_0["single"];

        self.a._id_0CD8["burst2"] = var_0["burst2"];
        self.a._id_0CD8["burst3"] = var_0["burst3"];
        self.a._id_0CD8["burst4"] = var_0["burst4"];
        self.a._id_0CD8["burst5"] = var_0["burst5"];
        self.a._id_0CD8["burst6"] = var_0["burst6"];
    }

    self.a._id_0CD8["exposed_idle"] = var_0["exposed_idle"];
}

_id_7DFA()
{
    if ( self.swimmer && isdefined( self.node ) )
    {
        _id_7ECC();
        return;
    }

    if ( !isdefined( self.a._id_0CD8 ) )
    {

    }

    var_0 = animscripts\utility::_id_5864( "default_crouch" );
    var_1["add_aim_up"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_up" );
    var_2["add_aim_up"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_up" );
    var_3[0] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_up" );

    if ( self.a._id_2227 == "over" )
    {
        self.a._id_0CD8["add_aim_up"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_up" );
        self.a._id_0CD8["add_aim_down"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_down" );
        self.a._id_0CD8["add_aim_left"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_left" );
        self.a._id_0CD8["add_aim_right"] = animscripts\utility::_id_5863( "cover_crouch", "add_aim_right" );
        self.a._id_0CD8["straight_level"] = animscripts\utility::_id_5863( "cover_crouch", "straight_level" );
        self.a._id_0CD8["exposed_idle"] = animscripts\utility::_id_5863( "default_stand", "exposed_idle" );
        return;
    }

    if ( self.a._id_2227 == "lean" )
    {
        var_4 = self.a._id_0CD8["lean_fire"];
        var_5 = self.a._id_0CD8["lean_single"];
        self.a._id_0CD8["fire"] = var_4;
        self.a._id_0CD8["single"] = animscripts\utility::_id_0CD8( var_5 );
        self.a._id_0CD8["semi2"] = var_5;
        self.a._id_0CD8["semi3"] = var_5;
        self.a._id_0CD8["semi4"] = var_5;
        self.a._id_0CD8["semi5"] = var_5;
        self.a._id_0CD8["burst2"] = var_4;
        self.a._id_0CD8["burst3"] = var_4;
        self.a._id_0CD8["burst4"] = var_4;
        self.a._id_0CD8["burst5"] = var_4;
        self.a._id_0CD8["burst6"] = var_4;
    }
    else
    {
        self.a._id_0CD8["fire"] = var_0["fire"];
        self.a._id_0CD8["semi2"] = var_0["semi2"];
        self.a._id_0CD8["semi3"] = var_0["semi3"];
        self.a._id_0CD8["semi4"] = var_0["semi4"];
        self.a._id_0CD8["semi5"] = var_0["semi5"];

        if ( animscripts\utility::_id_A2CF() )
            self.a._id_0CD8["single"] = animscripts\utility::_id_5863( "shotgun_crouch", "single" );
        else
            self.a._id_0CD8["single"] = var_0["single"];

        self.a._id_0CD8["burst2"] = var_0["burst2"];
        self.a._id_0CD8["burst3"] = var_0["burst3"];
        self.a._id_0CD8["burst4"] = var_0["burst4"];
        self.a._id_0CD8["burst5"] = var_0["burst5"];
        self.a._id_0CD8["burst6"] = var_0["burst6"];
    }

    self.a._id_0CD8["add_aim_up"] = var_0["add_aim_up"];
    self.a._id_0CD8["add_aim_down"] = var_0["add_aim_down"];
    self.a._id_0CD8["add_aim_left"] = var_0["add_aim_left"];
    self.a._id_0CD8["add_aim_right"] = var_0["add_aim_right"];
    self.a._id_0CD8["add_turn_aim_up"] = var_0["add_turn_aim_up"];
    self.a._id_0CD8["add_turn_aim_down"] = var_0["add_turn_aim_down"];
    self.a._id_0CD8["add_turn_aim_left"] = var_0["add_turn_aim_left"];
    self.a._id_0CD8["add_turn_aim_right"] = var_0["add_turn_aim_right"];
    self.a._id_0CD8["straight_level"] = var_0["straight_level"];
    self.a._id_0CD8["exposed_idle"] = var_0["exposed_idle"];
}

_id_7ECC()
{
    if ( !isdefined( self.a._id_0CD8 ) )
    {

    }

    var_0 = [];

    if ( self._id_0CBC == "cover_corner_r" )
        var_0 = animscripts\swim::_id_4100( "cover_corner_r" );
    else if ( self._id_0CBC == "cover_corner_l" )
        var_0 = animscripts\swim::_id_4100( "cover_corner_l" );
    else if ( self._id_0CBC == "cover_u" )
        var_0 = animscripts\swim::_id_4100( "cover_u" );
    else if ( self._id_0CBC == "exposed" )
        var_0 = animscripts\swim::_id_4100( "exposed" );
    else
    {

    }

    self.a._id_0CD8["add_aim_up"] = var_0["add_aim_up"];
    self.a._id_0CD8["add_aim_down"] = var_0["add_aim_down"];
    self.a._id_0CD8["add_aim_left"] = var_0["add_aim_left"];
    self.a._id_0CD8["add_aim_right"] = var_0["add_aim_right"];
    self.a._id_0CD8["add_turn_aim_up"] = var_0["add_aim_up"];
    self.a._id_0CD8["add_turn_aim_down"] = var_0["add_aim_down"];
    self.a._id_0CD8["add_turn_aim_left"] = var_0["add_aim_left"];
    self.a._id_0CD8["add_turn_aim_right"] = var_0["add_aim_right"];
    self.a._id_0CD8["straight_level"] = var_0["straight_level"];
    self.a._id_0CD8["fire"] = var_0["add_aim_straight"];
    self.a._id_0CD8["semi2"] = var_0["add_aim_straight"];
    self.a._id_0CD8["semi3"] = var_0["add_aim_straight"];
    self.a._id_0CD8["semi4"] = var_0["add_aim_straight"];
    self.a._id_0CD8["semi5"] = var_0["add_aim_straight"];
    self.a._id_0CD8["single"] = animscripts\utility::_id_0CD8( var_0["add_aim_straight"] );
    self.a._id_0CD8["burst2"] = var_0["add_aim_straight"];
    self.a._id_0CD8["burst3"] = var_0["add_aim_straight"];
    self.a._id_0CD8["burst4"] = var_0["add_aim_straight"];
    self.a._id_0CD8["burst5"] = var_0["add_aim_straight"];
    self.a._id_0CD8["burst6"] = var_0["add_aim_straight"];
    self.a._id_0CD8["exposed_idle"] = animscripts\utility::_id_0CD8( var_0["add_aim_idle"] );
}

_id_76C9()
{
    self notify( "killanimscript" );
    thread animscripts\combat::main();
}

_id_7F48()
{
    if ( self.swimmer )
        self _meth_8192( "nogravity" );
    else
        self _meth_8192( "zonly_physics" );
}

_id_2221( var_0 )
{
    if ( self._id_2225 == "left" )
        var_1 = "corner_stand_L";
    else
        var_1 = "corner_stand_R";

    self._id_35C7 = animscripts\face::_id_6D9B( var_0, var_1, self._id_35C7 );
}

_id_2220( var_0 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, "aim", self._id_35C7 );
}

_id_221F()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}
