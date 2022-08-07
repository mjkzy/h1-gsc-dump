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

_id_4D16()
{
    level._createfx._id_654C = [];
    _id_0819( "vector", "origin", "Origin", ( 0.0, 0.0, 0.0 ), "fx", 1 );
    _id_0819( "vector", "angles", "Angles", ( 0.0, 0.0, 0.0 ), "fx", 1 );
    _id_0819( "string", "fxid", "FX id", "nil", "fx" );
    _id_0819( "float", "delay", "Repeat rate/start delay", 0.5, "fx" );
    _id_0819( "string", "flag", "Flag", "nil", "exploder" );
    _id_0819( "string", "platform", "Platform", "all", "all" );
    _id_0819( "vector", "tintcolor", "Tint Color", ( 1.0, 1.0, 1.0 ), "fx" );
    _id_0819( "float", "tintalpha", "Tint Alpha", 1.0, "fx" );
    _id_0819( "vector", "fadein", "Fade In(base, range, 0)", ( 0.0, 0.0, 0.0 ), "fx" );
    _id_0819( "vector", "fadeout", "Fade Out(base, range, 0)", ( 0.0, 0.0, 0.0 ), "fx" );
    _id_0819( "float", "emissive", "Emissive", 1.0, "fx" );
    _id_0819( "float", "sizescale", "Scale", 1.0, "fx" );

    if ( !level.mp_createfx )
    {
        _id_0819( "string", "firefx", "2nd FX id", "nil", "exploder" );
        _id_0819( "float", "firefxdelay", "2nd FX id repeat rate", 0.5, "exploder" );
        _id_0819( "float", "firefxtimeout", "2nd FX timeout", 5, "exploder" );
        _id_0819( "string", "firefxsound", "2nd FX soundalias", "nil", "exploder" );
        _id_0819( "float", "damage", "Radius damage", 150, "exploder" );
        _id_0819( "float", "damage_radius", "Radius of radius damage", 250, "exploder" );
        _id_0819( "string", "earthquake", "Earthquake", "nil", "exploder" );
        _id_0819( "string", "ender", "Level notify for ending 2nd FX", "nil", "exploder" );
    }

    _id_0819( "float", "delay_min", "Minimimum time between repeats", 1, "soundfx_interval" );
    _id_0819( "float", "delay_max", "Maximum time between repeats", 2, "soundfx_interval" );
    _id_0819( "int", "repeat", "Number of times to repeat", 5, "exploder" );
    _id_0819( "string", "exploder", "Exploder", "1", "exploder" );
    _id_0819( "string", "stop_on_exploder", "Stop on exploder", "1", "all" );
    _id_813D();
    _id_0819( "string", "soundalias", "Soundalias", "nil", "all" );
    _id_0819( "string", "loopsound", "Loopsound", "nil", "exploder" );
    _id_0819( "int", "reactive_radius", "Reactive Radius", 100, "reactive_fx", undefined, ::_id_4E7D );
    _id_0819( "string", "ambiencename", "Ambience Name", "nil", "soundfx_dynamic" );
    _id_0819( "int", "dynamic_distance", "Dynamic Max Distance", 1000, "soundfx_dynamic" );

    if ( !level.mp_createfx )
    {
        _id_0819( "string", "rumble", "Rumble", "nil", "exploder" );
        _id_0819( "int", "stoppable", "Can be stopped from script", "1", "all" );
    }

    level._id_301A = 0;
    level._id_301B = 10;
    level._id_3019 = 0;
    level._id_4837 = 0;
    level._id_4838 = 20;
    level._id_240B = 0;
    level._id_2410 = 0;
    level._id_241C = [];
    level._id_241C["all"] = [];
    level._id_241C["all"]["exploder"] = 1;
    level._id_241C["all"]["oneshotfx"] = 1;
    level._id_241C["all"]["loopfx"] = 1;
    level._id_241C["all"]["soundfx"] = 1;
    level._id_241C["all"]["soundfx_interval"] = 1;
    level._id_241C["all"]["reactive_fx"] = 1;
    level._id_241C["all"]["soundfx_dynamic"] = 1;
    level._id_241C["fx"] = [];
    level._id_241C["fx"]["exploder"] = 1;
    level._id_241C["fx"]["oneshotfx"] = 1;
    level._id_241C["fx"]["loopfx"] = 1;
    level._id_241C["exploder"] = [];
    level._id_241C["exploder"]["exploder"] = 1;
    level._id_241C["loopfx"] = [];
    level._id_241C["loopfx"]["loopfx"] = 1;
    level._id_241C["oneshotfx"] = [];
    level._id_241C["oneshotfx"]["oneshotfx"] = 1;
    level._id_241C["soundfx"] = [];
    level._id_241C["soundfx"]["soundalias"] = 1;
    level._id_241C["soundfx_interval"] = [];
    level._id_241C["soundfx_interval"]["soundfx_interval"] = 1;
    level._id_241C["reactive_fx"] = [];
    level._id_241C["reactive_fx"]["reactive_fx"] = 1;
    level._id_241C["soundfx_dynamic"] = [];
    level._id_241C["soundfx_dynamic"]["soundfx_dynamic"] = 1;
    var_0 = [];
    var_0["creation"] = ::_id_5BAC;
    var_0["create_oneshot"] = ::_id_5BAB;
    var_0["create_loopfx"] = ::_id_5BAB;
    var_0["change_fxid"] = ::_id_5BAB;
    var_0["none"] = ::_id_5BAF;
    var_0["add_options"] = ::_id_5BA9;
    var_0["select_by_name"] = ::_id_5BB0;
    level._createfx._id_5BB4 = var_0;
}

_id_5BA8( var_0 )
{
    return level._id_23B9 == var_0;
}

_id_7FAA( var_0 )
{
    level._id_23B9 = var_0;
}

_id_23B9()
{
    if ( common_scripts\_createfx::_id_194C( "escape", "x" ) )
    {
        _id_05A5();
        return;
    }

    if ( isdefined( level._createfx._id_5BB4[level._id_23B9] ) )
        [[ level._createfx._id_5BB4[level._id_23B9] ]]();
}

_id_5BAC()
{
    if ( common_scripts\_createfx::_id_194C( "1" ) )
    {
        _id_7FAA( "create_oneshot" );
        _id_2DB3();
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "2" ) )
    {
        _id_7FAA( "create_loopfx" );
        _id_2DB3();
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "3" ) )
    {
        _id_7FAA( "create_loopsound" );
        var_0 = common_scripts\_createfx::_id_2429();
        _id_378E( var_0 );
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "4" ) )
    {
        _id_7FAA( "create_exploder" );
        var_0 = common_scripts\_createfx::_id_242D();
        _id_378E( var_0 );
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "5" ) )
    {
        _id_7FAA( "create_interval_sound" );
        var_0 = common_scripts\_createfx::_id_2422();
        _id_378E( var_0 );
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "6" ) )
    {
        var_0 = common_scripts\_createfx::_id_2438();
        _id_378E( var_0 );
        return;
    }
    else if ( common_scripts\_createfx::_id_194C( "7" ) )
    {
        var_0 = common_scripts\_createfx::_id_23F9();
        _id_378E( var_0 );
        return;
    }
}

_id_5BAB()
{
    level._id_2410 = 1;

    if ( _id_60B8() )
    {
        _id_4C39();
        _id_2DB3();
    }
    else if ( _id_6F58() )
    {
        _id_275C();
        _id_2DB3();
    }

    _id_5BAD();
}

_id_5BAF()
{
    if ( common_scripts\_createfx::_id_194C( "m" ) )
        _id_4C39();

    _id_5BAA();

    if ( _id_330E() )
    {
        var_0 = _id_3DB3();

        if ( !isdefined( level._id_5519 ) || var_0 != level._id_5519 || level._createfx._id_52CC == 1 )
        {
            _id_2B49( var_0 );
            level._id_5519 = var_0;
            level._createfx._id_52CC = 0;
        }

        if ( common_scripts\_createfx::_id_194C( "a" ) )
        {
            common_scripts\_createfx::_id_1ED6();
            _id_7FAA( "add_options" );
            return;
        }
    }
    else
        level._id_5519 = undefined;
}

_id_5BA9()
{
    if ( !_id_330E() )
    {
        common_scripts\_createfx::_id_1EB9();
        _id_7FAA( "none" );
        return;
    }

    _id_2B48( _id_3DB3() );

    if ( _id_60B8() )
        _id_4C39();
}

_id_5BB0()
{
    if ( _id_60B8() )
    {
        _id_4C39();
        _id_2DB3( "Select by name" );
    }
    else if ( _id_6F58() )
    {
        _id_275C();
        _id_2DB3( "Select by name" );
    }

    _id_7C5A();
}

_id_60B8()
{
    return common_scripts\_createfx::_id_194C( "rightarrow" );
}

_id_6F58()
{
    return common_scripts\_createfx::_id_194C( "leftarrow" );
}

_id_05A5()
{
    common_scripts\_createfx::_id_1EB9();
    common_scripts\_createfx::_id_1EB5();
    common_scripts\_createfx::_id_9ADC();
    _id_7FAA( "none" );
}

_id_5BAD()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = common_scripts\_createfx::_id_3AE8();

    for ( var_3 = level._id_301A; var_3 < var_2.size; var_3++ )
    {
        var_0 += 1;
        var_4 = var_0;

        if ( var_4 == 10 )
            var_4 = 0;

        if ( common_scripts\_createfx::_id_194C( var_4 + "" ) )
        {
            var_1 = var_2[var_3];
            break;
        }

        if ( var_0 > level._id_301B )
            break;
    }

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_5BA8( "change_fxid" ) )
    {
        _id_0CA5( _id_3E02( "fxid" ), var_1 );
        level._id_301A = 0;
        common_scripts\_createfx::_id_1EB9();
        _id_7FAA( "none" );
        level._id_2410 = 0;
        level._id_240E = 0;
        return;
    }

    var_5 = undefined;

    if ( _id_5BA8( "create_loopfx" ) )
        var_5 = common_scripts\utility::_id_2428( var_1 );

    if ( _id_5BA8( "create_oneshot" ) )
        var_5 = common_scripts\utility::_id_242E( var_1 );

    _id_378E( var_5 );
}

_id_378E( var_0 )
{
    var_0.v["angles"] = vectortoangles( var_0.v["origin"] + ( 0.0, 0.0, 100.0 ) - var_0.v["origin"] );
    var_0 common_scripts\_createfx::_id_6E6D();
    common_scripts\_createfx::_id_1EB5();
    common_scripts\_createfx::_id_7C5F();
    common_scripts\_createfx::_id_5F26();
    common_scripts\_createfx::_id_9ADC();
    _id_7FAA( "none" );
    level._id_2410 = 0;
}

_id_330E()
{
    return level._createfx._id_7C66.size > 0;
}

_id_5BAA()
{
    if ( !level._createfx._id_7C66.size )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = _id_3DB3();

    for ( var_3 = 0; var_3 < level._createfx._id_654C.size; var_3++ )
    {
        var_4 = level._createfx._id_654C[var_3];

        if ( !isdefined( var_2.v[var_4["name"]] ) )
            continue;

        var_0++;

        if ( var_0 < level._id_301A )
            continue;

        var_1++;
        var_5 = var_1;

        if ( var_5 == 10 )
            var_5 = 0;

        if ( common_scripts\_createfx::_id_194C( var_5 + "" ) )
        {
            _id_6F15( var_4, var_1 );
            break;
        }

        if ( var_1 > level._id_301B )
        {
            var_6 = 1;
            break;
        }
    }
}

_id_6F15( var_0, var_1 )
{
    if ( var_0["name"] == "fxid" )
    {
        _id_7FAA( "change_fxid" );
        _id_2DB3();
        return;
    }

    level._id_240D = 1;
    level._createfx._id_4AE9[var_1 + 1][0].color = ( 1.0, 1.0, 0.0 );

    if ( isdefined( var_0["input_func"] ) )
        thread [[ var_0["input_func"] ]]( var_1 + 1 );
    else
        common_scripts\_createfx::_id_2405( "To set " + var_0["description"] + ", type /fx newvalue. To remove " + var_0["description"] + ", type /fx del" );

    _id_7E8D( var_0["name"] );
    setdvar( "fx", "nil" );
}

_id_5BAE()
{
    if ( getdvar( "fx" ) == "nil" )
        return;

    if ( getdvar( "fx" ) == "del" )
        common_scripts\_createfx::_id_737E();
    else
    {
        var_0 = _id_3E5D();
        var_1 = undefined;

        if ( var_0["type"] == "string" )
            var_1 = getdvar( "fx" );

        if ( var_0["type"] == "int" )
            var_1 = getdvarint( "fx" );

        if ( var_0["type"] == "float" )
            var_1 = getdvarfloat( "fx" );

        if ( var_0["type"] == "vector" )
            var_1 = getdvarvector( "fx" );

        if ( isdefined( var_1 ) )
        {
            _id_0CA5( var_0, var_1 );
            return;
        }

        setdvar( "fx", "nil" );
    }
}

_id_0CA5( var_0, var_1 )
{
    common_scripts\_createfx::_id_780E();

    for ( var_2 = 0; var_2 < level._createfx._id_7C66.size; var_2++ )
    {
        var_3 = level._createfx._id_7C66[var_2];

        if ( _id_59D2( var_0["mask"], var_3.v["type"] ) )
            var_3.v[var_0["name"]] = var_1;
    }

    level._id_5519 = undefined;
    common_scripts\_createfx::_id_9ADC();
    common_scripts\_createfx::_id_1ED6();

    if ( var_0["name"] == "origin" )
    {
        level._id_240E = 0;
        common_scripts\_createfx::_id_3A0D();
    }

    if ( var_0["name"] == "angles" )
        level._id_240E = 0;

    common_scripts\_createfx::_id_780C();
}

_id_7E8D( var_0 )
{
    for ( var_1 = 0; var_1 < level._createfx._id_654C.size; var_1++ )
    {
        if ( level._createfx._id_654C[var_1]["name"] != var_0 )
            continue;

        level._createfx._id_7C67 = var_1;
        return;
    }
}

_id_3E5D()
{
    return level._createfx._id_654C[level._createfx._id_7C67];
}

_id_59D2( var_0, var_1 )
{
    return isdefined( level._id_241C[var_0][var_1] );
}

_id_0819( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = [];
    var_7["type"] = var_0;
    var_7["name"] = var_1;
    var_7["description"] = var_2;
    var_7["default"] = var_3;
    var_7["mask"] = var_4;

    if ( isdefined( var_5 ) && var_5 )
        var_7["nowrite"] = 1;
    else
        var_7["nowrite"] = 0;

    if ( isdefined( var_6 ) )
        var_7["input_func"] = var_6;

    level._createfx._id_654C[level._createfx._id_654C.size] = var_7;
}

_id_3E02( var_0 )
{
    for ( var_1 = 0; var_1 < level._createfx._id_654C.size; var_1++ )
    {
        if ( level._createfx._id_654C[var_1]["name"] == var_0 )
            return level._createfx._id_654C[var_1];
    }
}

_id_4E7D( var_0 )
{
    for (;;)
    {
        wait 0.05;

        if ( level.playercardbackground buttonpressed( "escape" ) || level.playercardbackground buttonpressed( "x" ) )
            break;

        var_1 = 0;

        if ( level.playercardbackground buttonpressed( "-" ) )
            var_1 = -10;
        else if ( level.playercardbackground buttonpressed( "=" ) )
            var_1 = 10;

        if ( var_1 != 0 )
        {
            foreach ( var_3 in level._createfx._id_7C66 )
            {
                if ( isdefined( var_3.v["reactive_radius"] ) )
                {
                    var_3.v["reactive_radius"] += var_1;
                    var_3.v["reactive_radius"] = clamp( var_3.v["reactive_radius"], 10, 1000 );
                }
            }
        }
    }

    level._id_5519 = undefined;
    common_scripts\_createfx::_id_9ADC();
    common_scripts\_createfx::_id_1ED6();
}

_id_2B48( var_0 )
{
    level._id_2410 = 1;
    common_scripts\_createfx::_id_1EB9();
    common_scripts\_createfx::_id_7E42( "Name: " + var_0.v["fxid"] );
    common_scripts\_createfx::_id_7E42( "Type: " + var_0.v["type"] );
    common_scripts\_createfx::_id_7E42( "Origin: " + var_0.v["origin"] );
    common_scripts\_createfx::_id_7E42( "Angles: " + var_0.v["angles"] );
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    if ( level._id_301A >= level._createfx._id_654C.size )
        level._id_301A = 0;

    for ( var_4 = 0; var_4 < level._createfx._id_654C.size; var_4++ )
    {
        var_5 = level._createfx._id_654C[var_4];

        if ( isdefined( var_0.v[var_5["name"]] ) )
            continue;

        if ( !_id_59D2( var_5["mask"], var_0.v["type"] ) )
            continue;

        var_1++;

        if ( var_1 < level._id_301A )
            continue;

        if ( var_2 >= level._id_301B )
            continue;

        var_2++;
        var_6 = var_2;

        if ( var_6 == 10 )
            var_6 = 0;

        if ( common_scripts\_createfx::_id_194C( var_6 + "" ) )
        {
            _id_0781( var_5 );
            _id_5BB3();
            level._id_5519 = undefined;
            return;
        }

        common_scripts\_createfx::_id_7E42( var_6 + ". " + var_5["description"] );
    }

    if ( var_1 > level._id_301B )
    {
        level._id_3019 = var_1;
        common_scripts\_createfx::_id_7E42( "(->) More >" );
    }

    common_scripts\_createfx::_id_7E42( "(x) Exit >" );
}

_id_0781( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level._createfx._id_7C66.size; var_2++ )
    {
        var_3 = level._createfx._id_7C66[var_2];

        if ( _id_59D2( var_0["mask"], var_3.v["type"] ) )
            var_3.v[var_0["name"]] = var_0["default"];
    }
}

_id_5BB3()
{
    level._id_301A = 0;
    common_scripts\_createfx::_id_1EB9();
    _id_7FAA( "none" );
}

_id_2B49( var_0 )
{
    if ( !_id_5BA8( "none" ) )
        return;

    if ( level._id_240B )
        return;

    common_scripts\_createfx::_id_1EB9();
    common_scripts\_createfx::_id_7E42( "Name: " + var_0.v["fxid"] );
    common_scripts\_createfx::_id_7E42( "Type: " + var_0.v["type"] );

    if ( _id_330E() )
    {
        var_1 = 0;
        var_2 = 0;
        var_3 = 0;

        for ( var_4 = 0; var_4 < level._createfx._id_654C.size; var_4++ )
        {
            var_5 = level._createfx._id_654C[var_4];

            if ( !isdefined( var_0.v[var_5["name"]] ) )
                continue;

            var_1++;

            if ( var_1 < level._id_301A )
                continue;

            var_2++;
            common_scripts\_createfx::_id_7E42( var_2 + ". " + var_5["description"] + ": " + var_0.v[var_5["name"]] );

            if ( var_2 > level._id_301B )
            {
                var_3 = 1;
                break;
            }
        }

        if ( var_1 > level._id_301B )
        {
            level._id_3019 = var_1;
            common_scripts\_createfx::_id_7E42( "(->) More >" );
        }

        common_scripts\_createfx::_id_7E42( "(a) Add >" );
        common_scripts\_createfx::_id_7E42( "(x) Exit >" );
    }
    else
    {
        var_1 = 0;
        var_3 = 0;

        for ( var_4 = 0; var_4 < level._createfx._id_654C.size; var_4++ )
        {
            var_5 = level._createfx._id_654C[var_4];

            if ( !isdefined( var_0.v[var_5["name"]] ) )
                continue;

            var_1++;
            common_scripts\_createfx::_id_7E42( var_5["description"] + ": " + var_0.v[var_5["name"]] );

            if ( var_1 > level._createfx._id_4AE1 )
                break;
        }
    }
}

_id_2B46()
{
    var_0 = _id_3DB3();

    if ( isdefined( var_0 ) )
        _id_2B49( var_0 );
}

_id_2DB3( var_0 )
{
    common_scripts\_createfx::_id_1EB9();
    var_1 = 0;
    var_2 = 0;
    var_3 = common_scripts\_createfx::_id_3AE8();
    level._id_3019 = var_3.size;

    if ( !isdefined( var_0 ) )
        var_0 = "Pick an effect";

    common_scripts\_createfx::_id_7E42( var_0 + " [" + level._id_301A + " - " + var_3.size + "]:" );

    for ( var_4 = level._id_301A; var_4 < var_3.size; var_4++ )
    {
        var_1 += 1;
        common_scripts\_createfx::_id_7E42( var_1 + ". " + var_3[var_4] );

        if ( var_1 >= level._id_301B )
        {
            var_2 = 1;
            break;
        }
    }

    if ( var_3.size > level._id_301B )
    {
        common_scripts\_createfx::_id_7E42( "(->) More >" );
        common_scripts\_createfx::_id_7E42( "(<-) Previous >" );
    }
}

_id_4C39()
{
    if ( level._id_301A >= level._id_3019 - level._id_301B )
        level._id_301A = 0;
    else
        level._id_301A += level._id_301B;
}

_id_275C()
{
    if ( level._id_3019 < level._id_301B )
        level._id_301A = 0;
    else
    {
        level._id_301A -= level._id_301B;

        if ( level._id_301A < 0 )
            level._id_301A = level._id_3019 - level._id_301B;
    }
}

_id_2DB6( var_0 )
{
    common_scripts\_createfx::_id_1EB9();
    var_1 = 0;
    var_2 = level._id_240C;

    if ( !isdefined( var_0 ) )
        var_0 = "Help";

    common_scripts\_createfx::_id_7E42( "[" + var_0 + "]" );

    for ( var_3 = level._id_4837; var_3 < var_2.size; var_3++ )
    {
        var_1 += 1;
        common_scripts\_createfx::_id_7E42( var_2[var_3] );

        if ( var_1 >= level._id_4838 )
        {
            var_4 = 1;
            break;
        }
    }

    if ( var_2.size > level._id_4838 )
    {
        level._id_3019 = var_2.size;
        common_scripts\_createfx::_id_7E42( "(->) More >" );
        common_scripts\_createfx::_id_7E42( "(<-) Previous >" );
    }
}

_id_4C36()
{
    var_0 = level._id_240C;

    if ( level._id_4837 >= var_0.size - level._id_4838 )
        level._id_4837 = 0;
    else
        level._id_4837 += level._id_4838;
}

_id_275B()
{
    level._id_4837 -= level._id_4838;

    if ( level._id_4837 < 0 )
    {
        var_0 = level._id_240C;
        level._id_4837 = var_0.size - level._id_4838;
    }
}

_id_4839()
{
    while ( level._id_240B == 1 )
    {
        if ( _id_60B8() )
        {
            _id_4C36();
            _id_2DB6();
            wait 0.1;
        }
        else if ( _id_6F58() )
        {
            _id_275B();
            _id_2DB6();
            wait 0.1;
        }

        waittillframeend;
    }
}

_id_813D()
{
    level._id_240C = [ "Insert             Insert entity", "F2                 Toggle createfx dot and text drawing", "F5                 SAVES your work", "Z                  Undo", "Shift-Z            Redo", "F                  Frames currently selected entities in camera view", "END                Drop selected entities to the ground", "A                  Add option to the selected entities", "P                  Reset the rotation of the selected entities", "V                  Copy the angles from the most recently selected fx onto all selected fx.", "O                  Orient all selected fx to point at most recently selected fx.", "S                  Toggle Snap2Normal mode.", "L                  Toggle 90deg Snap mode.", "G                  Select all effects in level of same exploder or flag as selected.", "U                  Select by name list.", "C                  Convert One-Shot to Exploder.", "Delete             Kill the selected entities", "ESCAPE             Cancel out of option-modify-mode, must have console open", "SPACE or ->        Turn on exploders", "<-                 Turn off exploders", "Dpad               Move selected entities on X/Y or rotate pitch/yaw", "A button           Toggle the selection of the current entity", "X button           Toggle entity rotation mode", "Y button           Move selected entites up or rotate roll", "B button           Move selected entites down or rotate roll", "R Shoulder         Move selected entities to the cursor", "L Shoulder         Hold to select multiple entites", "L JoyClick         Copy", "R JoyClick         Paste", "Ctrl-C             Copy", "Ctrl-V             Paste", "N                  UFO", "T                  Toggle Timescale FAST", "Y                  Toggle Timescale SLOW", "[                  Toggle FX Visibility", "]                  Toggle ShowTris", "F11                Toggle FX Profile" ];
}

_id_7C5A()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = common_scripts\_createfx::_id_3AE8();

    for ( var_3 = level._id_301A; var_3 < var_2.size; var_3++ )
    {
        var_0 += 1;
        var_4 = var_0;

        if ( var_4 == 10 )
            var_4 = 0;

        if ( common_scripts\_createfx::_id_194C( var_4 + "" ) )
        {
            var_1 = var_2[var_3];
            break;
        }

        if ( var_0 > level._id_301B )
            break;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_5 = [];

    foreach ( var_3, var_7 in level._id_2417 )
    {
        if ( issubstr( var_7.v["fxid"], var_1 ) )
            var_5[var_5.size] = var_3;
    }

    common_scripts\_createfx::_id_28B2();
    common_scripts\_createfx::_id_7C5E( var_5 );
    level._createfx._id_7C5A = 1;
}

_id_3DB3()
{
    return level._createfx._id_7C66[level._createfx._id_7C66.size - 1];
}
