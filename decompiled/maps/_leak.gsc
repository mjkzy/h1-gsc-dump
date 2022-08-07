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
    var_0 = getentarray( "leaking", "targetname" );

    if ( !var_0.size )
        return;

    var_0 thread _id_6EDB();
    var_0 thread _id_5BBE();
    common_scripts\utility::_id_0D13( var_0, ::leak_setup );
}

leak_setup()
{
    switch ( self.script_parentname )
    {
        case "barrel_oil":
            leak_barrel_setup();
            break;
        case "barrel_acid":
            leak_barrel_setup();
            break;
        case "barrel_sludge":
            leak_barrel_setup();
            break;
        case "barrel_water":
            leak_barrel_setup();
            break;
    }

    thread leak_think();
}

leak_barrel_setup()
{
    self.a = self.origin;
    self.upgradepurchased = anglestoup( self.angles );
    var_0 = anglestoup( ( 0, 90, 0 ) );
    self._id_6581 = self.a + self.upgradepurchased * 22;
    self.a += self.upgradepurchased * 1.5;
    self.b = self.a + self.upgradepurchased * 41.4;
    self._id_9F3C = 25861.7;
    self.curvol = self._id_9F3C;
    var_1 = vectordot( self.upgradepurchased, var_0 );
    var_2 = self.b;

    if ( var_1 < 0 )
        var_2 = self.a;

    var_1 = abs( 1 - abs( var_1 ) );
    self.lowz = physicstrace( self._id_6581, self._id_6581 + ( 0, 0, -80 ) )[2];
    self.highz = var_2[2] + var_1 * 14;
}

leak_think()
{
    self setcandamage( 1 );
    self.canspawnpool = isdefined( level._effect["leak_interactive_pool"] ) && isdefined( level._effect["leak_interactive_pool"][self.script_parentname] );
    self endon( "drained" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        var_3 = self [[ level._leak_methods[var_4] ]]( var_3, var_4 );

        if ( !isdefined( var_3 ) )
            continue;

        thread leak_drain( var_3 );
    }
}

leak_drain( var_0 )
{
    var_1 = pointonsegmentnearesttopoint( self.a, self.b, var_0 );
    var_2 = undefined;

    if ( var_1 == self.a )
        var_2 = self.upgradepurchased * -1;
    else if ( var_1 == self.b )
        var_2 = self.upgradepurchased;
    else
        var_2 = vectorfromlinetopoint( self.a, self.b, var_0 );

    var_3 = var_0[2] - self.lowz;

    if ( var_3 < 0.02 )
        var_3 = 0;

    var_4 = var_3 / ( self.highz - self.lowz ) * self._id_9F3C;

    if ( self.curvol > var_4 )
    {
        if ( self.canspawnpool )
            thread leak_pool( var_0, var_2 );

        thread common_scripts\utility::_id_69C2( level._id_0662["leak_interactive_leak"][self.script_parentname], var_0 );

        while ( self.curvol > var_4 )
        {
            playfx( level._effect["leak_interactive_leak"][self.script_parentname], var_0, var_2 );
            self.curvol -= 100;
            wait 0.1;
        }

        playfx( level._effect["leak_interactive_drain"][self.script_parentname], var_0, var_2 );
    }

    if ( self.curvol / self._id_9F3C <= 0.05 )
        self notify( "drained" );
}

leak_pool( var_0, var_1 )
{
    self.canspawnpool = 0;
    playfx( level._effect["leak_interactive_pool"][self.script_parentname], var_0, var_1 );
    wait 0.5;
    self.canspawnpool = 1;
}

_id_5BBE()
{
    level._leak_methods = [];
    level._leak_methods["MOD_UNKNOWN"] = ::leak_calc_splash;
    level._leak_methods["MOD_PISTOL_BULLET"] = ::leak_calc_ballistic;
    level._leak_methods["MOD_RIFLE_BULLET"] = ::leak_calc_ballistic;
    level._leak_methods["MOD_GRENADE"] = ::leak_calc_splash;
    level._leak_methods["MOD_GRENADE_SPLASH"] = ::leak_calc_splash;
    level._leak_methods["MOD_PROJECTILE"] = ::leak_calc_splash;
    level._leak_methods["MOD_PROJECTILE_SPLASH"] = ::leak_calc_splash;
    level._leak_methods["MOD_MELEE"] = ::leak_calc_nofx;
    level._leak_methods["MOD_HEAD_SHOT"] = ::leak_calc_nofx;
    level._leak_methods["MOD_CRUSH"] = ::leak_calc_nofx;
    level._leak_methods["MOD_TELEFRAG"] = ::leak_calc_nofx;
    level._leak_methods["MOD_FALLING"] = ::leak_calc_nofx;
    level._leak_methods["MOD_SUICIDE"] = ::leak_calc_nofx;
    level._leak_methods["MOD_TRIGGER_HURT"] = ::leak_calc_splash;
    level._leak_methods["MOD_EXPLOSIVE"] = ::leak_calc_splash;
    level._leak_methods["MOD_IMPACT"] = ::leak_calc_nofx;
    level._leak_methods["MOD_EXPLOSIVE_BULLET"] = ::leak_calc_ballistic;
}

leak_calc_ballistic( var_0, var_1 )
{
    return var_0;
}

leak_calc_splash( var_0, var_1 )
{
    var_2 = vectornormalize( vectorfromlinetopoint( self.a, self.b, var_0 ) );
    var_0 = pointonsegmentnearesttopoint( self.a, self.b, var_0 );
    return var_0 + var_2 * 4;
}

leak_calc_nofx( var_0, var_1 )
{
    return undefined;
}

leak_calc_assert( var_0, var_1 )
{

}

_id_6EDB()
{
    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0].script_parentname != "barrel_oil" )
            continue;

        level._effect["leak_interactive_leak"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_leak" );
        level._effect["leak_interactive_pool"][self[var_0].script_parentname] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._effect["leak_interactive_drain"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0].script_parentname] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0].script_parentname != "barrel_acid" )
            continue;

        level._effect["leak_interactive_leak"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_leak" );
        level._effect["leak_interactive_pool"][self[var_0].script_parentname] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._effect["leak_interactive_drain"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0].script_parentname] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0].script_parentname != "barrel_water" )
            continue;

        level._effect["leak_interactive_leak"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_leak" );
        level._effect["leak_interactive_pool"][self[var_0].script_parentname] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._effect["leak_interactive_drain"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0].script_parentname] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0].script_parentname != "barrel_sludge" )
            continue;

        level._effect["leak_interactive_leak"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_leak" );
        level._effect["leak_interactive_pool"][self[var_0].script_parentname] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._effect["leak_interactive_drain"][self[var_0].script_parentname] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0].script_parentname] = "h1_oil_spill_start";
        break;
    }
}
