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
#using_animtree("generic_human");

main()
{
    self _meth_8193( "face default" );
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "grenade_return_throw" );
    self _meth_8192( "zonly_physics" );
    var_0 = undefined;

    if ( level.h1_improved_grenade_returns )
        var_0 = getgrenadereturnanim_h1();
    else
        var_0 = getgrenadereturnanim();

    self setflaggedanimknoballrestart( "throwanim", var_0, %body, 1, 0.3 );
    var_1 = animhasnotetrack( var_0, "grenade_left" ) || animhasnotetrack( var_0, "grenade_right" );

    if ( var_1 )
    {
        animscripts\shared::_id_6869( self.weapon_switch_invalid, "left" );
        thread _id_7068();
        thread _id_622C( "throwanim", "grenade_left" );
        thread _id_622C( "throwanim", "grenade_right" );
        self waittill( "grenade_pickup" );
        self _meth_818d();
        animscripts\battlechatter_ai::_id_33B1( "grenade" );
        self waittillmatch( "throwanim", "grenade_throw" );
    }
    else
    {
        self waittillmatch( "throwanim", "grenade_throw" );
        self _meth_818d();
        animscripts\battlechatter_ai::_id_33B1( "grenade" );
    }

    if ( isdefined( self.grenade ) )
        self _meth_81d6();

    self waittillmatch( "throwanim", "finish" );

    if ( var_1 )
    {
        self notify( "put_weapon_back_in_right_hand" );
        animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
    }
}

getgrenadereturnanim()
{
    var_1 = 1000;

    if ( isdefined( self.enemy ) )
        var_1 = distance( self.origin, self.enemy.origin );

    var_2 = [];

    if ( var_1 < 600 && _id_514E() )
    {
        if ( var_1 < 300 )
        {
            if ( animscripts\utility::_id_9C3B() )
                var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_short_smg" );
            else
                var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_short" );
        }
        else if ( animscripts\utility::_id_9C3B() )
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_long_smg" );
        else
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_long" );
    }

    if ( var_2.size == 0 )
    {
        if ( animscripts\utility::_id_9C3B() )
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_default_smg" );
        else
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_default" );
    }

    return var_2[randomint( var_2.size )];
}

getgrenadereturnanim_h1()
{
    var_0 = [];
    var_1 = self.ground_slam_hit_player;

    if ( self.ground_slam )
        var_1 = self.grenadeweapon - self.grenade.origin;

    var_2 = length2d( var_1 );

    if ( var_2 > 0 )
        var_1 = ( var_1[0] / var_2, var_1[1] / var_2, 0 );

    var_3 = length2dsquared( self.visionsetnakedduration );
    var_4 = anglestoforward( self.angles );

    if ( var_3 > 1 )
    {
        if ( var_2 < 300 && _id_514E() )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_running_throw_short" );

        if ( var_0.size == 0 )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_running_throw_long" );
    }

    if ( self.a._id_6E5A == "crouch" )
    {
        if ( self.primaryattachment2 == "cover_left" )
        {
            if ( animscripts\corner::hasonekneeup() )
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrl_1knee_throw" );
            else
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrl_2knee_throw" );
        }
        else if ( self.primaryattachment2 == "cover_right" )
        {
            if ( animscripts\corner::hasonekneeup() )
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrr_1knee_throw" );
            else
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrr_2knee_throw" );
        }
        else if ( self.primaryattachment2 == "cover_crouch" )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_covercrouch_throw" );

        if ( var_0.size == 0 )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_crouching_throw" );
    }

    if ( var_0.size == 0 )
        var_0 = animscripts\utility::_id_5863( "grenade", "return_standing_throw" );

    var_5 = vectordot( var_1, var_4 );
    var_6 = var_1[0] * var_4[1] - var_4[0] * var_1[1];
    var_7 = atan2( var_6, var_5 );
    var_8 = int( exp( ( var_7 + 180 ) / 90 ) );
    var_8 %= var_0.size;
    return var_0[var_8];
}

_id_514E()
{
    var_0 = ( self.origin[0], self.origin[1], self.origin[2] + 20 );
    var_1 = var_0 + anglestoforward( self.angles ) * 50;
    return sighttracepassed( var_0, var_1, 0, undefined );
}

_id_7068()
{
    self endon( "death" );
    self endon( "put_weapon_back_in_right_hand" );
    self waittill( "killanimscript" );
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
}

_id_622C( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( "grenade_pickup" );
    self waittillmatch( var_0, var_1 );
    self notify( "grenade_pickup" );
}
