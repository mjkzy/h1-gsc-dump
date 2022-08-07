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

carrystart( var_0, var_1, var_2 )
{
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 2.5 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 2.5 );
    level.eplayerview dontcastshadows();
    level.eplayerview.origin = level.playercardbackground.origin;
    level.eplayerview.angles = level.playercardbackground getplayerangles();

    if ( isdefined( var_2 ) && var_2 )
    {
        level.playercardbackground maps\_anim::_id_0BC7( level.eplayerview, "carry_idle" );
        level.playercardbackground maps\_anim::_id_0BC7( var_0, "carry_idle" );
        wait 0.1;
    }

    level.m_player_rig = level.eplayerview;
    level.m_carried = var_0;
    level.m_carried setcontents( 0 );
    level.m_carried dontcastshadows();
    level.m_player_spot = level.m_player_rig common_scripts\utility::_id_8959();
    level.m_player_spot.angles = ( 0, level.m_player_rig.angles[1], 0 );
    level.m_player_spot thread maps\_anim::_id_0BE1( level.m_player_rig, "carry_idle" );
    level.m_player_rig thread maps\_anim::_id_0BE1( level.m_carried, "carry_idle" );
    level.m_carried _meth_83ff( level.playercardbackground, "tag_origin", ( 0.0, 0.0, -60.0 ), ( 0.0, 0.0, 0.0 ), 1, 0, 1, 0 );
    level.m_player_rig _meth_83ff( level.playercardbackground, "tag_origin", ( 0.0, 0.0, -60.0 ), ( 0.0, 0.0, 0.0 ), 1, 0, 1, 0 );
    wait 0.05;
    thread carrymoveloop( var_1 );
}

carrymoveloop( var_0 )
{
    level.playercardbackground endon( "death" );
    level.m_player_spot endon( "death" );
    var_1 = 0.05;
    level.m_player_carry_moving = 0;
    level.m_player_carry_ladder = 0;
    var_2 = 0;
    var_3 = 0;

    while ( [[ var_0 ]]() )
    {
        var_2 = level.playercardbackground isonladder();
        var_4 = level.playercardbackground getnormalizedmovement();
        var_5 = length( var_4 );
        var_3 = var_5 > 0;
        carryupdateanimation( var_2, var_3, var_5 );
        wait(var_1);
    }
}

carryupdateanimation( var_0, var_1, var_2 )
{
    var_3 = level.m_player_carry_ladder;
    var_4 = level.m_player_carry_moving;

    if ( var_0 )
    {
        if ( !var_3 )
        {
            level.m_player_spot notify( "stop_loop" );
            level.m_player_rig notify( "stop_loop" );
            level.m_carried setanimtime( level.m_carried maps\_utility::_id_3EF5( "ladder_on" ), 0 );
            level.m_player_spot thread maps\_anim::_id_0C24( level.m_player_rig, "ladder_on" );
            level.m_player_rig thread maps\_anim::_id_0C24( level.m_carried, "ladder_on" );
        }
    }
    else if ( var_3 )
    {
        level.m_player_spot thread maps\_anim::_id_0C24( level.m_player_rig, "ladder_off" );
        level.m_player_rig thread maps\_anim::_id_0C24( level.m_carried, "ladder_off" );
    }
    else if ( !var_1 && var_4 )
    {
        level.m_player_spot notify( "stop_loop" );
        level.m_player_rig notify( "stop_loop" );
        level.m_player_spot thread maps\_anim::_id_0BE1( level.m_player_rig, "carry_idle" );
        level.m_player_rig thread maps\_anim::_id_0BE1( level.m_carried, "carry_idle" );
    }
    else if ( var_1 && !var_4 )
    {
        level.m_player_spot notify( "stop_loop" );
        level.m_player_rig notify( "stop_loop" );
        level.m_player_spot thread maps\_anim::_id_0BE1( level.m_player_rig, "carry_run" );
        level.m_player_rig thread maps\_anim::_id_0BE1( level.m_carried, "carry_run" );
    }

    var_5 = 0;

    if ( var_1 && !var_0 && !var_3 )
    {
        var_6 = level.m_player_rig _meth_8151( level._id_78AC[level.m_player_rig._id_0C72]["carry_run"][0] );
        level.m_carried setanimtime( level._id_78AC[level.m_carried._id_0C72]["carry_run"][0], var_6 );
        level.m_player_rig setflaggedanim( "looping anim", level._id_78AC[level.m_player_rig._id_0C72]["carry_run"][0], 1, 0, var_2 );
        level.m_carried setflaggedanim( "looping anim", level._id_78AC[level.m_carried._id_0C72]["carry_run"][0], 1, 0, var_2 );
        var_5 = 1;
    }

    level.m_player_carry_ladder = var_0;
    level.m_player_carry_moving = var_5;
}

carrystop()
{
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 0.0 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 0.0 );
    level.playercardbackground _meth_8573();
    level.playercardbackground unlink();
    level.m_carried unlink();
    level.m_carried = undefined;
    level.m_player_rig = undefined;
    level.m_player_spot delete();
    level.m_player_spot = undefined;
    level.playercardbackground _meth_834a( 0 );
}
