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

_id_4DC1()
{
    if ( getdvar( "debug_drones" ) == "" )
        setdvar( "debug_drones", "0" );

    if ( !isdefined( level._id_5855 ) )
        level._id_2E8A = 200;

    if ( !isdefined( level._id_59FF ) )
        level._id_59FF = [];

    if ( !isdefined( level._id_59FF["allies"] ) )
        level._id_59FF["allies"] = 99999;

    if ( !isdefined( level._id_59FF["axis"] ) )
        level._id_59FF["axis"] = 99999;

    if ( !isdefined( level._id_59FF["team3"] ) )
        level._id_59FF["team3"] = 99999;

    if ( !isdefined( level._id_59FF["neutral"] ) )
        level._id_59FF["neutral"] = 99999;

    if ( !isdefined( level._id_2F1A ) )
        level._id_2F1A = [];

    if ( !isdefined( level._id_2F1A["allies"] ) )
        level._id_2F1A["allies"] = maps\_utility::_id_8F62();

    if ( !isdefined( level._id_2F1A["axis"] ) )
        level._id_2F1A["axis"] = maps\_utility::_id_8F62();

    if ( !isdefined( level._id_2F1A["team3"] ) )
        level._id_2F1A["team3"] = maps\_utility::_id_8F62();

    if ( !isdefined( level._id_2F1A["neutral"] ) )
        level._id_2F1A["neutral"] = maps\_utility::_id_8F62();

    level._id_2EC0 = ::_id_2E61;
}

_id_2E61()
{
    if ( level._id_2F1A[self.team]._id_0CD8.size >= level._id_59FF[self.team] )
    {
        self delete();
        return;
    }

    thread _id_2E26( self );
    level notify( "new_drone" );
    self setcandamage( 1 );
    maps\_drone_base::_id_2E58();

    if ( isdefined( self._id_79AE ) )
        return;

    thread _id_2E93();
    thread _id_2E3B();

    if ( isdefined( self._not_team ) )
    {
        if ( !isdefined( self._id_7A40 ) )
            thread _id_2E95();
        else
            thread _id_2EEF();
    }

    if ( isdefined( self._id_7A29 ) && self._id_7A29 == 0 )
        return;

    thread _id_2E5C();
}

_id_2E26( var_0 )
{
    maps\_utility::_id_8F65( level._id_2F1A[var_0.team], var_0 );
    var_1 = var_0.team;
    var_0 waittill( "death" );

    if ( isdefined( var_0 ) && isdefined( var_0._id_8F61 ) )
        maps\_utility::_id_8F67( level._id_2F1A[var_1], var_0._id_8F61 );
    else
        maps\_utility::_id_8F68( level._id_2F1A[var_1] );
}

_id_2E3B()
{
    _id_2EEE();

    if ( !isdefined( self ) )
        return;

    var_0 = "stand";

    if ( isdefined( self._id_0C80 ) && isdefined( level._id_2E22[self.team][self._id_0C80] ) && isdefined( level._id_2E22[self.team][self._id_0C80]["death"] ) )
        var_0 = self._id_0C80;

    var_1 = level._id_2E22[self.team][var_0]["death"];

    if ( isdefined( self._id_2652 ) )
        var_1 = self._id_2652;

    self notify( "death" );

    if ( isdefined( level._id_2E3A ) )
    {
        self thread [[ level._id_2E3A ]]( var_1 );
        return;
    }

    if ( !( isdefined( self._id_6159 ) && isdefined( self._id_85BA ) ) )
    {
        if ( isdefined( self._id_6159 ) )
            _id_2EA0( var_1, "deathplant" );
        else if ( isdefined( self._id_85BA ) )
        {
            self startragdoll();
            _id_2EA0( var_1, "deathplant" );
        }
        else
        {
            _id_2EA0( var_1, "deathplant" );
            self startragdoll();
        }
    }

    self notsolid();
    thread _id_2EDD( 2 );

    if ( isdefined( self ) && isdefined( self._id_611F ) )
        return;

    wait 10;

    while ( isdefined( self ) )
    {
        if ( !common_scripts\utility::_id_A347( level.playercardbackground.origin, level.playercardbackground.angles, self.origin, 0.5 ) )
            self delete();

        wait 5;
    }
}

_id_2E93()
{
    self endon( "death" );

    for (;;)
    {
        while ( !isdefined( self.damageshield ) || !self.damageshield )
            wait 0.05;

        var_0 = self.helmet;
        self.helmet = 100000;

        while ( isdefined( self.damageshield ) && self.damageshield )
            wait 0.05;

        self.helmet = var_0;
        wait 0.05;
    }
}

_id_2EEE()
{
    self endon( "death" );

    while ( isdefined( self ) )
    {
        self waittill( "damage" );

        if ( isdefined( self.damageshield ) && self.damageshield )
        {
            self.helmet = 100000;
            continue;
        }

        if ( self.helmet <= 0 )
            break;
    }
}

_id_2EDD( var_0 )
{
    wait(var_0);

    if ( isdefined( self ) )
        self motionblurhqenable();
}
#using_animtree("generic_human");

_id_2E9F( var_0, var_1 )
{
    if ( isdefined( self._id_2E8C ) )
        self [[ self._id_2E8D ]]( var_0, var_1 );
    else
    {
        self _meth_8144( %body, 0.2 );
        self _meth_8143();
        self setflaggedanimknoballrestart( "drone_anim", var_0, %body, 1, 0.2, var_1 );
        self._id_2EF7 = var_0;
    }
}

_id_2EA0( var_0, var_1 )
{
    if ( self.unlockpoints == "human" )
        self _meth_8144( %body, 0.2 );

    self _meth_8143();
    var_2 = "normal";

    if ( isdefined( var_1 ) )
        var_2 = "deathplant";

    var_3 = "drone_anim";
    self _meth_8140( var_3, self.origin, self.angles, var_0, var_2 );
    self waittillmatch( "drone_anim", "end" );
}

_id_2E43()
{
    if ( !isdefined( self ) )
        return;

    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = getweaponmodel( self.weapon_switch_invalid );
    var_1 = self.weapon_switch_invalid;

    if ( isdefined( var_0 ) )
    {
        maps\_utility::_id_2975( self.weapon_switch_invalid );
        self detach( var_0, "tag_weapon_right" );
        var_2 = self gettagorigin( "tag_weapon_right" );
        var_3 = self gettagangles( "tag_weapon_right" );
        var_4 = spawn( "weapon_" + var_1, ( 0.0, 0.0, 0.0 ) );
        var_4.angles = var_3;
        var_4.origin = var_2;
    }
}

_id_2EB7( var_0 )
{
    if ( isdefined( anim._id_0CCA[var_0] ) )
    {
        var_1 = anim._id_0CCA[var_0]["idle"]["stand"][0];
        var_1 = common_scripts\utility::_id_0CDD( var_1, anim._id_0CCA[var_0]["idle"]["stand"][1] );
        var_2 = anim._id_0CCA[var_0]["idle"]["stand"][0][0];
        self._id_2E23 = var_2;
        self._id_2E24 = var_1;
        self._id_2E5D = 1;
        self._id_2E5E = ::_id_2E25;
        thread _id_2E5C( undefined, undefined );
    }
}

_id_2E25()
{
    self endon( "death" );
    var_0 = 10;

    if ( !isdefined( self._id_2E24 ) || !isarray( self._id_2E24 ) )
        return;

    self _meth_8144( %body, 0.2 );
    self _meth_8143();
    var_1 = 1;
    animscripts\face::_id_6D9B( undefined, "idle", undefined );

    for (;;)
    {
        var_2 = common_scripts\utility::_id_710E( self._id_2E24 );

        if ( randomint( 100 ) < var_0 || var_1 )
        {
            self setflaggedanimknoballrestart( "drone_anim", var_2, %body, 1, 0.2, 1 );
            var_1 = 0;
        }

        self waittillmatch( "drone_anim", "end" );
        self setflaggedanimknoballrestart( "drone_anim", self._id_2E23, %body, 1, 0.2, 1 );
    }
}

_id_2E5C( var_0, var_1 )
{
    if ( isdefined( self._id_2E5D ) )
        [[ self._id_2E5E ]]();
    else if ( isdefined( var_0 ) && isdefined( var_0["script_noteworthy"] ) && isdefined( level._id_2E22[self.team][var_0["script_noteworthy"]] ) )
        thread _id_2E4A( var_0["script_noteworthy"], var_0, var_1 );
    else
    {
        if ( isdefined( self._id_4B79 ) )
        {
            _id_2E9F( self._id_4B79, 1 );
            return;
        }

        _id_2E9F( level._id_2E22[self.team]["stand"]["idle"], 1 );
    }
}

_id_2E56( var_0, var_1 )
{
    var_2 = var_1["script_noteworthy"];

    if ( !isdefined( level._id_2E22[self.team][var_2]["arrival"] ) )
        return var_0;

    var_3 = getmovedelta( level._id_2E22[self.team][var_2]["arrival"], 0, 1 );
    var_3 = length( var_3 );
    var_0 -= var_3;
    return var_0;
}

_id_2E4A( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_drone_fighting" );
    self._id_0C80 = var_0;
    self._id_A2EA = undefined;
    var_3 = randomintrange( 1, 4 );

    if ( self.team == "axis" )
    {
        if ( var_3 == 1 )
            self._id_A2EA = "weap_m9_fire_npc";
        else if ( var_3 == 2 )
            self._id_A2EA = "weap_usp45sd_fire_npc";

        if ( var_3 == 3 )
            self._id_A2EA = "weap_pecheneg_fire_npc";
    }
    else
    {
        if ( var_3 == 1 )
            self._id_A2EA = "weap_m9_fire_npc";
        else if ( var_3 == 2 )
            self._id_A2EA = "weap_usp45sd_fire_npc";

        if ( var_3 == 3 )
            self._id_A2EA = "weap_pecheneg_fire_npc";
    }

    self.angles = ( 0, self.angles[1], self.angles[2] );

    if ( var_0 == "coverprone" )
        self moveto( self.origin + ( 0.0, 0.0, 8.0 ), 0.05 );

    self._id_6159 = 1;
    var_4 = level._id_2E22[self.team][var_0];
    self._id_2652 = var_4["death"];

    while ( isdefined( self ) )
    {
        _id_2EA0( var_4["idle"][randomint( var_4["idle"].size )] );

        if ( common_scripts\utility::_id_2006() && !isdefined( self.ignoreforfixednodesafecheck ) )
        {
            var_5 = 1;

            if ( isdefined( var_4["pop_up_chance"] ) )
                var_5 = var_4["pop_up_chance"];

            var_5 *= 100;
            var_6 = 1;

            if ( randomfloat( 100 ) > var_5 )
                var_6 = 0;

            if ( var_6 == 1 )
            {
                _id_2EA0( var_4["hide_2_aim"] );
                wait(getanimlength( var_4["hide_2_aim"] ) - 0.5);
            }

            if ( isdefined( var_4["fire"] ) )
            {
                if ( var_0 == "coverprone" && var_6 == 1 )
                    thread _id_2E9F( var_4["fire_exposed"], 1 );
                else
                    thread _id_2E9F( var_4["fire"], 1 );

                _id_2E4F();
            }
            else
            {
                _id_2EBA();
                wait 0.15;
                _id_2EBA();
                wait 0.15;
                _id_2EBA();
                wait 0.15;
                _id_2EBA();
            }

            if ( var_6 == 1 )
                _id_2EA0( var_4["aim_2_hide"] );

            _id_2EA0( var_4["reload"] );
        }
    }
}

_id_2E4F()
{
    self endon( "death" );

    if ( common_scripts\utility::_id_2006() )
    {
        _id_2EBA();
        wait 0.1;
        _id_2EBA();
        wait 0.1;
        _id_2EBA();

        if ( common_scripts\utility::_id_2006() )
        {
            wait 0.1;
            _id_2EBA();
        }

        if ( common_scripts\utility::_id_2006() )
        {
            wait 0.1;
            _id_2EBA();
            wait 0.1;
            _id_2EBA();
            wait 0.1;
        }

        if ( common_scripts\utility::_id_2006() )
            wait(randomfloatrange( 1, 2 ));
    }
    else
    {
        _id_2EBA();
        wait(randomfloatrange( 0.25, 0.75 ));
        _id_2EBA();
        wait(randomfloatrange( 0.15, 0.75 ));
        _id_2EBA();
        wait(randomfloatrange( 0.15, 0.75 ));
        _id_2EBA();
        wait(randomfloatrange( 0.15, 0.75 ));
    }
}

_id_2EBA()
{
    self endon( "death" );
    self notify( "firing" );
    self endon( "firing" );
    _id_2EBD();
    var_0 = %exposed_crouch_shoot_auto_v2;
    self _meth_8147( var_0, 1, 0.2, 1.0 );
    common_scripts\utility::_id_27CD( 0.25, ::_meth_8144, var_0, 0 );
}

_id_2EBD()
{
    var_0 = common_scripts\utility::_id_3FA8( "pdrone_flash_wv" );

    if ( self.team == "allies" )
        var_0 = common_scripts\utility::_id_3FA8( "pdrone_flash_wv" );

    if ( isdefined( self._id_6023 ) )
        var_0 = common_scripts\utility::_id_3FA8( self._id_6023 );

    if ( !isdefined( self._id_613E ) )
        thread _id_2EA1( self._id_A2EA );

    playfxontag( var_0, self, "tag_flash" );
}

_id_2EA1( var_0 )
{
    self playsound( var_0 );
}

_id_2EEF()
{
    self endon( "death" );
    self waittill( "move" );
    thread _id_2E95();
}

_id_3CC9( var_0 )
{
    var_1 = 170;
    var_2 = 1;
    var_3 = getanimlength( var_0 );
    var_4 = getmovedelta( var_0, 0, 1 );
    var_5 = length( var_4 );

    if ( var_3 > 0 && var_5 > 0 )
    {
        var_1 = var_5 / var_3;
        var_2 = 0;
    }

    if ( isdefined( self._id_2EAA ) )
        var_1 = self._id_2EAA;

    var_6 = spawnstruct();
    var_6._id_0C04 = var_2;
    var_6._id_76B7 = var_1;
    var_6._id_0C44 = var_3;
    return var_6;
}

_id_2E55()
{
    var_0 = _id_407C( self._not_team, self.origin );
    var_1 = var_0[var_0.size - 2]["target"];
    var_2 = getnode( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
    {
        var_3 = getnodesonpath( var_0[var_0.size - 1]["origin"], var_0[var_0.size - 1]["origin"] );
        var_2 = var_3[var_3.size - 1];
    }

    return var_2;
}

_id_2E95()
{
    self endon( "death" );
    self endon( "drone_stop" );
    wait 0.05;
    var_0 = _id_407C( self._not_team, self.origin );
    var_1 = level._id_2E22[self.team]["stand"]["run"];

    if ( isdefined( self._id_76C4 ) )
        var_1 = self._id_76C4;

    var_2 = _id_3CC9( var_1 );
    var_3 = var_2._id_76B7;
    var_4 = var_2._id_0C04;

    if ( isdefined( self._id_2E96 ) )
    {
        var_2 = [[ self._id_2E96 ]]();

        if ( isdefined( var_2 ) )
        {
            var_1 = var_2._id_76C4;
            var_3 = var_2._id_76B7;
            var_4 = var_2._id_0C04;
        }

        var_2 = undefined;
    }

    if ( !var_4 )
        thread _id_2E98( var_3 );

    _id_2E9F( var_1, self._id_5F65 );
    var_5 = 0.5;
    var_6 = 0;
    self._id_8D10 = 1;
    self._id_24BF = var_0[var_6];
    var_7 = 0;
    var_8 = undefined;

    for (;;)
    {
        if ( !isdefined( var_0[var_6] ) )
            break;

        var_9 = var_0[var_6]["vec"];
        var_10 = self.origin - var_0[var_6]["origin"];
        var_11 = vectordot( vectornormalize( var_9 ), var_10 );

        if ( !isdefined( var_0[var_6]["dist"] ) )
            break;

        var_12 = var_11 + level._id_2E8A;

        while ( var_12 > var_0[var_6]["dist"] )
        {
            var_12 -= var_0[var_6]["dist"];
            var_6++;
            self._id_24BF = var_0[var_6];

            if ( isdefined( var_8 ) )
            {
                if ( var_6 == 0 )
                {

                }

                if ( !isdefined( self._id_136C ) )
                    self._id_136C = self._id_2EF7;

                var_13 = level._id_2E22[self.team]["stairs"][var_8];
                _id_2E9F( var_13, self._id_5F65 );
                var_7 = 1;
            }

            if ( !isdefined( var_0[var_6]["dist"] ) )
            {
                self rotateto( vectortoangles( var_0[var_0.size - 1]["vec"] ), var_5 );
                var_14 = distance( self.origin, var_0[var_0.size - 1]["origin"] );
                var_15 = var_14 / var_3 * self._id_5F65;
                var_16 = var_0[var_0.size - 1]["origin"] + ( 0.0, 0.0, 100.0 );
                var_17 = var_0[var_0.size - 1]["origin"] - ( 0.0, 0.0, 100.0 );
                var_18 = physicstrace( var_16, var_17 );

                if ( getdvar( "debug_drones" ) == "1" )
                {
                    thread common_scripts\utility::_id_2DB8( var_16, var_17, 1, 1, 1, var_5 );
                    thread common_scripts\utility::_id_2DB8( self.origin, var_18, 0, 0, 1, var_5 );
                }

                self moveto( var_18, var_15 );
                wait(var_15);
                self notify( "goal" );
                thread _id_1CB6();
                thread _id_2E5C( var_0[var_0.size - 1], var_18 );
                return;
            }

            if ( !isdefined( var_0[var_6] ) )
            {
                self notify( "goal" );
                thread _id_2E5C();
                return;
            }
        }

        if ( isdefined( self._id_2E96 ) )
        {
            var_2 = [[ self._id_2E96 ]]();

            if ( isdefined( var_2 ) )
            {
                if ( var_2._id_76C4 != var_1 )
                {
                    var_1 = var_2._id_76C4;
                    var_3 = var_2._id_76B7;
                    var_4 = var_2._id_0C04;

                    if ( !var_4 )
                        thread _id_2E98( var_3 );
                    else
                        self notify( "drone_move_z" );

                    _id_2E9F( var_1, self._id_5F65 );
                }
            }
        }

        self._id_24BF = var_0[var_6];
        var_19 = var_0[var_6]["vec"] * var_12;
        var_19 += var_0[var_6]["origin"];
        var_20 = var_19;
        var_16 = var_20 + ( 0.0, 0.0, 100.0 );
        var_17 = var_20 - ( 0.0, 0.0, 100.0 );
        var_20 = physicstrace( var_16, var_17 );

        if ( !var_4 )
            self._id_2E88 = var_20;

        if ( getdvar( "debug_drones" ) == "1" )
        {
            thread common_scripts\utility::_id_2DB8( var_16, var_17, 1, 1, 1, var_5 );
            thread _id_2DC1( var_20, 1, 0, 0, 16, var_5 );
        }

        var_21 = vectortoangles( var_20 - self.origin );
        self rotateto( ( 0, var_21[1], 0 ), var_5 );
        var_22 = var_3 * var_5 * self._id_5F65;
        var_23 = vectornormalize( var_20 - self.origin );
        var_19 = var_23 * var_22;
        var_19 += self.origin;

        if ( getdvar( "debug_drones" ) == "1" )
            thread common_scripts\utility::_id_2DB8( self.origin, var_19, 0, 0, 1, var_5 );

        self moveto( var_19, var_5 );
        wait(var_5);

        if ( isdefined( self._id_24BF["script_noteworthy"] ) && ( self._id_24BF["script_noteworthy"] == "stairs_start_up" || self._id_24BF["script_noteworthy"] == "stairs_start_down" ) )
        {
            var_24 = strtok( self._id_24BF["script_noteworthy"], "_" );
            var_8 = var_24[2];
            continue;
        }

        if ( var_7 == 1 )
        {
            if ( isdefined( self._id_24BF["script_noteworthy"] ) && self._id_24BF["script_noteworthy"] == "stairs_end" )
            {
                var_25 = self._id_136C;
                _id_2E9F( var_25, self._id_5F65 );
                var_7 = 0;
                var_8 = undefined;
            }
        }
    }

    thread _id_2E5C();
}

_id_2E98( var_0 )
{
    self endon( "death" );
    self endon( "drone_stop" );
    self notify( "drone_move_z" );
    self endon( "drone_move_z" );
    var_1 = 0.05;

    for (;;)
    {
        if ( isdefined( self._id_2E88 ) && var_0 > 0 )
        {
            var_2 = self._id_2E88[2] - self.origin[2];
            var_3 = distance2d( self._id_2E88, self.origin );
            var_4 = var_3 / var_0;

            if ( var_4 > 0 && var_2 != 0 )
            {
                var_5 = abs( var_2 ) / var_4;
                var_6 = var_5 * var_1;

                if ( var_2 >= var_5 )
                    self.origin = ( self.origin[0], self.origin[1], self.origin[2] + var_6 );
                else if ( var_2 <= var_5 * -1 )
                    self.origin = ( self.origin[0], self.origin[1], self.origin[2] - var_6 );
            }
        }

        wait(var_1);
    }
}

_id_407C( var_0, var_1 )
{
    var_2 = 1;
    var_3 = [];
    var_3[0]["origin"] = var_1;
    var_3[0]["dist"] = 0;
    var_4 = undefined;
    var_4 = var_0;
    var_5["entity"] = maps\_spawner::_id_3E8A;
    var_5["node"] = maps\_spawner::_id_3E8C;
    var_5["vehicle_node"] = maps\_spawner::get_target_vehicle_nodes;
    var_5["struct"] = maps\_spawner::_id_3E8E;
    var_6 = undefined;
    var_7 = [[ var_5["entity"] ]]( var_4 );
    var_8 = [[ var_5["node"] ]]( var_4 );
    var_9 = [[ var_5["vehicle_node"] ]]( var_4 );
    var_10 = [[ var_5["struct"] ]]( var_4 );

    if ( var_7.size )
        var_6 = "entity";
    else if ( var_8.size )
        var_6 = "node";
    else if ( var_9.size )
        var_6 = "vehicle_node";
    else if ( var_10.size )
        var_6 = "struct";

    var_11 = var_3.size;

    for (;;)
    {
        var_12 = [[ var_5[var_6] ]]( var_4 );
        var_13 = common_scripts\utility::_id_710E( var_12 );

        if ( !isdefined( var_13 ) )
            break;

        var_11 = var_3.size;
        var_14 = var_13.origin;

        if ( isdefined( var_13.rank ) )
        {
            if ( !isdefined( self._id_2F19 ) )
                self._id_2F19 = -1 + randomfloat( 2 );

            if ( !isdefined( var_13.angles ) )
                var_13.angles = ( 0.0, 0.0, 0.0 );

            var_15 = anglestoforward( var_13.angles );
            var_16 = anglestoright( var_13.angles );
            var_17 = anglestoup( var_13.angles );
            var_18 = ( 0, self._id_2F19 * var_13.rank, 0 );
            var_14 += var_15 * var_18[0];
            var_14 += var_16 * var_18[1];
            var_14 += var_17 * var_18[2];
        }

        var_3[var_11]["origin"] = var_14;
        var_3[var_11]["target"] = var_13._not_team;

        if ( isdefined( self._id_7A99 ) && self._id_7A99 == "use_last_node_angles" && isdefined( var_13.angles ) )
            var_3[var_11]["angles"] = var_13.angles;

        if ( isdefined( var_13.script_parentname ) )
            var_3[var_11]["script_noteworthy"] = var_13.script_parentname;

        if ( isdefined( var_13.script_origin ) )
            var_3[var_11]["script_linkname"] = var_13.script_origin;

        var_3[var_11 - 1]["dist"] = distance( var_3[var_11]["origin"], var_3[var_11 - 1]["origin"] );
        var_3[var_11 - 1]["vec"] = vectornormalize( var_3[var_11]["origin"] - var_3[var_11 - 1]["origin"] );

        if ( !isdefined( var_3[var_11 - 1]["target"] ) )
            var_3[var_11 - 1]["target"] = var_13.teambalanced;

        if ( !isdefined( var_3[var_11 - 1]["script_noteworthy"] ) && isdefined( var_13.script_parentname ) )
            var_3[var_11 - 1]["script_noteworthy"] = var_13.script_parentname;

        if ( !isdefined( var_3[var_11 - 1]["script_linkname"] ) && isdefined( var_13.script_origin ) )
            var_3[var_11 - 1]["script_linkname"] = var_13.script_origin;

        if ( !isdefined( var_13._not_team ) )
            break;

        var_4 = var_13._not_team;
    }

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "use_last_node_angles" && isdefined( var_3[var_11]["angles"] ) )
        var_3[var_11]["vec"] = anglestoforward( var_3[var_11]["angles"] );
    else
        var_3[var_11]["vec"] = var_3[var_11 - 1]["vec"];

    var_13 = undefined;
    return var_3;
}

_id_2DC1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_0 + ( var_4, 0, 0 );
    var_7 = var_0 - ( var_4, 0, 0 );
    thread common_scripts\utility::_id_2DB8( var_6, var_7, var_1, var_2, var_3, var_5 );
    var_6 = var_0 + ( 0, var_4, 0 );
    var_7 = var_0 - ( 0, var_4, 0 );
    thread common_scripts\utility::_id_2DB8( var_6, var_7, var_1, var_2, var_3, var_5 );
    var_6 = var_0 + ( 0, 0, var_4 );
    var_7 = var_0 - ( 0, 0, var_4 );
    thread common_scripts\utility::_id_2DB8( var_6, var_7, var_1, var_2, var_3, var_5 );
}

_id_1CB6()
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self.script_parentname ) )
        return;

    switch ( self.script_parentname )
    {
        case "delete_on_goal":
            if ( isdefined( self._id_58D7 ) )
                maps\_utility::_id_8EA4();

            self delete();
            break;
        case "die_on_goal":
            self kill();
            break;
    }
}
