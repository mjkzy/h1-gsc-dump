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

_id_A30E()
{
    level._id_055B._id_A30D = spawnstruct();
    level._id_055B._id_A30D._id_9BE7 = 0;
}

_id_A314()
{
    level._id_055B._id_A30D._id_9BE7 = 1;
}

_id_A310( var_0 )
{
    var_1 = [];
    var_1 = _id_A318( var_0 );
    var_1["name"] = var_0;
    var_2 = var_1["probability"];
    var_3 = var_1["spread"];
    var_4 = var_1["radius"];
    var_5 = var_1["offset"];
    level.player setwhizbyprobabilities( var_2[0], var_2[1], var_2[2] );
    level.player setwhizbyspreads( var_3[0], var_3[1], var_3[2] );
    level.player setwhizbyradii( var_4[0], var_4[1], var_4[2] );
    level.player setwhizbyoffset( var_5 );
}

_id_A311( var_0, var_1, var_2 )
{
    level.player setwhizbyprobabilities( var_0, var_1, var_2 );
}

_id_A313( var_0, var_1, var_2 )
{
    level.player setwhizbyspreads( var_0, var_1, var_2 );
}

_id_A312( var_0, var_1, var_2 )
{
    level.player setwhizbyradii( var_0, var_1, var_2 );
}

_id_A30F( var_0 )
{
    level.player setwhizbyoffset( var_0 );
}

_id_A318( var_0 )
{
    var_1 = "soundtables/sp_defaults.csv";
    var_2 = [];
    var_2 = _id_A317( var_1, var_0 );
    return var_2;
}

_id_A317( var_0, var_1 )
{
    var_2 = [];
    var_3 = "";
    var_4 = "";
    var_5 = 12;
    var_6 = [];
    var_7 = [];
    var_8 = [];
    var_9 = 0;
    var_10 = 0;
    var_11 = packedtablesectionlookup( var_0, "whizby_preset_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_11 ) )
    {
        for ( var_12 = 1; var_12 < var_5; var_12++ )
        {
            var_3 = packedtablelookupwithrange( var_0, 0, "whizby_preset_names", var_12, var_11[0], var_11[1] );
            var_4 = packedtablelookupwithrange( var_0, 0, var_1, var_12, var_11[0], var_11[1] );

            if ( !isdefined( var_4 ) )
                break;

            if ( var_4 != "" && var_4 != "comments" )
            {
                var_10++;

                switch ( var_3 )
                {
                    case "radius_offset":
                        var_9 = float( var_4 );
                        continue;
                    case "near_radius":
                        var_6[0] = float( var_4 );
                        continue;
                    case "medium_radius":
                        var_6[1] = float( var_4 );
                        continue;
                    case "far_radius":
                        var_6[2] = float( var_4 );
                        continue;
                    case "near_spread":
                        var_7[0] = float( var_4 );
                        continue;
                    case "medium_spread":
                        var_7[1] = float( var_4 );
                        continue;
                    case "far_spread":
                        var_7[2] = float( var_4 );
                        continue;
                    case "near_prob":
                        var_8[0] = float( var_4 );
                        continue;
                    case "medium_prob":
                        var_8[1] = float( var_4 );
                        continue;
                    case "far_prob":
                        var_8[2] = float( var_4 );
                        continue;
                }
            }
        }

        if ( var_10 > 0 )
        {
            var_2["radius"] = var_6;
            var_2["spread"] = var_7;
            var_2["probability"] = var_8;

            if ( isdefined( var_9 ) )
                var_2["offset"] = var_9;
        }

        return var_2;
    }
}
