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

_id_4D62()
{
    self._id_8D77["kills"] = 0;
    self._id_8D77["kills_melee"] = 0;
    self._id_8D77["kills_explosives"] = 0;
    self._id_8D77["kills_grenades"] = 0;
    self._id_8D77["kills_juggernaut"] = 0;
    self._id_8D77["kills_vehicle"] = 0;
    self._id_8D77["kills_sentry"] = 0;
    self._id_8D77["headshots"] = 0;
    self._id_8D77["shots_fired"] = 0;
    self._id_8D77["shots_hit"] = 0;
    self._id_8D77["weapon"] = [];
    self._id_8D77["current_checkpoint"] = 0;
    self._id_8D77["checkpoint_start"] = 0;
    self._id_8D77["final_difficulty"] = "";
    self._id_8D77["level_name"] = "";
    self._id_8D77["start_difficulty"] = "";
    self._id_8D77["career_kills_total"] = 0;
    self._id_8D77["career_deaths_total"] = 0;
    self._id_8D77["career_levels_completed"] = [];
    self._id_8D77["career_level_completed_timestamps"] = [];
    self._id_8D77["register_kills_for_vehicle_occupants"] = 1;
    thread _id_8447();
}

_id_A1BA()
{
    if ( isdefined( self._id_2A54 ) && self._id_2A54 )
        return 1;

    if ( !isdefined( self.damagelocation ) )
        return 0;

    return self.damagelocation == "helmet" || self.damagelocation == "head" || self.damagelocation == "neck";
}

_id_72DD( var_0, var_1 )
{
    var_2 = self;

    if ( isdefined( self.owner ) )
        var_2 = self.owner;

    if ( !isplayer( var_2 ) )
        return;

    if ( var_1 )
    {
        var_2._id_8D77["start_difficulty"] = var_0;
        setspmatchdata( "start_difficulty", var_0 );
    }
    else
    {
        var_2._id_8D77["final_difficulty"] = var_0;
        setspmatchdata( "final_difficulty", var_0 );
    }
}

_id_72E0( var_0 )
{
    var_1 = self;

    if ( isdefined( self.owner ) )
        var_1 = self.owner;

    if ( !isplayer( var_1 ) )
        return;

    var_1._id_8D77["level_name"] = var_0;
    setspmatchdata( "level_name", var_0 );
}

_id_93D9( var_0 )
{
    var_1 = self;

    if ( isdefined( self.owner ) )
        var_1 = self.owner;

    if ( !isplayer( var_1 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    var_1._id_8D77["register_kills_for_vehicle_occupants"] = var_0;
}

_id_8474()
{
    var_0 = self;

    if ( isdefined( self.owner ) )
        var_0 = self.owner;

    if ( !isplayer( var_0 ) )
        return 1;

    if ( isdefined( var_0._id_8D77["register_kills_for_vehicle_occupants"] ) && var_0._id_8D77["register_kills_for_vehicle_occupants"] )
        return 1;

    return 0;
}

_id_72DF( var_0, var_1, var_2, var_3 )
{
    var_4 = self;
    var_5 = 0;

    if ( isdefined( self.owner ) )
        var_4 = self.owner;

    if ( !isplayer( var_4 ) )
    {
        if ( isdefined( level._id_6E02 ) && level._id_6E02 )
            var_4 = level.players[randomint( level.players.size )];
    }

    if ( !isplayer( var_4 ) )
        return;

    if ( isdefined( level._id_85B6 ) && isdefined( var_0._id_2E18 ) && var_0._id_2E18 )
        return;

    var_4._id_8D77["kills"]++;
    var_4 _id_1B89( "kills", 1 );
    var_6 = level.player getrankedplayerdata( common_scripts\utility::getstatsgroup_sp(), "career", "kills_total" );

    if ( isdefined( var_6 ) )
        level.player setcommonplayerdata( common_scripts\utility::getstatsgroup_sp(), "career", "kills_total", var_6 + 1 );

    if ( maps\_utility::_id_5083() )
        level notify( "specops_player_kill", var_4, var_0, var_2, var_3 );

    if ( isdefined( var_0 ) )
    {
        if ( var_0 _id_A1BA() && var_1 != "MOD_MELEE" && var_1 != "MOD_MELEE_ALT" )
        {
            var_4._id_8D77["headshots"]++;
            var_4 _id_1B89( "headshots", 1 );
            var_5 = 1;
        }

        if ( isdefined( var_0._id_529C ) )
        {
            var_4._id_8D77["kills_juggernaut"]++;
            var_4 _id_1B89( "kills_juggernaut", 1 );
        }

        if ( isdefined( var_0._id_519D ) )
            var_4._id_8D77["kills_sentry"]++;

        if ( var_0.code_classname == "script_vehicle" )
        {
            var_4._id_8D77["kills_vehicle"]++;

            if ( var_4 _id_8474() )
            {
                if ( isdefined( var_0._id_750A ) )
                {
                    foreach ( var_8 in var_0._id_750A )
                    {
                        if ( isdefined( var_8 ) )
                            var_4 _id_72DF( var_8, var_1, var_2, var_3 );
                    }
                }
            }
        }
    }

    var_10 = 0;

    if ( _id_1BD6( var_1 ) )
    {
        var_4._id_8D77["kills_explosives"]++;
        var_10 = 1;
    }

    if ( _id_1BD7( var_1, var_2 ) && ( !isdefined( var_4._id_5B1D ) || !isdefined( var_4._id_5B1D.active ) || !var_4._id_5B1D.active ) )
    {
        var_4._id_8D77["kills_grenades"]++;
        var_4 _id_8D4B( "kills_grenades", 1 );
        var_10 = 1;
    }

    if ( !isdefined( var_2 ) )
        var_2 = var_4 getcurrentweapon();

    if ( issubstr( tolower( var_1 ), "melee" ) )
    {
        var_4._id_8D77["kills_melee"]++;

        if ( weaponinventorytype( var_2 ) == "primary" )
            return;
    }

    if ( var_4 _id_5055( var_2 ) )
        var_4 _id_72E2( var_2 );

    var_4._id_8D77["weapon"][var_2].kills++;
    var_4._id_8D77["career_kills_total"]++;

    if ( !var_10 )
        maps\_sp_matchdata::_id_4C38( var_2, var_5 );
}

_id_8D4D( var_0 )
{
    if ( !isdefined( self._id_8D4C ) )
        self._id_8D4C = [];

    self._id_8D4C[self._id_8D4C.size] = var_0;
}

_id_8D4B( var_0, var_1 )
{
    if ( isdefined( self._id_8D4C ) )
    {
        foreach ( var_3 in self._id_8D4C )
            self [[ var_3 ]]( var_0, var_1 );
    }
}

_id_1B89( var_0, var_1 )
{
    _id_8D4B( var_0, var_1 );

    if ( !maps\_utility::_id_5083() )
        return;
}

_id_72E7()
{
    if ( !isplayer( self ) )
        return;

    if ( isdefined( self._id_72F0 ) )
        return;

    self._id_72F0 = 1;
    self._id_8D77["shots_hit"]++;
    _id_1B89( "bullets_hit", 1 );
    var_0 = self getcurrentweapon();

    if ( _id_5055( var_0 ) )
        _id_72E2( var_0 );

    self._id_8D77["weapon"][var_0]._id_8448++;
    thread maps\_sp_matchdata::_id_4C37( var_0 );
    waitframe;
    self._id_72F0 = undefined;
}

_id_8447()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        var_0 = self getcurrentweapon();

        if ( !isdefined( var_0 ) || !maps\_utility::_id_5185( var_0 ) )
            continue;

        self._id_8D77["shots_fired"]++;
        _id_1B89( "bullets_fired", 1 );

        if ( _id_5055( var_0 ) )
            _id_72E2( var_0 );

        self._id_8D77["weapon"][var_0]._id_8446++;
        thread maps\_sp_matchdata::_id_8446( var_0 );
    }
}

_id_5055( var_0 )
{
    if ( isdefined( self._id_8D77["weapon"][var_0] ) )
        return 0;

    return 1;
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

_id_1BD7( var_0, var_1 )
{
    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "emp_grenade":
            if ( isdefined( var_1 ) && var_1 == "emp_grenade_var" )
                return 1;

            break;
        case "mod_projectile_splash":
            if ( isdefined( var_1 ) && var_1 == "iw5_microdronelauncher_sp" )
                return 1;

            break;
        case "mod_grenade":
        case "mod_grenade_splash":
            return 1;
        default:
            return 0;
    }

    return 0;
}

_id_72E2( var_0 )
{
    self._id_8D77["weapon"][var_0] = spawnstruct();
    self._id_8D77["weapon"][var_0].name = var_0;
    self._id_8D77["weapon"][var_0]._id_8446 = 0;
    self._id_8D77["weapon"][var_0]._id_8448 = 0;
    self._id_8D77["weapon"][var_0].kills = 0;
    self._id_8D77["weapon"][var_0].deaths = 0;
}

_id_7EC5()
{
    var_0 = 1;

    foreach ( var_2 in level.players )
    {
        setdvar( "stats_" + var_0 + "_kills_melee", var_2._id_8D77["kills_melee"] );
        setdvar( "stats_" + var_0 + "_kills_juggernaut", var_2._id_8D77["kills_juggernaut"] );
        setdvar( "stats_" + var_0 + "_kills_explosives", var_2._id_8D77["kills_explosives"] );
        setdvar( "stats_" + var_0 + "_kills_vehicle", var_2._id_8D77["kills_vehicle"] );
        setdvar( "stats_" + var_0 + "_kills_sentry", var_2._id_8D77["kills_sentry"] );
        var_3 = var_2 _id_3CDA( 5 );

        foreach ( var_5 in var_3 )
        {
            var_5.accuracy = 0;

            if ( var_5._id_8446 > 0 )
                var_5.accuracy = int( var_5._id_8448 / var_5._id_8446 * 100 );
        }

        for ( var_7 = 1; var_7 < 6; var_7++ )
        {
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_name", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_kills", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_shots", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_accuracy", " " );
        }

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            if ( !isdefined( var_3[var_7] ) )
                break;

            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_name", var_3[var_7].name );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_kills", var_3[var_7].kills );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_shots", var_3[var_7]._id_8446 );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_accuracy", var_3[var_7].accuracy + "%" );
        }

        var_0++;
    }
}

_id_3CDA( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0; var_2++ )
        var_1[var_2] = _id_3EC8( var_1 );

    return var_1;
}

_id_3EC8( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [];

    var_1 = undefined;

    foreach ( var_3 in self._id_8D77["weapon"] )
    {
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( var_3.name == var_6.name )
            {
                var_4 = 1;
                break;
            }
        }

        if ( var_4 )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_3;
            continue;
        }

        if ( var_3.kills > var_1.kills )
            var_1 = var_3;
    }

    return var_1;
}

_id_599F()
{

}
