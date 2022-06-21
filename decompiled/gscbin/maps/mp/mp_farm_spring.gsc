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
    maps\mp\mp_farm_spring_precache::main();
    maps\mp\mp_farm_spring_fx::main();
    maps\createart\mp_farm_spring_art::main();
    _id_A74C::main();
    _id_A769::init();
    _id_A731::_id_8324( "compass_map_mp_farm_spring" );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
    setdvar( "compassmaxrange", "2000" );
    maps\mp\_fx_trigger::main();
    level replace_turrets();
    level.dd_flip_respawns = 1;
}

replace_turrets()
{
    var_0 = getentarray( "misc_turret", "classname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.owner_not;
        var_4 = var_2.angles;
        var_2 _meth_80B2();
        var_5 = spawnturret( "misc_turret", var_3, "saw_bipod_stand_mp", 0 );
        var_5 setModel( "weapon_saw_MG_setup" );
        var_5.angles = var_4;
    }
}
