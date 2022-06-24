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
    level.fx_trigger_info = [];
    var_0 = getentarray( "fx_trigger", "targetname" );
    var_1 = getentarray( "fx_trigger_reverse", "targetname" );
    var_2 = common_scripts\utility::_id_0CDD( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_4.script_parentname;

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( level._effect[var_5] ) )
            continue;

        var_6 = var_4.teambalanced == "fx_trigger_reverse";

        if ( !isdefined( level.fx_trigger_info[var_5] ) )
        {
            var_7 = spawnstruct();
            var_7.players = [];
            var_7.rightaimlimit = var_6;
            var_7.fxent = spawnfx( level._effect[var_5], ( 0, 0, 0 ) );
            var_7.fxent _meth_8056();
            triggerfx( var_7.fxent, 1 );
            level.fx_trigger_info[var_5] = var_7;
            var_7.fxent thread fx_trigger_fx_ent_think( var_5 );
        }
        else if ( level.fx_trigger_info[var_5].rightaimlimit != var_6 )
            continue;

        var_4 thread fx_trigger_think( var_5 );
    }
}

fx_trigger_fx_ent_think( var_0 )
{
    for (;;)
    {
        level.fx_trigger_info[var_0].players = [];
        waittillframeend;
        waitframe;
        self _meth_8056();

        if ( level.fx_trigger_info[var_0].rightaimlimit )
        {
            foreach ( var_2 in level.players )
            {
                if ( !isdefined( common_scripts\utility::_id_0CE8( level.fx_trigger_info[var_0].players, var_2 ) ) )
                    self ShowToPlayer( var_2 );
            }

            continue;
        }

        foreach ( var_2 in level.fx_trigger_info[var_0].players )
            self ShowToPlayer( var_2 );
    }
}

fx_trigger_think( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_2 = level.fx_trigger_info[var_0].players.size;
        level.fx_trigger_info[var_0].players[var_2] = var_1;
    }
}
