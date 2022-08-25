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

_id_4CCA( var_0 )
{
    common_scripts\utility::_id_383D( "player_looks_away_from_spawner" );
    common_scripts\utility::_id_383D( "friendly_spawner_locked" );
    level.arrays_of_colorcoded_nodes = [];
    level.arrays_of_colorcoded_nodes["axis"] = [];
    level.arrays_of_colorcoded_nodes["allies"] = [];
    level.colorcoded_volumes = [];
    level.colorcoded_volumes["axis"] = [];
    level.colorcoded_volumes["allies"] = [];
    var_1 = [];
    var_1 = common_scripts\utility::array_combine( var_1, getentarray( "trigger_multiple", "classname" ) );
    var_1 = common_scripts\utility::array_combine( var_1, getentarray( "trigger_radius", "classname" ) );
    var_1 = common_scripts\utility::array_combine( var_1, getentarray( "trigger_once", "classname" ) );
    var_2 = getentarray( "info_volume", "classname" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_7975 ) )
            var_0[var_3] add_node_to_global_arrays( var_0[var_3]._id_7975, "allies" );

        if ( isdefined( var_0[var_3]._id_7976 ) )
            var_0[var_3] add_node_to_global_arrays( var_0[var_3]._id_7976, "axis" );
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3]._id_7975 ) )
            var_1[var_3] thread _id_97AC( var_1[var_3]._id_7975, "allies" );

        if ( isdefined( var_1[var_3]._id_7976 ) )
            var_1[var_3] thread _id_97AC( var_1[var_3]._id_7976, "axis" );
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3]._id_7975 ) )
            var_2[var_3] add_volume_to_global_arrays( var_2[var_3]._id_7975, "allies" );

        if ( isdefined( var_2[var_3]._id_7976 ) )
            var_2[var_3] add_volume_to_global_arrays( var_2[var_3]._id_7975, "axis" );
    }

    level._id_203D = [];
    add_cover_node( "BAD NODE" );
    add_cover_node( "Cover Stand" );
    add_cover_node( "Cover Crouch" );
    add_cover_node( "Cover Prone" );
    add_cover_node( "Cover Crouch Window" );
    add_cover_node( "Cover Right" );
    add_cover_node( "Cover Left" );
    add_cover_node( "Cover Wide Left" );
    add_cover_node( "Cover Wide Right" );
    add_cover_node( "Conceal Stand" );
    add_cover_node( "Conceal Crouch" );
    add_cover_node( "Conceal Prone" );
    add_cover_node( "Reacquire" );
    add_cover_node( "Balcony" );
    add_cover_node( "Scripted" );
    add_cover_node( "Begin" );
    add_cover_node( "End" );
    add_cover_node( "Turret" );
    add_path_node( "Guard" );
    add_path_node( "Path" );
    level._id_204D = [];
    level._id_204D[level._id_204D.size] = "r";
    level._id_204D[level._id_204D.size] = "b";
    level._id_204D[level._id_204D.size] = "y";
    level._id_204D[level._id_204D.size] = "c";
    level._id_204D[level._id_204D.size] = "g";
    level._id_204D[level._id_204D.size] = "p";
    level._id_204D[level._id_204D.size] = "o";
    level._id_204D[level._id_204D.size] = "w";
    level._id_204D[level._id_204D.size] = "a";
    level._id_204D[level._id_204D.size] = "l";
    level._id_2048["red"] = "r";
    level._id_2048["r"] = "r";
    level._id_2048["blue"] = "b";
    level._id_2048["b"] = "b";
    level._id_2048["yellow"] = "y";
    level._id_2048["y"] = "y";
    level._id_2048["cyan"] = "c";
    level._id_2048["c"] = "c";
    level._id_2048["green"] = "g";
    level._id_2048["g"] = "g";
    level._id_2048["purple"] = "p";
    level._id_2048["p"] = "p";
    level._id_2048["orange"] = "o";
    level._id_2048["o"] = "o";
    level._id_2048["white"] = "w";
    level._id_2048["w"] = "w";
    level._id_2048["aqua"] = "a";
    level._id_2048["a"] = "a";
    level._id_2048["lime"] = "l";
    level._id_2048["l"] = "l";
    level._id_250D = [];
    level._id_250D["allies"] = [];
    level._id_250D["axis"] = [];
    level._id_558A = [];
    level._id_558A["allies"] = [];
    level._id_558A["axis"] = [];

    for ( var_3 = 0; var_3 < level._id_204D.size; var_3++ )
    {
        level.arrays_of_colorforced_ai["allies"][level._id_204D[var_3]] = [];
        level.arrays_of_colorforced_ai["axis"][level._id_204D[var_3]] = [];
        level._id_250D["allies"][level._id_204D[var_3]] = undefined;
        level._id_250D["axis"][level._id_204D[var_3]] = undefined;
    }

    thread _id_6AB9();

    if ( getdvar( "shownodecolors" ) == "1" )
        thread shownodecolors();
}

convert_color_to_short_string()
{
    self._id_79E6 = level._id_2048[self._id_79E6];
}

ai_picks_destination( var_0 )
{
    if ( isdefined( self._id_79E6 ) )
    {
        convert_color_to_short_string();
        self._id_250C = var_0;
        var_1 = self._id_79E6;
        level.arrays_of_colorforced_ai[self.team][var_1] = common_scripts\utility::array_add( level.arrays_of_colorforced_ai[self.team][var_1], self );
        thread _id_427C();
        return;
    }
}

_id_427C()
{
    if ( !isdefined( self._id_250C ) )
        return;

    var_0 = level.arrays_of_colorcoded_nodes[self.team][self._id_250C];
    _id_5674();

    if ( !isalive( self ) )
        return;

    if ( !maps\_utility::_id_46E8() )
        return;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isalive( var_2._id_2043 ) && var_2._id_2043 != level.player )
            continue;

        thread ai_sets_goal_with_delay( var_2 );
        thread decrementcolorusers( var_2 );
        return;
    }

    no_node_to_go_to();
}

no_node_to_go_to()
{

}

get_color_list()
{
    var_0 = [];
    var_0[var_0.size] = "r";
    var_0[var_0.size] = "b";
    var_0[var_0.size] = "y";
    var_0[var_0.size] = "c";
    var_0[var_0.size] = "g";
    var_0[var_0.size] = "p";
    var_0[var_0.size] = "o";
    var_0[var_0.size] = "w";
    var_0[var_0.size] = "a";
    var_0[var_0.size] = "l";
    return var_0;
}

get_colorcodes_from_trigger( var_0, var_1 )
{
    var_2 = strtok( var_0, " " );
    var_3 = [];
    var_4 = [];
    var_5 = [];
    var_6 = get_color_list();

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        var_8 = undefined;

        for ( var_9 = 0; var_9 < var_6.size; var_9++ )
        {
            if ( issubstr( var_2[var_7], var_6[var_9] ) )
            {
                var_8 = var_6[var_9];
                break;
            }
        }

        if ( !isdefined( level.arrays_of_colorcoded_nodes[var_1][var_2[var_7]] ) )
            continue;

        var_4[var_8] = var_2[var_7];
        var_3[var_3.size] = var_8;
        var_5[var_5.size] = var_2[var_7];
    }

    var_2 = var_5;
    var_10 = [];
    var_10["colorCodes"] = var_2;
    var_10["colorCodesByColorIndex"] = var_4;
    var_10["colors"] = var_3;
    return var_10;
}

_id_97AC( var_0, var_1 )
{
    var_2 = get_colorcodes_from_trigger( var_0, var_1 );
    var_3 = var_2["colorCodes"];
    var_4 = var_2["colorCodesByColorIndex"];
    var_5 = var_2["colors"];

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( self.activated_color_trigger ) )
        {
            self.activated_color_trigger = undefined;
            continue;
        }

        activate_color_trigger_internal( var_3, var_5, var_1, var_4 );
    }
}

activate_color_trigger( var_0 )
{
    if ( var_0 == "allies" )
        thread get_colorcodes_and_activate_trigger( self._id_7975, var_0 );
    else
        thread get_colorcodes_and_activate_trigger( self._id_7976, var_0 );
}

get_colorcodes_and_activate_trigger( var_0, var_1 )
{
    var_2 = get_colorcodes_from_trigger( var_0, var_1 );
    var_3 = var_2["colorCodes"];
    var_4 = var_2["colorCodesByColorIndex"];
    var_5 = var_2["colors"];
    activate_color_trigger_internal( var_3, var_5, var_1, var_4 );
}

activate_color_trigger_internal( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( !isdefined( level.arrays_of_colorcoded_spawners[var_2][var_0[var_4]] ) )
            continue;

        level.arrays_of_colorcoded_spawners[var_2][var_0[var_4]] = common_scripts\utility::array_removeundefined( level.arrays_of_colorcoded_spawners[var_2][var_0[var_4]] );

        for ( var_5 = 0; var_5 < level.arrays_of_colorcoded_spawners[var_2][var_0[var_4]].size; var_5++ )
            level.arrays_of_colorcoded_spawners[var_2][var_0[var_4]][var_5]._id_250C = var_0[var_4];
    }

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        level.arrays_of_colorforced_ai[var_2][var_1[var_4]] = maps\_utility::array_removedead( level.arrays_of_colorforced_ai[var_2][var_1[var_4]] );
        level._id_558A[var_2][var_1[var_4]] = level._id_250D[var_2][var_1[var_4]];
        level._id_250D[var_2][var_1[var_4]] = var_3[var_1[var_4]];
    }

    var_6 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( _id_77E0( var_2, var_1[var_4] ) )
            continue;

        var_7 = var_0[var_4];

        if ( !isdefined( level.arrays_of_colorcoded_ai[var_2][var_7] ) )
            continue;

        var_6[var_7] = _id_51C0( var_7, var_1[var_4], var_2 );
    }

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_7 = var_0[var_4];

        if ( !isdefined( var_6[var_7] ) )
            continue;

        if ( _id_77E0( var_2, var_1[var_4] ) )
            continue;

        if ( !isdefined( level.arrays_of_colorcoded_ai[var_2][var_7] ) )
            continue;

        _id_51BD( var_7, var_1[var_4], var_2, var_6[var_7] );
    }
}

_id_77E0( var_0, var_1 )
{
    if ( !isdefined( level._id_558A[var_0][var_1] ) )
        return 0;

    return level._id_558A[var_0][var_1] == level._id_250D[var_0][var_1];
}

_id_6FE7( var_0, var_1 )
{
    if ( issubstr( var_0._id_7975, var_1 ) )
        self._id_2298[self._id_2298.size] = var_0;
    else
        self._id_2297[self._id_2297.size] = var_0;
}

_id_6FE8( var_0, var_1 )
{
    if ( issubstr( var_0._id_7976, var_1 ) )
        self._id_2298[self._id_2298.size] = var_0;
    else
        self._id_2297[self._id_2297.size] = var_0;
}

_id_6FE6( var_0, var_1 )
{
    self._id_2297[self._id_2297.size] = var_0;
}

_id_6FEF( var_0, var_1 )
{
    self._id_66CC[self._id_66CC.size] = var_0;
}

_id_6FBC( var_0, var_1, var_2 )
{
    var_3 = level.arrays_of_colorcoded_nodes[var_0][var_1];
    var_4 = spawnstruct();
    var_4._id_66CC = [];
    var_4._id_2297 = [];
    var_4._id_2298 = [];
    var_5 = isdefined( level._id_558A[var_0][var_2] );

    for ( var_6 = 0; var_6 < var_3.size; var_6++ )
    {
        var_7 = var_3[var_6];
        var_4 [[ level._id_203D[var_7.type][var_5][var_0] ]]( var_7, level._id_558A[var_0][var_2] );
    }

    var_4._id_2297 = common_scripts\utility::array_randomize( var_4._id_2297 );
    var_3 = var_4._id_2297;

    for ( var_6 = 0; var_6 < var_4._id_2298.size; var_6++ )
        var_3[var_3.size] = var_4._id_2298[var_6];

    for ( var_6 = 0; var_6 < var_4._id_66CC.size; var_6++ )
        var_3[var_3.size] = var_4._id_66CC[var_6];

    level.arrays_of_colorcoded_nodes[var_0][var_1] = var_3;
}

get_prioritized_colorcoded_nodes( var_0, var_1, var_2 )
{
    return level.arrays_of_colorcoded_nodes[var_0][var_1];
}

_id_51C0( var_0, var_1, var_2 )
{
    level.arrays_of_colorcoded_ai[var_2][var_0] = maps\_utility::array_removedead( level.arrays_of_colorcoded_ai[var_2][var_0] );
    var_3 = level.arrays_of_colorcoded_ai[var_2][var_0];
    var_3 = common_scripts\utility::array_combine( var_3, level.arrays_of_colorforced_ai[var_2][var_1] );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( isdefined( var_3[var_5]._id_250C ) && var_3[var_5]._id_250C == var_0 )
            continue;

        var_4[var_4.size] = var_3[var_5];
    }

    var_3 = var_4;

    if ( !var_3.size )
        return;

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_3[var_5] _id_5674();

    return var_3;
}

_id_51BD( var_0, var_1, var_2, var_3 )
{
    if ( !var_3.size )
        return;

    var_4 = var_3;
    _id_6FBC( var_2, var_0, var_1 );
    var_5 = get_prioritized_colorcoded_nodes( var_2, var_0, var_1 );

    if ( !var_5.size )
        return;

    var_6 = maps\_utility::_id_3F74( "ai_color_squadAssignmentOverride", 0 );
    var_7 = var_6 > 0;

    if ( var_6 == 0 )
    {
        var_8 = var_3[0] should_assign_nodes_intelligently_for_squad();

        foreach ( var_10 in var_3 )
        {
            var_11 = var_10 should_assign_nodes_intelligently_for_squad();

            if ( var_11 )
                var_7 = 1;
        }

        var_13 = var_5[0] should_assign_nodes_intelligently_for_squad();

        foreach ( var_15 in var_5 )
        {
            var_16 = var_15 should_assign_nodes_intelligently_for_squad();

            if ( var_16 )
                var_7 = 1;
        }
    }

    var_18 = 0;
    var_19 = var_3.size;

    if ( var_7 )
    {
        var_18 = 1;
        var_20 = ( 0.0, 0.0, 0.0 );

        foreach ( var_15 in var_5 )
            var_20 += var_15.origin;

        var_20 /= var_5.size;
        var_23 = ( 0.0, 0.0, 0.0 );

        foreach ( var_10 in var_3 )
            var_23 += var_10.origin;

        var_23 /= var_3.size;
        var_3 = sortbydistance( var_3, var_20 );
        var_5 = sortbydistance( var_5, var_23 );
    }

    for ( var_26 = 0; var_26 < var_5.size; var_26++ )
    {
        var_15 = var_5[var_26];

        if ( isalive( var_15._id_2043 ) )
            continue;

        var_27 = undefined;
        var_28 = var_18;

        if ( var_7 )
        {
            var_27 = var_3[var_3.size - 1];
            var_28 = var_19 - var_18;
        }
        else
            var_27 = common_scripts\utility::_id_3F33( var_15.origin, var_3 );

        var_3 = common_scripts\utility::array_remove( var_3, var_27 );
        var_27 _id_910C( var_15, var_0, self, var_28 );
        var_18++;

        if ( !var_3.size )
            return;
    }
}

_id_910C( var_0, var_1, var_2, var_3 )
{
    self notify( "stop_color_move" );
    self._id_250C = var_1;
    thread _id_6FE5( var_0, var_2, var_3 );
}

assign_nodes_intelligently_for_squad( var_0 )
{
    if ( var_0 )
        self._id_7979 = 1;
    else
        self._id_7979 = undefined;
}

assign_nodes_intelligently_for_team( var_0, var_1 )
{
    if ( !isdefined( level.team_assign_nodes_intelligently ) )
        level.team_assign_nodes_intelligently = [];

    level.team_assign_nodes_intelligently[var_0] = var_1;
    var_2 = getaiarray( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3]._id_7979 = var_1;
}

setup_nodes_intelligently_from_team()
{
    if ( !isdefined( level.team_assign_nodes_intelligently ) )
        return;

    if ( !isdefined( level.team_assign_nodes_intelligently[self.team] ) )
        return;

    self._id_7979 = level.team_assign_nodes_intelligently[self.team];
}

should_assign_nodes_intelligently_for_squad()
{
    return isdefined( self._id_7979 ) && self._id_7979;
}

_id_6AB9()
{
    for (;;)
    {
        var_0 = undefined;

        if ( !isdefined( level.player.node ) )
        {
            wait 0.05;
            continue;
        }

        var_1 = level.player.node._id_2043;
        var_0 = level.player.node;
        var_0._id_2043 = level.player;

        for (;;)
        {
            if ( !isdefined( level.player.node ) )
                break;

            if ( level.player.node != var_0 )
                break;

            wait 0.05;
        }

        var_0._id_2043 = undefined;
        var_0 color_node_finds_a_user();
    }
}

color_node_finds_a_user()
{
    if ( isdefined( self._id_7975 ) )
        color_node_finds_user_from_colorcodes( self._id_7975, "allies" );

    if ( isdefined( self._id_7976 ) )
        color_node_finds_user_from_colorcodes( self._id_7976, "axis" );
}

color_node_finds_user_from_colorcodes( var_0, var_1 )
{
    if ( isdefined( self._id_2043 ) )
        return;

    var_2 = strtok( var_0, " " );
    common_scripts\utility::array_levelthread( var_2, ::color_node_finds_user_for_colorcode, var_1 );
}

color_node_finds_user_for_colorcode( var_0, var_1 )
{
    var_2 = var_0[0];

    if ( !isdefined( level._id_250D[var_1][var_2] ) )
        return;

    if ( level._id_250D[var_1][var_2] != var_0 )
        return;

    var_3 = maps\_utility::_id_3D7A( var_1, var_2 );

    if ( !var_3.size )
        return;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( var_5 occupies_colorcode( var_0 ) )
            continue;

        var_5 _id_910C( self, var_0 );
        return;
    }
}

occupies_colorcode( var_0 )
{
    if ( !isdefined( self._id_250C ) )
        return 0;

    return self._id_250C == var_0;
}

ai_sets_goal_with_delay( var_0 )
{
    self endon( "death" );
    var_1 = _id_6032();

    if ( var_1 )
    {
        self endon( "stop_color_move" );
        wait(var_1);
    }

    thread ai_sets_goal( var_0 );
}

ai_sets_goal( var_0 )
{
    self notify( "stop_going_to_node" );
    set_goal_and_volume( var_0 );
    var_1 = level.colorcoded_volumes[self.team][self._id_250C];

    if ( isdefined( self._id_796C ) )
        thread _id_1B8A( var_0, var_1 );
}

set_goal_and_volume( var_0 )
{
    if ( isdefined( self._colors_go_line ) )
    {
        thread maps\_anim::anim_single_queue( self, self._colors_go_line );
        self._colors_go_line = undefined;
    }

    self _meth_81A9( var_0 );

    if ( !self.fixednode )
        self.goalradius = var_0.radius;
    else if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;

    var_1 = level.colorcoded_volumes[self.team][self._id_250C];

    if ( isdefined( var_1 ) )
        self _meth_81B0( var_1 );
    else
        self _meth_8160();

    if ( isdefined( var_0.fixednodesaferadius ) )
        self.fixednodesaferadius = var_0.fixednodesaferadius;
    else
        self.fixednodesaferadius = 64;
}

_id_1B8A( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_being_careful" );
    self endon( "stop_going_to_node" );
    thread _id_728F( var_0 );

    for (;;)
    {
        _id_9FF7( var_0, var_1 );
        _id_9BD2( var_0, var_1 );
        self.fixednode = 1;
        set_goal_and_volume( var_0 );
    }
}

_id_728F( var_0 )
{
    self endon( "death" );
    self endon( "stop_going_to_node" );
    self waittill( "stop_being_careful" );
    self.fixednode = 1;
    set_goal_and_volume( var_0 );
}

_id_9BD2( var_0, var_1 )
{
    self _meth_81AA( self.origin );
    self.goalradius = 1024;
    self.fixednode = 0;

    if ( isdefined( var_1 ) )
    {
        for (;;)
        {
            wait 1;

            if ( self _meth_8172( var_0.origin, self.fixednodesaferadius ) )
                continue;

            if ( self _meth_8173( var_1 ) )
                continue;

            return;
        }
    }
    else
    {
        for (;;)
        {
            if ( !isknownenemyinradius_tmp( var_0.origin, self.fixednodesaferadius ) )
                return;

            wait 1;
        }
    }
}

isknownenemyinradius_tmp( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( distance2d( var_2[var_3].origin, var_0 ) < var_1 )
            return 1;
    }

    return 0;
}

_id_9FF7( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        for (;;)
        {
            if ( self _meth_8172( var_0.origin, self.fixednodesaferadius ) )
                return;

            if ( self _meth_8173( var_1 ) )
                return;

            wait 1;
        }
    }
    else
    {
        for (;;)
        {
            if ( isknownenemyinradius_tmp( var_0.origin, self.fixednodesaferadius ) )
                return;

            wait 1;
        }
    }
}

_id_6032()
{
    if ( !isdefined( self.node ) )
        return 0;

    return self.node maps\_utility::script_delay();
}

_id_6FE5( var_0, var_1, var_2 )
{
    thread decrementcolorusers( var_0 );
    self endon( "stop_color_move" );
    self endon( "death" );

    if ( isdefined( var_1 ) )
    {
        var_1 maps\_utility::script_delay();

        if ( isdefined( var_1.colordelayinfo ) )
        {
            var_3 = getarraykeys( var_1.colordelayinfo );

            if ( common_scripts\utility::array_contains( var_3, self._id_79E6 ) )
                wait(var_1.colordelayinfo[self._id_79E6]);
        }
    }

    if ( !_id_6032() )
    {
        if ( isdefined( var_2 ) )
            wait(var_2 * randomfloatrange( 0.2, 0.35 ));
    }

    ai_sets_goal( var_0 );
    self._id_203E = var_0;

    for (;;)
    {
        self waittill( "node_taken", var_4 );

        if ( var_4 == level.player )
            wait 0.05;

        var_0 = _id_3CD5();

        if ( isdefined( var_0 ) )
        {
            if ( isalive( self._id_2039._id_2043 ) && self._id_2039._id_2043 == self )
                self._id_2039._id_2043 = undefined;

            self._id_2039 = var_0;
            var_0._id_2043 = self;
            ai_sets_goal( var_0 );
        }
    }
}

get_best_available_colored_node()
{
    var_0 = level._id_250D[self.team][self._id_79E6];
    var_1 = get_prioritized_colorcoded_nodes( self.team, var_0, self._id_79E6 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isalive( var_1[var_2]._id_2043 ) )
            return var_1[var_2];
    }
}

_id_3CD5()
{
    var_0 = level._id_250D[self.team][self._id_79E6];
    var_1 = get_prioritized_colorcoded_nodes( self.team, var_0, self._id_79E6 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == self._id_2039 )
            continue;

        if ( !isalive( var_1[var_2]._id_2043 ) )
            return var_1[var_2];
    }
}

process_stop_short_of_node( var_0 )
{
    self endon( "stopScript" );
    self endon( "death" );

    if ( isdefined( self.node ) )
        return;

    if ( distance( var_0.origin, self.origin ) < 32 )
    {
        reached_node_but_could_not_claim_it( var_0 );
        return;
    }

    var_1 = gettime();
    wait_for_killanimscript_or_time( 1 );
    var_2 = gettime();

    if ( var_2 - var_1 >= 1000 )
        reached_node_but_could_not_claim_it( var_0 );
}

wait_for_killanimscript_or_time( var_0 )
{
    self endon( "killanimscript" );
    wait(var_0);
}

reached_node_but_could_not_claim_it( var_0 )
{
    var_1 = getaiarray();
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !isdefined( var_1[var_3].node ) )
            continue;

        if ( var_1[var_3].node != var_0 )
            continue;

        var_1[var_3] notify( "eject_from_my_node" );
        wait 1;
        self notify( "eject_from_my_node" );
        return 1;
    }

    return 0;
}

decrementcolorusers( var_0 )
{
    var_0._id_2043 = self;
    self._id_2039 = var_0;
    self endon( "stop_color_move" );
    self waittill( "death" );
    self._id_2039._id_2043 = undefined;
}

_id_204C( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_204D.size; var_1++ )
    {
        if ( var_0 == level._id_204D[var_1] )
            return 1;
    }

    return 0;
}

add_volume_to_global_arrays( var_0, var_1 )
{
    var_2 = strtok( var_0, " " );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        level.colorcoded_volumes[var_1][var_2[var_3]] = self;
}

add_node_to_global_arrays( var_0, var_1 )
{
    self._id_2043 = undefined;
    var_2 = strtok( var_0, " " );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( level.arrays_of_colorcoded_nodes[var_1] ) && isdefined( level.arrays_of_colorcoded_nodes[var_1][var_2[var_3]] ) )
        {
            level.arrays_of_colorcoded_nodes[var_1][var_2[var_3]] = common_scripts\utility::array_add( level.arrays_of_colorcoded_nodes[var_1][var_2[var_3]], self );
            continue;
        }

        level.arrays_of_colorcoded_nodes[var_1][var_2[var_3]][0] = self;
        level.arrays_of_colorcoded_ai[var_1][var_2[var_3]] = [];
        level.arrays_of_colorcoded_spawners[var_1][var_2[var_3]] = [];
    }
}

shownodecolors()
{
    common_scripts\utility::array_thread( getallnodes(), ::nodethink );
}

nodethink()
{
    var_0 = "";
    var_1 = "gg-";

    if ( isdefined( self._id_7975 ) )
        var_0 = self._id_7975;
    else if ( isdefined( self._id_7976 ) )
    {
        var_0 = self._id_7976;
        var_1 = "bg-";
    }

    if ( var_0 == "" )
        return;

    for (;;)
    {
        var_2 = maps\_utility::_id_3E5A();
        var_3 = strtok( var_0, " " );

        if ( var_3.size > 1 )
        {

        }
        else
        {

        }

        if ( randomint( 100 ) > 70 )
        {

        }

        waittillframeend;
    }
}

_id_5674()
{
    if ( !isdefined( self._id_2039 ) )
        return;

    if ( isdefined( self._id_2039._id_2043 ) && self._id_2039._id_2043 == self )
        self._id_2039._id_2043 = undefined;

    self._id_2039 = undefined;
    self notify( "stop_color_move" );
}

getcolornumberarray()
{
    var_0 = [];

    if ( issubstr( self.classname, "axis" ) || issubstr( self.classname, "enemy" ) )
    {
        var_0["team"] = "axis";
        var_0["colorTeam"] = self._id_7976;
    }

    if ( issubstr( self.classname, "ally" ) || issubstr( self.classname, "civilian" ) )
    {
        var_0["team"] = "allies";
        var_0["colorTeam"] = self._id_7975;
    }

    if ( !isdefined( var_0["colorTeam"] ) )
        var_0 = undefined;

    return var_0;
}

removespawnerfromcolornumberarray()
{
    var_0 = getcolornumberarray();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0["team"];
    var_2 = var_0["colorTeam"];
    var_3 = strtok( var_2, " " );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        level.arrays_of_colorcoded_spawners[var_1][var_3[var_4]] = common_scripts\utility::array_remove( level.arrays_of_colorcoded_spawners[var_1][var_3[var_4]], self );
}

add_cover_node( var_0 )
{
    level._id_203D[var_0][1]["allies"] = ::_id_6FE7;
    level._id_203D[var_0][1]["axis"] = ::_id_6FE8;
    level._id_203D[var_0][0]["allies"] = ::_id_6FE6;
    level._id_203D[var_0][0]["axis"] = ::_id_6FE6;
}

add_path_node( var_0 )
{
    level._id_203D[var_0][1]["allies"] = ::_id_6FEF;
    level._id_203D[var_0][0]["allies"] = ::_id_6FEF;
    level._id_203D[var_0][1]["axis"] = ::_id_6FEF;
    level._id_203D[var_0][0]["axis"] = ::_id_6FEF;
}

_id_2055( var_0, var_1 )
{
    level endon( "kill_color_replacements" );
    var_2 = _id_890B( var_0, var_1 );

    if ( isdefined( level._id_3A89 ) )
        var_2 thread [[ level._id_3A89 ]]();

    var_2 thread _id_2050();
}

_id_2050()
{
    level endon( "kill_color_replacements" );
    self endon( "_disable_reinforcement" );

    if ( isdefined( self._id_7402 ) )
        return;

    self._id_7402 = 1;
    var_0 = self.classname;
    var_1 = self._id_79E6;
    waitframe;

    if ( isalive( self ) )
        self waittill( "death" );

    var_2 = level._id_24DC;

    if ( !isdefined( self._id_79E6 ) )
        return;

    thread _id_2055( var_0, self._id_79E6 );

    if ( isdefined( self ) && isdefined( self._id_79E6 ) )
        var_1 = self._id_79E6;

    if ( isdefined( self ) && isdefined( self.origin ) )
        var_3 = self.origin;

    for (;;)
    {
        if ( get_color_from_order( var_1, var_2 ) == "none" )
            return;

        var_4 = maps\_utility::_id_3D7A( "allies", var_2[var_1] );
        var_4 = maps\_utility::_id_735E( var_4 );
        var_4 = maps\_utility::_id_738F( var_4, var_0 );

        if ( !var_4.size )
        {
            wait 2;
            continue;
        }

        var_5 = common_scripts\utility::_id_3F33( level.player.origin, var_4 );
        waitframe;

        if ( !isalive( var_5 ) )
            continue;

        var_5 maps\_utility::_id_7E38( var_1 );

        if ( isdefined( level._id_3A7A ) )
            var_5 [[ level._id_3A7A ]]( var_1 );

        var_1 = var_2[var_1];
    }
}

get_color_from_order( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return "none";

    if ( !isdefined( var_1 ) )
        return "none";

    if ( !isdefined( var_1[var_0] ) )
        return "none";

    return var_1[var_0];
}

friendly_spawner_vision_checker()
{
    level._id_3A7C = 1;
    var_0 = 0;

    for (;;)
    {
        common_scripts\utility::_id_3857( "respawn_friendlies" );
        wait 1;

        if ( !isdefined( level._id_7474 ) )
            continue;

        var_1 = level._id_7474;
        var_2 = level.player.origin - var_1.origin;

        if ( length( var_2 ) < 200 )
        {
            _id_6C00();
            continue;
        }

        var_3 = anglestoforward( ( 0, level.player getplayerangles()[1], 0 ) );
        var_4 = vectornormalize( var_2 );
        var_5 = vectordot( var_3, var_4 );

        if ( var_5 < 0.2 )
        {
            _id_6C00();
            continue;
        }

        var_0++;

        if ( var_0 < 3 )
            continue;

        common_scripts\utility::_id_383F( "player_looks_away_from_spawner" );
    }
}

_id_3D0C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return level._id_7474;

    var_1 = getentarray( "color_spawner", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_2[var_1[var_3].classname] = var_1[var_3];

    var_4 = undefined;
    var_5 = getarraykeys( var_2 );

    for ( var_3 = 0; var_3 < var_5.size; var_3++ )
    {
        if ( !issubstr( var_2[var_5[var_3]].classname, var_0 ) )
            continue;

        var_4 = var_2[var_5[var_3]];
        break;
    }

    if ( !isdefined( var_4 ) )
        return level._id_7474;

    var_4.origin = level._id_7474.origin;
    return var_4;
}

_id_890B( var_0, var_1 )
{
    level endon( "kill_color_replacements" );
    var_2 = undefined;

    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( "respawn_friendlies" ) )
        {
            if ( !isdefined( level._id_3A7C ) )
                thread friendly_spawner_vision_checker();

            for (;;)
            {
                common_scripts\utility::_id_3852( "player_looks_away_from_spawner", "respawn_friendlies" );
                common_scripts\utility::_id_3857( "friendly_spawner_locked" );

                if ( common_scripts\utility::_id_382E( "player_looks_away_from_spawner" ) || common_scripts\utility::_id_382E( "respawn_friendlies" ) )
                    break;
            }

            common_scripts\utility::_id_383F( "friendly_spawner_locked" );
        }

        var_3 = _id_3D0C( var_0 );
        var_3.count = 1;
        var_2 = var_3 stalingradspawn();

        if ( maps\_utility::_id_88F1( var_2 ) )
        {
            thread _id_5805();
            wait 1;
            continue;
        }

        level notify( "reinforcement_spawned", var_2 );
        break;
    }

    for (;;)
    {
        if ( !isdefined( var_1 ) )
            break;

        if ( get_color_from_order( var_1, level._id_24DC ) == "none" )
            break;

        var_1 = level._id_24DC[var_1];
    }

    if ( isdefined( var_1 ) )
        var_2 maps\_utility::_id_7E38( var_1 );

    var_2 setup_nodes_intelligently_from_team();
    thread _id_5805();
    return var_2;
}

_id_5805()
{
    common_scripts\utility::_id_383F( "friendly_spawner_locked" );
    wait 2;
    common_scripts\utility::_id_3831( "friendly_spawner_locked" );
}

_id_6C00()
{
    var_0 = 0;
    common_scripts\utility::_id_3831( "player_looks_away_from_spawner" );
}

_id_5300()
{
    common_scripts\utility::_id_3831( "friendly_spawner_locked" );
    level notify( "kill_color_replacements" );
    var_0 = getaiarray();
    common_scripts\utility::array_thread( var_0, ::_id_737B );
}

_id_737B()
{
    self._id_7402 = undefined;
}

init_color_delay_info( var_0 )
{
    if ( !isdefined( var_0._id_7A99 ) )
        return;

    if ( !issubstr( var_0._id_7A99, "color_delays" ) )
        return;

    var_1 = strtok( var_0._id_7A99, ":, " );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3] == "color_delays" )
            continue;

        if ( !isdefined( var_1[var_3 + 1] ) )
            return;

        var_2[var_1[var_3]] = float( var_1[var_3 + 1] );
        var_3++;
    }

    var_0.colordelayinfo = var_2;
}
