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
#using_animtree("generic_human");

main()
{
    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
    {
        level._id_78AC["price"]["tank_talk"] = %bog_a_tank_dialogue;
        level._id_78AC["left_guy"]["tank_talk"] = %bog_a_tank_dialogue_guyl;
        level._id_78AC["right_guy"]["tank_talk"] = %bog_a_tank_dialogue_guyr;
        level._id_78AC["price"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_idle;
        level._id_78AC["left_guy"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_guyl_idle;
        level._id_78AC["right_guy"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_guyr_idle;
    }
    else
    {
        level._id_78AC["price"]["tank_talk"] = %h1_bog_a_tank_dialogue;
        level._id_78AC["left_guy"]["tank_talk"] = %h1_bog_a_tank_dialogue_guyl;
        level._id_78AC["right_guy"]["tank_talk"] = %h1_bog_a_tank_dialogue_guyr;
        level._id_78AC["price"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_idle;
        level._id_78AC["left_guy"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_guyl_idle;
        level._id_78AC["right_guy"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_guyr_idle;
    }

    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_listenup" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_donthavemuchtime" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_defensivepositions" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_oorah" );
    maps\_anim::addnotetrack_animsound( "price", "tank_talk", "scn_vsq_tank_dialog_foley", "scn_vsq_tank_dialog_foley" );
    level._id_78B9["alphasixstatus"] = "bog_a_vsq_alphasixstatus";
    level._id_78BA["price"]["letsmoveout"] = "bog_a_vsq_letsmoveout";
    level._id_78BA["price"]["twocharliebravosix"] = "bog_a_vsq_twocharliebravosix";
    level._id_78BA["price"]["jacksonfindzpu"] = "bog_a_vsq_Jacksonfindzpu";
    level._id_78BA["price"]["plantbeacon"] = "bog_a_vsq_plantbeacon";
    level._id_78BA["price"]["securewest"] = "bog_a_vsq_securewest";
    level._id_78BA["marine"]["rogerthat"] = "bog_a_gm1_rogerthat";
    level._id_78BA["marine"]["plantc4"] = "bog_gm1_plantc4";
    level._id_78BA["marine"]["goodjob"] = "bog_gm1_goodjob";
    level._id_78BA["marine"]["jacksondoit"] = "bog_gm1_Jacksondoit";
    level._id_78BA["price"]["vampiresixfour"] = "bog_vsq_vampiresixfour";
    level._id_78BA["price"]["lzissecure"] = "bog_vsq_lzissecure";
    level._id_78BA["left_guy"]["regroupattank"] = "bog_blk_regroupattank";
    level._id_78BA["price"]["donthavemuchtime"] = "bog_vsq_donthavemuchtime";
    level._id_78BA["price"]["listen_up"] = "bog_vsq_listenup";
    level._id_78BA["price"]["dont_have_much_time"] = "bog_vsq_donthavemuchtime";
    level._id_78BA["price"]["defensive_positions"] = "bog_vsq_defensivepositions";
    level._id_78BA["price"]["oorah"] = "bog_vsq_oorah";
    level._id_78BA["gm1"]["oorah"] = "bog_gm1_oorah";
    level._id_78BA["gm2"]["oorah"] = "bog_gm2_oorah";
    level._id_78BA["gm3"]["oorah"] = "bog_gm3_oorah";
    level._id_78BA["price"]["allrightmoveout"] = "bog_vsq_allrightmoveout";
    level._id_78B9["stillsurrounded"] = "bog_a_gm1_stillsurrounded";
    level._id_78B9["contactseast"] = "bog_a_vsq_contactseast";
    level._id_78B9["movingindetpacks"] = "bog_a_vsq_movingindetpacks";
    level._id_78B9["maingunsoffline"] = "bog_tcm_maingunsoffline";
    level._id_78B9["dangeroverrun"] = "bog_a_vsq_dangeroverrun";
    level._id_78B9["jacksonawol"] = "bog_a_vsq_Jacksonawol";
    level._id_78B9["fallbacktank"] = "bog_a_vsq_fallbacktank";
    level._id_78B9["morewest"] = "bog_a_hqr_morewest";
    level._id_78B9["negativebravo"] = "bog_a_hqr_negativebravo";
    level._id_78B9["buttonedup"] = "bog_a_vsq_buttonedup";
    level._id_78B9["whereistheairsupport"] = "bog_gm1_airsupport";
    level._id_78B9["canttakebuilding"] = "bog_gm2_plantbeacon";
    level._id_78B9["rippingusapart"] = "bog_a_vsq_rippingusapart";
    level._id_78B9["standby"] = "bog_plt_standby";
    level._id_78B9["cominhot"] = "bog_plt_cominhot";
    level._id_78B9["seeanyoneleft"] = "bog_cop_negative";
    level._id_78B9["negative"] = "bog_plt_seeanyoneleft";
    level._id_78B9["alltargetsdestroyed"] = "bog_plt_alltargetsdestroyed";
    level._id_78B9["goodworkout"] = "bog_hqr_goodworkout";
}
