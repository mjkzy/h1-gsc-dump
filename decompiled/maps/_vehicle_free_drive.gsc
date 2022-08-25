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

_id_4D72( var_0 )
{
    common_scripts\utility::_id_23AE( "vehicle_free_path_debug", 0 );
    _id_1E59( 1 );
    _id_80AF();
    level._id_3248 = [];
    level._id_2DFC = ::_id_9CBD;
    level._id_9CC6 = _id_810E( var_0 );
    common_scripts\utility::_id_76BB( "enable_free_path", ::_id_30C4 );
}

_id_80AF()
{
    if ( !isdefined( level._id_3A1D ) )
        level._id_3A1D = -4000;

    if ( !isdefined( level._id_3A1B ) )
        level._id_3A1B = -2000;

    if ( !isdefined( level._id_3A1A ) )
        level._id_3A1A = 100;

    if ( !isdefined( level._id_3A21 ) )
        level._id_3A21 = 650;

    if ( !isdefined( level._id_3A20 ) )
        level._id_3A20 = 2000;

    if ( !isdefined( level._id_3A1C ) )
        level._id_3A1C = 4000;

    if ( !isdefined( level._id_3A1E ) )
        level._id_3A1E = 1.0;

    if ( !isdefined( level._id_3A1F ) )
        level._id_3A1F = 0.6;

    if ( !isdefined( level._id_3A19 ) )
        level._id_3A19 = 1.6;

    if ( !isdefined( level._id_3A22 ) )
        level._id_3A22 = 200;

    if ( !isdefined( level._id_3A23 ) )
        level._id_3A23 = 200;

    if ( !isdefined( level._id_3A25 ) )
        level._id_3A25 = 25.0;

    if ( !isdefined( level._id_3A18 ) )
        level._id_3A18 = 200;

    if ( !isdefined( level._id_3A24 ) )
        level._id_3A24 = 0.9;
}

_id_30C4()
{
    level endon( "stop_vehicle_free_path" );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 notify( "enable_free_path" );
    }
}

_id_1E59( var_0 )
{
    level notify( "stop_vehicle_free_path" );
    level._id_9CC6 = undefined;
    level._id_5FA1 = undefined;

    if ( var_0 && isdefined( level._id_3248 ) )
    {
        foreach ( var_2 in level._id_3248 )
        {
            if ( !isremovedentity( var_2 ) )
                var_2 delete();
        }
    }

    level._id_3248 = undefined;

    if ( isdefined( level.player._id_2E18 ) && isdefined( level.player._id_2E18._id_7004 ) )
        level.player._id_2E18._id_7004 = undefined;
}

_id_8976( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( level._id_3248 ) )
        level._id_3248 = [];

    if ( level._id_3248.size >= 8 )
        return undefined;

    if ( var_2 && var_3 )
    {
        var_4 = getentarray( self.target, "targetname" );
        var_5 = [];

        foreach ( var_7 in var_4 )
        {
            if ( var_7.code_classname == "info_vehicle_node" )
                continue;

            var_5[var_5.size] = var_7;
        }

        var_5 = common_scripts\utility::_id_3CCB( self.origin, var_5 );

        foreach ( var_11, var_10 in var_5 )
            var_10 thread maps\_utility::add_spawn_function( ::_id_44B0, self, var_11 );

        var_12 = maps\_utility::_id_8975();
        var_12 waittill( "guy_entered" );
        wait 3;

        if ( !self._id_750A.size )
            return undefined;
    }
    else
        var_12 = maps\_utility::_id_8975();

    var_12._id_2D3D = 1;
    var_12._id_46FB = var_2;
    var_12 thread maps\_vehicle_code::_id_9C90();

    if ( isdefined( var_0 ) )
        var_12 vehphys_setspeed( var_0 );

    if ( var_1 )
    {
        wait 0.15;
        var_12 _id_5666( 1, var_0 );
    }
    else
    {
        var_12 thread _id_5666( 0, var_0 );
        var_12 thread maps\_vehicle_code::_gopath( var_12 );
    }

    return var_12;
}

_id_5666( var_0, var_1 )
{
    self endon( "death" );
    self endon( "script_crash_vehicle" );

    if ( !var_0 )
    {
        level endon( "stop_vehicle_free_path" );
        common_scripts\utility::_id_A087( "enable_free_path", "reached_end_node" );
    }

    var_2 = _id_3DE0( self.origin );

    if ( isdefined( level._id_2DFC ) )
        var_2 thread [[ level._id_2DFC ]]( self, var_1 );

    thread _id_9C96();
}

_id_3DE0( var_0 )
{
    var_0 = ( var_0[0], var_0[1], 0 );
    var_1 = common_scripts\utility::_id_3CCB( var_0, level._id_9CC6, undefined, 3 );
    var_2 = var_1[0];
    var_3 = var_2.index;

    if ( var_1[1].index < var_3 )
    {
        var_2 = var_1[1];
        var_3 = var_2.index;
    }

    if ( var_1[2].index < var_3 )
        var_2 = var_1[2];

    return var_2;
}

_id_44B0( var_0, var_1 )
{
    maps\_vehicle_code::_mount_snowmobile( var_0, var_1 );
}

_id_810E( var_0 )
{
    var_1 = _id_23D1( var_0 );
    add_collision_to_path( var_1 );
    return var_1;
}

_id_23D1( var_0 )
{
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_2 = [];
    var_3 = 0;
    var_4 = var_1;

    for (;;)
    {
        var_5 = var_1;

        if ( isdefined( var_1.target ) )
            var_5 = common_scripts\utility::_id_40FB( var_1.target, "targetname" );

        var_1.origin = _id_2F65( var_1.origin );
        var_2[var_2.size] = var_1;
        var_1._id_60BD = var_5;
        var_1._id_6F41 = var_4;
        var_1._id_2010 = [];
        var_1._id_2013 = [];
        var_1._id_2011 = [];
        var_1._id_65A8 = [];
        var_1._id_65A8["left"] = var_1.origin;
        var_6 = common_scripts\utility::_id_40FB( var_1._id_7A26, "script_linkname" );
        var_6.origin = _id_2F65( var_6.origin );
        var_1._id_65A8["right"] = var_6.origin;
        var_1._id_7566 = distance( var_1._id_65A8["right"], var_1._id_65A8["left"] );
        var_1._id_5C0F = ( var_1._id_65A8["left"] + var_1._id_65A8["right"] ) * 0.5;
        var_1.index = var_3;
        var_3++;

        if ( var_1 == var_5 )
            break;

        var_4 = var_1;
        var_1 = var_5;
    }

    foreach ( var_8 in var_2 )
    {
        if ( var_8._id_60BD == var_8 )
            continue;

        var_9 = var_8._id_5C0F;
        var_10 = var_8._id_60BD._id_5C0F;
        var_11 = vectortoangles( var_9 - var_10 );
        var_12 = anglestoright( var_11 );
        var_13 = var_8._id_7566 * 0.5;
        var_8._id_65A8["left"] = var_8._id_5C0F + var_12 * var_13;
        var_8._id_65A8["left_warning"] = var_8._id_5C0F + var_12 * var_13 * level._id_3A24;
        var_8._id_65A8["right"] = var_8._id_5C0F + var_12 * var_13 * -1;
        var_8._id_65A8["right_warning"] = var_8._id_5C0F + var_12 * var_13 * -1 * level._id_3A24;
    }

    foreach ( var_8 in var_2 )
        var_8._id_2B70 = distance( var_8._id_5C0F, var_8._id_60BD._id_5C0F );

    return var_2;
}

add_collision_to_path( var_0 )
{
    var_1 = common_scripts\utility::_id_40FD( "road_path_col", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = common_scripts\utility::_id_40FB( var_3.target, "targetname" );
        var_3.origin = _id_2F65( var_3.origin );
        var_4.origin = _id_2F65( var_4.origin );
        var_3._id_65B0 = var_4;
        var_4._id_65B0 = var_3;
    }

    foreach ( var_7 in var_0 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3._id_5767 ) )
                add_collision_to_path_node( var_7, var_3 );
        }
    }
}

add_collision_to_path_node( var_0, var_1 )
{
    if ( var_0 == var_0._id_60BD )
        return;

    if ( !_id_92A5( var_0, var_1 ) )
        return;

    var_2 = var_1._id_65B0;
    var_3 = _id_3E3E( var_1.origin, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
    var_4 = _id_3E3E( var_2.origin, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
    var_1._id_7000 = var_3["progress"];
    var_1._id_6379 = var_3["offset"];
    var_2._id_7000 = var_4["progress"];
    var_2._id_6379 = var_4["offset"];

    if ( var_3["progress"] < var_4["progress"] )
    {
        add_collision_offsets_to_path_ent( var_0, var_1, var_2 );
        var_0._id_2010[var_0._id_2010.size] = var_1;
        var_1._id_5767 = 1;
    }
    else
    {
        add_collision_offsets_to_path_ent( var_0, var_2, var_1 );
        var_0._id_2010[var_0._id_2010.size] = var_2;
        var_1._id_5767 = 1;
    }
}

_id_92A5( var_0, var_1 )
{
    var_2[0] = var_0._id_65A8["left"];
    var_2[1] = var_0._id_65A8["right"];
    var_2[2] = var_0._id_60BD._id_65A8["right"];
    var_2[3] = var_0._id_60BD._id_65A8["left"];
    var_3[0] = var_1.origin;
    var_3[1] = var_1._id_65B0.origin;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = 0;
        var_6 = 0;

        for ( var_7 = var_2.size - 1; var_6 < var_2.size; var_6++ )
        {
            if ( var_2[var_6][1] > var_3[var_4][1] != var_2[var_7][1] > var_3[var_4][1] && var_3[var_4][0] < ( var_2[var_7][0] - var_2[var_6][0] ) * ( var_3[var_4][1] - var_2[var_6][1] ) / ( var_2[var_7][1] - var_2[var_6][1] ) + var_2[var_6][0] )
                var_5 = !var_5;

            var_7 = var_6;
        }

        if ( var_5 )
            return 1;
    }

    return 0;
}

add_collision_offsets_to_path_ent( var_0, var_1, var_2 )
{
    var_3 = var_2._id_7000 + 200;
    var_4 = var_1._id_7000 - level._id_3A18;
    var_5 = undefined;
    var_6 = undefined;

    if ( var_2._id_6379 > var_1._id_6379 )
    {
        var_5 = var_2._id_6379;
        var_6 = var_1._id_6379;
    }
    else
    {
        var_5 = var_1._id_6379;
        var_6 = var_2._id_6379;
    }

    var_7 = var_0;
    var_8 = var_3;
    var_9 = var_4;
    var_10 = var_5;
    var_11 = var_6;

    for (;;)
    {
        var_12 = _id_3E5B( var_0, var_5 );
        var_13 = _id_3E5B( var_0, var_6 );
        var_14 = max( var_12, var_13 );
        var_15 = min( var_3, var_14 );
        add_vol_to_node( var_0, var_15, var_4, var_5, var_6 );

        if ( !isdefined( var_0._id_60BD ) || var_0 == var_0._id_60BD )
            break;

        var_3 -= var_14;
        var_4 = 0;

        if ( var_3 <= 0 )
            break;

        var_16 = _id_3E38( var_0, var_12, var_5 );
        var_17 = _id_3E38( var_0, var_13, var_6 );
        var_0 = var_0._id_60BD;
        var_18 = _id_3E3E( var_16, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_5 = var_18["offset"];
        var_19 = _id_3E3E( var_17, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_6 = var_19["offset"];
    }

    var_0 = var_7;
    var_3 = var_8;
    var_4 = var_9;
    var_5 = var_10;
    var_6 = var_11;

    for (;;)
    {
        if ( !isdefined( var_0._id_6F41 ) || var_0 == var_0._id_6F41 )
            break;

        if ( var_4 > 0 )
            break;

        var_16 = _id_3E38( var_0, 0, var_5 );
        var_17 = _id_3E38( var_0, 0, var_6 );
        var_0 = var_0._id_6F41;
        var_18 = _id_3E3E( var_16, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_5 = var_18["offset"];
        var_19 = _id_3E3E( var_17, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_6 = var_19["offset"];
        var_3 = max( var_18["progress"], var_19["progress"] );
        var_4 += var_3;
        add_vol_to_node( var_0, var_3, var_4, var_5, var_6 );
    }
}

add_vol_to_node( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_205B = [];
    var_5._id_205B["max"] = var_1;
    var_5._id_205B["min"] = var_2;

    if ( var_5._id_205B["min"] < 0 )
        var_5._id_205B["min"] = 0;

    if ( isdefined( var_0._id_60BD ) && var_0 != var_0._id_60BD )
    {

    }

    var_5._id_205B["left_offset"] = var_4;
    var_5._id_205B["right_offset"] = var_3;
    var_5._id_205B["mid_offset"] = ( var_3 + var_4 ) * 0.5;
    var_0._id_2013[var_0._id_2013.size] = var_5;
}

add_moving_obstacle( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_32D5 = self;
    var_2.bounds = var_0;

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_2 thread _id_736D();

    var_2 thread _id_9ACC();
}

_id_736D()
{
    level endon( "stop_vehicle_free_path" );
    self._id_32D5 endon( "moving_obstacle_removed" );
    self._id_32D5 waittill( "death" );
    _id_736C();
}

_id_736C()
{
    _id_9A57();
    self._id_32D5 notify( "moving_obstacle_removed" );
}

_id_9ACC()
{
    level endon( "stop_vehicle_free_path" );
    self._id_32D5 endon( "moving_obstacle_removed" );
    self._id_32D5 endon( "death" );
    self.node = self._id_32D5 _id_3DE0( self._id_32D5.origin );
    var_0 = self._id_32D5 _id_3E3E( self._id_32D5.origin, self.node._id_5C0F, self.node._id_60BD._id_5C0F );
    var_1 = self._id_32D5 _id_5F33( self.node, var_0["progress"], var_0["offset"] );
    self.node = var_1.node;

    for (;;)
    {
        var_0 = self._id_32D5 _id_3E3E( self._id_32D5.origin, self.node._id_5C0F, self.node._id_60BD._id_5C0F );
        var_1 = self._id_32D5 _id_5F33( self.node, var_0["progress"], var_0["offset"] );

        if ( self.node != var_1.node )
            self.node = var_1.node;

        _id_9ACB();
        wait 0.1;
    }
}

_id_9ACB()
{
    var_0 = anglestoforward( self._id_32D5.angles );
    var_1 = anglestoright( self._id_32D5.angles );
    self._id_222A = [];
    self._id_222A[0] = _id_2F65( self._id_32D5.origin + -1 * self.bounds["width"] / 2 * var_1 + self.bounds["length"] / 2 * var_0 );
    self._id_222A[1] = _id_2F65( self._id_32D5.origin + self.bounds["width"] / 2 * var_1 + self.bounds["length"] / 2 * var_0 );
    self._id_222A[2] = _id_2F65( self._id_32D5.origin + -1 * self.bounds["width"] / 2 * var_1 + -1 * self.bounds["length"] / 2 * var_0 );
    self._id_222A[3] = _id_2F65( self._id_32D5.origin + self.bounds["width"] / 2 * var_1 + -1 * self.bounds["length"] / 2 * var_0 );
    var_2 = [];
    var_2[0] = _id_3E3E( self._id_222A[0], self.node._id_5C0F, self.node._id_60BD._id_5C0F );
    var_2[1] = _id_3E3E( self._id_222A[1], self.node._id_5C0F, self.node._id_60BD._id_5C0F );
    var_2[2] = _id_3E3E( self._id_222A[2], self.node._id_5C0F, self.node._id_60BD._id_5C0F );
    var_2[3] = _id_3E3E( self._id_222A[3], self.node._id_5C0F, self.node._id_60BD._id_5C0F );
    var_3 = var_2[0]["offset"];
    var_4 = var_3;
    var_5 = var_2[0]["progress"];
    var_6 = var_5;

    for ( var_7 = 1; var_7 < var_2.size; var_7++ )
    {
        if ( var_2[var_7]["offset"] < var_3 )
            var_3 = var_2[var_7]["offset"];

        if ( var_2[var_7]["offset"] > var_4 )
            var_4 = var_2[var_7]["offset"];

        if ( var_2[var_7]["progress"] < var_5 )
            var_5 = var_2[var_7]["progress"];

        if ( var_2[var_7]["progress"] > var_6 )
            var_6 = var_2[var_7]["progress"];
    }

    var_6 += 200;
    var_5 -= 200;
    _id_9A57();
    _id_72E1( var_6, var_5, var_4, var_3 );
}

_id_72E1( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0;
    var_5 = var_1;
    var_6 = var_2;
    var_7 = var_3;
    var_8 = self.node;
    var_9 = var_8;

    for (;;)
    {
        var_10 = _id_3E5B( var_9, var_2 );
        var_11 = _id_3E5B( var_9, var_3 );
        var_12 = max( max( var_10, var_11 ), 0 );
        var_13 = min( var_0, var_12 );

        if ( var_13 <= 0 )
            break;

        add_moving_vol_to_node( var_9, var_13, var_1, var_2, var_3 );

        if ( !isdefined( var_9._id_60BD ) || var_9 == var_9._id_60BD )
            break;

        var_0 -= var_12;
        var_1 = 0;

        if ( var_0 <= 0 )
            break;

        var_14 = _id_3E38( var_9, var_10, var_2 );
        var_15 = _id_3E38( var_9, var_11, var_3 );
        var_9 = var_9._id_60BD;
        var_16 = _id_3E3E( var_14, var_9._id_5C0F, var_9._id_60BD._id_5C0F );
        var_2 = var_16["offset"];
        var_17 = _id_3E3E( var_15, var_9._id_5C0F, var_9._id_60BD._id_5C0F );
        var_3 = var_17["offset"];
    }

    var_9 = var_8;
    var_0 = var_4;
    var_1 = var_5;
    var_2 = var_6;
    var_3 = var_7;

    for (;;)
    {
        if ( !isdefined( var_9._id_6F41 ) || var_9 == var_9._id_6F41 )
            break;

        if ( var_1 > 0 )
            break;

        var_14 = _id_3E38( var_9, 0, var_2 );
        var_15 = _id_3E38( var_9, 0, var_3 );
        var_9 = var_9._id_6F41;
        var_16 = _id_3E3E( var_14, var_9._id_5C0F, var_9._id_60BD._id_5C0F );
        var_2 = var_16["offset"];
        var_17 = _id_3E3E( var_15, var_9._id_5C0F, var_9._id_60BD._id_5C0F );
        var_3 = var_17["offset"];
        var_0 = max( var_16["progress"], var_17["progress"] );
        var_1 += var_0;

        if ( var_0 <= 0 )
            break;

        add_moving_vol_to_node( var_9, var_0, var_1, var_2, var_3 );
    }
}

_id_9A57()
{
    foreach ( var_1 in level._id_9CC6 )
    {
        foreach ( var_3 in var_1._id_2011 )
        {
            if ( var_3.owner == self )
                var_1._id_2011 = common_scripts\utility::array_remove( var_1._id_2011, var_3 );
        }
    }
}

add_moving_vol_to_node( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_205B = [];
    var_5.owner = self;
    var_5._id_205B["max"] = var_1;
    var_5._id_205B["min"] = var_2;

    if ( var_5._id_205B["min"] < 0 )
        var_5._id_205B["min"] = 0;

    if ( var_0.index != 0 )
    {

    }
    else if ( var_5._id_205B["min"] < var_5._id_205B["max"] )
        return;

    var_5._id_205B["left_offset"] = var_4;
    var_5._id_205B["right_offset"] = var_3;
    var_5._id_205B["mid_offset"] = ( var_3 + var_4 ) * 0.5;
    var_0._id_2011[var_0._id_2011.size] = var_5;
}

_id_9CBD( var_0, var_1 )
{
    level endon( "stop_vehicle_free_path" );
    var_0 endon( "death" );
    var_0 notify( "enable_free_path" );

    if ( var_0._id_46FB && !var_0._id_750A.size )
    {
        var_0 vehphys_crash();
        return;
    }

    var_2 = self;

    if ( isdefined( var_1 ) )
        var_0._id_8D25 = var_1;
    else
        var_0._id_8D25 = var_0 vehicle_getspeed();

    var_0._id_A343 = 0;
    var_0._id_7004 = var_2;
    var_0._id_7000 = 0;
    var_0._id_31BC = var_0.origin;
    var_0._id_359F = 0;
    var_0._id_5F0E = 0;
    var_0._id_66CE = gettime();
    common_scripts\utility::array_thread( var_0._id_750A, ::_id_7507, var_0 );
    var_0 thread _id_9CAC();
    _id_9AEC( var_0 );

    for (;;)
    {
        if ( !isalive( var_0 ) )
            break;

        if ( var_0._id_A343 )
        {
            var_0 vehphys_crash();

            foreach ( var_4 in var_0._id_750A )
            {
                if ( isalive( var_4 ) )
                    var_4 kill();
            }

            var_0 kill();
            wait 5;

            if ( isdefined( var_0 ) )
                var_0 delete();

            _id_9AEC();
            return;
        }

        if ( !var_0._id_A343 && var_0 vehicle_getspeed() < 2 )
        {
            var_0._id_5F0E++;

            if ( var_0._id_5F0E > 5 )
                var_0 _id_A343( "move fail!" );
        }
        else
            var_0._id_5F0E = 0;

        var_0 _id_7EFE();
        wait 0.05;
    }
}

_id_7EFE()
{
    var_0 = self;
    var_1 = var_0._id_7004;

    if ( var_1 == var_1._id_60BD )
        return;

    var_2 = _id_3E3E( var_0.origin, var_1._id_5C0F, var_1._id_60BD._id_5C0F );
    var_3 = var_2["offset"];
    var_4 = var_1._id_7566;
    var_5 = _id_5F33( var_1, var_2["progress"], var_3 );
    var_6 = var_5._id_7000;
    var_7 = var_5._id_6379;
    var_1 = var_5.node;
    var_0._id_7004 = var_1;
    var_0._id_7000 = var_6;

    if ( var_1 == var_1._id_60BD )
        return;

    var_8 = _id_5F33( var_1, var_6 + var_0._id_359F, var_7 );
    var_9 = var_8._id_7000;
    var_10 = var_8._id_6379;
    var_11 = var_8.node;
    var_12 = _id_3D4D( var_11, var_9 );
    var_13 = _id_3DFE( var_11, var_9, var_10, 1 );
    var_14 = 0;

    if ( isdefined( var_13["dodge1"] ) )
    {
        var_10 = var_13["dodge1"];
        var_14 = 1;

        if ( isdefined( var_12["right"] ) && var_10 > var_12["right"] )
            var_10 = var_13["dodge2"];

        if ( isdefined( var_12["left"] ) && var_10 < var_12["left"] )
            var_10 = var_13["dodge2"];
    }

    if ( isdefined( var_12["right"] ) && var_10 > var_12["right"] )
    {
        var_10 = var_12["right"];
        var_14 = 1;
    }

    if ( isdefined( var_12["left"] ) && var_10 < var_12["left"] )
    {
        var_10 = var_12["left"];
        var_14 = 1;
    }

    var_15 = 0;
    var_0._id_31BC = var_0 _id_3EB9( var_11, var_9, var_10, var_15 );
    var_16 = maps\_utility::_id_3D46( var_0.origin, var_0.angles, var_0._id_31BC );
    var_17 = 1.0;

    if ( var_16 > 0.9659 )
        var_17 = 1.0;
    else if ( var_16 > 0.866 )
        var_17 = 0.85;
    else if ( var_16 > 0.7071 )
        var_17 = 0.65;
    else if ( var_16 > 0.5 )
        var_17 = 0.4;
    else
        var_17 = 0.1;

    var_18 = max( var_0._id_8D25 * var_17, level._id_3A25 );
    var_0 _meth_8229( var_0._id_31BC, var_18 );

    if ( isdefined( level.player._id_2E18 ) )
        var_0 _id_59DD( var_17 );
}

_id_3DFE( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) && var_3 == 1 )
    {
        foreach ( var_5 in var_0._id_2013 )
            var_5._id_4712 = 0;

        foreach ( var_5 in var_0._id_2011 )
            var_5._id_4712 = 0;
    }

    var_9 = [];
    var_10 = common_scripts\utility::array_combine( var_0._id_2013, var_0._id_2011 );

    foreach ( var_5 in var_10 )
    {
        if ( var_5._id_4712 == 1 )
            continue;

        if ( isdefined( var_5.owner ) && isdefined( var_5.owner._id_32D5 ) && var_5.owner._id_32D5 == self )
            continue;

        if ( var_1 < var_5._id_205B["min"] )
            continue;

        if ( var_1 > var_5._id_205B["max"] )
            continue;

        if ( var_2 < var_5._id_205B["left_offset"] )
            continue;

        if ( var_2 > var_5._id_205B["right_offset"] )
            continue;

        var_12 = var_5._id_205B["right_offset"] + 50;
        var_13 = var_5._id_205B["left_offset"] - 50;
        var_5._id_4712 = 1;
        var_14 = _id_3DFE( var_0, var_1, var_12 );
        var_15 = _id_3DFE( var_0, var_1, var_13 );

        if ( var_14.size > 0 )
        {
            if ( var_14["dodge1"] > var_12 )
                var_12 = var_14["dodge1"];

            if ( var_14["dodge2"] > var_12 )
                var_12 = var_14["dodge2"];

            if ( var_14["dodge1"] < var_13 )
                var_13 = var_14["dodge1"];

            if ( var_14["dodge2"] < var_13 )
                var_13 = var_14["dodge2"];
        }

        if ( var_15.size > 0 )
        {
            if ( var_15["dodge1"] > var_12 )
                var_12 = var_15["dodge1"];

            if ( var_15["dodge2"] > var_12 )
                var_12 = var_15["dodge2"];

            if ( var_15["dodge1"] < var_13 )
                var_13 = var_15["dodge1"];

            if ( var_15["dodge2"] < var_13 )
                var_13 = var_15["dodge2"];
        }

        var_16 = ( var_12 + var_13 ) * 0.5;

        if ( var_2 > var_16 )
        {
            var_9["dodge1"] = var_12;
            var_9["dodge2"] = var_13;
        }
        else
        {
            var_9["dodge1"] = var_13;
            var_9["dodge2"] = var_12;
        }

        break;
    }

    return var_9;
}

_id_9AEC( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_3248 )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( var_3._id_A343 )
            continue;

        var_1[var_1.size] = var_3;
    }

    level._id_3248 = var_1;

    if ( isalive( var_0 ) && !var_0._id_A343 )
    {
        if ( !common_scripts\utility::array_contains( level._id_3248, var_0 ) )
        {
            level._id_3248[level._id_3248.size] = var_0;

            if ( 1 )
                level._id_3248 = common_scripts\utility::array_sort_by_handler( level._id_3248, ::_id_3E9A );
        }
    }

    var_5 = level._id_3A22;
    var_6 = 200;

    foreach ( var_3 in level._id_3248 )
    {
        var_3._id_6AA6 = var_5;
        var_5 += level._id_3A23;
        var_3._id_359F = var_6;
        var_6 += 100;
    }
}

_id_3E9A()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = self._id_7004;

    if ( !isdefined( var_2 ) || !isdefined( self._id_7000 ) )
        return 0;

    var_3 = maps\_utility::_id_3F82( var_2.target, "targetname" );
    var_0 = self._id_7000;

    for (;;)
    {
        if ( !isdefined( var_2.targetname ) )
            break;

        var_3 = var_2;
        var_2 = maps\_utility::_id_3F82( var_2.targetname, "target" );

        if ( !isdefined( var_2 ) )
            break;

        var_1++;
        var_0 += distance2d( var_3.origin, var_2.origin );
    }

    return var_0;
}

_id_2B79()
{
    return distance2dsquared( self.origin, level.player.origin );
}

_id_9CAC()
{
    self waittill( "death" );
    waittillframeend;
    _id_9AEC();
}

_id_7507( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 _id_A343( "driver died!" );
}

_id_9C96()
{
    level endon( "stop_vehicle_free_path" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "veh_contact", var_0, var_1, var_2, var_3, var_4 );

        if ( isdefined( var_3 ) )
        {
            var_5 = length( var_3 ) / 63360.0 * 60.0 * 60.0;

            if ( var_5 > 20.0 )
                _id_A343( "crash" );
        }
    }
}

_id_A343( var_0 )
{
    self._id_A343 = 1;
}

_id_59DD( var_0 )
{
    if ( !isdefined( level.player._id_2E18._id_7004 ) )
        level.player._id_2E18._id_7004 = _id_3DE0( level.player._id_2E18.origin );

    var_1 = _id_3E3E( level.player._id_2E18.origin, level.player._id_2E18._id_7004._id_5C0F, level.player._id_2E18._id_7004._id_60BD._id_5C0F );
    var_2 = _id_5F33( level.player._id_2E18._id_7004, var_1["progress"], var_1["offset"] );
    var_3 = var_2._id_7000;
    var_4 = var_2._id_6379;
    level.player._id_2E18._id_7004 = var_2.node;
    var_5 = _id_7002( self._id_7004, self._id_7000, var_2.node, var_2._id_7000 );
    var_5 -= self._id_6AA6;

    if ( var_5 < level._id_3A1D )
    {
        if ( gettime() > self._id_66CE + 2000 )
        {
            _id_A343( "too far behind" );
            return;
        }
    }
    else if ( var_5 > level._id_3A1C )
    {
        if ( gettime() > self._id_66CE + 2000 )
        {
            _id_A343( "too far ahead" );
            return;
        }
    }
    else
        self._id_66CE = gettime();

    if ( var_0 < 0.6 )
        return;

    var_6 = _id_3DDF( var_5 );
    var_7 = max( level.player._id_2E18 vehicle_getspeed() * var_6, level._id_3A25 );

    if ( self vehicle_isphysveh() )
        self vehphys_setspeed( var_7 );
    else
        self vehicle_setspeed( var_7 );
}

_id_3DDF( var_0 )
{
    var_1 = level._id_3A1E;

    if ( var_0 < level._id_3A1B )
        var_1 = level._id_3A19;
    else if ( var_0 > level._id_3A20 )
        var_1 = level._id_3A1F;
    else if ( var_0 < level._id_3A1A )
    {
        var_2 = level._id_3A1A - level._id_3A1B;
        var_3 = ( level._id_3A1A - var_0 ) / var_2;
        var_4 = level._id_3A19 - level._id_3A1E;
        var_1 = var_3 * var_4 + level._id_3A1E;
    }
    else if ( var_0 > level._id_3A21 )
    {
        var_2 = level._id_3A20 - level._id_3A21;
        var_3 = ( var_0 - level._id_3A21 ) / var_2;
        var_4 = level._id_3A1F - level._id_3A1E;
        var_1 = var_3 * var_4 + level._id_3A1E;
    }
    else
        var_5 = level._id_3A1E;

    return var_1;
}

_id_7002( var_0, var_1, var_2, var_3 )
{
    while ( var_0.index > var_2.index )
    {
        var_0 = var_0._id_6F41;
        var_1 += var_0._id_2B70;
    }

    while ( var_2.index > var_0.index )
    {
        var_2 = var_2._id_6F41;
        var_3 += var_2._id_2B70;
    }

    return var_1 - var_3;
}

_id_3E3E( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = vectornormalize( var_2 - var_1 );
    var_5 = var_0 - var_1;
    var_6 = vectordot( var_5, var_4 );
    var_7 = var_1 + var_4 * var_6;
    var_3["progress"] = var_6;
    var_3["offset"] = distance2d( var_7, var_0 );
    var_8 = anglestoright( vectortoangles( var_4 ) );
    var_9 = vectornormalize( var_7 - var_0 );
    var_10 = vectordot( var_8, var_9 );
    var_3["side"] = "right";

    if ( var_10 > 0 )
    {
        var_3["offset"] *= -1;
        var_3["side"] = "left";
    }

    return var_3;
}

_id_3E5B( var_0, var_1 )
{
    var_2 = var_0._id_2B70;
    var_3 = undefined;

    if ( var_1 > 0 )
        var_3 = _id_3E3E( var_0._id_60BD._id_65A8["right"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );
    else
        var_3 = _id_3E3E( var_0._id_60BD._id_65A8["left"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );

    var_4 = var_1 / var_3["offset"];
    var_5 = ( var_3["progress"] - var_2 ) * var_4;
    return var_5 + var_2;
}

_id_3D4D( var_0, var_1 )
{
    var_2 = [];

    if ( isdefined( var_0._id_60BD._id_65A8["right_warning"] ) )
    {
        var_3 = _id_3E3E( var_0._id_65A8["right_warning"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_4 = _id_3E3E( var_0._id_60BD._id_65A8["right_warning"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_5 = var_1 / ( var_4["progress"] - var_3["progress"] );
        var_2["right"] = var_3["offset"] + var_5 * ( var_4["offset"] - var_3["offset"] );
    }

    if ( isdefined( var_0._id_60BD._id_65A8["left_warning"] ) )
    {
        var_3 = _id_3E3E( var_0._id_65A8["left_warning"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_4 = _id_3E3E( var_0._id_60BD._id_65A8["left_warning"], var_0._id_5C0F, var_0._id_60BD._id_5C0F );
        var_5 = var_1 / ( var_4["progress"] - var_3["progress"] );
        var_2["left"] = var_3["offset"] + var_5 * ( var_4["offset"] - var_3["offset"] );
    }

    return var_2;
}

_id_3E38( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = vectortoangles( var_0._id_60BD._id_5C0F - var_0._id_5C0F );
    var_5 = anglestoforward( var_4 );
    var_6 = anglestoright( var_4 );
    return var_0._id_5C0F + var_5 * var_1 + var_6 * var_2;
}

_id_3EB9( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3E38( var_0, var_1, var_2, var_3 );
    return _id_2F65( var_4 );
}

_id_2F65( var_0 )
{
    var_1 = physicstrace( var_0 + ( 0.0, 0.0, 100.0 ), var_0 + ( 0.0, 0.0, -100.0 ) );

    if ( var_1 == var_0 + ( 0.0, 0.0, -100.0 ) )
    {
        var_2 = bullettrace( var_0 + ( 0.0, 0.0, 100.0 ), var_0 + ( 0.0, 0.0, -100.0 ), 0, undefined, 0, 0, 1, 0, 0 );

        if ( var_2["position"] == var_1 )
            return var_0;

        if ( isdefined( var_2["surfacetype"] ) && issubstr( var_2["surfacetype"], "water" ) )
            var_1 = var_2["position"];

        return var_0;
    }

    return var_1;
}

_id_5F33( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();

    for (;;)
    {
        var_4 = var_0._id_2B70;

        if ( isdefined( var_2 ) )
            var_4 = _id_3E5B( var_0, var_2 );

        if ( var_1 > var_4 )
        {
            if ( var_0 == var_0._id_60BD )
                break;

            var_5 = _id_3E38( var_0, var_4, var_2 );
            var_1 -= var_4;
            var_0 = var_0._id_60BD;
            var_6 = _id_3E3E( var_5, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
            var_2 = var_6["offset"];
            continue;
        }

        if ( var_1 < 0 )
        {
            if ( var_0 == var_0._id_6F41 )
                break;

            var_5 = _id_3E38( var_0, 0, var_2 );
            var_0 = var_0._id_6F41;
            var_6 = _id_3E3E( var_5, var_0._id_5C0F, var_0._id_60BD._id_5C0F );
            var_1 += var_6["progress"];
            var_2 = var_6["offset"];
            continue;
        }

        break;
    }

    var_3.node = var_0;
    var_3._id_7000 = var_1;
    var_3._id_6379 = var_2;
    return var_3;
}

_id_269C()
{

}

_id_2691()
{
    level endon( "stop_free_path_debug" );
    iprintlnbold( "!!!!DEBUG PATH!!!!" );
    var_0 = undefined;
    var_1 = undefined;

    for (;;)
    {
        if ( !isdefined( level._id_9CC6 ) )
        {
            wait 0.05;
            continue;
        }

        var_2 = level._id_9CC6;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = var_2[var_3];

            if ( isdefined( var_4._id_60BD._id_65A8["left_warning"] ) )
            {

            }

            if ( isdefined( var_4._id_60BD._id_65A8["right_warning"] ) )
            {

            }

            foreach ( var_6 in var_4._id_2013 )
                var_4 _id_2DA7( var_6._id_205B, ( 0.5, 0.0, 1.0 ) );

            foreach ( var_6 in var_4._id_2011 )
                var_4 _id_2DA7( var_6._id_205B, ( 1.0, 0.0, 0.5 ) );

            foreach ( var_11 in var_4._id_2010 )
            {
                var_12 = var_11.origin;
                var_13 = var_11._id_65B0.origin;
            }
        }

        wait 0.05;
    }
}

_id_267D( var_0 )
{
    var_1 = ( 0.2, 0.2, 1.0 );

    if ( var_0 )
    {

    }
    else
    {

    }
}

_id_2DA7( var_0, var_1 )
{
    var_2 = _id_3E38( self, var_0["min"], var_0["left_offset"] );
    var_3 = _id_3E38( self, var_0["max"], var_0["left_offset"] );
    var_2 = _id_3E38( self, var_0["min"], var_0["right_offset"] );
    var_3 = _id_3E38( self, var_0["max"], var_0["right_offset"] );
    var_2 = _id_3E38( self, var_0["min"], var_0["right_offset"] );
    var_3 = _id_3E38( self, var_0["min"], var_0["left_offset"] );
    var_2 = _id_3E38( self, var_0["max"], var_0["right_offset"] );
    var_3 = _id_3E38( self, var_0["max"], var_0["left_offset"] );
}
