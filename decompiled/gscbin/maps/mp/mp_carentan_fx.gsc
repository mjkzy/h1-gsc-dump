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
    level._id_058F["spotlight_dragon_short_mp_carentan"] = loadfx( "vfx/map/mp_carentan/spotlight_dragon_short_mp_carentan" );
    level._id_058F["spotlight_dragon_long_mp_carentan"] = loadfx( "vfx/map/mp_carentan/spotlight_dragon_long_mp_carentan" );
    level._id_058F["steam_manhole_sml_mp_carentan"] = loadfx( "vfx/map/mp_carentan/steam_manhole_sml_mp_carentan" );
    level._id_058F["steam_manhole_mp_carentan"] = loadfx( "vfx/map/mp_carentan/steam_manhole_mp_carentan" );
    level._id_058F["drips_med_edge_mp_carentan"] = loadfx( "vfx/map/mp_carentan/drips_med_edge_mp_carentan" );
    level._id_058F["drips_med_mp_carentan"] = loadfx( "vfx/map/mp_carentan/drips_med_mp_carentan" );
    level._id_058F["clouds_hemisphere_2_mp_carentan"] = loadfx( "vfx/map/mp_carentan/clouds_hemisphere_2_mp_carentan" );
    level._id_058F["fog_ground_mp_carentan"] = loadfx( "vfx/map/mp_carentan/fog_ground_mp_carentan" );
    level._id_058F["steam_building_side_vent_wisp"] = loadfx( "vfx/steam/steam_building_side_vent_wisp" );
    level._id_058F["hallway_smoke_light"] = loadfx( "vfx/smoke/hallway_smoke_light" );
    level._id_058F["battlefield_smokebank_s"] = loadfx( "vfx/smoke/battlefield_smokebank_s" );
    level._id_058F["battlefield_smokebank_wisp"] = loadfx( "vfx/smoke/battlefield_smokebank_wisp" );
    level._id_058F["insects_fruit"] = loadfx( "vfx/animal/insects_fruitflies_flying_carentan" );
    level._id_058F["insects_firefly"] = loadfx( "vfx/animal/insects_firefly_carentan" );
    level._id_058F["insects_night"] = loadfx( "vfx/animal/insects_moths_carentan" );
    level._id_058F["tree_leaves"] = loadfx( "vfx/wind/leaves_fall_mp_carentan" );
    level._id_058F["spark_electric"] = loadfx( "vfx/sparks/spark_idle_carentan" );
    level._id_058F["moonrays_window"] = loadfx( "vfx/lights/moonray_mp_carentan" );
    level._id_058F["moonrays_window_2"] = loadfx( "vfx/lights/moonray_mp_carentan_2" );
    level._id_058F["spotlight_inside"] = loadfx( "vfx/lights/spotlight_mp_carentan" );
    level._id_058F["fluorescent_beam"] = loadfx( "vfx/lights/fluorescent_mp_carentan" );
    level._id_058F["floodlight_beam"] = loadfx( "vfx/lights/floodlight_mp_carentan" );
    level._id_058F["light_city_fake"] = loadfx( "vfx/lights/light_city_fake_mp_carentan" );
    level._id_058F["fridge_mist"] = loadfx( "vfx/smoke/fridge_mist_mp_carentan" );
    level._id_058F["fridge_mist_dark"] = loadfx( "vfx/smoke/fridge_mist_dark_mp_carentan" );
    level._id_058F["steam_building_column_noshdw"] = loadfx( "vfx/steam/steam_building_rising" );
    level._id_058F["steam_building_column_sml_noshdw"] = loadfx( "vfx/steam/steam_building_rising_2" );
    level._id_058F["steam_building_column_big_noshdw"] = loadfx( "vfx/steam/steam_building_rising_3" );
    level._id_058F["steam_building_column_tiny_noshdw"] = loadfx( "vfx/steam/steam_building_rising_4" );
    level._id_058F["steam_building_column"] = loadfx( "vfx/steam/steam_building_rising_shadow" );
    level._id_058F["steam_building_column_sml"] = loadfx( "vfx/steam/steam_building_rising_2_shadow" );
    level._id_058F["steam_building_column_big"] = loadfx( "vfx/steam/steam_building_rising_3_shadow" );
    level._id_058F["steam_building_vent"] = loadfx( "vfx/steam/steam_building_side_vent" );
    level._id_058F["steam_building_vent_lower"] = loadfx( "vfx/steam/steam_building_side_vent_2" );
    level._id_058F["steam_building_vent_push"] = loadfx( "vfx/steam/steam_building_side_vent_push" );
    level._id_058F["steam_building_vent_top"] = loadfx( "vfx/steam/steam_building_vent_top" );
    level._id_058F["steam_building_vent_top_sml"] = loadfx( "vfx/steam/steam_building_vent_top_sml" );
    level._id_058F["moonflare"] = loadfx( "vfx/lensflare/fx_sunflare_mp_carentan" );
    level._id_058F["debug_vfx_axis"] = loadfx( "vfx/test/debug_axis" );
}
