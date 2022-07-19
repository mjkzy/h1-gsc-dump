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

codecallback_startgametype()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    if ( !isdefined( level._id_3C03 ) || !level._id_3C03 )
    {
        [[ level._id_1A05 ]]();
        level._id_3C03 = 1;
    }
}

codecallback_playerconnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level._id_19FD ]]();
}

codecallback_playerdisconnect( var_0 )
{
    self notify( "disconnect" );
    [[ level._id_19FF ]]( var_0 );
}

codecallback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A01 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playergrenadesuicide( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );
    [[ level._id_1A00 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

codecallback_entityoutofworld()
{
    self endon( "disconnect" );
    [[ level._id_19FB ]]();
}

codecallback_bullethitentity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_18AC ) )
        [[ self._id_18AC ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
}

codecallback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258E ) )
        self [[ self._id_258E ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self finishdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_entitydamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258E ) )
        self [[ self._id_258E ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self _meth_8492( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_codeendgame()
{
    self endon( "disconnect" );
    [[ level._id_19FA ]]();
}

codecallback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A02 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level._id_1A03 ]]();
}

codecallback_hostmigration()
{
    [[ level._id_19FC ]]();
}

_id_2000( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0.team == "spectator" || var_0.sharpturnlookaheaddist == "spectator" )
        return;
}

codecallback_givekillstreakmodule( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0.team == "spectator" || var_0.sharpturnlookaheaddist == "spectator" )
        return;
}

codecallback_partymembers( var_0 )
{
    if ( isdefined( level._id_66A9 ) )
        [[ level._id_66A9 ]]( var_0 );
}

_id_830C()
{
    level._id_4B5D = 1;
    level._id_4B57 = 2;
    level.idflags_no_knockback = 4;
    level._id_4B5C = 8;
    level.idflags_stun = 16;
    level.idflags_shield_explosive_impact = 32;
    level.idflags_shield_explosive_impact_huge = 64;
    level.idflags_shield_explosive_splash  = 128;
    level._id_4B5A = 256;
    level._id_4B59 = 512;
    level._id_4B5B = 1024;
}

setupcallbacks()
{
    _id_7F47();
    _id_830C();
}

_id_7F47()
{
    level._id_1A05 = maps\mp\gametypes\_gamelogic::_id_19F9;
    level._id_19FD = maps\mp\gametypes\_playerlogic::_id_19F0;
    level._id_19FF = maps\mp\gametypes\_playerlogic::_id_19F3;
    level.callbackplayerdamage = maps\mp\gametypes\_damage::_id_19F1;
    level._id_1A01 = maps\mp\gametypes\_damage::callback_playerdamage;
    level._id_19FB = maps\mp\gametypes\_damage::_id_19ED;
    level._id_1A00 = maps\mp\gametypes\_damage::_id_19F4;
    level._id_19FA = maps\mp\gametypes\_gamelogic::_id_19EC;
    level._id_1A02 = maps\mp\gametypes\_damage::_id_19F6;
    level._id_1A03 = maps\mp\gametypes\_playerlogic::_id_19F8;
    level._id_19FC = maps\mp\gametypes\_hostmigration::_id_19EE;
}

_id_06BF()
{
    level._id_1A05 = ::_id_1A06;
    level._id_19FD = ::_id_1A06;
    level._id_19FF = ::_id_1A06;
    level.callbackplayerdamage = ::_id_1A06;
    level._id_1A01 = ::_id_1A06;
    level._id_19FB = ::_id_1A06;
    level._id_1A00 = ::_id_1A06;
    level._id_19FA = ::_id_1A06;
    level._id_1A02 = ::_id_1A06;
    level._id_1A03 = ::_id_1A06;
    level._id_19FC = ::_id_1A06;
    setdvar( "g_gametype", "dm" );
    exitlevel( 0 );
}

_id_1A06()
{

}
