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
    maps\mp\mp_pipeline_precache::main();
    maps\mp\mp_pipeline_fx::main();
    maps\createart\mp_pipeline_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::setupminimap( "compass_map_mp_pipeline" );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    setdvar( "r_specularcolorscale", "1" );
    setdvar( "r_glowbloomintensity0", ".1" );
    setdvar( "r_glowbloomintensity1", ".1" );
    setdvar( "r_glowskybleedintensity0", ".1" );
    setdvar( "compassmaxrange", "2200" );
    thread delete_botconnect_clip();
    thread misc_rotate_ceilingfans();
    level replace_turrets();
    fix_sab_bomb();
    maps\mp\_utility::hardpointtriggerswap( ( 132.0, 3704.0, 64.0 ), "patch_hp_zone_trigger_2" );
}

fix_sab_bomb()
{
    if ( level.gametype == "sab" )
    {
        var_0 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sab_bomb" );
        var_1 = var_0[0];
        var_1.origin = ( var_1.origin[0], var_1.origin[1], var_1.origin[2] + 7.5 );
    }
}

replace_turrets()
{
    var_0 = getentarray( "misc_turret", "classname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.origin;
        var_4 = var_2.angles;
        var_2 delete();
        var_5 = spawnturret( "misc_turret", var_3, "saw_bipod_crouch_mp", 0 );
        var_5 setmodel( "weapon_saw_MG_setup" );
        var_5.angles = var_4;
    }
}

delete_botconnect_clip()
{
    for (;;)
    {
        var_0 = getent( "botconnect_delete_on_load", "targetname" );

        if ( isdefined( var_0 ) )
        {
            var_0 delete();
            break;
        }

        waittillframeend;
    }
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::array_thread( getentarray( "fan_spin", "targetname" ), ::ceilingfan_rotate_custom );
    common_scripts\utility::array_thread( getentarray( "fan_spin_slow", "targetname" ), ::ceilingfan_rotate_slow_custom );
}

ceilingfan_rotate_custom()
{
    var_0 = 600;
    var_1 = 20000;

    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_slow_custom()
{
    var_0 = 50;
    var_1 = 20000;

    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}
