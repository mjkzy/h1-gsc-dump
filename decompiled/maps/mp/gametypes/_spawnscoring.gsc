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

_id_40D7( var_0 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E16( var_3 );
        var_3._id_2477 = _id_2474( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
    {
        var_5 = _id_78A8( var_1["primary"] );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_1["secondary"].size )
    {
        var_5 = _id_78A8( var_1["secondary"] );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_5 = _id_78A8( var_1["bad"], 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_3 in var_0 )
    {
        _id_726E( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78A8( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_789D( var_4 );

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    var_2 = _id_7C62( var_2, var_0, var_1 );
    return var_2;
}

_id_40DC( var_0, var_1 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E16( var_4 );
        var_4._id_2477 = criticalfactors_twar( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
    {
        var_6 = _id_78AB( var_2["primary"], var_1 );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_2["secondary"].size )
    {
        var_6 = _id_78AB( var_2["secondary"], var_1 );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_6 = _id_78AB( var_2["bad"], var_1, 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_4 in var_0 )
    {
        if ( !isagent( self ) )
            _id_726E( var_4 );

        var_4._id_2477 = undefined;
    }

    return var_6;
}

criticalfactors_twar( var_0 )
{
    var_0._id_2477 = _id_2474( var_0 );

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::avoidspawninzone, var_0, level._id_99DC._id_A3DD ) )
        return "bad";

    return var_0._id_2477;
}

_id_78AB( var_0, var_1, var_2 )
{
    var_3 = var_0[0];

    foreach ( var_5 in var_0 )
    {
        _id_78A0( var_5, var_1 );

        if ( var_5._id_9400 > var_3._id_9400 )
            var_3 = var_5;
    }

    var_3 = _id_7C62( var_3, var_0, var_2 );
    return var_3;
}

checkdynamicspawns( var_0 )
{
    if ( isdefined( level._id_2FF2 ) )
        var_0 = [[ level._id_2FF2 ]]( var_0 );

    return var_0;
}

_id_7C62( var_0, var_1, var_2 )
{
    var_3 = var_0;
    var_4 = 0;

    if ( isdefined( var_2 ) && var_2 && var_1.size > 1 )
    {
        var_1 = maps\mp\_utility::_id_70A4( var_1, ::spawnpointcomparefunc );
        var_5 = int( min( level.badspawncount[self.team] / 2 + 1, var_1.size - 1 ) );
        var_3 = var_1[randomint( var_5 )];
        var_3._id_5188 = 1;
    }
    else
        var_4 = var_1.size;

    var_3._id_6293 = var_4;
    return var_3;
}

spawnpointcomparefunc( var_0, var_1 )
{
    return var_0._id_9400 >= var_1._id_9400;
}

recon_log_spawnpoint_info_wrapper( var_0 )
{
    _id_726E( var_0 );
}

_id_726E( var_0 )
{
    if ( !isdefined( var_0._id_5188 ) )
        var_0._id_5188 = 0;

    if ( !isdefined( var_0._id_91EA ) )
        var_0._id_91EA = "none";

    if ( !isdefined( var_0._id_55DE ) )
        var_0._id_55DE = "none";

    if ( !isdefined( var_0._id_55DF ) )
        var_0._id_55DF = -1;

    if ( level.teambased )
    {
        var_1 = var_0._id_3AE2["allies"];
        var_2 = var_0._id_3AE2["axis"];
        var_3 = var_0._id_222B["allies"];
        var_4 = var_0._id_222B["axis"];
        var_5 = var_0._id_5C45["allies"];
        var_6 = var_0._id_5C45["axis"];
    }
    else
    {
        var_1 = var_0._id_3AE2["all"];
        var_2 = -1;
        var_3 = var_0._id_222B["all"];
        var_4 = -1;
        var_5 = var_0._id_5C45["all"];
        var_6 = -1;
    }

    var_7 = -1;
    var_8 = -1;
    var_9 = -1;
    var_10 = -1;
    var_11 = -1;
    var_12 = -1;
    var_13 = -1;
    var_14 = -1;
    var_15 = "_spawnscoring.gsc";
    var_16 = gettime();
    var_17 = var_0.classname;
    var_18 = var_0._id_9400;
    var_19 = var_0._id_2477;
    var_20 = var_0._id_91EA;
    var_21 = var_0._id_65D1;

    if ( isdefined( var_0._id_2721[0] ) )
        var_7 = var_0._id_2721[0];

    if ( isdefined( var_0._id_2721[1] ) )
        var_8 = var_0._id_2721[1];

    if ( isdefined( var_0._id_2721[2] ) )
        var_9 = var_0._id_2721[2];

    if ( isdefined( var_0._id_2721[3] ) )
        var_10 = var_0._id_2721[3];

    if ( isdefined( var_0._id_2721[4] ) )
        var_11 = var_0._id_2721[4];

    if ( isdefined( var_0._id_2721[5] ) )
        var_12 = var_0._id_2721[5];

    if ( isdefined( var_0._id_2721[6] ) )
        var_13 = var_0._id_2721[6];

    if ( isdefined( var_0._id_2721[7] ) )
        var_14 = var_0._id_2721[7];

    var_22 = var_0._id_93FF;
    var_23 = -1;
    var_24 = -1;
    var_25 = -1;
    var_26 = -1;
    var_27 = -1;
    var_28 = -1;
    var_29 = -1;
    var_30 = -1;

    if ( isdefined( var_0._id_2733[0] ) )
        var_23 = var_0._id_2733[0];

    if ( isdefined( var_0._id_2733[1] ) )
        var_24 = var_0._id_2733[1];

    if ( isdefined( var_0._id_2733[2] ) )
        var_25 = var_0._id_2733[2];

    if ( isdefined( var_0._id_2733[3] ) )
        var_26 = var_0._id_2733[3];

    if ( isdefined( var_0._id_2733[4] ) )
        var_27 = var_0._id_2733[4];

    if ( isdefined( var_0._id_2733[5] ) )
        var_28 = var_0._id_2733[5];

    if ( isdefined( var_0._id_2733[6] ) )
        var_29 = var_0._id_2733[6];

    if ( isdefined( var_0._id_2733[7] ) )
        var_30 = var_0._id_2733[7];

    reconspatialevent( var_0.origin, "script_mp_spawnpoint_score: player_name %s, life_id %d, script_file %s, gameTime %d, classname %s, totalscore %d, totalPossibleScore %d, score_data0 %d, score_data1 %d, score_data2 %d, score_data3 %d, score_data4 %d, score_data5 %d, score_data6 %d, score_data7 %d, fullsights_allies %d, fullsights_axis %d, cornersights_allies %d, cornersights_axis %d, min_dist_squared_allies %d, min_dist_squared_axis %d, criticalResult %s, critical_data0 %d, critical_data1 %d, critical_data2 %d, critical_data3 %d, critical_data4 %d, critical_data5 %d, critical_data6 %d, critical_data7 %d, teambase %s, outside %d", self.name, self._id_56F7, var_15, var_16, var_17, var_18, var_22, var_23, var_24, var_25, var_26, var_27, var_28, var_29, var_30, var_1, var_2, var_3, var_4, var_5, var_6, var_19, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_20, var_21 );
}

_id_3788( var_0, var_1 )
{
    if ( var_1.size < 2 )
        return var_0;

    var_2 = var_1[0];

    if ( var_2 == var_0 )
        var_2 = var_1[1];

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == var_0 )
            continue;

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    return var_2;
}

_id_4E16( var_0 )
{
    var_0._id_9400 = 0;
    var_0._id_6293 = 0;
    var_0._id_2733 = [];
    var_0._id_2721 = [];
    var_0._id_93FF = 0;
}

_id_2474( var_0 )
{
    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11F9, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11FB, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11FF, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11F4, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11F5, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_1203, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11F8, var_0 ) )
        return "bad";

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::_id_11F6, var_0 ) )
        return "secondary";

    return "primary";
}

_id_789D( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.25, maps\mp\gametypes\_spawnfactor::_id_6EEC, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.25, maps\mp\gametypes\_spawnfactor::_id_1200, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_11FE, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_11FD, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_1201, var_0 );
    var_0._id_9400 += var_1;
}

_id_78A0( var_0, var_1 )
{
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.5, maps\mp\gametypes\_spawnfactor::avoidzone, var_0, var_1 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EF0, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_2;
}

_id_40D4( var_0, var_1 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E16( var_4 );
        var_4._id_2477 = _id_2474( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
    {
        var_6 = _id_78A5( var_2["primary"], var_1 );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_2["secondary"].size )
    {
        var_6 = _id_78A5( var_2["secondary"], var_1 );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_6 = _id_78A5( var_2["bad"], var_1, 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_4 in var_0 )
    {
        _id_726E( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

_id_78A5( var_0, var_1, var_2 )
{
    var_3 = var_0[0];

    foreach ( var_5 in var_0 )
    {
        _id_789A( var_5, var_1 );

        if ( var_5._id_9400 > var_3._id_9400 )
            var_3 = var_5;
    }

    var_3 = _id_7C62( var_3, var_0, var_2 );
    return var_3;
}

_id_789A( var_0, var_1 )
{
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EEE, var_0, var_1 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EF0, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.5, maps\mp\gametypes\_spawnfactor::_id_1200, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.5, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_11FE, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_1201, var_0 );
    var_0._id_9400 += var_2;
}

getspawnpoint_freeforall( var_0 )
{
    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        return maps\mp\gametypes\_legacyspawnlogic::getspawnpoint_dm( var_0 );

    var_0 = checkdynamicspawns( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E16( var_3 );
        var_3._id_2477 = _id_2474( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
        var_5 = _id_78A6( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_5 = _id_78A6( var_1["secondary"] );
    else
        var_5 = _id_78A6( var_1["bad"], 1 );

    foreach ( var_3 in var_0 )
    {
        _id_726E( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78A6( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_789B( var_4 );

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    var_2 = _id_7C62( var_2, var_0, var_1 );
    return var_2;
}

_id_789B( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.5, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_1200, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_11FE, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_11FD, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_1201, var_0 );
    var_0._id_9400 += var_1;
}

_id_40DA( var_0 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E16( var_3 );
        var_3._id_2477 = _id_2474( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
    {
        var_5 = _id_78AA( var_1["primary"] );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_1["secondary"].size )
    {
        var_5 = _id_78AA( var_1["secondary"] );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_5 = _id_78AA( var_1["bad"], 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_3 in var_0 )
    {
        _id_726E( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78AA( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_789F( var_4 );

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    var_2 = _id_7C62( var_2, var_0, var_1 );
    return var_2;
}

_id_789F( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 3.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EEC, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.5, maps\mp\gametypes\_spawnfactor::_id_11FE, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.5, maps\mp\gametypes\_spawnfactor::_id_11FD, var_0 );
    var_0._id_9400 += var_1;
}

_id_40D6( var_0 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];
    var_2 = var_0[randomint( var_0.size )];

    foreach ( var_4 in var_0 )
    {
        _id_4E16( var_4 );
        var_4._id_2477 = criticalfactors_hardpoint( var_4 );
        var_1[var_4._id_2477][var_1[var_4._id_2477].size] = var_4;
    }

    if ( var_1["primary"].size )
    {
        var_2 = _id_78A7( var_1["primary"] );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_1["secondary"].size )
    {
        var_2 = _id_78A7( var_1["secondary"] );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_2 = _id_78A7( var_1["bad"], 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_4 in var_0 )
    {
        _id_726E( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_2;
}

criticalfactors_hardpoint( var_0 )
{
    var_0._id_2477 = _id_2474( var_0 );

    if ( !maps\mp\gametypes\_spawnfactor::_id_2470( maps\mp\gametypes\_spawnfactor::avoidspawninzone, var_0, level._id_A3DD ) )
        return "bad";

    return var_0._id_2477;
}

_id_78A7( var_0, var_1 )
{
    var_2 = var_0[randomint( var_0.size )];

    foreach ( var_4 in var_0 )
    {
        _id_789C( var_4 );

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    var_2 = _id_7C62( var_2, var_0, var_1 );
    return var_2;
}

_id_789C( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.5, maps\mp\gametypes\_spawnfactor::avoidzone, var_0, level._id_A3DD );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EF0, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_1;
}

getspawnpoint_ctf( var_0, var_1 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    if ( !isdefined( var_1 ) )
        var_1 = self.team;

    foreach ( var_4 in var_0 )
    {
        _id_4E16( var_4 );
        var_4._id_2477 = _id_2474( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
    {
        var_6 = scorespawns_ctf( var_2["primary"], var_1 );
        level.badspawncount[var_1] = 0;
    }
    else if ( var_2["secondary"].size )
    {
        var_6 = scorespawns_ctf( var_2["secondary"], var_1 );
        level.badspawncount[var_1] = 0;
    }
    else
    {
        var_6 = scorespawns_ctf( var_2["bad"], var_1, 1 );
        level.badspawncount[var_1]++;
    }

    foreach ( var_4 in var_0 )
    {
        _id_726E( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

scorespawns_ctf( var_0, var_1, var_2 )
{
    var_3 = var_0[0];

    foreach ( var_5 in var_0 )
    {
        scorefactors_ctf( var_5, var_1 );

        if ( var_5._id_9400 > var_3._id_9400 )
            var_3 = var_5;
    }

    var_3 = _id_7C62( var_3, var_0, var_2 );
    return var_3;
}

scorefactors_ctf( var_0, var_1 )
{
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_1201, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.75, maps\mp\gametypes\_spawnfactor::avoidflagbydistance, var_0 );
    var_0._id_9400 += var_2;
}

_id_40D3( var_0, var_1 )
{
    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        return maps\mp\gametypes\_legacyspawnlogic::_id_40D7( var_0 );

    var_0 = checkdynamicspawns( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    if ( !isdefined( var_1 ) )
        var_1 = self.team;

    foreach ( var_4 in var_0 )
    {
        _id_4E16( var_4 );
        var_4._id_2477 = _id_2474( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
    {
        var_6 = _id_78A4( var_2["primary"], var_1 );
        level.badspawncount[var_1] = 0;
    }
    else if ( var_2["secondary"].size )
    {
        var_6 = _id_78A4( var_2["secondary"], var_1 );
        level.badspawncount[var_1] = 0;
    }
    else
    {
        var_6 = _id_78A4( var_2["bad"], var_1, 1 );
        level.badspawncount[var_1]++;
    }

    foreach ( var_4 in var_0 )
    {
        _id_726E( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

_id_78A4( var_0, var_1, var_2 )
{
    var_3 = var_0[0];

    foreach ( var_5 in var_0 )
    {
        _id_7899( var_5, var_1 );

        if ( var_5._id_9400 > var_3._id_9400 )
            var_3 = var_5;
    }

    var_3 = _id_7C62( var_3, var_0, var_2 );
    return var_3;
}

_id_7899( var_0, var_1 )
{
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_2;
    var_2 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.25, maps\mp\gametypes\_spawnfactor::_id_1201, var_0 );
    var_0._id_9400 += var_2;
}

_id_40D9( var_0 )
{
    var_0 = checkdynamicspawns( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E16( var_3 );
        var_3._id_2477 = _id_2474( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
    {
        var_5 = _id_78A9( var_1["primary"] );
        level.badspawncount[self.team] = 0;
    }
    else if ( var_1["secondary"].size )
    {
        var_5 = _id_78A9( var_1["secondary"] );
        level.badspawncount[self.team] = 0;
    }
    else
    {
        var_5 = _id_78A9( var_1["bad"], 1 );
        level.badspawncount[self.team]++;
    }

    foreach ( var_3 in var_0 )
        var_3._id_2477 = undefined;

    return var_5;
}

_id_78A9( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_789E( var_4 );

        if ( var_4._id_9400 > var_2._id_9400 )
            var_2 = var_4;
    }

    var_2 = _id_7C62( var_2, var_0, var_1 );
    return var_2;
}

_id_789E( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_712C, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 1.0, maps\mp\gametypes\_spawnfactor::_id_6EEC, var_0 );
    var_0._id_9400 += var_1;
    var_1 = maps\mp\gametypes\_spawnfactor::_id_788B( 0.5, maps\mp\gametypes\_spawnfactor::_id_11F7, var_0 );
    var_0._id_9400 += var_1;
}
