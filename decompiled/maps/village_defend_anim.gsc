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
    setup_exploder_anims();
    exploder_script_model_anims();
    animated_model_setup();
    _id_29F3();
    run_anims();
}
#using_animtree("generic_human");

_id_29F3()
{
    level._id_78BA["price"]["spreadout"] = "villagedef_pri_counterattackimminent";
    level._id_78B9["belltowerhere"] = "villagedef_sas1_belltowerhere";
    level._id_78B9["justsaywhen"] = "villagedef_sas2_justsaywhen";
    level._id_78B9["doit"] = "villagedef_pri_doit";
    level._id_78B9["kaboom"] = "villagedef_sas2_kaboom";
    level._id_78BA["price"]["openfire"] = "villagedef_pri_openfire";
    level._id_78B9["targetdown"] = "villagedef_sas3_targetdown";
    level._id_78B9["gothim"] = "villagedef_sas3_gothim";
    level._id_78B9["targeteliminated"] = "villagedef_sas3_targeteliminated";
    level._id_78B9["goodbye"] = "villagedef_sas3_goodbye";
    level._id_78B9["recreationalvehicle"] = "villagedef_sas2_rv";
    level._id_78B9["takeitout"] = "villagedef_pri_takeitout";
    level._id_78B9["firingjavelin"] = "villagedef_sas2_firingjavelin";
    level._id_78B9["niceshotmate"] = "villagedef_sas3_niceshot";
    level._id_78B9["blastnolock"] = "villagedef_sas2_cantgetlock";
    level._id_78B9["largerforce"] = "villagedef_pri_holdground";
    level._id_78B9["copy"] = "villagedef_sas3_copy";
    level._id_78B9["smokescreensmac"] = "villagedef_sas2_smokescreens";
    level._id_78B9["notmuchmovement"] = "villagedef_sas4_toourwest";
    level._id_78B9["targetingour"] = "villagedef_gaz_fallback";
    level._id_78B9["minigunflank"] = "villagedef_pri_coverwestflank";
    level._id_78B9["miniguncrashed"] = "villagedef_pri_gettominigun";
    level._id_78B9["minigunarse"] = "villagedef_pri_arsemoving";
    level._id_78B9["twofallingback"] = "villagedef_sas2_fallingback";
    level._id_78B9["threeonthemove"] = "villagedef_sas3_onmove";
    level._id_78B9["easternroadlocked"] = "villagedef_sas3_roadlocked";
    level._id_78B9["spooledup"] = "villagedef_pri_fireinbursts";
    level._id_78BA["gaz"]["gazuseminigun"] = "villagedef_gaz_usethminigun";
    level._id_78B9["priceminiguninheli"] = "villagedef_pri_insidecrashed";
    level._id_78B9["priceminiguninhelimove"] = "villagedef_pri_getonminigunheli";
    level._id_78B9["gazminigunonline"] = "villagedef_gaz_minigunsonline";
    level._id_78B9["heretheycome"] = "villagedef_pri_heretheycome";
    level._id_78B9["headsup"] = "villagedef_sas2_headsup";
    level._id_78B9["lotofhelis"] = "villagedef_sas3_lotofhelis";
    level._id_78B9["tavern"] = "villagedef_pri_backtotavern";
    level._id_78B9["nextdefensiveline"] = "villagedef_pri_defensiveline";
    level._id_78B9["detfallbackremind3"] = "villagedef_pri_getoverrun";
    level._id_78B9["detuseremind1"] = "villagedef_gaz_fourintavern";
    level._id_78B9["detuseremind2"] = "villagedef_gaz_checkcompass";
    level._id_78B9["detfallbackremind1"] = "villagedef_gaz_nextphaseline";
    level._id_78B9["detfallbackremind2"] = "villagedef_gaz_fallbacknow";
    level._id_78B9["detminigunfallbackremind1"] = "villagedef_gaz_getoffminigun";
    level._id_78B9["detminigunfallbackremind2"] = "villagedef_gaz_forgetminigun";
    level._id_78B9["fallbacktofarm1"] = "villagedef_pri_topofthehill";
    level._id_78B9["fallbacktofarm2"] = "villagedef_pri_wannabeleft";
    level._id_78B9["tavernoverrunsoon"] = "villagedef_gaz_overrunyourpos";
    level._id_78BA["gaz"]["fallbacktofarm3"] = "villagedef_gaz_headfforfarm";
    level._id_78BA["gaz"]["fallbackgeneric"] = "villagedef_gaz_fallbackfallback";
    level._id_78B9["enemytanksnorth"] = "villagedef_sas4_imhit";
    level._id_78B9["gettothebarn"] = "villagedef_pri_stoptanks";
    level._id_78BA["price"]["javelinorder1"] = "villagedef_pri_getjavelinbarn";
    level._id_78B9["javelinorder2"] = "villagedef_gaz_javelinsinbarn";
    level._id_78BA["gaz"]["javelinorder3"] = "villagedef_gaz_javelinhurry";
    level._id_78B9["casready"] = "villagedef_fpp_standingby";
    level._id_78B9["airstrikewarning"] = "villagedef_fpp_airstrike";
    level._id_78B9["airstrikewarning"] = "villagedef_fpp_airstrike";
    level._id_78B9["airstrikewarning"] = "villagedef_fpp_airstrike";
    level._id_78B9["etafourminutes"] = "villagedef_hp2_beready";
    level._id_78B9["pickingupSAMs"] = "villagedef_hp2_samsites";
    level._id_78BA["gaz"]["thatsjustgreat"] = "villagedef_gaz_justgreat";
    level._id_78B9["lzbottomhill"] = "villagedef_hp2_enemyradar";
    level._id_78B9["cantlandhigh"] = "villagedef_pri_cantlandhigh";
    level._id_78B9["takingthepiss"] = "villagedef_gaz_takinthepiss";
    level._id_78B9["thenewlz"] = "villagedef_pri_forgetitgaz";
    level._id_78B9["lzfoxtrot"] = "villagedef_hp2_acrossriver";
    level._id_78B9["headlandingzone"] = "villagedef_pri_lastchance";
    level._id_78B9["bottomofthehill"] = "villagedef_pri_gettobottom";
    level._id_78B9["gettolandingzone"] = "villagedef_gaz_gonnagetleft";
    level._id_78B9["breakthroughtolz"] = "villagedef_pri_breakthru";
    level._id_78B9["getdownthehill"] = "villagedef_gaz_getdownthehill";
    level._id_78B9["gettothelzgogo"] = "villagedef_gaz_gettolzgo";
    level._id_78B9["almosttherethree"] = "villagedef_hp2_3minutes";
    level._id_78B9["twominutesleft"] = "villagedef_hp2_2minutes";
    level._id_78B9["copywereonourway"] = "villagedef_pri_copythat";
    level._id_78B9["ninetysecondsleft"] = "villagedef_hp2_ninetysecs";
    level._id_78B9["oneminutebingo"] = "villagedef_hp2_1mintobingo";
    level._id_78B9["thirtyseconds"] = "villagedef_hp2_30seconds";
    level._id_78B9["outtahere"] = "villagedef_hp2_outtahere";
    level._id_78B9["cominhome"] = "villagedef_hp2_cominhome";
    level._id_78BA["griggs"]["needaride"] = "villagedef_grg_needaride";
    level._id_78BA["griggs"]["getonboard"] = "villagedef_grg_getonboard";
    level._id_78BA["griggs"]["griggsletsgo"] = "villagedef_grg_letsgo";
    level._id_78BA["griggs"]["wereallaboard"] = "villagedef_grg_wereallaboard";
    level._id_78AC["generic"]["ch46_unload_1"] = %ch46_unload_1;
    level._id_78AC["generic"]["ch46_unload_2"] = %ch46_heat_unload_2;
    level._id_78AC["generic"]["ch46_unload_3"] = %ch46_heat_unload_3;
    level._id_78AC["generic"]["ch46_unload_4"] = %ch46_unload_4;
    level._id_78AC["generic"]["ch46_load_1"] = %ch46_load_1;
    level._id_78AC["generic"]["ch46_load_2"] = %ch46_heat_load_2;
    level._id_78AC["generic"]["ch46_load_3"] = %ch46_heat_load_3;
    level._id_78AC["generic"]["ch46_load_4"] = %ch46_load_4;
    _id_7A3D();
    script_models_minigun_player();
    player_boarding();
    seaknight_anims();
}

run_anims()
{
    level._id_78AC["axis"]["patrolwalk_1"] = %patrol_bored_patrolwalk;
    level._id_78AC["axis"]["patrolwalk_2"] = %patrol_bored_patrolwalk;
    level._id_78AC["axis"]["patrolwalk_3"] = %patrol_bored_patrolwalk;
    level._id_78AC["axis"]["patrolwalk_4"] = %patrol_bored_patrolwalk;
    level._id_78AC["axis"]["patrolwalk_5"] = %patrol_bored_patrolwalk;
    level._id_78AC["axis"]["patrolwalk_pause"] = %patrol_bored_react_walkstop;
}

player_boarding()
{
    level._id_78AC["player_carry"]["village_player_getin"] = %village_player_getin;
    level._id_78B1["player_carry"] = #animtree;
    level._id_78B5["player_carry"] = "viewhands_player_sas_woodland";
}
#using_animtree("script_model");

_id_7A3D()
{
    level._id_78AC["minigun"]["spin_idle"][0] = %minigun_spin_idle;
    level._id_78AC["minigun"]["spin_loop"][0] = %minigun_spin_loop;
    level._id_78AC["minigun"]["spin"] = %minigun_spin_loop;
    level._id_78AC["minigun"]["spin_start"] = %minigun_spin_start;
    level._id_78AC["minigun"]["use"] = %h1_minigun_in;
    level._id_78AC["minigun"]["drop"] = %h1_minigun_out;
    maps\_anim::addnotetrack_animsound( "minigun", "use", "start", "h1_minigun_use_foley" );
    maps\_anim::addnotetrack_animsound( "minigun", "drop", "start", "h1_minigun_drop_foley" );
    level._id_78B1["minigun"] = #animtree;
    level._id_78B5["minigun"] = "weapon_minigun";
}
#using_animtree("generic_human");

script_models_minigun_player()
{
    level._id_78AC["minigun_player"]["use_minigun"] = %h1_minigun_in_player;
    level._id_78B1["minigun_player"] = #animtree;
    level._id_78B5["minigun_player"] = "viewhands_player_sas_woodland";
    level._id_78AC["detonator_guy"]["press_detonator"] = %h1_village_defend_sas_press_detonator;
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "radio_dialog", maps\village_defend::say_kaboom, "press_detonator" );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "kaboom", maps\village_defend::do_kaboom, "press_detonator" );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "spawn_detonator", maps\village_defend::toggle_detonator, "press_detonator", 1 );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "despawn_detonator", maps\village_defend::toggle_detonator, "press_detonator", 0 );
}
#using_animtree("vehicles");

seaknight_anims()
{
    level._id_78AC["generic"]["ch46_doors_open"] = %ch46_doors_open;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

exploder_script_model_anims()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["village_defend_church_prt1_anim"] = %village_defend_church_prt1_anim;
    level._id_78AC["exploder_script_model"]["village_defend_church_prt2_anim"] = %village_defend_church_prt2_anim;
}
#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["still"] = %foliage_birch_tree_hero_still;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["strong"] = %foliage_birch_tree_hero_sway;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["heli"] = %foliage_birch_tree_hero_heliwash;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["still"] = %h1_tree_pine_evergreen_03_hero_still;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["strong"] = %h1_tree_pine_evergreen_03_hero_sway;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["heli"] = %h1_tree_pine_evergreen_03_hero_heliwash;
}
