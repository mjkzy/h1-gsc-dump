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
    level._id_0B47["exterior"] = "ambient_village_assault_ext0";
    level._id_0B47["exterior1"] = "ambient_village_assault_ext1";
    level._id_0B47["exterior2"] = "ambient_village_assault_ext2";
    level._id_0B47["exterior3"] = "ambient_village_assault_ext3";
    thread maps\_utility::_id_7DB9( "exterior2" );
    maps\_ambient::_id_0B4F( "exterior", 2.0, 8.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_wind_leafy", 12.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_anml_wolf", 1.5 );
    maps\_ambient::_id_0B50( "exterior", "elm_anml_owl", 2.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_anml_nocturnal_birds", 1.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_dog", 0.5 );
    maps\_ambient::_id_0B50( "exterior", "null", 0.3 );
    maps\_ambient::_id_0B4F( "exterior1", 2.0, 8.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_wind_leafy", 12.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_anml_wolf", 0.5 );
    maps\_ambient::_id_0B50( "exterior1", "elm_anml_owl", 1.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_anml_nocturnal_birds", 0.5 );
    maps\_ambient::_id_0B50( "exterior1", "elm_dog", 0.25 );
    maps\_ambient::_id_0B50( "exterior1", "elm_jet_flyover_dist", 0.1 );
    maps\_ambient::_id_0B50( "exterior1", "elm_explosions_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_gunfire_50cal_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_gunfire_ak47_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior1", "elm_gunfire_m16_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior1", "null", 0.3 );
    maps\_ambient::_id_0B4F( "exterior2", 2.0, 8.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_wind_leafy", 12.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_anml_wolf", 0.5 );
    maps\_ambient::_id_0B50( "exterior2", "elm_anml_owl", 1.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_anml_nocturnal_birds", 0.5 );
    maps\_ambient::_id_0B50( "exterior2", "elm_dog", 0.25 );
    maps\_ambient::_id_0B50( "exterior2", "elm_jet_flyover_dist", 0.1 );
    maps\_ambient::_id_0B50( "exterior2", "elm_explosions_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_gunfire_50cal_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_gunfire_ak47_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior2", "elm_gunfire_m16_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior2", "walla_rus_mountain_conv", 1.0 );
    maps\_ambient::_id_0B50( "exterior2", "null", 0.3 );
    maps\_ambient::_id_0B4F( "exterior3", 2.0, 8.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_wind_leafy", 12.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_anml_wolf", 0.5 );
    maps\_ambient::_id_0B50( "exterior3", "elm_anml_owl", 1.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_anml_nocturnal_birds", 0.5 );
    maps\_ambient::_id_0B50( "exterior3", "elm_dog", 0.25 );
    maps\_ambient::_id_0B50( "exterior3", "elm_jet_flyover_dist", 0.1 );
    maps\_ambient::_id_0B50( "exterior3", "elm_explosions_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_explosions_med", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_artillery_med", 1.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_50cal_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_50cal_med", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_ak47_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_ak47_med", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_m16_dist", 3.0 );
    maps\_ambient::_id_0B50( "exterior3", "elm_gunfire_m16_med", 3.0 );
    maps\_ambient::_id_0B50( "exterior2", "walla_rus_mountain_battle", 1.0 );
    maps\_ambient::_id_0B50( "exterior2", "walla_rus_mountain_chatter", 1.0 );
    maps\_ambient::_id_0B50( "exterior3", "null", 0.3 );
    maps\_ambient::_id_0B51( "exterior2" );
    level waittill( "action moment" );
    maps\_ambient::_id_0B51( "action ambient" );
}
