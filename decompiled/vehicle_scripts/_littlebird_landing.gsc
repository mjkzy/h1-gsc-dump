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

_id_4D0D()
{
    if ( isdefined( level._id_57AA ) )
        return;

    level._id_57AA = 1;
    thread _id_4D0E();
}

_id_4D0E()
{
    waitframe;
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "gag_stage_littlebird_unload", "script_noteworthy" ), ::_id_8121 );
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "gag_stage_littlebird_load", "script_noteworthy" ), ::_id_8120 );
}

_id_57B1()
{
    self endon( "death" );
    maps\_utility::_id_32DD( "prep_unload" );
    maps\_utility::_id_32E0( "prep_unload" );
    maps\_vehicle_code::_id_992C();
    var_0 = _id_3DAF();
    var_0 _id_57B2( self );
    maps\_vehicle::_id_9D17( var_0 );
}

_id_8AE9( var_0, var_1, var_2, var_3 )
{
    var_4 = "stage_littlebird_" + var_1;
    var_5 = [];
    var_5[0] = var_0;
    var_3 maps\_anim::_id_0BD0( var_5[0], var_4, "tag_detach_" + var_1 );
    var_3 maps\_anim::_id_0BC9( var_5[0], var_4, "tag_detach_" + var_1 );
    maps\_utility::_id_32DE( "staged_guy_" + var_1 );
    var_0 _meth_81aa( common_scripts\utility::_id_2F69( var_0.origin ) );
    var_0.goalradius = 16;
    maps\_utility::_id_32E0( "guy2_in_" + var_1 );
    thread maps\_vehicle_aianim::_id_57BF( [ var_0 ], undefined, var_1 );
}

_id_8121()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        _id_57B2( var_0 );
    }
}

_id_8120()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 setdeceleration( 6 );
        var_0 setacceleration( 4 );
        var_0 settargetyaw( self.angles[1] );
        var_0 vehicle_setspeed( 20, 7, 7 );

        while ( distance( common_scripts\utility::_id_38C9( var_0.origin ), common_scripts\utility::_id_38C9( self.origin ) ) > 256 )
            wait 0.05;

        var_0 endon( "death" );
        var_0 thread _id_9CF6( 220, self );
        var_0 waittill( "near_goal" );
        var_0 vehicle_setspeed( 20, 22, 7 );
        var_0 thread _id_9CF6( 16, self );
        var_0 waittill( "near_goal" );
        var_0 maps\_vehicle_code::_id_A0B8();
        var_0 notify( "touch_down", self );
        var_0 vehicle_setspeed( 20, 8, 7 );
    }
}

_id_57B2( var_0 )
{
    var_0 setdeceleration( 6 );
    var_0 setacceleration( 4 );
    var_0 settargetyaw( self.angles[1] );
    var_0 vehicle_setspeed( 20, 7, 7 );

    while ( distance( common_scripts\utility::_id_38C9( var_0.origin ), common_scripts\utility::_id_38C9( self.origin ) ) > 512 )
        wait 0.05;

    var_0 endon( "death" );
    var_1 = "landing" + randomint( 99999 );
    badplace_cylinder( var_1, 30, self.origin, 200, 300, "axis", "allies", "neutral", "team3" );
    var_0 thread _id_9CF6( 424, self );
    var_0 waittill( "near_goal" );
    badplace_delete( var_1 );
    badplace_cylinder( var_1, 30, self.origin, 200, 300, "axis", "allies", "neutral", "team3" );
    var_0 notify( "groupedanimevent", "pre_unload" );
    var_0 thread maps\_vehicle_aianim::_id_0C57( "pre_unload" );
    var_0 vehicle_setspeed( 20, 22, 7 );
    var_0 notify( "nearing_landing" );

    if ( isdefined( var_0._id_2549 ) )
    {
        switch ( var_0._id_2549 )
        {
            case "hover_then_land":
                var_0 vehicle_setspeed( 10, 22, 7 );
                var_0 thread _id_9CF6( 32, self, 64 );
                var_0 waittill( "near_goal" );
                var_0 notify( "hovering" );
                wait 1;
                break;
            default:
                break;
        }
    }

    var_0 thread _id_9CF6( 16, self );
    var_0 waittill( "near_goal" );
    badplace_delete( var_1 );
    maps\_utility::script_lightset();
    var_0 maps\_vehicle::_id_9D67();
    var_0 maps\_vehicle_code::_id_A0B8();
    var_0 vehicle_setspeed( 20, 8, 7 );
    wait 0.2;
    var_0 notify( "stable_for_unlink" );
    wait 0.2;

    if ( isdefined( self._id_79D8 ) )
        common_scripts\utility::_id_383F( self._id_79D8 );

    if ( isdefined( self._id_79DA ) )
        common_scripts\utility::_id_384A( self._id_79DA );

    var_0 notify( "littlebird_liftoff" );
}

_id_7EBF( var_0, var_1, var_2 )
{
    if ( !maps\_utility::_id_32DC( "staged_guy_" + var_2 ) )
        maps\_utility::_id_32DD( "staged_guy_" + var_2 );
    else
        maps\_utility::_id_32DA( "staged_guy_" + var_2 );

    if ( !maps\_utility::_id_32DC( "guy2_in_" + var_2 ) )
        maps\_utility::_id_32DD( "guy2_in_" + var_2 );
    else
        maps\_utility::_id_32DA( "guy2_in_" + var_2 );

    var_3 = _id_3E6E( var_0, var_2 );
    var_4 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
    var_5 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_5 setmodel( self.motiontrackerenabled );

    if ( isdefined( self._id_60A8 ) )
        var_5.origin = self.origin;
    else
        var_5.origin = common_scripts\utility::_id_2F69( var_4.origin ) + ( 0, 0, self._id_65A7 );

    var_5.angles = var_4.angles;
    var_5 hide();
    var_6 = undefined;
    var_7 = undefined;
    var_8 = undefined;

    foreach ( var_10 in var_3 )
    {
        var_11 = undefined;

        foreach ( var_13 in var_1 )
        {
            if ( isdefined( var_13._id_7ADC ) && var_13._id_7ADC == var_10._id_7ADC )
            {
                var_11 = var_13;
                break;
            }
        }

        if ( !isdefined( var_11 ) )
            var_11 = common_scripts\utility::_id_3F33( var_10.origin, var_1 );

        var_11._id_7ADC = var_10._id_7ADC;

        if ( var_11._id_7ADC == 2 || var_11._id_7ADC == 5 )
        {
            var_6 = var_11;
            var_11 maps\_spawner::_id_4244( var_10 );
        }
        else if ( var_11._id_7ADC == 3 || var_11._id_7ADC == 6 )
            var_8 = var_11;
        else if ( var_11._id_7ADC == 4 || var_11._id_7ADC == 7 )
        {
            var_7 = var_11;
            var_11 maps\_spawner::_id_4244( var_10 );
        }

        var_1 = common_scripts\utility::_id_0CF6( var_1, var_11 );
    }

    thread _id_8AE9( var_8, var_2, var_7, var_5 );
    thread common_scripts\utility::_id_2825( var_5 );
}

_id_3E6E( var_0, var_1 )
{
    var_2 = getnodearray( var_0._not_team, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5.script_parentname == "stage_" + var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_3DAF()
{
    var_0 = self._id_251D;

    for (;;)
    {
        var_1 = maps\_utility::_id_3F82( var_0._not_team, "targetname" );

        if ( isdefined( var_1._id_7B06 ) )
            return var_1;

        var_0 = var_1;
    }
}

_id_57D1( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        if ( var_6._id_7ADC == 2 || var_6._id_7ADC == 5 )
        {
            var_2 = var_6;
            continue;
        }

        if ( var_6._id_7ADC == 3 || var_6._id_7ADC == 6 )
        {
            var_4 = var_6;
            continue;
        }

        if ( var_6._id_7ADC == 4 || var_6._id_7ADC == 7 )
            var_3 = var_6;
    }

    maps\_utility::_id_32E0( "staged_guy_" + var_0 );
    thread maps\_vehicle::_id_9D06( var_2, undefined, var_0 );
    var_2 waittill( "boarding_vehicle" );
    thread maps\_vehicle::_id_9D06( var_3, undefined, var_0 );
    var_3 waittill( "boarding_vehicle" );
    maps\_utility::_id_32DE( "guy2_in_" + var_0 );
}

_id_9CF6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self notify( "newpath" );

    if ( !isdefined( var_0 ) )
        var_0 = 2;

    self neargoalnotifydist( var_0 );
    self sethoverparams( 0, 0, 0 );
    self cleargoalyaw();
    self settargetyaw( common_scripts\utility::_id_38C8( var_1.angles )[1] );
    maps\_vehicle_code::_id_0646( maps\_utility::_id_4417( var_1.origin ) + ( 0, 0, var_2 ), 1 );
    self waittill( "goal" );
}
