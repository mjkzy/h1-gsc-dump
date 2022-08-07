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

_id_4DD7()
{
    if ( getdvar( "beautiful_corner" ) != "1" )
    {
        _id_1E5F();
        return 0;
    }

    level.beautiful_views = [];
    level.beautiful_visions = [];
    level.beautiful_lightsets = [];
    level.beautiful_cluts = [];
    level.beautiful_dof = [];
    level.beautiful_view_static = 1;
    level.beautiful_view_index = 0;
    level.beautiful_weapon = undefined;
    return 1;
}

activate()
{
    thread beautiful_player();
    thread beautiful_guys();
    thread beautiful_views();
}

_id_1E5F()
{
    var_0 = getentarray( "beautiful_guy", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

beautiful_player()
{
    level.playercardbackground takeallweapons();
    level.playercardbackground disableoffhandweapons();

    if ( isdefined( level.beautiful_weapon ) )
    {
        level.playercardbackground giveweapon( level.beautiful_weapon );
        level.playercardbackground switchtoweapon( level.beautiful_weapon );
    }

    level.playercardbackground thread beautiful_player_ammo();
    level._id_3AA7 = 1;
    level.playercardbackground enableinvulnerability();
}

beautiful_player_ammo()
{
    var_0 = self getweaponslistall();
    self.maintain_stock = [];

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( self.maintain_stock[var_2] ) )
            self.maintain_stock[var_2] = self getweaponammostock( var_2 );
    }

    for (;;)
    {
        foreach ( var_2 in var_0 )
            self setweaponammostock( var_2, self.maintain_stock[var_2] );

        wait 1;
    }
}

beautiful_guys()
{
    var_0 = getentarray( "beautiful_guy", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_shg_design_tools::_id_072C();

        if ( !isdefined( var_3 ) )
            return;

        var_3 maps\_utility::_id_5926();
        var_3 maps\_utility::_id_08EB();
        var_3 maps\_utility::_id_58D7();
        var_3._id_79EE = "none";

        if ( isdefined( level.beautiful_weapon ) )
            var_3 maps\_utility::_id_39D0( level.beautiful_weapon, "primary" );

        if ( isdefined( var_2.script_parentname ) )
        {
            var_3._id_0C72 = "beautiful_guy";
            var_3 thread maps\_anim::_id_0BE1( var_3, var_2.script_parentname, undefined, "stop_idle" );
        }
    }
}

beautiful_views()
{
    beautiful_view_origin_offsets();
    beautiful_view_init();
    thread beautiful_view_move_request();
    thread beautiful_view_state_request();
}

beautiful_view_origin_offsets()
{
    var_0 = [ 0.0, 0.0, -60.0 ];

    foreach ( var_2 in level.beautiful_views )
    {
        var_3 = getent( var_2, "targetname" );
        beautiful_offset_view_origin( var_3, var_0 );
        var_4 = getent( var_2 + "_static", "targetname" );
        beautiful_offset_view_origin( var_4, var_0 );
    }
}

beautiful_offset_view_origin( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.script_parentname ) )
        return;

    if ( var_0.script_parentname != "view_pos" )
        return;

    var_2 = spawnstruct();
    var_2.entity = var_0;
    var_2.forward = var_1[0];
    var_2.riotshield_damaged = var_1[1];
    var_2.upgradepurchased = var_1[2];
    var_2 maps\_utility::_id_9723();
}

beautiful_view_init()
{
    if ( level.beautiful_views.size <= 0 )
        return;

    common_scripts\utility::_id_383D( "beautiful_view_transitioning" );
    common_scripts\utility::_id_3831( "beautiful_view_transitioning" );
    level._id_148A = maps\_hud_util::_id_23A2( "black", 1 );
    level._id_148A.space = 1000;
    level.playercardbackground takeweapon( "beretta" );
    level.playercardbackground takeweapon( "fraggrenade" );
    level.playercardbackground takeweapon( "flash_grenade" );
    beautiful_view_position( level.beautiful_views[level.beautiful_view_index] );
    wait 0.05;
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "actionSlotsHide", "1" );
    wait 0.5;
    level.playercardbackground disableweapons();
    level.playercardbackground freezecontrols( 1 );
    wait 1.0;
    beautiful_view_fade_in();
}

beautiful_view_move_request()
{
    for (;;)
    {
        while ( !( level.playercardbackground buttonpressed( "DPAD_UP" ) || level.playercardbackground buttonpressed( "HOME" ) ) )
            wait 0.05;

        if ( !common_scripts\utility::_id_382E( "beautiful_view_transitioning" ) )
        {
            beautiful_view_get_next_position();
            beautiful_view_update( level.beautiful_views[level.beautiful_view_index] );
        }

        wait 0.05;
    }
}

beautiful_view_get_next_position()
{
    for ( var_0 = undefined; !isdefined( var_0 ); var_0 = getent( var_1, "targetname" ) )
    {
        level.beautiful_view_index++;

        if ( level.beautiful_view_index >= level.beautiful_views.size )
            level.beautiful_view_index = 0;

        var_1 = level.beautiful_views[level.beautiful_view_index];

        if ( level.beautiful_view_static )
            var_1 += "_static";
    }
}

beautiful_view_state_request()
{
    for (;;)
    {
        while ( !( level.playercardbackground buttonpressed( "DPAD_DOWN" ) || level.playercardbackground buttonpressed( "END" ) ) )
            wait 0.05;

        if ( !common_scripts\utility::_id_382E( "beautiful_view_transitioning" ) )
        {
            level.beautiful_view_static = !level.beautiful_view_static;
            beautiful_view_update( level.beautiful_views[level.beautiful_view_index] );
        }

        wait 0.05;
    }
}

beautiful_view_update( var_0 )
{
    common_scripts\utility::_id_383F( "beautiful_view_transitioning" );
    beautiful_view_fade_out();
    beautiful_view_position( var_0 );
    wait 0.25;
    beautiful_view_fade_in();
    wait 0.25;
    common_scripts\utility::_id_3831( "beautiful_view_transitioning" );
}

beautiful_view_fade_in()
{
    wait 0.1;
    level._id_148A fadeovertime( 0.3 );
    level._id_148A.alpha = 0;

    if ( !level.beautiful_view_static )
        level.playercardbackground enableweapons();

    wait 0.3;

    if ( !level.beautiful_view_static )
        level.playercardbackground freezecontrols( 0 );

    level.playercardbackground hidehud();
}

beautiful_view_fade_out()
{
    level.playercardbackground showhud();
    level.playercardbackground setstance( "stand" );
    level._id_148A fadeovertime( 0.3 );
    level._id_148A.alpha = 1;
    level.playercardbackground disableweapons();
    wait 0.3;
    level.playercardbackground freezecontrols( 1 );
    wait 0.1;
}

beautiful_view_position( var_0 )
{
    if ( level.beautiful_visions[var_0] != "" )
        maps\_utility::_id_9E6E( level.beautiful_visions[var_0], 0 );

    if ( level.beautiful_lightsets[var_0] != "" )
        level.playercardbackground _meth_83be( level.beautiful_lightsets[var_0] );

    if ( level.beautiful_cluts[var_0] != "" )
        level.playercardbackground _meth_848c( level.beautiful_cluts[var_0], 0 );

    if ( level.beautiful_view_static && isdefined( level.beautiful_dof[var_0] ) )
    {
        var_1 = level.beautiful_dof[var_0];
        level.playercardbackground _meth_84a5();
        level.playercardbackground _meth_84a7( var_1["fstop"], var_1["focus_distance"], var_1["focus_speed"], var_1["aperture_speed"] );
    }
    else
        level.playercardbackground _meth_84a6();

    level.playercardbackground setstance( "stand" );

    if ( level.beautiful_view_static )
        beautiful_view_position_static( var_0 + "_static" );
    else
        beautiful_view_position_dynamic( var_0 );
}

beautiful_view_position_dynamic( var_0 )
{
    level.playercardbackground unlink();
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    level.playercardbackground setorigin( var_1.origin );
    level.playercardbackground setplayerangles( var_1.angles );
}

beautiful_view_position_static( var_0 )
{
    level.playercardbackground unlink();
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( level.beautiful_view_ent ) )
        level.beautiful_view_ent = common_scripts\utility::_id_8959();

    level.beautiful_view_ent.origin = var_1.origin;
    level.beautiful_view_ent.angles = var_1.angles;
    level.playercardbackground setorigin( level.beautiful_view_ent.origin );
    level.playercardbackground setplayerangles( level.beautiful_view_ent.angles );
    level.playercardbackground playerlinktoabsolute( level.beautiful_view_ent, "tag_origin" );
}
