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
    maps\mp\mp_vacant_precache::main();
    maps\mp\mp_vacant_fx::main();
    maps\createart\mp_vacant_art::main();
    maps\mp\_load::main();
    _id_A769::init();
    maps\mp\_compass::setupMiniMap( "compass_map_mp_vacant_dlc" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    thread delete_botconnect_clip();
    maps\mp\_utility::hardpointtriggerswap( ( 718, -571, 4 ), "patch_hp_zone_trigger_3" );
}

delete_botconnect_clip()
{
    for (;;)
    {
        var_0 = getent( "botconnect_delete_on_load", "targetname" );

        if ( isdefined( var_0 ) )
        {
            var_0 _meth_80B2();
            break;
        }

        waittillframeend;
    }
}
