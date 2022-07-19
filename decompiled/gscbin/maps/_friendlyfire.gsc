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
    level.friendlyfire["min_participation"] = -200;
    level.friendlyfire["max_participation"] = 1000;
    level.friendlyfire["enemy_kill_points"] = 250;
    level.friendlyfire["friend_kill_points"] = -650;
    level.friendlyfire["point_loss_interval"] = 1.25;
    level.playercardbackground._id_669E = 0;
    level._id_3AA7 = 0;
    level._id_3AA8 = 0;
    setdvarifuninitialized( "friendlyfire_dev_disabled", "0" );
    common_scripts\utility::_id_383D( "friendly_fire_warning" );
    thread _id_269E();
    thread _id_66A0();
}

_id_269E()
{

}

_id_0CA3( var_0 )
{
    level._id_3A9C = var_0;
}

_id_734D( var_0 )
{
    level._id_3A9C = undefined;
}

_id_3A59( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.team ) )
        var_0.team = "allies";

    if ( isdefined( level._id_60FA ) )
        return;

    level endon( "mission failed" );
    level thread _id_6228( var_0 );
    level thread _id_622A( var_0 );
    level thread _id_622B( var_0 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_0.helmet <= 0 )
            return;

        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_0 waittill( "friendlyfire_notify", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_0 ) )
            return;

        if ( !isdefined( var_2 ) )
            continue;

        if ( isdefined( level._id_3A9C ) )
        {
            var_1 *= level._id_3A9C;
            var_1 = int( var_1 );
        }

        var_8 = 0;

        if ( !isdefined( var_6 ) )
            var_6 = var_0.damageweapon;

        if ( isdefined( level._id_3A9D ) )
        {
            if ( isdefined( var_2._id_25A9 ) )
            {
                var_7 = 1;
                var_2 = var_2._id_25A9;
            }
        }

        if ( isdefined( level._id_3A9E ) )
        {
            if ( isdefined( var_2 ) && isdefined( var_2.owner ) && var_2.owner == level.playercardbackground )
                var_8 = 1;
        }

        if ( isplayer( var_2 ) )
        {
            var_8 = 1;

            if ( isdefined( var_6 ) && var_6 == "none" )
                var_8 = 0;

            if ( var_2 isusingturret() )
                var_8 = 1;

            if ( isdefined( var_7 ) )
                var_8 = 1;
        }
        else if ( isdefined( var_2.code_classname ) && var_2.code_classname == "script_vehicle" )
        {
            var_9 = var_2 getvehicleowner();

            if ( isdefined( var_9 ) && isplayer( var_9 ) )
                var_8 = 1;
        }

        if ( !var_8 )
            continue;

        if ( !isdefined( var_0.team ) )
            continue;

        var_10 = var_0.team == level.playercardbackground.team;
        var_11 = undefined;

        if ( isdefined( var_0.unlockpoints ) && var_0.unlockpoints == "civilian" )
            var_11 = 1;
        else
            var_11 = issubstr( var_0.classname, "civilian" );

        var_12 = var_1 == -1;

        if ( !var_10 && !var_11 )
        {
            if ( var_12 )
            {
                level.playercardbackground._id_669E += level.friendlyfire["enemy_kill_points"];
                _id_669F();
                return;
            }

            continue;
        }

        if ( isdefined( var_0._id_60FA ) )
            continue;

        if ( var_5 == "MOD_PROJECTILE_SPLASH" && isdefined( level._id_60FB ) )
            continue;

        if ( isdefined( var_6 ) && var_6 == "claymore" )
        {
            if ( isdefined( level.claymoreexplodethisframe_byplayer ) && level.claymoreexplodethisframe_byplayer )
            {

            }
            else
                continue;
        }

        if ( var_12 )
        {
            if ( isdefined( var_0._id_3A3A ) )
                level.playercardbackground._id_669E += var_0._id_3A3A;
            else
                level.playercardbackground._id_669E += level.friendlyfire["friend_kill_points"];
        }
        else
            level.playercardbackground._id_669E -= var_1;

        _id_669F();

        if ( _id_1CC1( var_0, var_5 ) && _id_780F() )
        {
            if ( var_12 )
                return;
            else
                continue;
        }

        if ( isdefined( level._id_3A58 ) )
        {
            [[ level._id_3A58 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
            continue;
        }

        _id_3A57( var_11 );
    }
}

_id_3A57( var_0 )
{
    if ( isdefined( level._id_361A ) && level._id_361A )
    {
        level thread _id_5CDD( var_0 );
        return;
    }

    var_1 = level._id_3AA8;

    if ( isdefined( level._id_3A9D ) && var_0 )
        var_1 = 0;

    if ( var_1 )
        return;

    if ( level._id_3AA7 == 1 )
        return;

    if ( level.playercardbackground._id_669E <= level.friendlyfire["min_participation"] )
        level thread _id_5CDD( var_0 );
}

_id_1CC1( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = 0;

    if ( isdefined( var_0.damageweapon ) && var_0.damageweapon == "none" )
        var_2 = 1;

    if ( isdefined( var_1 ) && var_1 == "MOD_GRENADE_SPLASH" )
        var_2 = 1;

    return var_2;
}

_id_780F()
{
    var_0 = gettime();

    if ( var_0 < 4500 )
        return 1;
    else if ( var_0 - level._id_5578 < 4500 )
        return 1;

    return 0;
}

_id_669F()
{
    if ( level.playercardbackground._id_669E > level.friendlyfire["max_participation"] )
        level.playercardbackground._id_669E = level.friendlyfire["max_participation"];

    if ( level.playercardbackground._id_669E < level.friendlyfire["min_participation"] )
        level.playercardbackground._id_669E = level.friendlyfire["min_participation"];
}

_id_66A0()
{
    level endon( "mission failed" );

    for (;;)
    {
        if ( level.playercardbackground._id_669E > 0 )
            level.playercardbackground._id_669E--;
        else if ( level.playercardbackground._id_669E < 0 )
            level.playercardbackground._id_669E++;

        wait(level.friendlyfire["point_loss_interval"]);
    }
}

_id_992E()
{
    level._id_3AA7 = 0;
}

_id_9932()
{
    level._id_3AA7 = 1;
}

_id_5CDD( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( getdvar( "friendlyfire_dev_disabled" ) == "1" )
        return;

    level.playercardbackground endon( "death" );

    if ( !isalive( level.playercardbackground ) )
        return;

    level endon( "mine death" );
    level notify( "mission failed" );
    level notify( "friendlyfire_mission_fail" );
    waitframe;
    setsaveddvar( "hud_missionFailed", 1 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );

    if ( isdefined( level.playercardbackground._id_3615 ) )
        return;

    _id_A5E8::_id_870C( "friendly_fire_mission_failed" );

    if ( var_0 )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_CIVILIAN_KILLED" );
    else if ( isdefined( level._id_2543 ) )
        _id_A56A::_id_7E03( level._id_2543 );
    else if ( level._id_1A3D == "british" )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH" );
    else if ( level._id_1A3D == "russian" )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_RUSSIAN" );
    else
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );

    if ( isdefined( level._id_2544 ) )
        thread _id_A56A::_id_7E04( level._id_2544, 64, 64, 0 );

    reconspatialevent( level.playercardbackground.origin, "script_friendlyfire: civilian %d", var_0 );
    _id_A5A4::_id_5CDF();
}

_id_6228( var_0 )
{
    level endon( "mission failed" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_8 = undefined;
        var_9 = undefined;
        var_10 = undefined;
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_0 notify( "friendlyfire_notify", var_1, var_2, var_3, var_4, var_5, var_10 );
    }
}

_id_622A( var_0 )
{
    level endon( "mission failed" );
    var_0 waittill( "damage_notdone", var_1, var_2, var_3, var_4, var_5 );
    var_0 notify( "friendlyfire_notify", -1, var_2, undefined, undefined, var_5 );
}

_id_622B( var_0 )
{
    level endon( "mission failed" );
    var_0 waittill( "death", var_1, var_2, var_3 );
    var_0 notify( "friendlyfire_notify", -1, var_1, undefined, undefined, var_2, var_3 );
}

_id_2993( var_0 )
{

}
