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

_id_4D89( var_0 )
{
    self _meth_8144( %body, 0.3 );
    self _meth_814d( %body, 1, 0 );

    if ( var_0 != "pain" && var_0 != "death" )
        self.a._id_8A1A = "none";

    self.a._id_097E = 1.0;
    self.a._id_0980 = 1.0;
    self.a._id_097F = 1.0;
    self.a._id_0982 = 0;
    self.a._id_0981 = 0;
    _id_9B2B();
}

_id_9AF5()
{
    if ( isdefined( self._id_28B4 ) && self._id_28B4 != self.a._id_6E5A )
    {
        if ( self.a._id_6E5A == "prone" )
            _id_344B( 0.5 );

        if ( self._id_28B4 == "prone" )
        {
            self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
            _id_3308( 0.5 );
            self _meth_8149( _id_5863( "default_prone", "straight_level" ), %body, 1, 0.1, 1 );
        }
    }

    self._id_28B4 = undefined;
}

_id_4DD7( var_0 )
{
    if ( isdefined( self._id_584E ) )
    {
        if ( var_0 != "pain" && var_0 != "death" )
            self kill( self.origin );

        if ( var_0 != "pain" )
        {
            self._id_584E = undefined;
            self notify( "kill_long_death" );
        }
    }

    if ( isdefined( self.a._id_5A5F ) && var_0 != "death" )
        self kill( self.origin );

    if ( isdefined( self.a._id_6E8D ) )
    {
        var_1 = self.a._id_6E8D;
        self.a._id_6E8D = undefined;
        [[ var_1 ]]( var_0 );
    }

    if ( var_0 != "combat" && var_0 != "pain" && var_0 != "death" && _id_9C3A() )
        animscripts\combat::_id_9080( _id_5863( "combat", "pistol_to_primary" ), 1 );

    if ( var_0 != "combat" && var_0 != "move" && var_0 != "pain" )
        self.a._id_58DE = undefined;

    if ( var_0 != "death" )
        self.a._id_612E = 0;

    if ( isdefined( self._id_511B ) && ( var_0 == "pain" || var_0 == "death" || var_0 == "flashed" ) )
        animscripts\combat_utility::_id_2F6F();

    self._id_511B = undefined;
    animscripts\squadmanager::_id_09A9( var_0 );
    self._id_22BA = undefined;
    self._id_8FE4 = 0;
    self._id_518C = 0;
    self._id_1C86 = 0;
    self.a._id_0979 = undefined;
    self.a._id_7B46 = gettime();
    self.a._id_0D83 = 0;

    if ( isdefined( self.node_relinquished ) && ( self.node_relinquished.unlockpoints == "Conceal Prone" || self.node_relinquished.unlockpoints == "Conceal Crouch" || self.node_relinquished.unlockpoints == "Conceal Stand" ) )
        self.a._id_0D83 = 1;

    _id_4D89( var_0 );
    _id_9AF5();
}

_id_409A()
{
    if ( isdefined( self._id_A154 ) && self._id_A154 )
    {
        if ( _id_51A3( self.primaryweapon ) )
            return self.primaryweapon;
        else if ( _id_51A3( self.secondaryweapon ) )
            return self.secondaryweapon;
    }

    return self.primaryweapon;
}

_id_1269( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_0 * 20; var_3++ )
    {
        for ( var_4 = 0; var_4 < 10; var_4++ )
        {
            var_5 = ( 0, randomint( 360 ), 0 );
            var_6 = anglestoforward( var_5 );
            var_7 = var_6 * var_2;
        }

        wait 0.05;
    }
}

_id_6FAF()
{
    self endon( "death" );
    self notify( "displaceprint" );
    self endon( "displaceprint" );

    for (;;)
        wait 0.05;
}

_id_5124( var_0 )
{
    if ( isdefined( self.enemy ) )
        return 1;

    return self.a._id_20AA > gettime();
}

_id_9B2B()
{
    if ( isdefined( self.enemy ) )
        self.a._id_20AA = gettime() + anim._id_20AE + randomint( anim._id_20AF );
}

_id_3F7D()
{
    if ( isdefined( self.enemy ) )
    {
        if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
            self.a._id_559A = animscripts\combat_utility::_id_3DB2( self.enemy );
        else
            self.a._id_559A = self.enemy getshootatpos();

        self.a._id_559E = gettime();
        return self.a._id_559A;
    }
    else if ( isdefined( self.a._id_559E ) && isdefined( self.a._id_559A ) && self.a._id_559E + 3000 < gettime() )
        return self.a._id_559A;
    else
    {
        var_0 = self getshootatpos();
        var_0 += ( 196 * self.lookup[0], 196 * self.lookup[1], 196 * self.lookup[2] );
        return var_0;
    }
}

_id_404B( var_0 )
{
    if ( !isdefined( self._id_4795 ) )
    {
        if ( _id_515B( var_0 ) )
            return var_0.angles[1] + 90;
        else if ( _id_515E( var_0 ) )
            return var_0.angles[1] - 90;
        else if ( var_0.unlockpoints == "Cover Multi" )
        {
            if ( isdefined( self.cover ) && isdefined( self.cover._id_8D56 ) )
            {
                if ( self.cover._id_8D56 == "right" )
                    return var_0.angles[1] - 90;
                else if ( self.cover._id_8D56 == "left" )
                    return var_0.angles[1] + 90;
            }
        }
    }

    return var_0.angles[1];
}

_id_4051( var_0 )
{
    if ( isdefined( self.node_relinquished ) )
        var_1 = self.node_relinquished.angles[1] - _id_4171( var_0 );
    else
        var_1 = self.angles[1] - _id_4171( var_0 );

    var_1 = angleclamp180( var_1 );
    return var_1;
}

_id_4050()
{
    var_0 = undefined;

    if ( isdefined( self.enemy ) )
        var_0 = self.enemy.origin;
    else
    {
        if ( isdefined( self.node_relinquished ) )
            var_1 = anglestoforward( self.node_relinquished.angles );
        else
            var_1 = anglestoforward( self.angles );

        var_1 *= 150;
        var_0 = self.origin + var_1;
    }

    if ( isdefined( self.node_relinquished ) )
        var_2 = self.node_relinquished.angles[1] - _id_4171( var_0 );
    else
        var_2 = self.angles[1] - _id_4171( var_0 );

    var_2 = angleclamp180( var_2 );
    return var_2;
}

_id_4177( var_0 )
{
    if ( _id_51B0() )
    {
        var_1 = anglestoforward( self.angles );
        var_2 = rotatepointaroundvector( var_1, var_0 - self.origin, self.angles[2] * -1 );
        var_0 = var_2 + self.origin;
    }

    var_3 = self.angles[1] - _id_4171( var_0 );
    var_3 = angleclamp180( var_3 );
    return var_3;
}

_id_4175()
{
    var_0 = undefined;

    if ( isdefined( self.enemy ) )
        var_0 = self.enemy.origin;
    else
    {
        var_1 = anglestoforward( self.angles );
        var_1 *= 150;
        var_0 = self.origin + var_1;
    }

    var_2 = self.angles[1] - _id_4171( var_0 );
    var_2 = angleclamp180( var_2 );
    return var_2;
}

_id_4171( var_0 )
{
    return vectortoyaw( var_0 - self.origin );
}

_id_4172( var_0 )
{
    var_1 = vectortoangles( ( var_0[0], var_0[1], 0 ) - ( self.origin[0], self.origin[1], 0 ) );
    return var_1[1];
}

_id_06C6()
{
    var_0 = self.angles[1] - _id_4171( self.enemy.origin );
    var_0 = angleclamp180( var_0 );

    if ( var_0 < 0 )
        var_0 = -1 * var_0;

    return var_0;
}

_id_06C7()
{
    var_0 = self.angles[1] - _id_4172( self.enemy.origin );
    var_0 = angleclamp180( var_0 );

    if ( var_0 < 0 )
        var_0 = -1 * var_0;

    return var_0;
}

_id_06C8( var_0 )
{
    var_1 = self.angles[1] - _id_4171( var_0 );
    var_1 = angleclamp180( var_1 );

    if ( var_1 < 0 )
        var_1 = -1 * var_1;

    return var_1;
}

_id_06C5( var_0 )
{
    var_1 = self.angles[1] - var_0;
    var_1 = angleclamp180( var_1 );

    if ( var_1 < 0 )
        var_1 = -1 * var_1;

    return var_1;
}

_id_4174( var_0, var_1 )
{
    var_2 = vectortoangles( var_0 - var_1 );
    return var_2[1];
}

_id_4178( var_0, var_1 )
{
    var_2 = self gettagangles( var_0 )[1] - _id_4174( var_1, self gettagorigin( var_0 ) );
    var_2 = angleclamp180( var_2 );
    return var_2;
}

_id_4176( var_0 )
{
    if ( isdefined( self.unlockpoints ) && ( self.unlockpoints == "Cover Up 3D" || self.unlockpoints == "Cover Left 3D" || self.unlockpoints == "Cover Right 3D" || self.unlockpoints == "Exposed 3D" ) )
    {
        var_1 = _id_413B( self );
        var_2 = anglestoforward( var_1 );
        var_3 = rotatepointaroundvector( var_2, var_0 - self.origin, var_1[2] * -1 );
        var_3 += self.origin;
        var_4 = var_1[1] - _id_4171( var_3 );
        var_4 = angleclamp180( var_4 );
        return var_4;
    }

    var_4 = self.angles[1] - _id_4171( var_0 );
    var_4 = angleclamp180( var_4 );
    return var_4;
}

_id_3F8F( var_0 )
{
    var_1 = self gettagangles( "TAG_EYE" )[1] - _id_4171( var_0 );
    var_1 = angleclamp180( var_1 );
    return var_1;
}

_id_51B8( var_0 )
{
    if ( isdefined( self._id_22BA ) )
        return self._id_22BA doesnodeallowstance( var_0 );

    return self _meth_81cf( var_0 );
}

_id_1D45( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.a._id_6E5A;

    switch ( var_0 )
    {
        case "stand":
            if ( _id_51B8( "stand" ) )
                var_1 = "stand";
            else if ( _id_51B8( "crouch" ) )
                var_1 = "crouch";
            else if ( _id_51B8( "prone" ) )
                var_1 = "prone";
            else
                var_1 = "stand";

            break;
        case "crouch":
            if ( _id_51B8( "crouch" ) )
                var_1 = "crouch";
            else if ( _id_51B8( "stand" ) )
                var_1 = "stand";
            else if ( _id_51B8( "prone" ) )
                var_1 = "prone";
            else
                var_1 = "crouch";

            break;
        case "prone":
            if ( _id_51B8( "prone" ) )
                var_1 = "prone";
            else if ( _id_51B8( "crouch" ) )
                var_1 = "crouch";
            else if ( _id_51B8( "stand" ) )
                var_1 = "stand";
            else
                var_1 = "prone";

            break;
        default:
            var_1 = "stand";
            break;
    }

    return var_1;
}

_id_3F2F()
{
    var_0 = self.node_relinquished;

    if ( isdefined( var_0 ) && ( self _meth_8163( var_0 ) || isdefined( self._id_22BA ) && var_0 == self._id_22BA ) )
        return var_0;

    return undefined;
}

_id_404F()
{
    var_0 = _id_3F2F();

    if ( isdefined( var_0 ) )
        return var_0.unlockpoints;

    return "none";
}

_id_4048()
{
    var_0 = _id_3F2F();

    if ( isdefined( var_0 ) )
        return var_0.angles[1];

    return self.desiredangle;
}

_id_4049()
{
    var_0 = _id_3F2F();

    if ( isdefined( var_0 ) )
        return anglestoforward( var_0.angles );

    return anglestoforward( self.angles );
}

_id_404E()
{
    var_0 = _id_3F2F();

    if ( isdefined( var_0 ) )
        return var_0.origin;

    return self.origin;
}

_id_77CB( var_0, var_1 )
{
    var_2 = int( var_0 ) % var_1;
    var_2 += var_1;
    return var_2 % var_1;
}

_id_06C4( var_0 )
{
    return abs( angleclamp180( var_0 ) );
}

_id_7082( var_0 )
{
    var_1 = cos( var_0 );
    var_2 = sin( var_0 );
    var_3["front"] = 0;
    var_3["right"] = 0;
    var_3["back"] = 0;
    var_3["left"] = 0;

    if ( isdefined( self._id_0B0D ) )
    {
        var_3["front"] = 1;
        return var_3;
    }

    if ( var_1 > 0 )
    {
        if ( var_2 > var_1 )
            var_3["left"] = 1;
        else if ( var_2 < -1 * var_1 )
            var_3["right"] = 1;
        else
            var_3["front"] = 1;
    }
    else
    {
        var_4 = -1 * var_1;

        if ( var_2 > var_4 )
            var_3["left"] = 1;
        else if ( var_2 < var_1 )
            var_3["right"] = 1;
        else
            var_3["back"] = 1;
    }

    return var_3;
}

_id_40A0( var_0 )
{
    var_0 = angleclamp( var_0 );

    if ( var_0 < 45 || var_0 > 315 )
        var_1 = "front";
    else if ( var_0 < 135 )
        var_1 = "left";
    else if ( var_0 < 225 )
        var_1 = "back";
    else
        var_1 = "right";

    return var_1;
}

_id_512C( var_0, var_1 )
{
    for ( var_2 = var_1.size - 1; var_2 >= 0; var_2-- )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_6A25( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self setflaggedanimknoballrestart( "playAnim", var_0, %animscript_root, 1, 0.1, 1 );
        var_1 = getanimlength( var_0 );
        var_1 = 3 * var_1 + 1;
        thread _id_6225( "time is up", "time is up", var_1 );
        self waittill( "time is up" );
        self notify( "enddrawstring" );
    }
}

_id_6225( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( var_1 );
    wait(var_2);
    self notify( var_0 );
}

_id_2DE5( var_0 )
{
    self endon( "killanimscript" );
    self endon( "enddrawstring" );

    for (;;)
        wait 0.05;
}

_id_2DE6( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3 * 20;

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_8518( var_0 )
{
    self notify( "got known enemy2" );
    self endon( "got known enemy2" );
    self endon( "death" );

    if ( !isdefined( self.enemy ) )
        return;

    if ( self.enemy.team == "allies" )
        var_1 = ( 0.4, 0.7, 1.0 );
    else
        var_1 = ( 1.0, 0.7, 0.4 );

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( self.leanamount ) )
            continue;
    }
}

_id_472C()
{
    if ( isdefined( self.node_relinquished ) )
        return _id_1AE2() || _id_1AF0();
    else
        return _id_1AE1() || _id_1AEF();
}

_id_3F7E()
{
    return self._id_4279;
}

_id_9C3E()
{
    if ( !_id_472C() )
        return;

    self._id_4BBA = _id_3F7E();
    self._id_4BB6 = self.origin;
}

_id_9C3D()
{
    if ( !_id_472C() )
        return 0;

    var_0 = self _meth_81bc();
    var_1 = self getshootatpos() - var_0;

    if ( isdefined( self._id_4BBA ) && isdefined( self._id_4BB6 ) )
    {
        if ( distance( self.origin, self._id_4BB6 ) < 25 )
            return 0;
    }

    self._id_4BBA = undefined;
    var_2 = self _meth_81c0( _id_3F7E(), var_1 );

    if ( !var_2 )
    {
        self._id_4BBA = _id_3F7E();
        return 0;
    }

    return 1;
}

_id_273A()
{
    wait 5;
    self notify( "timeout" );
}

_id_272F( var_0, var_1, var_2 )
{
    self endon( "death" );
    self notify( "stop debug " + var_0 );
    self endon( "stop debug " + var_0 );
    var_3 = spawnstruct();
    var_3 thread _id_273A();
    var_3 endon( "timeout" );

    if ( self.enemy.team == "allies" )
        var_4 = ( 0.4, 0.7, 1.0 );
    else
        var_4 = ( 1.0, 0.7, 0.4 );

    for (;;)
        wait 0.05;
}

_id_272E( var_0, var_1 )
{
    thread _id_272F( var_0, var_1, 2.15 );
}

_id_2730( var_0, var_1, var_2 )
{
    thread _id_272F( var_0, var_1, var_2 );
}

_id_271D( var_0, var_1 )
{
    var_2 = var_0 / var_1;
    var_3 = undefined;

    if ( var_0 == self._id_18B0 )
        var_3 = "all rounds";
    else if ( var_2 < 0.25 )
        var_3 = "small burst";
    else if ( var_2 < 0.5 )
        var_3 = "med burst";
    else
        var_3 = "long burst";

    thread _id_2730( self.origin + ( 0.0, 0.0, 42.0 ), var_3, 1.5 );
    thread _id_272E( self.origin + ( 0.0, 0.0, 60.0 ), "Suppressing" );
}

_id_6FB9()
{
    self endon( "death" );
    self notify( "stop shoot " + self._id_3584 );
    self endon( "stop shoot " + self._id_3584 );
    var_0 = 0.25;
    var_1 = var_0 * 20;

    for ( var_2 = 0; var_2 < var_1; var_2 += 1 )
        wait 0.05;
}

_id_6FB8()
{

}

_id_8504( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4 = var_3 * 20;

    for ( var_5 = 0; var_5 < var_4; var_5 += 1 )
        wait 0.05;
}

_id_8503( var_0, var_1, var_2, var_3 )
{
    thread _id_8504( var_0, var_1 + ( 0.0, 0.0, -5.0 ), var_2, var_3 );
}

_id_83F2( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    [[ anim._id_83F3 ]]( var_0 );
}

_id_83F4( var_0 )
{
    self.a._id_55D7 = gettime();
    maps\_gameskill::_id_7DAF();
    self notify( "shooting" );
    self _meth_81ea( 1, undefined, var_0 );
}

_id_83F5( var_0 )
{
    level notify( "an_enemy_shot", self );
    _id_83F4( var_0 );
}

_id_8412( var_0, var_1 )
{
    var_2 = bulletspread( self _meth_81bc(), var_0, 4 );
    self.a._id_55D7 = gettime();

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    self notify( "shooting" );
    self _meth_81ea( 1, var_2, var_1 );
}

_id_933D()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "temp" );
    var_0.origin = self gettagorigin( "tag_weapon_right" ) + ( 50.0, 50.0, 0.0 );
    var_0.angles = self gettagangles( "tag_weapon_right" );
    var_1 = anglestoright( var_0.angles );
    var_1 *= 15;
    var_2 = anglestoforward( var_0.angles );
    var_2 *= 15;
    var_0 movegravity( ( 0.0, 50.0, 150.0 ), 100 );
    var_3 = "weapon_" + self.weapon_switch_invalid;
    var_4 = spawn( var_3, var_0.origin );
    var_4.angles = self gettagangles( "tag_weapon_right" );
    var_4 linkto( var_0 );
    var_5 = var_0.origin;

    while ( isdefined( var_4 ) && isdefined( var_4.origin ) )
    {
        var_6 = var_5;
        var_7 = var_0.origin;
        var_8 = vectortoangles( var_7 - var_6 );
        var_2 = anglestoforward( var_8 );
        var_2 *= 4;
        var_9 = bullettrace( var_7, var_7 + var_2, 1, var_4 );

        if ( isalive( var_9["entity"] ) && var_9["entity"] == self )
        {
            wait 0.05;
            continue;
        }

        if ( var_9["fraction"] < 1.0 )
            break;

        var_5 = var_0.origin;
        wait 0.05;
    }

    if ( isdefined( var_4 ) && isdefined( var_4.origin ) )
        var_4 unlink();

    var_0 delete();
}

_id_67DC()
{
    var_0 = "TAG_EYE";
    self endon( "death" );
    self notify( "stop personal effect" );
    self endon( "stop personal effect" );

    while ( isdefined( self ) )
    {
        wait 0.05;

        if ( !isdefined( self ) )
            break;

        if ( isdefined( self.a._id_5F5B ) && self.a._id_5F5B == "stop" )
        {
            if ( isdefined( self._id_5126 ) && self._id_5126 == 1 )
                continue;

            playfxontag( level._effect["cold_breath"], self, var_0 );
            wait(2.5 + randomfloat( 3 ));
            continue;
        }

        wait 0.5;
    }
}

_id_67DE()
{
    self notify( "stop personal effect" );
}

_id_67DD()
{
    self endon( "death" );
    self notify( "stop personal effect" );
    self endon( "stop personal effect" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        var_0 thread _id_67DC();
    }
}

_id_51C3()
{
    if ( isdefined( self._id_39CD ) )
        return self._id_39CD;

    if ( self.suppressionwait <= self._id_8FEC )
        return 0;

    return self _meth_81d1();
}

_id_51B0()
{
    return isdefined( self.tactical ) && self.tactical == 1 && ( isdefined( self.spawnflags ) && self.spawnflags == 1 );
}

_id_413B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_0._id_793A ) )
        return var_0.angles;

    var_1 = var_0.angles;
    var_2 = angleclamp180( var_1[0] + var_0._id_793A[0] );
    var_3 = var_1[1];
    var_4 = angleclamp180( var_1[2] + var_0._id_793A[2] );
    return ( var_2, var_3, var_4 );
}

_id_516E()
{
    if ( self.suppressionwait <= self._id_8FEC * 0.25 )
        return 0;

    return self _meth_81d1();
}

_id_404D( var_0, var_1 )
{
    if ( isdefined( var_0._id_6379 ) )
        return var_0._id_6379;

    var_2 = ( -26.0, 0.4, 36.0 );
    var_3 = ( -32.0, 7.0, 63.0 );
    var_4 = ( 43.5, 11.0, 36.0 );
    var_5 = ( 36.0, 8.3, 63.0 );
    var_6 = ( 3.5, -12.5, 45.0 );
    var_7 = ( -3.7, -22.0, 63.0 );
    var_8 = 0;
    var_9 = ( 0.0, 0.0, 0.0 );
    var_10 = anglestoright( var_0.angles );
    var_11 = anglestoforward( var_0.angles );

    if ( !isdefined( var_1 ) )
    {
        var_1 = var_0.unlockpoints;

        if ( var_1 == "Cover Multi" )
            var_1 = _id_3F3F( var_0 );
    }

    switch ( var_1 )
    {
        case "Cover Left 3D":
        case "Cover Left":
            if ( var_0 gethighestnodestance() == "crouch" )
                var_9 = _id_19E3( var_10, var_11, var_2 );
            else
                var_9 = _id_19E3( var_10, var_11, var_3 );

            break;
        case "Cover Right 3D":
        case "Cover Right":
            if ( var_0 gethighestnodestance() == "crouch" )
                var_9 = _id_19E3( var_10, var_11, var_4 );
            else
                var_9 = _id_19E3( var_10, var_11, var_5 );

            break;
        case "Conceal Stand":
        case "Cover Stand":
        case "Turret":
            var_9 = _id_19E3( var_10, var_11, var_7 );
            break;
        case "Conceal Crouch":
        case "Cover Crouch":
        case "Cover Crouch Window":
            var_9 = _id_19E3( var_10, var_11, var_6 );
            break;
    }

    var_0._id_6379 = var_9;
    return var_0._id_6379;
}

_id_19E3( var_0, var_1, var_2 )
{
    return var_0 * var_2[0] + var_1 * var_2[1] + ( 0, 0, var_2[2] );
}

_id_7262()
{
    return isdefined( self.enemy ) && self _meth_81c3( self.enemy, 5 );
}

_id_1AE1( var_0 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
    {
        if ( isdefined( self._id_32A0 ) && self._id_32A0 == self.enemy )
            return 1;
        else
            return self _meth_81c2( self.enemy );
    }

    if ( isdefined( var_0 ) && self _meth_81c2( self.enemy, var_0 ) || self _meth_81c2( self.enemy ) )
    {
        if ( !_id_1D15( self geteye(), self.enemy getshootatpos() ) )
            return 0;

        self._id_4279 = _id_3F7D();
        _id_2D37();
        return 1;
    }

    return 0;
}

_id_1AE2()
{
    if ( !isdefined( self.enemy ) )
    {
        self._id_4279 = undefined;
        return 0;
    }

    var_0 = _id_3F7D();

    if ( !isdefined( self.node_relinquished ) )
        var_1 = self _meth_81c2( self.enemy );
    else
        var_1 = _id_1AE5( var_0, self.node_relinquished );

    if ( var_1 )
    {
        self._id_4279 = var_0;
        _id_2D37();
    }
    else
    {

    }

    return var_1;
}

_id_1AE5( var_0, var_1 )
{
    if ( _id_515B( var_1 ) || _id_515E( var_1 ) || _id_515C( var_1 ) )
    {
        if ( !animscripts\corner::_id_1AE4( var_0, var_1 ) )
            return 0;
    }

    var_2 = _id_404D( var_1 );
    var_3 = var_1.origin + var_2;

    if ( !_id_1D15( var_3, var_0, var_1 ) )
        return 0;

    if ( !sighttracepassed( var_3, var_0, 0, undefined ) )
    {
        if ( var_1.unlockpoints == "Cover Crouch" || var_1.unlockpoints == "Conceal Crouch" )
        {
            var_3 = ( 0.0, 0.0, 64.0 ) + var_1.origin;
            return sighttracepassed( var_3, var_0, 0, undefined );
        }

        if ( _id_51B0() && var_1.unlockpoints == "Cover Up 3D" )
        {
            var_4 = anglestoup( self.angles );
            var_3 = var_1.origin + ( var_4[0] * 32, var_4[1] * 32, var_4[2] * 32 );
            return sighttracepassed( var_3, var_0, 0, undefined );
        }

        return 0;
    }

    return 1;
}

_id_515C( var_0 )
{
    if ( var_0.unlockpoints != "Cover Multi" )
        return 0;

    if ( !isdefined( self.cover ) )
        return 0;

    if ( isdefined( self.cover._id_8D56 ) )
        return self.cover._id_8D56 == "right" || self.cover._id_8D56 == "left";

    if ( isdefined( self.cover._id_0D25 ) )
        return self.cover._id_0D25 == "right" || self.cover._id_0D25 == "left";

    return 0;
}

_id_3F3F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0 animscripts\cover_multi::_id_22B2();

    switch ( var_1 )
    {
        case "right":
            return "Cover Right";
        case "left":
            return "Cover Left";
        case "stand":
            return "Cover Stand";
        case "crouch":
            return "Cover Crouch";
        default:
    }
}

_id_1D15( var_0, var_1, var_2 )
{
    var_3 = self.downaimlimit - anim._id_097B;
    var_4 = self.useable + anim._id_097B;
    var_5 = angleclamp180( vectortoangles( var_1 - var_0 )[0] );

    if ( var_5 > var_4 )
        return 0;

    if ( var_5 < var_3 )
    {
        if ( isdefined( var_2 ) && var_2.unlockpoints != "Cover Crouch" && var_2.unlockpoints != "Conceal Crouch" )
            return 0;

        if ( var_5 < anim._id_22A1 + var_3 )
            return 0;
    }

    return 1;
}

_id_2D37()
{
    self.a._id_84A6 = 1;
}

_id_9B23()
{
    if ( !isdefined( self.a._id_84A6 ) )
        self.a._id_84A6 = 1;

    if ( self.a._id_84A6 )
    {
        self.a._id_420E = gettime() + randomintrange( 15000, 30000 );
        self.a._id_84A6 = 0;
    }
}

_id_851A( var_0, var_1, var_2 )
{
    for (;;)
    {
        wait 0.05;
        wait 0.05;
    }
}

_id_09A5()
{
    if ( !self _meth_81a0() )
        return 0;

    var_0 = undefined;

    if ( isdefined( self.enemy.node_relinquished ) )
    {
        var_1 = _id_404D( self.enemy.node_relinquished );
        var_0 = self.enemy.node_relinquished.origin + var_1;
    }
    else if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_0 = animscripts\combat_utility::_id_3DB2( self.enemy );
    else
        var_0 = self.enemy getshootatpos();

    if ( !self _meth_81c0( var_0 ) )
        return 0;

    if ( self.script_context == "combat" )
    {
        if ( !sighttracepassed( self geteye(), self _meth_81bc(), 0, undefined ) )
            return 0;
    }

    self._id_4279 = var_0;
    return 1;
}

_id_1AF0()
{
    if ( !_id_4748() )
    {
        self._id_4279 = undefined;
        return 0;
    }

    if ( !isplayer( self.enemy ) )
        return _id_09A5();

    if ( isdefined( self.node_relinquished ) )
    {
        if ( _id_515B( self.node_relinquished ) || _id_515E( self.node_relinquished ) )
        {
            if ( !animscripts\corner::_id_1AE4( _id_3F7D(), self.node_relinquished ) )
                return 0;
        }

        var_0 = _id_404D( self.node_relinquished );
        var_1 = self.node_relinquished.origin + var_0;
    }
    else
        var_1 = self _meth_81bc();

    if ( !_id_1D15( var_1, self.leanamount ) )
        return 0;

    return _id_3780( var_1 );
}

_id_1AEF()
{
    if ( !_id_4748() )
    {
        self._id_4279 = undefined;
        return 0;
    }

    if ( !isplayer( self.enemy ) )
        return _id_09A5();

    var_0 = self _meth_81bc();

    if ( !_id_1D15( var_0, self.leanamount ) )
        return 0;

    return _id_3780( var_0 );
}

_id_4748()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( !isdefined( self.leanamount ) )
        return 0;

    _id_9B23();

    if ( gettime() > self.a._id_420E )
        return 0;

    if ( !_id_607E() )
        return isdefined( self._id_4279 );

    return 1;
}

_id_1AE0( var_0 )
{
    if ( !sighttracepassed( self getshootatpos(), var_0, 0, undefined ) )
        return 0;

    if ( self.a._id_A2E2["right"] == "none" )
        return 0;

    var_1 = self _meth_81bc();
    return sighttracepassed( var_1, var_0, 0, undefined );
}

_id_607E()
{
    if ( isdefined( self._id_4279 ) && !_id_1AE0( self._id_4279 ) )
        return 1;

    return !isdefined( self._id_559B ) || self._id_559B != self.leanamount || distancesquared( self._id_559C, self.origin ) > 1024;
}

_id_3780( var_0 )
{
    if ( !_id_607E() )
        return isdefined( self._id_4279 );

    if ( isdefined( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) > squared( self.enemy.meleeattackdist ) )
    {
        self._id_4279 = undefined;
        return 0;
    }

    if ( !sighttracepassed( self getshootatpos(), var_0, 0, undefined ) )
    {
        self._id_4279 = undefined;
        return 0;
    }

    self._id_559C = self.origin;
    self._id_559B = self.leanamount;
    var_1 = _id_3F7D();
    var_2 = bullettrace( self.leanamount, var_1, 0, undefined );
    var_3 = var_2["position"];
    var_4 = self.leanamount - var_3;
    var_5 = vectornormalize( self.leanamount - var_0 );
    var_4 -= var_5 * vectordot( var_4, var_5 );
    var_6 = 20.0;
    var_7 = int( length( var_4 ) / var_6 + 0.5 );

    if ( var_7 < 1 )
        var_7 = 1;

    if ( var_7 > 20 )
        var_7 = 20;

    var_8 = self.leanamount - var_3;
    var_8 = ( var_8[0] / var_7, var_8[1] / var_7, var_8[2] / var_7 );
    var_7++;
    var_9 = var_3;
    self._id_4279 = undefined;
    var_10 = 0;
    var_11 = 2;

    for ( var_12 = 0; var_12 < var_7 + var_11; var_12++ )
    {
        var_13 = sighttracepassed( var_0, var_9, 0, undefined );
        var_14 = var_9;

        if ( var_12 == var_7 - 1 )
            var_8 -= var_5 * vectordot( var_8, var_5 );

        var_9 += var_8;

        if ( var_13 )
        {
            var_10++;
            self._id_4279 = var_14;

            if ( var_12 > 0 && var_10 < var_11 && var_12 < var_7 + var_11 - 1 )
                continue;

            return 1;
        }
        else
            var_10 = 0;
    }

    return isdefined( self._id_4279 );
}

_id_0BAA( var_0, var_1 )
{
    var_2 = var_0.size;
    var_3 = randomint( var_2 );

    if ( var_2 == 1 )
        return var_0[0];

    var_4 = 0;
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_2; var_6++ )
        var_5 += var_1[var_6];

    var_7 = randomfloat( var_5 );
    var_8 = 0;

    for ( var_6 = 0; var_6 < var_2; var_6++ )
    {
        var_8 += var_1[var_6];

        if ( var_7 >= var_8 )
            continue;

        var_3 = var_6;
        break;
    }

    return var_0[var_3];
}

_id_6FA7( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_0 / 0.05;

    for ( var_7 = 0; var_7 < var_6; var_7++ )
        wait 0.05;
}

_id_6FA5( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 100.0;
    var_6 = 0;
    var_0 += common_scripts\utility::_id_712D( 30 );

    for ( var_7 = 0; var_7 < var_5; var_7++ )
    {
        var_6 += 0.5;
        wait 0.05;
    }
}

_id_247B( var_0, var_1 )
{
    return var_0[0] * var_1[1] - var_0[1] * var_1[0] > 0;
}

_id_3FB0()
{
    return getweaponmodel( self.groundentchanged );
}

_id_7822( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 500;

    return gettime() - self._id_67E4 < var_0;
}

_id_1AF3()
{
    if ( !self.grenadeammo )
        return 0;

    if ( self._id_79EA )
        return 1;

    return isplayer( self.enemy );
}

_id_9C2D()
{
    return weaponisboltaction( self.weapon_switch_invalid );
}

_id_711B( var_0 )
{
    var_1 = randomint( var_0.size );

    if ( var_0.size > 1 )
    {
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
            var_2 += var_0[var_3];

        var_4 = randomfloat( var_2 );
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            var_2 += var_0[var_3];

            if ( var_4 < var_2 )
            {
                var_1 = var_3;
                break;
            }
        }
    }

    return var_1;
}

_id_7F74( var_0, var_1 )
{
    if ( !isdefined( anim._id_6549 ) )
        anim._id_6549 = [];

    anim._id_6549[var_0] = 1;
    level._effect["step_" + var_0] = var_1;
}

_id_7F75( var_0, var_1 )
{
    if ( !isdefined( anim._id_654B ) )
        anim._id_654B = [];

    anim._id_654B[var_0] = 1;
    level._effect["step_small_" + var_0] = var_1;
}

_id_9A71( var_0 )
{
    if ( isdefined( anim._id_6549 ) )
        anim._id_6549[var_0] = undefined;

    level._effect["step_" + var_0] = undefined;
}

_id_9A72( var_0 )
{
    if ( isdefined( anim._id_654B ) )
        anim._id_654B[var_0] = undefined;

    level._effect["step_small_" + var_0] = undefined;
}

_id_7FBF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "all";

    if ( !isdefined( level._id_0601 ) )
        level._id_0601 = [];

    level._id_0601[var_0][var_2] = spawnstruct();
    level._id_0601[var_0][var_2].tag_aim_animated = var_1;
    level._id_0601[var_0][var_2].fx = var_3;
    anim._id_61E5[var_0] = animscripts\notetracks::_id_2566;
    _id_7FC0( var_0, var_2, var_4, var_5 );
}

_id_7FC0( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "all";

    if ( !isdefined( level._id_0601 ) )
        level._id_0601 = [];

    if ( isdefined( level._id_0601[var_0][var_1] ) )
        var_4 = level._id_0601[var_0][var_1];
    else
    {
        var_4 = spawnstruct();
        level._id_0601[var_0][var_1] = var_4;
    }

    anim._id_61E5[var_0] = animscripts\notetracks::_id_2566;

    if ( isdefined( var_2 ) )
        var_4._id_88A4 = var_2;

    if ( isdefined( var_3 ) )
        var_4._id_88A6 = var_3;
}

_id_67DB( var_0, var_1 )
{
    self endon( "death" );
    level notify( "newdebugline" );
    level endon( "newdebugline" );

    for (;;)
        wait 0.05;
}

_id_3308( var_0 )
{
    thread _id_3309( var_0 );
}

_id_3309( var_0 )
{
    self _meth_856f();
    self endon( "death" );
    self notify( "anim_prone_change" );
    self endon( "anim_prone_change" );
    self _meth_81fb( var_0, isdefined( self.a._id_6451 ) );
    self waittill( "killanimscript" );

    if ( self.a._id_6E5A != "prone" && !isdefined( self.a._id_6451 ) )
        self.a._id_6E5A = "prone";
}

_id_344B( var_0 )
{
    thread _id_344C( var_0 );
}

_id_344C( var_0 )
{
    self _meth_856e();
    self endon( "death" );
    self notify( "anim_prone_change" );
    self endon( "anim_prone_change" );
    self _meth_81fc( var_0 );
    self waittill( "killanimscript" );

    if ( self.a._id_6E5A == "prone" )
        self.a._id_6E5A = "crouch";
}

_id_1AAF()
{
    if ( self.a._id_0D83 )
        return 0;

    if ( !animscripts\weaponlist::_id_9C2C() )
        return 0;

    if ( weaponclass( self.weapon_switch_invalid ) == "mg" )
        return 0;

    if ( isdefined( self._id_2A7E ) && self._id_2A7E == 1 )
        return 0;

    return 1;
}

_id_1AC9()
{
    if ( !_id_472C() )
        return 0;

    var_0 = self _meth_81bc();
    return sighttracepassed( var_0, _id_3F7E(), 0, undefined );
}

_id_402D( var_0 )
{
    return self.a._id_5F43[var_0];
}

gettwitchanim( var_0 )
{
    if ( isdefined( self.a.lastloopcountfortwitch ) && self.a.lastloopcountfortwitch == self.a._id_76D4 )
        return self.a.lasttwitchanims;

    var_1 = randomint( var_0.size );
    self.a.lasttwitchanims = var_0[var_1];
    self.a.lastloopcountfortwitch = self.a._id_76D4;
    return var_0[var_1];
}

_id_711E( var_0, var_1 )
{
    if ( randomint( 2 ) )
        return var_0;
    else
        return var_1;
}

_id_0C4E( var_0 )
{
    return self.a._id_0CD8[var_0];
}

_id_0C4F( var_0 )
{
    return isdefined( self.a._id_0CD8[var_0] ) && self.a._id_0CD8[var_0].size > 0;
}

_id_0C51( var_0 )
{
    var_1 = randomint( self.a._id_0CD8[var_0].size );
    return self.a._id_0CD8[var_0][var_1];
}

_id_0CD8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = [];

    if ( isdefined( var_0 ) )
        var_14[0] = var_0;
    else
        return var_14;

    if ( isdefined( var_1 ) )
        var_14[1] = var_1;
    else
        return var_14;

    if ( isdefined( var_2 ) )
        var_14[2] = var_2;
    else
        return var_14;

    if ( isdefined( var_3 ) )
        var_14[3] = var_3;
    else
        return var_14;

    if ( isdefined( var_4 ) )
        var_14[4] = var_4;
    else
        return var_14;

    if ( isdefined( var_5 ) )
        var_14[5] = var_5;
    else
        return var_14;

    if ( isdefined( var_6 ) )
        var_14[6] = var_6;
    else
        return var_14;

    if ( isdefined( var_7 ) )
        var_14[7] = var_7;
    else
        return var_14;

    if ( isdefined( var_8 ) )
        var_14[8] = var_8;
    else
        return var_14;

    if ( isdefined( var_9 ) )
        var_14[9] = var_9;
    else
        return var_14;

    if ( isdefined( var_10 ) )
        var_14[10] = var_10;
    else
        return var_14;

    if ( isdefined( var_11 ) )
        var_14[11] = var_11;
    else
        return var_14;

    if ( isdefined( var_12 ) )
        var_14[12] = var_12;
    else
        return var_14;

    if ( isdefined( var_13 ) )
        var_14[13] = var_13;

    return var_14;
}

_id_3EE5()
{
    return self.primaryweapon;
}

_id_3EE7()
{
    return self.secondaryweapon;
}

_id_3EE8()
{
    return self._id_855D;
}

_id_3EE0()
{
    return self.weapon_switch_invalid;
}

_id_9C33()
{
    return self.weapon_switch_invalid == self.primaryweapon && self.weapon_switch_invalid != "none";
}

_id_9C37()
{
    return self.weapon_switch_invalid == self.secondaryweapon && self.weapon_switch_invalid != "none";
}

_id_9C3A()
{
    return self.weapon_switch_invalid == self._id_855D && self.weapon_switch_invalid != "none";
}

_id_3EE1()
{
    if ( self.weapon_switch_invalid == self.primaryweapon )
        return "primary";
    else if ( self.weapon_switch_invalid == self.secondaryweapon )
        return "secondary";
    else if ( self.weapon_switch_invalid == self._id_855D )
        return "sidearm";
    else
    {

    }
}

_id_095B( var_0 )
{
    if ( isdefined( self.weeklychallengeid[var_0] ) )
        return 1;

    return 0;
}

_id_3EFC( var_0 )
{
    var_1 = getmovedelta( var_0, 0, 1 );
    return self localtoworldcoords( var_1 );
}

_id_25A6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( self.damagelocation == var_0 )
        return 1;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( self.damagelocation == var_1 )
        return 1;

    if ( !isdefined( var_2 ) )
        return 0;

    if ( self.damagelocation == var_2 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 0;

    if ( self.damagelocation == var_3 )
        return 1;

    if ( !isdefined( var_4 ) )
        return 0;

    if ( self.damagelocation == var_4 )
        return 1;

    if ( !isdefined( var_5 ) )
        return 0;

    if ( self.damagelocation == var_5 )
        return 1;

    if ( !isdefined( var_6 ) )
        return 0;

    if ( self.damagelocation == var_6 )
        return 1;

    if ( !isdefined( var_7 ) )
        return 0;

    if ( self.damagelocation == var_7 )
        return 1;

    if ( !isdefined( var_8 ) )
        return 0;

    if ( self.damagelocation == var_8 )
        return 1;

    if ( !isdefined( var_9 ) )
        return 0;

    if ( self.damagelocation == var_9 )
        return 1;

    if ( !isdefined( var_10 ) )
        return 0;

    if ( self.damagelocation == var_10 )
        return 1;

    return 0;
}

_id_9C31()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    return weaponclass( self.weapon_switch_invalid ) == "pistol";
}

_id_9C36()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    return weaponclass( self.weapon_switch_invalid ) == "rocketlauncher";
}

_id_9C2E()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    return weaponclass( self.weapon_switch_invalid ) == "mg";
}

_id_9C39()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    return weaponclass( self.weapon_switch_invalid ) == "spread";
}

_id_9C3B()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    return weaponclass( self.weapon_switch_invalid ) == "smg";
}

_id_9C35()
{
    if ( !isdefined( self.weapon_switch_invalid ) )
        return 0;

    var_0 = weaponclass( self.weapon_switch_invalid );

    switch ( var_0 )
    {
        case "mg":
        case "spread":
        case "smg":
        case "sniper":
        case "rifle":
            return 1;
    }

    return 0;
}

_id_8495( var_0 )
{
    return isdefined( self.secondaryweapon ) && self.secondaryweapon != "none" && ( var_0 < squared( 512 ) || self.a._id_7594 < 1 );
}

_id_70DE( var_0 )
{
    self endon( "killanimscript" );
    var_1 = self.origin;
    var_2 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        wait 0.05;
        var_3 = distance( self.origin, var_1 );
        var_1 = self.origin;

        if ( self.helmet == 1 )
        {
            self.a._id_612E = 1;
            self startragdoll();
            self _meth_8144( var_0, 0.1 );
            wait 0.05;
            physicsexplosionsphere( var_1, 600, 0, var_3 * 0.1 );
            self notify( "killanimscript" );
            return;
        }
    }
}

_id_502C()
{
    return isdefined( self._id_3A16 );
}

_id_848B()
{
    return isdefined( self._id_22E0 ) && !isdefined( self.grenade );
}

_id_50E9()
{
    return isdefined( self._id_22E0 );
}

is_in_casual_standing_stance()
{
    var_0 = [ %casual_stand_idle, %casual_stand_idle_trans_in, %casual_stand_idle_trans_out, %casual_stand_idle_twitch, %casual_stand_idle_twitchb, %casual_stand_v2_idle, %casual_stand_v2_twitch_radio, %casual_stand_v2_twitch_shift, %casual_stand_v2_twitch_talk, %smg_casual_stand_idle_trans_in, %smg_casual_stand_idle_trans_out ];

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_8152( var_2 ) != 0.0 )
            return 1;
    }

    return 0;
}

_id_803E( var_0 )
{
    if ( var_0 )
    {
        self._id_2563["run"] = _id_5864( "unstable_run" );
        self._id_2563["walk"] = _id_5864( "unstable_walk" );
        self._id_51DE = 1;
    }
    else
    {
        self._id_2563["run"] = undefined;
        self._id_2563["walk"] = undefined;
        self._id_51DE = 0;
    }
}

_id_51DE()
{
    return isdefined( self._id_51DE );
}

_id_7F20( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 )
    {
        self._id_2563["run"] = _id_5864( "pistol_move" );
        self._id_2563["walk"] = _id_5864( "pistol_move" );
        self._id_0B0F = 1;
        self _meth_81ce( "stand" );
        self._id_6109 = 1;
        self._id_2D3B = 1;
        self._id_2AF7 = 1;
    }
    else
    {
        self._id_2563["run"] = undefined;
        self._id_2563["walk"] = undefined;
        self._id_0B0F = undefined;
        self _meth_81ce( "stand", "crouch", "prone" );
        self._id_6109 = undefined;
        self._id_2D3B = undefined;
        self._id_2AF7 = undefined;
    }
}

_id_50EA()
{
    return !self.facemotion || isdefined( self._id_22E0 );
}

_id_7129()
{
    self.a._id_4B81 = randomint( 2 );
}

_id_51A3( var_0 )
{
    return weaponclass( var_0 ) == "spread";
}

_id_51AC( var_0 )
{
    return weaponclass( var_0 ) == "sniper";
}

_id_A2CF()
{
    return self.weapon_switch_invalid != "none" && weaponisboltaction( self.weapon_switch_invalid ) && weaponclass( self.weapon_switch_invalid ) == "spread";
}

_id_40A6( var_0, var_1 )
{
    var_2 = var_0 % anim._id_7125;
    return anim._id_7124[var_2] % var_1;
}

_id_3F47()
{
    if ( _id_9C37() )
        return "secondary";

    if ( _id_9C3A() )
        return "sidearm";

    return "primary";
}

_id_515B( var_0 )
{
    return var_0.unlockpoints == "Cover Left" || var_0.unlockpoints == "Cover Left 3D";
}

_id_515E( var_0 )
{
    return var_0.unlockpoints == "Cover Right" || var_0.unlockpoints == "Cover Right 3D";
}

_id_515A( var_0 )
{
    return var_0.unlockpoints == "Cover Left 3D" || var_0.unlockpoints == "Cover Right 3D" || var_0.unlockpoints == "Cover Up 3D";
}

_id_5863( var_0, var_1 )
{
    if ( isdefined( anim._id_39B2 ) || isdefined( anim._id_39B3 ) )
        maps\_utility::_id_30ED( 1 );

    if ( isdefined( self._id_0C4D ) )
    {
        if ( isdefined( anim._id_0CCA[self._id_0C4D][var_0] ) && isdefined( anim._id_0CCA[self._id_0C4D][var_0][var_1] ) )
            return anim._id_0CCA[self._id_0C4D][var_0][var_1];
    }

    return anim._id_0CCA["soldier"][var_0][var_1];
}

_id_5864( var_0 )
{
    if ( isdefined( anim._id_39B2 ) || isdefined( anim._id_39B3 ) )
        maps\_utility::_id_30ED( 1 );

    if ( isdefined( self._id_0C4D ) )
    {
        if ( isdefined( anim._id_0CCA[self._id_0C4D][var_0] ) )
        {
            if ( isdefined( anim._id_0CCA["soldier"][var_0] ) )
            {
                var_1 = anim._id_0CCA["soldier"][var_0];

                foreach ( var_4, var_3 in anim._id_0CCA[self._id_0C4D][var_0] )
                    var_1[var_4] = var_3;

                return var_1;
            }

            return anim._id_0CCA[self._id_0C4D][var_0];
        }
    }

    return anim._id_0CCA["soldier"][var_0];
}

_id_5868( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_0C4D ) )
    {
        if ( isdefined( anim._id_0CCA[self._id_0C4D][var_0] ) && isdefined( anim._id_0CCA[self._id_0C4D][var_0][var_1] ) && isdefined( anim._id_0CCA[self._id_0C4D][var_0][var_1][var_2] ) )
            return anim._id_0CCA[self._id_0C4D][var_0][var_1][var_2];

        if ( isdefined( anim._id_0CCA[self._id_0C4D][var_0] ) && isdefined( anim._id_0CCA[self._id_0C4D][var_0][var_1] ) )
            return anim._id_0CCA[self._id_0C4D][var_0][var_1];
    }

    return anim._id_0CCA["soldier"][var_0][var_1][var_2];
}

_id_5867( var_0, var_1 )
{
    if ( isdefined( self._id_0C4D ) )
    {
        if ( isdefined( anim._id_0CCA[self._id_0C4D][var_0] ) && isdefined( anim._id_0CCA[self._id_0C4D][var_0][var_1] ) )
            return anim._id_0CCA[self._id_0C4D][var_0][var_1];
    }

    return anim._id_0CCA["dog"][var_0][var_1];
}

_id_50F4()
{
    if ( isdefined( self.a._id_665F ) && isdefined( self.a._id_6651 ) )
    {
        var_0 = self.a._id_665F + self.a._id_6651 * 1000;
        var_1 = gettime() < var_0;

        if ( !var_1 )
            self.a._id_6651 = 0;

        return var_1;
    }

    return 0;
}

_id_3EA0( var_0, var_1, var_2, var_3 )
{
    return var_0 + var_1 * var_3 + 0.5 * var_2 * squared( var_3 );
}

_id_3E9E( var_0, var_1, var_2, var_3 )
{
    if ( var_3 == 0 )
    {
        if ( var_2 == 0 )
            return 999999;

        return ( var_1 - var_0 ) / var_2;
    }

    var_4 = 0.5 * var_3;
    var_5 = var_2;
    var_6 = var_0 - var_1;
    var_7 = squared( var_5 ) - 4 * var_4 * var_6;

    if ( var_7 < 0 )
        return 999999;

    var_8 = ( -1 * var_5 - sqrt( var_7 ) ) / 2 * var_4;

    if ( var_8 >= 0 )
        return var_8;

    var_8 = ( -1 * var_5 + sqrt( var_7 ) ) / 2 * var_4;
    return var_8;
}

_id_3E9F( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3E9E( var_0, var_1, var_2, var_3 );
    var_5 = var_2 + var_3 * var_4;
    return var_5;
}

_id_3968( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || var_1 == "" )
        return;

    if ( !isdefined( var_0._id_54CB ) )
        var_0._id_54CB = 1;
    else
        return;

    if ( var_0 _meth_843e( "tag_flash" ) == -1 )
    {
        var_0._id_54CB = undefined;
        return;
    }

    var_2 = spawn( "script_model", var_0 gettagorigin( "tag_flash" ) );

    if ( !isdefined( var_2 ) )
    {
        var_0._id_54CB = undefined;
        return;
    }

    var_2 setmodel( "tag_laser" );
    var_2 laseron( var_1 );
    var_3 = cos( 10 );
    var_4 = 0.5;

    for (;;)
    {
        if ( !isdefined( var_0 ) || !isalive( var_0 ) )
            break;

        if ( isdefined( var_0.enemy ) )
        {
            var_2.origin = var_0 gettagorigin( "tag_flash" );
            var_5 = var_0 gettagangles( "tag_flash" );
            var_6 = vectornormalize( var_0.enemy getshootatpos() - var_2.origin );
            var_7 = anglestoforward( var_5 );
            var_8 = vectornormalize( var_6 );
            var_9 = vectortoangles( var_8 );
            var_10 = vectordot( var_7, var_8 );

            if ( var_10 > var_3 )
            {
                var_2 laseron( var_1 );
                var_11 = vectortoangles( var_6 ) + ( randomfloatrange( -1 * var_4, var_4 ), randomfloatrange( -1 * var_4, var_4 ), randomfloatrange( -1 * var_4, var_4 ) );
                var_2.angles = vectorlerp( var_2.angles, var_11, 0.15 );
            }
            else
                var_2 laseroff();
        }

        waittillframeend;
    }

    var_2 laseroff();
    var_2 delete();

    if ( isdefined( var_0 ) )
        var_0._id_54CB = undefined;
}

getreacttobulletchance()
{
    if ( isdefined( self.a._id_71D0 ) )
        return self.a._id_71D0;

    return getdvarfloat( "ai_reactToBulletChance" );
}

checkforturnwithanim( var_0 )
{
    var_1 = getanimlength( var_0 );
    var_2 = self _meth_8151( var_0 );
    var_3 = var_2 + 0.05 * self._id_5F97 / var_1;

    if ( var_3 > 1 )
        var_3 = 1;

    var_4 = getmovedelta( var_0, var_2, var_3 );
    var_5 = length( var_4 );
    return self _meth_8571( var_5 );
}

set_run_twitch_animation( var_0 )
{
    self._id_6165 = !var_0;
}

set_team_run_twitch_animation( var_0, var_1 )
{
    if ( !isdefined( level.h1_team_run_twitch_enabled ) )
    {
        level.h1_team_run_twitch_enabled = [];
        level.h1_team_run_twitch_enabled["allies"] = 0;
        level.h1_team_run_twitch_enabled["axis"] = 0;
        level.h1_team_run_twitch_enabled["neutral"] = 0;
    }

    var_2 = getaiarray( var_0 );

    foreach ( var_4 in var_2 )
        var_4._id_6165 = !var_1;

    if ( level.h1_team_run_twitch_enabled[var_0] != var_1 )
        level.h1_team_run_twitch_enabled[var_0] = var_1;
}

using_improved_transitions()
{
    return 1;
}

using_tight_turn_anims()
{
    if ( isdefined( level.script_context ) )
        var_0 = level.script_context;
    else
        var_0 = tolower( getdvar( "mapname" ) );

    if ( isdefined( getdvar( "debug_force_tight_turn" ) ) && getdvarint( "debug_force_tight_turn" ) )
        return 1;

    if ( isai( self ) && isdefined( self.disable_tight_turn ) )
        return !self.disable_tight_turn;

    switch ( var_0 )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 1;
}

using_cqb_tight_turn_20()
{
    if ( isdefined( level.script_context ) )
        var_0 = level.script_context;
    else
        var_0 = tolower( getdvar( "mapname" ) );

    if ( getdvarint( "use_CQB_tight_turn_20", 0 ) )
        return 1;

    switch ( var_0 )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 1;
}

using_exit_node_to_cover_arrival_early_out()
{
    if ( getdvarint( "force_enable_cover_arrival_early_out", 0 ) )
        return 1;

    if ( isdefined( level.script_context ) )
        var_0 = level.script_context;
    else
        var_0 = tolower( getdvar( "mapname" ) );

    switch ( var_0 )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 1;
}

using_cover_transition_angle_correction()
{
    if ( isdefined( level.script_context ) )
        var_0 = level.script_context;
    else
        var_0 = tolower( getdvar( "mapname" ) );

    if ( getdvarint( "use_cover_transition_angle_correction", 0 ) )
        return 1;

    switch ( var_0 )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 0;
}
