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
    _id_8072();
    bot_koth_start();
}

bot_koth_start()
{
    setup_bot_koth();
}

_id_8072()
{
    level.bot_funcs["gametype_think"] = ::bot_koth_think;
    level.bot_funcs["should_start_cautious_approach"] = ::should_start_cautious_approach_koth;
}

setup_bot_koth()
{
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.radios.size; var_1++ )
    {
        var_2 = level.radios[var_1];
        var_2.script_model = "radio_" + var_1;
        var_2 thread maps\mp\bots\_bots_gametype_common::_id_5E23();
        var_3 = 0;

        if ( isdefined( var_2._id_9754._id_97CC ) && var_2._id_9754._id_97CC )
        {
            var_2._id_9754 common_scripts\utility::_id_97CE();
            var_3 = 1;
        }

        var_4 = 0;

        if ( !var_2._id_9E5A )
        {
            var_2 maps\mp\gametypes\koth::makeradiovisible();
            var_4 = 1;
        }

        var_2._id_6139 = maps\mp\bots\_bots_gametype_common::bot_get_valid_nodes_in_trigger( var_2._id_9754 );

        if ( var_3 )
            var_2._id_9754 common_scripts\utility::_id_97CC();

        if ( var_4 )
            var_2 maps\mp\gametypes\koth::makeradioinvisible();
    }

    level.bot_set_zone_nodes = 1;

    if ( !var_0 )
    {
        var_5 = find_current_radio();

        if ( !isdefined( var_5 ) )
            var_5 = common_scripts\utility::_id_710E( level.radios );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_5 ] );
        level.bot_gametype_radios_precached[var_5 getentitynumber()] = 1;
        level._id_1628 = 1;
        thread bot_cache_entrances_to_other_radios( var_5 );
    }
}

bot_cache_entrances_to_other_radios( var_0 )
{
    for ( var_1 = common_scripts\utility::_id_0CF6( level.radios, var_0 ); var_1.size > 0; var_1 = common_scripts\utility::_id_0CF6( var_1, var_2 ) )
    {
        var_2 = undefined;
        var_3 = find_current_radio();

        if ( isdefined( var_3 ) && common_scripts\utility::_id_0CE4( var_1, var_3 ) )
            var_2 = var_3;
        else
            var_2 = common_scripts\utility::_id_710E( var_1 );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_2 ] );
        level.bot_gametype_radios_precached[var_2 getentitynumber()] = 1;
    }
}

bot_koth_think()
{
    self notify( "bot_koth_think" );
    self endon( "bot_koth_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self botsetflag( "separation", 0 );
    self botsetflag( "grenade_objectives", 1 );

    for (;;)
    {
        wait 0.05;

        if ( self.helmet <= 0 )
            continue;

        var_0 = find_current_radio();

        if ( !isdefined( var_0 ) || !isdefined( level.bot_gametype_radios_precached[var_0 getentitynumber()] ) )
        {
            bot_clear_koth_zone();
            self [[ self._id_67E1 ]]();
            continue;
        }

        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

        if ( self.team != var_1 )
        {
            if ( !bot_is_capturing_koth_zone( var_0 ) )
                bot_capture_koth_zone( var_0 );

            continue;
        }

        var_2 = common_scripts\utility::_id_3D4F( self.team );
        var_3 = level.radioobject._id_940D[var_2].size > 0;

        if ( var_3 )
        {
            if ( !bot_is_capturing_koth_zone( var_0 ) )
                bot_capture_koth_zone( var_0 );

            continue;
        }

        if ( !bot_is_protecting_koth_zone( var_0 ) )
        {
            if ( bot_is_capturing_koth_zone( var_0 ) )
            {
                wait(randomfloat( 2 ));
                bot_clear_koth_zone();
                continue;
            }

            bot_protect_koth_zone( var_0 );
        }
    }
}

find_current_radio()
{
    foreach ( var_1 in level.radios )
    {
        if ( isdefined( level.radioobject ) && var_1._id_9754 == level.radioobject.trigger )
            return var_1;
    }
}

bot_is_capturing_koth_zone( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_165A() )
        return 0;

    return isdefined( self._id_2507 ) && self._id_2507 == var_0;
}

bot_is_protecting_koth_zone( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_1662() )
        return 0;

    return isdefined( self._id_2507 ) && self._id_2507 == var_0;
}

bot_capture_koth_zone( var_0 )
{
    self._id_2507 = var_0;
    var_1["entrance_points_index"] = var_0._id_3320;
    var_1["override_origin_node"] = var_0._id_1C10;
    maps\mp\bots\_bots_strategy::_id_15D2( var_0.origin, var_0._id_6139, var_0._id_9754, var_1 );
}

bot_protect_koth_zone( var_0 )
{
    self._id_2507 = var_0;
    var_1 = length( var_0._id_A3E0._id_44FB ) * 2;
    var_2["override_origin_node"] = var_0._id_1C10;
    maps\mp\bots\_bots_strategy::_id_16C2( var_0._id_1C10.origin, var_1, var_2 );
}

bot_clear_koth_zone()
{
    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    self._id_2507 = undefined;
}

should_start_cautious_approach_koth( var_0 )
{
    if ( var_0 )
    {
        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "neutral" || var_1 == self.team )
            return 0;
    }

    return maps\mp\bots\_bots_strategy::_id_847B( var_0 );
}
