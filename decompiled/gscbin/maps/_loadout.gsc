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

_id_4D0F()
{
    _id_41CA();
    _id_A552::_id_57D8();
}

_id_41CA()
{
    if ( isdefined( level._id_2C2C ) )
        return;

    if ( !isdefined( level._id_1A3D ) )
        level._id_1A3D = "american";

    var_0 = _id_A552::_id_3DCC();
    level.playercardbackground _id_A552::_id_7F46();
    level._id_46F3 = 0;
    _id_A552::_id_67D9( "sniperescape", "scoutsniper" );
    _id_A552::_id_67D9( "launchfacility_a", "icbm" );
    _id_A552::_id_67D9( "launchfacility_b", "launchfacility_a" );
    _id_A552::_id_57D6( "killhouse", undefined, undefined, "fraggrenade", "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "cargoship", "mp5_silencer", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "coup", undefined, undefined, undefined, undefined, undefined, "american" );
    _id_A552::_id_57D6( "blackout", "m4m203_silencer_reflex", "m14_scoped_silencer_woodland", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "american" );
    _id_A552::_id_57D6( "armada", "m4_grunt", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "bog_a", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "hunted", undefined, "colt45", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "ac130", undefined, undefined, undefined, undefined, "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "bog_b", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "airlift", "m4_grenadier", "colt45", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "aftermath", undefined, undefined, undefined, undefined, "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "village_assault", "m4m203_silencer_reflex", "m1014", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "scoutsniper", "m14_scoped_silencer", "usp_silencer", "fraggrenade", undefined, "viewhands_marine_sniper", "british" );
    _id_A552::_id_57D6( "sniperescape", "m14_scoped_woodland", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_marine_sniper", "british" );
    _id_A552::_id_57D6( "village_defend", "saw", "m14_scoped_woodland", "fraggrenade", "smoke_grenade_american", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "ambush", "remington700", "colt45", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "icbm", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "launchfacility_a", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "smoke_grenade_american", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "launchfacility_b", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "jeepride", "m4_grunt", "colt45", "fraggrenade", undefined, "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "airplane", "mp5_silencer", "usp_silencer", undefined, "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "simplecredits", undefined, undefined, undefined, undefined, undefined, undefined );
    _id_A552::_id_57DB( "blackout", "c4", "claymore" );
    _id_A552::_id_57DB( "armada", undefined, "claymore" );
    _id_A552::_id_57DB( "village_assault", "c4", "cobra_air_support" );
    _id_A552::_id_57DB( "sniperescape", "c4", "claymore" );
    _id_A552::_id_57DB( "village_defend", undefined, "claymore" );
    _id_A552::_id_57DB( "icbm", "c4", "claymore" );
    _id_A552::_id_57DB( "launchfacility_a", "c4", "claymore" );
    _id_A552::_id_57DB( "launchfacility_b", "c4", "claymore" );
    _id_A552::loadoutcustomization();
    _id_A552::_id_2783();
}
