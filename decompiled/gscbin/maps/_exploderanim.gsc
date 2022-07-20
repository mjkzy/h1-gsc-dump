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
    var_0 = getentarray( "script_model", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_79BF ) )
            var_2 thread exploderanim_think();
    }
}

exploderanim_think()
{
    for (;;)
    {
        self waittill( "play_exploder_anim" );
        thread anim_play();
    }
}

anim_play()
{
    var_0 = undefined;
    var_1 = strtok( self.teambalanced, ":;, " );

    if ( var_1.size > 1 && isdefined( var_1[1] ) )
        var_0 = var_1[1];
    else
        var_0 = self.motiontrackerenabled + "_anim";

    var_2 = get_animtree( var_0 );
    maps\_utility::_id_0D61( var_2 );
    maps\_anim::_id_0C24( self, var_0 );
}

get_animtree( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level.exploder_animtrees.size; var_2++ )
    {
        var_3 = getarraykeys( level._id_78AC[level.exploder_animtrees[var_2]] );

        if ( common_scripts\utility::_id_0CE4( var_3, var_0 ) )
        {
            var_1 = level.exploder_animtrees[var_2];
            break;
        }
    }

    return var_1;
}
