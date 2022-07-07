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
    maps\mp\mp_crash_precache::main();
    maps\mp\mp_crash_fx::main();
    maps\createart\mp_crash_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::setupminimap( "compass_map_mp_crash_dlc" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    setdvar( "compassmaxrange", "1600" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    thread misc_rotate_ceilingfans();
    thread knockbadpanoffwall();
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin", "targetname" ), ::ceilingfan_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_slow", "targetname" ), ::ceilingfan_rotate_slow_custom );
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

knockbadpanoffwall()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( isbot( var_0 ) )
            continue;

        thread delayimpulsepot();
    }
}

delayimpulsepot()
{
    level notify( "delayImpulsePot" );
    level endon( "delayImpulsePot" );
    wait 1;
    physicsjitter( ( 1597, 835, 216 ), 1, 0, 100, 100 );
}
