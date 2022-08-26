// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_countdown_precache::main();
    maps\mp\mp_countdown_fx::main();
    maps\createart\mp_countdown_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::setupminimap( "compass_map_mp_countdown" );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    setdvar( "compassmaxrange", "2000" );
    maps\mp\_utility::headquartersradiomove( ( -844.0, -1384.0, 6.0 ), ( -844.0, -1384.0, -4.0 ) );
}
