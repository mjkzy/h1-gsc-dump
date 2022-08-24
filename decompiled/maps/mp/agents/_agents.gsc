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
    if ( isdefined( level._id_2409 ) && level._id_2409 )
        return;

    _id_8072();
    level._id_1262 = ::badplace_cylinder;
    level._id_1263 = ::badplace_delete;
    level thread maps\mp\agents\_agent_common::init();

    if ( !maps\mp\_utility::_id_4FA6() && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
        return;
}

_id_8072()
{
    if ( !isdefined( level.agent_funcs ) )
        level.agent_funcs = [];

    if ( !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        level.agent_funcs["player"] = [];
        level.agent_funcs["player"]["spawn"] = ::_id_88C2;
        level.agent_funcs["player"]["think"] = maps\mp\bots\_bots_gametype_war::_id_1731;
        level.agent_funcs["player"]["on_killed"] = ::_id_643B;
        level.agent_funcs["player"]["on_damaged"] = ::_id_643A;
        level.agent_funcs["player"]["on_damaged_finished"] = ::_id_0896;
    }
}

_id_9FE6()
{
    while ( !isdefined( level.agent_funcs ) )
        wait 0.05;
}

_id_0768( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = maps\mp\agents\_agent_common::_id_214C( var_0, var_1, var_2 );

    if ( isdefined( var_9 ) )
        var_9 thread [[ var_9 maps\mp\agents\_agent_utility::_id_08A6( "spawn" ) ]]( var_3, var_4, var_5, var_6, var_7, var_8 );

    return var_9;
}

_id_88C2( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    while ( !isdefined( level.getspawnpoint ) )
        waittillframeend;

    if ( self.hasdied )
        wait(randomintrange( 6, 10 ));

    maps\mp\agents\_agent_utility::_id_4DFF( 1 );

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_6 = var_0;
        var_7 = var_1;
        self._id_55DD = spawnstruct();
        self._id_55DD.origin = var_6;
        self._id_55DD.angles = var_7;
    }
    else
    {
        var_8 = self [[ level.getspawnpoint ]]();
        var_6 = var_8.origin;
        var_7 = var_8.angles;
        self._id_55DD = var_8;
    }

    maps\mp\agents\_agent_utility::_id_070B();
    self._id_55DF = gettime();
    self.spawntime = gettime();
    var_9 = var_6 + ( 0.0, 0.0, 25.0 );
    var_10 = var_6;
    var_11 = playerphysicstrace( var_9, var_10 );

    if ( distancesquared( var_11, var_9 ) > 1 )
        var_6 = var_11;

    self _meth_8388( var_6, var_7 );

    if ( isdefined( var_5 ) )
        self._id_0899 = var_5;

    if ( isdefined( self._id_0899 ) )
    {
        if ( self._id_0899 == "follow_code_and_dev_dvar" )
            maps\mp\bots\_bots_util::_id_16EB( self botgetdifficulty(), 1 );
        else
            maps\mp\bots\_bots_util::_id_16EB( var_5 );
    }
    else
        maps\mp\bots\_bots_util::_id_16EB( self botgetdifficulty() );

    if ( isdefined( var_3 ) && var_3 )
        self._id_9BE5 = 1;

    if ( isdefined( self._id_9BE5 ) && self._id_9BE5 )
    {
        if ( !self.hasdied )
        {
            var_12 = self botgetdifficultysetting( "advancedPersonality" );

            if ( isdefined( var_12 ) && var_12 != 0 )
                maps\mp\bots\_bots_personality::_id_15B0();
        }

        maps\mp\bots\_bots_personality::_id_15AD();
    }
    else
        maps\mp\bots\_bots_util::_id_16ED( "default" );

    _id_4DFC();
    maps\mp\agents\_agent_common::_id_7DB0( 100 );

    if ( isdefined( var_4 ) && var_4 )
        self._id_7472 = 1;

    if ( isdefined( var_2 ) )
        maps\mp\agents\_agent_utility::_id_7DB1( var_2.team, var_2 );

    if ( isdefined( self.owner ) )
        thread _id_28F0( self.owner );

    thread maps\mp\_flashgrenades::_id_5E5E();
    self enableanimstate( 0 );
    self [[ level._id_64E9 ]]();
    maps\mp\gametypes\_class::giveloadout( self.team, self.class, 1 );
    thread maps\mp\bots\_bots::_id_1719( 1 );
    thread maps\mp\bots\_bots_strategy::_id_1717();
    self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "think" ) ]]();

    if ( !self.hasdied )
        maps\mp\gametypes\_spawnlogic::_id_084E();

    if ( !self.hasdied )
    {
        thread maps\mp\gametypes\_weapons::_id_64D6();
        thread maps\mp\gametypes\_battlechatter_mp::_id_64D6();
    }

    self.hasdied = 0;
    thread maps\mp\gametypes\_healthoverlay::_id_6CC4();

    if ( isdefined( self._id_9BE5 ) && self._id_9BE5 && isdefined( self._id_7472 ) && self._id_7472 )
        self _meth_8520( 1 );

    level notify( "spawned_agent_player", self );
    level notify( "spawned_agent", self );
    level notify( "player_spawned", self );
    self notify( "spawned_player" );
}

_id_28F0( var_0 )
{
    self endon( "death" );
    var_0 waittill( "killstreak_disowned" );
    self notify( "owner_disconnect" );

    if ( maps\mp\gametypes\_hostmigration::_id_A0DD() )
        wait 0.05;

    self suicide();
}

_id_0896( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_0 ) || isdefined( var_1 ) )
    {
        if ( !isdefined( var_0 ) )
            var_0 = var_1;

        if ( isdefined( self._id_0AB3 ) && !self._id_0AB3 )
        {
            if ( isdefined( var_0.classname ) && var_0.classname == "script_vehicle" )
                return 0;
        }

        if ( isdefined( var_0.classname ) && var_0.classname == "auto_turret" )
            var_1 = var_0;

        if ( isdefined( var_1 ) && var_4 != "MOD_FALLING" && var_4 != "MOD_SUICIDE" )
        {
            if ( level.teambased )
            {
                if ( isdefined( var_1.team ) && var_1.team != self.team )
                    self setagentattacker( var_1 );
            }
            else
                self setagentattacker( var_1 );
        }
    }

    var_10 = self _meth_8389( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0 );

    if ( isdefined( var_10 ) )
        thread finishagentdamage_impactfxwrapper( var_10[0], var_10[1], var_10[2], var_10[3], var_10[4], var_10[5], var_10[6] );

    if ( !isdefined( self.isactive ) )
        self._id_A04A = 1;

    return 1;
}

finishagentdamage_impactfxwrapper( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    waitframe;

    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return;

    self _meth_8533( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_6439( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = isdefined( var_1 ) && isdefined( self.owner ) && self.owner == var_1;
    var_11 = maps\mp\_utility::_id_0E30( self.owner, var_1 ) || var_10;

    if ( level.teambased && var_11 && !level.friendlyfire )
        return 0;

    if ( !level.teambased && var_10 )
        return 0;

    if ( isdefined( var_4 ) && var_4 == "MOD_CRUSH" && isdefined( var_0 ) && isdefined( var_0.classname ) && var_0.classname == "script_vehicle" )
        return 0;

    if ( !isdefined( self ) || !maps\mp\_utility::_id_5189( self ) )
        return 0;

    if ( isdefined( var_1 ) && var_1.classname == "script_origin" && isdefined( var_1.type ) && var_1.type == "soft_landing" )
        return 0;

    if ( var_5 == "bouncingbetty_mp" && !maps\mp\gametypes\_weapons::_id_5C52( var_0, self ) )
        return 0;

    if ( isdefined( var_0 ) && isdefined( var_0.stuckenemyentity ) && var_0.stuckenemyentity == self )
        var_2 = self.health + 1;

    if ( var_2 <= 0 )
        return 0;

    if ( isdefined( level.modifyplayerdamage ) )
        var_2 = [[ level.modifyplayerdamage ]]( self, var_1, var_2, var_4, var_5, var_6, var_7, var_8 );

    if ( isdefined( var_1 ) && var_1 != self && var_2 > 0 && ( !isdefined( var_8 ) || var_8 != "shield" ) )
    {
        if ( var_3 & level.idflags_stun )
            var_12 = "stun";
        else if ( !maps\mp\gametypes\_damage::_id_84BD( var_5 ) )
            var_12 = "none";
        else
        {
            var_12 = "standard";

            if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            {
                if ( var_5 == "trap_zm_mp" )
                    var_12 = "none";
                else if ( var_2 < self.health )
                {
                    switch ( var_8 )
                    {
                        case "head":
                        case "helmet":
                        case "neck":
                            var_12 = "headshot";
                            break;
                    }
                }
                else
                {
                    switch ( var_8 )
                    {
                        case "head":
                        case "helmet":
                        case "neck":
                            var_12 = "killshot_headshot";
                            break;
                        default:
                            var_12 = "killshot";
                            break;
                    }
                }
            }
        }

        var_1 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( var_12 );
    }

    return self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged_finished" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_643A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = isdefined( var_1 ) && isdefined( self.owner ) && self.owner == var_1;

    if ( !level.teambased && var_10 )
        return 0;

    maps\mp\gametypes\_damage::_id_19F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_643B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_6442( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 1 );

    if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) && ( !isdefined( self._id_6153 ) || !self._id_6153 ) )
        maps\mp\gametypes\_damage::_id_64B6( var_1, var_4, var_3, var_2, "destroyed_squad_mate" );

    if ( isdefined( level._id_643B ) )
        [[ level._id_643B ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( self.isactive )
    {
        self.hasdied = 1;

        if ( maps\mp\_utility::_id_3FAA() != 1 && ( isdefined( self._id_7472 ) && self._id_7472 ) )
            self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "spawn" ) ]]();
        else
            maps\mp\agents\_agent_utility::_id_2631();
    }
}

_id_6442( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( var_9 )
        self thread [[ level._id_A2D8 ]]( var_1, var_3 );

    self.body = self _meth_838b( var_8 );
    thread maps\mp\gametypes\_damage::_id_27EE( self.body, var_6, var_5, var_4, var_0, var_3 );
}

_id_4DFC()
{
    if ( isdefined( self._id_1E30 ) )
        self.class = self._id_1E30;
    else if ( maps\mp\bots\_bots_loadout::_id_16F4() )
        self.class = "callback";
    else
        self.class = "class1";
}
