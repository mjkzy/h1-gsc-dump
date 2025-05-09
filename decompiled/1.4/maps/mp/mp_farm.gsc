// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_farm_precache::main();
    maps\mp\mp_farm_fx::main();
    maps\createart\mp_farm_art::main();
    maps\mp\_load::main();
    maps\mp\_water::init();
    maps\mp\_compass::setupminimap( "compass_map_mp_farm" );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
    setdvar( "compassmaxrange", "2000" );
    maps\mp\_fx_trigger::main();
}
