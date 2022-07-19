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

init()
{

}

_id_4C38( var_0, var_1 )
{
    var_0 = getweaponbasename( var_0 );
    var_2 = self;
    var_3 = int( getspmatchdata( "career", "kills_total" ) ) + 1;
    setspmatchdata( "career", "kills_total", var_3 );
    _id_7F06( var_0, "kills_total" );
    var_4 = getspmatchdata( "checkpoints", "kills_total" ) + 1;
    setspmatchdata( "checkpoints", "kills_total", var_4 );

    if ( var_1 )
    {
        var_5 = getspmatchdata( "checkpoints", "headshots_total" ) + 1;
        setspmatchdata( "checkpoints", "headshots_total", var_5 );
        _id_7F06( var_0, "headshots_total" );
    }
}

_id_8446( var_0 )
{
    _id_7F06( getweaponbasename( var_0 ), "shots_total" );
    var_1 = getspmatchdata( "checkpoints", "shots_total" ) + 1;
    setspmatchdata( "checkpoints", "shots_total", var_1 );
}

_id_4C37( var_0 )
{
    _id_7F06( getweaponbasename( var_0 ), "shots_hit" );
    var_1 = getspmatchdata( "checkpoints", "hits_total" ) + 1;
    setspmatchdata( "checkpoints", "hits_total", var_1 );
}

_id_72DC( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_0 = getweaponbasename( var_0 );

        if ( !_id_1BD6( var_1 ) )
            _id_7F06( var_0, "deaths_total" );
    }

    var_2 = getspmatchdata( "checkpoints", "deaths_total" ) + 1;
    setspmatchdata( "checkpoints", "deaths_total", var_2 );
    _id_A5A4::save_time_played();
    var_3 = level.playercardbackground getrankedplayerdata( common_scripts\utility::getstatsgroup_sp(), "career", "deaths_total" );

    if ( isdefined( var_3 ) )
        level.playercardbackground setcommonplayerdata( common_scripts\utility::getstatsgroup_sp(), "career", "deaths_total", var_3 + 1 );
}

_id_72D8()
{
    var_0 = getspmatchdata( "checkpoints", "boosted_total" ) + 1;
    setspmatchdata( "checkpoints", "boosted_total", var_0 );
}

_id_72D9()
{
    var_0 = getspmatchdata( "checkpoints", "boosted_total" ) + 1;
    setspmatchdata( "checkpoints", "boosted_total", var_0 );
}

_id_72D7()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "exo_dodge" );
        var_0 = getspmatchdata( "checkpoints", "dodges_total" ) + 1;
        setspmatchdata( "checkpoints", "boosted_total", var_0 );
    }
}

_id_72E9()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "give_perk", var_0 );
        setspmatchdata( "perks", var_0, 1 );
    }
}

_id_56BD( var_0 )
{
    var_1 = level.playercardbackground _meth_84fb();
    setspmatchdata( "timestamp_end", var_1 );
    setspmatchdata( "career", "level_completion_timestamp", var_0, var_1 );
    setspmatchdata( "career", "levels_completed", var_0, 1 );
    var_2 = level.playercardbackground _meth_8211( "gameskill" );
    var_3 = level._id_2A63[int( var_2 )];
    setspmatchdata( "final_difficulty", var_3 );
    _id_A5A4::save_time_played();
}

_id_2C3A( var_0 )
{
    var_1 = [ "ammo", "iw5_bal27_sp", "iw5_ak12_sp", "iw5_hbra3_sp", "iw5_himar_sp", "iw5_arx160_sp", "iw5_m182spr_sp", "iw5_sn6_sp", "iw5_hmr9_sp", "iw5_mp11_sp", "iw5_sac3_sp", "iw5_asm1_sp", "iw5_kf5_sp", "iw5_mors_sp", "iw5_gm6_sp", "iw5_thor_sp", "iw5_uts19_sp", "iw5_maul_sp", "iw5_rhino_sp", "iw5_lsat_sp", "iw5_asaw_sp", "iw5_em1_sp", "iw5_epm3_sp", "iw5_titan45_sp", "iw5_pbw_sp", "iw5_vbr_sp", "iw5_rw1_sp", "iw5_microdronelauncher_sp", "iw5_stingerm7_sp", "iw5_mahem_sp", "iw5_maaws_sp", "unknown", "" ];
    return common_scripts\utility::_id_0CE4( var_1, var_0 );
}

_id_7F06( var_0, var_1 )
{
    if ( isdefined( var_0 ) && _id_2C3A( var_0 ) )
    {
        var_2 = int( getspmatchdata( "weapon_stats", var_0, var_1 ) ) + 1;
        setspmatchdata( "weapon_stats", var_0, var_1, var_2 );
    }
    else
    {
        var_2 = int( getspmatchdata( "weapon_stats", "unknown", var_1 ) ) + 1;
        setspmatchdata( "weapon_stats", "unknown", var_1, var_2 );
    }
}

_id_1BD6( var_0 )
{
    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "mod_grenade":
        case "mod_grenade_splash":
        case "mod_projectile":
        case "mod_projectile_splash":
        case "mod_explosive":
        case "splash":
            return 1;
        default:
            return 0;
    }

    return 0;
}
