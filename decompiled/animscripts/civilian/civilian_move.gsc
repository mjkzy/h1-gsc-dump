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
    animscripts\move::main();
}

_id_1DDA( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 < -60 && var_0 > -120 )
        var_2 = level._id_78AC[self.animname]["turn_left_90"];

    if ( var_0 > 60 && var_0 < 120 )
        var_2 = level._id_78AC[self.animname]["turn_right_90"];

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}
#using_animtree("generic_human");

_id_1DA5( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 < -22.5 )
    {
        if ( var_0 > -45 )
            var_2 = %civilian_run_upright_turnl45;
        else if ( var_0 > -112.5 )
            var_2 = %civilian_run_upright_turnl90;
        else if ( var_0 > -157.5 )
            var_2 = %civilian_run_upright_turnl135;
        else
            var_2 = %civilian_run_upright_turn180;
    }
    else if ( var_0 > 22.5 )
    {
        if ( var_0 < 45 )
            var_2 = %civilian_run_upright_turnr45;
        else if ( var_0 < 112.5 )
            var_2 = %civilian_run_upright_turnr90;
        else if ( var_0 < 157.5 )
            var_2 = %civilian_run_upright_turnr135;
        else
            var_2 = %civilian_run_upright_turn180;
    }

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}

_id_1DA4( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 < -22.5 )
    {
        if ( var_0 > -45 )
            var_2 = %civilian_run_hunched_turnl45;
        else if ( var_0 > -112.5 )
        {
            var_2 = %civilian_run_hunched_turnl90;
            var_3 = animscripts\utility::_id_711E( %civilian_run_hunched_turnl90_slide, %civilian_run_hunched_turnl90_stumble );
        }
        else if ( var_0 > -157.5 )
            var_2 = %civilian_run_upright_turnl135;
        else
            var_2 = %civilian_run_upright_turn180;
    }
    else if ( var_0 > 22.5 )
    {
        if ( var_0 < 45 )
            var_2 = %civilian_run_hunched_turnr45;
        else if ( var_0 < 112.5 )
        {
            var_2 = %civilian_run_hunched_turnr90;
            var_3 = animscripts\utility::_id_711E( %civilian_run_hunched_turnr90_slide, %civilian_run_hunched_turnr90_stumble );
        }
        else if ( var_0 < 157.5 )
            var_2 = %civilian_run_upright_turnr135;
        else
            var_2 = %civilian_run_upright_turn180;
    }

    if ( isdefined( var_3 ) && randomint( 3 ) < 2 && animscripts\move::_id_66D4( var_3 ) )
        return var_3;

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}
