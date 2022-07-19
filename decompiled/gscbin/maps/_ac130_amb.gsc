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
    level._id_0B47["ac130"] = "ambient_ac130_int1";
    thread _id_A5A4::_id_7DB9( "ac130" );
    maps\_ambient::_id_0B4F( "ac130", 3.0, 6.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_rattles", 4.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_beeps", 0.3 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_hydraulics", 1.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_metal_stress", 0.3 );
    maps\_ambient::_id_0B50( "ac130", "null", 1.0 );
    maps\_ambient::_id_0B51( "ac130" );
    level waittill( "action moment" );
    maps\_ambient::_id_0B51( "action ambient" );
}
