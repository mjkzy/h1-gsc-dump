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

_id_4C8F()
{
    var_0 = [];
    var_0["stand"][0] = [ %casual_stand_idle, %casual_stand_idle_twitch, %casual_stand_idle_twitchb ];
    var_0["stand_combat"][0] = [ %cqb_stand_idle, %cqb_stand_twitch ];
    var_0["stand_cqb"][0] = [ %cqb_stand_idle, %cqb_stand_twitch ];
    var_0["crouch"][0] = [ %casual_crouch_idle ];
    var_0["crouch_combat"][0] = [ %exposed_crouch_aim_5 ];
    var_1 = [];
    var_1["crouch_combat"][0] = %exposed_crouch_idle_alert_v1;
    var_1["crouch_combat"][1] = %exposed_crouch_idle_alert_v2;
    var_1["crouch_combat"][2] = %exposed_crouch_idle_alert_v3;
    anim._id_0CCA["soldier"]["idle"] = var_0;
    anim._id_0CCA["soldier"]["idle_add"] = var_1;
    var_0 = [];
    var_0["stand"][0] = [ 2, 1, 1 ];
    var_0["stand"][1] = [ 10, 4, 7, 4 ];
    var_0["stand_combat"][0] = [ 2, 1 ];
    var_0["stand_cqb"][0] = [ 2, 1 ];
    var_0["crouch"][0] = [ 6 ];
    var_0["crouch_combat"][0] = [ 6 ];
    anim._id_0CCA["soldier"]["idle_weights"] = var_0;
    var_0 = [];
    var_0["stand"] = %casual_stand_idle_trans_in;
    var_0["crouch"] = %casual_crouch_idle_in;
    var_0["stand_smg"] = %smg_casual_stand_idle_trans_in;
    anim._id_0CCA["soldier"]["idle_transitions"] = var_0;
}

main()
{
    if ( isdefined( self._id_60EE ) )
        return;

    if ( isdefined( self._id_2533 ) )
    {
        if ( isdefined( self._id_2533["stop"] ) )
        {
            [[ self._id_2533["stop"] ]]();
            return;
        }
    }

    self notify( "stopScript" );
    self endon( "killanimscript" );
    [[ self._id_33E5["stop_immediate"] ]]();
    thread _id_27E0();
    animscripts\utility::_id_4DD7( "stop" );

    if ( isdefined( self._id_8A2F ) )
        _id_8A30();

    animscripts\utility::_id_7129();
    thread _id_7F9E();
    thread animscripts\reactions::_id_718A();
    var_0 = isdefined( self._id_255D );

    if ( !var_0 )
    {
        if ( self.a._id_A2E2["right"] == "none" && self.a._id_A2E2["left"] == "none" )
            var_0 = 1;
        else if ( angleclamp180( self _meth_81bd()[0] ) > 20 )
            var_0 = 1;
    }

    if ( self.tactical && !isdefined( self.enemy ) )
    {
        var_1 = animscripts\exit_node::_id_3F8B();

        if ( isdefined( var_1 ) )
        {
            self setflaggedanimknoballrestart( "idle", self._id_255D["stand"], %body, 1, 0.5, self._id_0C78 );
            _id_993C( var_1.angles[1] );
        }
        else
            self _meth_8193( "face angle", self.angles[1] );
    }

    for (;;)
    {
        var_2 = _id_3F56();

        if ( var_2 == "prone" )
        {
            var_0 = 1;
            _id_7028();
            continue;
        }

        if ( self.a._id_6E5A != var_2 )
        {
            self _meth_8144( %animscript_root, 0.3 );
            var_0 = 0;
        }

        if ( animscripts\setposemovement::_id_7FF1( var_2, "stop" ) )
            continue;

        if ( !var_0 )
        {
            _id_971F( var_2, self.a._id_4B81 );
            var_0 = 1;
            continue;
        }

        _id_6DAA( var_2, self.a._id_4B81 );
    }
}

_id_993C( var_0 )
{
    var_1 = self.angles[1];
    var_2 = angleclamp180( var_0 - var_1 );

    if ( -20 < var_2 && var_2 < 20 )
    {
        _id_7608( var_0, 2 );
        return;
    }

    var_3 = animscripts\swim::_id_4100( "idle_turn" );

    if ( var_2 < -80 )
        var_4 = var_3[2];
    else if ( var_2 < -20 )
        var_4 = var_3[3];
    else if ( var_2 < 80 )
        var_4 = var_3[5];
    else
        var_4 = var_3[6];

    var_5 = getanimlength( var_4 );
    var_6 = abs( var_2 ) / self.turret_not_on_target;
    var_6 /= 1000;
    var_7 = var_5 / var_6;
    self _meth_8193( "face angle", var_0 );
    self setflaggedanimrestart( "swim_turn", var_4, 1, 0.2, var_7 * self._id_5F65 );
    animscripts\shared::_id_2D06( "swim_turn" );
    self _meth_8144( var_4, 0.2 );
}

_id_7608( var_0, var_1 )
{
    self _meth_8193( "face angle", var_0 );

    while ( angleclamp( var_0 - self.angles[1] ) > var_1 )
        wait 0.1;
}

_id_7F9E()
{
    self endon( "death" );
    self waittill( "killanimscript" );
    self._id_55FD = gettime();
}

_id_8A30()
{
    self endon( "stop_specialidle" );
    self.a._id_5F5B = "stop";
    var_0 = self._id_8A2F;
    self _meth_8192( "gravity" );
    self _meth_8193( "face current" );
    self _meth_8144( %animscript_root, 0.2 );

    if ( var_0.size == 0 )
        return;

    var_1 = [];
    var_2 = var_0[0];

    for (;;)
    {
        if ( var_1.size == 0 )
            var_1 = common_scripts\utility::_id_0CF5( var_0 );

        if ( var_1[0] == var_2 && var_1.size > 1 )
            var_2 = var_1[1];
        else
            var_2 = var_1[0];

        var_1 = common_scripts\utility::_id_0CF6( var_1, var_2 );
        self setflaggedanimrestart( "special_idle", var_2, 1, 0.2, self._id_0C78 );
        childthread animscripts\shared::_id_2D06( "special_idle" );
        self waittillmatch( "special_idle", "end" );

        if ( var_0.size > 1 )
            self _meth_8144( var_2, 0.2 );
    }
}

_id_3F56()
{
    var_0 = animscripts\utility::_id_3F2F();

    if ( isdefined( var_0 ) )
    {
        var_1 = var_0.angles[1];
        var_2 = var_0.unlockpoints;
    }
    else
    {
        var_1 = self.desiredangle;
        var_2 = "node was undefined";
    }

    animscripts\face::_id_7F8F( anim._id_09D2 );
    var_3 = animscripts\utility::_id_1D45();

    if ( var_2 == "Cover Stand" || var_2 == "Conceal Stand" )
        var_3 = animscripts\utility::_id_1D45( "stand" );
    else if ( var_2 == "Cover Crouch" || var_2 == "Conceal Crouch" )
        var_3 = animscripts\utility::_id_1D45( "crouch" );
    else if ( var_2 == "Cover Prone" || var_2 == "Conceal Prone" )
        var_3 = animscripts\utility::_id_1D45( "prone" );

    return var_3;
}

_id_971F( var_0, var_1 )
{
    var_2 = self _meth_8167();

    if ( isdefined( self.node_relinquished ) )
    {
        if ( self.node_relinquished doesnodeforcecombat() )
            var_2 = 1;

        if ( self.node_relinquished _meth_8564() )
            var_2 = 0;
    }

    if ( animscripts\utility::_id_50E9() && self.a._id_6E5A == "stand" && ( animscripts\utility::_id_5124() || var_2 ) )
        var_0 = "stand_cqb";
    else if ( animscripts\utility::_id_9C3B() && self.a._id_6E5A == "stand" )
        var_0 = "stand_smg";
    else if ( self.a._id_6E5A == "stand" && var_2 )
        var_0 = "stand_combat";
    else if ( self.a._id_6E5A == "crouch" && var_2 )
        var_0 = "crouch_combat";

    var_3 = animscripts\utility::_id_5864( "idle_transitions" );

    if ( isdefined( var_3[var_0] ) )
    {
        var_4 = var_3[var_0];
        self setflaggedanimknoballrestart( "idle_transition", var_4, %body, 1, 0.2, self._id_0C78 );
        animscripts\shared::_id_2D06( "idle_transition" );
    }
}

_id_6DAA( var_0, var_1 )
{
    var_2 = self _meth_8167();

    if ( isdefined( self.node_relinquished ) )
    {
        if ( self.node_relinquished doesnodeforcecombat() )
            var_2 = 1;

        if ( self.node_relinquished _meth_8564() )
            var_2 = 0;
    }

    if ( animscripts\utility::_id_50E9() && self.a._id_6E5A == "stand" && ( animscripts\utility::_id_5124() || var_2 ) )
        var_0 = "stand_cqb";
    else if ( self.a._id_6E5A == "stand" && var_2 )
        var_0 = "stand_combat";
    else if ( self.a._id_6E5A == "crouch" && var_2 )
        var_0 = "crouch_combat";

    var_3 = undefined;

    if ( isdefined( self._id_255D ) && isdefined( self._id_255D[var_0] ) )
    {
        if ( isarray( self._id_255D[var_0] ) )
            var_4 = animscripts\utility::_id_0BAA( self._id_255D[var_0], self._id_255E[var_0] );
        else
        {
            var_4 = self._id_255D[var_0];
            var_5 = var_0 + "_add";

            if ( isdefined( self._id_255D[var_5] ) )
                var_3 = self._id_255D[var_5];
        }
    }
    else if ( isdefined( anim._id_71DD ) && ( var_0 == "stand" || var_0 == "stand_cqb" ) && isdefined( self._id_1944 ) && self._id_1944 == 1 )
        var_4 = animscripts\utility::_id_0BAA( anim._id_71DD["stand"][0], anim._id_71DE["stand"][0] );
    else
    {
        var_6 = animscripts\utility::_id_5864( "idle" );
        var_7 = animscripts\utility::_id_5864( "idle_weights" );
        var_1 %= var_6[var_0].size;
        var_4 = animscripts\utility::_id_0BAA( var_6[var_0][var_1], var_7[var_0][var_1] );
        var_8 = animscripts\utility::_id_5864( "idle_add" );

        if ( isdefined( var_8[var_0] ) )
        {
            var_9 = var_8[var_0].size * 6;
            var_10 = randomint( var_9 );

            if ( var_10 < var_8[var_0].size )
                var_3 = var_8[var_0][var_10];
        }
    }

    var_11 = 0.2;

    if ( gettime() == self.a._id_7B46 )
        var_11 = 0.5;

    if ( isdefined( var_3 ) )
    {
        self _meth_8149( var_4, %body, 1, var_11, 1 );
        self _meth_814d( %add_idle );
        self setflaggedanimknoballrestart( "idle", var_3, %add_idle, 1, var_11, self._id_0C78 );
    }
    else
        self setflaggedanimknoballrestart( "idle", var_4, %body, 1, var_11, self._id_0C78 );

    animscripts\shared::_id_2D06( "idle" );
}

_id_7028()
{
    var_0 = [];
    var_1 = undefined;
    var_2 = undefined;

    if ( self.a._id_6E5A != "prone" )
    {
        var_0["stand_2_prone"] = %stand_2_prone;
        var_0["crouch_2_prone"] = %crouch_2_prone;
        var_1 = var_0[self.a._id_6E5A + "_2_prone"];
    }
    else if ( self.a._id_5F5B != "stop" )
    {
        if ( self.primaryattachment2 == "move" && isdefined( self.movetransitionanimation ) && isdefined( self.movetransitionendpose ) && self.movetransitionendpose == "prone" )
        {
            var_3 = getanimlength( self.movetransitionanimation ) * ( 1 - self _meth_8151( self.movetransitionanimation ) );

            if ( var_3 > 0.05 )
            {
                var_2 = self _meth_8151( self.movetransitionanimation );
                var_1 = self.movetransitionanimation;
            }
        }
        else
            var_1 = %h1_crawl_2_prone;
    }

    if ( isdefined( var_1 ) )
    {
        self setflaggedanimknoballrestart( "trans", var_1, %body, 1, 0.2, 1.0 );

        if ( isdefined( var_2 ) )
            self setanimtime( var_1, var_2 );

        animscripts\shared::_id_2D06( "trans" );
        self.a._id_5F5B = "stop";
        self _meth_81fd( -45, 45, %prone_legs_down, %exposed_modern, %prone_legs_up );
        return;
    }

    thread _id_9B4F();

    if ( randomint( 10 ) < 3 )
    {
        var_4 = animscripts\utility::_id_5863( "cover_prone", "twitch" );
        var_5 = var_4[randomint( var_4.size )];
        self setflaggedanimknoball( "prone_idle", var_5, %exposed_modern, 1, 0.2 );
    }
    else
    {
        self _meth_8149( animscripts\utility::_id_5863( "cover_prone", "straight_level" ), %exposed_modern, 1, 0.2 );
        self _meth_8154( "prone_idle", animscripts\utility::_id_5863( "cover_prone", "exposed_idle" )[0], 1, 0.2 );
    }

    self waittillmatch( "prone_idle", "end" );
    self notify( "kill UpdateProneThread" );
}

_id_9B4F()
{
    self endon( "killanimscript" );
    self endon( "kill UpdateProneThread" );

    for (;;)
    {
        animscripts\cover_prone::_id_9B50( 0.1 );
        wait 0.1;
    }
}

_id_27E0()
{
    self endon( "killanimscript" );
    wait 0.05;
    [[ self._id_33E5["stop"] ]]();
}
