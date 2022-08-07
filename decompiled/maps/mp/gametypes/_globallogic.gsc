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

init()
{
    level.splitscreen = issplitscreen();
    level.pushable = getdvar( "ps3Game" ) == "true";
    level.xuid = getdvar( "xenonGame" ) == "true";
    level.console = getdvar( "consoleGame" ) == "true";
    level.onlinegame = isonlinegame();
    level.rankedmatch = level.onlinegame && !getdvarint( "xblive_privatematch" );
    level.script_context = tolower( getdvar( "mapname" ) );

    if ( getdvarint( "virtualLobbyActive", 0 ) )
        level.gametype = "vlobby";
    else
        level.gametype = tolower( getdvar( "g_gametype" ) );

    level.teamnamelist = [ "axis", "allies" ];
    level._id_65B3["allies"] = "axis";
    level._id_65B3["axis"] = "allies";
    level.multiteambased = 0;
    level.teambased = 0;
    level._id_62F8 = 0;
    level._id_3163 = 1;
    level.showingfinalkillcam = 0;
    level.classicgamemode = 0;
    level.disablesprint = 0;
    level.killstreak_kills = 1;
    level._id_9386 = getdvarint( "scr_tispawndelay" );

    if ( !isdefined( level.tweakablesinitialized ) )
        maps\mp\gametypes\_tweakables::init();

    precachestring( &"MP_HALFTIME" );
    precachestring( &"MP_OVERTIME" );
    precachestring( &"MP_ROUNDEND" );
    precachestring( &"MP_INTERMISSION" );
    precachestring( &"MP_SWITCHING_SIDES" );
    precachestring( &"MP_FRIENDLY_FIRE_WILL_NOT" );
    precachestring( &"MP_SUICIDE_PUNISHED" );
    precachestring( &"PLATFORM_REVIVE" );
    precachestring( &"MP_OBITUARY_NEUTRAL" );
    precachestring( &"MP_OBITUARY_FRIENDLY" );
    precachestring( &"MP_OBITUARY_ENEMY" );

    if ( level.splitscreen )
        precachestring( &"MP_ENDED_GAME" );
    else
        precachestring( &"MP_HOST_ENDED_GAME" );

    level._id_44FF = "halftime";
    level._id_44FD = 0;
    level.halftimeonscorelimitsettimetobeat = 1;
    level.laststatustime = 0;
    level.waswinning = "none";
    level._id_55DC = 0;
    level.placement["allies"] = [];
    level.placement["axis"] = [];
    level.placement["all"] = [];
    level._id_6E8C = 5.0;
    level._id_6D59 = [];
    _id_72EE();
    precachemodel( "tag_origin" );
    level._id_91ED["allies"] = 0;
    level._id_91ED["axis"] = 0;
    level._id_91ED["spectator"] = 0;
    level._id_09DD["allies"] = 0;
    level._id_09DD["axis"] = 0;
    level._id_09DD["spectator"] = 0;
    level._id_57B9["allies"] = 0;
    level._id_57B9["axis"] = 0;
    level._id_648B = [];
    level._id_4745["allies"] = 0;
    level._id_4745["axis"] = 0;
    var_0 = 9;
    _id_4D1D( var_0 );
}

_id_4D1D( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = "team_" + var_1;
        level.placement[var_2] = [];
        level._id_91ED[var_2] = 0;
        level._id_09DD[var_2] = 0;
        level._id_57B9[var_2] = 0;
        level._id_4745[var_2] = 0;
    }
}

_id_72EE()
{
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_nuke_end_milliseconds", 0 );
    setdvar( "ui_danger_team", "" );
    setdvar( "ui_inhostmigration", 0 );
    setdvar( "camera_thirdPerson", getdvarint( "scr_thirdPerson" ) );
}

setupcallbacks()
{
    level._id_64FE = ::_id_64FE;
    level.getspawnpoint = ::_id_148E;
    level._id_64E9 = ::_id_148E;
    level._id_64E2 = ::_id_148E;
    level._id_64F0 = maps\mp\gametypes\_gamelogic::_id_2787;
    level._id_64B2 = maps\mp\gametypes\_gamelogic::_id_2785;
    level._id_6466 = maps\mp\gametypes\_gamelogic::_id_2784;
    level._id_64C0 = maps\mp\gametypes\_gamelogic::_id_2786;
    level._id_64DA = ::_id_148E;
    level.onstartgametype = ::_id_148E;
    level._id_64D3 = ::_id_148E;
    level._id_112A = maps\mp\gametypes\_menus::_id_112A;
}

_id_3FCF()
{
    return maps\mp\gametypes\_gamelogic::_id_3FCF();
}

_id_148E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{

}

_id_92B0()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 10.0;
        var_0 = spawnstruct();
        var_0._id_93A2 = &"MP_CHALLENGE_COMPLETED";
        var_0._id_6238 = "wheee";
        var_0._id_8899 = "mp_challenge_complete";
        thread maps\mp\gametypes\_hud_message::_id_622E( var_0 );
    }
}

_id_92B1()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 3.0;
        var_0 = randomint( 6 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            iprintlnbold( var_0 );
            self shellshock( "frag_grenade_mp", 0.2 );
            wait 0.1;
        }
    }
}

_id_64FE( var_0 )
{
    level thread maps\mp\gametypes\_rank::_id_1208( var_0, self );
}

_id_2729( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 50; var_2++ )
        wait 0.05;
}
