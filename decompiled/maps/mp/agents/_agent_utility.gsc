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

_id_08A6( var_0 )
{
    return level.agent_funcs[self.agent_type][var_0];
}

_id_7DB1( var_0, var_1 )
{
    self.team = var_0;
    self.agentteam = var_0;
    self.pers["team"] = var_0;
    self.owner = var_1;
    self setotherent( var_1 );
    self setentityowner( var_1 );
}

_id_4D7F()
{
    self.agent_type = "player";
    self.pers = [];
    self.hasdied = 0;
    self.isactive = 0;
    self.isagent = 1;
    self.wasti = 0;
    self.issniper = 0;
    self.spectating_cycle = 0;
    self.entity_number = self getentitynumber();
    self.agent_teamparticipant = 0;
    self.agent_gameparticipant = 0;
    self.canperformclienttraces = 0;
    self.agentname = undefined;
    self.ignoreforfixednodesafecheck = 0;
    self.ignoretriggers = 0;
    self detachall();
    _id_4DFF( 0 );
}

_id_4DFF( var_0 )
{
    if ( !var_0 )
    {
        self.class = undefined;
        self.lastclass = undefined;
        self.movespeedscaler = undefined;
        self.avoidkillstreakonspawntimer = undefined;
        self.guid = undefined;
        self.nearz = undefined;
        self._id_7811 = undefined;
        self.persistentperksunlocked = undefined;
        self.weaponlist = undefined;
        self.omaclasschanged = undefined;
        self.objectivescaler = undefined;
        self._id_940F = undefined;
        self._id_1BB6 = undefined;
        self._id_1E23 = undefined;
        self._id_1AD7 = undefined;
        self._id_535F = undefined;
        self.sharpturnnotifydist = undefined;
        self.sharpturnlookaheaddist = undefined;
        self._id_55DF = undefined;
        self._id_55DD = undefined;
        self.disabledweapon = undefined;
        self.disabledweaponswitch = undefined;
        self.disabledoffhandweapons = undefined;
        self.disabledusability = undefined;
        self._id_83C6 = undefined;
        self._id_83C5 = undefined;
    }
    else
    {
        self.movespeedscaler = level._id_1317;
        self.avoidkillstreakonspawntimer = 5;
        self.guid = maps\mp\_utility::_id_4144();
        self.nearz = self.guid;
        self.sharpturnnotifydist = self.team;
        self.sharpturnlookaheaddist = "playing";
        self._id_83C6 = 0;
        self._id_83C5 = 0;
        self.agent_gameparticipant = 1;
        maps\mp\gametypes\_playerlogic::_id_833B();

        if ( maps\mp\_utility::_id_5112( self ) )
        {
            self.objectivescaler = 1;
            maps\mp\gametypes\_gameobjects::_id_4D34();
            self.disabledweapon = 0;
            self.disabledweaponswitch = 0;
            self.disabledoffhandweapons = 0;
        }
    }

    self.disabledusability = 1;
}

_id_3FA2( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level.agentarray ) )
    {
        foreach ( var_3 in level.agentarray )
        {
            if ( ( !isdefined( var_3.isactive ) || !var_3.isactive ) && ( !isdefined( var_3._id_518D ) || !var_3._id_518D ) )
            {
                if ( isdefined( var_3._id_A04A ) && var_3._id_A04A )
                    continue;

                if ( isdefined( level.despawning_agents ) && common_scripts\utility::_id_0CE4( level.despawning_agents, var_3 ) )
                    continue;

                var_1 = var_3;
                var_1 _id_4D7F();

                if ( isdefined( var_0 ) )
                    var_1.agent_type = var_0;

                break;
            }
        }
    }

    return var_1;
}

_id_070B()
{
    self.isactive = 1;
}

_id_2631()
{
    thread _id_2632();
}

_id_2632()
{
    self notify( "deactivateAgentDelayed" );
    self endon( "deactivateAgentDelayed" );

    if ( !isdefined( level.despawning_agents ) )
        level.despawning_agents = [];

    if ( !common_scripts\utility::_id_0CE4( level.despawning_agents, self ) )
        level.despawning_agents = common_scripts\utility::_id_0CDA( level.despawning_agents, self );

    if ( maps\mp\_utility::_id_5112( self ) )
        maps\mp\gametypes\_spawnlogic::_id_73AC();

    maps\mp\gametypes\_spawnlogic::removefromcharactersarray();
    wait 0.05;
    self.isactive = 0;
    self.hasdied = 0;
    self.owner = undefined;
    self.connecttime = undefined;
    self._id_A04A = undefined;

    foreach ( var_1 in level.characters )
    {
        if ( isdefined( var_1.attackers ) )
        {
            foreach ( var_4, var_3 in var_1.attackers )
            {
                if ( var_3 == self )
                    var_1.attackers[var_4] = undefined;
            }
        }
    }

    self.headmodel = undefined;
    self detachall();
    self notify( "disconnect" );
    self _meth_8486();
    level.despawning_agents = common_scripts\utility::_id_0CF6( level.despawning_agents, self );
}

_id_4054( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    var_1 = _id_3ED9( var_0 );
    return var_1.size;
}

_id_3ED9( var_0 )
{
    var_1 = [];

    if ( !isdefined( level.agentarray ) )
        return var_1;

    foreach ( var_3 in level.agentarray )
    {
        if ( isdefined( var_3.isactive ) && var_3.isactive )
        {
            if ( var_0 == "all" || var_3.agent_type == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_4056( var_0 )
{
    return _id_4057( var_0, "all" );
}

_id_4057( var_0, var_1 )
{
    var_2 = 0;

    if ( !isdefined( level.agentarray ) )
        return var_2;

    foreach ( var_4 in level.agentarray )
    {
        if ( isdefined( var_4.isactive ) && var_4.isactive )
        {
            if ( isdefined( var_4.owner ) && var_4.owner == var_0 )
            {
                if ( var_1 == "all" || var_4.agent_type == var_1 )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_414D( var_0, var_1 )
{
    var_2 = getnodesinradius( self.origin, 350, 64, 128, "Path" );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return undefined;

    if ( isdefined( level.waterdeletez ) && isdefined( level.trigunderwater ) )
    {
        var_3 = var_2;
        var_2 = [];

        foreach ( var_5 in var_3 )
        {
            if ( var_5.origin[2] > level.waterdeletez || !ispointinvolume( var_5.origin, level.trigunderwater ) )
                var_2[var_2.size] = var_5;
        }
    }

    var_7 = anglestoforward( self.angles );
    var_8 = -10;
    var_9 = maps\mp\gametypes\_spawnlogic::_id_4091( self );
    var_10 = ( 0, 0, var_9 );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_11 = [];
    var_12 = [];

    foreach ( var_14 in var_2 )
    {
        if ( !var_14 doesnodeallowstance( "stand" ) )
            continue;

        var_15 = vectornormalize( var_14.origin - self.origin );
        var_16 = vectordot( var_7, var_15 );

        for ( var_17 = 0; var_17 < var_12.size; var_17++ )
        {
            if ( var_16 > var_12[var_17] )
            {
                for ( var_18 = var_12.size; var_18 > var_17; var_18-- )
                {
                    var_12[var_18] = var_12[var_18 - 1];
                    var_11[var_18] = var_11[var_18 - 1];
                }

                break;
            }
        }

        var_11[var_17] = var_14;
        var_12[var_17] = var_16;
    }

    for ( var_17 = 0; var_17 < var_11.size; var_17++ )
    {
        var_14 = var_11[var_17];
        var_20 = self.origin + var_10;
        var_21 = var_14.origin + var_10;

        if ( var_17 > 0 )
            wait 0.05;

        if ( !sighttracepassed( var_20, var_21, 0, self ) )
            continue;

        if ( var_1 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = playerphysicstrace( var_14.origin + var_10, var_14.origin );

            if ( distancesquared( var_22, var_14.origin ) > 1 )
                continue;
        }

        if ( var_0 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = physicstrace( var_20, var_21 );

            if ( distancesquared( var_22, var_21 ) > 1 )
                continue;
        }

        return var_14;
    }

    if ( var_11.size > 0 && isdefined( level.ishorde ) )
        return var_11[0];
}

_id_5349( var_0 )
{
    var_0 dodamage( var_0.helmet + 500000, var_0.origin );
}

_id_535A()
{
    self [[ _id_08A6( "on_damaged" ) ]]( level, undefined, self.helmet + 1, 0, "MOD_CRUSH", "none", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "none", 0 );
}
