// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_vlobby_room_precache::main();
    maps\createart\mp_vlobby_room_art::main();
    maps\mp\mp_vlobby_room_fx::main();
    maps\mp\_load::main();
    maps\mp\mp_vlobby_room_lighting::main();
    maps\mp\mp_vlobby_room_aud::main();
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    maps\mp\_vl_base::vl_init();
}
