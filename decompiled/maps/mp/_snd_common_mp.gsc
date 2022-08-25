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
    _id_870D();
    _id_72DA();
    thread _id_8712();
}

_id_8712()
{
    level._snd._id_2FDF = 0;

    if ( isdefined( level.players ) && level.players.size > 0 )
    {
        foreach ( var_1 in level.players )
        {
            var_1 _meth_84CF( "mp_init_mix" );
            wait 0.05;
            var_1 _meth_84CF( "mp_pre_event_mix" );
            wait 0.05;
        }
    }
}

_id_8713()
{
    level._snd._id_2FDF = 1;

    if ( isdefined( level.players ) && level.players.size > 0 )
    {
        foreach ( var_1 in level.players )
        {
            var_1 _meth_84D0( "mp_pre_event_mix" );
            wait 0.05;
            var_1 _meth_84CF( "mp_post_event_mix" );
            wait 0.05;
        }
    }
}

_id_8714()
{
    self _meth_84CF( "mp_init_mix" );

    if ( !isdefined( level._snd._id_2FDF ) || !level._snd._id_2FDF )
        self _meth_84CF( "mp_pre_event_mix" );
    else
    {
        self _meth_84D0( "mp_pre_event_mix" );
        self _meth_84CF( "mp_post_event_mix" );
    }
}

_id_870D()
{
    if ( !isdefined( level._snd ) )
        level._snd = spawnstruct();

    if ( !isdefined( level._snd._id_5BB9 ) )
        level._snd._id_5BB9 = [];
}

_id_874D( var_0, var_1 )
{
    level._snd._id_5BB9[var_0] = var_1;
}

_id_8716( var_0, var_1, var_2 )
{
    level notify( "stop_other_music" );
    level endon( "stop_other_music" );

    if ( isdefined( var_2 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1, var_2 );
    else if ( isdefined( var_1 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1 );
    else
        childthread _id_870C( "snd_music_handler", var_0 );
}

_id_870C( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._snd._id_5BB9[var_0] ) )
    {
        if ( isdefined( var_3 ) )
            thread [[ level._snd._id_5BB9[var_0] ]]( var_1, var_2, var_3 );
        else if ( isdefined( var_2 ) )
            thread [[ level._snd._id_5BB9[var_0] ]]( var_1, var_2 );
        else if ( isdefined( var_1 ) )
            thread [[ level._snd._id_5BB9[var_0] ]]( var_1 );
        else
            thread [[ level._snd._id_5BB9[var_0] ]]();
    }
}

_id_72DA()
{
    _id_874D( "exo_knife_player_impact", ::_id_5FD5 );
}

_id_5FD5()
{
    playsoundatpos( self.origin, "wpn_combatknife_stab_npc" );
}
