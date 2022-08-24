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

_id_33BF( var_0 )
{
    var_0 endon( "death" );

    while ( var_0.health > 0 )
    {
        var_0 waittill( "missile_lock", var_1 );
        var_2 = _id_33B9( var_0, "random" );
        _id_33BE( var_0, var_2 );
        wait 0.05;
    }
}

_id_33B9( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "strafe_left_right":
            var_0 _id_33B8( 3000, -1500, 500, "average" );
            var_0 _id_33B8( 6000, 3000, -700, "average" );
            var_0 _id_33B8( 3000, -1500, 200, "average" );
            break;
        case "strafe_right_left":
            var_0 _id_33B8( 3000, 1500, 500, "average" );
            var_0 _id_33B8( 6000, -3000, -700, "average" );
            var_0 _id_33B8( 3000, 1500, 200, "average" );
            break;
        case "360_clockwise":
            var_0 _id_33B8( 1500, 1500, 200, "none" );
            var_0 _id_33B8( 0, 1500, 200, "none" );
            var_0 _id_33B8( -1500, 1500, 200, "none" );
            var_0 _id_33B8( -1500, 0, 0, "none" );
            var_0 _id_33B8( -1000, -1000, -200, "none" );
            var_0 _id_33B8( 0, -1000, -200, "none" );
            var_0 _id_33B8( 1000, -1000, -200, "none" );
            break;
        case "360_counter_clockwise":
            var_0 _id_33B8( 1500, -1500, 200, "none" );
            var_0 _id_33B8( 0, -1500, 200, "none" );
            var_0 _id_33B8( -1500, -1500, 200, "none" );
            var_0 _id_33B8( -1500, 0, 0, "none" );
            var_0 _id_33B8( -1000, 1000, -200, "none" );
            var_0 _id_33B8( 0, 1000, -200, "none" );
            var_0 _id_33B8( 1000, 1000, -200, "none" );
            break;
        case "random":
            var_2 = [];
            var_2[0] = "strafe_left_right";
            var_2[1] = "strafe_right_left";
            var_2[2] = "360_clockwise";
            var_2[3] = "360_counter_clockwise";
            return _id_33B9( var_0, var_2[randomint( var_2.size )] );
    }

    var_3 = _id_33BC( var_0 );
    return var_3;
}

_id_33BE( var_0, var_1 )
{
    var_0 notify( "taking_evasive_actions" );
    var_0 endon( "taking_evasive_actions" );
    var_0 endon( "death" );
    var_0 notify( "evasive_action_done" );
    thread _id_33BB( var_0 );

    if ( getdvar( "cobrapilot_debug" ) == "1" )
        var_0 _id_33BA( var_1 );

    var_0 neargoalnotifydist( 1500 );
    var_0 vehicle_setspeed( 100, 30, 30 );
    var_2 = var_0.angles[1];

    for ( var_3 = 1; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3 + 1] ) )
            var_4 = vectortoangles( var_1[var_3 + 1]["pos"] - var_1[var_3]["pos"] );
        else
            var_4 = ( 0, var_2, 0 );

        var_5 = var_4[1];

        if ( var_1[var_3]["goalYawMethod"] == "average" )
            var_5 = ( var_4[1] + var_2 ) / 2;
        else if ( var_1[var_3]["goalYawMethod"] == "forward" )
            var_5 = var_0.angles[1];

        if ( getdvar( "cobrapilot_debug" ) == "1" )
            thread maps\_utility::_id_2DBF( var_1[var_3]["pos"], var_1[var_3]["pos"] + anglestoforward( ( 0, var_5, 0 ) ) * 250, 1.0, 1.0, 0.2, var_0, "evasive_action_done" );

        var_0 settargetyaw( var_5 );
        var_0 thread maps\_vehicle_code::_id_834E( var_1[var_3]["pos"], 0 );
        var_0 waittill( "near_goal" );
    }

    var_0 notify( "evasive_action_done" );
    var_0 thread maps\_utility::_id_9D1F();
}

_id_33BB( var_0 )
{
    var_0 notify( "end_maneuvers" );
    var_0 endon( "end_maneuvers" );
    var_0 endon( "evasive_action_done" );
    var_0 endon( "death" );
    var_0 waittill( "missile_lock_ended" );
    var_0 thread maps\_utility::_id_9D1F();
}

_id_33B8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_33BD ) )
    {
        self._id_33BD = [];
        self._id_33BD[0]["pos"] = self.origin;
        self._id_33BD[0]["ang"] = ( 0, self.angles[1], 0 );
    }

    var_4 = self._id_33BD.size;

    if ( !isdefined( var_3 ) )
        var_3 = "none";

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self._id_33BD[var_4]["forward"] = var_0;
    self._id_33BD[var_4]["side"] = var_1;
    self._id_33BD[var_4]["up"] = var_2;
    var_5 = anglestoforward( self._id_33BD[0]["ang"] );
    var_6 = anglestoright( self._id_33BD[0]["ang"] );
    self._id_33BD[var_4]["pos"] = self._id_33BD[var_4 - 1]["pos"] + var_5 * self._id_33BD[var_4]["forward"] + var_6 * self._id_33BD[var_4]["side"] + ( 0, 0, var_2 );
    self._id_33BD[var_4]["goalYawMethod"] = var_3;
}

_id_33BC( var_0 )
{
    var_1 = var_0._id_33BD;
    var_0._id_33BD = undefined;
    return var_1;
}

_id_33BA( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        thread maps\_utility::_id_2DBF( var_0[var_1 - 1]["pos"], var_0[var_1]["pos"], 1.0, 0.2, 0.2, self, "evasive_action_done" );
}

_id_A341( var_0 )
{
    var_0 endon( "death" );
    level._id_6D79 endon( "death" );
    var_1 = 2200;
    var_2 = 1500;
    var_3 = 0;
    var_4 = 1.0;
    var_5 = 1.2;
    var_6 = 50;
    var_7 = 60;
    var_8 = 2000;
    var_9 = _id_408D();
    var_10 = 0.0;
    var_11 = gettime();
    var_12 = _id_A340( var_1, var_2, var_3 );
    var_0 vehicle_setspeed( 30, 20, 20 );
    var_0 settargetyaw( level._id_6D79.angles[1] );
    var_0 setgoalpos( var_12, 1 );

    for (;;)
    {
        var_12 = _id_A340( var_1, var_2, var_3 );

        if ( getdvar( "cobrapilot_debug" ) == "1" )
        {
            thread common_scripts\utility::_id_2DB8( level._id_6D79.origin, var_12, 0, 1, 0, var_4 );
            thread common_scripts\utility::_id_2DB8( level._id_6D79.origin, var_0.origin, 0, 0, 1, var_4 );
            thread common_scripts\utility::_id_2DB8( var_0.origin, var_12, 1, 1, 0, var_4 );
        }

        var_13 = gettime();

        if ( var_13 >= var_11 + var_8 )
        {
            var_11 = var_13;
            var_10 = var_9;
            var_9 = _id_408D();
        }

        var_14 = 0;
        var_15 = 0;

        if ( var_10 > 20 )
        {
            var_15 = var_10;
            var_14 = 1;
        }
        else if ( var_10 <= 20 && _id_408D() > 20 )
        {
            var_15 = _id_408D();
            var_14 = 1;
        }

        if ( var_14 && var_15 > 0 )
        {
            var_15 *= var_5;
            var_16 = var_6;
            var_17 = var_7;

            if ( var_16 >= var_15 / 2 )
                var_16 = var_15 / 2;

            if ( var_17 >= var_15 / 2 )
                var_17 = var_15 / 2;

            var_0 vehicle_setspeed( var_15, var_16, var_17 );
            var_0 settargetyaw( level._id_6D79.angles[1] );
            var_18 = 0;

            if ( _id_408D() <= 30 )
                var_18 = 1;

            if ( getdvar( "cobrapilot_debug" ) == "1" )
                iprintln( "wingman speed: " + var_15 + " : " + var_18 );

            var_0 setgoalpos( var_12, var_18 );
        }

        wait(var_4);
    }
}

_id_A340( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( common_scripts\utility::_id_38C8( level._id_6D79.angles ) );
    var_4 = anglestoright( common_scripts\utility::_id_38C8( level._id_6D79.angles ) );
    var_5 = level._id_6D79.origin + var_3 * var_0 + var_4 * var_1 + ( 0, 0, var_2 );
    return var_5;
}

_id_408D()
{
    return level._id_6D79 vehicle_getspeed();
}
