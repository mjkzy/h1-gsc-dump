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

_id_86F4()
{
    if ( !isdefined( level._snd ) )
    {
        level._snd = spawnstruct();
        level._snd.guid = 0;
        level._snd._id_2791 = 1.0;
        thread _id_86F8();
        _id_86C6();
        soundscripts\_snd_hud::_id_86F2();
        _id_8759( level.script );
        soundscripts\_snd_filters::_id_8704();
        soundscripts\_snd_filters::_id_86DD();
        soundscripts\_snd_timescale::_id_877C();
        soundscripts\_snd_foley::_id_86E0();
        _id_870D();
        soundscripts\_snd_common::_id_86C4();
    }
}

_id_86F8()
{
    level._snd._id_5029 = 1;
    waitframe;
    level._snd._id_5029 = 0;
}

_id_8700()
{
    return level._snd._id_5029;
}

_id_870D()
{
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

_id_874B( var_0 )
{

}

_id_874C( var_0 )
{

}

_id_86ED( var_0, var_1 )
{
    var_2 = undefined;

    if ( isarray( var_1 ) )
        var_2 = var_1[var_0];

    return var_2;
}

_id_86EB()
{
    return gettime() * 0.001;
}

_id_8718()
{
    level._snd.guid++;
    return level._snd.guid;
}

_id_8708( var_0, var_1 )
{
    return piecewiselinearlookup( var_0, var_1 );
}

_id_86DF()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1.0;
    var_0.foreground = 1;
    wait 0.05;
    var_0 destroy();
}

_id_8760( var_0 )
{

}

_id_877A()
{
    if ( self.count >= self._id_59FA )
        wait 0.05;
    else
        self.count++;

    if ( !self._id_7437 )
        thread _id_877B();
}

_id_877B()
{
    self._id_7437 = 1;
    waitframe;
    self._id_7437 = 0;
    self.count = 0;
}

_id_86EE( var_0 )
{
    var_1 = spawnstruct();
    var_1.name = "throttle_waiter";
    var_1.count = 0;
    var_1._id_7437 = 0;
    var_2 = 10;

    if ( isdefined( var_0 ) )
        var_2 = max( var_0, 1 );

    var_1._id_59FA = var_2;
    return var_1;
}

_id_8759( var_0 )
{
    level._snd._id_88B0 = var_0;
}

_id_86EC()
{
    return level._snd._id_88B0;
}

_id_871A( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_5 = tablelookupbyrow( var_0, var_1, var_4 );
        var_3[var_5] = var_4;
    }

    return var_3;
}

_id_871B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        var_7 = var_1[var_6];
        var_8 = 0;
        var_9 = undefined;
        var_10 = 0;
        var_11 = 0;
        var_12 = undefined;
        var_13 = "";
        var_14 = packedtablesectionlookup( var_7, var_3, var_4 );

        if ( isdefined( var_14 ) )
        {
            while ( var_10 < 10 && var_8 + var_14[0] < var_14[1] )
            {
                var_15 = tablelookupbyrow( var_7, var_8 + var_14[0], var_11 );

                if ( var_15 != "" )
                {
                    var_10 = 0;

                    if ( !isdefined( var_9 ) )
                    {
                        var_9 = _id_871A( var_7, var_8 + var_14[0], var_2 );
                        var_11 = var_9[var_3];
                    }
                    else
                    {
                        var_16 = 0;

                        if ( !isdefined( var_12 ) )
                            var_16 = 1;
                        else if ( var_15 != var_13 )
                        {
                            var_5[var_13] = var_12;
                            var_16 = 1;
                        }

                        if ( var_16 )
                        {
                            var_12 = spawnstruct();
                            var_12.name = var_15;
                            var_12._id_8034 = [];
                            var_13 = var_15;
                        }

                        var_17 = [];

                        foreach ( var_21, var_19 in var_9 )
                        {
                            var_20 = tablelookupbyrow( var_7, var_8 + var_14[0], var_19 );

                            if ( var_21 == var_3 )
                            {
                                if ( var_20 != var_13 )
                                    break;
                            }
                            else
                            {
                                if ( maps\_utility::_id_5086( var_20 ) )
                                {
                                    var_17[var_21] = float( var_20 );
                                    continue;
                                }

                                var_17[var_21] = var_20;
                            }
                        }

                        var_12._id_8034[var_12._id_8034.size] = var_17;
                    }
                }
                else
                {
                    if ( isdefined( var_12 ) )
                    {
                        var_5[var_13] = var_12;
                        var_12 = undefined;
                    }

                    var_10++;
                }

                var_8++;
            }

            if ( isdefined( var_12 ) )
            {
                var_5[var_13] = var_12;
                var_12 = undefined;
            }
        }
    }

    return var_5;
}

_id_86C6()
{

}
