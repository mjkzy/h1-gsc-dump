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

_id_1226()
{
    if ( !isdefined( level._id_055B._id_A3E9 ) )
    {
        level._id_055B._id_A3E9 = spawnstruct();
        level._id_055B._id_A3E9._id_2507 = "";
        level._id_055B._id_A3E9._id_A3F6 = [];
        level._id_055B._id_A3E9._id_662B = spawnstruct();
        level._id_055B._id_A3E9._id_662B._id_77DD = [];
        level._id_055B._id_A3E9._id_662B._id_25B3 = [];
        level._id_055B._id_A3E9._id_662B._id_5CE8 = [];
        level._id_055B._id_A3E9._id_662B._id_74E4 = [];
        level._id_055B._id_A3E9._id_662B._id_632E = [];
        _id_1232( 1 );
        _id_122B( 1 );
        _id_122F( 1 );
        _id_1234( 1 );
        _id_122D( 1 );
        _id_1231( 1 );
        _id_122E( 0 );
        _id_1233( 0 );
        _id_122C( 0 );
        _id_1230( 0 );
        level._id_055B._id_A3E9._id_9BE7 = 0;
    }

    if ( !isdefined( level._id_055B._id_9BDE ) )
        level._id_055B._id_56B8 = undefined;
}

_id_123D()
{
    level._id_055B._id_A3E9._id_9BE7 = 1;
}

_id_123A( var_0, var_1, var_2 )
{
    if ( level._id_055B._id_A3E9._id_2507 == var_0 )
        return;
    else if ( level._id_055B._id_A3E9._id_2507 != "" )
        _id_123B( level._id_055B._id_A3E9._id_2507, var_1 );

    level._id_055B._id_A3E9._id_2507 = var_0;

    if ( isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) && isdefined( level._id_055B._id_A3E9._id_A3F6[var_0]["state"] ) && level._id_055B._id_A3E9._id_A3F6[var_0]["state"] != "stopping" )
    {
        _id_A5DC::_id_102D( "ZONEM_start_zone(\"" + var_0 + "\") being called even though audio zone, \"" + var_0 + "\", is already started." );
        return;
    }

    var_3 = 2.0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( !isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) )
    {
        var_4 = _id_1245( var_0 );

        if ( !isdefined( var_4 ) )
            return;

        level._id_055B._id_A3E9._id_A3F6[var_0] = var_4;
    }

    var_4 = level._id_055B._id_A3E9._id_A3F6[var_0];
    _id_A5DC::_id_102E( "ZONE START: " + var_0 );
    level._id_055B._id_A3E9._id_A3F6[var_0]["state"] = "playing";
    var_5 = var_4["priority"];
    var_6 = var_4["interrupt_fade"];

    if ( isdefined( var_4["streamed_ambience"] ) )
    {
        if ( var_4["streamed_ambience"] != "none" )
            _id_A5E3::_id_8656( var_4["streamed_ambience"], var_3, var_5, var_6 );
        else
            _id_A5E3::_id_8657( var_3 );
    }

    if ( isdefined( var_4["dynamic_ambience"] ) )
    {
        if ( var_4["dynamic_ambience"] != "none" )
            _id_A5DD::_id_25C8( var_4["dynamic_ambience"], 1.0 );
        else
            _id_A5DD::_id_25C5( 1.0 );
    }

    if ( isdefined( var_4["occlusion"] ) && !_id_1221() )
    {
        if ( var_4["occlusion"] != "none" )
            _id_A5F7::_id_8757( var_4["occlusion"] );
        else
            _id_A5F7::_id_8757( undefined );
    }

    if ( isdefined( var_4["filter"] ) && !_id_121D() )
    {
        _id_A5F7::_id_8754( var_4["filter"], 0 );
        _id_A5F7::_id_8755( 1 );
    }

    if ( isdefined( var_4["reverb"] ) && !_id_1224() )
    {
        if ( var_4["reverb"] != "none" )
            _id_A5E2::_id_76F3( var_4["reverb"] );
        else
            _id_A5E2::_id_76EE();
    }

    if ( isdefined( var_4["mix"] ) && !_id_121F() )
    {
        if ( var_4["mix"] != "none" )
            _id_A5DE::_id_5D01( var_4["mix"] );
        else
            _id_A5DE::_id_5CF9( undefined, 1.0 );
    }

    if ( isdefined( var_4["context"] ) )
        _id_A5E9::_id_86D3( var_4["context"] );
}

_id_1239( var_0, var_1, var_2 )
{
    var_3 = _id_124B( var_0, "streamed_ambience", var_1, ::_id_124A, var_2 );

    if ( !var_3 )
    {
        if ( !isdefined( var_1 ) )
            var_1 = "none";

        level._id_055B._id_A3E9._id_662B._id_77DD[var_0] = var_1;
    }
}

_id_1235( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    _id_124B( var_0, "dynamic_ambience", var_1, ::_id_1246, var_2 );
    level._id_055B._id_A3E9._id_662B._id_25B3[var_0] = var_1;
}

_id_1238( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    _id_124B( var_0, "reverb", var_1, ::_id_1249, var_2 );
    level._id_055B._id_A3E9._id_662B._id_74E4[var_0] = var_1;
}

_id_1237( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    _id_124B( var_0, "occlusion", var_1, ::_id_1248, var_2 );
    level._id_055B._id_A3E9._id_662B._id_5CE8[var_1] = var_1;
}

_id_1236( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    _id_124B( var_0, "mix", var_1, ::_id_1247, var_2 );
    level._id_055B._id_A3E9._id_662B._id_5CE8[var_1] = var_1;
}

_id_123C( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_A5DC::_id_102E( "ZONE STOP ALL" );

    foreach ( var_3 in level._id_055B._id_A3E9._id_A3F6 )
        _id_123B( var_3["name"], var_1, 0 );
}

_id_123B( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) && isdefined( level._id_055B._id_A3E9._id_A3F6[var_0]["state"] ) && level._id_055B._id_A3E9._id_A3F6[var_0]["state"] != "stopping" )
    {
        var_3 = 1.0;

        if ( isdefined( var_1 ) )
            var_3 = var_1;

        var_4 = level._id_055B._id_A3E9._id_A3F6[var_0];
        var_5 = 0;

        if ( isdefined( var_2 ) )
            var_5 = var_2;

        if ( var_5 )
            _id_A5DC::_id_102E( "ZONE STOP ZONE: " + var_0 );

        if ( isdefined( var_4["streamed_ambience"] ) )
            _id_A5E3::_id_8658( var_4["streamed_ambience"], var_3 );

        if ( isdefined( var_4["dynamic_ambience"] ) )
            _id_A5DD::_id_25C9( var_4["dynamic_ambience"], var_3 );

        if ( isdefined( var_4["mix"] ) && !_id_121F() )
            _id_A5DE::_id_5CF9( var_4["mix"], var_3 );

        if ( isdefined( var_4["context"] ) )
            _id_A5E9::_id_86CD( var_4["context"] );

        level._id_055B._id_A3E9._id_A3F6[var_0]["state"] = "stopping";
        thread _id_124C( var_0, var_3 );
    }
}

_id_121B()
{
    return level._id_055B._id_A3E9._id_2507;
}

_id_122A( var_0 )
{
    level._id_055B._id_A3E9._id_2507 = var_0;
}

_id_1227( var_0, var_1, var_2 )
{

}

_id_1228( var_0 )
{

}

_id_1229( var_0 )
{

}

_id_1232( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_7080 = var_0;
}

_id_1223()
{
    return level._id_055B._id_A3E9._id_662B._id_7080;
}

_id_122B( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_25B5 = var_0;
}

_id_121C()
{
    return level._id_055B._id_A3E9._id_662B._id_25B5;
}

_id_122F( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_5CEB = var_0;
}

_id_1220()
{
    return level._id_055B._id_A3E9._id_662B._id_5CEB;
}

_id_1234( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_74F0 = var_0;
}

_id_1225()
{
    return level._id_055B._id_A3E9._id_662B._id_74F0;
}

_id_122D( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_36C6 = var_0;
}

_id_121E()
{
    return level._id_055B._id_A3E9._id_662B._id_36C6;
}

_id_1231( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_6332 = var_0;
}

_id_1222()
{
    return level._id_055B._id_A3E9._id_662B._id_6332;
}

_id_122E( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_5CE9 = var_0;
}

_id_121F()
{
    return level._id_055B._id_A3E9._id_662B._id_5CE9;
}

_id_1233( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_74EF = var_0;
}

_id_1224()
{
    return level._id_055B._id_A3E9._id_662B._id_74EF;
}

_id_122C( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_36C5 = var_0;
}

_id_121D()
{
    return isdefined( level._id_6015 ) && level._id_6015 || level._id_055B._id_A3E9._id_662B._id_36C5;
}

_id_1230( var_0 )
{
    level._id_055B._id_A3E9._id_662B._id_6331 = var_0;
}

_id_1221()
{
    return level._id_055B._id_A3E9._id_662B._id_6331;
}

_id_1245( var_0 )
{
    if ( isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) )
        return;

    if ( !isdefined( level._id_055B._id_A3E9._id_6F1F ) )
        level._id_055B._id_A3E9._id_6F1F = [];

    var_1 = [];

    if ( isdefined( level._id_055B._id_A3E9._id_6F1F[var_0] ) )
        var_1 = level._id_055B._id_A3E9._id_6F1F[var_0];
    else
        var_1 = _id_1240( var_0, 1 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._id_055B._id_A3E9._id_6F1F[var_0] = var_1;
    var_2 = 0;

    if ( _id_1223() && isdefined( level._id_055B._id_A3E9._id_662B._id_77DD[var_0] ) )
    {
        if ( level._id_055B._id_A3E9._id_662B._id_77DD[var_0] == "none" )
            var_1["streamed_ambience"] = undefined;
        else
            var_1["streamed_ambience"] = level._id_055B._id_A3E9._id_662B._id_77DD[var_0];

        var_2 = 1;
        level._id_055B._id_A3E9._id_662B._id_77DD[var_0] = undefined;
    }

    if ( _id_121C() && isdefined( level._id_055B._id_A3E9._id_662B._id_25B3[var_0] ) )
    {
        if ( level._id_055B._id_A3E9._id_662B._id_25B3[var_0] == "none" )
            var_1["dynamic_ambience"] = undefined;
        else
            var_1["dynamic_ambience"] = level._id_055B._id_A3E9._id_662B._id_25B3[var_0];

        var_2 = 1;
        level._id_055B._id_A3E9._id_662B._id_25B3[var_0] = undefined;
    }

    if ( _id_1225() && isdefined( level._id_055B._id_A3E9._id_662B._id_74E4[var_0] ) )
    {
        if ( level._id_055B._id_A3E9._id_662B._id_74E4[var_0] == "none" )
            var_1["reverb"] = undefined;
        else
            var_1["reverb"] = level._id_055B._id_A3E9._id_662B._id_74E4[var_0];

        var_2 = 1;
        level._id_055B._id_A3E9._id_662B._id_74E4[var_0] = undefined;
    }

    if ( _id_1222() && isdefined( level._id_055B._id_A3E9._id_662B._id_632E[var_0] ) )
    {
        if ( level._id_055B._id_A3E9._id_662B._id_632E[var_0] == "none" )
            var_1["occlusion"] = undefined;
        else
            var_1["occlusion"] = level._id_055B._id_A3E9._id_662B._id_632E[var_0];

        var_2 = 1;
        level._id_055B._id_A3E9._id_662B._id_632E[var_0] = undefined;
    }

    if ( _id_121E() && isdefined( level._id_055B._id_A3E9._id_662B._id_5CE8[var_0] ) )
    {
        if ( level._id_055B._id_A3E9._id_662B._id_5CE8[var_0] == "none" )
            var_1["mix"] = undefined;
        else
            var_1["mix"] = level._id_055B._id_A3E9._id_662B._id_5CE8[var_0];

        var_2 = 1;
        level._id_055B._id_A3E9._id_662B._id_5CE8[var_0] = undefined;
    }

    if ( var_2 )
        level._id_055B._id_A3E9._id_6F1F[var_0] = var_1;

    var_1["name"] = var_0;

    if ( !isdefined( var_1["priority"] ) )
        var_1["priority"] = 1;

    if ( !isdefined( var_1["interrupt_fade"] ) )
        var_1["interrupt_fade"] = 0.1;

    return var_1;
}

_id_1240( var_0, var_1 )
{
    var_2 = "soundtables/sp_defaults.csv";
    var_3 = _id_A5DC::_id_3ED7();
    var_4 = [];

    if ( var_1 )
        var_4 = _id_1241( var_3, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        var_4 = _id_1241( var_2, var_0 );

    if ( !isdefined( var_4 ) || var_4.size == 0 )
        return;

    return var_4;
}

_id_1241( var_0, var_1 )
{
    var_2 = [];
    var_3 = "";
    var_4 = "";
    var_5 = packedtablesectionlookup( var_0, "zone_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );

    if ( isdefined( var_5 ) )
    {
        var_6 = 9;

        for ( var_7 = 1; var_7 < var_6; var_7++ )
        {
            if ( var_3 != "comments" && var_4 != "" )
                var_2[var_3] = var_4;

            var_3 = packedtablelookupwithrange( var_0, 0, "zone_names", var_7, var_5[0], var_5[1] );
            var_4 = packedtablelookupwithrange( var_0, 0, var_1, var_7, var_5[0], var_5[1] );

            if ( var_3 != "comment" && var_3 != "comments" && var_4 != "" )
            {
                switch ( var_3 )
                {
                    case "streamed_ambience":
                        var_2["streamed_ambience"] = var_4;
                        continue;
                    case "dynamic_ambience":
                        var_2["dynamic_ambience"] = var_4;
                        continue;
                    case "mix":
                        var_2["mix"] = var_4;
                        continue;
                    case "reverb":
                        var_2["reverb"] = var_4;
                        continue;
                    case "filter":
                        var_2["filter"] = var_4;
                        continue;
                    case "occlusion":
                        var_2["occlusion"] = var_4;
                        continue;
                    case "context":
                        var_2["context"] = var_4;
                        continue;
                    default:
                        continue;
                }
            }
        }

        return var_2;
    }
}

_id_124A( var_0, var_1 )
{
    var_2 = level._id_055B._id_A3E9._id_A3F6[var_0]["streamed_ambience"];

    if ( isdefined( var_2 ) )
        _id_A5E3::_id_8656( var_2, var_1 );
    else
        _id_A5E3::_id_8657( var_1 );
}

_id_1246( var_0, var_1 )
{
    var_2 = 1.0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    var_3 = level._id_055B._id_A3E9._id_A3F6[var_0]["dynamic_ambience"];

    if ( isdefined( var_3 ) )
        _id_A5DD::_id_25C8( var_3, var_2 );
    else
        _id_A5DD::_id_25C9( undefined, var_2 );
}

_id_1249( var_0, var_1 )
{
    var_2 = level._id_055B._id_A3E9._id_A3F6[var_0]["reverb"];

    if ( isdefined( var_2 ) && !_id_1224() )
        _id_A5E2::_id_76F3( var_2 );
}

_id_1248( var_0, var_1 )
{
    var_2 = level._id_055B._id_A3E9._id_A3F6[var_0]["occlusion"];

    if ( isdefined( var_2 ) && !_id_1221() )
        _id_A5F7::_id_8757( var_2 );
}

_id_1247( var_0, var_1 )
{
    var_2 = level._id_055B._id_A3E9._id_A3F6[var_0]["mix"];

    if ( !_id_121F() )
    {
        if ( isdefined( var_2 ) )
            _id_A5DE::_id_5D01( var_2 );
        else
            _id_A5DE::_id_5CF9( undefined, var_1 );
    }
}

_id_124B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) )
    {
        if ( isdefined( level._id_055B._id_A3E9._id_A3F6[var_0][var_1] ) && level._id_055B._id_A3E9._id_A3F6[var_0][var_1] != var_2 || !isdefined( level._id_055B._id_A3E9._id_A3F6[var_0][var_1] ) && ( isdefined( var_2 ) && var_2 != "none" ) )
        {
            if ( var_2 == "none" )
                level._id_055B._id_A3E9._id_A3F6[var_0][var_1] = undefined;
            else
                level._id_055B._id_A3E9._id_A3F6[var_0][var_1] = var_2;

            if ( var_0 == _id_121B() )
                [[ var_3 ]]( var_0, var_4 );
        }

        return 1;
    }
    else
        return 0;
}

_id_124C( var_0, var_1 )
{
    wait(var_1);
    wait 0.05;

    if ( level._id_055B._id_A3E9._id_A3F6[var_0]["state"] == "stopping" )
        return;
}

_id_123F( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_A3E4 = var_0;
    var_2._id_A3EE = var_1;
    var_2._id_77DE = undefined;
    var_2._id_77DF = undefined;
    var_2._id_25CA = undefined;
    var_2._id_25CB = undefined;
    var_2._id_6333 = undefined;
    var_2._id_6334 = undefined;
    var_2._id_36CA = undefined;
    var_2._id_36CB = undefined;
    var_2._id_74F3 = undefined;
    var_2._id_74F4 = undefined;
    var_2._id_5CEE = undefined;
    var_2._id_5CF0 = undefined;
    var_2.context1 = undefined;
    var_2.context2 = undefined;

    if ( !isdefined( level._id_055B._id_A3E9._id_A3F6[var_0] ) )
    {
        var_3 = _id_1245( var_0 );

        if ( !isdefined( var_3 ) )
        {
            _id_A5DC::_id_102D( "Couldn't find zone: " + var_0 );
            return;
        }

        level._id_055B._id_A3E9._id_A3F6[var_0] = var_3;
    }

    var_4 = level._id_055B._id_A3E9._id_A3F6[var_0];

    if ( !isdefined( level._id_055B._id_A3E9._id_A3F6[var_1] ) )
    {
        var_3 = _id_1245( var_1 );

        if ( !isdefined( var_3 ) )
        {
            _id_A5DC::_id_102D( "Couldn't find zone: " + var_1 );
            return;
        }

        level._id_055B._id_A3E9._id_A3F6[var_1] = var_3;
    }

    var_5 = level._id_055B._id_A3E9._id_A3F6[var_1];
    var_2._id_6333 = var_4["occlusion"];
    var_2._id_6334 = var_5["occlusion"];
    var_2._id_36CA = var_4["filter"];
    var_2._id_36CB = var_5["filter"];
    var_2._id_74F3 = var_4["reverb"];
    var_2._id_74F4 = var_5["reverb"];
    var_2._id_5CED = var_4["mix"];
    var_2._id_5CEF = var_5["mix"];
    var_2.context1 = var_4["context"];
    var_2.context2 = var_5["context"];
    var_2._id_77DE = var_4["streamed_ambience"];
    var_2._id_77DF = var_5["streamed_ambience"];
    var_6 = level._id_055B._id_25B3.positioninworld["zone"].size;

    if ( var_6 > 1 )
        _id_A5DD::_id_25C2( 1.0, "zone" );

    var_2._id_25CA = var_4["dynamic_ambience"];
    var_2._id_25CB = var_5["dynamic_ambience"];
    return var_2;
}

_id_1243( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

_id_1242( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

_id_1244( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) && var_0 != var_1 )
        var_2 = 1;
    else if ( isdefined( var_1 ) && !isdefined( var_0 ) )
        var_2 = 1;
    else if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        var_2 = 1;

    return var_2;
}

_id_123E( var_0, var_1, var_2 )
{
    if ( _id_1244( var_2._id_77DE, var_2._id_77DF ) )
    {
        var_3 = [];
        var_4 = 0;

        if ( isdefined( var_2._id_77DE ) && var_2._id_77DE != "" )
        {
            var_5 = level._id_055B._id_A3E9._id_A3F6[var_2._id_A3E4];
            var_3[var_4] = spawnstruct();
            var_3[var_4]._id_09D6 = var_2._id_77DE;
            var_3[var_4]._id_9F37 = var_0;
            var_3[var_4]._id_35D9 = var_5["interrupt_fade"];
            var_3[var_4]._id_6FBE = var_5["priority"];
            var_4++;
        }

        if ( isdefined( var_2._id_77DF ) && var_2._id_77DF != "" )
        {
            var_6 = level._id_055B._id_A3E9._id_A3F6[var_2._id_A3EE];
            var_3[var_4] = spawnstruct();
            var_3[var_4]._id_09D6 = var_2._id_77DF;
            var_3[var_4]._id_9F37 = var_1;
            var_3[var_4]._id_35D9 = var_6["interrupt_fade"];
            var_3[var_4]._id_6FBE = var_6["priority"];
        }

        if ( var_3.size > 0 )
            _id_A5E3::_id_8654( var_3 );
    }

    if ( _id_1242( var_2._id_25CA, var_2._id_25CB ) )
        _id_A5DD::_id_25BB( var_2._id_25CA, var_0, var_2._id_25CB, var_1 );

    if ( _id_1243( var_2._id_5CED, var_2._id_5CEF ) && !_id_121F() )
        _id_A5DE::_id_5CF4( var_2._id_5CED, var_0, var_2._id_5CEF, var_1 );

    if ( isdefined( var_2._id_36CA ) )
    {
        if ( !_id_121D() )
            _id_A5F7::_id_8754( var_2._id_36CA, 0, 0 );
    }
    else if ( !_id_121D() )
        _id_A5F7::_id_8754( undefined, 0, 0 );

    if ( isdefined( var_2._id_36CB ) )
    {
        if ( !_id_121D() )
            _id_A5F7::_id_8754( var_2._id_36CB, 1, 0 );
    }
    else if ( !_id_121D() )
        _id_A5F7::_id_8754( undefined, 1, 0 );

    if ( isdefined( var_2._id_36CA ) || isdefined( var_2._id_36CB ) )
    {
        if ( !_id_121D() )
            _id_A5F7::_id_8755( var_0 );
    }

    if ( var_0 >= 0.75 )
    {
        if ( isdefined( var_2._id_74F3 ) && !_id_1224() )
        {
            if ( var_2._id_74F3 == "none" )
                _id_A5E2::_id_76F3( undefined );
            else
                _id_A5E2::_id_76F3( var_2._id_74F3 );
        }

        if ( isdefined( var_2._id_6333 ) && !_id_1221() )
        {
            if ( var_2._id_6333 == "none" )
                _id_A5F7::_id_8757( undefined );
            else
                _id_A5F7::_id_8757( var_2._id_6333 );
        }

        if ( isdefined( var_2.context2 ) )
            _id_A5E9::_id_86CD( var_2.context2 );

        if ( isdefined( var_2.context1 ) )
            _id_A5E9::_id_86D3( var_2.context1 );
    }
    else if ( var_1 >= 0.75 )
    {
        if ( isdefined( var_2._id_74F4 ) && !_id_1224() )
        {
            if ( var_2._id_74F4 == "none" )
                _id_A5E2::_id_76F3( undefined );
            else
                _id_A5E2::_id_76F3( var_2._id_74F4 );
        }

        if ( isdefined( var_2._id_6334 ) && !_id_1221() )
        {
            if ( var_2._id_6334 == "none" )
                _id_A5F7::_id_8757( undefined );
            else
                _id_A5F7::_id_8757( var_2._id_6334 );
        }

        if ( isdefined( var_2.context1 ) )
            _id_A5E9::_id_86CD( var_2.context1 );

        if ( isdefined( var_2.context2 ) )
            _id_A5E9::_id_86D3( var_2.context2 );
    }
}
