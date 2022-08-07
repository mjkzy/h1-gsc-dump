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
#using_animtree("animated_props");

main()
{
    waitframe;
    _id_4D79();
    thread heliwind_init_spawn_tracker();
    level._id_4C78 = [];
    level._id_0BED = #animtree;

    if ( !isdefined( level.anim_prop_models ) )
        level.anim_prop_models = [];

    if ( !isdefined( level._id_0BEB ) )
        level._id_0BEB = [];

    var_0 = getentarray( "animated_model", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::_id_5D3B );

    if ( isdefined( level._id_4C78 ) && level._id_4C78.size )
    {
        var_1 = " ";

        foreach ( var_3 in level._id_4C78 )
            var_1 += ( var_3 + " " );
    }

    foreach ( var_6 in var_0 )
    {
        if ( isdefined( level._id_0BEB[var_6.motiontrackerenabled] ) )
        {
            var_6 thread [[ level._id_0BEB[var_6.motiontrackerenabled] ]]();
            continue;
        }

        var_7 = getarraykeys( level.anim_prop_models[var_6.motiontrackerenabled] );
        var_8 = 0;

        foreach ( var_10 in var_7 )
        {
            if ( var_10 == "still" )
            {
                var_8 = 1;
                break;
            }
        }

        if ( var_8 )
            var_6 thread _id_0C66();
        else
            var_6 thread _id_0C64();
    }
}

_id_4D79()
{
    if ( isdefined( level._id_A32C ) )
        return;

    level._id_A32C = spawnstruct();
    level._id_A32C.reached_wait_speed = 0.4;
    level._id_A32C.wildcardslots = 1;
    level._id_A32C._id_9C65 = 0.2;
}

_id_5D3B()
{
    if ( !isdefined( level.anim_prop_models[self.motiontrackerenabled] ) )
    {
        if ( !_id_0AFB( level._id_4C78, self.motiontrackerenabled ) )
            level._id_4C78[level._id_4C78.size] = self.motiontrackerenabled;
    }
}

_id_0AFB( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_0C64()
{
    self useanimtree( #animtree );
    var_0 = getarraykeys( level.anim_prop_models[self.motiontrackerenabled] );
    var_1 = var_0[randomint( var_0.size )];
    var_2 = level.anim_prop_models[self.motiontrackerenabled][var_1];
    self _meth_814d( var_2, 1, self _meth_8151( var_2 ), 1 );
    self setanimtime( var_2, randomfloatrange( 0, 1 ) );
}

_id_0C66()
{
    thread heliwind_setup();
    self useanimtree( #animtree );
    var_0 = "strong";

    for (;;)
    {
        thread _id_14A6( var_0 );
        level waittill( "windchange", var_0 );
    }
}

_id_14A6( var_0 )
{
    level endon( "windchange" );
    var_1 = level._id_A32C.wildcardslots;
    var_2 = level._id_A32C.reached_wait_speed + randomfloat( level._id_A32C._id_9C65 );
    self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["still"], 1, self _meth_8151( level.anim_prop_models[self.motiontrackerenabled]["still"] ), var_2 );
    self _meth_814d( level.anim_prop_models[self.motiontrackerenabled][var_0], var_1, self _meth_8151( level.anim_prop_models[self.motiontrackerenabled][var_0] ), var_2 );
}

heliwind_check_should_track()
{
    var_0 = getarraykeys( level.anim_prop_models[self.motiontrackerenabled] );
    return common_scripts\utility::_id_0CE4( var_0, "heli" );
}

heliwind_setup()
{
    if ( !heliwind_check_should_track() )
        return;

    self.heliwind_weight = 0.0;
    self.heliwind_max_delta = 0.025;
    self.heliwind_distance = 2000;
    self.heliwind_distance_sqr = self.heliwind_distance * self.heliwind_distance;
    thread heliwind_track();
    thread heliwind_animate_tree();
}

heliwind_smoothstep( var_0, var_1, var_2 )
{
    var_2 = ( var_2 - var_0 ) / ( var_1 - var_0 );
    var_3 = clamp( var_2, 0.0, 1.0 );
    return var_3 * var_3 * ( 3 - 2 * var_3 );
}

heliwind_get_closest_fraction( var_0 )
{
    var_1 = distancesquared( var_0.origin, self.origin );
    self.closest_origin = var_0.origin;
    return 1.0 - clamp( var_1 / self.heliwind_distance_sqr, 0.0, 1.0 );
}

heliwind_get_closest_heli()
{
    var_0 = 1e+08.0;
    var_1 = 0;

    for ( var_2 = 0; var_2 < level.anim_models_helis.size; var_2++ )
    {
        var_3 = level.anim_models_helis[var_2];

        if ( !isdefined( var_3 ) )
            continue;

        var_4 = distancesquared( var_3.origin, self.origin );

        if ( var_4 < var_0 )
        {
            var_0 = var_4;
            var_1 = var_2;
        }
    }

    return level.anim_models_helis[var_1];
}

heliwind_fadeoff()
{
    if ( self.heliwind_weight > 0.0 )
    {
        var_0 = clamp( self.heliwind_weight - self.heliwind_max_delta, 0.0, 1.0 );
        var_1 = heliwind_smoothstep( 0.0, 1.0, var_0 );
        self.heliwind_weight = var_1;
    }
}

heliwind_track()
{
    for (;;)
    {
        var_0 = heliwind_get_closest_heli();

        if ( isdefined( var_0 ) )
        {
            var_1 = heliwind_get_closest_fraction( var_0 );

            if ( var_1 > 0 )
            {
                var_2 = heliwind_smoothstep( 0.0, 1.0, var_1 );
                self.heliwind_weight = var_2;
            }
            else
                heliwind_fadeoff();
        }
        else
            heliwind_fadeoff();

        wait 0.15;
    }
}

heliwind_animate_tree()
{
    self useanimtree( #animtree );
    self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["strong"], 1.0, 0.05, 1.0 );
    self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["heli"], 0.0, 0.05, 1.0 );
    self _meth_8144( level.anim_prop_models[self.motiontrackerenabled]["still"], 0.0 );
    var_0 = 0.15;
    var_1 = 0.0;

    for (;;)
    {
        var_2 = self _meth_8152( level.anim_prop_models[self.motiontrackerenabled]["heli"] );
        var_3 = self.heliwind_weight - var_2;
        var_4 = clamp( var_3, -1 * self.heliwind_max_delta, self.heliwind_max_delta );
        var_5 = var_2 + var_4;

        if ( var_5 != var_1 )
        {
            var_1 = var_5;
            self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["strong"], 1.0 - var_5, var_0, 1.0 );
            self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["heli"], var_5, var_0, 1.0 );
            self _meth_814d( level.anim_prop_models[self.motiontrackerenabled]["still"], 0.0, 0.0, 1.0 );
            wait(var_0);
            continue;
        }

        wait 0.5;
    }
}

heliwind_init_spawn_tracker()
{
    level.anim_models_helis = [];
    var_0 = getentarray();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.visionsetnaked ) )
        {
            if ( var_2 maps\_vehicle::_id_5118() )
                var_2 thread heliwind_track_heli_alive();
        }
    }
}

heliwind_track_heli_alive()
{
    if ( isspawner( self ) )
        self waittill( "spawned", var_0 );
    else
        var_0 = self;

    level.anim_models_helis[level.anim_models_helis.size] = var_0;
    var_0 waittill( "death", var_1 );

    if ( isdefined( var_1 ) )
    {
        waitframe;

        if ( isdefined( var_0._id_235D ) && var_0._id_235D )
            var_0 waittill( "crash_done" );
    }

    level.anim_models_helis = common_scripts\utility::_id_0CF6( level.anim_models_helis, var_0 );
}
