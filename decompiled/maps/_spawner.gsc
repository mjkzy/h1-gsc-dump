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
    precachemodel( "grenade_bag" );
    createthreatbiasgroup( "allies" );
    createthreatbiasgroup( "axis" );
    createthreatbiasgroup( "team3" );
    createthreatbiasgroup( "civilian" );
    maps\_anim::_id_0807( "generic", "rappel_pushoff_initial_npc", maps\_utility::_id_3098 );
    maps\_anim::_id_0807( "generic", "ps_rappel_pushoff_initial_npc", maps\_utility::_id_3098 );
    maps\_anim::_id_0807( "generic", "feet_on_ground", maps\_utility::_id_2A73 );
    maps\_anim::_id_0807( "generic", "ps_rappel_clipout_npc", maps\_utility::_id_2A73 );

    foreach ( var_1 in level.players )
        var_1 setthreatbiasgroup( "allies" );

    level._id_05FE = 0;
    level._id_054A = [];
    level._id_535B = 0;
    level._id_36A2 = 0;
    level._id_5CDE = 0;
    level._id_3C5D = [];
    level._id_8683 = [];

    if ( !isdefined( level._id_265B ) )
        level._id_265B = [];

    level._id_89C6 = 0;
    level._id_4242 = [];

    if ( !isdefined( level._id_8F83 ) )
        level._id_8F83 = [];

    level._id_8F83["regular"] = ::_id_8F81;
    level._id_8F83["elite"] = ::_id_8F7E;
    level._id_91E6 = [];
    level._id_91E6["axis"] = ::_id_8960;
    level._id_91E6["allies"] = ::_id_895F;
    level._id_91E6["team3"] = ::_id_8962;
    level._id_91E6["neutral"] = ::_id_8961;
    level._id_60BC = 0;
    level._id_44D0 = randomintrange( 1, 4 );

    if ( !isdefined( level._id_2780 ) )
        level._id_2780 = 2048;

    if ( !isdefined( level._id_277F ) )
        level._id_277F = 80;

    level._id_6E4B = "J_Shoulder_RI";
    level._id_5BC7 = 1024;

    if ( !isdefined( level._id_5A3A ) )
        level._id_5A3A = 11;

    level._id_05E9 = 0;
    var_3 = getaispeciesarray();
    common_scripts\utility::_id_0D13( var_3, ::_id_57BA );
    level._id_08C4 = [];
    level._id_2E9E = [];
    var_4 = getspawnerarray();

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        var_4[var_5] thread _id_8942();

    level._id_2E9E = undefined;
    thread _id_6FE9();
    common_scripts\utility::_id_0D13( var_3, ::_id_8965 );
    level._id_08C5 = getarraykeys( level._id_08C4 );

    for ( var_5 = 0; var_5 < level._id_08C5.size; var_5++ )
    {
        if ( !issubstr( tolower( level._id_08C5[var_5] ), "rpg" ) )
            continue;

        precacheitem( "rpg_player" );
        break;
    }

    level._id_08C5 = undefined;
}

_id_09A8()
{

}

_id_1CE4( var_0 )
{
    if ( var_0.size <= 16 )
        return;

    var_1 = 0;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !var_0[var_3].team != "axis" )
            continue;

        var_1++;

        if ( !var_0[var_3] _id_46E5() )
            continue;

        var_2++;
    }
}

_id_46E5()
{
    if ( isdefined( self._id_796F ) )
        return 1;

    return isdefined( self._id_7970 );
}

_id_6FE9()
{
    foreach ( var_2, var_1 in level._id_265B )
    {
        level._id_265B[var_2] = [];
        level._id_265B[var_2]["spawners"] = [];
        level._id_265B[var_2]["ai"] = [];

        if ( !isdefined( level._id_382E[var_2] ) )
            common_scripts\utility::_id_383D( var_2 );
    }
}

_id_890A()
{
    self endon( "death" );

    for (;;)
    {
        if ( self.count > 0 )
            self waittill( "spawned" );

        waitframe;

        if ( !self.count )
            return;
    }
}

_id_08D4()
{
    level._id_265B[self._id_7987]["ai"][self._id_9A29] = self;
    var_0 = self._id_9A29;
    var_1 = self._id_7987;

    if ( isdefined( self._id_7988 ) )
        _id_A0D6();
    else
        self waittill( "death" );

    level._id_265B[var_1]["ai"][var_0] = undefined;
    _id_9AAD( var_1 );
}

_id_9CAD()
{
    var_0 = self._id_9A29;
    var_1 = self._id_7987;

    if ( !isdefined( level._id_265B ) || !isdefined( level._id_265B[self._id_7987] ) )
    {
        waitframe;

        if ( !isdefined( self ) )
            return;
    }

    level._id_265B[var_1]["vehicles"][var_0] = self;
    self waittill( "death" );
    level._id_265B[var_1]["vehicles"][var_0] = undefined;
    _id_9AAD( var_1 );
}

_id_89C0()
{
    level._id_265B[self._id_7987] = [];
    waitframe;

    if ( !isdefined( self ) || self.count == 0 )
        return;

    self._id_89C6 = level._id_89C6;
    level._id_89C6++;
    level._id_265B[self._id_7987]["spawners"][self._id_89C6] = self;
    var_0 = self._id_7987;
    var_1 = self._id_89C6;
    _id_890A();
    level._id_265B[var_0]["spawners"][var_1] = undefined;
    _id_9AAD( var_0 );
}

_id_9D46()
{
    level._id_265B[self._id_7987] = [];
    waitframe;

    if ( !isdefined( self ) )
        return;

    self._id_89C6 = level._id_89C6;
    level._id_89C6++;
    level._id_265B[self._id_7987]["vehicle_spawners"][self._id_89C6] = self;
    var_0 = self._id_7987;
    var_1 = self._id_89C6;
    _id_890A();
    level._id_265B[var_0]["vehicle_spawners"][var_1] = undefined;
    _id_9AAD( var_0 );
}

_id_9AAD( var_0 )
{
    level notify( "updating_deathflag_" + var_0 );
    level endon( "updating_deathflag_" + var_0 );
    waitframe;

    foreach ( var_3, var_2 in level._id_265B[var_0] )
    {
        if ( getarraykeys( var_2 ).size > 0 )
            return;
    }

    common_scripts\utility::_id_383F( var_0 );
}

_id_65BC( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isai( var_1 ) )
            continue;

        var_1 thread maps\_utility::_id_4BAC( 0.15 );
        var_1 maps\_utility::_id_2A8D();
        var_1._id_A154 = 0;
    }
}

_id_4C45( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isai( var_1 ) )
            continue;

        var_1 thread maps\_utility::_id_4BAC( 0.15 );
        var_1 maps\_utility::_id_30B0();
        var_1._id_A154 = 1;
    }
}

_id_2BE4( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( !var_0.count )
            return;

        if ( self._not_team != var_0.teambalanced )
            return;

        if ( isdefined( var_0._id_981E ) )
            return;

        var_1 = var_0 maps\_utility::_id_88C3();

        if ( maps\_utility::_id_88F1( var_1 ) )
            var_0 notify( "spawn_failed" );

        if ( isdefined( self.waypoint_reached ) && self.waypoint_reached > 0 )
            wait(self.waypoint_reached);
    }
}

_id_97F9( var_0 )
{
    var_1 = var_0._id_7116;
    var_2 = var_0._not_team;
    var_0 waittill( "trigger" );
    var_0 maps\_utility::script_lightset();

    if ( isdefined( var_1 ) )
        waitframe;

    var_3 = getentarray( var_2, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( var_5.code_classname == "script_vehicle" )
        {
            if ( isdefined( var_5._id_7A40 ) && var_5._id_7A40 == 1 || !isdefined( var_5._not_team ) )
                thread maps\_vehicle::_id_9D41( var_5 );
            else
                var_5 thread maps\_vehicle::_id_8977();

            continue;
        }

        var_5 thread _id_97FB();

        if ( level.currentgen )
            wait 0.1;
    }

    if ( isdefined( level._id_893E ) )
        _id_97D4( var_2 );
}

_id_97D4( var_0 )
{
    var_1 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    if ( getentarray( var_0, "target" ).size <= 1 )
        maps\_utility::_id_286F( var_1 );

    var_2 = _id_3E35( var_1 );
    common_scripts\utility::_id_0D13( var_2, ::_id_97FB );
}

_id_3E35( var_0 )
{
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4._id_7ACE ) )
            continue;

        if ( !isdefined( var_2[var_4._id_7ACE] ) )
            var_2[var_4._id_7ACE] = [];

        var_2[var_4._id_7ACE][var_2[var_4._id_7ACE].size] = var_4;
    }

    foreach ( var_7 in var_2 )
    {
        foreach ( var_4 in var_7 )
        {
            var_9 = _id_3E68( var_4, var_7.size );
            var_1[var_1.size] = var_9;
        }
    }

    return var_1;
}

_id_3E68( var_0, var_1 )
{
    if ( !isdefined( level._id_89C7 ) )
        level._id_89C7 = [];

    if ( !isdefined( level._id_89C7[var_0._id_7ACE] ) )
        level._id_89C7[var_0._id_7ACE] = _id_23CE( var_0._id_7ACE );

    var_2 = level._id_89C7[var_0._id_7ACE];
    var_3 = var_2._id_6E2F[var_2._id_6E3D];
    var_2._id_6E3D++;
    var_2._id_6E3D %= var_2._id_6E2F.size;
    var_3.origin = var_0.origin;

    if ( isdefined( var_0.angles ) )
        var_3.angles = var_0.angles;
    else if ( isdefined( var_0._not_team ) )
    {
        var_4 = getnode( var_0._not_team, "targetname" );

        if ( isdefined( var_4 ) )
            var_3.angles = vectortoangles( var_4.origin - var_3.origin );
    }

    if ( isdefined( level._id_893D ) )
        var_3 [[ level._id_893D ]]( var_0 );

    if ( isdefined( var_0._not_team ) )
        var_3._not_team = var_0._not_team;

    var_3.count = 1;
    return var_3;
}

_id_23CE( var_0 )
{
    var_1 = getspawnerarray();
    var_2 = spawnstruct();
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5._id_7ACE ) )
            continue;

        if ( var_5._id_7ACE != var_0 )
            continue;

        var_3[var_3.size] = var_5;
    }

    var_2._id_6E3D = 0;
    var_2._id_6E2F = var_3;
    return var_2;
}

_id_97FB()
{
    self endon( "death" );
    maps\_utility::script_lightset();

    if ( !isdefined( self ) )
        return undefined;

    if ( isdefined( self._id_79AD ) )
    {
        var_0 = maps\_utility::_id_2F29( self, 1 );
        return undefined;
    }
    else if ( !issubstr( self.classname, "actor" ) )
        return undefined;

    var_1 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

    if ( isdefined( self._id_79EB ) )
        var_0 = self stalingradspawn( var_1 );
    else
        var_0 = self dospawn( var_1 );

    if ( !maps\_utility::_id_88F1( var_0 ) )
    {
        if ( isdefined( self._id_797A ) )
        {
            if ( self._id_797A == "heat" )
                var_0 maps\_utility::_id_30C9();

            if ( self._id_797A == "cqb" )
                var_0 maps\_utility::_id_30B0();
        }

        var_0 maps\_colors::setup_nodes_intelligently_from_team();
    }

    return var_0;
}

_id_97FA( var_0 )
{
    var_1 = var_0._not_team;
    var_2 = 0;
    var_3 = getentarray( var_1, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5._not_team ) )
            continue;

        var_6 = getent( var_5._not_team, "targetname" );

        if ( !isdefined( var_6 ) )
        {
            if ( !isdefined( var_5._id_7A26 ) )
                continue;

            var_6 = var_5 common_scripts\utility::_id_3DBC();

            if ( !isdefined( var_6 ) )
                continue;

            if ( !isspawner( var_6 ) )
                continue;
        }

        var_2 = 1;
        break;
    }

    var_0 waittill( "trigger" );
    var_0 maps\_utility::script_lightset();
    var_3 = getentarray( var_1, "targetname" );

    foreach ( var_5 in var_3 )
        var_5 thread _id_97DA();
}

_id_97DA()
{
    var_0 = _id_97D9();
    var_1 = _id_97FB();

    if ( !isdefined( var_1 ) )
    {
        self delete();

        if ( isdefined( var_0 ) )
        {
            var_1 = var_0 _id_97FB();
            var_0 delete();

            if ( !isdefined( var_1 ) )
                return;
        }
        else
            return;
    }

    if ( !isdefined( var_0 ) )
        return;

    var_1 waittill( "death" );

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.count ) )
        var_0.count = 1;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        var_2 = var_0 thread _id_97FB();

        if ( !isdefined( var_2 ) )
        {
            var_0 delete();
            break;
        }

        var_2 thread _id_7302( var_0 );
        var_2 waittill( "death", var_3 );

        if ( !_id_6BF3( var_2, var_3 ) )
        {
            if ( !isdefined( var_0 ) )
                break;

            var_0.count++;
        }

        if ( !isdefined( var_2 ) )
            continue;

        if ( !isdefined( var_0 ) )
            break;

        if ( !isdefined( var_0.count ) )
            break;

        if ( var_0.count <= 0 )
            break;

        if ( !maps\_utility::_id_7B20() )
            wait(randomfloatrange( 1, 3 ));
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_97D9()
{
    if ( isdefined( self._not_team ) )
    {
        var_0 = getent( self._not_team, "targetname" );

        if ( isdefined( var_0 ) && isspawner( var_0 ) )
            return var_0;
    }

    if ( isdefined( self._id_7A26 ) )
    {
        var_0 = common_scripts\utility::_id_3DBC();

        if ( isdefined( var_0 ) && isspawner( var_0 ) )
            return var_0;
    }

    return undefined;
}

_id_38F1( var_0 )
{
    common_scripts\utility::_id_0D13( var_0, ::_id_38F0 );
    common_scripts\utility::_id_0D13( var_0, ::_id_38F3 );
}

_id_7302( var_0 )
{
    var_0 endon( "death" );

    if ( isdefined( self._id_79E5 ) )
    {
        if ( self._id_79E5 )
            return;
    }

    self waittill( "death" );

    if ( !isdefined( self ) )
        var_0.count++;
}

_id_2837( var_0 )
{
    for ( var_1 = 0; var_1 < 2; var_1++ )
    {
        switch ( var_1 )
        {
            case 0:
                var_2 = "axis";
                break;
            default:
                var_2 = "allies";
                break;
        }

        var_3 = getentarray( var_2, "team" );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( isdefined( var_3[var_4]._id_7ADA ) )
            {
                if ( var_3[var_4]._id_7ADA == var_0 )
                    var_3[var_4] thread _id_2819();
            }
        }
    }
}

_id_533E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0.teambalanced ) && var_0.teambalanced != "flood_spawner" )
        return;

    var_0 delete();
}

_id_7116( var_0 )
{
    var_0 endon( "death" );
    var_1 = var_0._id_7AB3;
    waitframe;

    if ( !isdefined( level._id_537C[var_1] ) )
        return;

    var_0 waittill( "trigger" );
    _id_24B6( var_1 );
}

_id_24B6( var_0 )
{
    if ( !isdefined( level._id_537C[var_0] ) )
        return;

    var_1 = level._id_537C[var_0];
    var_2 = getarraykeys( var_1 );

    if ( var_2.size <= 1 )
        return;

    var_3 = common_scripts\utility::_id_710E( var_2 );
    var_1[var_3] = undefined;

    foreach ( var_9, var_5 in var_1 )
    {
        foreach ( var_8, var_7 in var_5 )
        {
            if ( isdefined( var_7 ) )
                var_7 delete();
        }

        level._id_537C[var_0][var_9] = undefined;
    }
}

_id_537D( var_0 )
{
    var_1 = getspawnerarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_7A1D ) && var_0 == var_1[var_2]._id_7A1D )
            var_1[var_2] delete();
    }
}

_id_5339( var_0 )
{
    var_1 = var_0._id_7A1D;
    var_0 waittill( "trigger" );
    waitframe;
    waitframe;
    _id_537D( var_1 );
    _id_533E( var_0 );
}

_id_3095( var_0 )
{
    var_1 = var_0._id_79B6;
    var_0 waittill( "trigger" );
    var_2 = getspawnerarray();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3]._id_79B6 ) )
            continue;

        if ( var_1 != var_2[var_3]._id_79B6 )
            continue;

        if ( isdefined( var_2[var_3]._id_79DD ) )
            level notify( "stop_flanker_behavior" + var_2[var_3]._id_79DD );

        var_2[var_3] maps\_utility::_id_7DF8( 0 );
        var_2[var_3] notify( "emptied spawner" );
    }

    var_0 notify( "deleted spawners" );
}

_id_533A( var_0 )
{
    var_1 = getspawnerarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_7A1D ) )
            continue;

        if ( var_0 != var_1[var_2]._id_7A1D )
            continue;

        var_1[var_2] delete();
    }
}

_id_97F7( var_0 )
{

}

_id_8904( var_0, var_1 )
{
    if ( !isdefined( level._id_43E2 ) || !isdefined( level._id_43E2[var_1] ) )
    {
        level._id_43E3[var_1] = 0;
        level._id_43E2[var_1] = [];
    }

    var_2 = level._id_43E3[var_1];
    var_3 = level._id_43E2[var_1][var_2];

    if ( isdefined( var_3 ) )
        var_3 delete();

    var_4 = "weapon_fraggrenade";

    if ( isdefined( level.playercardbackground ) && isdefined( level.playercardbackground._id_9C5F ) )
    {
        if ( common_scripts\utility::_id_2006() )
            var_4 = "weapon_frag_grenade_var";
        else
            var_4 = "weapon_flash_grenade_var";
    }

    var_3 = spawn( var_4, var_0 );
    level._id_43E2[var_1][var_2] = var_3;
    level._id_43E3[var_1] = ( var_2 + 1 ) % 16;
    return var_3;
}

_id_A0D6()
{
    self endon( "death" );
    self waittill( "pain_death" );
}

_id_2F42()
{
    var_0 = self.team;
    _id_A0D6();

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_613F ) )
        return;

    if ( level.tire_explosion )
    {
        var_1 = self.origin;
        var_2 = self geteye();
        waitframe;

        for ( var_3 = 0; var_3 < 15; var_3++ )
            thread random_tire( var_1, var_2 );

        if ( isdefined( self ) )
        {
            animscripts\shared::_id_2F6C();
            wait 0.1;

            if ( isdefined( self ) && !isremovedentity( self ) )
                self delete();
        }

        return;
    }

    self.ignoresuppression = 1;

    if ( self.grenadeammo <= 0 )
        return;

    level._id_60CB--;

    if ( level._id_60CB > 0 )
        return;

    level._id_60CB = 3 + randomint( 2 );
    var_4 = 25;
    var_5 = 12;
    var_1 = self.origin + ( randomint( var_4 ) - var_5, randomint( var_4 ) - var_5, 2 ) + ( 0, 0, 42 );
    var_6 = ( 0, randomint( 360 ), 90 );
    thread _id_8905( var_1, var_6, self.team );
}

random_tire( var_0, var_1 )
{
    if ( level.cheattires.size == level.cheattires_max )
    {
        level.cheattires[0] delete();
        level.cheattires = maps\_utility::_id_0CFA( level.cheattires, 0 );
    }

    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2.angles = ( 0, randomint( 360 ), 0 );
    var_3 = randomfloat( 1 );
    var_2.origin = var_0 * var_3 + var_1 * ( 1 - var_3 );
    var_2 setmodel( level.random_tire_model );
    var_4 = common_scripts\utility::_id_712D( 15000 );
    var_4 = ( var_4[0], var_4[1], abs( var_4[2] ) );
    var_2 physicslaunch( var_2.origin, var_4 );
    level.cheattires[level.cheattires.size] = var_2;
    var_2 endon( "death" );
    wait(randomfloatrange( 5.0, 10.0 ));

    if ( isdefined( var_2 ) )
    {
        level.cheattires = common_scripts\utility::_id_0CF6( level.cheattires, var_2 );
        var_2 delete();
    }
}

override_random_tire( var_0 )
{
    precachemodel( var_0 );
    level.random_tire_model = var_0;
}

_id_8905( var_0, var_1, var_2 )
{
    var_3 = _id_8904( var_0, var_2 );
    var_3 setmodel( "grenade_bag" );
    var_3.angles = var_1;
    var_3 hide();
    wait 0.7;

    if ( !isdefined( var_3 ) )
        return;

    var_3 show();
}

_id_2F2B()
{
    maps\_drone_base::_id_2E62();
}

empty()
{

}

_id_8942()
{
    level._id_08C4[self.classname] = 1;

    if ( isdefined( self._id_799E ) )
    {
        switch ( self._id_799E )
        {
            case "easy":
                if ( level._id_3BFE > 1 )
                    maps\_utility::_id_7DF8( 0 );

                break;
            case "hard":
                if ( level._id_3BFE < 2 )
                    maps\_utility::_id_7DF8( 0 );

                break;
        }
    }

    if ( isdefined( self._id_79AD ) )
        thread _id_2F2B();

    if ( isdefined( self._id_792E ) )
    {
        var_0 = self._id_792E;

        if ( !isdefined( level._id_054A[var_0] ) )
            _id_0956( var_0 );

        thread _id_095A( level._id_054A[var_0] );
    }

    if ( isdefined( self._id_7992 ) )
    {
        var_1 = 0;

        if ( isdefined( level._id_0549 ) )
        {
            if ( isdefined( level._id_0549[self._id_7992] ) )
                var_1 = level._id_0549[self._id_7992].size;
        }

        level._id_0549[self._id_7992][var_1] = self;
    }

    if ( isdefined( self._id_7A0C ) )
    {
        if ( self._id_7A0C > level._id_05E9 )
            level._id_05E9 = self._id_7A0C;

        var_1 = 0;

        if ( isdefined( level._id_054B ) )
        {
            if ( isdefined( level._id_054B[self._id_7A0C] ) )
                var_1 = level._id_054B[self._id_7A0C].size;
        }

        level._id_054B[self._id_7A0C][var_1] = self;
    }

    if ( isdefined( self._id_7987 ) )
        thread _id_89C0();

    if ( isdefined( self._not_team ) )
        _id_238C();

    if ( isdefined( self._id_7ACF ) )
        _id_07B0();

    if ( isdefined( self._id_7AB3 ) )
        _id_0789();

    if ( !isdefined( self._id_8900 ) )
        self._id_8900 = [];

    for (;;)
    {
        var_2 = undefined;
        self waittill( "spawned", var_2 );

        if ( !isalive( var_2 ) )
            continue;

        if ( isdefined( level._id_89CB ) )
            self thread [[ level._id_89CB ]]( var_2 );

        if ( isdefined( self._id_7992 ) )
        {
            for ( var_3 = 0; var_3 < level._id_0549[self._id_7992].size; var_3++ )
            {
                if ( level._id_0549[self._id_7992][var_3] != self )
                    level._id_0549[self._id_7992][var_3] delete();
            }
        }

        var_2._id_88FE = self._id_8900;
        var_2.spawntime = self;

        if ( isdefined( self.teambalanced ) )
        {
            var_2 thread _id_8965( self.teambalanced );
            continue;
        }

        var_2 thread _id_8965();
    }
}

_id_8965( var_0 )
{
    level._id_08C4[self.classname] = 1;
    _id_8966( var_0 );
    self endon( "death" );

    if ( _id_84A0() )
        self delete();

    thread _id_76B6();
    self._id_3797 = 1;
    self notify( "finished spawning" );

    if ( self.team == "allies" && !isdefined( self._id_7A7F ) )
        thread _id_3A98();
}

_id_84A0()
{
    if ( !isdefined( self._id_799E ) )
        return 0;

    var_0 = 0;

    switch ( self._id_799E )
    {
        case "easy":
            if ( level._id_3BFE > 1 )
                var_0 = 1;

            break;
        case "hard":
            if ( level._id_3BFE < 2 )
                var_0 = 1;

            break;
    }

    return var_0;
}

_id_76B6()
{
    self endon( "death" );

    if ( !isdefined( self._id_88FE ) )
    {
        self.spawntime = undefined;
        return;
    }

    for ( var_0 = 0; var_0 < self._id_88FE.size; var_0++ )
    {
        var_1 = self._id_88FE[var_0];

        if ( isdefined( var_1["param5"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"], var_1["param5"] );
            continue;
        }

        if ( isdefined( var_1["param4"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"] );
            continue;
        }

        if ( isdefined( var_1["param3"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"] );
            continue;
        }

        if ( isdefined( var_1["param2"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"] );
            continue;
        }

        if ( isdefined( var_1["param1"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"] );
            continue;
        }

        thread [[ var_1["function"] ]]();
    }

    var_2 = common_scripts\utility::_id_9294( isdefined( level._id_9D42 ) && level._id_9D42 && self.code_classname == "script_vehicle", self._id_7AEF, self.team );

    if ( isdefined( var_2 ) )
    {
        for ( var_0 = 0; var_0 < level._id_88FE[var_2].size; var_0++ )
        {
            var_1 = level._id_88FE[var_2][var_0];

            if ( isdefined( var_1["param5"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"], var_1["param5"] );
                continue;
            }

            if ( isdefined( var_1["param4"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"] );
                continue;
            }

            if ( isdefined( var_1["param3"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"] );
                continue;
            }

            if ( isdefined( var_1["param2"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"] );
                continue;
            }

            if ( isdefined( var_1["param1"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"] );
                continue;
            }

            thread [[ var_1["function"] ]]();
        }
    }

    self._id_88FE = undefined;
    self.spawntime = undefined;
}

_id_8A49()
{
    if ( !maps\_utility::_id_5083() )
        return;

    maps\_utility::_id_0749( ::_id_8A47 );
    thread _id_5FE4();
}

_id_5FE4()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( !isdefined( self ) )
        return;

    if ( !self _meth_813f() )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isplayer( var_0 ) )
        return;

    if ( !isdefined( var_2 ) )
    {
        var_0._id_5FE3 = undefined;
        return;
    }

    if ( !isdefined( var_0._id_5FE3 ) )
        var_0._id_5FE3 = 1;
    else
        var_0._id_5FE3++;

    if ( maps\_utility::_id_5087() && var_0._id_5FE3 >= 4 )
        var_0 notify( "sur_ch_quadkill" );

    waitframe;
    var_0._id_5FE3 = undefined;
}

_id_8A47( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        self._id_551A = var_1;
        self._id_551B = var_4;
    }
}

check_explosion_man_achievement( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( !isplayer( var_0 ) && ( !isdefined( var_1 ) || var_1 != "seaknight_mark19" ) )
        return;

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "fraggrenade":
            case "claymore":
            case "rpg":
            case "javelin":
            case "seaknight_mark19":
            case "c4":
                var_3 = 1;
        }
    }

    if ( isdefined( var_2 ) && ( var_2 == "MOD_EXPLOSIVE" || var_2 == "MOD_GRENADE_SPLASH" ) )
        var_3 = 1;

    if ( var_3 )
    {
        if ( !isdefined( level.h1_achievement_explosionman ) )
            level.h1_achievement_explosionman = 1;
        else
        {
            level.h1_achievement_explosionman++;

            if ( level.h1_achievement_explosionman == 20 )
                maps\_utility::_id_41DD( "EXPLOSION_MAN" );
        }
    }
}

_id_2661()
{
    self waittill( "death", var_0, var_1, var_2 );
    level notify( "ai_killed", self );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_0 ) )
    {
        if ( self.team == "axis" || self.team == "team3" )
        {
            var_3 = undefined;

            if ( isdefined( var_0.attacker ) )
            {
                if ( isdefined( var_0._id_519D ) && var_0._id_519D )
                    var_3 = "sentry";

                if ( isdefined( var_0.destructible_type ) )
                    var_3 = "destructible";

                var_0 = var_0.attacker;
            }
            else if ( isdefined( var_0.owner ) )
            {
                if ( isai( var_0 ) && isplayer( var_0.owner ) )
                    var_3 = "friendly";

                var_0 = var_0.owner;
            }
            else if ( isdefined( var_0._id_25A9 ) )
            {
                if ( isdefined( var_0.destructible_type ) )
                    var_3 = "destructible";

                var_0 = var_0._id_25A9;
            }

            check_explosion_man_achievement( var_0, var_2, var_1 );
            var_4 = 0;

            if ( isplayer( var_0 ) )
                var_4 = 1;

            if ( isdefined( level._id_6E02 ) && level._id_6E02 )
                var_4 = 1;

            if ( isdefined( var_1 ) && var_1 == "MOD_CRUSH" )
            {
                if ( isdefined( level._id_4A91 ) || isdefined( level.playercardbackground._id_2E19 ) )
                    level.playercardbackground maps\_upgrade_challenge::_id_41CF( 1 );
            }

            if ( var_4 )
                var_0 maps\_player_stats::_id_72DF( self, var_1, var_2, var_3 );
        }
    }

    for ( var_5 = 0; var_5 < self._id_265F.size; var_5++ )
    {
        var_6 = self._id_265F[var_5];

        switch ( var_6["params"] )
        {
            case 0:
                [[ var_6["func"] ]]( var_0 );
                continue;
            case 1:
                [[ var_6["func"] ]]( var_0, var_6["param1"] );
                continue;
            case 2:
                [[ var_6["func"] ]]( var_0, var_6["param1"], var_6["param2"] );
                continue;
            case 3:
                [[ var_6["func"] ]]( var_0, var_6["param1"], var_6["param2"], var_6["param3"] );
                continue;
        }
    }
}

_id_08D3()
{
    self._id_257E = [];

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
        {
            var_7 = var_1 getcurrentweapon();

            if ( isdefined( var_7 ) && maps\_utility::_id_5185( var_7 ) && isdefined( var_4 ) && ( var_4 == "MOD_PISTOL_BULLET" || var_4 == "MOD_RIFLE_BULLET" ) )
                var_1 thread maps\_player_stats::_id_72E7();
        }

        foreach ( var_9 in self._id_257E )
            thread [[ var_9 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( self ) || self.delayeddeath )
            break;
    }
}

_id_57BA()
{
    if ( isdefined( self._id_7987 ) )
        level._id_265B[self._id_7987] = 1;

    if ( isdefined( self._not_team ) )
        _id_238C();
}

_id_238C()
{
    var_0 = _id_3DEF();

    if ( isdefined( var_0 ) )
    {
        var_1 = var_0["destination"];
        var_2 = var_0["get_target_func"];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
            _id_238B( var_1[var_3], var_2 );
    }
}

_id_895F()
{
    self.veh_boatbounce = 0;
}

_id_8960()
{
    if ( isdefined( level._id_A3A1 ) && level._id_A3A1 && isdefined( level._id_A3A0 ) )
        self thread [[ level._id_A3A0 ]]();

    if ( self.unlockpoints == "human" && !isdefined( level._id_2B13 ) )
        thread _id_2F42();

    maps\_utility::_id_0749( maps\_gameskill::_id_111E );

    if ( isdefined( self._id_797B ) )
        self.combatmode = self._id_797B;
}

_id_8962()
{
    _id_8960();
}

_id_8961()
{

}

_id_8F7E()
{
    self endon( "death" );
    self._id_305E = 1;
    self._id_2D65 = 0.5;

    if ( !isdefined( self._id_792C ) )
        self._id_1300 = 2;

    self._id_08A8 = 1;
    self.missile_passed_target = 100;
    maps\_utility::_id_0749( animscripts\pain::_id_07F0 );
    maps\_utility::_id_0749( ::_id_664B );
    self._id_254A = ::_id_89C3;

    if ( isdefined( self.weapon_switch_invalid ) && weaponclass( self.weapon_switch_invalid ) != "rocketlauncher" )
        self laseron();
}

_id_89C3()
{
    var_0 = undefined;

    if ( isdefined( self.weapon_switch_invalid ) )
        var_0 = self.weapon_switch_invalid;
    else
        return;

    if ( isdefined( var_0 ) && weaponclass( var_0 ) != "rocketlauncher" )
        self laseron();
}

_id_8F81()
{
    if ( !isdefined( self._id_792C ) )
        self._id_1300 = 1.05;
}

_id_664B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( self.helmet <= 0 )
        return;

    if ( var_0 >= self.missile_passed_target )
    {
        var_7 = self.missile_passed_target;
        self.missile_passed_target = var_7 * 3;
        wait 5;
        self.missile_passed_target = var_7;
    }
}

_id_18A8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) || self.helmet <= 0 )
        return;

    if ( isdefined( self._id_58D7 ) && self._id_58D7 )
        return;

    if ( !issubstr( var_4, "BULLET" ) )
        return;

    var_7 = self._id_18A8;

    if ( var_0 < self._id_18A8 )
        var_7 = var_0;

    self.helmet += var_7;
}

_id_8967()
{
    maps\_gameskill::grenadeawareness();
}

_id_08F2()
{
    if ( !isalive( self ) )
        return;

    if ( self.helmet <= 1 )
        return;

    self laseron();
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self laseroff();
}

_id_8968()
{
    if ( isdefined( self._id_79AA ) )
        self._id_2D3B = 1;

    if ( isdefined( self._id_7987 ) )
        thread _id_08D4();

    if ( isdefined( self._id_7941 ) )
        self.attackeraccuracy = self._id_7941;

    if ( isdefined( self._id_7ADE ) )
        thread _id_8C18();

    if ( isdefined( self._id_798A ) )
        thread _id_2671();

    if ( isdefined( self._id_7A83 ) )
        maps\_utility::_id_2ADA();

    if ( isdefined( self._id_7A7A ) )
        self._id_85B9 = 1;

    if ( isdefined( self._id_7A21 ) )
        thread _id_08F2();

    if ( isdefined( self._id_7982 ) )
    {
        var_0 = self._id_7982;

        if ( var_0 == 1 )
            var_0 = 8;

        maps\_utility::_id_30B4( var_0 );
    }

    if ( isdefined( self._id_79C4 ) )
        self.maxsightdistsqrd = self._id_79C4;
    else
        self.maxsightdistsqrd = getdefaultmaxfaceenemydistance();

    if ( isdefined( self._id_79E6 ) )
        maps\_utility::_id_7E38( self._id_79E6 );

    if ( isdefined( self._id_2D33 ) )
        self.dropweapon = 0;

    if ( isdefined( self._id_79D1 ) )
        self.fixednode = self._id_79D1 == 1;
    else
        self.fixednode = self.team == "allies";

    self.psoffsettime = self.team == "allies" && self.fixednode;

    if ( isdefined( self.script_parentname ) && self.script_parentname == "mgpair" )
        thread maps\_mg_penetration::_id_23CC();

    if ( isdefined( self._id_7A03 ) && !( isdefined( self._id_7A40 ) && self._id_7A40 == 1 || isdefined( self._id_7AE1 ) ) )
        thread _id_7E4F();

    if ( isdefined( self._id_7AF3 ) )
        self setthreatbiasgroup( self._id_7AF3 );
    else if ( self.team == "neutral" )
        self setthreatbiasgroup( "civilian" );
    else
        self setthreatbiasgroup( self.team );

    if ( isdefined( self._id_795C ) )
        maps\_utility::_id_7DDF( self._id_795C );

    if ( isdefined( self._id_792C ) )
        self._id_1300 = self._id_792C;

    if ( isdefined( self._id_7A15 ) )
        self.ignoretriggers = 1;

    if ( isdefined( self._id_7A13 ) )
        self.index = 1;

    if ( isdefined( self._id_7A14 ) )
    {
        self.ignoreforfixednodesafecheck = 1;
        self _meth_816a();
    }

    if ( isdefined( self._id_7AC4 ) )
        self.melee_fired = self._id_7AC4;

    if ( isdefined( self._id_79C9 ) )
    {
        if ( self._id_79C9 == "player" )
        {
            self.favoriteenemy = level.playercardbackground;
            level.playercardbackground.teambalanced = "player";
        }
    }

    if ( isdefined( self._id_79CA ) )
        self.pathlookaheaddist = self._id_79CA;

    if ( isdefined( self._id_7A31 ) )
        self.pathrandompercent = self._id_7A31;

    if ( isdefined( self._id_7A28 ) )
        self.a._id_2B18 = 1;

    if ( isdefined( self._id_799D ) )
        self.diequietly = 1;

    if ( isdefined( self._id_79DE ) )
    {
        self.groundentchanged = "flash_grenade";
        self.grenadeammo = self._id_79DE;
    }

    if ( isdefined( self._id_7A95 ) )
        self.pantssize = 1;

    if ( isdefined( self._id_7ADB ) )
        self.helmet = self._id_7ADB;

    if ( isdefined( self._id_7A7D ) )
        self._id_613F = self._id_7A7D;
}

_id_8966( var_0 )
{
    thread _id_08D3();
    thread _id_9193();
    thread _id_263B();
    thread _id_8A49();

    if ( !isdefined( level._id_08DD ) )
        self thermaldrawenable();

    self._id_89C6 = undefined;

    if ( !isdefined( self._id_9A29 ) )
        maps\_utility::_id_7DB5();

    if ( !isdefined( self._id_265F ) )
        self._id_265F = [];

    thread _id_2661();
    level thread maps\_friendlyfire::_id_3A59( self );
    self.weapon_change = 16;
    _id_4D37();
    _id_8967();
    _id_8968();
    [[ level._id_91E6[self.team] ]]();
    thread [[ level._id_8F83[self._id_8F7D] ]]();
    thread maps\_damagefeedback::_id_5E3F();
    _id_7E4A();

    if ( isdefined( self._id_7AA5 ) )
    {
        self _meth_81ab( level.playercardbackground );
        return;
    }

    if ( isdefined( self._id_7AE1 ) )
    {
        if ( isdefined( self._id_7AE3 ) )
        {
            var_1 = level._id_8DB6[self._id_7AE3];
            self thread [[ var_1 ]]();
        }
        else
            self thread [[ level._id_4224["_spawner_stealth_default"] ]]();
    }

    if ( isdefined( self._id_7A11 ) )
    {
        self thread [[ level._id_4224["_idle_call_idle_func"] ]]();
        return;
    }

    if ( isdefined( self._id_7A12 ) && !isdefined( self._id_7A40 ) )
        self thread [[ level._id_4224["_idle_call_idle_func"] ]]();

    if ( isdefined( self._id_7A9C ) && !isdefined( self._id_7A40 ) )
    {
        thread maps\_patrol::_id_66FC();
        return;
    }

    if ( isdefined( self._id_7AB5 ) && self._id_7AB5 == 1 )
        maps\_utility::_id_30EB();

    if ( isdefined( self._id_7991 ) )
    {
        if ( !isdefined( self._id_7AB2 ) )
            self.goalradius = 800;

        self _meth_81ab( level.playercardbackground );
        level thread _id_27DC( self );
        return;
    }

    if ( isdefined( self._id_9BF5 ) )
        return;

    if ( isdefined( self._id_7A40 ) && self._id_7A40 == 1 )
    {
        _id_7E49();
        self _meth_81aa( self.origin );
        return;
    }

    if ( !isdefined( self._id_7AE1 ) )
    {

    }

    _id_7E49();

    if ( isdefined( self._not_team ) )
        thread _id_4241();
}

_id_4D37()
{
    maps\_utility::_id_7E0B();

    if ( isdefined( self._id_7A07 ) )
        self.grenadeammo = self._id_7A07;
    else
        self.grenadeammo = 3;

    if ( isdefined( self.primaryweapon ) )
        self.node_not_safe = animscripts\combat_utility::issniper();

    if ( !maps\_utility::_id_5083() )
        self._id_6097 = 1;
}

_id_7B48()
{
    if ( self.team == "neutral" )
        self setthreatbiasgroup( "civilian" );
    else
        self setthreatbiasgroup( self.team );

    _id_4D37();
    self._id_1300 = 1;
    maps\_gameskill::grenadeawareness();
    maps\_utility::_id_1EB8();
    self.invisible = 96;
    self._id_2AF3 = undefined;
    self.ignoretriggers = 0;
    self.threatsightdelayfalloff = 0;
    self.pantssize = 0;
    self.parentindex = 20;
    self.ikweight = 0;
    self.radarshowenemydirection = 1;
    self.script_vehicle_collmap = 1;
    self.allowdeath = 0;
    self.anglelerprate = 540;
    self.badplaceawareness = 0.75;
    self.dontavoidplayer = 0;
    self.drawoncompass = 1;
    self.dropweapon = 1;
    self.goalradius = level._id_2780;
    self.goalheight = level._id_277F;
    self.index = 0;
    self _meth_81a7( 0 );

    if ( isdefined( self._id_58D7 ) && self._id_58D7 )
        maps\_utility::_id_8EA4();

    maps\_utility::_id_2ACC();
    self.melee_fired = 67108864;
    self._id_79EA = 0;
    self.weapon_change = 16;
    maps\_utility::_id_9A4B();
    self.radarshowenemydirection = 1;
    self.script_vehicle_collmap = 1;
    animscripts\init::_id_7DBE();
    self.fixednode = self.team == "allies";
}

_id_27DC( var_0 )
{
    var_0 endon( "death" );

    while ( isalive( var_0 ) )
    {
        if ( var_0.goalradius > 200 )
            var_0.goalradius -= 200;

        wait 6;
    }
}

_id_3849( var_0 )
{
    self endon( "death" );

    if ( !self._id_3864 )
    {
        var_0._id_9BF5 = 1;
        self._id_3864 = 1;
        var_0 waittill( "death" );
        self._id_3864 = 0;
        self notify( "get new user" );
    }
}

_id_7E4F()
{
    self endon( "death" );
    waitframe;

    if ( isdefined( self.team ) && self.team == "allies" )
        self.fixednode = 0;

    var_0 = level._id_4255[self._id_7A03];

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._not_team ) )
    {
        var_1 = getnode( var_0._not_team, "targetname" );
        var_2 = getent( var_0._not_team, "targetname" );
        var_3 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
        var_4 = undefined;

        if ( isdefined( var_1 ) )
        {
            var_4 = var_1;
            self _meth_81a9( var_4 );
        }
        else if ( isdefined( var_2 ) )
        {
            var_4 = var_2;
            self _meth_81aa( var_4.origin );
        }
        else if ( isdefined( var_3 ) )
        {
            var_4 = var_3;
            self _meth_81aa( var_4.origin );
        }

        if ( isdefined( var_4.rank ) && var_4.rank != 0 )
            self.goalradius = var_4.rank;

        if ( isdefined( var_4.goalheight ) && var_4.goalheight != 0 )
            self.goalheight = var_4.goalheight;
    }

    if ( isdefined( self._not_team ) )
        self _meth_81ac( var_0 );
    else
        self _meth_81ad( var_0 );
}

_id_3E8A( var_0 )
{
    return getentarray( var_0, "targetname" );
}

_id_3E8C( var_0 )
{
    return getnodearray( var_0, "targetname" );
}

get_target_vehicle_nodes( var_0 )
{
    return getvehiclenodearray( var_0, "targetname" );
}

_id_3E8E( var_0 )
{
    return common_scripts\utility::_id_40FD( var_0, "targetname" );
}

_id_6123( var_0 )
{
    return isdefined( var_0.rank ) && var_0.rank != 0;
}

_id_4248( var_0, var_1 )
{
    _id_4241( var_0, "origin", var_1 );
}

_id_4249( var_0, var_1 )
{
    _id_4241( var_0, "struct", var_1 );
}

_id_4241( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_9BF5 ) )
        return;

    var_5 = _id_3DEF( var_0, var_1 );

    if ( !isdefined( var_5 ) )
    {
        self notify( "reached_path_end" );
        return;
    }

    _id_4246( var_5["destination"], var_5["get_target_func"], var_5["set_goal_func_quits"], var_2, var_3, var_4 );
}

_id_3DB5( var_0 )
{
    if ( var_0.size == 1 )
        return var_0[0];

    var_1 = var_0[0].teambalanced;

    if ( !isdefined( level._id_4242[var_1] ) )
        level._id_4242[var_1] = var_0;

    var_0 = level._id_4242[var_1];
    var_2 = var_0[0];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size - 1; var_4++ )
        var_3[var_4] = var_0[var_4 + 1];

    var_3[var_0.size - 1] = var_0[0];
    level._id_4242[var_1] = var_3;
    return var_2;
}

_id_4246( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "stop_going_to_node" );
    self endon( "stop_going_to_node" );
    self endon( "death" );

    for (;;)
    {
        var_0 = _id_3DB5( var_0 );
        var_6 = var_4;

        if ( isdefined( var_0._id_7AB7 ) )
        {
            if ( var_0._id_7AB7 > 1 )
                var_6 = var_0._id_7AB7;

            var_0._id_7AB7 = 0;
        }

        if ( _id_6123( var_0 ) )
            self.goalradius = var_0.rank;
        else
            self.goalradius = level._id_2780;

        if ( isdefined( var_0.hidewhendead ) )
            self.goalheight = var_0.hidewhendead;
        else
            self.goalheight = level._id_277F;

        [[ var_2 ]]( var_0 );

        if ( maps\_utility::_id_32DC( "_stealth_override_goalpos" ) )
        {
            for (;;)
            {
                self waittill( "goal" );

                if ( !maps\_utility::_id_32D8( "_stealth_override_goalpos" ) )
                    break;

                maps\_utility::_id_32E4( "_stealth_override_goalpos" );
            }
        }
        else
            self waittill( "goal" );

        var_0 notify( "trigger", self );

        if ( isdefined( var_3 ) )
            [[ var_3 ]]( var_0 );

        if ( isdefined( var_0._id_79D8 ) )
            common_scripts\utility::_id_383F( var_0._id_79D8 );

        if ( isdefined( var_0._id_79BC ) )
            maps\_utility::_id_32DE( var_0._id_79BC );

        if ( isdefined( var_0._id_79D4 ) )
            common_scripts\utility::_id_3831( var_0._id_79D4 );

        if ( isdefined( var_0.script_parentname ) )
            self notify( var_0.script_parentname );

        if ( _id_91DA( var_0 ) )
            return 1;

        var_0 maps\_utility::script_lightset();

        if ( isdefined( var_0._id_79DA ) )
            common_scripts\utility::_id_384A( var_0._id_79DA );

        var_0 maps\_utility::_id_7B20();

        if ( isdefined( var_0._id_798F ) )
            wait(var_0._id_798F);

        while ( isdefined( var_0._id_7AB7 ) )
        {
            var_0._id_7AB7 = 0;

            if ( _id_4247( var_0, var_1, var_6 ) )
            {
                var_0._id_7AB7 = 1;
                var_0 notify( "script_requires_player" );
                break;
            }

            wait 0.1;
        }

        if ( isdefined( var_5 ) )
            [[ var_5 ]]( var_0 );

        if ( !isdefined( var_0._not_team ) )
            break;

        var_7 = [[ var_1 ]]( var_0._not_team );

        if ( !var_7.size )
            break;

        var_0 = var_7;
    }

    self notify( "reached_path_end" );

    if ( isdefined( self._id_79E9 ) )
        return;

    self.goalradius = level._id_2780;
}

_id_4247( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( distancesquared( var_4.origin, var_0.origin ) < distancesquared( self.origin, var_0.origin ) )
            return 1;
    }

    var_6 = anglestoforward( self.angles );

    if ( isdefined( var_0._not_team ) )
    {
        var_7 = [[ var_1 ]]( var_0._not_team );

        if ( var_7.size == 1 )
            var_6 = vectornormalize( var_7[0].origin - var_0.origin );
        else if ( isdefined( var_0.angles ) )
            var_6 = anglestoforward( var_0.angles );
    }
    else if ( isdefined( var_0.angles ) )
        var_6 = anglestoforward( var_0.angles );

    var_8 = [];

    foreach ( var_4 in level.players )
        var_8[var_8.size] = vectornormalize( var_4.origin - self.origin );

    foreach ( var_12 in var_8 )
    {
        if ( vectordot( var_6, var_12 ) > 0 )
            return 1;
    }

    var_14 = var_2 * var_2;

    foreach ( var_4 in level.players )
    {
        if ( distancesquared( var_4.origin, self.origin ) < var_14 )
            return 1;
    }

    return 0;
}

_id_4243( var_0 )
{
    if ( var_0.classname == "info_volume" )
    {
        self _meth_81ad( var_0 );
        self notify( "go_to_node_new_goal" );
        return;
    }

    _id_4245( var_0 );
}

_id_4245( var_0 )
{
    maps\_utility::_id_7E47( var_0 );
    self notify( "go_to_node_new_goal" );
}

_id_4244( var_0 )
{
    maps\_utility::_id_7E4B( var_0 );
    self notify( "go_to_node_new_goal" );
}

_id_91DA( var_0 )
{
    if ( !isdefined( var_0._not_team ) )
        return 0;

    var_1 = getentarray( var_0._not_team, "targetname" );

    if ( !var_1.size )
        return 0;

    var_2 = var_1[0];

    if ( var_2.classname != "misc_turret" )
        return 0;

    thread _id_9BD0( var_2 );
    return 1;
}

_id_733B( var_0 )
{
    waitframe;

    if ( isdefined( var_0 ) )
        var_0._id_238D = undefined;
}

_id_238B( var_0, var_1 )
{
    var_2 = 0;
    var_3 = [];
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( var_0._id_238D ) )
        {
            var_0._id_238D = 1;
            level thread _id_733B( var_0 );

            if ( isdefined( var_0._id_79D8 ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79D8] ) )
                    common_scripts\utility::_id_383D( var_0._id_79D8 );
            }

            if ( isdefined( var_0._id_79DA ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79DA] ) )
                    common_scripts\utility::_id_383D( var_0._id_79DA );
            }

            if ( isdefined( var_0._id_79D4 ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79D4] ) )
                    common_scripts\utility::_id_383D( var_0._id_79D4 );
            }

            if ( isdefined( var_0._not_team ) )
            {
                var_5 = [[ var_1 ]]( var_0._not_team );
                var_3 = common_scripts\utility::_id_07A5( var_3, var_5 );
            }
        }

        var_4++;

        if ( var_4 >= var_3.size )
            break;

        var_0 = var_3[var_4];
    }
}

_id_3DEF( var_0, var_1 )
{
    var_2["entity"] = ::_id_3E8A;
    var_2["origin"] = ::_id_3E8A;
    var_2["node"] = ::_id_3E8C;
    var_2["struct"] = ::_id_3E8E;
    var_3["entity"] = ::_id_4243;
    var_3["origin"] = ::_id_4243;
    var_3["struct"] = ::_id_4245;
    var_3["node"] = ::_id_4244;

    if ( !isdefined( var_1 ) )
        var_1 = "node";

    var_4 = [];

    if ( isdefined( var_0 ) )
        var_4["destination"][0] = var_0;
    else
    {
        var_0 = getentarray( self._not_team, "targetname" );

        if ( var_0.size > 0 )
            var_1 = "entity";

        if ( var_1 == "node" )
        {
            var_0 = getnodearray( self._not_team, "targetname" );

            if ( !var_0.size )
            {
                var_0 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );

                if ( !var_0.size )
                    return;

                var_1 = "struct";
            }
        }

        var_4["destination"] = var_0;
    }

    var_4["get_target_func"] = var_2[var_1];
    var_4["set_goal_func_quits"] = var_3[var_1];
    return var_4;
}

_id_7E4A()
{
    if ( isdefined( self._id_7A01 ) )
        self.goalheight = self._id_7A01;
    else
        self.goalheight = level._id_277F;
}

_id_7E49( var_0 )
{
    if ( isdefined( self._id_7AB2 ) )
    {
        self.goalradius = self._id_7AB2;
        return;
    }

    if ( isdefined( self._id_79E9 ) )
    {
        if ( isdefined( var_0 ) && isdefined( var_0.rank ) )
        {
            self.goalradius = var_0.rank;
            return;
        }
    }

    if ( !isdefined( self _meth_81ae() ) )
    {
        if ( self.unlockpoints == "civilian" )
            self.goalradius = 128;
        else
            self.goalradius = level._id_2780;
    }
}

_id_1170( var_0 )
{
    for (;;)
    {
        var_1 = self getturretowner();

        if ( !isalive( var_1 ) )
        {
            wait 1.5;
            continue;
        }

        if ( !isdefined( var_1.enemy ) )
        {
            self settargetentity( common_scripts\utility::_id_710E( var_0 ) );
            self notify( "startfiring" );
            self startfiring();
        }

        wait(2 + randomfloat( 1 ));
    }
}

_id_597D( var_0 )
{
    for (;;)
    {
        self settargetentity( common_scripts\utility::_id_710E( var_0 ) );
        self notify( "startfiring" );
        self startfiring();
        wait(2 + randomfloat( 1 ));
    }
}

_id_9BD0( var_0 )
{
    if ( self _meth_813f() && self.helmet == 150 )
    {
        self.helmet = 100;
        self.a._id_2B18 = 1;
    }

    self _meth_818e( var_0 );

    if ( isdefined( var_0._not_team ) && var_0._not_team != var_0.teambalanced )
    {
        var_1 = getentarray( var_0._not_team, "targetname" );
        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3].classname == "script_origin" )
                var_2[var_2.size] = var_1[var_3];
        }

        if ( isdefined( var_0._id_7953 ) )
            var_0 thread _id_1170( var_2 );
        else if ( isdefined( var_0._id_7A2A ) )
        {
            var_0 setmode( "manual_ai" );
            var_0 thread _id_597D( var_2 );
        }
        else if ( var_2.size > 0 )
        {
            if ( var_2.size == 1 )
            {
                var_0._id_5974 = var_2[0];
                var_0 settargetentity( var_2[0] );
                thread maps\_mgturret::_id_5975( var_0 );
            }
            else
                var_0 thread maps\_mgturret::_id_5BC9( var_2 );
        }
    }

    thread maps\_mgturret::_id_5BC4( var_0 );
    var_0 notify( "startfiring" );
}

_id_3661( var_0, var_1 )
{
    self endon( "death" );
    level._id_24E3[var_0] += self.count;
    var_2 = 1;

    while ( self.count > 0 )
    {
        self waittill( "spawned", var_3 );

        if ( var_2 )
        {
            if ( getdvar( "fallback", "0" ) == "1" )
            {

            }

            level notify( "fallback_firstspawn" + var_0 );
            var_2 = 0;
        }

        wait 0.05;

        if ( maps\_utility::_id_88F1( var_3 ) )
        {
            level notify( "fallbacker_died" + var_0 );
            level._id_24E3[var_0]--;
            continue;
        }

        var_3 thread _id_365A( var_0, var_1, "is spawner" );
    }
}

_id_365B( var_0, var_1 )
{
    var_0 waittill( "death" );
    level._id_24E3[var_1]--;
    level notify( "fallbacker_died" + var_1 );
}

_id_365A( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_3658 ) || !isdefined( self._id_3658[var_0] ) )
        self._id_3658[var_0] = 1;
    else
        return;

    self._id_79C6 = var_0;

    if ( !isdefined( var_2 ) )
        level._id_24E3[var_0]++;

    if ( isdefined( var_1 ) && level._id_365F[var_0] )
        thread _id_3659( var_0, var_1 );

    level thread _id_365B( self, var_0 );
}

_id_365D( var_0, var_1 )
{
    var_0 waittill( "death" );
    level notify( "fallback_reached_goal" + var_1 );
}

_id_365E()
{
    self waittill( "goal" );
    self.index = 0;
    self notify( "fallback_notify" );
    self notify( "stop_coverprint" );
}

_id_3659( var_0, var_1 )
{
    self notify( "stop_going_to_node" );
    self _meth_818f();
    self.index = 1;
    self _meth_81a9( var_1 );

    if ( _id_6123( var_1 ) )
        self.goalradius = var_1.rank;

    self endon( "death" );
    level thread _id_365D( self, var_0 );
    thread _id_365E();

    if ( getdvar( "fallback", "0" ) == "1" )
        thread _id_22BD( var_1.origin );

    self waittill( "fallback_notify" );
    level notify( "fallback_reached_goal" + var_0 );
}

_id_22BD( var_0 )
{
    self endon( "fallback_notify" );
    self endon( "stop_coverprint" );

    for (;;)
        wait 0.05;
}

_id_60AD( var_0, var_1 )
{
    var_2 = undefined;

    foreach ( var_4 in getallnodes() )
    {
        if ( isdefined( var_4._id_79C6 ) && var_4._id_79C6 == var_0 )
            var_2 = common_scripts\utility::_id_07A5( var_2, var_4 );
    }

    if ( !isdefined( var_2 ) )
        return;

    level._id_24E3[var_0] = 0;
    level._id_89C2[var_0] = 0;
    level._id_365F[var_0] = 0;
    var_6 = getspawnerarray();

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( isdefined( var_6[var_7]._id_79C6 ) && var_6[var_7]._id_79C6 == var_0 )
        {
            if ( var_6[var_7].count > 0 )
            {
                var_6[var_7] thread _id_3661( var_0, var_2[randomint( var_2.size )] );
                level._id_89C2[var_0]++;
            }
        }
    }

    var_8 = getaiarray();

    for ( var_7 = 0; var_7 < var_8.size; var_7++ )
    {
        if ( isdefined( var_8[var_7]._id_79C6 ) && var_8[var_7]._id_79C6 == var_0 )
            var_8[var_7] thread _id_365A( var_0 );
    }

    if ( !level._id_24E3[var_0] && !level._id_89C2[var_0] )
        return;

    var_6 = undefined;
    var_8 = undefined;
    thread _id_3663( var_0, var_1 );
    level waittill( "fallbacker_trigger" + var_0 );

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    level._id_365F[var_0] = 1;
    var_9 = undefined;
    var_8 = getaiarray();

    for ( var_7 = 0; var_7 < var_8.size; var_7++ )
    {
        if ( isdefined( var_8[var_7]._id_79C6 ) && var_8[var_7]._id_79C6 == var_0 || isdefined( var_8[var_7]._id_79C7 ) && isdefined( var_1 ) && var_8[var_7]._id_79C7 == var_1 )
            var_9 = common_scripts\utility::_id_07A5( var_9, var_8[var_7] );
    }

    var_8 = undefined;

    if ( !isdefined( var_9 ) )
        return;

    var_10 = var_9.size * 0.4;
    var_10 = int( var_10 );
    level notify( "fallback initiated " + var_0 );

    for ( var_7 = 0; var_7 < var_10; var_7++ )
        var_9[var_7] thread _id_3659( var_0, var_2[randomint( var_2.size )] );

    for ( var_7 = 0; var_7 < var_10; var_7++ )
        level waittill( "fallback_reached_goal" + var_0 );

    for ( var_7 = var_10; var_7 < var_9.size; var_7++ )
    {
        if ( isalive( var_9[var_7] ) )
            var_9[var_7] thread _id_3659( var_0, var_2[randomint( var_2.size )] );
    }
}

_id_3663( var_0, var_1 )
{
    level endon( "fallbacker_trigger" + var_0 );

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    for ( var_2 = 0; var_2 < level._id_89C2[var_0]; var_2++ )
    {
        if ( getdvar( "fallback", "0" ) == "1" )
        {

        }

        level waittill( "fallback_firstspawn" + var_0 );
    }

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    var_3 = getaiarray();

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        if ( isdefined( var_3[var_2]._id_79C6 ) && var_3[var_2]._id_79C6 == var_0 || isdefined( var_3[var_2]._id_79C7 ) && isdefined( var_1 ) && var_3[var_2]._id_79C7 == var_1 )
            var_3[var_2] thread _id_365A( var_0 );
    }

    var_3 = undefined;
    var_4 = level._id_24E3[var_0];

    for ( var_5 = 0; level._id_24E3[var_0] > var_4 * 0.5; var_5++ )
    {
        if ( getdvar( "fallback", "0" ) == "1" )
        {

        }

        level waittill( "fallbacker_died" + var_0 );
    }

    level notify( "fallbacker_trigger" + var_0 );
}

_id_3662( var_0 )
{
    if ( !isdefined( level._id_3658 ) || !isdefined( level._id_3658[var_0._id_79C6] ) )
        level thread _id_60AD( var_0._id_79C6, var_0._id_79C7 );

    var_0 waittill( "trigger" );
    level notify( "fallbacker_trigger" + var_0._id_79C6 );
    _id_533E( var_0 );
}

_id_0D2A( var_0 )
{
    self waittill( "goal" );

    if ( _id_6123( var_0 ) )
        self.goalradius = var_0.rank;
    else
        self.goalradius = level._id_2780;
}

_id_365C()
{
    self endon( "fallback" );
    self endon( "fallback_clear_goal" );
    self endon( "fallback_clear_death" );

    for (;;)
    {
        if ( isdefined( self._id_22BB ) )
        {

        }

        wait 0.05;
    }
}

_id_3660()
{
    self endon( "fallback_clear_goal" );
    self endon( "fallback_clear_death" );

    for (;;)
    {
        if ( isdefined( self._id_22BB ) )
        {

        }

        wait 0.05;
    }
}

_id_3658()
{
    var_0 = getnode( self._not_team, "targetname" );
    self._id_22BB = var_0;
    self _meth_81a9( var_0 );

    if ( isdefined( self._id_7ABF ) )
        thread _id_0D2A( var_0 );
    else if ( _id_6123( var_0 ) )
        self.goalradius = var_0.rank;
    else
        self.goalradius = level._id_2780;

    for (;;)
    {
        self waittill( "fallback" );
        self.invisible = 20;
        level thread _id_365D( self );

        if ( getdvar( "fallback", "0" ) == "1" )
            thread _id_3660();

        if ( isdefined( var_0._not_team ) )
        {
            var_0 = getnode( var_0._not_team, "targetname" );
            self._id_22BB = var_0;
            self _meth_81a9( var_0 );
            thread _id_365E();

            if ( _id_6123( var_0 ) )
                self.goalradius = var_0.rank;

            continue;
        }

        level notify( "fallback_arrived" + self._id_79C6 );
        return;
    }
}

_id_2819()
{
    wait 0.05;
    self delete();
}

_id_9EAD( var_0, var_1 )
{
    var_2 = var_0[0] - var_1[0];
    var_3 = var_0[1] - var_1[1];
    var_4 = var_0[2] - var_1[2];
    var_2 *= var_2;
    var_3 *= var_3;
    var_4 *= var_4;
    var_5 = var_2 + var_3 + var_4;
    return var_5;
}

_id_8A28( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_3A8E( var_0 )
{
    if ( !isdefined( level._id_3A8F ) )
        thread _id_3A90();

    for (;;)
    {
        var_0 waittill( "trigger" );
        level notify( "friendly_died" );

        if ( var_0.teambalanced == "friendly_wave" )
            level._id_3A91 = var_0;
        else
            level._id_3A91 = undefined;

        wait 1;
    }
}

_id_7EBC( var_0 )
{
    if ( !isdefined( self._not_team ) )
        return;

    var_1 = getentarray( self._not_team, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] maps\_utility::_id_7DF8( var_0 );
}

_id_3A98()
{
    if ( !isdefined( level._id_93F9 ) )
        level._id_93F9 = 0;

    level._id_93F9++;
    self waittill( "death" );
    level notify( "friendly_died" );
    level._id_93F9--;
}

_id_3A90()
{
    level._id_3A8F = 1;
    var_0 = getentarray( "friendly_wave", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::_id_7EBC, 0 );

    if ( !isdefined( level._id_5A3A ) )
        level._id_5A3A = 7;

    var_1 = 1;

    for (;;)
    {
        if ( isdefined( level._id_3A91 ) && isdefined( level._id_3A91._not_team ) )
        {
            var_2 = level._id_3A91;
            var_3 = getentarray( level._id_3A91._not_team, "targetname" );

            if ( !var_3.size )
            {
                level waittill( "friendly_died" );
                continue;
            }

            var_4 = 0;
            var_5 = isdefined( level._id_3A91.script_lightset );

            while ( isdefined( level._id_3A91 ) && level._id_93F9 < level._id_5A3A )
            {
                if ( var_2 != level._id_3A91 )
                {
                    var_5 = isdefined( level._id_3A91.script_lightset );
                    var_2 = level._id_3A91;
                    var_3 = getentarray( level._id_3A91._not_team, "targetname" );
                }
                else if ( !var_5 )
                    var_4 = randomint( var_3.size );
                else if ( var_4 == var_3.size )
                    var_4 = 0;

                var_3[var_4] maps\_utility::_id_7DF8( 1 );
                var_6 = isdefined( var_3[var_4]._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

                if ( isdefined( var_3[var_4]._id_79EB ) )
                    var_7 = var_3[var_4] stalingradspawn( var_6 );
                else
                    var_7 = var_3[var_4] dospawn( var_6 );

                var_3[var_4] maps\_utility::_id_7DF8( 0 );

                if ( maps\_utility::_id_88F1( var_7 ) )
                {
                    wait 0.2;
                    continue;
                }

                if ( isdefined( var_3[var_4]._id_797A ) )
                {
                    if ( var_3[var_4]._id_20A7 == "heat" )
                        var_7 maps\_utility::_id_30C9();

                    if ( var_3[var_4]._id_20A7 == "cqb" )
                        var_7 maps\_utility::_id_30B0();
                }

                if ( isdefined( level._id_3ABF ) )
                    level thread [[ level._id_3ABF ]]( var_7 );
                else
                    var_7 _meth_81ab( level.playercardbackground );

                if ( var_5 )
                {
                    if ( level._id_3A91.script_lightset == 0 )
                        waitframe;
                    else
                        wait(level._id_3A91.script_lightset);

                    var_4++;
                    continue;
                }

                wait(randomfloat( 5 ));
            }
        }

        level waittill( "friendly_died" );
    }
}

_id_3A70( var_0 )
{
    var_1 = getnode( var_0._not_team, "targetname" );
    var_2 = getent( var_1._not_team, "targetname" );
    var_2 setmode( "auto_ai" );
    var_2 cleartargetentity();
    var_3 = 0;

    for (;;)
    {
        var_0 waittill( "trigger", var_4 );

        if ( !isai( var_4 ) )
            continue;

        if ( !isdefined( var_4.team ) )
            continue;

        if ( var_4.team != "allies" )
            continue;

        if ( isdefined( var_4._id_7B0A ) && var_4._id_7B0A == 0 )
            continue;

        if ( var_4 thread _id_3A6E( var_2, var_1 ) )
        {
            var_4 thread _id_3A6D( var_2, var_1 );
            var_2 waittill( "friendly_finished_using_mg42" );

            if ( isalive( var_4 ) )
                var_4._id_999F = gettime() + 10000;
        }

        wait 1;
    }
}

_id_3A69( var_0, var_1 )
{
    var_1 endon( "friendly_finished_using_mg42" );
    var_0 waittill( "death" );
    var_1 notify( "friendly_finished_using_mg42" );
}

_id_3A6F( var_0 )
{
    var_0 endon( "friendly_finished_using_mg42" );
    self.usepathsmoothingvalues = 1;
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"PLATFORM_USEAIONMG42" );
    self waittill( "trigger" );
    self.usepathsmoothingvalues = 0;
    self sethintstring( "" );
    self _meth_818f();
    self notify( "stopped_use_turret" );
    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A6E( var_0, var_1 )
{
    if ( self.usepathsmoothingvalues )
        return 0;

    if ( isdefined( self._id_999F ) && gettime() < self._id_999F )
        return 0;

    if ( distance( level.playercardbackground.origin, var_1.origin ) < 100 )
        return 0;

    return 1;
}

_id_3A6B( var_0, var_1 )
{
    var_0 endon( "friendly_finished_using_mg42" );
    self waittill( "trigger" );
    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A6C()
{
    if ( !isdefined( self._id_3A67 ) )
        return;

    self._id_3A67 notify( "friendly_finished_using_mg42" );
}

_id_6144()
{
    self endon( "death" );
    self waittill( "goal" );
    self.goalradius = self._id_63DF;

    if ( self.goalradius < 32 )
        self.goalradius = 400;
}

_id_3A6D( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "friendly_finished_using_mg42" );
    level thread _id_3A69( self, var_0 );
    self._id_63DF = self.goalradius;
    self.goalradius = 28;
    thread _id_6144();
    self _meth_81a9( var_1 );
    self.index = 1;
    self waittill( "goal" );
    self.goalradius = self._id_63DF;

    if ( self.goalradius < 32 )
        self.goalradius = 400;

    self.index = 0;
    self.goalradius = self._id_63DF;

    if ( distance( level.playercardbackground.origin, var_1.origin ) < 32 )
    {
        var_0 notify( "friendly_finished_using_mg42" );
        return;
    }

    self._id_3A67 = var_0;
    thread _id_3A6F( var_0 );
    thread _id_3A68( var_0 );
    self _meth_818e( var_0 );

    if ( isdefined( var_0._not_team ) )
    {
        var_2 = getent( var_0._not_team, "targetname" );

        if ( isdefined( var_2 ) )
            var_2 thread _id_3A6B( var_0, self );
    }

    for (;;)
    {
        if ( distance( self.origin, var_1.origin ) < 32 )
            self _meth_818e( var_0 );
        else
            break;

        wait 1;
    }

    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A68( var_0 )
{
    self endon( "death" );
    var_0 waittill( "friendly_finished_using_mg42" );
    _id_3A6A();
}

_id_3A6A()
{
    self endon( "death" );
    var_0 = self._id_3A67;
    self._id_3A67 = undefined;
    self _meth_818f();
    self notify( "stopped_use_turret" );
    self.usepathsmoothingvalues = 0;
    self.goalradius = self._id_63DF;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._not_team ) )
        return;

    var_1 = getnode( var_0._not_team, "targetname" );
    var_2 = self.goalradius;
    self.goalradius = 8;
    self _meth_81a9( var_1 );
    wait 2;
    self.goalradius = 384;
    return;
    self waittill( "goal" );

    if ( isdefined( self._not_team ) )
    {
        var_1 = getnode( self._not_team, "targetname" );

        if ( isdefined( var_1._not_team ) )
            var_1 = getnode( var_1._not_team, "targetname" );

        if ( isdefined( var_1 ) )
            self _meth_81a9( var_1 );
    }

    self.goalradius = var_2;
}

_id_9193()
{
    if ( isdefined( level._id_616B ) )
        return;

    if ( isdefined( level._id_56E2 ) && !level._id_56E2 )
        return;

    maps\_utility::_id_0749( ::_id_9194 );
}

_id_9194( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( isalive( self ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( !isdefined( var_1.visionsetnaked ) )
        return;

    if ( var_1 maps\_vehicle::_id_5118() )
        return;

    if ( !isdefined( self._id_6159 ) )
        self startragdoll();

    if ( !isdefined( self ) )
        return;

    maps\_utility::_id_733C( ::_id_9194 );
}

_id_667A( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0._id_6678 = var_1;

    if ( isdefined( var_1.script_lightset ) )
        var_0._id_6675 = var_1.script_lightset;

    if ( isdefined( var_3 ) && isdefined( var_4 ) )
    {
        var_0._id_6676 = var_3;
        var_0._id_6677 = var_4;
    }
    else
        var_0._id_6679 = var_2;

    var_0 _meth_81aa( var_0.origin );
    var_0 _meth_81a9( var_1 );
    var_0.goalradius = 12;
    var_0 waittill( "goal" );
    var_0.goalradius = 28;
    var_0 waittill( "shot_at_target" );
    var_0._id_6676 = undefined;
    var_0._id_6679 = undefined;
    var_0._id_6675 = undefined;
}

_id_852D( var_0, var_1, var_2 )
{
    var_3 = getstartorigin( var_0, var_1, var_2 );

    for (;;)
        wait 0.05;
}

_id_8A17()
{
    maps\_utility::_id_7DF8( 1 );

    if ( isdefined( self._id_79EB ) )
        var_0 = self stalingradspawn();
    else
        var_0 = self dospawn();

    if ( maps\_utility::_id_88F1( var_0 ) )
        return;

    if ( isdefined( self._id_797A ) )
    {
        if ( self._id_797A == "heat" )
            var_0 maps\_utility::_id_30C9();

        if ( self._id_797A == "cqb" )
            var_0 maps\_utility::_id_30B0();
    }

    var_0._id_3AC0 = 1;
}

_id_A0D5()
{
    self endon( "death" );
    self waittill( "leaveSquad" );
}

_id_3ABC()
{
    common_scripts\utility::_id_0D13( getentarray( self._not_team, "targetname" ), ::_id_3ABD, self );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( _id_071E() && _id_3FA6() == self )
            _id_9A75();

        self waittill( "friendly_wave_start", var_3 );
        _id_7F79( var_3, self );

        if ( !isdefined( var_3._not_team ) )
            continue;

        var_4 = getent( var_3._not_team, "targetname" );
        var_4 thread _id_8A16( self );
    }
}

_id_38EA( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( isdefined( self.script_parentname ) && self.script_parentname == "instant_respawn" )
        var_0 = 1;

    level._id_89CE = [];
    var_1 = getentarray( self._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38ED, var_0 );
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        self waittill( "trigger", var_4 );

        if ( !_id_62FF() )
            continue;

        if ( !var_3 )
        {
            var_3 = 1;
            maps\_utility::script_lightset();
        }

        if ( self istouching( level.playercardbackground ) )
            var_2 = 1;
        else
        {
            if ( !isalive( var_4 ) )
                continue;

            if ( isplayer( var_4 ) )
                var_2 = 1;
            else if ( !isdefined( var_4._id_51B6 ) || !var_4._id_51B6 )
                continue;
        }

        var_1 = getentarray( self._not_team, "targetname" );

        if ( isdefined( var_1[0] ) )
        {
            if ( isdefined( var_1[0]._id_7AB4 ) )
                _id_24B6( var_1[0]._id_7AB4 );
        }

        var_1 = getentarray( self._not_team, "targetname" );

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            var_1[var_5]._id_6D73 = var_2;
            var_1[var_5] notify( "flood_begin" );
        }

        if ( var_2 )
        {
            wait 5;
            continue;
        }

        wait 0.1;
    }
}

_id_24B7( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_0[var_2]._id_7AB4] = 1;

    var_3 = getarraykeys( var_1 );
    var_4 = common_scripts\utility::_id_710E( var_3 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_7AB4 != var_4 )
            var_0[var_2] delete();
    }
}

_id_38ED( var_0 )
{
    if ( isdefined( self._id_7C07 ) )
        return;

    self._id_7C07 = 1;
    self._id_981E = 1;
    var_1 = self._not_team;
    var_2 = self.teambalanced;

    if ( !isdefined( var_1 ) && !isdefined( self._id_7A40 ) )
        waitframe;

    var_3 = [];

    if ( isdefined( var_1 ) )
    {
        var_4 = getentarray( var_1, "targetname" );

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( !issubstr( var_4[var_5].classname, "actor" ) )
                continue;

            var_3[var_3.size] = var_4[var_5];
        }
    }

    var_6 = spawnstruct();
    var_7 = self.origin;
    _id_38EE( var_6, var_3.size > 0, var_0 );

    if ( isalive( var_6._id_08B4 ) )
        var_6._id_08B4 waittill( "death" );

    if ( !isdefined( var_1 ) )
        return;

    var_4 = getentarray( var_1, "targetname" );

    if ( !var_4.size )
        return;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( !issubstr( var_4[var_5].classname, "actor" ) )
            continue;

        var_4[var_5].teambalanced = var_2;
        var_8 = var_1;

        if ( isdefined( var_4[var_5]._not_team ) )
        {
            var_9 = getent( var_4[var_5]._not_team, "targetname" );

            if ( !isdefined( var_9 ) || !issubstr( var_9.classname, "actor" ) )
                var_8 = var_4[var_5]._not_team;
        }

        var_4[var_5]._not_team = var_8;
        var_4[var_5] thread _id_38ED( var_0 );
        var_4[var_5]._id_6D73 = 1;
        var_4[var_5] notify( "flood_begin" );
    }
}

_id_38EE( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = self.count;

    if ( !var_1 )
        var_1 = isdefined( self.script_parentname ) && self.script_parentname == "delete";

    maps\_utility::_id_7DF8( 2 );

    if ( isdefined( self.script_lightset ) )
        var_4 = self.script_lightset;
    else
        var_4 = 0;

    for (;;)
    {
        self waittill( "flood_begin" );

        if ( self._id_6D73 )
            break;

        if ( var_4 )
            continue;

        break;
    }

    var_5 = distance( level.playercardbackground.origin, self.origin );

    while ( var_3 )
    {
        self._id_9887 = var_3;
        maps\_utility::_id_7DF8( 2 );
        wait(var_4);
        var_6 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

        if ( isdefined( self._id_79EB ) )
            var_7 = self stalingradspawn( var_6 );
        else
            var_7 = self dospawn( var_6 );

        if ( maps\_utility::_id_88F1( var_7 ) )
        {
            var_8 = 0;

            if ( var_4 < 2 )
                wait 2;

            continue;
        }
        else
        {
            if ( isdefined( self._id_797A ) )
            {
                if ( self._id_797A == "heat" )
                    var_7 maps\_utility::_id_30C9();

                if ( self._id_797A == "cqb" )
                    var_7 maps\_utility::_id_30B0();
            }

            thread _id_0856( var_7 );
            var_7 thread _id_38EB( self );

            if ( isdefined( self._id_792C ) )
                var_7._id_1300 = self._id_792C;

            var_0._id_08B4 = var_7;
            var_0 notify( "got_ai" );
            self waittill( "spawn_died", var_9, var_8 );

            if ( var_4 > 2 )
                var_4 = randomint( 4 ) + 2;
            else
                var_4 = 0.5 + randomfloat( 0.5 );
        }

        if ( var_9 )
        {
            _id_A0F1( var_5 );
            continue;
        }

        if ( _id_6D8A( var_8 || var_1, var_0._id_08B4 ) )
            var_3--;

        if ( !var_2 )
            _id_A101();
    }

    self delete();
}

_id_A0D7( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
}

_id_0856( var_0 )
{
    var_1 = self.teambalanced;

    if ( !isdefined( level._id_89CE[var_1] ) )
    {
        level._id_89CE[var_1] = spawnstruct();
        level._id_89CE[var_1] maps\_utility::_id_7DF8( 0 );
        level._id_89CE[var_1]._id_93F3 = 0;
    }

    if ( !isdefined( self._id_07E1 ) )
    {
        self._id_07E1 = 1;
        level._id_89CE[var_1]._id_93F3++;
    }

    level._id_89CE[var_1].count++;
    _id_A0D7( var_0 );
    level._id_89CE[var_1].count--;

    if ( !isdefined( self ) )
        level._id_89CE[var_1]._id_93F3--;

    if ( level._id_89CE[var_1]._id_93F3 )
    {
        if ( level._id_89CE[var_1].count / level._id_89CE[var_1]._id_93F3 < 0.32 )
            level._id_89CE[var_1] notify( "waveReady" );
    }
}

_id_273C( var_0 )
{
    self endon( "debug_stop" );
    self endon( "death" );

    for (;;)
        wait 0.05;
}

_id_A101()
{
    var_0 = self.teambalanced;

    if ( level._id_89CE[var_0].count )
        level._id_89CE[var_0] waittill( "waveReady" );
}

_id_6D8A( var_0, var_1 )
{
    if ( var_0 )
        return 1;

    if ( isdefined( var_1 ) && isdefined( var_1.origin ) )
        var_2 = var_1.origin;
    else
        var_2 = self.origin;

    if ( distance( level.playercardbackground.origin, var_2 ) < 700 )
        return 1;

    return bullettracepassed( level.playercardbackground geteye(), var_1 geteye(), 0, undefined );
}

_id_A0F1( var_0 )
{
    self endon( "flood_begin" );
    var_0 *= 0.75;

    while ( distance( level.playercardbackground.origin, self.origin ) > var_0 )
        wait 1;
}

_id_38EB( var_0 )
{
    thread _id_38EC();
    self waittill( "death", var_1 );
    var_2 = isalive( var_1 ) && isplayer( var_1 );

    if ( !var_2 && isdefined( var_1 ) && var_1.classname == "worldspawn" )
        var_2 = 1;

    var_3 = !isdefined( self );
    var_0 notify( "spawn_died", var_3, var_2 );
}

_id_38EC()
{
    if ( isdefined( self._id_7A40 ) )
        return;

    self endon( "death" );
    var_0 = getnode( self._not_team, "targetname" );

    if ( isdefined( var_0 ) )
        self _meth_81a9( var_0 );
    else
    {
        var_0 = getent( self._not_team, "targetname" );

        if ( isdefined( var_0 ) )
            self _meth_81aa( var_0.origin );
    }

    if ( isdefined( level._id_36AC ) )
    {
        self.pathlookaheaddist = level._id_36AC;
        self.pathrandompercent = level._id_5A30;
    }

    if ( isdefined( var_0.rank ) && var_0.rank >= 0 )
        self.goalradius = var_0.rank;
    else
        self.goalradius = 256;

    self waittill( "goal" );

    while ( isdefined( var_0._not_team ) )
    {
        var_1 = getnode( var_0._not_team, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 = var_1;
        else
            break;

        self _meth_81a9( var_0 );

        if ( _id_6123( var_0 ) )
            self.goalradius = var_0.rank;
        else
            self.goalradius = 256;

        self waittill( "goal" );
    }

    if ( isdefined( self.script_parentname ) )
    {
        if ( self.script_parentname == "delete" )
        {
            self kill();
            return;
        }
    }

    if ( isdefined( var_0._not_team ) )
    {
        var_2 = getent( var_0._not_team, "targetname" );

        if ( isdefined( var_2 ) && ( var_2.code_classname == "misc_mgturret" || var_2.code_classname == "misc_turret" ) )
        {
            self _meth_81a9( var_0 );
            self.goalradius = 4;
            self waittill( "goal" );

            if ( !isdefined( self._id_79E9 ) )
                self.goalradius = level._id_2780;

            _id_9BD0( var_2 );
        }
    }

    if ( isdefined( self.script_parentname ) )
    {
        if ( isdefined( self._id_7A84 ) )
        {
            if ( self._id_7A84 == "furniture_push" )
                thread _id_3B0F();
        }

        if ( self.script_parentname == "hide" )
        {
            thread maps\_utility::_id_7DDF( 0 );
            return;
        }
    }

    if ( !isdefined( self._id_79E9 ) && !isdefined( self _meth_81ae() ) )
        self.goalradius = level._id_2780;
}

_id_3B0F()
{
    var_0 = getent( self._not_team, "targetname" ).origin;
    common_scripts\utility::_id_69C2( "furniture_slide", var_0 );
    wait 0.9;

    if ( isdefined( level._id_A303 ) )
        common_scripts\utility::_id_69C2( common_scripts\utility::_id_710E( level._id_A303 ), var_0 );
}

_id_3A93()
{
    waitframe;
    var_0 = getentarray( self._not_team, "targetname" );

    if ( !var_0.size )
    {
        var_1 = getnode( self._not_team, "targetname" );

        for (;;)
        {
            self waittill( "trigger" );

            if ( isdefined( level._id_55A3 ) && level._id_55A3 == self )
            {
                wait 0.5;
                continue;
            }

            if ( !_id_62FF() )
            {
                wait 0.5;
                continue;
            }

            level notify( "new_friendly_trigger" );
            level._id_55A3 = self;
            var_2 = !isdefined( self._id_7959 ) || self._id_7959 == 0;
            _id_7FBC( var_1, var_2 );
        }
    }

    for (;;)
    {
        self waittill( "trigger" );

        while ( level.playercardbackground istouching( self ) )
            wait 0.05;

        if ( !_id_62FF() )
        {
            wait 0.05;
            continue;
        }

        if ( isdefined( level._id_55A3 ) && level._id_55A3 == self )
            continue;

        level notify( "new_friendly_trigger" );
        level._id_55A3 = self;
        common_scripts\utility::_id_0D13( var_0, ::_id_3ABE );
        wait 0.5;
    }
}

_id_62FF()
{
    var_0 = 1;

    if ( isdefined( self._id_7A8A ) )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_071A.size; var_1++ )
        {
            if ( !issubstr( self._id_7A8A, level._id_071A[var_1] ) )
                continue;

            var_0 = 1;
            break;
        }

        if ( !var_0 )
            return 0;
    }

    if ( !isdefined( self._id_7A8B ) )
        return var_0;

    var_2 = 0;

    for ( var_1 = 0; var_1 < level._id_4C12.size; var_1++ )
    {
        if ( !issubstr( self._id_7A8B, level._id_4C12[var_1] ) )
            continue;

        var_2++;
    }

    var_3 = strtok( self._id_7A8B, " " );
    return var_2 == var_3.size;
}

_id_3ABE( var_0 )
{
    level endon( "new_friendly_trigger" );
    self waittill( "trigger" );
    var_0 = getnode( self._not_team, "targetname" );
    var_1 = !isdefined( self._id_7959 ) || self._id_7959 == 0;
    _id_7FBC( var_0, var_1 );
}

_id_A0D4()
{
    self endon( "death" );
    var_0 = self._id_7986;

    while ( self.count )
    {
        self waittill( "spawned", var_1 );
        var_1 thread _id_2655( var_0 );
    }
}

_id_2655( var_0 )
{
    level._id_266B[var_0]++;
    self waittill( "death" );
    level._id_266B[var_0]--;
    level notify( "spawner_expired" + var_0 );
}

_id_2656()
{
    var_0 = self._id_7986;
    level._id_266B[var_0]++;
    var_1 = self.origin;
    _id_A0D4();
    level notify( "spawner dot" + var_1 );
    level._id_266B[var_0]--;
    level notify( "spawner_expired" + var_0 );
}

_id_3A94()
{
    var_0 = getentarray( "friendly_chain_on_death", "targetname" );
    var_1 = getspawnerarray();
    level._id_266B = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_7986 ) )
            continue;

        var_3 = var_1[var_2]._id_7986;

        if ( !isdefined( level._id_266B[var_3] ) )
            level._id_266B[var_3] = 0;

        var_1[var_2] thread _id_2656();
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_7986 ) )
            return;

        var_0[var_2] thread _id_3A95();
    }
}

_id_3A95()
{
    while ( level._id_266B[self._id_7986] > 0 )
        level waittill( "spawner_expired" + self._id_7986 );

    level endon( "start_chain" );
    var_0 = getnode( self._not_team, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        _id_7FBC( var_0, 1 );
        iprintlnbold( "Area secured, move up!" );
        wait 5;
    }
}

_id_7FBC( var_0, var_1 )
{
    level notify( "new_escort_trigger" );
    level notify( "new_escort_debug" );
    level notify( "start_chain", var_1 );
}

_id_3A96()
{
    level._id_3ABA = [];
    level._id_3ABB = [];
    common_scripts\utility::_id_0D13( getentarray( "friendlychain", "targetname" ), ::_id_3A93 );
}

_id_9A75()
{
    var_0 = [];
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_3ABA.size; var_2++ )
    {
        var_0[var_0.size] = level._id_3ABA[var_2];
        var_1[var_1.size] = level._id_3ABB[var_2];
    }

    level._id_3ABA = var_0;
    level._id_3ABB = var_1;

    if ( _id_071E() )
        return;

    common_scripts\utility::_id_3831( "spawning_friendlies" );
}

_id_3FA5()
{
    return level._id_3ABA[level._id_3ABA.size - 1];
}

_id_071E()
{
    return level._id_3ABA.size > 0;
}

_id_3FA6()
{
    return level._id_3ABB[level._id_3ABB.size - 1];
}

_id_7F79( var_0, var_1 )
{
    level._id_3ABA[level._id_3ABA.size] = var_0.origin;
    level._id_3ABB[level._id_3ABB.size] = var_1;
    common_scripts\utility::_id_383F( "spawning_friendlies" );
}

_id_27E5()
{
    self endon( "death" );
    self endon( "leaveSquad" );
    wait 0.5;
    self _meth_81ab( level.playercardbackground );
}

_id_8A16( var_0 )
{
    self notify( "stopTrigger" );
    self endon( "stopTrigger" );
    self waittill( "trigger" );

    if ( _id_3FA6() != var_0 )
        return;

    _id_9A75();
}

_id_3ABD( var_0 )
{
    var_1 = getent( self._not_team, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        var_0 notify( "friendly_wave_start", var_1 );

        if ( !isdefined( var_1._not_team ) )
            continue;
    }
}

_id_4255()
{
    var_0 = getentarray( "info_volume", "classname" );
    level._id_2654 = [];
    level._id_4255 = [];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_7986 ) )
            level._id_2654[var_2._id_7986] = var_2;

        if ( isdefined( var_2._id_7A03 ) )
            level._id_4255[var_2._id_7A03] = var_2;
    }
}

_id_2731( var_0, var_1, var_2 )
{
    if ( 1 )
        return;

    var_3 = self getorigin();
    var_4 = 40 * sin( var_3[0] + var_3[1] ) - 40;
    var_3 = ( var_3[0], var_3[1], var_3[2] + var_4 );
    level endon( var_1 );
    self endon( "new_color" );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0.8, 0.6 );

    var_5 = 0;

    for (;;)
    {
        var_5 += 12;
        var_6 = sin( var_5 ) * 0.4;

        if ( var_6 < 0 )
            var_6 *= -1;

        var_6 += 1;
        wait 0.05;
    }
}

_id_0956( var_0 )
{
    level._id_054A[var_0] = spawnstruct();
    level._id_054A[var_0]._id_0949 = 0;
    level._id_054A[var_0]._id_89CC = 0;
    level._id_054A[var_0]._id_08B4 = [];
    level._id_054A[var_0]._id_89CD = [];
}

_id_095A( var_0 )
{
    self endon( "death" );
    self._id_2760 = 0;
    var_0._id_89CC++;
    thread _id_0958( var_0 );
    thread _id_0959( var_0 );

    while ( self.count )
    {
        self waittill( "spawned", var_1 );

        if ( maps\_utility::_id_88F1( var_1 ) )
            continue;

        var_1 thread _id_0957( var_0 );
    }

    waitframe;

    if ( self._id_2760 )
        return;

    self._id_2760 = 1;
    var_0._id_89CC--;
}

_id_0958( var_0 )
{
    self waittill( "death" );

    if ( self._id_2760 )
        return;

    var_0._id_89CC--;
}

_id_0959( var_0 )
{
    self endon( "death" );
    self waittill( "emptied spawner" );
    waitframe;

    if ( self._id_2760 )
        return;

    self._id_2760 = 1;
    var_0._id_89CC--;
}

_id_0957( var_0 )
{
    var_0._id_0949++;
    var_0._id_08B4[var_0._id_08B4.size] = self;

    if ( isdefined( self._id_7988 ) )
        _id_A0D6();
    else
        self waittill( "death" );

    var_0._id_0949--;
}

_id_1A42( var_0 )
{
    var_1 = strtok( var_0._id_7A26, " " );
    var_2 = [];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_1[var_4];
        var_6 = getent( var_5, "script_linkname" );

        if ( isdefined( var_6 ) )
        {
            var_2 = common_scripts\utility::_id_07A5( var_2, var_6 );
            continue;
        }

        var_7 = getnode( var_5, "script_linkname" );

        if ( !isdefined( var_7 ) )
            continue;

        var_3 = common_scripts\utility::_id_07A5( var_3, var_7 );
    }

    var_0 waittill( "trigger" );
    var_3 = common_scripts\utility::_id_0CF5( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4]._id_1E1D = 0;

    var_8 = 0;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_9 = var_2[var_4];

        if ( !isdefined( var_9 ) )
            continue;

        if ( isdefined( var_9._id_7ACC ) )
            continue;

        while ( isdefined( var_3[var_8].script_parentname ) && var_3[var_8].script_parentname == "dont_spawn" )
            var_8++;

        var_9.origin = var_3[var_8].origin;
        var_9.angles = var_3[var_8].angles;
        var_9 maps\_utility::_id_0798( ::_id_1E1C, var_3[var_8] );
        var_8++;
    }

    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_0798, ::_id_1A40 );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_0798, ::_id_5F41, var_3 );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_88C3 );
}

_id_1A40()
{
    self.goalradius = 8;
    self.fixednode = 1;
}

_id_5F41( var_0 )
{
    self endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( !isalive( self.enemy ) )
        {
            self waittill( "enemy" );
            var_1 = 0;
            continue;
        }

        if ( isplayer( self.enemy ) )
        {
            if ( self.enemy maps\_utility::_id_32D8( "player_has_red_flashing_overlay" ) || common_scripts\utility::_id_382E( "player_flashed" ) )
            {
                self.fixednode = 0;

                for (;;)
                {
                    self.goalradius = 180;
                    self _meth_81aa( level.playercardbackground.origin );
                    wait 1;
                }

                return;
            }
        }

        if ( var_1 )
        {
            if ( self _meth_81c2( self.enemy ) )
            {
                wait 0.05;
                continue;
            }

            var_1 = 0;
        }
        else
        {
            if ( self _meth_81c2( self.enemy ) )
                var_1 = 1;

            wait 0.05;
            continue;
        }

        if ( randomint( 3 ) > 0 )
        {
            var_2 = _id_3770( var_0 );

            if ( isdefined( var_2 ) )
            {
                _id_1E1C( var_2, self._id_1E1F );
                self waittill( "goal" );
            }
        }
    }
}

_id_1E1C( var_0, var_1 )
{
    self _meth_81a9( var_0 );
    self._id_1E1F = var_0;
    var_0._id_1E1D = 1;

    if ( isdefined( var_1 ) )
        var_1._id_1E1D = 0;
}

_id_3770( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1]._id_1E1D )
            continue;
        else
            return var_0[var_1];
    }

    return undefined;
}

_id_38F4( var_0 )
{
    var_1 = getentarray( var_0._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38F0 );
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38F3, var_0 );
}

_id_38F0( var_0 )
{

}

_id_97DB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return isdefined( var_0._id_7AB7 );
}

_id_99E5( var_0 )
{
    var_1 = getent( var_0._not_team, "targetname" );
    waitframe;
    var_2 = getentarray( var_1._not_team, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3]._id_7A40 = 1;
        var_2[var_3] maps\_utility::_id_0798( ::_id_9FF2, var_1 );
    }

    var_0 waittill( "trigger" );
    var_2 = getentarray( var_1._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_88C3 );
}

_id_9FF2( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self.goalradius = 8;
    var_0 waittill( "trigger" );
    thread _id_4241();
}

_id_38F3( var_0 )
{
    if ( !isdefined( level._id_893E ) || isspawner( self ) )
        self endon( "death" );

    self notify( "stop current floodspawner" );
    self endon( "stop current floodspawner" );

    if ( _id_5072() )
    {
        _id_7070( var_0 );
        return;
    }

    var_1 = _id_97DB( var_0 );
    maps\_utility::script_lightset();

    if ( isdefined( level._id_893E ) )
    {
        if ( !isspawner( self ) )
            self.count = 1;
    }

    while ( self.count > 0 )
    {
        while ( var_1 && !level.playercardbackground istouching( var_0 ) )
            wait 0.5;

        var_2 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );
        var_3 = self;

        if ( isdefined( level._id_893E ) )
        {
            if ( !isspawner( self ) )
                var_3 = _id_3E68( self, 1 );
        }

        if ( isdefined( self._id_79EB ) )
            var_4 = var_3 stalingradspawn( var_2 );
        else
            var_4 = var_3 dospawn( var_2 );

        if ( maps\_utility::_id_88F1( var_4 ) )
        {
            wait 2;
            continue;
        }

        if ( isdefined( self._id_797A ) )
        {
            if ( self._id_797A == "heat" )
                var_4 maps\_utility::_id_30C9();

            if ( self._id_797A == "cqb" )
                var_4 maps\_utility::_id_30B0();
        }

        var_4 thread _id_7302( self );
        var_4 thread _id_3517( var_0 );

        if ( isdefined( var_4 ) && !isdefined( var_4.teambalanced ) )
        {
            if ( isdefined( self.teambalanced ) )
                var_4.teambalanced = self.teambalanced + "_AI";
        }

        var_4 waittill( "death", var_5 );

        if ( !_id_6BF3( var_4, var_5 ) )
            self.count++;
        else if ( isdefined( level._id_06CF ) )
        {
            if ( isdefined( level._id_06D0 ) && var_5 == level._id_06D0 )
            {
                if ( randomint( 2 ) == 0 )
                    self.count++;
            }
        }

        if ( !isdefined( var_4 ) )
            continue;

        if ( !maps\_utility::_id_7B20() )
            wait(randomfloatrange( 5, 9 ));
    }
}

_id_38F2()
{
    self notify( "stop current floodspawner" );
}

_id_6BF3( var_0, var_1 )
{
    if ( isdefined( self._id_79E5 ) )
    {
        if ( self._id_79E5 )
            return 1;
    }

    if ( !isdefined( var_0 ) )
        return 0;

    if ( isalive( var_1 ) )
    {
        if ( isplayer( var_1 ) )
            return 1;

        if ( distance( var_1.origin, level.playercardbackground.origin ) < 200 )
            return 1;
    }
    else if ( isdefined( var_1 ) )
    {
        if ( var_1.classname == "worldspawn" )
            return 0;

        if ( distance( var_1.origin, level.playercardbackground.origin ) < 200 )
            return 1;
    }

    if ( distance( var_0.origin, level.playercardbackground.origin ) < 200 )
        return 1;

    return bullettracepassed( level.playercardbackground geteye(), var_0 geteye(), 0, undefined );
}

_id_5072()
{
    if ( !isdefined( self._not_team ) )
        return 0;

    var_0 = getentarray( self._not_team, "targetname" );

    if ( !var_0.size )
        return 0;

    return issubstr( var_0[0].classname, "actor" );
}

_id_706F( var_0 )
{
    var_0._id_88BD waittill( "death" );
    self notify( "death_report" );
}

_id_7070( var_0 )
{
    self endon( "death" );
    var_1 = _id_97DB( var_0 );
    maps\_utility::script_lightset();

    if ( var_1 )
    {
        while ( !level.playercardbackground istouching( var_0 ) )
            wait 0.5;
    }

    var_2 = getentarray( self._not_team, "targetname" );
    self._id_89CD = 0;
    common_scripts\utility::_id_0D13( var_2, ::_id_7071, self );
    var_4 = randomint( var_2.size );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( self.count <= 0 )
            return;

        var_4++;

        if ( var_4 >= var_2.size )
            var_4 = 0;

        var_5 = var_2[var_4];
        var_5.count = 1;
        var_6 = var_5 maps\_utility::_id_88C3();

        if ( maps\_utility::_id_88F1( var_6 ) )
        {
            wait 2;
            continue;
        }

        self.count--;
        var_5._id_88BD = var_6;
        var_6 thread _id_7302( self );
        var_6 thread _id_3517( var_0 );
        thread _id_706F( var_5 );
    }

    var_7 = 0.01;

    while ( self.count > 0 )
    {
        self waittill( "death_report" );
        maps\_utility::_id_7B20();
        wait(var_7);
        var_7 += 2.5;
        var_4 = randomint( var_2.size );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_2 = common_scripts\utility::_id_0D01( var_2 );

            if ( !var_2.size )
            {
                if ( isdefined( self ) )
                    self delete();

                return;
            }

            var_4++;

            if ( var_4 >= var_2.size )
                var_4 = 0;

            var_5 = var_2[var_4];

            if ( isalive( var_5._id_88BD ) )
                continue;

            if ( isdefined( var_5._not_team ) )
                self._not_team = var_5._not_team;
            else
                self._not_team = undefined;

            var_6 = maps\_utility::_id_88C3();

            if ( maps\_utility::_id_88F1( var_6 ) )
            {
                wait 2;
                continue;
            }

            var_6 thread _id_7302( self );
            var_6 thread _id_3517( var_0 );
            var_5._id_88BD = var_6;
            thread _id_706F( var_5 );

            if ( self.count <= 0 )
                return;
        }
    }
}

_id_7071( var_0 )
{
    var_0 endon( "death" );
    var_0._id_89CD++;
    self waittill( "death" );
    var_0._id_89CD--;

    if ( !var_0._id_89CD )
        var_0 delete();
}

_id_3517( var_0 )
{
    if ( isdefined( self._id_79E9 ) )
        return;

    var_1 = level._id_2780;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_7AB2 ) )
        {
            if ( var_0._id_7AB2 == -1 )
                return;

            var_1 = var_0._id_7AB2;
        }
    }

    if ( isdefined( self._id_79E9 ) )
        return;

    self endon( "death" );
    self waittill( "goal" );
    self.goalradius = var_1;
}

_id_2F43()
{
    self endon( "death" );
    wait 95;
    self notify( "timeout" );
}

_id_2F44()
{
    self endon( "timeout" );
    thread _id_2F43();
    self waittill( "trigger" );
    maps\_utility::_id_1C72( 1 );
}

_id_949B( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_84C1()
{

}

_id_7118( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._not_team, "targetname" );

    if ( !var_1.size )
        return;

    var_2 = common_scripts\utility::_id_710E( var_1 );
    var_1 = [];
    var_1[var_1.size] = var_2;

    if ( isdefined( var_2._id_7A26 ) )
    {
        var_3 = strtok( var_2._id_7A26, " " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
            var_1[var_1.size] = getent( var_3[var_4], "script_linkname" );
    }

    waitframe;
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::_id_14C1 );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_88C3 );
}

_id_14C1()
{
    if ( isdefined( self._id_79E9 ) )
        return;

    self endon( "death" );
    self waittill( "reached_path_end" );

    if ( !isdefined( self _meth_81ae() ) )
        self.goalradius = level._id_2780;
}

_id_62ED( var_0 )
{
    var_1 = var_0 maps\_utility::_id_3EA3();
    common_scripts\utility::_id_383D( var_1 );

    while ( level._id_266B[var_0._id_7986] > 0 )
        level waittill( "spawner_expired" + var_0._id_7986 );

    common_scripts\utility::_id_383F( var_1 );
}

_id_8043()
{
    self endon( "death" );
    waitframe;
    self._id_508A = isplayer( self );
    self._id_333B = [];
    self._id_333C = [];

    for ( var_0 = 0; var_0 < level._id_333E; var_0++ )
        self._id_333B[var_0] = 0;
}

_id_08BA()
{
    level._id_08BA[level._id_9A29] = self;
    self waittill( "death" );
    waitframe;
    level._id_08BA[level._id_9A29] = undefined;
}
#using_animtree("generic_human");

_id_89C1( var_0 )
{
    var_1 = var_0 spawndrone();
    var_1 useanimtree( #animtree );

    if ( var_1.weapon_switch_invalid != "none" )
    {
        var_2 = getweaponmodel( var_1.weapon_switch_invalid );
        var_1 attach( var_2, "tag_weapon_right" );
        var_1 maps\_utility::_id_9AEE( var_1.weapon_switch_invalid );
    }

    var_1.spawntime = var_0;
    var_1._id_2E3F = isdefined( var_0.script_parentname ) && var_0.script_parentname == "drone_delete_on_unload";
    var_0 notify( "drone_spawned", var_1 );
    return var_1;
}

_id_89C9( var_0 )
{
    if ( !isdefined( var_0.spawntime ) )
    {

    }

    var_0.spawntime.count += 1;
    var_1 = var_0.spawntime;
    var_1.count++;
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_4 = var_1 stalingradspawn();
    var_5 = maps\_utility::_id_88F1( var_4 );

    if ( var_5 )
    {
        wait 0.05;
        var_4 = var_1 stalingradspawn();
    }

    var_4.spawntime = var_1;
    var_4 setmodel( var_0.motiontrackerenabled );
    var_4 codescripts\character::_id_7F88( var_0.headmodel );
    var_4._id_9CE7 = var_0._id_9CE7;
    var_4._id_9D1B = var_0._id_9D1B;
    var_4._id_8B09 = var_0._id_8B09;
    var_4._id_39B0 = var_0._id_39B0;
    var_4 _meth_83bd( var_0 );
    var_1.origin = var_2;
    var_1.angles = var_3;
    var_0 delete();
    var_6 = var_4.pc;
    return var_4;
}

_id_89C8( var_0 )
{
    var_1 = var_0.spawntime;
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_4 = var_1 maps\_utility::_id_2F29();

    if ( !isdefined( var_4 ) )
    {

    }

    var_4 setmodel( var_0.motiontrackerenabled );
    var_4 codescripts\character::_id_7F88( var_0.headmodel );
    var_4._id_9CE7 = var_0._id_9CE7;
    var_4._id_9D1B = var_0._id_9D1B;
    var_4._id_8B09 = var_0._id_8B09;
    var_4._id_39B0 = var_0._id_39B0;
    var_4 _meth_83bd( var_0 );
    var_1.origin = var_2;
    var_1.angles = var_3;
    var_0 delete();
    var_4 notify( "drone_stop" );
    return var_4;
}

_id_263B()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( !isdefined( self ) )
        return;

    achieve_enemy_killed_by_flash_banged( var_0 );
    thread achieve_carkilled_by_player( var_0 );
    thread achieve_three_of_kind( var_0, var_1 );
    thread achieve_four_of_kind( var_0, var_1 );
}

achieve_three_of_kind( var_0, var_1 )
{
    if ( self.team != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 != level.playercardbackground )
        return;

    if ( var_1 != "MOD_MELEE" )
        return;

    if ( !isdefined( level.achieve_three_of_kind ) )
        level.achieve_three_of_kind = 1;
    else
        level.achieve_three_of_kind++;

    if ( level.achieve_three_of_kind == 3 )
        maps\_utility::_id_41DD( "THREE_OF_A_KIND" );

    level notify( "achieve_three_of_kind" );
    level endon( "achieve_three_of_kind" );
    wait 4;
    level.achieve_three_of_kind = undefined;
}

achieve_four_of_kind( var_0, var_1 )
{
    if ( self.team != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 != level.playercardbackground )
        return;

    if ( var_1 == "MOD_MELEE" || !animscripts\utility::_id_25A6( "head", "neck", "helmet" ) )
    {
        level.achieve_four_of_kind = undefined;
        return;
    }

    if ( !isdefined( level.achieve_four_of_kind ) )
        level.achieve_four_of_kind = 1;
    else
        level.achieve_four_of_kind++;

    if ( level.achieve_four_of_kind == 4 )
        maps\_utility::_id_41DD( "FOUR_OF_A_KIND" );

    level notify( "achieve_four_of_kind" );
    level endon( "achieve_four_of_kind" );
    wait 12;
    level.achieve_four_of_kind = undefined;
}

achieve_enemy_killed_by_flash_banged( var_0 )
{
    if ( self.team != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( level._id_382E["player_flashed"] && var_0 == level.playercardbackground )
        maps\_utility::_id_41DD( "DAREDEVIL" );
}

achieve_carkilled_by_player( var_0 )
{
    if ( self.team != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.destuctableinfo ) )
        return;

    if ( !isdefined( var_0.attacker ) )
        return;

    if ( var_0.attacker != level.playercardbackground )
        return;

    if ( isdefined( level.achieve_car_killed_one ) )
    {
        maps\_utility::_id_41DD( "ROADKILL" );
        level.achieve_car_killed_one = undefined;
    }
    else
    {
        level.achieve_car_killed_one = 1;
        wait 0.05;
    }
}

_id_263C( var_0 )
{

}

_id_0789()
{
    var_0 = self._id_7AB3;
    var_1 = self._id_7AB4;

    if ( !isdefined( level._id_537C[var_0] ) )
        level._id_537C[var_0] = [];

    if ( !isdefined( level._id_537C[var_0][var_1] ) )
        level._id_537C[var_0][var_1] = [];

    level._id_537C[var_0][var_1][self._id_3584] = self;
}

_id_07B0()
{
    var_0 = self._id_7ACF;
    var_1 = self._id_7AD0;

    if ( !isdefined( level._id_8907[var_0] ) )
        level._id_8907[var_0] = [];

    if ( !isdefined( level._id_8907[var_0][var_1] ) )
        level._id_8907[var_0][var_1] = [];

    level._id_8907[var_0][var_1][self._id_3584] = self;
}

_id_8C18()
{
    self endon( "death" );
    self._id_2B0E = 1;
    wait 3;
    self._id_2B0E = 0;
}

_id_2671()
{
    self endon( "death" );
    wait(self._id_798A);
    wait(randomfloat( 10 ));
    self kill();
}
