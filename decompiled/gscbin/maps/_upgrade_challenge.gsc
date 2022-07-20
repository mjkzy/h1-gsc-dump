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
    _id_9BB8();

    if ( isdefined( level.playercardbackground ) )
        _id_9BB7( level.playercardbackground );
}

_id_9BB8()
{
    level._id_9BAF = [];
    level._id_9BAF["kills"] = "ch_kills";
    level._id_9BAF["headshots"] = "ch_headshots";
    level._id_9BAF["kills_grenades"] = "ch_frag_kills";
    level._id_9BAF["intel"] = "ch_intel";
    level._id_9BAD = [];
    level._id_9BAB = [];
    level._id_9BAE = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = int( tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, 0 ) );
        var_2 = tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, 1 );

        if ( var_2 == "" )
            break;

        level._id_9BAD[var_2] = var_1;
        level._id_9BAC[var_1] = [];
        level._id_9BAB[var_1] = tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, 4 );
        level._id_9BAE[var_1] = 0;
        var_3 = 10;

        for (;;)
        {
            var_4 = int( tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, var_3 ) );

            if ( var_4 <= 0 )
                break;

            level._id_9BAC[var_1][level._id_9BAC[var_1].size] = var_4;
            var_3++;
        }

        var_0++;
    }
}

_id_9BB7( var_0 )
{
    var_0 maps\_player_stats::_id_8D4D( ::_id_9BBA );

    if ( isdefined( level._id_9BAD ) && level._id_9BAD.size > 0 )
    {
        var_0._id_8D77["upgradeChallengeStage"] = [];
        var_0._id_8D77["upgradeChallengeProgress"] = [];

        if ( !isdefined( var_0._id_8D77["upgradePoints"] ) )
            var_0._id_8D77["upgradePoints"] = 0;

        foreach ( var_3, var_2 in level._id_9BAF )
            var_0 _id_9BBA( var_3, 0 );
    }
}

_id_41CF( var_0 )
{
    _id_9BBA( "kills", var_0 );
}

_id_41CE( var_0 )
{
    _id_9BBA( "headshots", var_0 );
    _id_41CF( var_0 );
}

_id_41CD( var_0 )
{
    _id_9BBA( "kills_grenades", var_0 );
    _id_41CF( var_0 );
}

_id_9BBA( var_0, var_1 )
{
    if ( isdefined( level._id_9BAF ) && isdefined( level._id_9BAF[var_0] ) )
    {
        if ( !isdefined( level._id_9BAD[level._id_9BAF[var_0]] ) )
            return;

        var_2 = level._id_9BAD[level._id_9BAF[var_0]];
        var_3 = getomnvar( "ui_pm_t_" + var_0 );
        setomnvar( "ui_pm_t_" + var_0, var_3 + var_1 );

        if ( var_0 == "intel" )
        {
            var_4 = int( self _meth_8212( "sp_upgradeChallengeStage_" + var_2 ) );

            if ( !isdefined( self._id_8D77["upgradeChallengeStage"][var_0] ) )
            {
                self._id_8D77["intelUpgradePoints"] = 0;
                setomnvar( "ui_pm_g_start_intel", var_4 );
            }

            self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
            var_5 = int( self _meth_8212( "sp_upgradeChallengeProgress_" + var_2 ) );

            if ( !isdefined( self._id_8D77["upgradeChallengeProgress"][var_0] ) )
                setomnvar( "ui_pm_p_start_intel", var_5 );

            self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
        }
        else
        {
            var_4 = 0;

            if ( !isdefined( self._id_8D77["upgradeChallengeStage"][var_0] ) )
            {
                var_4 = int( self _meth_8212( "sp_upgradeChallengeStage_" + var_2 ) );
                self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
            }
            else
                var_4 = self._id_8D77["upgradeChallengeStage"][var_0];

            var_5 = 0;

            if ( !isdefined( self._id_8D77["upgradeChallengeProgress"][var_0] ) )
            {
                var_5 = int( self _meth_8212( "sp_upgradeChallengeProgress_" + var_2 ) );
                self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
            }
            else
                var_5 = self._id_8D77["upgradeChallengeProgress"][var_0];
        }

        var_6 = level._id_9BAC[var_2].size - 1;
        var_7 = level._id_9BAC[var_2][var_6];

        if ( var_4 >= var_6 && var_5 >= var_7 )
        {
            setomnvar( "ui_pm_g_" + var_0, level._id_9BAC[var_2][var_6] );
            setomnvar( "ui_pm_p_" + var_0, var_7 );
            return;
        }

        var_8 = level._id_9BAC[var_2][var_4];
        var_9 = var_5;
        var_5 += var_1;
        var_10 = 0;

        while ( var_4 <= var_6 && var_5 >= var_8 && !var_10 )
        {
            notifychallengecomplete( level._id_9BAB[var_2] );

            if ( var_0 == "intel" )
                _id_9BB1( var_2 );
            else
                _id_9BB0( var_2 );

            if ( var_4 >= var_6 && var_5 >= var_7 )
            {
                var_5 = var_7;
                var_10 = 1;
                continue;
            }

            var_5 -= var_8;
            var_4++;

            if ( var_4 <= var_6 )
                var_8 = level._id_9BAC[var_2][var_4];
        }

        self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
        self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
        setomnvar( "ui_pm_g_" + var_0, level._id_9BAC[var_2][var_4] );
        setomnvar( "ui_pm_p_" + var_0, var_5 );

        if ( var_0 == "intel" )
            _id_20BE( var_0, 1 );
    }
}

_id_9BB1( var_0, var_1 )
{
    _id_20BF( 1 );
    self._id_8D77["intelUpgradePoints"]++;
    level._id_9BAE[var_0] = self._id_8D77["intelUpgradePoints"];
    var_2 = tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, 6 );
    setomnvar( var_2, level._id_9BAE[var_0] );
}

_id_9BB0( var_0 )
{
    if ( !isdefined( self._id_8D77["upgradePoints"] ) )
        self._id_8D77["upgradePoints"] = 0;

    self._id_8D77["upgradePoints"]++;
    level._id_9BAE[var_0] += 1;
    var_1 = tablelookupbyrow( "sp/upgrade_challenges.csv", var_0, 6 );
    setomnvar( var_1, level._id_9BAE[var_0] );
}

_id_20BF( var_0 )
{
    if ( isdefined( level.playercardbackground ) )
    {
        var_1 = level.playercardbackground;
        var_2 = int( var_1 _meth_8212( "sp_upgradePoints" ) );
        var_3 = var_2 + var_0;

        if ( var_3 > var_2 )
            var_1 _meth_8213( "sp_upgradePoints", var_3 );
    }
}

_id_20BE( var_0, var_1 )
{
    if ( isdefined( level.playercardbackground ) )
    {
        var_2 = level.playercardbackground;
        var_3 = level._id_9BAD[level._id_9BAF[var_0]];
        var_4 = 0;

        if ( isdefined( var_2._id_8D77["upgradeChallengeStage"][var_0] ) )
        {
            var_4 = var_2._id_8D77["upgradeChallengeStage"][var_0];
            var_5 = int( var_2 _meth_8212( "sp_upgradeChallengeStage_" + var_3 ) );

            if ( var_4 > var_5 )
                var_2 _meth_8213( "sp_upgradeChallengeStage_" + var_3, var_4 );
        }

        var_6 = 0;

        if ( isdefined( var_2._id_8D77["upgradeChallengeProgress"][var_0] ) )
        {
            var_6 = var_2._id_8D77["upgradeChallengeProgress"][var_0];
            var_7 = int( var_2 _meth_8212( "sp_upgradeChallengeProgress_" + var_3 ) );

            if ( var_6 != var_7 )
                var_2 _meth_8213( "sp_upgradeChallengeProgress_" + var_3, var_6 );
        }

        if ( var_1 )
            updategamerprofileall();
    }
}

_id_20C0()
{
    if ( isdefined( level.playercardbackground ) )
    {
        var_0 = level.playercardbackground;
        _id_20BF( var_0._id_8D77["upgradePoints"] );

        if ( isdefined( level._id_9BAF ) )
        {
            foreach ( var_4, var_2 in level._id_9BAF )
            {
                if ( var_4 == "intel" )
                    continue;

                var_3 = var_4;

                if ( !isdefined( level._id_9BAD[level._id_9BAF[var_3]] ) )
                    continue;

                if ( !isdefined( level._id_9BAF[var_3] ) )
                    continue;

                _id_20BE( var_3, 0 );
            }
        }

        updategamerprofileall();
    }
}
