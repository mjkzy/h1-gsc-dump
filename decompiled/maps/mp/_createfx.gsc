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

_id_2402()
{
    level._id_3AEE = common_scripts\utility::_id_9F36;
    level._id_3AEF = ::_id_3AEF;
    level._id_3AEB = common_scripts\_fx::_id_5883;
    level._id_3AEC = common_scripts\_fx::_id_64A0;
    level._id_3AE6 = common_scripts\_fx::_id_23CA;
    level._id_3AF1 = common_scripts\_createfx::_id_748A;
    level._id_3AF0 = common_scripts\_createfx::_id_6FEC;
    level._id_3AED = ::_id_3AED;
    level.mp_createfx = 1;
    level._id_1A05 = common_scripts\utility::_id_9F36;
    level._id_19FD = common_scripts\utility::_id_9F36;
    level._id_19FF = common_scripts\utility::_id_9F36;
    level.callbackplayerdamage = common_scripts\utility::_id_9F36;
    level._id_1A01 = common_scripts\utility::_id_9F36;
    level._id_19FB = common_scripts\utility::_id_9F36;
    level._id_19FA = common_scripts\utility::_id_9F36;
    level._id_1A02 = common_scripts\utility::_id_9F36;
    level._id_19FD = ::_id_19F0;
    level._id_1A03 = common_scripts\utility::_id_9F36;
    maps\mp\gametypes\_gameobjects::main( [] );
    maps\mp\gametypes\_oldschool::deletepickups();
    thread common_scripts\_createfx::_id_3AE8();
    common_scripts\_createfx::_id_2407();
    level waittill( "eternity" );
}

_id_3AEF( var_0 )
{
    return level.playercardbackground.origin;
}

_id_19F0()
{
    self waittill( "begin" );

    if ( !isdefined( level.playercardbackground ) )
    {
        var_0 = getentarray( "mp_global_intermission", "classname" );
        var_1 = ( var_0[0].angles[0], var_0[0].angles[1], 0.0 );
        self spawnspectator( var_0[0].origin, var_1 );
        maps\mp\_utility::_id_9B69( "playing" );
        self.maxturnspeed = 10000000;
        self.helmet = 10000000;
        level.playercardbackground = self;
        thread common_scripts\_createfx::_id_241B();
    }
    else
        kick( self getentitynumber() );
}

_id_3AED()
{
    var_0 = level._createfx.player_speed / 190;
    level.playercardbackground setmovespeedscale( var_0 );
}
