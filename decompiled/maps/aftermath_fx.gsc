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
    level thread _id_6EDB();
    maps\createfx\aftermath_fx::main();
    maps\createfx\aftermath_sound::main();
}

_id_6EDB()
{
    level._effect["ash_turb_aftermath"] = loadfx( "fx/weather/ash_turb_aftermath" );
    level._effect["ash_turb_aftermath_windows"] = loadfx( "fx/weather/ash_turb_aftermath_windows" );
    level._effect["ash_turb_aftermath_heli"] = loadfx( "fx/weather/ash_turb_aftermath_heli" );
    level._effect["nuke_bg"] = loadfx( "fx/explosions/nuke_bg" );
    level._effect["fallout_aftermath"] = loadfx( "fx/dust/fallout_aftermath" );
    level._effect["sand_aftermath"] = loadfx( "fx/dust/sand_aftermath" );
    level._effect["sand_rooftop_aftermath"] = loadfx( "fx/dust/sand_rooftop_aftermath" );
    level._effect["sand_rooftop_sm_aftermath"] = loadfx( "fx/dust/sand_rooftop_sm_aftermath" );
    level._effect["heat_distort"] = loadfx( "fx/distortion/aftermath_bg_heat_distort" );
    level._effect["fire_vhc_dl_aftermath"] = loadfx( "fx/fire/fire_vhc_dl_aftermath" );
    level._effect["sand_spray_dtl_aftermath"] = loadfx( "fx/dust/sand_spray_dtl_aftermath" );
    level._effect["powerline_runner"] = loadfx( "fx/explosions/powerline_runner" );
    level._effect["firepatch_vhc_dl_aftermath"] = loadfx( "fx/fire/firepatch_vhc_dl_aftermath" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L_fast" );
    level._effect["building_collapse_aftermath"] = loadfx( "fx/dust/building_collapse_aftermath_runner" );
    level._effect["building_collapse_aftermath_sm"] = loadfx( "fx/dust/building_collapse_aftermath_runner_sm" );
    level._effect["electrical_spark_loop_aftermath"] = loadfx( "vfx/sparks/electrical_spark_loop_aftermath" );
    level._effect["aftermath_smoke_volume"] = loadfx( "fx/smoke/aftermath_smoke_volume" );
    level._effect["fx_sunflare_aftermath"] = loadfx( "vfx/lensflare/fx_sunflare_aftermath" );
    level._effect["paper_sheet_01_blowing_aftermath"] = loadfx( "vfx/wind/paper_sheet_01_blowing_aftermath" );
    level._effect["vista_nuke_aftermath"] = loadfx( "vfx/map/aftermath/vista_nuke_aftermath" );
    level._effect["vista_nuke_column"] = loadfx( "vfx/map/aftermath/vista_nuke_column" );
    level._effect["vista_nuke_pyroclastic_flow"] = loadfx( "vfx/map/aftermath/vista_nuke_pyroclastic_flow" );
    level._effect["fog_oriented_edge_fade"] = loadfx( "vfx/fog/fog_oriented_edge_fade" );
    level._effect["collapse_smk_debris_1"] = loadfx( "fx/smoke/aftermath_smk_debris_collapse_01" );
    level._effect["collapse_smk_debris_2"] = loadfx( "fx/smoke/aftermath_smk_debris_collapse_02" );
    level._effect["collapse_smk_plume"] = loadfx( "fx/smoke/aftermath_smk_debris_collapse_plume" );
    level._effect["collapse_smk_debris_trail"] = loadfx( "fx/smoke/aftermath_smk_debris_collapse_trail" );
    level._effect["collapse_smk_debris_pFlow"] = loadfx( "fx/smoke/aftermath_smk_build_a_pflow" );
    level._effect["collapse_smk_debris_pFlow_tall"] = loadfx( "fx/smoke/aftermath_smk_build_tall_pflow" );
    level._effect["aMath_fire_bg"] = loadfx( "vfx/fire/aftermath_fire_bg" );
    level._effect["aMath_fire_bg_mid"] = loadfx( "vfx/fire/aftermath_fire_bg_mid" );
    level._effect["aMath_fire_bg_mid_no_smk"] = loadfx( "vfx/fire/aftermath_fire_bg_mid_no_smk" );
    level._effect["aMath_fire_building"] = loadfx( "vfx/fire/aftermath_fire_building_far" );
    level._effect["aMath_fire_crawl"] = loadfx( "vfx/fire/aftermath_fire_crawl" );
    level._effect["aMath_fire_light_lg"] = loadfx( "vfx/fire/aftermath_fire_light_lg" );
    level._effect["aMath_fire_rain"] = loadfx( "vfx/fire/aftermath_fire_rain" );
    level._effect["aMath_fire_transformer"] = loadfx( "vfx/fire/aftermath_fire_transformer" );
    level._effect["aMath_flare_lg"] = loadfx( "vfx/lensflare/aftermath_flare_lg" );
    level._effect["aMath_spark_spit"] = loadfx( "vfx/fire/aftermath_spark_spit" );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
}

playereffect()
{
    var_0 = getentarray( "player", "classname" )[0];

    for (;;)
    {
        playfx( level._effect["ash_turb_aftermath"], var_0.origin + ( 0, 0, 100 ), var_0.origin + ( 0, 0, 150 ) );
        wait 0.2;
    }
}