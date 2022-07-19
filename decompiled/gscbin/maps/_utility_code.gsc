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

_id_5778( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_3 * 20; var_4++ )
        wait 0.05;
}

_id_8F6A( var_0, var_1 )
{
    var_2 = var_0._id_8F61;
    var_3 = var_1._id_8F61;
    self._id_0CD8[var_3] = var_0;
    self._id_0CD8[var_2] = var_1;
    self._id_0CD8[var_2]._id_8F61 = var_2;
    self._id_0CD8[var_3]._id_8F61 = var_3;
}

_id_A05E( var_0, var_1 )
{
    waitframe;
    var_2 = [];

    if ( level._id_9FE1 == 1 )
    {
        var_2[0] = randomfloatrange( var_0, var_1 );
        level._id_9FE0 = var_2;
        level._id_071C = undefined;
        return;
    }

    var_2[0] = var_0;
    var_2[var_2.size] = var_1;

    for ( var_3 = 1; var_3 < level._id_9FE1 - 1; var_3++ )
        var_2 = _id_A05F( var_2 );

    level._id_9FE0 = common_scripts\utility::_id_0CF5( var_2 );
    level._id_071C = undefined;
}

_id_A05F( var_0 )
{
    var_1 = -1;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size - 1; var_3++ )
    {
        var_4 = var_0[var_3 + 1] - var_0[var_3];

        if ( var_4 <= var_2 )
            continue;

        var_2 = var_4;
        var_1 = var_3;
    }

    var_5 = [];

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        if ( var_1 == var_6 - 1 )
            var_5[var_5.size] = randomfloatrange( var_0[var_1], var_0[var_1 + 1] );

        var_5[var_5.size] = var_0[var_6];
    }

    return var_5;
}

_id_A0A6( var_0 )
{
    while ( level._id_266B[self._id_7986] > 0 )
        level waittill( "spawner_expired" + self._id_7986 );

    if ( var_0 )
        self waittill( "trigger" );

    var_1 = _id_A5A4::_id_3EA3();
    common_scripts\utility::_id_383F( var_1 );
}

_id_9FFA()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    while ( self._id_51B3 )
        wait 0.05;
}

_id_9FCA( var_0 )
{
    self endon( "death" );
    var_0 endon( "trigger" );
    self waittill( "trigger" );
    var_0 notify( "trigger" );
}

_id_9FC3( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );
    var_3 = spawnstruct();
    common_scripts\utility::_id_0D13( var_2, ::_id_9FCA, var_3 );
    var_3 waittill( "trigger" );
}

_id_32EE( var_0 )
{
    self endon( "done" );
    var_0 waittill( "trigger" );
    self notify( "done" );
}

_id_9AB0()
{
    self notify( "debug_color_update" );
    self endon( "debug_color_update" );
    var_0 = self._id_9A29;
    self waittill( "death" );
    level._id_2685[var_0] = undefined;
    level notify( "updated_color_friendlies" );
}

_id_9AAF( var_0 )
{
    thread _id_9AB0();

    if ( isdefined( self._id_79E6 ) )
        level._id_2685[var_0] = self._id_79E6;
    else
        level._id_2685[var_0] = undefined;

    level notify( "updated_color_friendlies" );
}

new_color_being_set( var_0 )
{
    self notify( "new_color_being_set" );
    self._id_609C = 1;
    _id_A51C::_id_5674();
    self endon( "new_color_being_set" );
    self endon( "death" );
    waitframe;
    waitframe;

    if ( isdefined( self._id_79E6 ) )
    {
        self._id_250C = level._id_250D[self.team][self._id_79E6];

        if ( !isdefined( self._id_2D2E ) )
            thread _id_A51C::_id_427C();
        else
            self._id_2D2E = undefined;
    }

    self._id_609C = undefined;
    self notify( "done_setting_new_color" );
}

_id_70CA( var_0 )
{
    var_1 = gettime();

    for (;;)
    {
        if ( !isdefined( self._id_061C ) )
            break;

        self waittill( "finished_radio" );

        if ( gettime() > var_1 + 7500 )
            return;
    }

    self._id_061C = 1;
    _id_A5A4::_id_9F8C( level._id_5541, 0.5 );
    level.playercardbackground _id_A5A4::_id_69C4( level._id_78B9[var_0] );
    self._id_061C = undefined;
    level._id_5541 = gettime();
    self notify( "finished_radio" );
}

_id_32ED( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
}

_id_A08A( var_0, var_1, var_2 )
{
    var_0 endon( "done" );
    [[ var_1 ]]( var_2 );
    var_0 notify( "done" );
}

_id_490E( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        wait(var_0);
        return;
    }

    var_2 = var_0 * 20;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( [[ var_1 ]]() )
            break;

        wait 0.05;
    }
}

_id_48EA( var_0 )
{
    wait(var_0);
    self._id_9361 = 1;
}

_id_48E2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    return var_0 + _id_05CC( var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_05CC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getsticksconfig();

    if ( level.playercardbackground common_scripts\utility::_id_5064() )
    {
        if ( isdefined( level.pushable ) && level.pushable || isdefined( level.radaralwayson ) && level.radaralwayson )
        {
            if ( issubstr( var_6, "southpaw" ) || var_5 && issubstr( var_6, "legacy" ) )
                return var_4;
            else
                return var_3;
        }
        else if ( issubstr( var_6, "southpaw" ) || var_5 && issubstr( var_6, "legacy" ) )
            return var_2;
        else
            return var_1;
    }
    else
        return var_0;
}

_id_05CE( var_0, var_1 )
{
    var_2 = var_1 + var_0;
    var_3 = level._id_97A7[var_2];
    level._id_48B4 = var_3;
}

_id_05CD( var_0, var_1 )
{
    var_2 = var_1 + var_0;
    var_3 = level._id_97A8[var_2];
    level._id_24EC settext( var_3 );
}

_id_48E3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    level notify( "hint_change_config" );
    level endon( "hint_change_config" );
    var_7 = _id_05CC( var_1, var_2, var_3, var_4, var_5, var_6 );
    _id_05CE( var_7, var_0 );
    _id_05CD( var_7, var_0 );

    while ( isdefined( level._id_24EC ) )
    {
        var_8 = _id_05CC( var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( var_8 != var_7 )
        {
            var_7 = var_8;
            _id_05CE( var_7, var_0 );
            _id_05CD( var_7, var_0 );
        }

        waittillframeend;
    }
}

_id_490D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = gettime();

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isalive( self ) )
        return;

    if ( !isdefined( var_7 ) )
        var_7 = 0;

    if ( isdefined( var_8 ) )
        var_7 -= 14;

    var_10 = var_7;

    if ( level.console )
        var_10 -= 1;

    var_11 = 1.0;
    var_12 = 0.75;
    var_13 = 1.0;
    var_14 = 0.5;

    if ( isdefined( level._id_48CD ) )
        var_14 = level._id_48CD;

    if ( isdefined( self._id_24E9 ) )
    {
        if ( self._id_24E9 == var_0 )
            return;
    }

    _id_A5A4::_id_32E4( "global_hint_in_use" );

    if ( isdefined( self._id_24E9 ) )
    {
        if ( self._id_24E9 == var_0 )
            return;
    }

    _id_A5A4::_id_32DE( "global_hint_in_use" );
    self._id_24E9 = var_0;
    _id_A546::_id_0763( var_8, var_7 );
    var_15 = _id_A546::_id_23ED( "timer", var_14 );
    level._id_24EC = var_15;
    level._id_48B4 = var_1;
    thread _id_28C4( var_15 );
    level endon( "friendlyfire_mission_fail" );
    var_15.alpha = 1.0;
    var_15 _id_A546::_id_7FEE( "TOP", undefined, 0, 127 + var_10 );
    var_15.foreground = 0;
    var_15.high_priority = 1;
    var_15.hindlegstraceoffset = 1;
    var_15 settext( var_0 );

    if ( isdefined( level._id_48D9 ) && level._id_48D9 || isdefined( level._id_8637._id_8A56 ) && level._id_8637._id_8A56 < 0.1 )
    {
        var_15.alpha = var_13;
        _id_490E( 0, level._id_48B4 );
    }
    else
    {
        var_15.alpha = 0;
        var_15 fadeovertime( var_11 );
        var_15.alpha = var_13;
        _id_490E( var_11, level._id_48B4 );
    }

    var_16 = 0;

    if ( isdefined( var_4 ) )
        var_16 = 3;
    else if ( isdefined( var_3 ) )
        var_16 = 2;
    else if ( isdefined( var_2 ) )
        var_16 = 1;

    var_17 = spawnstruct();
    var_17._id_9361 = 0;

    if ( isdefined( var_5 ) )
        var_17 thread _id_48EA( var_5 );

    if ( isdefined( level._id_48B4 ) )
    {
        for (;;)
        {
            _id_490E( var_12, level._id_48B4 );

            if ( var_16 == 3 )
            {
                if ( [[ level._id_48B4 ]]( var_2, var_3, var_4 ) )
                    break;

                continue;
            }

            if ( var_16 == 2 )
            {
                if ( [[ level._id_48B4 ]]( var_2, var_3 ) )
                    break;

                continue;
            }

            if ( var_16 == 1 )
            {
                if ( [[ level._id_48B4 ]]( var_2 ) )
                    break;

                continue;
            }

            if ( [[ level._id_48B4 ]]() )
                break;
        }
    }
    else
    {
        for ( var_18 = 0; var_18 < 10; var_18++ )
            _id_490E( var_12, level._id_48B4 );
    }

    _id_A5A4::_id_9F8C( var_9, var_6 );
    var_15 notify( "destroying" );
    self._id_24E9 = undefined;
    _id_A546::clear_hint_background();
    var_15 destroy();
    level._id_24EC = undefined;
    _id_A5A4::_id_32DA( "global_hint_in_use" );
}

_id_48FB( var_0 )
{
    level.playercardbackground notify( "HintDisplayHandlerEnd" );
    level.playercardbackground endon( "HintDisplayHandlerEnd" );
    level.playercardbackground _id_A5A4::_id_32E4( "global_hint_in_use" );
    level.playercardbackground _id_A5A4::_id_32E0( "global_hint_in_use" );

    while ( level.playercardbackground _id_A5A4::_id_32D8( "global_hint_in_use" ) )
    {
        if ( !level.playercardbackground common_scripts\utility::_id_5064() && isdefined( level._id_48D2[var_0]["pc"] ) )
            level._id_24EC settext( level._id_48D2[var_0]["pc"] );
        else
        {
            var_1 = getsticksconfig();

            if ( issubstr( var_1, "southpaw" ) && isdefined( level._id_48D2[var_0]["southpaw"] ) )
                level._id_24EC settext( level._id_48D2[var_0]["southpaw"] );
            else
                level._id_24EC settext( level._id_48D2[var_0]["gamepad"] );
        }

        wait 0.05;
    }
}

_id_48FA( var_0 )
{
    if ( !level.playercardbackground common_scripts\utility::_id_5064() && isdefined( level._id_48D2[var_0]["pc"] ) )
        level._id_97A8[var_0] = level._id_48D2[var_0]["pc"];
    else
    {
        var_1 = getsticksconfig();

        if ( issubstr( var_1, "southpaw" ) && isdefined( level._id_48D2[var_0]["southpaw"] ) )
            level._id_97A8[var_0] = level._id_48D2[var_0]["southpaw"];
        else
            level._id_97A8[var_0] = level._id_48D2[var_0]["gamepad"];
    }

    if ( ( isdefined( level._id_48D2[var_0]["pc"] ) || isdefined( level._id_48D2[var_0]["southpaw"] ) ) && ![[ level._id_97A7[var_0] ]]() )
        thread _id_48FB( var_0 );
    else
        level.playercardbackground notify( "HintDisplayHandlerEnd" );
}

_id_28C4( var_0 )
{
    var_0 endon( "destroying" );
    level waittill( "friendlyfire_mission_fail" );

    if ( !isdefined( var_0 ) )
        return;

    self._id_24E9 = undefined;
    var_0 destroy();
    _id_A5A4::_id_32DA( "global_hint_in_use" );
}

_id_8514( var_0 )
{
    var_0._id_9361 = 0;

    if ( !isalive( self ) )
        return;

    var_1 = 1.0;
    var_2 = 0.75;
    var_3 = 0.95;
    var_4 = 0.4;
    _id_A5A4::_id_32E4( "global_hint_in_use" );
    _id_A5A4::_id_32DE( "global_hint_in_use" );

    if ( var_0._id_9361 )
        return;

    if ( isdefined( var_0._id_936B ) )
        var_0 thread _id_48EA( var_0._id_936B );

    var_5 = _id_A546::_id_23ED( "objective", 2 );
    var_5.alpha = 0.9;
    var_5.xpmaxmultipliertimeplayed = 0;
    var_5._id_0538 = -38;
    var_5.alignx = "center";
    var_5.aligny = "middle";
    var_5.hostquits = "center";
    var_5.visionsetnight = "middle";
    var_5.foreground = 0;
    var_5.high_priority = 1;
    var_5 settext( var_0._id_8F53 );
    var_5.alpha = 0;
    var_5 fadeovertime( var_1 );
    var_5.alpha = var_3;
    _id_490E( var_1 );

    for (;;)
    {
        var_5 fadeovertime( var_2 );
        var_5.alpha = var_4;
        _id_490E( var_2 );

        if ( var_0._id_9361 )
            break;

        var_5 fadeovertime( var_2 );
        var_5.alpha = var_3;
        _id_490E( var_2 );

        if ( var_0._id_9361 )
            break;
    }

    var_5 destroy();
    _id_A5A4::_id_32DA( "global_hint_in_use" );
}

lerp_player_view_to_tag_smoothly_internal( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( self._id_380F ) && self._id_380F == gettime() )
        wait 0.1;

    var_8 = self gettagorigin( var_1 );
    var_9 = self gettagangles( var_1 );
    var_10 = var_0 _id_A5A4::lerp_player_view_to_position_leave_linked( var_8, var_9, var_2, var_3, var_4, var_5, var_6, var_7 );
    var_0 playerlinktodelta( self, var_1, var_3, var_4, var_5, var_6, var_7 );
    var_10 delete();
}

_id_5698( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( self._id_380F ) && self._id_380F == gettime() )
        wait 0.1;

    var_9 = self gettagorigin( var_1 );
    var_10 = self gettagangles( var_1 );
    var_0 _id_A5A4::_id_5693( var_9, var_10, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( var_8 )
        return;

    var_0 playerlinkto( self, var_1, var_3, var_4, var_5, var_6, var_7, 0 );
}

_id_569A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( self._id_380F ) && self._id_380F == gettime() )
        wait 0.1;

    var_9 = self gettagorigin( var_1 );
    var_10 = self gettagangles( var_1 );
    var_0 _id_A5A4::_id_5695( var_9, var_10, var_2, var_3, var_4, var_5, var_6, var_7, 1 );

    if ( var_8 )
        return;

    var_0 playerlinktodelta( self, var_1, var_3, var_4, var_5, var_6, var_7, 0 );
}

_id_3AF9( var_0 )
{
    self endon( "death" );
    var_0 common_scripts\utility::_id_A087( "function_done", "death" );
}

_id_3AFA( var_0 )
{
    _id_3AF9( var_0 );

    if ( !isdefined( self ) )
        return 0;

    if ( !issentient( self ) )
        return 1;

    if ( isalive( self ) )
        return 1;

    return 0;
}

_id_3AF6( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( !isdefined( var_0._id_3AF2 ) )
        var_0._id_3AF2 = [];

    var_0._id_3AF2[var_0._id_3AF2.size] = self;
    thread _id_3AF7( var_0 );
    self._id_6682 = var_2;
    _id_3AF3( var_0 );

    if ( isdefined( var_0 ) && isdefined( var_0._id_3AF2 ) )
    {
        self._id_3AF5 = 1;
        self notify( "function_stack_func_begun" );
        var_7 = gettime();

        if ( isdefined( var_6 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );
        else if ( isdefined( var_5 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4, var_5 );
        else if ( isdefined( var_4 ) )
            var_0 [[ var_1 ]]( var_2, var_3, var_4 );
        else if ( isdefined( var_3 ) )
            var_0 [[ var_1 ]]( var_2, var_3 );
        else if ( isdefined( var_2 ) )
            var_0 [[ var_1 ]]( var_2 );
        else
            var_0 [[ var_1 ]]();

        if ( gettime() == var_7 )
            waitframe;

        if ( isdefined( var_0 ) && isdefined( var_0._id_3AF2 ) )
        {
            var_0._id_3AF2 = common_scripts\utility::_id_0CF6( var_0._id_3AF2, self );
            var_0 notify( "level_function_stack_ready" );
        }
    }

    if ( isdefined( self ) )
    {
        self._id_3AF5 = 0;
        self notify( "function_done" );
    }
}

_id_3AF7( var_0 )
{
    self endon( "function_done" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
    {
        var_0._id_3AF2 = common_scripts\utility::_id_0CF6( var_0._id_3AF2, self );
        var_0 notify( "level_function_stack_ready" );
    }
}

_id_3AF3( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    var_0 endon( "clear_function_stack" );

    while ( isdefined( var_0._id_3AF2 ) && var_0._id_3AF2[0] != self )
        var_0 waittill( "level_function_stack_ready" );
}

_id_9A25( var_0 )
{
    level endon( "player_flashed" );
    wait(var_0);
    thread _id_A5DC::aud_restore_after_flashbang();
    common_scripts\utility::_id_3831( "player_flashed" );
}

_id_9FBD( var_0 )
{
    self endon( "death" );
    var_0 waittill( "sounddone" );
    return 1;
}

_id_4D74( var_0 )
{
    level._id_58BC = var_0;

    if ( !isdefined( level._id_9E5C ) )
    {
        level._id_9E5C = 0;
        setsaveddvar( "using_vision_cheat", 0 );
    }

    return level._id_9E5C;
}

_id_0D19( var_0, var_1, var_2 )
{
    _id_0D1A( var_0, var_1, var_2 );
    self._id_0558 = 0;
    self notify( "_array_wait" );
}

_id_0D1A( var_0, var_1, var_2 )
{
    var_0 endon( var_1 );
    var_0 endon( "death" );

    if ( isdefined( var_2 ) )
        wait(var_2);
    else
        var_0 waittill( var_1 );
}

_id_33EA( var_0 )
{
    if ( var_0._id_6695.size == 0 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]();
    else if ( var_0._id_6695.size == 1 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]( var_0._id_6695[0] );
    else if ( var_0._id_6695.size == 2 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1] );
    else if ( var_0._id_6695.size == 3 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2] );

    if ( var_0._id_6695.size == 4 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3] );

    if ( var_0._id_6695.size == 5 )
        var_0._id_1A08 call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3], var_0._id_6695[4] );
}

_id_33EB( var_0 )
{
    if ( var_0._id_6695.size == 0 )
        call [[ var_0._id_3AE4 ]]();
    else if ( var_0._id_6695.size == 1 )
        call [[ var_0._id_3AE4 ]]( var_0._id_6695[0] );
    else if ( var_0._id_6695.size == 2 )
        call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1] );
    else if ( var_0._id_6695.size == 3 )
        call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2] );

    if ( var_0._id_6695.size == 4 )
        call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3] );

    if ( var_0._id_6695.size == 5 )
        call [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3], var_0._id_6695[4] );
}

_id_33EC( var_0, var_1 )
{
    if ( !isdefined( var_0._id_1A08 ) )
        return;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2]._id_1A08 endon( var_1[var_2]._id_315B );

    if ( var_0._id_6695.size == 0 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]();
    else if ( var_0._id_6695.size == 1 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]( var_0._id_6695[0] );
    else if ( var_0._id_6695.size == 2 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1] );
    else if ( var_0._id_6695.size == 3 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2] );

    if ( var_0._id_6695.size == 4 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3] );

    if ( var_0._id_6695.size == 5 )
        var_0._id_1A08 [[ var_0._id_3AE4 ]]( var_0._id_6695[0], var_0._id_6695[1], var_0._id_6695[2], var_0._id_6695[3], var_0._id_6695[4] );
}

_id_A091( var_0, var_1 )
{
    self endon( "all_funcs_ended" );
    self endon( "any_funcs_aborted" );
    _id_33EC( var_0, var_1 );
    self.count--;
    self notify( "func_ended" );
}

_id_A064( var_0, var_1 )
{
    self endon( "all_funcs_ended" );
    self endon( "any_funcs_aborted" );
    _id_33EC( var_0, var_1 );
    self._id_06BB--;
    self notify( "abort_func_ended" );
}

_id_2BB5( var_0 )
{
    self endon( "all_funcs_ended" );

    if ( !var_0.size )
        return;

    var_1 = 0;
    self._id_06BB = var_0.size;
    var_2 = [];
    common_scripts\utility::_id_0CF0( var_0, ::_id_A064, var_2 );

    for (;;)
    {
        if ( self._id_06BB <= var_1 )
            break;

        self waittill( "abort_func_ended" );
    }

    self notify( "any_funcs_aborted" );
}

_id_9724( var_0 )
{
    if ( isdefined( self.forward ) )
    {
        var_1 = anglestoforward( var_0.angles );
        var_0.origin += var_1 * self.forward;
    }

    if ( isdefined( self.riotshield_damaged ) )
    {
        var_2 = anglestoright( var_0.angles );
        var_0.origin += var_2 * self.riotshield_damaged;
    }

    if ( isdefined( self.upgradepurchased ) )
    {
        var_3 = anglestoup( var_0.angles );
        var_0.origin += var_3 * self.upgradepurchased;
    }

    if ( isdefined( self._id_A3B4 ) )
        var_0 addyaw( self._id_A3B4 );

    if ( isdefined( self._id_6854 ) )
        var_0 addpitch( self._id_6854 );

    if ( isdefined( self._id_759B ) )
        var_0 addroll( self._id_759B );
}

_id_2FE4( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "start_dynamic_run_speed" );
    self endon( "death" );
    self endon( "stop_dynamic_run_speed" );
    self endon( "start_dynamic_run_speed" );
    level endon( "_stealth_spotted" );

    if ( _id_A5A4::_id_32DC( "_stealth_custom_anim" ) )
        _id_A5A4::_id_32E4( "_stealth_custom_anim" );

    if ( !_id_A5A4::_id_32DC( "dynamic_run_speed_stopped" ) )
    {
        _id_A5A4::_id_32DD( "dynamic_run_speed_stopped" );
        _id_A5A4::_id_32DD( "dynamic_run_speed_stopping" );
    }
    else
    {
        _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );
        _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
    }

    self._id_76B8 = "";
    self._id_63AF = self._id_5F65;
    thread _id_8E78();
    var_5 = var_0 * var_0;
    var_6 = var_1 * var_1;
    var_7 = var_2 * var_2;
    var_8 = var_3 * var_3;

    for (;;)
    {
        wait 0.05;
        var_9 = level.players[0];

        foreach ( var_11 in level.players )
        {
            if ( distancesquared( var_9.origin, self.origin ) > distancesquared( var_11.origin, self.origin ) )
                var_9 = var_11;
        }

        var_13 = anglestoforward( self.angles );
        var_14 = vectornormalize( var_9.origin - self.origin );
        var_15 = vectordot( var_13, var_14 );
        var_16 = distancesquared( self.origin, var_9.origin );
        var_17 = var_16;

        if ( isdefined( var_4 ) )
        {
            var_18 = common_scripts\utility::_id_3F33( var_9.origin, var_4 );
            var_17 = distancesquared( var_18.origin, var_9.origin );
        }

        var_19 = 0;

        if ( isdefined( self._id_5557 ) )
            var_19 = [[ level._id_2F9F ]]( self._id_5557, var_1 );
        else if ( isdefined( self._id_5558 ) )
            var_19 = [[ level._id_2F9F ]]( self._id_5558, var_1 );

        if ( isdefined( self._id_22E0 ) && self._id_22E0 && !self._id_2D2C )
            self._id_5F65 = 1;

        if ( var_16 < var_6 || var_15 > -0.25 || var_19 )
        {
            _id_2FE2( "sprint" );
            wait 0.5;
            continue;
            continue;
        }

        if ( var_16 < var_5 || var_15 > -0.25 )
        {
            _id_2FE2( "run" );
            wait 0.5;
            continue;
            continue;
        }

        if ( var_17 > var_7 )
        {
            if ( self.a._id_5F5B != "stop" )
            {
                _id_2FE2( "stop" );
                wait 0.5;
            }

            continue;
            continue;
        }

        if ( var_16 > var_8 )
        {
            _id_2FE2( "jog" );
            wait 0.5;
            continue;
        }
    }
}

_id_8E78()
{
    self endon( "start_dynamic_run_speed" );
    self endon( "death" );
    _id_8E79();

    if ( !self._id_2D2C )
        self._id_5F65 = self._id_63AF;

    if ( isdefined( level._id_78AC["generic"]["DRS_run"] ) )
    {
        if ( isarray( level._id_78AC["generic"]["DRS_run"] ) )
            _id_A5A4::_id_7E46( "DRS_run" );
        else
            _id_A5A4::_id_7E45( "DRS_run" );
    }
    else
        _id_A5A4::_id_1ED1();

    self notify( "stop_loop" );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
}

_id_8E79()
{
    level endon( "_stealth_spotted" );
    self waittill( "stop_dynamic_run_speed" );
}

_id_2FE1( var_0, var_1 )
{
    if ( !isdefined( var_0.classname ) )
    {
        if ( !isdefined( var_0.unlockpoints ) )
            var_2 = _id_A581::_id_3E8E;
        else
            var_2 = _id_A581::_id_3E8C;
    }
    else
        var_2 = _id_A581::_id_3E8A;

    return _id_A581::_id_4247( var_0, var_2, var_1 );
}

_id_2FE2( var_0 )
{
    if ( self._id_76B8 == var_0 )
        return;

    self._id_76B8 = var_0;

    switch ( var_0 )
    {
        case "sprint":
            if ( isdefined( self._id_22E0 ) && self._id_22E0 && !self._id_2D2C )
                self._id_5F65 = 1;
            else if ( !self._id_2D2C )
                self._id_5F65 = 1.15;

            if ( isarray( level._id_78AC["generic"]["DRS_sprint"] ) )
                _id_A5A4::_id_7E46( "DRS_sprint" );
            else
                _id_A5A4::_id_7E45( "DRS_sprint" );

            self notify( "stop_loop" );
            _id_A5A4::_id_0C3D();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "run":
            if ( !self._id_2D2C )
                self._id_5F65 = self._id_63AF;

            if ( isdefined( level._id_78AC["generic"]["DRS_run"] ) )
            {
                if ( isarray( level._id_78AC["generic"]["DRS_run"] ) )
                    _id_A5A4::_id_7E46( "DRS_run" );
                else
                    _id_A5A4::_id_7E45( "DRS_run" );
            }
            else
                _id_A5A4::_id_1ED1();

            self notify( "stop_loop" );
            _id_A5A4::_id_0C3D();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "stop":
            thread _id_2FE5();
            break;
        case "jog":
            if ( !self._id_2D2C )
                self._id_5F65 = self._id_63AF;

            if ( isdefined( level._id_78AC["generic"]["DRS_combat_jog"] ) )
            {
                if ( isarray( level._id_78AC["generic"]["DRS_combat_jog"] ) )
                    _id_A5A4::_id_7E46( "DRS_combat_jog" );
                else
                    _id_A5A4::_id_7E45( "DRS_combat_jog" );
            }
            else
                _id_A5A4::_id_1ED1();

            self notify( "stop_loop" );
            _id_A5A4::_id_0C3D();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "crouch":
            break;
    }
}

_id_2FE5()
{
    self endon( "death" );

    if ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
        return;

    if ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopping" ) )
        return;

    self endon( "stop_dynamic_run_speed" );
    _id_A5A4::_id_32DE( "dynamic_run_speed_stopping" );
    _id_A5A4::_id_32DE( "dynamic_run_speed_stopped" );
    self endon( "dynamic_run_speed_stopped" );
    var_0 = "DRS_run_2_stop";
    _id_A510::_id_0BCA( self, "gravity", var_0 );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );

    while ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
    {
        var_1 = "DRS_stop_idle";
        thread _id_A510::_id_0BCE( self, var_1 );

        if ( isdefined( level._id_78AC["generic"]["signal_go"] ) )
            _id_A5A4::_id_4697( "go" );

        wait(randomfloatrange( 12, 20 ));

        if ( _id_A5A4::_id_32DC( "_stealth_stance_handler" ) )
            _id_A5A4::_id_32E4( "_stealth_stance_handler" );

        self notify( "stop_loop" );

        if ( !_id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
            return;

        if ( isdefined( level._id_2FE3 ) )
        {
            var_2 = common_scripts\utility::_id_710E( level._id_2FE3 );
            level thread _id_A5A4::_id_70C4( var_2 );
        }

        if ( isdefined( level._id_78AC["generic"]["signal_go"] ) )
            _id_A5A4::_id_4697( "go" );
    }
}

_id_3BC5()
{
    return int( getdvar( "g_speed" ) );
}

_id_3BC6( var_0 )
{
    setsaveddvar( "g_speed", int( var_0 ) );
}

_id_3BC1()
{
    return level.playercardbackground _meth_83f2();
}

_id_3BC2( var_0 )
{
    level.playercardbackground _meth_83f3( var_0 );
}

_id_5F75()
{
    return self._id_5F7A;
}

_id_5F79( var_0 )
{
    self._id_5F7A = var_0;
    self setmovespeedscale( var_0 );
}

_id_5F77( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 notify( "movespeed_ramp_over_time" );
    var_0 endon( "movespeed_ramp_over_time" );
    var_5 = var_1;
    var_6 = ( var_2 - var_1 ) * 0.05 / var_3;

    for ( var_7 = 0; var_7 < var_3; var_7 += 0.05 )
    {
        var_5 += var_6;

        if ( isai( var_0 ) )
            var_0 _id_A5A4::_id_7E81( var_5, undefined, var_4 );
        else
            var_0 setmovespeedscale( var_5 );

        waittillframeend;
    }

    if ( isai( var_0 ) )
        var_0 _id_A5A4::_id_7E81( var_2, undefined, var_4 );
    else
        var_0 setmovespeedscale( var_2 );
}

_id_115D()
{
    if ( common_scripts\utility::_id_3839( "autosave_tactical_player_nade" ) )
        return;

    common_scripts\utility::_id_383D( "autosave_tactical_player_nade" );
    level._id_115B = 0;
    notifyoncommand( "autosave_player_nade", "+frag" );
    notifyoncommand( "autosave_player_nade", "-smoke" );
    notifyoncommand( "autosave_player_nade", "+smoke" );
    common_scripts\utility::_id_0D13( level.players, ::_id_1159 );
}

_id_1159()
{
    for (;;)
    {
        self waittill( "autosave_player_nade" );
        common_scripts\utility::_id_383F( "autosave_tactical_player_nade" );
        self waittill( "grenade_fire", var_0 );
        thread _id_115A( var_0 );
    }
}

_id_115A( var_0 )
{
    level._id_115B++;
    var_0 common_scripts\utility::_id_A0A0( "death", 10 );
    level._id_115B--;
    waitframe;

    if ( !level._id_115B )
        common_scripts\utility::_id_3831( "autosave_tactical_player_nade" );
}

_id_115C()
{
    level notify( "autosave_tactical_proc" );
    level endon( "autosave_tactical_proc" );
    level thread _id_A5A4::_id_61FD( "kill_save", 5 );
    level endon( "kill_save" );
    level endon( "autosave_tactical_player_nade" );

    if ( common_scripts\utility::_id_382E( "autosave_tactical_player_nade" ) )
    {
        common_scripts\utility::_id_385B( "autosave_tactical_player_nade", 4 );

        if ( common_scripts\utility::_id_382E( "autosave_tactical_player_nade" ) )
            return;
    }

    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.enemy ) && isplayer( var_2.enemy ) )
            return;
    }

    waitframe;
    _id_A5A4::_id_1143();
}

_id_6004( var_0, var_1, var_2, var_3 )
{
    _id_A5A4::_id_6005( var_1 );
    level endon( "stop_music" );
    wait(var_1);
    thread _id_A5A4::_id_6003( var_0, undefined, var_2, var_3 );
}

_id_6000( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_A5A4::_id_6005( var_2 );
    level endon( "stop_music" );
    wait(var_2);
    thread _id_5FFF( var_0, var_1, undefined, var_3, var_4, var_5 );
}

_id_5FFF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_2 ) && var_2 > 0 )
    {
        thread _id_6000( var_0, var_1, var_2, var_3, var_4, var_5 );
        return;
    }

    _id_A5A4::_id_6005();
    level endon( "stop_music" );
    _id_A5A4::_id_6008( var_0, var_3, var_4 );

    if ( isdefined( var_5 ) && var_5 == 1 && common_scripts\utility::_id_3839( "_stealth_spotted" ) )
    {
        level endon( "_stealth_spotted" );
        thread _id_6002( var_0, var_1, var_2 );
    }

    var_6 = _id_A5A4::_id_6007( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 <= 10 )
        var_6 += var_1;

    wait(var_6);
    _id_A5A4::_id_5FFE( var_0, var_1, var_2, var_3, var_4 );
}

_id_6002( var_0, var_1, var_2 )
{
    level endon( "stop_music" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    musicstop( 0.5 );

    while ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
    {
        common_scripts\utility::_id_3857( "_stealth_spotted" );
        wait 1;
    }

    thread _id_A5A4::_id_5FFE( var_0, var_1, var_2 );
}

_id_2D7B( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_sliding" );
    var_3 = self;
    var_4 = undefined;

    for (;;)
    {
        var_5 = var_3 getnormalizedmovement();
        var_6 = anglestoforward( var_3.angles );
        var_7 = anglestoright( var_3.angles );
        var_5 = ( var_5[1] * var_7[0] + var_5[0] * var_6[0], var_5[1] * var_7[1] + var_5[0] * var_6[1], 0 );
        var_0.smoke += var_5 * var_1;
        wait 0.05;
        var_0.smoke *= ( 1 - var_2 );
    }
}

_id_5307( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    if ( isdefined( var_1 ) && var_1 && _id_A5A4::_id_6A98( self ) )
        return;

    playfxontag( common_scripts\utility::_id_3FA8( "flesh_hit" ), self, "tag_eye" );
    self kill( level.playercardbackground.origin );
}

_id_9AD8( var_0, var_1 )
{
    self endon( "death" );
    var_2 = 0;

    for (;;)
    {
        if ( self._id_4E9E > 0.0001 && gettime() > 300 )
        {
            if ( !var_2 )
            {
                self playrumblelooponentity( var_1 );
                var_2 = 1;
            }
        }
        else if ( var_2 )
        {
            self stoprumble( var_1 );
            var_2 = 0;
        }

        var_3 = 1 - self._id_4E9E;
        var_3 *= 1000;

        if ( isdefined( self._id_7676 ) )
            self.origin = self._id_7676.origin + ( 0, 0, var_3 );
        else
            self.origin = var_0 geteye() + ( 0, 0, var_3 );

        wait 0.05;
    }
}

_id_8BBE( var_0 )
{
    var_1 = spawn( "script_model", self.origin );
    self._id_4237 = var_1;
    var_1.angles = self.angles;
    var_1 setmodel( var_0 );
    var_1 endon( "death" );
    self waittill( "death" );
    var_1 delete();
}

_id_6FDF( var_0, var_1, var_2, var_3, var_4 )
{
    waitframe;

    if ( !isdefined( self._id_8B20 ) )
        self._id_8B20 = 0;

    if ( !isdefined( self._id_311C ) )
        self._id_311C = 1;

    if ( !isdefined( self._id_12F0 ) )
        self._id_12F0 = 0;

    var_5 = self.titleunlocked * 20;
    var_6 = self._id_311C - self._id_8B20;
    self._id_8E6C = 0;

    if ( isdefined( var_4 ) )
    {
        for ( var_7 = 0; var_7 <= var_5 && !self._id_8E6C; var_7++ )
        {
            var_8 = self._id_12F0 + var_7 * var_6 / var_5;
            var_1 thread [[ var_0 ]]( var_8, var_2, var_3, var_4 );
            wait 0.05;
        }
    }
    else if ( isdefined( var_3 ) )
    {
        for ( var_7 = 0; var_7 <= var_5 && !self._id_8E6C; var_7++ )
        {
            var_8 = self._id_12F0 + var_7 * var_6 / var_5;
            var_1 thread [[ var_0 ]]( var_8, var_2, var_3 );
            wait 0.05;
        }
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_7 = 0; var_7 <= var_5 && !self._id_8E6C; var_7++ )
        {
            var_8 = self._id_12F0 + var_7 * var_6 / var_5;
            var_1 thread [[ var_0 ]]( var_8, var_2 );
            wait 0.05;
        }
    }
    else
    {
        for ( var_7 = 0; var_7 <= var_5 && !self._id_8E6C; var_7++ )
        {
            var_8 = self._id_12F0 + var_7 * var_6 / var_5;
            var_1 thread [[ var_0 ]]( var_8 );
            wait 0.05;
        }
    }
}

_id_07B4( var_0 )
{
    waitframe;

    if ( !isdefined( level._id_9491 ) )
        level._id_9491 = [];

    if ( !isdefined( level._id_9491 ) )
        level._id_9491[var_0] = [];

    if ( isdefined( self.fx ) )
        level._id_9491[var_0][self._id_8FF0]["fx"] = self.fx;

    if ( isdefined( self._id_3B24 ) )
        level._id_9491[var_0][self._id_8FF0]["fx_array"] = self._id_3B24;

    if ( isdefined( self._id_8899 ) )
        level._id_9491[var_0][self._id_8FF0]["sound"] = self._id_8899;

    if ( isdefined( self._id_7675 ) )
        level._id_9491[var_0][self._id_8FF0]["rumble"] = self._id_7675;

    if ( !isdefined( level._id_9491[var_0]["default"] ) )
        level._id_9491[var_0]["default"] = level._id_9491[var_0][self._id_8FF0];
}

_id_7064( var_0 )
{
    var_1 = spawnstruct();
    precachemodel( var_0.motiontrackerenabled );
    var_1._id_948C = var_0.motiontrackerenabled;
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_1.script_parentname = var_0.script_parentname;
    var_1._id_7A26 = var_0._id_7A26;
    var_1.teambalanced = var_0.teambalanced;
    var_1._not_team = var_0._not_team;
    var_1.destructible_type = var_0.destructible_type;
    var_1._id_7A7E = var_0._id_7A7E;
    var_0 _id_A5A4::_id_6EBA( var_0.destructible_type );
    self._id_293A[self._id_293A.size] = var_1;
    var_0 notify( "masking_destructible" );
    var_0 delete();
}

_id_27F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    self endon( "stop_delay_thread" );
    wait(var_1);

    if ( isdefined( var_7 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        thread [[ var_0 ]]( var_2 );
    else
        thread [[ var_0 ]]();
}

_id_27D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    self endon( "stop_delay_thread" );
    wait(var_1);

    if ( isdefined( var_7 ) )
        childthread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        childthread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        childthread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        childthread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        childthread [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        childthread [[ var_0 ]]( var_2 );
    else
        childthread [[ var_0 ]]();
}

_id_3870( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    self endon( _id_A5A4::_id_8F53( var_1[0] + "_stop_flagWaitThread" ) );
    common_scripts\utility::_id_384A( var_1[0] );
    _id_27F1( var_0, var_1[1], var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_A0F6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    self endon( _id_A5A4::_id_8F53( var_1[0] + "_stop_waittillThread" ) );
    self waittill( var_1[0] );
    _id_27F1( var_0, var_1[1], var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_07BF()
{
    level notify( "kill_add_wait_asserter" );
    level endon( "kill_add_wait_asserter" );

    for ( var_0 = 0; var_0 < 20; var_0++ )
        waitframe;
}

_id_9AA1()
{

}

_id_20CB( var_0, var_1, var_2, var_3 )
{
    if ( !var_1.size )
        return undefined;

    if ( isdefined( var_2 ) )
    {
        var_4 = undefined;
        var_5 = getarraykeys( var_1 );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            var_7 = distance( var_1[var_5[var_6]].v["origin"], var_0 );

            if ( [[ var_3 ]]( var_7, var_2 ) )
                continue;

            var_2 = var_7;
            var_4 = var_1[var_5[var_6]];
        }

        return var_4;
    }

    var_5 = getarraykeys( var_1 );
    var_4 = var_1[var_5[0]];
    var_2 = distance( var_4.v["origin"], var_0 );

    for ( var_6 = 1; var_6 < var_5.size; var_6++ )
    {
        var_7 = distance( var_1[var_5[var_6]].v["origin"], var_0 );

        if ( [[ var_3 ]]( var_7, var_2 ) )
            continue;

        var_2 = var_7;
        var_4 = var_1[var_5[var_6]];
    }

    return var_4;
}

_id_A0C3()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        waitframe;

        if ( var_0._id_251D == self )
            return var_0;
    }
}

_id_07B5()
{
    self._id_97A0 = [];
    self waittill( "trigger", var_0 );
    var_1 = self._id_97A0;
    self._id_97A0 = undefined;

    foreach ( var_3 in var_1 )
        thread [[ var_3 ]]( var_0 );
}

_id_07AF( var_0 )
{
    if ( !isdefined( level._id_78B9[var_0] ) )
        level._id_78B9[var_0] = var_0;
}

_id_07A9( var_0 )
{
    if ( !isdefined( level._id_78AC[self._id_0C72] ) )
        level._id_78AC[self._id_0C72] = [];

    if ( !isdefined( level._id_78BA[self._id_0C72] ) )
        level._id_78BA[self._id_0C72] = [];

    if ( !isdefined( level._id_78BA[self._id_0C72][var_0] ) )
        level._id_78BA[self._id_0C72][var_0] = var_0;
}

_id_07AA( var_0 )
{
    if ( !isdefined( level._id_78BA["generic"] ) )
        level._id_78BA["generic"] = [];

    if ( !isdefined( level._id_78BA["generic"][var_0] ) )
        level._id_78BA["generic"][var_0] = var_0;
}

_id_62F4( var_0 )
{
    if ( !_id_A5A4::_id_5016() )
        return;

    var_1 = _id_3DB8();
    var_2 = var_1;

    if ( isdefined( level._id_7270 ) )
        var_2 = var_1 - level._id_7270;

    level._id_7270 = var_1;
    reconevent( "script_objective: objective %d, leveltime %d, deltatime %d", var_0, var_1, var_2 );
}

_id_5CD7( var_0 )
{
    if ( _id_A5A4::_id_5016() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 1;

        var_1 = _id_3DB8();
        var_2 = var_1;
        reconevent( "script_level: leveltime %d, deltatime %d, success %d", var_2, var_1, var_0 );
    }
}

_id_3DB8()
{
    return getlevelticks() * 0.05;
}

_id_05AE( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_2 );
        common_scripts\utility::_id_383F( var_0 );

        if ( !var_1 )
            return;

        while ( var_2 istouching( self ) )
            wait 0.05;

        common_scripts\utility::_id_3831( var_0 );
    }
}

_id_090F( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
        self._id_05CF[var_1] = var_0;
    else
        self._id_05CF[var_1] = "none";

    return var_2;
}

_id_090D( var_0, var_1 )
{
    if ( isdefined( self._id_05CF ) )
    {
        if ( isstring( self._id_05CF[var_0] ) && self._id_05CF[var_0] == "none" )
            return var_1;
        else
            return self._id_05CF[var_0];
    }

    return var_1;
}

_id_0674()
{
    var_0 = getentarray( "tff_sync_trigger", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
        var_2 thread _id_0673();
}

_id_0673()
{
    self waittill( "trigger" );
    _id_A5A4::_id_92D5();
}
