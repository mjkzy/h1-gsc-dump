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

_id_4E32( var_0 )
{
    self.weeklychallengeid[var_0] = spawnstruct();
    self.weeklychallengeid[var_0].precache = "none";
    self.weeklychallengeid[var_0]._id_4723 = 1;

    if ( getweaponclipmodel( var_0 ) != "" )
        self.weeklychallengeid[var_0]._id_9BF2 = 1;
    else
        self.weeklychallengeid[var_0]._id_9BF2 = 0;
}

_id_5208( var_0 )
{
    return isdefined( self.weeklychallengeid[var_0] );
}

_id_7F7C()
{
    anim._id_22A1 = 55;
    anim._id_0985 = 10;
    anim._id_0983 = 4096;
    anim._id_0984 = 45;
    anim._id_097B = 20;
    anim.aimpitchdiffclosedistsq = 6400;
    anim.aimpitchdiffclosetolerance = 30;
    anim._id_6663 = 25;
    anim._id_6661 = anim._id_0983;
    anim._id_6662 = anim._id_0984;
    anim._id_665B = 30;
    anim._id_5A26 = 65;
    anim._id_5A25 = 65;
}

_id_33DF()
{
    if ( animscripts\utility::_id_51A3( self.secondaryweapon ) )
        return 1;

    if ( weaponclass( self.primaryweapon ) == "rocketlauncher" )
        return 1;

    return 0;
}
#using_animtree("generic_human");

main()
{
    self.a = spawnstruct();
    self.a._id_54FB = 0;
    self.primaryweapon = self.weapon_switch_invalid;
    _id_381E();

    if ( !isdefined( self.primaryweapon ) || self.primaryweapon == "" )
        self.primaryweapon = "none";

    if ( self.secondaryweapon == "" )
        self.secondaryweapon = "none";

    if ( self._id_855D == "" )
        self._id_855D = "none";

    _id_4E32( self.primaryweapon );
    _id_4E32( self.secondaryweapon );
    _id_4E32( self._id_855D );
    self _meth_8177();
    self.a._id_A2E2["left"] = "none";
    self.a._id_A2E2["right"] = "none";
    self.a._id_A2E2["chest"] = "none";
    self.a._id_A2E2["back"] = "none";
    self.a._id_A2E3["left"] = "none";
    self.a._id_A2E3["right"] = "none";
    self.a._id_A2E3["chest"] = "none";
    self.a._id_A2E3["back"] = "none";
    self._id_560F = self.weapon_switch_invalid;
    self._id_75DF = %animscript_root;
    thread _id_139C();
    var_0 = animscripts\utility::_id_9C36();
    self.a._id_6096 = var_0;

    if ( var_0 )
        thread animscripts\shared::_id_766B();

    self.a._id_7594 = 3;
    self.a._id_7597 = 1;
    self.a._id_6E5A = "stand";
    self.a._id_440C = "stand";
    self.a._id_5F5B = "stop";
    self.a._id_8D56 = "stop";
    self.a._id_8A1A = "none";
    self.a._id_4471 = "none";
    self.a._id_6F73 = -1;
    self.dropweapon = 1;
    self._id_5C65 = 850;
    animscripts\shared::_id_6869( self.primaryweapon, "right" );

    if ( animscripts\utility::_id_51A3( self.secondaryweapon ) )
        animscripts\shared::_id_6869( self.secondaryweapon, "back" );

    self.a._id_6084 = 0;
    self.a._id_20AA = gettime();
    self.a._id_559E = gettime();
    self.a._id_8FE8 = 0;
    self.a._id_2B18 = !self _meth_813f();
    self.a._id_5856 = 0;
    self.a._id_665F = 0;
    self.a._id_55D7 = 0;
    self.a._id_60CC = 0;
    self.a._id_71D0 = undefined;
    setdvarifuninitialized( "ai_reactToBulletChance", 0.8 );
    setdvarifuninitialized( "ai_reactToBulletCooldown", 5000 );

    if ( self.team == "allies" && !issubstr( self.classname, "russian" ) && allies_with_ir() )
        self.has_ir = 1;

    self.a._id_6E8D = undefined;
    self.a._id_8AF2 = "stand";
    self._id_1D46 = animscripts\utility::_id_1D45;
    self._id_0550 = 0;
    self._id_05DB = 0;
    thread _id_32B6();
    self._id_1300 = 1;
    self.a._id_5CE3 = 0;
    self.a._id_612E = 0;
    self.a._id_5CE3 = 0;
    self.a._id_5CE5 = 0;
    self.a._id_2B20 = 0;
    self._id_06DC = 1;
    self._id_1CA5 = 0;
    self._id_8569 = 0;
    self._id_8568 = 1;
    self._id_607D = 1;
    self._id_27A0 = 55;
    self.a._id_60DD = 0;

    if ( !isdefined( self._id_79EA ) )
        self._id_79EA = 0;

    _id_8340();
    animscripts\weaponlist::_id_72B1();
    self._id_559D = 0;
    self._id_20B5 = 0;
    self._id_8FE4 = 0;
    self._id_8FE7 = 0;

    if ( self.team == "allies" )
        self._id_8FEC = 0.75;
    else
        self._id_8FEC = 0.5;

    if ( self.team == "allies" )
        self._id_7120 = 0;
    else
        self._id_7120 = 128;

    self._id_0B77 = 8000;
    self._id_0B78 = 0;
    animscripts\animset::_id_8283();
    self._id_33E5 = [];
    self._id_33E5["corner"] = 1;
    self._id_33E5["cover_crouch"] = 1;
    self._id_33E5["stop"] = 1;
    self._id_33E5["stop_immediate"] = 1;
    self._id_33E5["move"] = 1;
    self._id_33E5["exposed"] = 1;
    self._id_33E5["corner_normal"] = 1;
    var_1 = getarraykeys( self._id_33E5 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        common_scripts\utility::_id_1EB7( var_1[var_2] );

    self._id_7177 = 0;
    thread _id_7FBA();
    self._id_8489 = 0;

    if ( isdefined( level.h1_bullet_whizby_enabled ) && level.h1_bullet_whizby_enabled )
    {
        self._id_2AF7 = undefined;
        self._id_2A93 = 1;
    }
    else
        self._id_2AF7 = 1;

    self._id_6165 = 1;

    if ( isdefined( level.h1_team_run_twitch_enabled ) )
    {
        if ( isdefined( level.h1_team_run_twitch_enabled[self.team] ) )
            self._id_6165 = !level.h1_team_run_twitch_enabled[self.team];
    }

    self.proneaimlimits = spawnstruct();
    self.proneaimlimits.riotshield_hit = 45;
    self.proneaimlimits.lifecount = -45;
    self.proneaimlimits.useable = 35;
    self.proneaimlimits.downaimlimit = -35;
    self.animaimlimit = spawnstruct();
    self.animaimlimit.riotshield_hit = 45;
    self.animaimlimit.lifecount = -45;
    self.doaimidlethread = 1;

    if ( !isdefined( level._id_2B1C ) )
        thread animscripts\combat_utility::_id_5E5E();

    thread _id_6467();
    thread handleikevent();
}

handleikevent()
{
    self endon( "death" );
    var_0 = -30;
    self _meth_814e( %actor_ik_move_root, 0 );
    self _meth_814e( %stand_exposed_ik_add, 1 );
    var_1 = 0;

    for (;;)
    {
        self waittill( "actorik", var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( var_2 <= 0.01 )
        {
            if ( var_1 == 0 )
            {
                self _meth_814e( %actor_ik_move_root, 0 );
                var_1 = 1;
            }

            continue;
        }

        var_5 *= -1;
        var_9 = var_0;

        if ( length2dsquared( self.visionsetnakedduration ) > 0.01 )
            var_9 = -10;

        var_10 = 0;
        var_11 = 8;
        var_12 = 8;

        if ( var_3 )
            var_12 = 5;

        if ( var_4 )
            var_11 = 5;

        var_13[0] = var_8;
        var_13[1] = var_8 + var_7 * var_11;
        var_13[2] = var_6;
        var_13[3] = var_6 + var_5 * var_12;
        var_14[0] = 1;
        var_14[1] = 1;
        var_14[2] = 1;
        var_14[3] = 1;
        var_15[0] = min( var_13[0][2], var_13[1][2] );
        var_15[1] = min( var_13[2][2], var_13[3][2] );
        var_16[0] = 0;
        var_16[1] = 0;

        if ( abs( var_15[0] - var_15[1] ) < 1 )
        {
            var_16[0] = 1;
            var_16[1] = 1;
        }
        else if ( var_15[0] < var_15[1] )
            var_16[0] = 1;
        else
            var_16[1] = 1;

        var_17[0] = 0;
        var_17[1] = 0;
        var_17[2] = 0;
        var_17[3] = 0;

        for ( var_18 = 0; var_18 < 4; var_18++ )
        {
            var_19 = var_13[var_18] + ( 0, 0, 30 );
            var_20 = var_13[var_18] - ( 0, 0, 30 );
            var_21 = self aiphysicstrace( var_19, var_20, 1.5, 3, 1, 1, 0, 1, 1, 1 );
            var_22 = var_19 + 2 * var_21["fraction"] * ( 0, 0, -30 );
            var_17[var_18] = var_22[2] - self.origin[2];

            if ( var_21["fraction"] == 1 )
                var_14[var_18] = 0;
        }

        if ( var_14[0] || var_14[1] )
            var_23 = max( var_17[0], var_17[1] );
        else
            var_23 = 0;

        if ( var_14[2] || var_14[3] )
            var_24 = max( var_17[2], var_17[3] );
        else
            var_24 = 0;

        if ( var_16[0] == 1 && var_16[1] == 1 )
            var_10 = min( var_23, var_24 );
        else if ( var_16[0] == 1 )
            var_10 = var_23;
        else
            var_10 = var_24;

        var_10 = clamp( var_10, var_9, 0 );

        if ( var_10 < 0 )
        {
            var_25 = var_10 / var_0;
            self _meth_814e( %actor_ik_move_root, var_25 * var_2 );
            var_1 = 0;
        }
        else if ( var_1 == 0 )
        {
            self _meth_814e( %actor_ik_move_root, 0 );
            var_1 = 1;
        }
    }
}

allies_with_ir()
{
    if ( !isdefined( self._id_79EE ) )
        return 1;

    var_0[0] = "Griggs";
    var_0[1] = "Nikolai";

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( self._id_79EE, var_2 ) )
            return 0;
    }

    return 1;
}

_id_A2E7( var_0 )
{
    var_1[0] = "m4_grenadier";
    var_1[1] = "m4_grunt";
    var_1[2] = "m4_silencer";
    var_1[3] = "m4m203";

    if ( !isdefined( var_0 ) )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( issubstr( var_0, var_1[var_2] ) )
            return 1;
    }

    return 0;
}

_id_7FBA()
{
    self endon( "death" );

    if ( !isdefined( level._id_57DA ) )
        level waittill( "loadout complete" );

    maps\_names::_id_3DE2();
    thread animscripts\squadmanager::_id_084F();
}

_id_6E2E()
{
    for (;;)
    {
        if ( self _meth_81cf( "stand" ) )
        {
            var_0[0] = "stand allowed";
            var_1[0] = ( 0, 1, 0 );
        }
        else
        {
            var_0[0] = "stand not allowed";
            var_1[0] = ( 1, 0, 0 );
        }

        if ( self _meth_81cf( "crouch" ) )
        {
            var_0[1] = "crouch allowed";
            var_1[1] = ( 0, 1, 0 );
        }
        else
        {
            var_0[1] = "crouch not allowed";
            var_1[1] = ( 1, 0, 0 );
        }

        if ( self _meth_81cf( "prone" ) )
        {
            var_0[2] = "prone allowed";
            var_1[2] = ( 0, 1, 0 );
        }
        else
        {
            var_0[2] = "prone not allowed";
            var_1[2] = ( 1, 0, 0 );
        }

        var_2 = self getshootatpos() + ( 0, 0, 30 );
        var_3 = ( 0, 0, -10 );

        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
            var_5 = ( var_2[0] + var_3[0] * var_4, var_2[1] + var_3[1] * var_4, var_2[2] + var_3[2] * var_4 );

        wait 0.05;
    }
}

_id_8340()
{
    if ( !isdefined( self._id_0C78 ) || !isdefined( self._id_5F65 ) )
        _id_7DBE();
}

_id_7DBE()
{
    self._id_0C78 = 0.9 + randomfloat( 0.2 );
    self._id_5F97 = 0.9 + randomfloat( 0.2 );
    self._id_5F65 = 1;
    self._id_855F = 1.35;
}

_id_4C5B( var_0, var_1, var_2, var_3 )
{
    anim waittill( "new exceptions" );
}

empty( var_0, var_1, var_2, var_3 )
{

}

_id_32B6()
{
    self endon( "death" );

    if ( 1 )
        return;

    for (;;)
    {
        self waittill( "enemy" );

        if ( !isalive( self.enemy ) )
            continue;

        while ( isplayer( self.enemy ) )
        {
            if ( animscripts\utility::_id_472C() )
                level._id_55CC = gettime();

            wait 2;
        }
    }
}

_id_4E33()
{
    level._id_A338[0] = -36.8552;
    level._id_A338[1] = -27.0095;
    level._id_A338[2] = -15.5981;
    level._id_A338[3] = -4.37769;
    level._id_A338[4] = 17.7776;
    level._id_A338[5] = 59.8499;
    level._id_A338[6] = 104.808;
    level._id_A338[7] = 152.325;
    level._id_A338[8] = 201.052;
    level._id_A338[9] = 250.244;
    level._id_A338[10] = 298.971;
    level._id_A338[11] = 330.681;
}

_id_381E()
{
    if ( isdefined( anim._id_61F8 ) )
        return;

    anim._id_61F8 = 1;
    animscripts\animset::_id_4C76();
    anim._id_9BFF = 0;
    maps\_load::_id_4D06();
    level.playercardbackground._id_4FA7 = 0;
    level._id_60CB = randomint( 3 );
    level._id_55CC = 100;
    anim._id_2796 = ::empty;
    _id_4DA9();
    setdvar( "scr_expDeathMayMoveCheck", "on" );
    maps\_names::_id_8241();
    anim._id_0C6E = 0;
    animscripts\init_move_transitions::_id_4DF3();
    anim._id_20AE = 10000;
    anim._id_20AF = 6000;
    _id_4DC2();
    _id_4D7D();

    if ( !isdefined( anim._id_6548 ) )
    {
        anim._id_654A = animscripts\notetracks::_id_6DA1;
        anim._id_6548 = animscripts\notetracks::_id_6DA0;
    }

    if ( !isdefined( anim._id_6549 ) )
        anim._id_6549 = [];

    if ( !isdefined( anim._id_654B ) )
        anim._id_654B = [];

    if ( !isdefined( anim._id_83F3 ) )
        anim._id_83F3 = animscripts\utility::_id_83F5;

    if ( !isdefined( anim._id_8413 ) )
        anim._id_8413 = animscripts\utility::_id_8412;

    anim._id_37BF["scripted"] = animscripts\notetracks::_id_37C7;
    anim._id_37BF["cover_right"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_left"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_crouch"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_stand"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["move"] = animscripts\notetracks::_id_840D;
    animscripts\notetracks::_id_72F3();

    if ( !isdefined( level._id_382E ) )
        common_scripts\utility::_id_4CF0();

    maps\_gameskill::_id_8010();
    level._id_6650 = undefined;
    animscripts\setposemovement::_id_4E02();
    animscripts\face::_id_4DEF();
    anim._id_1931 = animscripts\utility::_id_0CD8( 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5 );
    anim._id_3674 = animscripts\utility::_id_0CD8( 2, 3, 3, 3, 4, 4, 4, 5, 5 );
    anim._id_7C7A = animscripts\utility::_id_0CD8( 1, 2, 2, 3, 3, 4, 4, 4, 4, 5, 5, 5 );
    anim._id_126A = [];
    anim._id_1267 = 0;
    anim.playercardbackground = getentarray( "player", "classname" )[0];
    _id_4D8C();
    _id_4E33();
    animscripts\cqb::_id_8308();
    _id_4DA7();
    _id_7F7C();
    anim._id_5583 = -100000;
    _id_8335();
    level.playercardbackground thread animscripts\combat_utility::_id_A250();
    thread _id_09A7();
}

_id_4DA9()
{

}

_id_4D8C()
{
    animscripts\squadmanager::_id_4D5F();
    anim.playercardbackground thread animscripts\squadmanager::_id_081E();
    animscripts\battlechatter::_id_4CB8();
    anim.playercardbackground thread animscripts\battlechatter_ai::_id_0850();
    anim thread animscripts\battlechatter::_id_1356();
}

_id_4DA7()
{
    anim._id_629A = randomintrange( 0, 15 );
    anim._id_6299 = randomintrange( 0, 10 );
    anim._id_60C7 = gettime() + randomintrange( 0, 20000 );
    anim._id_60C8 = gettime() + randomintrange( 0, 10000 );
    anim._id_60C6 = gettime() + randomintrange( 0, 15000 );
}

_id_4DC2()
{
    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        var_1 = level.players[var_0];
        var_1._id_440D["fraggrenade"] = randomintrange( 1000, 20000 );
        var_1._id_440D["flash_grenade"] = randomintrange( 1000, 20000 );
        var_1._id_440D["double_grenade"] = randomintrange( 1000, 60000 );
        var_1._id_440D["microwave_grenade"] = randomintrange( 1000, 20000 );
        var_1._id_62A3 = 0;
        var_1._id_55A4 = -1000000;
        var_1._id_55A2 = -1000000;
        var_1 thread _id_7FBE();
    }

    anim._id_440D["AI_fraggrenade"] = randomintrange( 0, 20000 );
    anim._id_440D["AI_flash_grenade"] = randomintrange( 0, 20000 );
    anim._id_440D["AI_smoke_grenade_american"] = randomintrange( 0, 20000 );
    anim._id_440D["AI_microwave_grenade"] = randomintrange( 0, 20000 );
    animscripts\combat_utility::_id_4DC3();
}

_id_4D7D()
{
    level._id_5574 = [];
    level._id_5574["axis"] = 0;
    level._id_5574["allies"] = 0;
    level._id_5574["team3"] = 0;
    level._id_5574["neutral"] = 0;
    level._id_5572 = [];
    level._id_5572["axis"] = ( 0, 0, 0 );
    level._id_5572["allies"] = ( 0, 0, 0 );
    level._id_5572["team3"] = ( 0, 0, 0 );
    level._id_5572["neutral"] = ( 0, 0, 0 );
    level._id_5573 = [];
    level._id_5573["axis"] = ( 0, 0, 0 );
    level._id_5573["allies"] = ( 0, 0, 0 );
    level._id_5573["team3"] = ( 0, 0, 0 );
    level._id_5573["neutral"] = ( 0, 0, 0 );
    level._id_5571 = [];
    level._id_0883 = [];
    level._id_0883["axis"] = 0;
    level._id_0883["allies"] = 0;
    level._id_0883["team3"] = 0;
    level._id_0883["neutral"] = 0;
    level._id_0885 = 30000;
    level._id_0884 = 3;
}

_id_09A7()
{
    var_0 = 0;
    var_1 = 3;

    for (;;)
    {
        var_2 = getaiarray();

        if ( var_2.size == 0 )
        {
            wait 0.05;
            var_0 = 0;
            continue;
        }

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( !isdefined( var_2[var_3] ) )
                continue;

            var_2[var_3] notify( "do_slow_things" );
            var_0++;

            if ( var_0 == var_1 )
            {
                wait 0.05;
                var_0 = 0;
            }
        }
    }
}

_id_7FBE()
{
    waitframe;

    if ( isdefined( self._id_4441._id_6CB4 ) )
    {
        var_0 = int( self._id_4441._id_6CB4 * 0.7 );

        if ( var_0 < 1 )
            var_0 = 1;

        self._id_440D["fraggrenade"] = randomintrange( 0, var_0 );
        self._id_440D["flash_grenade"] = randomintrange( 0, var_0 );
        self._id_440D["microwave_grenade"] = randomintrange( 0, var_0 );
    }

    if ( isdefined( self._id_4441._id_6C95 ) )
    {
        var_0 = int( self._id_4441._id_6C95 );
        var_1 = int( var_0 / 2 );

        if ( var_0 <= var_1 )
            var_0 = var_1 + 1;

        self._id_440D["double_grenade"] = randomintrange( var_1, var_0 );
    }
}

_id_139C()
{
    if ( isdefined( level._id_2B15 ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_0 thread maps\_utility::_id_43E9();
    }
}

_id_8335()
{
    anim._id_7125 = 60;
    anim._id_7124 = [];

    for ( var_0 = 0; var_0 < anim._id_7125; var_0++ )
        anim._id_7124[var_0] = var_0;

    for ( var_0 = 0; var_0 < anim._id_7125; var_0++ )
    {
        var_1 = randomint( anim._id_7125 );
        var_2 = anim._id_7124[var_0];
        anim._id_7124[var_0] = anim._id_7124[var_1];
        anim._id_7124[var_1] = var_2;
    }
}

_id_6467()
{
    if ( isdefined( level._id_2B2B ) )
        return;

    self waittill( "death" );

    if ( !isdefined( self ) )
    {
        if ( isdefined( self.a._id_9C3C ) )
            self.a._id_9C3C delete();
    }
}
