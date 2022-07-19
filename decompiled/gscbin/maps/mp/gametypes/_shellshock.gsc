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

init()
{

}

_id_83BE( var_0, var_1 )
{
    if ( maps\mp\_flashgrenades::_id_5107() )
        return;

    if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
        return;

    if ( var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH" )
    {
        if ( var_1 > 10 )
        {
            if ( !maps\mp\_utility::_hasperk( "specialty_hard_shell" ) )
                self shellshock( "frag_grenade_mp", 0.5 );
        }
    }
}

_id_31B8()
{
    self waittill( "death" );
    waitframe;
    self notify( "end_explode" );
}

_id_43E9()
{
    thread _id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.5, 0.75, var_0, 800 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distancesquared( var_0, var_2.origin ) > 360000 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_2A70( var_0 )
{
    self notify( "dirtEffect" );
    self endon( "dirtEffect" );
    self endon( "disconnect" );

    if ( !maps\mp\_utility::_id_5189( self ) )
        return;

    var_1 = vectornormalize( anglestoforward( self.angles ) );
    var_2 = vectornormalize( anglestoright( self.angles ) );
    var_3 = vectornormalize( var_0 - self.origin );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 )
        common_scripts\utility::_id_A06B( var_6, 2.0 );
    else if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            common_scripts\utility::_id_A06B( var_6, 2.0 );
        else
            common_scripts\utility::_id_A06B( var_6, 2.0 );
    }
}

_id_14B8( var_0 )
{
    self notify( "bloodEffect" );
    self endon( "bloodEffect" );
    self endon( "disconnect" );

    if ( !maps\mp\_utility::_id_5189( self ) )
        return;

    var_1 = vectornormalize( anglestoforward( self.angles ) );
    var_2 = vectornormalize( anglestoright( self.angles ) );
    var_3 = vectornormalize( var_0 - self.origin );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 )
        common_scripts\utility::_id_A06B( var_6, 7.0 );
    else if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            common_scripts\utility::_id_A06B( var_6, 7.0 );
        else
            common_scripts\utility::_id_A06B( var_6, 7.0 );
    }
}

_id_14B9()
{
    self endon( "disconnect" );
    wait 0.5;

    if ( isalive( self ) )
        common_scripts\utility::_id_A0A0( "death", 1.5 );
}

_id_196B()
{
    thread _id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.75, var_0, 512 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distance( var_0, var_2.origin ) > 512 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_12E5()
{
    var_0 = self.origin;
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.5, var_0, 512 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distance( var_0, var_2.origin ) > 512 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_0D32()
{
    var_0 = self.origin;
    playrumbleonposition( "artillery_rumble", self.origin );
    earthquake( 0.7, 0.5, self.origin, 800 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distance( var_0, var_2.origin ) > 600 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_8E17( var_0 )
{
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.6, 0.6, var_0, 2000 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distance( var_0, var_2.origin ) > 1000 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_0999( var_0 )
{
    playrumbleonposition( "artillery_rumble", var_0 );
    earthquake( 0.7, 0.75, var_0, 1000 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( distance( var_0, var_2.origin ) > 900 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}
