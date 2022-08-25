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
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
    thread _id_8106();
    thread maps\_lighting::_id_694A( "firelight_motion_06", "heli_fire_01" );
    thread maps\_lighting::_id_694A( "firelight_motion_05", "gas_station_flicker_01" );
    level.default_clut = "clut_village_assault";
    level.default_lightset = "village_assault";
    level.default_visionset = "village_assault";
    level.nightvisionlightset = "village_assault_nightvision";
    _func_144( "village_assault_nightvision" );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    setsaveddvar( "sm_minSpotLightScore", "0.0001" );
    setsaveddvar( "r_specularColorScale", "4.5" );
    maps\_utility::_id_9E6E( "village_assault", 0 );
    level.player maps\_utility::set_light_set_player( "village_assault" );
    level.player _meth_848C( "clut_village_assault", 0.0 );
}

_id_8106()
{
    maps\_lighting::_id_23B3( "firelight_motion_05", ( 0.8, 0.6, 0.4 ), 1200, 20, 0.2, 0.8 );
    maps\_lighting::_id_23B3( "firelight_motion_06", ( 0.9, 0.6, 0.3 ), 1200, 20, 0.1, 0.8 );
}

goblack( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3 setshader( "black", 640, 480 );
    var_3.sort = 1;
    var_3.alpha = 0;

    if ( var_1 > 0 )
        var_3 fadeovertime( var_1 );

    var_3.alpha = 1.0;
    wait(var_1);

    if ( !isdefined( var_0 ) )
        return;

    wait(var_0);
    level notify( "fade_from_black" );
    wait 0.1;

    if ( var_2 > 0 )
        var_3 fadeovertime( var_2 );

    var_3.alpha = 0.0;
    wait(var_2);
    var_3 destroy();
}
