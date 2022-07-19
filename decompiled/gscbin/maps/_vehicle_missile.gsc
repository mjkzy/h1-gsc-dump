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
    if ( getdvar( "cobrapilot_surface_to_air_missiles_enabled" ) == "" )
        setdvar( "cobrapilot_surface_to_air_missiles_enabled", "1" );

    _id_98A3();
    thread _id_37E1();
    thread _id_9999();
    thread _id_297E();
}

_id_297E()
{
    self waittill( "death" );
    self detachall();
}

_id_9999()
{
    self endon( "death" );

    if ( !isdefined( self._id_7AFF ) )
        return;

    if ( self._id_7AFF == 0 )
        return;

    self._id_0E48 = 30000;

    if ( isdefined( self.rank ) )
        self._id_0E48 = self.rank;

    while ( !isdefined( level._id_1FFE ) )
        wait 0.05;

    var_0 = 1.0;

    if ( level._id_1FFE == "easy" )
        var_0 = 0.5;
    else if ( level._id_1FFE == "medium" )
        var_0 = 1.7;
    else if ( level._id_1FFE == "hard" )
        var_0 = 1.0;
    else if ( level._id_1FFE == "insane" )
        var_0 = 1.5;

    self._id_0E48 *= var_0;

    if ( getdvar( "cobrapilot_debug" ) == "1" )
        iprintln( "surface-to-air missile range difficultyScaler = " + var_0 );

    for (;;)
    {
        wait(2 + randomfloat( 1 ));
        var_1 = undefined;
        var_1 = _id_A53F::_id_3F7F( self._id_0E48, undefined, 0, 1 );

        if ( !isdefined( var_1 ) )
            continue;

        var_2 = var_1.origin;

        if ( isdefined( var_1._id_7AED ) )
            var_2 += ( 0, 0, var_1._id_7AED );

        self _meth_825d( var_2 );
        level thread _id_9984( self, 5.0 );
        self waittill( "turret_rotate_stopped" );
        self clearturrettargetent();

        if ( distance( self.origin, var_1.origin ) > self._id_0E48 )
            continue;

        var_3 = 0;
        var_3 = sighttracepassed( self.origin, var_1.origin + ( 0, 0, 150 ), 0, self );

        if ( !var_3 )
            continue;

        if ( getdvar( "cobrapilot_surface_to_air_missiles_enabled" ) == "1" )
        {
            self notify( "shoot_target", var_1 );
            self waittill( "missile_fired", var_4 );

            if ( isdefined( var_4 ) )
            {
                if ( level._id_1FFE == "hard" )
                {
                    wait(1 + randomfloat( 2 ));
                    continue;
                }
                else if ( level._id_1FFE == "insane" )
                    continue;
                else
                    var_4 waittill( "death" );
            }

            continue;
        }
    }
}

_id_9984( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "turret_rotate_stopped" );
    wait(var_1);
    var_0 notify( "turret_rotate_stopped" );
}

_id_A346( var_0 )
{
    var_1 = distance( ( self.origin[0], self.origin[1], 0 ), ( var_0.origin[0], var_0.origin[1], 0 ) );
    var_2 = var_0.origin[2] - self.origin[2];

    if ( var_2 <= 750 )
        return 0;

    var_3 = var_2 * 2.5;

    if ( var_1 <= self._id_0E48 + var_3 )
        return 1;

    return 0;
}

_id_37E1()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "shoot_target", var_0 );
        var_1 = undefined;

        if ( !isdefined( var_0._id_7AED ) )
            var_0._id_7AED = 0;

        var_2 = ( 0, 0, var_0._id_7AED );
        var_1 = self fireweapon( self._id_5CCA[self._id_5CBD], var_0, var_2 );
        var_1 thread _id_A5A4::_id_69C6( "weap_bm21_missile_projectile" );

        if ( getdvar( "cobrapilot_debug" ) == "1" )
            level thread _id_2DC0( var_1, var_0, var_2 );

        if ( !isdefined( var_0._id_4C2D ) )
            var_0._id_4C2D = [];

        var_0._id_4C2D = common_scripts\utility::_id_0CDA( var_0._id_4C2D, var_1 );
        thread _id_A53F::_id_5C8F( var_1, var_0 );

        if ( _id_A5A4::_id_4749( self._id_5CBF, self._id_5CCA[self._id_5CBD] ) )
            self detach( self._id_5CBF, self._id_5CCA[self._id_5CBD] );

        self._id_5CBD++;
        self._id_5CB3--;
        var_0 notify( "incomming_missile", var_1 );
        _id_98A3();
        wait 0.05;
        self notify( "missile_fired", var_1 );
    }
}

_id_2DC0( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    for (;;)
        wait 0.05;
}

_id_98A3()
{
    if ( !isdefined( self._id_5CB3 ) )
        self._id_5CB3 = 0;

    if ( !isdefined( self._id_5CBD ) )
        self._id_5CBD = 0;

    if ( self._id_5CB3 > 0 )
        return;

    for ( var_0 = 0; var_0 < self._id_5CCA.size; var_0++ )
    {
        if ( _id_A5A4::_id_4749( self._id_5CBF, self._id_5CCA[var_0] ) )
            self attach( self._id_5CBF, self._id_5CCA[var_0] );
    }

    self._id_5CB3 = self._id_5CCA.size;
    self._id_5CBD = 0;
}
