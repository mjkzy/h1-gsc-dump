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
    var_0 = [];
    var_0 = _id_242B( "DEEP_AND_HARD" );
    var_0 _id_07FD( "killhouse", 0, "EARN_A_WINGED_DAGGER", 1, undefined, undefined );
    var_0 _id_07FD( "cargoship", 0, "MAKE_THE_JUMP", 1, "THE_PACKAGE", undefined );
    var_0 _id_07FD( "coup", 0, undefined, 1, undefined, undefined );
    var_0 _id_07FD( "blackout", 0, "DANCING_IN_THE_DARK", 1, "THE_RESCUE", undefined );
    var_0 _id_07FD( "armada", 0, undefined, 1, "THE_SEARCH", undefined );
    var_0 _id_07FD( "bog_a", 0, "SAVE_THE_BACON", 1, "THE_BOG", undefined );
    var_0 _id_07FD( "hunted", 0, undefined, 1, "THE_ESCAPE", undefined );
    var_0 _id_07FD( "ac130", 0, "DEATH_FROM_ABOVE", 1, "THE_ESCAPE", undefined );
    var_0 _id_07FD( "bog_b", 0, undefined, 1, "THE_BOG", undefined );
    var_0 _id_07FD( "airlift", 0, undefined, 1, "THE_FIRST_HORSEMAN", undefined );
    var_0 _id_07FD( "aftermath", 0, undefined, 1, undefined, undefined );
    var_0 _id_07FD( "village_assault", 0, "WRONG_NUMBER", 1, "THE_SECOND_HORSEMAN", undefined );
    var_0 _id_07FD( "scoutsniper", 1, undefined, 1, "THE_SHOT", undefined );
    var_0 _id_07FD( "sniperescape", 0, "PIGGYBACK_RIDE", 1, "THE_SHOT", undefined );
    var_0 _id_07FD( "village_defend", 0, undefined, 1, "THE_THIRD_HORSEMAN", undefined );
    var_0 _id_07FD( "ambush", 0, "DESPERATE_MEASURES", 1, "THE_THIRD_HORSEMAN", undefined );
    var_0 _id_07FD( "icbm", 1, undefined, 1, "THE_ULTIMATUM", undefined );
    var_0 _id_07FD( "launchfacility_a", 1, undefined, 1, "THE_ULTIMATUM", undefined );
    var_0 _id_07FD( "launchfacility_b", 1, undefined, 1, "THE_ULTIMATUM", undefined );
    var_0 _id_07FD( "jeepride", 0, undefined, 1, "THE_FOURTH_HORSEMAN", undefined );
    var_0 _id_07FD( "airplane", 0, undefined, 1, "MILE_HIGH_CLUB", undefined );

    if ( isdefined( level._id_31B6 ) )
    {
        [[ level._id_31B6 ]]();
        level._id_31B6 = undefined;
    }

    precachestring( &"campaign_completed_popup" );
    level._id_5CE0 = var_0;
}

_id_2710()
{
    wait 10;

    while ( getdvarint( "test_next_mission" ) < 1 )
        wait 3;

    _id_05FF();
}

_setmissiondvar( var_0, var_1 )
{
    if ( maps\_cheat::is_cheating() || common_scripts\utility::_id_382E( "has_cheated" ) )
        return;

    if ( getdvar( "mis_cheat" ) == "1" )
        return;
}

_id_05FF()
{
    level notify( "achievements_level_complete" );
    level._id_60D6 = 1;
    level.playercardbackground enableinvulnerability();

    if ( _id_A5A4::_id_0CC3() )
    {
        level.arcademode_success = 1;
        thread maps\_arcademode::arcademode_ends();
        common_scripts\utility::_id_384A( "arcademode_ending_complete" );
    }

    var_0 = undefined;
    setsaveddvar( "ui_nextMission", "1" );
    setdvar( "ui_showPopup", "0" );
    setdvar( "ui_popupString", "" );
    game["previous_map"] = level.script_context;
    _id_A537::_id_1123( "aa_main_" + level.script_context );
    var_0 = level._id_5CE0 _id_4000( level.script_context );

    if ( !isdefined( var_0 ) )
        return;

    if ( level.script_context != "jeepride" && level.script_context != "airplane" )
    {
        thread _id_A546::_id_35E3( 1, undefined );
        _id_A5E8::_id_870C( "end_mission_fade_to_black" );
        wait 2;
        _id_A5A4::_id_56C0();
    }

    var_1 = level._id_5CE0 isallmisioncompleted();
    level._id_5CE0 _id_7F9F( var_0 );
    updategamerprofile();

    if ( level._id_5CE0 _id_4713( var_0 ) )
        _id_A5A4::_id_41DD( level._id_5CE0 _id_3ED8( var_0 ) );

    if ( level._id_5CE0 _id_4734( var_0 ) && _id_3FFF( var_0 ) == 4 && level._id_5CE0 _id_1CDA( var_0 ) )
        _id_A5A4::_id_41DD( level._id_5CE0 _id_4003( var_0 ) );

    if ( level._id_5CE0 _id_473A() && level._id_5CE0 _id_4014() > 2 )
        _id_A5A4::_id_41DD( level._id_5CE0 _id_3FC2() );

    level._id_5CE0 checkcampaigncompleted();
    var_2 = level._id_5CE0._id_56E5.size;

    if ( level.script_context == "airplane" )
    {
        if ( getdvarint( "arcademode_full" ) )
        {
            level.playercardbackground _meth_84ed( &"AIRPLANE_CAMPAIGN_COMPLETED" );
            level.playercardbackground waittill( "menuresponse" );
        }

        setsaveddvar( "ui_nextMission", "0" );
        changelevel( "" );
        return;
    }
    else
    {
        if ( var_1 != level._id_5CE0 isallmisioncompleted() )
        {
            level.playercardbackground _meth_84ed( &"campaign_completed_popup" );
            level.playercardbackground waittill( "menuresponse", var_3, var_4 );

            if ( var_4 == "quit" )
            {
                setsaveddvar( "ui_nextMission", "0" );
                changelevel( "" );
                return;
            }
        }

        var_2 = var_0 + 1;
    }

    if ( getdvarint( "limited_mode" ) )
    {
        setsaveddvar( "ui_nextMission", "0" );
        changelevel( "" );
    }
    else
    {
        if ( _id_A5A4::_id_0CC3() )
        {
            if ( !getdvarint( "arcademode_full" ) )
            {
                setsaveddvar( "ui_nextMission", "0" );
                changelevel( "" );
                return;
            }

            if ( level.script_context == "cargoship" )
            {
                changelevel( "blackout", level._id_5CE0 _id_3FDE( var_0 ) );
                return;
            }
            else if ( level.script_context == "airlift" )
            {
                changelevel( "village_assault", level._id_5CE0 _id_3FDE( var_0 ) );
                return;
            }
            else if ( level.script_context == "jeepride" )
            {
                changelevel( "airplane", level._id_5CE0 _id_3FDE( var_0 ) );
                return;
            }
        }

        if ( level.script_context == "jeepride" )
        {
            setdvar( "credits_load", "1" );
            changelevel( "simplecredits", level._id_5CE0 _id_3FDE( var_0 ) );
            return;
        }

        if ( level._id_5CE0 _id_85C2( var_0 ) )
        {
            changelevel( level._id_5CE0 _id_4001( var_2 ), level._id_5CE0 _id_3FDE( var_0 ) );
            return;
        }

        missionsuccess( level._id_5CE0 _id_4001( var_2 ), level._id_5CE0 _id_3FDE( var_0 ) );
    }
}

_id_9B73()
{
    var_0 = int( _id_4135() * 100 );

    if ( getdvarint( "mis_cheat" ) == 0 )
        level.playercardbackground _meth_8213( "percentCompleteSP", var_0 );

    return var_0;
}

_id_4135()
{
    var_0 = max( _id_40ED(), _id_40F1() );
    var_1 = 0.5;
    var_2 = _id_40EE();
    var_3 = 0.25;
    var_4 = _id_40F2();
    var_5 = 0.1;
    var_6 = _id_40EF();
    var_7 = 0.15;
    var_8 = 0.0;
    var_8 += var_1 * var_0;
    var_8 += var_3 * var_2;
    var_8 += var_5 * var_4;
    var_8 += var_7 * var_6;
    return var_8;
}

_id_40F0( var_0 )
{
    var_1 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    var_2 = 0;
    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < level._id_5CE0._id_56E5.size; var_5++ )
    {
        if ( int( var_1[var_5] ) >= var_0 )
            var_2++;
    }

    var_6 = var_2 / level._id_5CE0._id_56E5.size * 100;
    return var_6;
}

_id_40ED()
{
    var_0 = 1;
    return _id_40F0( var_0 );
}

_id_40F1()
{
    var_0 = 2;
    return _id_40F0( var_0 );
}

_id_40EE()
{
    var_0 = 3;
    return _id_40F0( var_0 );
}

_id_40F2()
{
    var_0 = 4;
    return _id_40F0( var_0 );
}

_id_40EF()
{
    var_0 = 45;
    var_1 = level.playercardbackground _meth_8212( "cheatPoints" ) / var_0 * 100;
    return var_1;
}

_id_3FFF( var_0 )
{
    return int( level.playercardbackground _meth_8212( "missionHighestDifficulty" )[var_0] );
}

_id_40CF( var_0 )
{
    return int( level.playercardbackground _meth_8212( "missionSOHighestDifficulty" )[var_0] );
}

_id_7F9F( var_0 )
{
    var_1 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    var_2 = "";
    var_3 = level._id_3BFE;

    if ( level.script_context == "killhouse" || level.script_context == "coup" || level.script_context == "aftermath" )
        var_3 = 3;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( var_4 != var_0 )
        {
            var_2 += var_1[var_4];
            continue;
        }

        if ( var_3 + 1 > int( var_1[var_0] ) )
        {
            var_2 += ( var_3 + 1 );
            continue;
        }

        var_2 += var_1[var_4];
    }

    var_5 = 0;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        if ( int( var_2[var_6] ) > 0 )
            var_5 = var_6;
    }

    _id_0636( var_5 );
    _id_063A( var_2 );
}

_id_0636( var_0 )
{
    if ( maps\_cheat::is_cheating() || common_scripts\utility::_id_382E( "has_cheated" ) )
        return;

    if ( getdvar( "mis_cheat" ) == "1" )
        return;

    level.playercardbackground _meth_8213( "highestMission", var_0 );
}

_id_063A( var_0 )
{
    if ( maps\_cheat::is_cheating() || common_scripts\utility::_id_382E( "has_cheated" ) )
        return;

    if ( getdvar( "mis_cheat" ) == "1" )
        return;

    level.playercardbackground _meth_8213( "missionHighestDifficulty", var_0 );
}

_id_4002( var_0 )
{
    var_1 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    return int( var_1[var_0] );
}

_id_4025( var_0 )
{
    if ( var_0 < 9 )
        return "mis_0" + ( var_0 + 1 );
    else
        return "mis_" + ( var_0 + 1 );
}

_id_4014()
{
    var_0 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    var_1 = 4;

    for ( var_2 = 0; var_2 < self._id_56E5.size; var_2++ )
    {
        if ( int( var_0[var_2] ) < var_1 )
            var_1 = int( var_0[var_2] );
    }

    return var_1;
}

isallmisioncompleted()
{
    var_0 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );

    for ( var_1 = 0; var_1 < self._id_56E5.size; var_1++ )
    {
        if ( int( var_0[var_1] ) == 0 )
            return 0;
    }

    return 1;
}

checkcampaigncompleted()
{
    var_0 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    var_1 = 1;
    var_2 = 1;

    for ( var_3 = 0; var_3 < self._id_56E5.size - 1; var_3++ )
    {
        if ( int( var_0[var_3] ) == 0 )
            var_1 = 0;

        if ( int( var_0[var_3] ) < 3 )
            var_2 = 0;
    }

    if ( var_1 )
        _id_A5A4::_id_41DD( "CAMPAIGN_COMPLETE" );

    if ( var_2 )
        _id_A5A4::_id_41DD( "DEEP_AND_HARD" );
}

_id_242B( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_56E5 = [];
    var_1._id_6F1E = [];
    var_1._id_46CC = var_0;
    return var_1;
}

_id_07FD( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = self._id_56E5.size;
    self._id_56E5[var_7] = spawnstruct();
    self._id_56E5[var_7].nearz = var_0;
    self._id_56E5[var_7]._id_52E4 = var_1;
    self._id_56E5[var_7]._id_06DF = var_2;
    self._id_56E5[var_7]._id_85C2 = var_3;
    self._id_56E5[var_7]._id_9D93 = var_4;

    if ( isdefined( var_5 ) )
        self._id_56E5[var_7]._id_35E9 = var_5;
}

_id_0821( var_0 )
{
    var_1 = self._id_6F1E.size;
    self._id_6F1E[var_1] = var_0;
}

_id_4000( var_0 )
{
    foreach ( var_3, var_2 in self._id_56E5 )
    {
        if ( var_2.nearz == var_0 )
            return var_3;
    }

    return undefined;
}

_id_4001( var_0 )
{
    return self._id_56E5[var_0].nearz;
}

_id_3FDE( var_0 )
{
    return self._id_56E5[var_0]._id_52E4;
}

_id_3ED8( var_0 )
{
    return self._id_56E5[var_0]._id_06DF;
}

_id_4003( var_0 )
{
    return self._id_56E5[var_0]._id_9D93;
}

_id_3F90( var_0 )
{
    if ( !isdefined( self._id_56E5[var_0]._id_35E9 ) )
        return undefined;

    return self._id_56E5[var_0]._id_35E9;
}

_id_4734( var_0 )
{
    if ( isdefined( self._id_56E5[var_0]._id_9D93 ) )
        return 1;
    else
        return 0;
}

_id_4713( var_0 )
{
    if ( isdefined( self._id_56E5[var_0]._id_06DF ) )
        return 1;
    else
        return 0;
}

_id_1CDA( var_0 )
{
    for ( var_1 = 0; var_1 < self._id_56E5.size; var_1++ )
    {
        if ( var_1 == var_0 )
            continue;

        if ( !_id_4734( var_1 ) )
            continue;

        if ( self._id_56E5[var_1]._id_9D93 == self._id_56E5[var_0]._id_9D93 )
        {
            if ( _id_3FFF( var_1 ) < 4 )
                return 0;
        }
    }

    return 1;
}

_id_85C2( var_0 )
{
    if ( !isdefined( self._id_56E5[var_0]._id_85C2 ) )
        return 0;

    return self._id_56E5[var_0]._id_85C2;
}

_id_3FC2()
{
    return self._id_46CC;
}

_id_473A()
{
    if ( isdefined( self._id_46CC ) )
        return 1;
    else
        return 0;
}

_id_403E()
{
    for ( var_0 = 0; var_0 < self._id_56E5.size; var_0++ )
    {
        if ( !_id_4002( var_0 ) )
            return var_0;
    }

    return 0;
}

_id_3988()
{
    var_0 = level.playercardbackground _meth_8212( "missionHighestDifficulty" );
    var_1 = "";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_2 < 20 )
        {
            var_1 += 2;
            continue;
        }

        var_1 += 0;
    }

    level.playercardbackground _meth_8213( "missionHighestDifficulty", var_1 );
    level.playercardbackground _meth_8213( "highestMission", 20 );
}

_id_1EE2()
{
    level.playercardbackground _meth_8213( "missionHighestDifficulty", "00000000000000000000000000000000000000000000000000" );
    level.playercardbackground _meth_8213( "highestMission", 1 );
}

_id_2452()
{
    changelevel( "airplane", 0 );
}

_id_3139( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == 0 )
        return;

    _id_A5E8::_id_870C( "finish_mission_fade", var_0 );
    var_1 = _id_A546::_id_23A2( "black", 0, level.playercardbackground );
    var_1.space = 100;
    var_1 fadeovertime( var_0 );
    var_1.alpha = 1;
    wait(var_0);
}
