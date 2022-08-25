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
        [[ level.callbackstartgametype ]]();
        level._id_3C03 = 1;
    }
}

codecallback_playerconnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level.callbackplayerconnect ]]();
}

codecallback_playerdisconnect( var_0 )
{
    self notify( "disconnect" );
    [[ level.callbackplayerdisconnect ]]( var_0 );
}

codecallback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerkilled ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playergrenadesuicide( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );
    [[ level.callbackplayergrenadesuicide ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

codecallback_entityoutofworld()
{
    self endon( "disconnect" );
    [[ level.callbackentityoutofworld ]]();
}

codecallback_bullethitentity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self.bullethitcallback ) )
        [[ self.bullethitcallback ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
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
    [[ level.callbackcodeendgame ]]();
}

codecallback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerlaststand ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level.callbackplayermigrated ]]();
}

codecallback_hostmigration()
{
    [[ level.callbackhostmigration ]]();
}

_id_2000( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0.team == "spectator" || var_0.sessionstate == "spectator" )
        return;
}

codecallback_givekillstreakmodule( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0.team == "spectator" || var_0.sessionstate == "spectator" )
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
    level._id_4B58 = 4;
    level._id_4B5C = 8;
    level._id_4B61 = 16;
    level._id_4B5E = 32;
    level._id_4B5F = 64;
    level._id_4B60 = 128;
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
    level.callbackstartgametype = maps\mp\gametypes\_gamelogic::callback_startgametype;
    level.callbackplayerconnect = maps\mp\gametypes\_playerlogic::callback_playerconnect;
    level.callbackplayerdisconnect = maps\mp\gametypes\_playerlogic::callback_playerdisconnect;
    level.callbackplayerdamage = maps\mp\gametypes\_damage::callback_playerdamage;
    level.callbackplayerkilled = maps\mp\gametypes\_damage::callback_playerkilled;
    level.callbackentityoutofworld = maps\mp\gametypes\_damage::callback_entityoutofworld;
    level.callbackplayergrenadesuicide = maps\mp\gametypes\_damage::callback_playergrenadesuicide;
    level.callbackcodeendgame = maps\mp\gametypes\_gamelogic::callback_codeendgame;
    level.callbackplayerlaststand = maps\mp\gametypes\_damage::callback_playerlaststand;
    level.callbackplayermigrated = maps\mp\gametypes\_playerlogic::callback_playermigrated;
    level.callbackhostmigration = maps\mp\gametypes\_hostmigration::callback_hostmigration;
}

abortlevel()
{
    level.callbackstartgametype = ::callbackvoid;
    level.callbackplayerconnect = ::callbackvoid;
    level.callbackplayerdisconnect = ::callbackvoid;
    level.callbackplayerdamage = ::callbackvoid;
    level.callbackplayerkilled = ::callbackvoid;
    level.callbackentityoutofworld = ::callbackvoid;
    level.callbackplayergrenadesuicide = ::callbackvoid;
    level.callbackcodeendgame = ::callbackvoid;
    level.callbackplayerlaststand = ::callbackvoid;
    level.callbackplayermigrated = ::callbackvoid;
    level.callbackhostmigration = ::callbackvoid;
    setdvar( "g_gametype", "dm" );
    exitlevel( 0 );
}

callbackvoid()
{

}
