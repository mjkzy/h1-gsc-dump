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
    maps\mp\mp_convoy_fx::main();
    maps\createart\mp_convoy_art::main();
    maps\mp\_load::main();
    maps\mp\mp_convoy_precache::main();
    maps\mp\_compass::setupMiniMap( "compass_map_mp_convoy" );
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "compassmaxrange", "2000" );
    thread delete_botconnect_clip();
    thread misc_rotate_ceilingfans();
    fix_sab_bomb();
}

fix_sab_bomb()
{
    if ( level.gametype == "sab" )
    {
        var_0 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sab_bomb" );
        var_1 = var_0[0];
        var_1.owner_not = ( var_1.owner_not[0], var_1.owner_not[1], var_1.owner_not[2] - 4 );
    }
}

delete_botconnect_clip()
{
    for (;;)
    {
        var_0 = getent( "ambush_botconnect_delete_on_load", "targetname" );

        if ( isdefined( var_0 ) )
        {
            var_0 _meth_80B2();
            break;
        }

        waittillframeend;
    }
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin", "targetname" ), ::ceilingfan_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_slow", "targetname" ), ::ceilingfan_rotate_slow_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_med", "targetname" ), ::ceilingfan_rotate_med_custom );
}

ceilingfan_rotate_custom()
{
    var_0 = 600;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_slow_custom()
{
    var_0 = 50;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_med_custom()
{
    var_0 = 150;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}
