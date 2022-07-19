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
    level._id_78BA["fco"]["ac130_fco_donotengage"] = "ac130_fco_donotengage";
    level._id_78BA["price"]["ac130_pri_towntoeast"] = "ac130_pri_towntoeast";
    level._id_78BA["tvo"]["ac130_tvo_eyesonfriendlies"] = "ac130_tvo_eyesonfriendlies";
    level._id_78BA["fco"]["ac130_fco_nofirestrobe"] = "ac130_fco_nofirestrobe";
    level._id_78BA["nav"]["ac130_nav_confirmchurch"] = "ac130_nav_confirmchurch";
    level._id_78BA["tvo"]["ac130_tvo_weseeit"] = "ac130_tvo_weseeit";
    level._id_78BA["fco"]["ac130_fco_rogerwerethere"] = "ac130_fco_rogerwerethere";
    level._id_78BA["nav"]["ac130_nav_notauthorizedchurch"] = "ac130_nav_notauthorizedchurch";
    level._id_78BA["tvo"]["ac130_tvo_vehiclemovingnow"] = "ac130_tvo_vehiclemovingnow";
    level._id_78BA["fco"]["ac130_fco_onevehiclemoving"] = "ac130_fco_onevehiclemoving";
    level._id_78BA["tvo"]["ac130_tvo_personnelchurch"] = "ac130_tvo_personnelchurch";
    level._id_78BA["fco"]["ac130_fco_armedpersonnelchurch"] = "ac130_fco_armedpersonnelchurch";
    level._id_78BA["pilot"]["ac130_plt_cleartoengage"] = "ac130_plt_cleartoengage";
    level._id_78BA["fco"]["ac130_fco_cleartoengage"] = "ac130_fco_cleartoengage";
    level._id_78BA["pri"]["ac130_pri_passingchurch"] = "ac130_pri_passingchurch";
    level._id_78BA["plt"]["ac130_plt_woutstrobe"] = "ac130_plt_woutstrobe";
    level._id_78BA["plt"]["ac130_plt_bankingtovillage"] = "ac130_plt_bankingtovillage";
    level._id_78BA["plt"]["ac130_plt_smokem"] = "ac130_plt_smokem";
    level._id_78BA["fco"]["ac130_fco_movingvehicle"] = "ac130_fco_movingvehicle";
    level._id_78BA["fco"]["ac130_fco_donoengage"] = "ac130_fco_donoengage";
    level._id_78BA["fco"]["ac130_fco_civilianvehicles"] = "ac130_fco_civilianvehicles";
    level._id_78BA["fco"]["ac130_fco_alttransport"] = "ac130_fco_alttransport";
    level._id_78BA["tvo"]["ac130_tvo_nicetruck"] = "ac130_tvo_nicetruck";
    level._id_78BA["fco"]["ac130_fco_nahscared"] = "ac130_fco_nahscared";
    level._id_78BA["pri"]["ac130_pri_confirmyousee"] = "ac130_pri_confirmyousee";
    level._id_78BA["fco"]["ac130_fco_seebeacons"] = "ac130_fco_seebeacons";
    level._id_78BA["pri"]["ac130_pri_coverus"] = "ac130_pri_coverus";
    level._id_78BA["nav"]["ac130_nav_ambushroad"] = "ac130_nav_ambushroad";
    level._id_78BA["fco"]["ac130_fco_whichcurved"] = "ac130_fco_whichcurved";
    level._id_78BA["nav"]["ac130_nav_seewatertower"] = "ac130_nav_seewatertower";
    level._id_78BA["fco"]["ac130_fco_confirmyousee"] = "ac130_fco_confirmyousee";
    level._id_78BA["tvo"]["ac130_tvo_nearintersection"] = "ac130_tvo_nearintersection";
    level._id_78BA["nav"]["ac130_nav_thatstheone"] = "ac130_nav_thatstheone";
    level._id_78BA["nav"]["ac130_nav_doyouseethat"] = "ac130_nav_doyouseethat";
    level._id_78BA["fco"]["ac130_fco_rogerthat"] = "ac130_fco_rogerthat";
    level._id_78BA["nav"]["ac130_nav_trackthatroad"] = "ac130_nav_trackthatroad";
    level._id_78BA["fco"]["ac130_fco_howfar"] = "ac130_fco_howfar";
    level._id_78BA["nav"]["ac130_nav_uhhangon"] = "ac130_nav_uhhangon";
    level._id_78BA["nav"]["ac130_nav_600meters"] = "ac130_nav_2klicks";
    level._id_78BA["tvo"]["ac130_tvo_rogerthat"] = "ac130_tvo_rogerthat";
    level._id_78BA["tvo"]["ac130_tvo_hostilescurved"] = "ac130_tvo_hostilescurved";
    level._id_78BA["fco"]["ac130_fco_partiallyconcealed"] = "ac130_fco_partiallyconcealed";
    level._id_78BA["fco"]["ac130_fco_requestpermission"] = "ac130_fco_requestpermission";
    level._id_78BA["fco"]["ac130_fco_takeout"] = "ac130_fco_takeout";
    level._id_78BA["tvo"]["ac130_tvo_armoredvehicle"] = "ac130_tvo_armoredvehicle";
    level._id_78BA["fco"]["ac130_fco_smallgroups"] = "ac130_fco_smallgroups";
    level._id_78BA["tvo"]["ac130_tvo_firedrpg"] = "ac130_tvo_firedrpg";
    level._id_78BA["pri"]["ac130_pri_underattack"] = "ac130_pri_underattack";
    level._id_78BA["fco"]["ac130_fco_smoketrails"] = "ac130_fco_smoketrails";
    level._id_78BA["tvo"]["ac130_tvo_ushaped"] = "ac130_tvo_ushaped";
    level._id_78BA["fco"]["ac130_fco_ushaped"] = "ac130_fco_ushaped";
    level._id_78BA["tvo"]["ac130_tvo_flatroof"] = "ac130_tvo_flatroof";
    level._id_78BA["fco"]["ac130_fco_outofbarn"] = "ac130_fco_outofbarn";
    level._id_78BA["pri"]["ac130_pri_junkyard"] = "ac130_pri_junkyard";
    level._id_78BA["fco"]["ac130_fco_flashingstrobe"] = "ac130_fco_flashingstrobe";
    level._id_78BA["fco"]["ac130_fco_watchstrobe"] = "ac130_fco_watchstrobe";
    level._id_78BA["tvo"]["ac130_tvo_enemyjunkyard"] = "ac130_tvo_enemyjunkyard";
    level._id_78BA["fco"]["ac130_fco_smokeem"] = "ac130_fco_smokeem";
    level._id_78BA["fco"]["ac130_fco_gointotown"] = "ac130_fco_gointotown";
    level._id_78BA["pri"]["ac130_pri_fireallsides"] = "ac130_pri_fireallsides";
    level._id_78BA["nav"]["ac130_nav_dangerclose"] = "ac130_nav_dangerclose";
    level._id_78BA["fco"]["ac130_fco_friendliesentering"] = "ac130_fco_friendliesentering";
    level._id_78BA["tvo"]["ac130_tvo_copy"] = "ac130_tvo_copy";
    level._id_78BA["pri"]["ac130_pri_thanksforassist"] = "ac130_pri_thanksforassist";
    level._id_78BA["fco"]["ac130_fco_highlightreel"] = "ac130_fco_highlightreel";
    level._id_78BA["tvo"]["ac130_tvo_heardthat"] = "ac130_tvo_heardthat";
    level._id_78BA["nav"]["ac130_nav_vipsecure"] = "ac130_nav_vipsecure";
    level._id_78BA["plt"]["ac130_plt_returningbase"] = "ac130_plt_returningbase";
    level._id_78BA["fco"]["ac130_fco_firingtoclose"] = "ac130_fco_firingtoclose";
    add_context_sensative_dialog( "ai", "in_sight", 0, "ac130_fco_moreenemy" );
    add_context_sensative_dialog( "ai", "in_sight", 1, "ac130_fco_getthatguy" );
    add_context_sensative_dialog( "ai", "in_sight", 2, "ac130_fco_guymovin" );
    add_context_sensative_dialog( "ai", "in_sight", 3, "ac130_fco_getperson" );
    add_context_sensative_dialog( "ai", "in_sight", 4, "ac130_fco_guyrunnin" );
    add_context_sensative_dialog( "ai", "in_sight", 5, "ac130_fco_gotarunner" );
    add_context_sensative_dialog( "ai", "in_sight", 6, "ac130_fco_backonthose" );
    add_context_sensative_dialog( "ai", "in_sight", 7, "ac130_fco_gonnagethim" );
    add_context_sensative_dialog( "ai", "in_sight", 8, "ac130_fco_personnelthere" );
    add_context_sensative_dialog( "ai", "in_sight", 9, "ac130_fco_nailthoseguys" );
    add_context_sensative_dialog( "ai", "in_sight", 10, "ac130_fco_clearedtoengage" );
    add_context_sensative_dialog( "ai", "in_sight", 11, "ac130_fco_lightemup" );
    add_context_sensative_dialog( "ai", "in_sight", 12, "ac130_fco_takehimout" );
    add_context_sensative_dialog( "ai", "in_sight", 13, "ac130_plt_clearedtoengage" );
    add_context_sensative_dialog( "ai", "in_sight", 14, "ac130_plt_yeahcleared" );
    add_context_sensative_dialog( "ai", "in_sight", 15, "ac130_plt_copysmoke" );
    add_context_sensative_dialog( "ai", "in_sight", 16, "ac130_fco_rightthere" );
    add_context_sensative_dialog( "ai", "in_sight", 17, "ac130_fco_tracking" );
    add_context_sensative_dialog( "ai", "wounded_crawl", 0, "ac130_fco_movingagain" );
    add_context_sensative_timeout( "ai", "wounded_crawl", undefined, 6 );
    add_context_sensative_dialog( "ai", "wounded_pain", 0, "ac130_fco_doveonground" );
    add_context_sensative_dialog( "ai", "wounded_pain", 1, "ac130_fco_knockedwind" );
    add_context_sensative_dialog( "ai", "wounded_pain", 2, "ac130_fco_downstillmoving" );
    add_context_sensative_dialog( "ai", "wounded_pain", 3, "ac130_fco_gettinbackup" );
    add_context_sensative_dialog( "ai", "wounded_pain", 4, "ac130_fco_yepstillmoving" );
    add_context_sensative_dialog( "ai", "wounded_pain", 5, "ac130_fco_stillmoving" );
    add_context_sensative_timeout( "ai", "wounded_pain", undefined, 12 );
    add_context_sensative_dialog( "weapons", "105mm_ready", 0, "ac130_gnr_gunready1" );
    add_context_sensative_dialog( "weapons", "105mm_fired", 0, "ac130_gnr_shot1" );
    add_context_sensative_dialog( "plane", "rolling_in", 0, "ac130_plt_rollinin" );
    add_context_sensative_dialog( "explosion", "secondary", 0, "ac130_nav_secondaries1" );
    add_context_sensative_dialog( "explosion", "secondary", 1, "ac130_tvo_directsecondary1" );
    add_context_sensative_dialog( "explosion", "secondary", 1, "ac130_tvo_directsecondary2" );
    add_context_sensative_timeout( "explosion", "secondary", undefined, 7 );
    add_context_sensative_dialog( "kill", "single", 0, "ac130_plt_gottahurt" );
    add_context_sensative_dialog( "kill", "single", 1, "ac130_fco_iseepieces" );
    add_context_sensative_dialog( "kill", "single", 2, "ac130_fco_goodkill" );
    add_context_sensative_dialog( "kill", "single", 3, "ac130_fco_yougothim" );
    add_context_sensative_dialog( "kill", "single", 4, "ac130_fco_yougothim2" );
    add_context_sensative_dialog( "kill", "single", 5, "ac130_fco_thatsahit" );
    add_context_sensative_dialog( "kill", "single", 6, "ac130_fco_directhit" );
    add_context_sensative_dialog( "kill", "single", 7, "ac130_fco_rightontarget" );
    add_context_sensative_dialog( "kill", "single", 8, "ac130_fco_okyougothim" );
    add_context_sensative_dialog( "kill", "single", 9, "ac130_fco_within2feet" );
    add_context_sensative_dialog( "kill", "small_group", 0, "ac130_fco_nice" );
    add_context_sensative_dialog( "kill", "small_group", 1, "ac130_fco_directhits" );
    add_context_sensative_dialog( "kill", "small_group", 2, "ac130_fco_iseepieces" );
    add_context_sensative_dialog( "kill", "small_group", 3, "ac130_fco_goodkill" );
    add_context_sensative_dialog( "kill", "small_group", 4, "ac130_fco_yougothim" );
    add_context_sensative_dialog( "kill", "small_group", 5, "ac130_fco_yougothim2" );
    add_context_sensative_dialog( "kill", "small_group", 6, "ac130_fco_thatsahit" );
    add_context_sensative_dialog( "kill", "small_group", 7, "ac130_fco_directhit" );
    add_context_sensative_dialog( "kill", "small_group", 8, "ac130_fco_rightontarget" );
    add_context_sensative_dialog( "kill", "small_group", 9, "ac130_fco_okyougothim" );
    add_context_sensative_dialog( "kill", "large_group", 0, "ac130_fco_hotdamn1" );
    add_context_sensative_dialog( "kill", "large_group", 0, "ac130_fco_hotdamn2" );
    add_context_sensative_dialog( "kill", "large_group", 0, "ac130_fco_hotdamn3" );
    add_context_sensative_dialog( "kill", "large_group", 1, "ac130_tvo_whoa1" );
    add_context_sensative_dialog( "kill", "large_group", 1, "ac130_tvo_whoa2" );
    add_context_sensative_dialog( "kill", "large_group", 1, "ac130_tvo_whoa3" );
    add_context_sensative_dialog( "kill", "large_group", 2, "ac130_fco_kaboom" );
    add_context_sensative_dialog( "location", "car", 0, "ac130_fco_guybycar" );
    add_context_sensative_timeout( "location", "car", undefined, 40 );
    add_context_sensative_dialog( "location", "truck", 0, "ac130_fco_guybytruck" );
    add_context_sensative_timeout( "location", "truck", undefined, 12 );
    add_context_sensative_dialog( "location", "building", 0, "ac130_fco_nailbybuilding1" );
    add_context_sensative_timeout( "location", "building", undefined, 20 );
    add_context_sensative_dialog( "location", "wall", 0, "ac130_tvo_coverbywall1" );
    add_context_sensative_timeout( "location", "wall", undefined, 20 );
    add_context_sensative_dialog( "location", "field", 0, "ac130_fco_crossingfield" );
    add_context_sensative_timeout( "location", "field", undefined, 20 );
    add_context_sensative_dialog( "location", "road", 0, "ac130_fco_enemyonroad" );
    add_context_sensative_timeout( "location", "road", undefined, 20 );
    add_context_sensative_dialog( "location", "church", 0, "ac130_fco_outofchurch" );
    add_context_sensative_timeout( "location", "church", undefined, 20 );
    add_context_sensative_dialog( "location", "ditch", 0, "ac130_fco_headinforditch" );
    add_context_sensative_timeout( "location", "ditch", undefined, 20 );
    add_context_sensative_dialog( "vehicle", "incoming", 0, "ac130_fco_movingvehicle" );
    add_context_sensative_dialog( "vehicle", "incoming", 1, "ac130_fco_vehicleonmove" );
    add_context_sensative_dialog( "vehicle", "incoming", 2, "ac130_plt_engvehicle" );
    add_context_sensative_dialog( "vehicle", "incoming", 3, "ac130_fco_getvehicle" );
    add_context_sensative_dialog( "vehicle", "death", 0, "ac130_fco_confirmed" );
    add_context_sensative_dialog( "vehicle", "death", 1, "ac130_fco_fulltank" );
    add_context_sensative_dialog( "misc", "action", 0, "ac130_plt_scanrange" );
    add_context_sensative_timeout( "misc", "action", 0, 70 );
    add_context_sensative_dialog( "misc", "action", 1, "ac130_plt_cleanup" );
    add_context_sensative_timeout( "misc", "action", 1, 80 );
    add_context_sensative_dialog( "misc", "action", 2, "ac130_plt_targetreset" );
    add_context_sensative_timeout( "misc", "action", 2, 55 );
    add_context_sensative_dialog( "misc", "action", 3, "ac130_plt_azimuthsweep" );
    add_context_sensative_timeout( "misc", "action", 3, 100 );
}

add_context_sensative_dialog( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_78BA[var_0] ) || !isdefined( level._id_78BA[var_0][var_1] ) || !isdefined( level._id_78BA[var_0][var_1][var_2] ) )
    {
        level._id_78BA[var_0][var_1][var_2] = spawnstruct();
        level._id_78BA[var_0][var_1][var_2].played = 0;
        level._id_78BA[var_0][var_1][var_2].sounds = [];
    }

    var_4 = level._id_78BA[var_0][var_1][var_2].sounds.size;
    level._id_78BA[var_0][var_1][var_2].sounds[var_4] = var_3;
}

add_context_sensative_timeout( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.context_sensative_dialog_timeouts ) )
        level.context_sensative_dialog_timeouts = [];

    var_4 = 0;

    if ( !isdefined( level.context_sensative_dialog_timeouts[var_0] ) )
        var_4 = 1;
    else if ( !isdefined( level.context_sensative_dialog_timeouts[var_0][var_1] ) )
        var_4 = 1;

    if ( var_4 )
        level.context_sensative_dialog_timeouts[var_0][var_1] = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E = [];
        level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )] = spawnstruct();
        level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )].v["timeoutDuration"] = var_3 * 1000;
        level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )].v["lastPlayed"] = var_3 * -1000;
    }
    else
    {
        level.context_sensative_dialog_timeouts[var_0][var_1].v["timeoutDuration"] = var_3 * 1000;
        level.context_sensative_dialog_timeouts[var_0][var_1].v["lastPlayed"] = var_3 * -1000;
    }
}
