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

main( var_0 )
{
    var_0[var_0.size] = "airdrop_pallet";

    if ( maps\mp\_utility::_id_50C4() )
        var_0[var_0.size] = "boost_add";
    else
        var_0[var_0.size] = "boost_remove";

    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_79F4 ) )
        {
            var_3 = 1;
            var_4 = strtok( var_1[var_2]._id_79F4, " " );

            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                {
                    if ( var_4[var_6] == var_0[var_5] )
                    {
                        var_3 = 0;
                        break;
                    }
                }

                if ( !var_3 )
                    break;
            }

            if ( var_3 )
            {
                if ( isdefined( var_1[var_2]._id_79BF ) )
                    common_scripts\_createfx::_id_73B3( var_1[var_2] );

                var_1[var_2] delete();
            }
        }
    }

    var_7 = getentarray( "boost_jump_border", "targetname" );

    if ( isdefined( var_7 ) )
    {
        foreach ( var_9 in var_7 )
            var_9 delete();
    }
}

init()
{
    level._id_62A2 = 0;
    level._id_630D = 0;
    level thread _id_64C8();
}

_id_64C8()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
        var_0 thread _id_646D();
    }
}

_id_64D6()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( self._id_3BF9 ) )
        {
            self._id_3BF9 = undefined;
            continue;
        }

        _id_4D34();
    }
}

_id_4D34()
{
    thread _id_6467();
    self._id_940F = [];
    self._id_1BB6 = undefined;
    self._id_1E23 = undefined;
    self._id_1AD7 = 1;
    self._id_535F = undefined;
    self._id_4DDF = 1;
}

_id_6467()
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_646D()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_23E9( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.unlockpoints = "carryObject";
    var_4.curorigin = var_1.origin;
    var_4._id_663A = var_0;
    var_4._id_331C = var_1 getentitynumber();

    if ( issubstr( var_1.classname, "use" ) )
        var_4._id_981D = "use";
    else
        var_4._id_981D = "proximity";

    var_1._id_1315 = var_1.origin;
    var_4.trigger = var_1;
    var_4._id_9C1C = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_4._id_637F = var_3;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5]._id_1315 = var_2[var_5].origin;
        var_2[var_5]._id_1302 = var_2[var_5].angles;
    }

    var_4.visuals = var_2;
    var_4._id_20D0 = [];
    var_4.teamobjids = getnextobjid();
    var_4._id_6306 = getnextobjid();
    var_4._id_6309 = getnextobjid();
    var_4._id_630B = 0;
    var_4._id_630A = 0;
    var_4._id_6313 = 5.0;
    level._id_630D += 2;
    objective_add( var_4.teamobjids, "invisible", var_4.curorigin );
    objective_add( var_4._id_6306, "invisible", var_4.curorigin );
    objective_add( var_4._id_6309, "invisible", var_4.curorigin );
    objective_team( var_4.teamobjids, "allies" );
    objective_team( var_4._id_6306, "axis" );
    objective_mlgspectator( var_4._id_6309 );
    var_4._id_6316["allies"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_allies_" + var_4._id_331C, var_4.curorigin + var_3, "allies", undefined );
    var_4._id_6316["axis"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_axis_" + var_4._id_331C, var_4.curorigin + var_3, "axis", undefined );
    var_4._id_6316["mlg"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_mlg_" + var_4._id_331C, var_4.curorigin + var_3, "mlg", undefined );
    var_4._id_6316["mlg"].archived = 0;
    var_4._id_6316["allies"].alpha = 0;
    var_4._id_6316["axis"].alpha = 0;
    var_4._id_1BAF = undefined;
    var_4._id_518E = 0;
    var_4._id_4EA9 = "none";
    var_4._id_0AB5 = 0;
    var_4._id_A296 = 0;
    var_4._id_52E1 = 0;
    var_4.contesteduiprogress = 0;
    var_4._id_A350 = [];
    var_4._id_1BB1 = 0;
    var_4._id_9E5B = "none";
    var_4._id_1BB5 = undefined;
    var_4._id_646F = undefined;
    var_4._id_64C2 = undefined;
    var_4._id_64E0 = undefined;

    if ( var_4._id_981D == "use" )
        var_4 thread _id_1BBA();
    else
    {
        var_4.curprogress = 0;
        var_4._id_9C19 = 0;
        var_4.userate = 0;
        var_4._id_600A = 0;
        var_4._id_1AC3 = 0;
        var_4._id_9207 = [];
        var_4._id_9206 = [];
        var_4._id_62AF["neutral"] = 0;
        var_4._id_62AF["axis"] = 0;
        var_4._id_62AF["allies"] = 0;
        var_4._id_62AF["none"] = 0;
        var_4._id_940D["neutral"] = [];
        var_4._id_940D["axis"] = [];
        var_4._id_940D["allies"] = [];
        var_4._id_940D["none"] = [];
        var_4._id_1E22 = "none";
        var_4._id_1E21 = undefined;
        var_4._id_5587 = "none";
        var_4._id_5588 = 0;

        if ( level.multiteambased )
        {
            foreach ( var_7 in level.teamnamelist )
            {
                var_4._id_62AF[var_7] = 0;
                var_4._id_940D[var_7] = [];
            }
        }

        var_4 thread _id_1BB8();
    }

    var_4 thread _id_9AFD();
    return var_4;
}

deletecarryobject()
{
    if ( self.unlockpoints != "carryObject" )
        return;

    var_0 = self;
    var_0.unlockpoints = undefined;
    var_0.curorigin = undefined;
    var_0._id_663A = undefined;
    var_0._id_331C = undefined;
    var_0._id_981D = undefined;
    var_0.trigger unlink();
    var_0.trigger = undefined;
    var_0._id_9C1C = undefined;
    var_0._id_637F = undefined;

    foreach ( var_2 in var_0.visuals )
        var_2 delete();

    var_0.visuals = undefined;
    maps\mp\_utility::_objective_delete( var_0.teamobjids );
    maps\mp\_utility::_objective_delete( var_0._id_6306 );
    maps\mp\_utility::_objective_delete( var_0._id_6309 );
    var_0._id_20D0 = undefined;
    var_0.teamobjids = undefined;
    var_0._id_6306 = undefined;
    var_0._id_6309 = undefined;
    var_0._id_630B = undefined;
    var_0._id_630A = undefined;
    var_0._id_6313 = undefined;
    maps\mp\gametypes\_objpoints::deleteobjpoint( var_0._id_6316["allies"] );
    maps\mp\gametypes\_objpoints::deleteobjpoint( var_0._id_6316["axis"] );
    maps\mp\gametypes\_objpoints::deleteobjpoint( var_0._id_6316["mlg"] );
    var_0._id_6316 = undefined;
    var_0._id_1BAF = undefined;
    var_0._id_518E = undefined;
    var_0._id_4EA9 = undefined;
    var_0._id_0AB5 = undefined;
    var_0._id_A296 = undefined;
    var_0._id_52E1 = undefined;
    var_0._id_A350 = undefined;
    var_0._id_1BB1 = undefined;
    var_0._id_9E5B = undefined;
    var_0._id_1BB5 = undefined;
    var_0._id_646F = undefined;
    var_0._id_64C2 = undefined;
    var_0._id_64E0 = undefined;
    var_0.curprogress = undefined;
    var_0._id_9C19 = undefined;
    var_0.userate = undefined;
    var_0._id_600A = undefined;
    var_0._id_1AC3 = undefined;
    var_0._id_9207 = undefined;
    var_0._id_9206 = undefined;
    var_0._id_62AF = undefined;
    var_0._id_940D = undefined;
    var_0._id_1E22 = undefined;
    var_0._id_1E21 = undefined;
    var_0._id_5587 = undefined;
    var_0._id_5588 = undefined;
    var_0 notify( "death" );
    var_0 notify( "deleted" );
}

_id_1BBA()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( self._id_518E )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0.pers["team"] ) )
            continue;

        if ( !var_0._id_1AD7 )
            continue;

        if ( !isdefined( var_0._id_4DDF ) )
            continue;

        if ( isdefined( var_0.throwinggrenade ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_0 maps\mp\_utility::_id_51E3() || var_0 maps\mp\_utility::_id_512B() )
            continue;

        _id_7FE2( var_0 );
    }
}

_id_1BB8()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        self endon( "death" );

    thread _id_1BB9();
}

_id_1BB9()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        self endon( "death" );

    level endon( "game_ended" );
    thread _id_7044();

    for (;;)
    {
        waitframe;

        if ( self._id_9C19 && self.curprogress >= self._id_9C19 )
        {
            self.curprogress = 0;
            var_0 = _id_3F79();

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( _id_3F30(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) )
                _id_7FE2( var_0 );

            _id_7F3A( "none" );
            self._id_1E21 = undefined;
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C19 )
            {
                if ( !self._id_62AF[self._id_1E22] )
                {
                    if ( isdefined( self._id_648E ) )
                        self [[ self._id_648E ]]( _id_3F30(), self._id_1E21, 0 );

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self.curprogress += 50 * self.userate;

                    if ( isdefined( self._id_64FC ) )
                        self [[ self._id_64FC ]]( _id_3F30(), self.curprogress / self._id_9C19, 50 * self.userate / self._id_9C19 );
                }
            }
            else
            {
                if ( maps\mp\_utility::_id_5189( self._id_1E21 ) )
                    _id_7FE2( self._id_1E21 );

                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_6815( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_1AD7 = 0;

    for (;;)
    {
        if ( distancesquared( self.origin, var_0 ) > 4096 )
            break;

        wait 0.2;
    }

    self._id_1AD7 = 1;
}

_id_7FE2( var_0 )
{
    if ( isai( var_0 ) && isdefined( var_0.owner ) )
        return;

    if ( isdefined( var_0._id_1BB6 ) )
    {
        if ( isdefined( self._id_64C3 ) )
            self [[ self._id_64C3 ]]( var_0 );

        return;
    }

    var_0 _id_41F4( self );
    _id_7F34( var_0 );

    for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        self.visuals[var_1] hide();

    self.trigger.origin += ( 0, 0, 10000 );
    self notify( "pickup_object" );

    if ( isdefined( self._id_64C2 ) )
        self [[ self._id_64C2 ]]( var_0 );

    _id_9B09();
    _id_9BA9();
}

_id_9AFD()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self._id_1BAF ) )
        {
            self.curorigin = self._id_1BAF.origin + ( 0, 0, 75 );
            self.curcarrierorigin = self._id_1BAF.origin;
            self._id_6316["allies"] maps\mp\gametypes\_objpoints::_id_9B44( self.curorigin );
            self._id_6316["axis"] maps\mp\gametypes\_objpoints::_id_9B44( self.curorigin );

            if ( ( self._id_9E5B == "friendly" || self._id_9E5B == "any" ) && _id_510F( "allies" ) && self._id_630B )
            {
                if ( self._id_6316["allies"]._id_51A5 )
                {
                    self._id_6316["allies"].alpha = self._id_6316["allies"]._id_1301;
                    self._id_6316["allies"] fadeovertime( self._id_6313 + 1.0 );
                    self._id_6316["allies"].alpha = 0;
                }

                objective_position( self.teamobjids, self.curorigin );
            }
            else if ( ( self._id_9E5B == "friendly" || self._id_9E5B == "any" ) && _id_510F( "axis" ) && self._id_630B )
            {
                if ( self._id_6316["axis"]._id_51A5 )
                {
                    self._id_6316["axis"].alpha = self._id_6316["axis"]._id_1301;
                    self._id_6316["axis"] fadeovertime( self._id_6313 + 1.0 );
                    self._id_6316["axis"].alpha = 0;
                }

                objective_position( self._id_6306, self.curorigin );
            }

            if ( ( self._id_9E5B == "enemy" || self._id_9E5B == "any" ) && !_id_510F( "allies" ) && self._id_630A )
            {
                if ( self._id_6316["allies"]._id_51A5 )
                {
                    self._id_6316["allies"].alpha = self._id_6316["allies"]._id_1301;
                    self._id_6316["allies"] fadeovertime( self._id_6313 + 1.0 );
                    self._id_6316["allies"].alpha = 0;
                }

                objective_position( self.teamobjids, self.curorigin );
            }
            else if ( ( self._id_9E5B == "enemy" || self._id_9E5B == "any" ) && !_id_510F( "axis" ) && self._id_630A )
            {
                if ( self._id_6316["axis"]._id_51A5 )
                {
                    self._id_6316["axis"].alpha = self._id_6316["axis"]._id_1301;
                    self._id_6316["axis"] fadeovertime( self._id_6313 + 1.0 );
                    self._id_6316["axis"].alpha = 0;
                }

                objective_position( self._id_6306, self.curorigin );
            }

            maps\mp\_utility::_id_9F85( self._id_6313, "dropped", "reset" );
            continue;
        }

        self.curcarrierorigin = undefined;
        self._id_6316["allies"] maps\mp\gametypes\_objpoints::_id_9B44( self.curorigin + self._id_637F );
        self._id_6316["axis"] maps\mp\gametypes\_objpoints::_id_9B44( self.curorigin + self._id_637F );
        wait 0.05;
    }
}

_id_4870()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 0;
}

_id_41F4( var_0 )
{
    self._id_1BB6 = var_0;
    thread _id_94B8();

    if ( isdefined( var_0._id_1BBB ) )
    {
        var_0._id_1BB2 = self getcurrentprimaryweapon();
        var_0._id_1BB0 = self hasweapon( var_0._id_1BBB );

        if ( isdefined( var_0._id_1BBC ) )
            self thread [[ var_0._id_1BBC ]]();

        self giveweapon( var_0._id_1BBB );
        self switchtoweaponimmediate( var_0._id_1BBB );
        self disableweaponpickup();
        common_scripts\utility::_id_0588();
    }
    else if ( !var_0._id_0AB5 )
    {
        common_scripts\utility::_id_0587();

        if ( isdefined( var_0._id_5976 ) )
            self thread [[ var_0._id_5976 ]]();
        else
            thread _id_5976();
    }

    if ( isdefined( var_0._id_1BB5 ) && isplayer( self ) )
    {
        if ( level.splitscreen )
        {
            self._id_1BB5 = maps\mp\gametypes\_hud_util::_id_2420( var_0._id_1BB5, 33, 33 );
            self._id_1BB5 maps\mp\gametypes\_hud_util::_id_7FEE( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -78 );
        }
        else
        {
            self._id_1BB5 = maps\mp\gametypes\_hud_util::_id_2420( var_0._id_1BB5, 50, 50 );
            self._id_1BB5 maps\mp\gametypes\_hud_util::_id_7FEE( "BOTTOM RIGHT", "BOTTOM RIGHT", -90, -110 );
        }

        self._id_1BB5.hindlegstraceoffset = 1;
        thread _id_4870();
    }

    if ( isdefined( var_0._id_4273 ) )
        self thread [[ var_0._id_4273 ]]();
}

_id_74DF()
{
    self._id_518E = 1;
    self notify( "reset" );

    for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
    {
        self.visuals[var_0].origin = self.visuals[var_0]._id_1315;
        self.visuals[var_0].angles = self.visuals[var_0]._id_1302;
        self.visuals[var_0] show();
    }

    self.trigger.origin = self.trigger._id_1315;
    self.curorigin = self.trigger.origin;

    if ( isdefined( self._id_64E0 ) )
        self [[ self._id_64E0 ]]();

    _id_1EE6();
    _id_9BA9();
    _id_9B09();
    self._id_518E = 0;
}

_id_511C()
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self.curorigin != self.trigger._id_1315 )
        return 0;

    return 1;
}

_id_7FF3( var_0, var_1 )
{
    self._id_518E = 1;

    for ( var_2 = 0; var_2 < self.visuals.size; var_2++ )
    {
        self.visuals[var_2].origin = var_0;
        self.visuals[var_2].angles = var_1;
        self.visuals[var_2] show();
    }

    self.trigger.origin = var_0;
    self.curorigin = self.trigger.origin;
    _id_1EE6();
    _id_9BA9();
    _id_9B09();
    self._id_518E = 0;
}

_id_64D4()
{
    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_1BB7( var_0 )
{
    for ( var_1 = 0; var_1 < var_0._id_1BB6.visuals.size; var_1++ )
        var_0._id_1BB6.visuals[var_1] unlink();

    var_0._id_1BB6.trigger unlink();
    var_0._id_1BB6 notify( "stop_pickup_timeout" );
    var_0._id_1BB6 _id_74DF();
}

_id_7F5D()
{
    if ( isdefined( self._id_7F5D ) )
    {
        if ( [[ self._id_7F5D ]]() )
            return;
    }

    self._id_518E = 1;
    self notify( "dropped" );

    if ( isdefined( self._id_1BAF ) && self._id_1BAF.team != "spectator" )
    {
        if ( isdefined( self._id_1BAF.body ) )
        {
            var_0 = playerphysicstrace( self._id_1BAF.origin + ( 0, 0, 20 ), self._id_1BAF.origin - ( 0, 0, 2000 ), self._id_1BAF.body );
            var_1 = bullettrace( self._id_1BAF.origin + ( 0, 0, 20 ), self._id_1BAF.origin - ( 0, 0, 2000 ), 0, self._id_1BAF.body );
        }
        else
        {
            var_0 = playerphysicstrace( self._id_1BAF.origin + ( 0, 0, 20 ), self._id_1BAF.origin - ( 0, 0, 2000 ) );
            var_1 = bullettrace( self._id_1BAF.origin + ( 0, 0, 20 ), self._id_1BAF.origin - ( 0, 0, 2000 ), 0 );
        }
    }
    else
    {
        var_0 = playerphysicstrace( self._id_77CC + ( 0, 0, 20 ), self._id_77CC - ( 0, 0, 20 ) );
        var_1 = bullettrace( self._id_77CC + ( 0, 0, 20 ), self._id_77CC - ( 0, 0, 20 ), 0, undefined );
    }

    var_2 = self._id_1BAF;

    if ( isdefined( var_0 ) )
    {
        var_3 = randomfloat( 360 );
        var_4 = var_0;

        if ( isdefined( self._id_9E9B ) )
            var_4 += self._id_9E9B;

        if ( var_1["fraction"] < 1 && distance( var_1["position"], var_0 ) < 10.0 )
        {
            var_5 = ( cos( var_3 ), sin( var_3 ), 0 );
            var_5 = vectornormalize( var_5 - var_1["normal"] * vectordot( var_5, var_1["normal"] ) );
            var_6 = vectortoangles( var_5 );
        }
        else
            var_6 = ( 0, var_3, 0 );

        for ( var_7 = 0; var_7 < self.visuals.size; var_7++ )
        {
            self.visuals[var_7].origin = var_4;
            self.visuals[var_7].angles = var_6;
            self.visuals[var_7] show();
        }

        self.trigger.origin = var_4;
        self.curorigin = self.trigger.origin;
        var_8 = spawnstruct();
        var_8._id_1BB6 = self;
        var_8._id_2663 = ::_id_1BB7;
        self.trigger thread maps\mp\_movers::_id_45BF( var_8 );
        thread _id_6817();
    }

    if ( !isdefined( var_0 ) )
    {
        for ( var_7 = 0; var_7 < self.visuals.size; var_7++ )
        {
            self.visuals[var_7].origin = self.visuals[var_7]._id_1315;
            self.visuals[var_7].angles = self.visuals[var_7]._id_1302;
            self.visuals[var_7] show();
        }

        self.trigger.origin = self.trigger._id_1315;
        self.curorigin = self.trigger._id_1315;
    }

    if ( isdefined( self._id_646F ) )
        self [[ self._id_646F ]]( var_2 );

    _id_1EE6();
    _id_9B09();
    _id_9BA9();
    self._id_518E = 0;
}

_id_7F34( var_0 )
{
    self._id_1BAF = var_0;
    thread _id_9B9F();
}

_id_1EE6()
{
    if ( !isdefined( self._id_1BAF ) )
        return;

    self._id_1BAF _id_912E( self );
    self._id_1BAF = undefined;
    self.curcarrierorigin = undefined;
    self notify( "carrier_cleared" );
}

_id_6817()
{
    self endon( "pickup_object" );
    self endon( "stop_pickup_timeout" );
    wait 0.05;

    if ( _id_51D7() )
    {
        _id_74DF();
        return;
    }

    if ( isdefined( self._id_1142 ) )
    {
        wait(self._id_1142);

        if ( !isdefined( self._id_1BAF ) )
            _id_74DF();
    }
}

_id_51D7()
{
    var_0 = getentarray( "out_of_bounds", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !self.visuals[0] istouching( var_0[var_1] ) )
            continue;

        return 1;
    }

    if ( !self.visuals[0] _meth_851d() )
    {
        var_0 = getentarray( "out_of_bounds_at_rest", "targetname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !self.visuals[0] istouching( var_0[var_1] ) )
                continue;

            return 1;
        }
    }

    var_2 = getentarray( "trigger_hurt", "classname" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
    {
        if ( !self.visuals[0] istouching( var_2[var_1] ) )
            continue;

        return 1;
    }

    if ( self._id_A296 )
    {
        var_3 = getentarray( "trigger_underwater", "targetname" );

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        {
            if ( !self.visuals[0] istouching( var_3[var_1] ) )
                continue;

            return 1;
        }
    }

    return 0;
}

_id_3F27( var_0 )
{
    if ( isdefined( var_0._id_1BB2 ) && self hasweapon( var_0._id_1BB2 ) )
        return var_0._id_1BB2;

    var_1 = self getweaponslistprimaries();
    return var_1[0];
}

_id_912E( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( self ) )
        self._id_1BB6 = undefined;

    self notify( "drop_object" );

    if ( var_0._id_981D == "proximity" )
        thread _id_6815( var_0.trigger.origin );

    if ( maps\mp\_utility::_id_5189( self ) )
    {
        if ( isdefined( var_0._id_1BBB ) )
        {
            var_1 = isdefined( var_0._id_52DC ) && var_0._id_52DC;

            if ( !var_0._id_1BB0 && !var_1 )
                self takeweapon( var_0._id_1BBB );

            var_2 = _id_3F27( var_0 );
            self switchtoweapon( var_2 );
            self enableweaponpickup();
            common_scripts\utility::_id_0596();
        }
        else if ( !var_0._id_0AB5 )
            common_scripts\utility::_id_0595();
    }
}

_id_94B8()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    while ( isdefined( self._id_1BB6 ) && maps\mp\_utility::_id_5189( self ) )
    {
        if ( self isonground() )
        {
            var_0 = bullettrace( self.origin + ( 0, 0, 20 ), self.origin - ( 0, 0, 20 ), 0, undefined );

            if ( var_0["fraction"] < 1 )
                self._id_1BB6._id_77CC = var_0["position"];
        }

        wait 0.05;
    }
}

_id_5976()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        while ( self attackbuttonpressed() || self fragbuttonpressed() || self secondaryoffhandbuttonpressed() || self meleebuttonpressed() )
            wait 0.05;

        while ( !self attackbuttonpressed() && !self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() && !self meleebuttonpressed() )
            wait 0.05;

        if ( isdefined( self._id_1BB6 ) && !self usebuttonpressed() )
            self._id_1BB6 thread _id_7F5D();
    }
}

_id_2874()
{
    if ( isdefined( self.teamobjids ) && isdefined( self._id_6306 ) )
    {
        maps\mp\_utility::_objective_delete( self.teamobjids );
        maps\mp\_utility::_objective_delete( self._id_6306 );
        maps\mp\_utility::_objective_delete( self._id_6309 );
    }

    if ( isdefined( self._id_6316 ) )
    {
        maps\mp\gametypes\_objpoints::deleteobjpoint( self._id_6316["allies"] );
        maps\mp\gametypes\_objpoints::deleteobjpoint( self._id_6316["axis"] );
        maps\mp\gametypes\_objpoints::deleteobjpoint( self._id_6316["mlg"] );
    }

    self.trigger = undefined;
    self notify( "deleted" );
}

createuseobject( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5.unlockpoints = "useObject";
    var_5.curorigin = var_1.origin;
    var_5._id_663A = var_0;
    var_5._id_331C = var_1 getentitynumber();
    var_5._id_52E7 = undefined;

    if ( issubstr( var_1.classname, "use" ) )
        var_5._id_981D = "use";
    else
        var_5._id_981D = "proximity";

    var_5.trigger = var_1;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_2[var_6]._id_1315 = var_2[var_6].origin;
        var_2[var_6]._id_1302 = var_2[var_6].angles;
    }

    var_5.visuals = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_5._id_637F = var_3;

    if ( !isdefined( var_4 ) || !var_4 )
    {
        var_5._id_20D0 = [];
        var_5.teamobjids = getnextobjid();
        var_5._id_6306 = getnextobjid();
        var_5._id_6309 = getnextobjid();
        objective_add( var_5.teamobjids, "invisible", var_5.curorigin );
        objective_add( var_5._id_6306, "invisible", var_5.curorigin );
        objective_add( var_5._id_6309, "invisible", var_5.curorigin );
        objective_team( var_5.teamobjids, "allies" );
        objective_team( var_5._id_6306, "axis" );
        objective_mlgspectator( var_5._id_6309 );
        var_5._id_6316["allies"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_allies_" + var_5._id_331C, var_5.curorigin + var_3, "allies", undefined );
        var_5._id_6316["axis"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_axis_" + var_5._id_331C, var_5.curorigin + var_3, "axis", undefined );
        var_5._id_6316["mlg"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_mlg_" + var_5._id_331C, var_5.curorigin + var_3, "mlg", undefined );
        var_5._id_6316["mlg"].archived = 0;
        var_5._id_6316["allies"].alpha = 0;
        var_5._id_6316["axis"].alpha = 0;
        var_5._id_6316["mlg"].alpha = 0;
    }

    var_5._id_4EA9 = "none";
    var_5._id_52E1 = 0;
    var_5.contesteduiprogress = 0;
    var_5._id_A350 = [];
    var_5._id_9E5B = "none";
    var_5.onuse = undefined;
    var_5._id_6459 = undefined;
    var_5._id_9C18 = "default";
    var_5._id_9C19 = 10000;
    var_5.curprogress = 0;

    if ( var_5._id_981D == "proximity" )
    {
        var_5._id_9207 = [];
        var_5._id_9206 = [];
        var_5._id_62AF["neutral"] = 0;
        var_5._id_62AF["axis"] = 0;
        var_5._id_62AF["allies"] = 0;
        var_5._id_62AF["none"] = 0;
        var_5._id_940D["neutral"] = [];
        var_5._id_940D["axis"] = [];
        var_5._id_940D["allies"] = [];
        var_5._id_940D["none"] = [];
        var_5.userate = 0;
        var_5._id_1E22 = "none";
        var_5._id_1E21 = undefined;
        var_5._id_5587 = "none";
        var_5._id_5588 = 0;
        var_5._id_600A = 0;
        var_5._id_1AC3 = 0;

        if ( level.multiteambased )
        {
            foreach ( var_8 in level.teamnamelist )
            {
                var_5._id_62AF[var_8] = 0;
                var_5._id_940D[var_8] = [];
            }
        }

        var_5 thread _id_9C0B();
    }
    else
    {
        var_5.userate = 1;
        var_5 thread _id_9C0C();
    }

    return var_5;
}

_id_5F3D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( isdefined( self.trigger ) )
    {
        self.trigger dontinterpolate();
        self.trigger.origin = var_0;
    }

    if ( isdefined( self.trigger._id_1315 ) )
        self.trigger._id_1315 = var_0;

    if ( isdefined( self._id_56D9 ) )
    {
        self._id_56D9 dontinterpolate();
        self._id_56D9.origin = var_0;
    }

    if ( isdefined( self.visuals ) )
    {
        foreach ( var_3 in self.visuals )
        {
            var_3 dontinterpolate();
            var_3.origin = var_0;
            var_3._id_1315 = var_0;
        }
    }

    if ( isdefined( self.origin ) )
        self.origin = var_0;

    if ( isdefined( self.curorigin ) )
        self.curorigin = var_0;

    if ( isdefined( self.goal ) )
    {
        if ( isdefined( self.goal._id_788C ) )
        {
            foreach ( var_6 in self.goal._id_788C )
                var_6.origin = var_0;
        }

        if ( isdefined( self.goal.origin ) )
            self.goal.origin = var_0;
    }

    if ( isdefined( self._id_6316 ) )
    {
        foreach ( var_9 in self._id_6316 )
            var_9 maps\mp\gametypes\_objpoints::_id_9B44( var_0 + var_1 );
    }

    if ( isdefined( self.teamobjids ) )
        objective_position( self.teamobjids, var_0 );

    if ( isdefined( self._id_6306 ) )
        objective_position( self._id_6306, var_0 );

    if ( isdefined( self._id_6309 ) )
        objective_position( self._id_6309, var_0 );

    if ( isdefined( self._id_1305 ) )
    {
        self._id_1305 delete();
        var_11 = self.visuals[0].origin + ( 0, 0, 32 );
        var_12 = self.visuals[0].origin + ( 0, 0, -32 );
        var_13 = bullettrace( var_11, var_12, 0, undefined );
        var_14 = vectortoangles( var_13["normal"] );
        self._id_1306 = anglestoforward( var_14 );
        self._id_1308 = anglestoright( var_14 );
        self._id_1307 = var_13["position"];

        if ( level.gametype == "dom" )
            maps\mp\gametypes\dom::_id_9BA1();
    }
}

_id_7F99( var_0 )
{
    self._id_52E7 = var_0;
}

_id_9C0C()
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0.pers["team"] ) )
            continue;

        if ( !var_0 isonground() )
            continue;

        if ( var_0 _meth_8514() )
            continue;

        var_1 = var_0 getcurrentprimaryweapon();

        if ( !var_0 maps\mp\_utility::_id_5131() && maps\mp\_utility::iskillstreakweapon( var_1 ) )
            continue;

        if ( isdefined( self.cantuseweapon ) && self.cantuseweapon == var_1 )
            continue;

        if ( !_id_1D11( var_0 ) )
        {
            if ( isdefined( self._id_6459 ) )
                self [[ self._id_6459 ]]( var_0 );

            continue;
        }

        if ( isdefined( var_0._id_A2F4 ) && var_0._id_A2F4 == "h1_claymore_mp" )
            continue;

        if ( !var_0 common_scripts\utility::_id_5207() )
            continue;

        var_2 = 1;

        if ( self._id_9C19 > 0 )
        {
            if ( isdefined( self._id_6454 ) )
                self [[ self._id_6454 ]]( var_0 );

            if ( !isdefined( self._id_52E7 ) )
                thread _id_1AF7();

            var_3 = var_0.pers["team"];
            var_2 = _id_9C02( var_0 );
            self notify( "finished_use" );

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( var_3, var_0, var_2 );
        }

        if ( !var_2 )
            continue;

        if ( isdefined( self.onuse ) )
            self [[ self.onuse ]]( var_0 );
    }
}

_id_1D11( var_0 )
{
    if ( !isdefined( self._id_52E7 ) )
        return 1;

    if ( !isdefined( var_0._id_1BB6 ) )
        return 0;

    var_1 = self._id_52E7;

    if ( !isarray( var_1 ) )
        var_1 = [ var_1 ];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0._id_1BB6 )
            return 1;
    }

    return 0;
}

_id_1AF7()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self endon( "finished_use" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0.pers["team"] ) )
            continue;

        if ( isdefined( self._id_6459 ) )
            self [[ self._id_6459 ]]( var_0 );
    }
}

_id_3F79()
{
    var_0 = self._id_1E22;

    if ( maps\mp\_utility::_id_5189( self._id_1E21 ) )
        var_1 = self._id_1E21;
    else
        var_1 = undefined;

    if ( self._id_940D[var_0].size > 0 )
    {
        var_2 = undefined;
        var_3 = getarraykeys( self._id_940D[var_0] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = self._id_940D[var_0][var_3[var_4]];

            if ( maps\mp\_utility::_id_5189( var_5.playercardbackground ) && ( !isdefined( var_2 ) || var_5._id_8D41 < var_2 ) )
            {
                var_1 = var_5.playercardbackground;
                var_2 = var_5._id_8D41;
            }
        }
    }

    return var_1;
}

_id_9C0B()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    thread _id_7044();

    for (;;)
    {
        waitframe;

        if ( self._id_9C19 && self.curprogress >= self._id_9C19 )
        {
            self.curprogress = 0;
            var_0 = _id_3F79();

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( _id_3F30(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) && isdefined( self.onuse ) )
                self [[ self.onuse ]]( var_0 );

            if ( !self._id_600A )
            {
                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C19 && ( !self._id_600A || _id_4078() != _id_3F30() ) )
            {
                if ( !self._id_62AF[self._id_1E22] )
                {
                    if ( isdefined( self._id_648E ) )
                        self [[ self._id_648E ]]( _id_3F30(), self._id_1E21, 0 );

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self.curprogress += 50 * self.userate;

                    if ( self.curprogress <= 0 )
                    {
                        self.curprogress *= -1;
                        self._id_5587 = self._id_1E22;
                        _id_9B97();
                    }

                    if ( isdefined( self._id_64FC ) )
                        self [[ self._id_64FC ]]( _id_3F30(), self.curprogress / self._id_9C19, 50 * self.userate / self._id_9C19 );
                }
            }
            else if ( !self._id_600A )
            {
                if ( isdefined( self.onuse ) )
                    self [[ self.onuse ]]( self._id_1E21 );

                if ( !self._id_600A )
                {
                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
            }
            else if ( !self._id_62AF[self._id_1E22] )
            {
                if ( isdefined( self._id_64F6 ) )
                    self [[ self._id_64F6 ]]();

                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
            else if ( self._id_1AC3 )
            {
                var_1 = _id_4059( self._id_1E22 );

                if ( var_1 > 0 )
                {
                    if ( isdefined( self._id_6462 ) )
                        self [[ self._id_6462 ]]();

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
            }
        }
        else if ( self._id_600A && _id_4078() != "none" )
        {
            if ( !self._id_62AF[_id_4078()] )
            {
                if ( isdefined( self._id_64F6 ) )
                    self [[ self._id_64F6 ]]();
            }
            else if ( self._id_1AC3 && self._id_5587 != "none" && self._id_62AF[self._id_5587] )
            {
                var_1 = _id_4059( self._id_5587 );

                if ( var_1 == 0 )
                {
                    if ( isdefined( self._id_64F4 ) )
                        self [[ self._id_64F4 ]]( self._id_5587 );
                }
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_1AC0( var_0 )
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1AC3 )
    {
        var_1 = _id_4059( var_0.pers["team"] );

        if ( var_1 != 0 )
            return 0;
    }

    if ( _id_1D11( var_0 ) )
        return 1;

    return 0;
}

_id_7044()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    var_0 = self._id_331C;

    for (;;)
    {
        self.trigger waittill( "trigger", var_1 );

        if ( !maps\mp\_utility::_id_5189( var_1 ) )
            continue;

        if ( !maps\mp\_utility::_id_5112( var_1 ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_1 maps\mp\_utility::_id_51E3() || isdefined( var_1._id_89E5 ) || var_1 maps\mp\_utility::_id_512B() )
            continue;

        if ( isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            continue;

        if ( !isdefined( var_1._id_4DDF ) )
            continue;

        if ( isdefined( self._id_60E0 ) && self._id_60E0 > gettime() )
            continue;

        if ( isdefined( self._id_1AFB ) && ![[ self._id_1AFB ]]( var_1 ) )
            continue;

        if ( _id_1ACA( var_1.pers["team"], var_1 ) && self._id_1E22 == "none" )
        {
            if ( _id_1AC0( var_1 ) )
            {
                if ( !_id_7043( var_1, self.visuals ) )
                    continue;

                _id_7F3A( var_1.pers["team"] );
                self._id_1E21 = var_1;
                var_2 = _id_40B5( var_1.pers["team"] );

                if ( isdefined( self._id_9207[var_2] ) )
                    self._id_9C19 = self._id_9207[var_2];

                if ( self._id_9C19 && isdefined( self._id_6454 ) )
                    self [[ self._id_6454 ]]( self._id_1E21 );
            }
            else if ( isdefined( self._id_6459 ) )
                self [[ self._id_6459 ]]( var_1 );
        }

        if ( maps\mp\_utility::_id_5189( var_1 ) && !isdefined( var_1._id_940F[var_0] ) )
            var_1 thread _id_981C( self );
    }
}

_id_7043( var_0, var_1 )
{
    if ( !isdefined( self._id_740F ) || !self._id_740F )
        return 1;

    var_2 = [ 32, 16, 0 ];
    var_3 = undefined;

    if ( isdefined( var_1 ) && var_1.size )
    {
        if ( var_1.size > 1 )
        {

        }

        var_3 = var_1[0];
    }

    var_4 = var_0.origin - self.trigger.origin;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_4 = vectornormalize( var_4 );
    var_4 *= 5;

    foreach ( var_6 in var_2 )
    {
        var_7 = var_0 geteye();
        var_8 = self.trigger.origin + var_4 + ( 0, 0, var_6 );
        var_9 = bullettrace( var_7, var_8, 0, var_3, 0, 0, 0, 0, 1, 0, 0 );

        if ( var_9["fraction"] == 1 )
            return 1;
    }

    return 0;
}

_id_7F3A( var_0 )
{
    if ( self._id_52E1 )
    {
        if ( self._id_5587 == "none" )
            self._id_5587 = var_0;

        self._id_1E22 = var_0;
    }
    else
    {
        if ( self._id_1E22 == "none" && gettime() - self._id_5588 > 1000 )
            self.curprogress = 0;
        else if ( var_0 != "none" && var_0 != self._id_5587 )
            self.curprogress = 0;

        self._id_5587 = self._id_1E22;
    }

    self._id_5588 = gettime();
    self._id_1E22 = var_0;
    _id_9B97();
}

_id_3F30()
{
    return self._id_1E22;
}

_id_981C( var_0 )
{
    if ( isdefined( level.ishorde ) && level.ishorde )
    {
        level endon( "game_ended" );
        var_0 endon( "deleted" );
    }

    var_1 = self.pers["team"];
    var_0 _setnumtouching( var_1, var_0._id_62AF[var_1] + 1 );
    var_2 = self.guid;
    var_3 = spawnstruct();
    var_3.playercardbackground = self;
    var_3._id_8D41 = gettime();
    var_0._id_940D[var_1][var_2] = var_3;

    if ( !isdefined( var_0._id_6242 ) )
        var_0._id_6242 = 0;

    self._id_940F[var_0._id_331C] = var_0.trigger;
    var_0 _id_9B97();

    while ( maps\mp\_utility::_id_5189( self ) && isdefined( var_0.trigger ) && ( self istouching( var_0.trigger ) || _id_50CA( var_0.trigger ) ) && !level.gameended )
    {
        if ( isplayer( self ) && var_0._id_9C19 )
        {
            _id_9B94( var_0, 1 );
            _id_9B51( var_0, 0 );
        }

        wait 0.05;
    }

    if ( isdefined( self ) && isdefined( self._id_940F ) )
    {
        if ( isplayer( self ) && var_0._id_9C19 )
        {
            _id_9B94( var_0, 0 );
            _id_9B51( var_0, 1 );
        }

        self._id_940F[var_0._id_331C] = undefined;
    }

    if ( level.gameended )
        return;

    var_0._id_940D[var_1][var_2] = undefined;
    var_0 _setnumtouching( var_1, var_0._id_62AF[var_1] - 1 );
    var_0 _id_9B97();
}

_setnumtouching( var_0, var_1 )
{
    var_2 = self._id_62AF[var_0];
    self._id_62AF[var_0] = var_1;

    if ( isdefined( self.onnumtouchingchanged ) )
        [[ self.onnumtouchingchanged ]]( var_0, var_2, var_1 );
}

_id_50CA( var_0 )
{
    if ( !isdefined( level._id_0AA0 ) || !level._id_0AA0 )
        return 0;

    if ( !maps\mp\_utility::_id_50C4() )
        return 0;

    if ( !self _meth_83b2() )
        return 0;

    var_1 = distance2dsquared( self.origin, var_0.origin );

    if ( var_1 < var_0.rank * var_0.rank )
        return 1;

    return 0;
}

_id_9B51( var_0, var_1 )
{
    var_2 = self.pers["team"];

    if ( var_1 || !var_0 _id_1ACA( var_2 ) || var_2 != var_0._id_1E22 || var_0._id_6242 )
    {
        if ( isdefined( self._id_7041 ) )
            self._id_7041 maps\mp\gametypes\_hud_util::_id_4871();

        if ( isdefined( self._id_7042 ) )
            self._id_7042 maps\mp\gametypes\_hud_util::_id_4871();

        return;
    }

    if ( !isdefined( self._id_7041 ) )
    {
        self._id_7041 = maps\mp\gametypes\_hud_util::_id_2435();
        self._id_7041._id_560B = undefined;
        self._id_7041._id_55AC = 0;
    }

    if ( self._id_7041._id_483E )
    {
        self._id_7041 maps\mp\gametypes\_hud_util::_id_850A();
        self._id_7041._id_560B = undefined;
        self._id_7041._id_55AC = 0;
    }

    if ( !isdefined( self._id_7042 ) )
    {
        self._id_7042 = maps\mp\gametypes\_hud_util::_id_2436();
        var_3 = var_0 _id_40B5( var_2 );

        if ( isdefined( var_0._id_9206[var_3] ) )
            self._id_7042 settext( var_0._id_9206[var_3] );
        else
            self._id_7042 settext( var_0._id_9C18 );
    }

    if ( self._id_7042._id_483E )
    {
        self._id_7042 maps\mp\gametypes\_hud_util::_id_850A();
        var_3 = var_0 _id_40B5( var_2 );

        if ( isdefined( var_0._id_9206[var_3] ) )
            self._id_7042 settext( var_0._id_9206[var_3] );
        else
            self._id_7042 settext( var_0._id_9C18 );
    }

    if ( !isdefined( self._id_7041._id_560B ) || self._id_7041._id_560B != var_0.userate || self._id_7041._id_55AC != isdefined( level._id_4A39 ) )
    {
        if ( var_0.curprogress > var_0._id_9C19 )
            var_0.curprogress = var_0._id_9C19;

        var_4 = var_0.curprogress / var_0._id_9C19;
        var_5 = 1000 / var_0._id_9C19 * var_0.userate;

        if ( isdefined( level._id_4A39 ) )
            var_5 = 0;

        if ( var_0._id_52E1 && !var_4 && var_5 < 0 )
            var_5 = 0;

        self._id_7041 maps\mp\gametypes\_hud_util::_id_9AF7( var_4, var_5 );
        self._id_7041._id_560B = var_0.userate;
        self._id_7041._id_55AC = isdefined( level._id_4A39 );
    }
}

_id_4059( var_0 )
{
    return self._id_62AF[maps\mp\_utility::getotherteam( var_0 )];
}

_id_9B94( var_0, var_1 )
{
    var_2 = level.gametype;
    var_3 = var_0._id_4B53;
    var_4 = 0;

    if ( !isdefined( level._id_4A39 ) )
    {
        if ( var_0.curprogress > var_0._id_9C19 )
            var_0.curprogress = var_0._id_9C19;

        var_5 = var_0.curprogress / var_0._id_9C19;

        if ( var_0.contesteduiprogress )
        {
            if ( var_1 && isdefined( var_0._id_8AF1 ) && var_0._id_8AF1 )
            {
                var_6 = var_0 _id_3F79();
                var_4 = 1;

                if ( isdefined( var_6 ) && var_6.team != self.team )
                    var_5 = 0.01;
            }

            if ( !var_1 || var_0._id_1E22 != self.team )
                var_5 = 0.01;

            if ( var_5 != 0 )
                self setclientomnvar( "ui_capture_progress", var_5 );
        }

        if ( ( var_2 == "sd" || var_2 == "sr" || var_2 == "sab" || var_2 == "dd" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
        {
            if ( !var_1 )
                var_5 = 0;

            var_5 = max( 0.01, var_5 );

            if ( var_5 != 0 )
                self setclientomnvar( "ui_capture_progress", var_5 );
        }
    }

    if ( var_0.contesteduiprogress )
    {
        if ( var_1 && var_0._id_663A == self.team )
            var_1 = 0;

        if ( !var_1 )
            self setclientomnvar( "ui_capture_icon", 0 );
        else if ( !var_4 )
        {
            if ( var_2 == "dom" )
                self setclientomnvar( "ui_capture_icon", 1 );
            else if ( var_0._id_663A == "neutral" || maps\mp\_utility::_id_5092( level.captureinsteadofdestroy ) )
                self setclientomnvar( "ui_capture_icon", 2 );
            else
                self setclientomnvar( "ui_capture_icon", 3 );
        }
        else
            self setclientomnvar( "ui_capture_icon", 4 );
    }

    if ( ( var_2 == "sd" || var_2 == "sr" || var_2 == "sab" || var_2 == "dd" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
    {
        if ( !var_1 )
            self setclientomnvar( "ui_capture_icon", 0 );
        else if ( var_0 _id_510F( self.pers["team"] ) )
            self setclientomnvar( "ui_capture_icon", 6 );
        else
            self setclientomnvar( "ui_capture_icon", 5 );
    }
}

_id_9B97()
{
    if ( isdefined( self._id_64F7 ) )
        self [[ self._id_64F7 ]]();
    else
        _id_9B98();
}

_id_9B98()
{
    var_0 = self._id_62AF[self._id_1E22];
    var_1 = 0;
    var_2 = 0;

    if ( level.multiteambased )
    {
        foreach ( var_4 in level.teamnamelist )
        {
            if ( self._id_1E22 != var_4 )
                var_1 += self._id_62AF[var_4];
        }
    }
    else
    {
        if ( self._id_1E22 != "axis" )
            var_1 += self._id_62AF["axis"];

        if ( self._id_1E22 != "allies" )
            var_1 += self._id_62AF["allies"];
    }

    foreach ( var_7 in self._id_940D[self._id_1E22] )
    {
        if ( !isdefined( var_7.playercardbackground ) )
            continue;

        if ( var_7.playercardbackground.pers["team"] != self._id_1E22 )
            continue;

        if ( var_7.playercardbackground.objectivescaler == 1 )
            continue;

        var_0 *= var_7.playercardbackground.objectivescaler;
        var_2 = var_7.playercardbackground.objectivescaler;
    }

    self.userate = 0;
    self._id_8AF1 = var_0 && var_1;

    if ( var_0 && !var_1 )
        self.userate = min( var_0, 4 );

    if ( isdefined( self._id_50BB ) && self._id_50BB && var_2 != 0 )
        self.userate = 1 * var_2;
    else if ( isdefined( self._id_50BB ) && self._id_50BB )
        self.userate = 1;

    if ( self._id_52E1 && self._id_5587 != self._id_1E22 )
        self.userate *= -1;
}

_id_0E0B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "done_using" );
    wait 0.7;
    self attach( "wpn_h1_briefcase_bomb_npc", "tag_inhand", 1 );
    self._id_0DF9 = "wpn_h1_briefcase_bomb_npc";
}

_id_9C02( var_0 )
{
    var_0 notify( "use_hold" );

    if ( isplayer( var_0 ) )
        var_0 playerlinkto( self.trigger );
    else
        var_0 linkto( self.trigger );

    var_0 playerlinkedoffsetenable();
    var_0 clientclaimtrigger( self.trigger );
    var_0._id_1E23 = self.trigger;
    var_1 = self._id_9C1C;
    var_2 = var_0 getcurrentweapon();

    if ( isdefined( var_1 ) )
    {
        if ( var_2 == var_1 )
            var_2 = var_0._id_55C6;

        var_0._id_55C6 = var_2;
        var_0 maps\mp\_utility::_id_05C0( var_1 );
        var_0 setweaponammostock( var_1, 0 );
        var_0 setweaponammoclip( var_1, 0 );
        var_0 switchtoweapon( var_1 );

        if ( !isdefined( self.attachdefault3pmodel ) || self.attachdefault3pmodel == 1 )
            var_0 thread _id_0E0B();
    }
    else
        var_0 common_scripts\utility::_id_0587();

    self.curprogress = 0;
    self.isradarblocked = 1;
    self.userate = 0;

    if ( isplayer( var_0 ) )
        var_0 thread _id_67E5( self );

    var_3 = _id_9C04( var_0, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_0 _id_2984();
        var_0 notify( "done_using" );
    }

    if ( isdefined( var_1 ) && isdefined( var_0 ) )
        var_0 thread _id_9131( var_1 );

    if ( isdefined( var_3 ) && var_3 )
        return 1;

    if ( isdefined( var_0 ) )
    {
        var_0._id_1E23 = undefined;

        if ( isdefined( var_1 ) )
        {
            if ( var_2 != "none" )
                var_0 maps\mp\_utility::_id_907A( var_2 );
            else
                var_0 takeweapon( var_1 );
        }
        else
            var_0 common_scripts\utility::_id_0595();

        var_0 unlink();

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            var_0._id_535F = 1;
    }

    self.isradarblocked = 0;
    self.trigger releaseclaimedtrigger();
    return 0;
}

_id_2984()
{
    if ( isdefined( self._id_0DF9 ) )
    {
        self detach( self._id_0DF9, "tag_inhand" );
        self._id_0DF9 = undefined;
    }
}

_id_9131( var_0 )
{
    self endon( "use_hold" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( self getcurrentweapon() == var_0 && !isdefined( self.throwinggrenade ) )
        wait 0.05;

    self takeweapon( var_0 );
}

_id_9C17( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::_id_5189( var_0 ) )
        return 0;

    if ( !var_0 istouching( self.trigger ) )
        return 0;

    if ( !var_0 usebuttonpressed() )
        return 0;

    if ( isdefined( var_0.throwinggrenade ) )
        return 0;

    if ( var_0 meleebuttonpressed() )
        return 0;

    if ( self.curprogress >= self._id_9C19 )
        return 0;

    if ( !self.userate && !var_1 )
        return 0;

    if ( var_1 && var_2 > var_3 )
        return 0;

    return 1;
}

_id_9C04( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disabled" );
    var_2 = self._id_9C1C;
    var_3 = 1;
    var_4 = 0;
    var_5 = 1.5;

    while ( _id_9C17( var_0, var_3, var_4, var_5 ) )
    {
        var_4 += 0.05;

        if ( !isdefined( var_2 ) || var_0 getcurrentweapon() == var_2 )
        {
            self.curprogress += 50 * self.userate;
            self.userate = 1 * var_0.objectivescaler;
            var_3 = 0;
        }
        else
            self.userate = 0;

        if ( self.curprogress >= self._id_9C19 )
        {
            self.isradarblocked = 0;
            var_0 clientreleasetrigger( self.trigger );
            var_0._id_1E23 = undefined;

            if ( isdefined( var_2 ) )
            {
                var_0 setweaponammostock( var_2, 1 );
                var_0 setweaponammoclip( var_2, 1 );

                if ( var_1 != "none" )
                    var_0 maps\mp\_utility::_id_907A( var_1 );
                else
                    var_0 takeweapon( var_2 );
            }
            else
                var_0 common_scripts\utility::_id_0595();

            var_0 unlink();
            return maps\mp\_utility::_id_5189( var_0 );
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }

    return 0;
}

_id_67E5( var_0 )
{
    self endon( "disconnect" );
    var_1 = undefined;

    if ( !isdefined( var_0._id_6242 ) || !var_0._id_6242 )
        var_1 = maps\mp\gametypes\_hud_util::_id_2435();

    var_2 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_0._id_9C18 ) )
    {
        var_2 = maps\mp\gametypes\_hud_util::_id_2436();
        var_2 settext( var_0._id_9C18 );
    }

    var_3 = -1;
    var_4 = isdefined( level._id_4A39 );

    while ( maps\mp\_utility::_id_5189( self ) && var_0.isradarblocked && !level.gameended )
    {
        if ( var_3 != var_0.userate || var_4 != isdefined( level._id_4A39 ) )
        {
            if ( var_0.curprogress > var_0._id_9C19 )
                var_0.curprogress = var_0._id_9C19;

            var_5 = var_0.curprogress / var_0._id_9C19;
            var_6 = 1000 / var_0._id_9C19 * var_0.userate;

            if ( isdefined( level._id_4A39 ) )
                var_6 = 0;

            if ( isdefined( var_1 ) )
            {
                var_1 maps\mp\gametypes\_hud_util::_id_9AF7( var_5, var_6 );

                if ( !var_0.userate )
                {
                    var_1 maps\mp\gametypes\_hud_util::_id_4871();

                    if ( isdefined( var_2 ) )
                        var_2 maps\mp\gametypes\_hud_util::_id_4871();
                }
                else
                {
                    var_1 maps\mp\gametypes\_hud_util::_id_850A();

                    if ( isdefined( var_2 ) )
                        var_2 maps\mp\gametypes\_hud_util::_id_850A();
                }
            }
        }

        var_3 = var_0.userate;
        var_4 = isdefined( level._id_4A39 );
        _id_9B94( var_0, 1 );
        wait 0.05;
    }

    _id_9B94( var_0, 0 );

    if ( isdefined( var_1 ) )
        var_1 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( var_2 ) )
        var_2 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_9B8F()
{
    if ( self._id_981D != "use" )
        return;

    if ( self._id_4EA9 == "none" )
        self.trigger.origin -= ( 0, 0, 50000 );
    else if ( self._id_4EA9 == "any" )
    {
        self.trigger.origin = self.curorigin;
        self.trigger setteamfortrigger( "none" );
    }
    else if ( self._id_4EA9 == "friendly" )
    {
        self.trigger.origin = self.curorigin;

        if ( self._id_663A == "allies" )
            self.trigger setteamfortrigger( "allies" );
        else if ( self._id_663A == "axis" )
            self.trigger setteamfortrigger( "axis" );
        else
            self.trigger.origin -= ( 0, 0, 50000 );
    }
    else if ( self._id_4EA9 == "enemy" )
    {
        self.trigger.origin = self.curorigin;

        if ( self._id_663A == "allies" )
            self.trigger setteamfortrigger( "axis" );
        else if ( self._id_663A == "axis" )
            self.trigger setteamfortrigger( "allies" );
        else
            self.trigger setteamfortrigger( "none" );
    }
}

_id_9BA9()
{
    if ( self._id_9E5B == "any" )
    {
        _id_9BA8( "friendly", 1 );
        _id_9BA8( "enemy", 1 );
    }
    else if ( self._id_9E5B == "friendly" )
    {
        _id_9BA8( "friendly", 1 );
        _id_9BA8( "enemy", 0 );
    }
    else if ( self._id_9E5B == "enemy" )
    {
        _id_9BA8( "friendly", 0 );
        _id_9BA8( "enemy", 1 );
    }
    else
    {
        _id_9BA8( "friendly", 0 );
        _id_9BA8( "enemy", 0 );
    }

    _id_9BA8( "mlg", 1 );
}

_id_9BA8( var_0, var_1 )
{
    if ( !isdefined( self._id_A350[var_0] ) )
        var_1 = 0;

    var_2 = _id_4149( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = "objpoint_" + var_2[var_3] + "_" + self._id_331C;
        var_5 = maps\mp\gametypes\_objpoints::_id_405E( var_4 );

        if ( !isdefined( var_5 ) )
            continue;

        var_5 notify( "stop_flashing_thread" );
        var_5 thread maps\mp\gametypes\_objpoints::_id_8EE6();

        if ( var_1 )
        {
            var_5 setshader( self._id_A350[var_0], level._id_6318, level._id_6318 );
            var_5 fadeovertime( 0.05 );
            var_5.alpha = var_5._id_1301;
            var_5._id_51A5 = 1;

            if ( isdefined( self._id_20D0[var_0] ) )
                var_5 setwaypoint( 1, 1 );
            else
                var_5 setwaypoint( 1, 0 );

            if ( self.unlockpoints == "carryObject" )
            {
                if ( isdefined( self._id_1BAF ) && !_id_84A1( var_0 ) )
                    var_5 settargetent( self._id_1BAF );
                else if ( !isdefined( self._id_1BAF ) && isdefined( self._id_6300 ) && self._id_6300 )
                    var_5 settargetent( self.visuals[0] );
                else
                    var_5 cleartargetent();
            }
        }
        else
        {
            var_5 fadeovertime( 0.05 );
            var_5.alpha = 0;
            var_5._id_51A5 = 0;
            var_5 cleartargetent();
        }

        var_5 thread _id_4883();
    }
}

_id_4883()
{
    self notify( "hideWorldIconOnGameEnd" );
    self endon( "hideWorldIconOnGameEnd" );
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self.alpha = 0;
}

_id_9B8A( var_0, var_1 )
{

}

_id_9B09()
{
    if ( self._id_9E5B == "any" )
    {
        _id_9B08( "friendly", 1 );
        _id_9B08( "enemy", 1 );
    }
    else if ( self._id_9E5B == "friendly" )
    {
        _id_9B08( "friendly", 1 );
        _id_9B08( "enemy", 0 );
    }
    else if ( self._id_9E5B == "enemy" )
    {
        _id_9B08( "friendly", 0 );
        _id_9B08( "enemy", 1 );
    }
    else
    {
        _id_9B08( "friendly", 0 );
        _id_9B08( "enemy", 0 );
    }

    _id_9B08( "mlg", 1 );
}

_id_9B08( var_0, var_1 )
{
    if ( !isdefined( self._id_20D0 ) )
        return;

    var_2 = _id_4149( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_1;

        if ( !var_4 && _id_84AA( var_2[var_3] ) )
            var_4 = 1;

        var_5 = self.teamobjids;

        if ( var_2[var_3] == "axis" )
            var_5 = self._id_6306;

        if ( var_2[var_3] == "mlg" )
            var_5 = self._id_6309;

        if ( !isdefined( self._id_20D0[var_0] ) || !var_4 )
        {
            objective_state( var_5, "invisible" );
            continue;
        }

        objective_icon( var_5, self._id_20D0[var_0] );
        objective_state( var_5, "active" );

        if ( self.unlockpoints == "carryObject" )
        {
            if ( maps\mp\_utility::_id_5189( self._id_1BAF ) && !_id_84A1( var_0 ) )
            {
                objective_onentity( var_5, self._id_1BAF );
                continue;
            }

            if ( isdefined( self._id_6300 ) && self._id_6300 )
            {
                objective_onentity( var_5, self.visuals[0] );
                continue;
            }

            objective_position( var_5, self.curorigin );
        }
    }
}

_id_84A1( var_0 )
{
    if ( var_0 == "friendly" && self._id_630B )
        return 1;
    else if ( var_0 == "enemy" && self._id_630A )
        return 1;

    return 0;
}

_id_4149( var_0 )
{
    var_1 = [];

    if ( var_0 == "friendly" )
    {
        if ( _id_510F( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( _id_510F( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "enemy" )
    {
        if ( !_id_510F( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( !_id_510F( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "mlg" )
        var_1[var_1.size] = "mlg";

    return var_1;
}

_id_84AA( var_0 )
{
    if ( var_0 == "mlg" )
        return 0;

    if ( !isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1BAF maps\mp\_utility::_hasperk( "specialty_radarimmune" ) )
        return 0;

    return getteamradar( var_0 );
}

_id_9B9F()
{
    self endon( "death" );
    self endon( "carrier_cleared" );

    for (;;)
    {
        level waittill( "radar_status_change" );
        _id_9B09();
    }
}

_id_7FDA( var_0 )
{
    self._id_663A = var_0;
    _id_9B8F();
    _id_9B09();
    _id_9BA9();
}

_id_4078()
{
    return self._id_663A;
}

setusetime( var_0 )
{
    self._id_9C19 = int( var_0 * 1000 );
}

_id_834B( var_0 )
{
    self._id_9C18 = var_0;
}

_id_802E( var_0, var_1 )
{
    self._id_9207[var_0] = int( var_1 * 1000 );
}

_id_802D( var_0, var_1 )
{
    self._id_9206[var_0] = var_1;
}

_id_834A( var_0 )
{
    self.trigger sethintstring( var_0 );
}

_id_0AA1( var_0 )
{
    self._id_4EA9 = var_0;
}

allowuse( var_0 )
{
    self._id_4EA9 = var_0;
    _id_9B8F();
}

_id_8352( var_0 )
{
    self._id_9E5B = var_0;
    _id_9B09();
    _id_9BA9();
}

_id_7FB5( var_0 )
{
    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] show();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                foreach ( var_3 in level.players )
                {
                    if ( var_3 istouching( self.visuals[var_1] ) )
                        var_3 maps\mp\_utility::_id_066F();
                }

                self.visuals[var_1] thread _id_5948();
            }
        }
    }
    else
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] hide();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                self.visuals[var_1] notify( "changing_solidness" );
                self.visuals[var_1] notsolid();
            }
        }
    }
}

_id_5948()
{
    self endon( "death" );
    self notify( "changing_solidness" );
    self endon( "changing_solidness" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            if ( level.players[var_0] istouching( self ) )
                break;
        }

        if ( var_0 == level.players.size )
        {
            self solid();
            break;
        }

        wait 0.05;
    }
}

_id_7F35( var_0 )
{
    self._id_1BB1 = var_0;
}

_id_7F32( var_0 )
{
    self._id_9C16 = var_0;
}

_id_7F12( var_0, var_1 )
{
    self._id_20D0[var_0] = var_1;
    _id_9B09();
}

_id_7F13( var_0, var_1 )
{
    self._id_A350[var_0] = var_1;
    _id_9BA9();
}

_id_7F14( var_0, var_1 )
{
    self._id_A352[var_0] = var_1;
}

_id_7F36( var_0 )
{
    self._id_1BB5 = var_0;
}

_id_2B1E()
{
    self notify( "disabled" );

    if ( self.unlockpoints == "carryObject" )
    {
        if ( isdefined( self._id_1BAF ) )
            self._id_1BAF _id_912E( self );

        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] hide();
    }

    self.trigger common_scripts\utility::_id_97CC();
    _id_8352( "none" );
}

_id_3114()
{
    if ( self.unlockpoints == "carryObject" )
    {
        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] show();
    }

    self.trigger common_scripts\utility::_id_97CE();
    _id_8352( "any" );
}

_id_40B5( var_0 )
{
    if ( var_0 == self._id_663A )
        return "friendly";
    else
        return "enemy";
}

_id_510F( var_0 )
{
    var_1 = _id_3F30();

    if ( isdefined( var_1 ) && self._id_663A == "neutral" && var_1 != "none" && var_1 != var_0 )
        return 1;

    if ( self._id_663A == "any" )
        return 1;

    if ( self._id_663A == var_0 )
        return 1;

    return 0;
}

_id_1ACA( var_0, var_1 )
{
    switch ( self._id_4EA9 )
    {
        case "none":
            return 0;
        case "any":
            return 1;
        case "friendly":
            if ( var_0 == self._id_663A )
                return 1;
            else
                return 0;
        case "enemy":
            if ( var_0 != self._id_663A )
                return 1;
            else
                return 0;
        default:
            return 0;
    }
}

_id_51CB( var_0 )
{
    if ( var_0 == "neutral" )
        return 1;

    if ( var_0 == "allies" )
        return 1;

    if ( var_0 == "axis" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    foreach ( var_2 in level.teamnamelist )
    {
        if ( var_0 == var_2 )
            return 1;
    }

    return 0;
}

_id_518B( var_0 )
{
    if ( var_0 == "friendly" )
        return 1;

    if ( var_0 == "enemy" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

_id_3F81( var_0 )
{
    if ( level.multiteambased )
    {

    }

    if ( var_0 == "neutral" )
        return "none";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "allies";
}

getnextobjid()
{
    if ( !isdefined( level._id_7266 ) || level._id_7266.size < 1 )
    {
        var_0 = level._id_62A2;
        level._id_62A2++;
    }
    else
    {
        var_0 = level._id_7266[level._id_7266.size - 1];
        level._id_7266[level._id_7266.size - 1] = undefined;
    }

    if ( var_0 > 35 )
    {
        if ( isdefined( level.ishorde ) && level.ishorde )
        {

        }

        var_0 = 35;
    }

    return var_0;
}

_id_3FFA()
{
    var_0 = self.trigger.script_model;

    if ( !isdefined( var_0 ) )
    {
        var_0 = "";
        return var_0;
    }

    if ( var_0[0] != "_" )
        return "_" + var_0;

    return var_0;
}

initializetagpathvariables()
{
    self._id_6071 = undefined;
    self._id_19DB = 0;
    self._id_6445 = undefined;
}

_id_600A( var_0 )
{
    self._id_600A = var_0;
}

_id_1AC3( var_0 )
{
    self._id_1AC3 = var_0;
}

_id_3645()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 120;
    var_1 = randomintrange( 30, 90 );
    var_0 += var_1;
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    self waittill( "show_loot_notification" );
}
