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

_id_4C7F()
{
    var_0 = [];
    var_0["straight_level"] = %prone_aim_5;
    var_0["legs_up"] = %prone_aim_feet_45up;
    var_0["legs_down"] = %prone_aim_feet_45down;
    var_0["fire"] = %prone_fire_1;
    var_0["semi2"] = %prone_fire_burst;
    var_0["semi3"] = %prone_fire_burst;
    var_0["semi4"] = %prone_fire_burst;
    var_0["semi5"] = %prone_fire_burst;
    var_0["single"] = [ %prone_fire_1 ];
    var_0["burst2"] = %prone_fire_burst;
    var_0["burst3"] = %prone_fire_burst;
    var_0["burst4"] = %prone_fire_burst;
    var_0["burst5"] = %prone_fire_burst;
    var_0["burst6"] = %prone_fire_burst;
    var_0["reload"] = %prone_reload;
    var_0["look"] = [ %prone_twitch_look, %prone_twitch_lookfast, %prone_twitch_lookup ];
    var_0["grenade_safe"] = [ %prone_grenade_a, %prone_grenade_a ];
    var_0["grenade_exposed"] = [ %prone_grenade_a, %prone_grenade_a ];
    var_0["exposed_idle"] = [ %prone_idle ];
    var_0["twitch"] = [ %prone_twitch_ammocheck, %prone_twitch_look, %prone_twitch_scan, %prone_twitch_lookfast, %prone_twitch_lookup ];
    var_0["hide_to_look"] = %coverstand_look_moveup;
    var_0["look_idle"] = %coverstand_look_idle;
    var_0["look_to_hide"] = %coverstand_look_movedown;
    var_0["look_to_hide_fast"] = %coverstand_look_movedown_fast;
    var_0["stand_2_prone"] = %stand_2_prone_nodelta;
    var_0["crouch_2_prone"] = %crouch_2_prone;
    var_0["prone_2_stand"] = %prone_2_stand_nodelta;
    var_0["prone_2_crouch"] = %prone_2_crouch;
    var_0["stand_2_prone_firing"] = %stand_2_prone_firing;
    var_0["crouch_2_prone_firing"] = %crouch_2_prone_firing;
    var_0["prone_2_stand_firing"] = %prone_2_stand_firing;
    var_0["prone_2_crouch_firing"] = %prone_2_crouch_firing;
    var_0["turn_left_45"] = %h1_prone_turn_l45;
    var_0["turn_left_90"] = %h1_prone_turn_l90;
    var_0["turn_left_180"] = %h1_prone_turn_180;
    var_0["turn_right_45"] = %h1_prone_turn_r45;
    var_0["turn_right_90"] = %h1_prone_turn_r90;
    var_0["turn_right_180"] = %h1_prone_turn_180;
    anim.archetypes["soldier"]["cover_prone"] = var_0;
}

setanimmodedelayed( var_0 )
{
    self endon( "killanimscript" );
    self endon( "killsetAnimModeDelayed" );
    wait(var_0);
    self _meth_8193( "face angle", self._id_22BA.angles[1] );
}

main()
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_prone" );

    if ( weaponclass( self.weapon ) == "rocketlauncher" )
    {
        animscripts\combat::main();
        return;
    }

    if ( isdefined( self.a.arrivaltype ) && self.a.arrivaltype == "prone_saw" )
        animscripts\cover_wall::_id_9C12( "saw_bipod_prone", "weapon_saw_MG_Setup", 0 );
    else if ( isdefined( self.node._id_9940 ) )
        animscripts\cover_wall::_id_9C15();

    if ( isdefined( self.enemy ) && lengthsquared( self.origin - self.enemy.origin ) < squared( 512 ) )
    {
        thread animscripts\combat::main();
        return;
    }

    _id_80A3();
    self._id_993A = 50;
    self._id_22BA = self.node;
    self _meth_8193( "face angle", self.angles[1] );
    self.a._id_425B = 1;
    self _meth_81FD( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );

    if ( self.a._id_6E5A != "prone" )
    {
        self _meth_8193( "face angle", self._id_22BA.angles[1] );
        _id_701F( "prone" );
    }
    else
    {
        var_0 = 0;

        if ( self.a._id_5F5B != "stop" )
            var_0 = 0.15;

        animscripts\utility::_id_3308( var_0 );

        if ( var_0 != 0 )
        {
            var_1 = animscripts\utility::absangleclamp180( self.angles[1] - self._id_22BA.angles[1] );
            var_2 = %h1_crawl_2_prone;
            var_3 = 0.4;

            if ( var_1 < -17.5 )
            {
                var_2 = %h1_crawl_2_prone_35r;
                var_3 = 0.25;
            }
            else if ( var_1 > 17.5 )
            {
                var_3 = 0.25;
                var_2 = %h1_crawl_2_prone_35l;
            }

            var_4 = getanimlength( var_2 );
            var_5 = var_4 * var_3;
            thread setanimmodedelayed( var_5 );
            self setflaggedanimrestart( "coverProneArrival", var_2, 1, 0.2, 1 );
            animscripts\shared::_id_2D06( "coverProneArrival" );
            self notify( "killsetAnimModeDelayed" );
            self.a._id_5F5B = "stop";
        }
    }

    thread animscripts\combat_utility::aimidlethread();
    _id_8333( 0.2 );
    self _meth_814D( %prone_aim_5, 1, 0.1 );
    self _meth_8193( "face angle", self.angles[1] );
    self _meth_8192( "zonly_physics" );
    _id_7022();
    self notify( "stop_deciding_how_to_shoot" );
}

end_script()
{
    self.a._id_425B = undefined;
}

_id_4B87()
{
    self endon( "killanimscript" );
    self endon( "kill_idle_thread" );

    for (;;)
    {
        var_0 = animscripts\utility::animarraypickrandom( "prone_idle" );
        self setflaggedanimlimited( "idle", var_0 );
        self waittillmatch( "idle", "end" );
        self _meth_8144( var_0, 0.2 );
    }
}

_id_9B50( var_0 )
{
    self _meth_81FE( animscripts\utility::_id_5863( "cover_prone", "legs_up" ), animscripts\utility::_id_5863( "cover_prone", "legs_down" ), 1, var_0, 1 );
    self _meth_814D( %exposed_aiming, 1, 0.2 );
}

_id_2D88( var_0, var_1 )
{
    var_2 = isdefined( self._id_840F );
    var_3 = 1;
    var_4 = 0.2;
    var_5 = isdefined( self.enemy ) && !isdefined( self._id_993E ) && self _meth_81C3( self.enemy, 2 ) && distancesquared( self.enemy.origin, self.origin ) < 262144;

    if ( self.a._id_7B46 + 500 > gettime() )
    {
        var_4 = 0.25;

        if ( var_5 )
            thread animscripts\combat::_id_35BA();
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
    else if ( var_1 > 67.5 )
        var_7 = 90;
    else
        var_7 = 45;

    var_8 = "turn_" + var_0 + "_" + var_7;
    var_9 = animscripts\utility::animarray( var_8 );

    if ( isdefined( self._id_993E ) )
        self _meth_8192( "angle deltas", 0 );
    else if ( isdefined( self.node ) && isdefined( anim._id_50E3[self.node.type] ) && distancesquared( self.origin, self.node.origin ) < 256 )
        self _meth_8192( "angle deltas", 0 );
    else if ( animscripts\combat::_id_50B8( var_9 ) )
        animscripts\combat::_id_7444();
    else
        self _meth_8192( "angle deltas", 0 );

    self _meth_8149( %exposed_aiming, %body, 1, var_4 );
    self _meth_814E( %turn, 1, var_4 );

    if ( isdefined( self._id_4795 ) )
        var_3 = min( 1.0, var_3 );

    self setflaggedanimknoblimitedrestart( "turn", var_9, 1, var_4, var_3 );
    self notify( "turning" );
    animscripts\combat::_id_2D89();
    self _meth_814E( %turn, 0, 0.2 );
    self _meth_8144( %turn, 0.2 );
    self _meth_8145( %exposed_aiming, 1, 0.2, 1 );

    if ( isdefined( self._id_9931 ) )
    {
        self._id_9931 = undefined;
        thread animscripts\combat::_id_35BA();
    }

    animscripts\combat::_id_7444( 0 );
    self notify( "done turning" );
}

_id_608A()
{
    if ( !isdefined( self.enableproneturn ) )
        return 0;

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

    return animscripts\utility::absangleclamp180( var_1 ) > self._id_993A;
}

_id_993D( var_0 )
{
    if ( var_0 < 0 - self._id_993A )
    {
        _id_2D88( "left", 0 - var_0 );
        maps\_gameskill::_id_2A4D();
        return 1;
    }

    if ( var_0 > self._id_993A )
    {
        _id_2D88( "right", var_0 );
        maps\_gameskill::_id_2A4D();
        return 1;
    }

    return 0;
}

coverproneneedtoturn()
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

_id_7022()
{
    self endon( "killanimscript" );
    thread animscripts\track::_id_9512();
    thread animscripts\shoot_behavior::_id_2743( "normal" );
    var_0 = gettime() > 2500;

    for (;;)
    {
        animscripts\utility::_id_9B2B();
        _id_9B50( 0.05 );

        if ( !var_0 )
        {
            wait(0.05 + randomfloat( 1.5 ));
            var_0 = 1;
            continue;
        }

        if ( !isdefined( self._id_840F ) )
        {
            if ( coverproneneedtoturn() )
                continue;

            if ( _id_2152() )
                continue;

            wait 0.05;
            continue;
        }

        var_1 = lengthsquared( self.origin - self._id_840F );

        if ( self.a._id_6E5A != "crouch" && self _meth_81CF( "crouch" ) && var_1 < squared( 400 ) )
        {
            if ( var_1 < squared( 285 ) )
            {
                _id_701F( "crouch" );
                thread animscripts\combat::main();
                return;
            }
        }

        if ( coverproneneedtoturn() )
            continue;

        if ( _id_2152() )
            continue;

        if ( _id_7026( 0 ) )
            continue;

        if ( animscripts\combat_utility::aimedatshootentorpos() )
        {
            animscripts\combat_utility::_id_8417();
            self _meth_8144( %add_fire, 0.2 );
            continue;
        }

        wait 0.05;
    }
}

_id_7026( var_0 )
{
    return animscripts\combat_utility::reload( var_0, animscripts\utility::animarray( "reload" ) );
}

_id_80A3()
{
    self _meth_8177( self.node );
    self.a.array = animscripts\utility::_id_5864( "cover_prone" );
}

_id_98A5( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( var_1 ) && var_1 )
        var_2 = animscripts\utility::animarraypickrandom( "grenade_safe" );
    else
        var_2 = animscripts\utility::animarraypickrandom( "grenade_exposed" );

    self _meth_8192( "zonly_physics" );
    self.keepclaimednodeifvalid = 1;
    var_3 = ( 32.0, 20.0, 64.0 );
    var_4 = animscripts\combat_utility::_id_989D( var_0, var_2 );
    self.keepclaimednodeifvalid = 0;
    return var_4;
}

_id_2152()
{
    if ( isdefined( anim._id_933B ) && isalive( level.player ) )
    {
        if ( _id_98A5( level.player, 200 ) )
            return 1;
    }

    if ( isdefined( self.enemy ) )
        return _id_98A5( self.enemy, 850 );

    return 0;
}

_id_8499()
{
    if ( !isdefined( self.weapon ) || !weaponisauto( self.weapon ) )
        return 0;

    if ( isdefined( self.node ) && distancesquared( self.origin, self.node.origin ) < 256 )
        return 0;

    if ( isdefined( self.enemy ) && self _meth_81C2( self.enemy ) && !isdefined( self.grenade ) && animscripts\shared::_id_3EE4() < 20 )
        return animscripts\move::_id_5A61();

    return 0;
}

_id_701F( var_0 )
{
    if ( var_0 == self.a._id_6E5A )
        return;

    self _meth_8144( %animscript_root, 0.3 );
    animscripts\combat_utility::_id_315E();

    if ( _id_8499() )
        var_1 = animscripts\utility::animarray( self.a._id_6E5A + "_2_" + var_0 + "_firing" );
    else
        var_1 = animscripts\utility::animarray( self.a._id_6E5A + "_2_" + var_0 );

    if ( var_0 == "prone" )
    {

    }

    self setflaggedanimknoballrestart( "trans", var_1, %body, 1, 0.2, 1.0 );
    animscripts\shared::_id_2D06( "trans" );
    self _meth_814B( animscripts\utility::animarray( "straight_level" ), %body, 1, 0.25 );
    _id_8333( 0.25 );
}

_id_3799( var_0 )
{
    self endon( "killanimscript" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_8333( var_0 )
{
    self _meth_8149( %prone_aim_5, %body, 1, var_0 );
    self _meth_814E( %prone_aim_2_add, 1, var_0 );
    self _meth_814E( %prone_aim_4_add, 1, var_0 );
    self _meth_814E( %prone_aim_6_add, 1, var_0 );
    self _meth_814E( %prone_aim_8_add, 1, var_0 );
}

_id_702B( var_0, var_1, var_2 )
{
    self _meth_8144( %animscript_root, 0.3 );
    var_3 = undefined;

    if ( _id_8499() )
    {
        if ( var_0 == "crouch" )
            var_3 = %prone_2_crouch_firing;
        else if ( var_0 == "stand" )
            var_3 = %prone_2_stand_firing;
    }
    else if ( var_0 == "crouch" )
        var_3 = %prone_2_crouch;
    else if ( var_0 == "stand" )
        var_3 = %prone_2_stand_nodelta;

    if ( isdefined( self._id_701C ) )
        var_3 = self._id_701C;

    if ( isdefined( self._id_701E ) )
        var_1 = self._id_701E;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    animscripts\utility::_id_344B( getanimlength( var_3 ) / 2 );
    self setflaggedanimknoballrestart( "trans", var_3, %body, 1, 0.2, var_1 );
    animscripts\shared::_id_2D06( "trans" );

    if ( !isdefined( var_2 ) )
        var_2 = 0.1;

    self _meth_8144( var_3, var_2 );
}
