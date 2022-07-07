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

codecallback_agentadded()
{
    maps\mp\agents\_agent_utility::_id_4D7F();
    var_0 = "axis";

    if ( level._id_628E % 2 == 0 )
        var_0 = "allies";

    level._id_628E++;
    maps\mp\agents\_agent_utility::_id_7DB1( var_0 );
    level.agentarray[level.agentarray.size] = self;
}

codecallback_agentdamaged( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_1 = maps\mp\_utility::_id_0683( var_1 );
    self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_agentkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_1 = maps\mp\_utility::_id_0683( var_1 );
    self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "on_killed" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

init()
{
    _id_4D7E();
    level thread _id_072F();
}

_id_214C( var_0, var_1, var_2 )
{
    var_3 = maps\mp\agents\_agent_utility::_id_3FA2( var_0 );

    if ( isdefined( var_3 ) )
    {
        var_3.connecttime = gettime();

        if ( isdefined( var_1 ) )
            var_3 maps\mp\agents\_agent_utility::_id_7DB1( var_1 );
        else
            var_3 maps\mp\agents\_agent_utility::_id_7DB1( var_3.team );

        if ( isdefined( var_2 ) )
            var_3._id_1E30 = var_2;

        if ( isdefined( level.agent_funcs[var_0]["onAIConnect"] ) )
            var_3 [[ var_3 maps\mp\agents\_agent_utility::_id_08A6( "onAIConnect" ) ]]();

        var_3 maps\mp\gametypes\_spawnlogic::addtocharactersarray();
    }

    return var_3;
}

_id_4D7E()
{
    level.agentarray = [];
    level._id_628E = 0;
}

_id_072F()
{
    level endon( "game_ended" );
    level waittill( "connected", var_0 );
    var_1 = getmaxagents();

    while ( level.agentarray.size < var_1 )
    {
        var_2 = addagent();

        if ( !isdefined( var_2 ) )
        {
            waittillframeend;
            continue;
        }
    }
}

_id_7DB0( var_0 )
{
    self.agenthealth = var_0;
    self.helmet = var_0;
    self.maxturnspeed = var_0;
}
