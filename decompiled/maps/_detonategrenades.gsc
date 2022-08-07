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
    level._effect["c4_light_blink"] = loadfx( "vfx/lights/light_c4_blink" );
    level._effect["claymore_laser"] = loadfx( "vfx/props/claymore_laser" );

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        level.players[var_0] thread _id_A232();
}

_id_A232()
{
    level.c4explodethisframe = 0;
    self endon( "death" );
    self._id_196D = [];
    self.throwinggrenade = 0;
    thread _id_A203();
    thread _id_A206();
    thread _id_A20A();
    thread _id_138D();
    thread _id_137B();

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );
        self.throwinggrenade = 1;

        if ( var_0 == "c4" )
        {
            _id_1397();
            continue;
        }

        if ( var_0 == "smoke_grenade_american" )
        {
            _id_13A0();
            continue;
        }

        _id_139C();
    }
}

_id_13A0()
{
    self waittill( "grenade_fire", var_0, var_1 );

    if ( !isdefined( level._id_8684 ) )
        level._id_8684 = 0;

    var_0 thread _id_8681();
}

_id_139B()
{
    self.throwinggrenade = 0;
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = gettime();
        var_4 = var_3 - var_0;

        if ( var_4 >= 1250 )
        {
            var_1 waittill( "explode", var_5 );

            if ( soundexists( "null" ) )
                thread common_scripts\utility::_id_69C2( "null", var_5 );

            radiusdamage( var_5, 96, 300, 200, self, "MOD_UNKNOWN", "flash_grenade" );
        }
    }
}

_id_138D()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "semtex_grenade" )
        {
            thread _id_94B2( var_0 );
            var_0 thread _id_7C7B( self );
        }
    }
}

_id_94B2( var_0 )
{
    self.throwinggrenade = 0;

    if ( !isdefined( level._id_933F ) )
        level._id_933F = 1;
    else
        level._id_933F++;

    var_0 waittill( "death" );
    waitframe;
    level._id_933F--;
}

_id_7C7B( var_0 )
{
    self waittill( "missile_stuck", var_1 );

    if ( !isdefined( var_1 ) )
        return;

    if ( var_1.code_classname != "script_vehicle" )
        return;

    var_1._id_46FD = 1;
    self waittill( "explode" );

    if ( !isdefined( var_1 ) || !isalive( var_1 ) )
        return;

    if ( var_1 maps\_vehicle::_id_5031() || var_1 maps\_vehicle_code::_id_0E29( var_0 ) )
    {
        var_1._id_46FD = undefined;
        return;
    }

    var_1 kill( var_1.origin, var_0 );
}

_id_137B()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "concussion_grenade" )
            thread _id_94A1( var_0 );
    }
}

_id_94A1( var_0 )
{
    self.throwinggrenade = 0;
    var_0 waittill( "death" );
    maps\_utility::_id_8643( 0.1 );
    maps\_utility::_id_8644( 0.25 );
    maps\_utility::_id_8645( 1 );
    maps\_utility::_id_8646( 0.25 );
    maps\_utility::_id_8640();
    setdvar( "noflash", "1" );
    wait 0.05;
    setdvar( "noflash", "0" );
    wait 2.0;
    maps\_utility::_id_8641();
}

_id_8681()
{
    level._id_8684++;
    wait 50;
    level._id_8684--;
}

_id_139C()
{
    self endon( "death" );
    self waittill( "grenade_fire", var_0, var_1 );

    if ( var_1 == "fraggrenade" )
        var_0 thread maps\_utility::_id_43E9();
    else if ( var_1 == "ninebang_grenade" )
        self._id_9336 = 1;

    self.throwinggrenade = 0;
}

_id_1397()
{
    self endon( "death" );
    common_scripts\utility::_id_A069( "grenade_fire", "weapon_change" );
    self.throwinggrenade = 0;
}

_id_A203()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" )
        {
            if ( !self._id_196D.size )
                thread _id_A204();

            self._id_196D[self._id_196D.size] = var_0;
            var_0.owner = self;
            var_0 thread _id_196E();
            thread _id_196F( var_0 );
            var_0 thread _id_6A35();
        }
    }
}

_id_196F( var_0 )
{
    var_0 waittill( "death" );
    self._id_196D = maps\_utility::_id_0CFB( self._id_196D, var_0 );
}

_id_A20A()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "claymore_mp" )
        {
            var_0.owner = self;
            var_0 thread _id_196E( 1 );
            var_0 thread _id_1E48();
            var_0 thread _id_6A36();
        }
    }
}

_id_1E49( var_0 )
{
    self endon( "death" );
    wait 1;

    if ( isdefined( level._id_1E4B ) )
    {
        self thread [[ level._id_1E4B ]]( var_0 );
        return;
    }

    self makeentitysentient( var_0, 1 );
    self.attackeraccuracy = 2;
    self.meleeattackdist = 750;
    self.threatsightdelayfalloff = -1000;
}

_id_1E48()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    var_0 = 192;

    if ( isdefined( self._id_29B3 ) )
        var_0 = self._id_29B3;

    var_1 = spawn( "trigger_radius", self.origin + ( 0, 0, 0 - var_0 ), 9, var_0, var_0 * 2 );
    thread _id_285A( var_1 );

    if ( !isdefined( level._id_1E4A ) )
        level._id_1E4A = [];

    level._id_1E4A = common_scripts\utility::_id_0CDA( level._id_1E4A, self );

    if ( !maps\_utility::_id_5083() && level._id_1E4A.size > 15 )
        level._id_1E4A[0] delete();

    for (;;)
    {
        var_1 waittill( "trigger", var_2 );

        if ( isdefined( self.owner ) && var_2 == self.owner )
            continue;

        if ( isplayer( var_2 ) )
            continue;

        if ( var_2 damageconetrace( self.origin, self ) > 0 )
        {
            self playsound( "claymore_activated_SP" );
            wait 0.4;

            if ( isdefined( self.owner ) )
                self detonate( self.owner );
            else
                self detonate( undefined );

            return;
        }
    }
}

_id_285A( var_0 )
{
    self waittill( "death" );
    level._id_1E4A = maps\_utility::_id_0CFB( level._id_1E4A, self );
    wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_A206()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "detonate" );
        var_0 = self getcurrentweapon();

        if ( var_0 == "c4" )
        {
            for ( var_1 = 0; var_1 < self._id_196D.size; var_1++ )
            {
                if ( isdefined( self._id_196D[var_1] ) )
                    self._id_196D[var_1] thread _id_A006( 0.1 );
            }

            self._id_196D = [];
        }
    }
}

_id_A205()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "alt_detonate" );
        var_0 = self getcurrentweapon();

        if ( var_0 != "c4" )
        {
            var_1 = [];

            for ( var_2 = 0; var_2 < self._id_196D.size; var_2++ )
            {
                var_3 = self._id_196D[var_2];

                if ( isdefined( self._id_196D[var_2] ) )
                    var_3 thread _id_A006( 0.1 );
            }

            self._id_196D = var_1;
            self notify( "detonated" );
        }
    }
}

_id_A006( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self detonate();
}

_id_196E( var_0 )
{
    self.helmet = 100;
    self setcandamage( 1 );
    self.maxturnspeed = 100000;
    self.helmet = self.maxturnspeed;
    var_1 = undefined;

    for (;;)
    {
        self waittill( "damage", var_2, var_1 );
        break;
    }

    self playsound( "claymore_activated_SP" );

    if ( level.c4explodethisframe )
        wait(0.1 + randomfloat( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level.c4explodethisframe = 1;

    if ( isdefined( var_0 ) && var_0 && isplayer( var_1 ) )
        level.claymoreexplodethisframe_byplayer = 1;

    thread _id_7447();

    if ( isplayer( var_1 ) )
        self detonate( var_1 );
    else
        self detonate();
}

_id_7447()
{
    wait 0.05;
    level.c4explodethisframe = 0;
    level.claymoreexplodethisframe_byplayer = 0;
}

_id_7823( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_6A35()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    playfxontag( common_scripts\utility::_id_3FA8( "c4_light_blink" ), self, "tag_fx" );
}

_id_6A36()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    playfxontag( common_scripts\utility::_id_3FA8( "claymore_laser" ), self, "tag_fx" );
}

_id_1EEE( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}

_id_3F48( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    for ( var_5 = 0; var_5 < level.players.size; var_5++ )
    {
        if ( !isalive( level.players[var_5] ) || level.players[var_5].sharpturnlookaheaddist != "playing" )
            continue;

        var_6 = level.players[var_5].origin + ( 0, 0, 32 );
        var_7 = distance( var_0, var_6 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_6, var_3, undefined ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 1;
            var_8._id_50A8 = 0;
            var_8.entity = level.players[var_5];
            var_8._id_258F = var_6;
            var_4[var_4.size] = var_8;
        }
    }

    var_9 = getentarray( "grenade", "classname" );

    for ( var_5 = 0; var_5 < var_9.size; var_5++ )
    {
        var_10 = var_9[var_5].origin;
        var_7 = distance( var_0, var_10 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_10, var_3, var_9[var_5] ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 0;
            var_8._id_50A8 = 0;
            var_8.entity = var_9[var_5];
            var_8._id_258F = var_10;
            var_4[var_4.size] = var_8;
        }
    }

    var_11 = getentarray( "destructable", "targetname" );

    for ( var_5 = 0; var_5 < var_11.size; var_5++ )
    {
        var_10 = var_11[var_5].origin;
        var_7 = distance( var_0, var_10 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_10, var_3, var_11[var_5] ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 0;
            var_8._id_50A8 = 1;
            var_8.entity = var_11[var_5];
            var_8._id_258F = var_10;
            var_4[var_4.size] = var_8;
        }
    }

    return var_4;
}

_id_A2D6( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( lengthsquared( var_5 ) < var_2 * var_2 )
        var_4 = var_1;

    var_6 = vectornormalize( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = bullettrace( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 )
    {
        if ( var_7["fraction"] == 1 )
            thread _id_2729( var_4, var_1, ( 1, 1, 1 ) );
        else
        {
            thread _id_2729( var_4, var_7["position"], ( 1, 0.9, 0.8 ) );
            thread _id_2729( var_7["position"], var_1, ( 1, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_259B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_5175 )
    {
        self._id_25A8 = var_5;
        self.entity thread [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_50A8 && ( var_4 == "artillery_mp" || var_4 == "claymore_mp" ) )
            return;

        self.entity notify( "damage", var_2, var_1 );
    }
}

_id_2729( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_64FD( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    switch ( var_1 )
    {
        case "concussion_grenade_mp":
            var_4 = 512;
            var_5 = 1 - distance( self.origin, var_0.origin ) / var_4;
            var_6 = 1 + 4 * var_5;
            wait 0.05;
            self shellshock( "concussion_grenade_mp", var_6 );
            break;
        default:
            break;
    }
}

_id_A204()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "detonated" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = 0;

            while ( self usebuttonpressed() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self usebuttonpressed() && var_0 < 0.5 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            if ( !self._id_196D.size )
                return;

            self notify( "alt_detonate" );
        }

        wait 0.05;
    }
}
