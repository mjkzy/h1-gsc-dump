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

_id_88AE()
{
    return getdvar( "scr_createfx_type", "0" ) == "2";
}

_id_3BB5()
{
    return getdvar( "scr_createfx_type", "0" ) == "1";
}

_id_9509( var_0 )
{
    if ( isdefined( level._id_94BA ) )
    {
        if ( !isdefined( level._id_94BB ) )
            level._id_94BB = [];

        level._id_94BB[level._id_94BB.size] = level._id_94BA.v;
    }

    level._id_94BA = var_0;
}

_id_23FB( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( _id_88AE() )
        _id_9509( var_2 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_2;
    }

    var_2.v = [];
    var_2.v["type"] = var_0;
    var_2.v["fxid"] = var_1;
    var_2.v["angles"] = ( 0.0, 0.0, 0.0 );
    var_2.v["origin"] = ( 0.0, 0.0, 0.0 );
    var_2._id_2DDB = 1;

    if ( isdefined( var_1 ) && isdefined( level._id_2415 ) )
    {
        var_3 = level._id_2415[var_1];

        if ( !isdefined( var_3 ) )
            var_3 = [];

        var_3[var_3.size] = var_2;
        level._id_2415[var_1] = var_3;
    }

    return var_2;
}

_id_400F()
{
    return 0.5;
}

_id_4061()
{
    return -15;
}

_id_3F8D()
{
    return 0;
}

_id_3FDA()
{
    return 0.75;
}

_id_3FD9()
{
    return 2;
}

_id_2429()
{
    var_0 = spawnstruct();

    if ( _id_3BB5() )
        _id_9509( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0.v = [];
    var_0.v["type"] = "soundfx";
    var_0.v["fxid"] = "No FX";
    var_0.v["soundalias"] = "nil";
    var_0.v["angles"] = ( 0.0, 0.0, 0.0 );
    var_0.v["origin"] = ( 0.0, 0.0, 0.0 );
    var_0.v["server_culled"] = 1;

    if ( getdvar( "serverCulledSounds" ) != "1" )
        var_0.v["server_culled"] = 0;

    var_0._id_2DDB = 1;
    return var_0;
}

_id_2422()
{
    var_0 = _id_2429();
    var_0.v["type"] = "soundfx_interval";
    var_0.v["delay_min"] = _id_3FDA();
    var_0.v["delay_max"] = _id_3FD9();
    return var_0;
}

_id_23F9()
{
    var_0 = spawnstruct();

    if ( _id_3BB5() )
        _id_9509( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0.v = [];
    var_0.v["origin"] = ( 0.0, 0.0, 0.0 );
    var_0.v["dynamic_distance"] = 1000;
    var_0.v["fxid"] = "No FX";
    var_0.v["type"] = "soundfx_dynamic";
    var_0.v["ambiencename"] = "nil";
    return var_0;
}

_id_242D()
{
    var_0 = spawnstruct();

    if ( _id_3BB5() )
        _id_9509( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0.v = [];
    var_0.v["type"] = "exploder";
    var_0.v["fxid"] = "No FX";
    var_0.v["soundalias"] = "nil";
    var_0.v["loopsound"] = "nil";
    var_0.v["angles"] = ( 0.0, 0.0, 0.0 );
    var_0.v["origin"] = ( 0.0, 0.0, 0.0 );
    var_0.v["exploder"] = 1;
    var_0.v["flag"] = "nil";
    var_0.v["exploder_type"] = "normal";
    var_0._id_2DDB = 1;
    return var_0;
}

_id_23FF( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_23FE( var_0 );
    var_2.v["exploder"] = var_1;
    return var_2;
}

_id_2438()
{
    var_0 = spawnstruct();

    if ( _id_88AE() )
        _id_9509( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0.v = [];
    var_0.v["origin"] = ( 0.0, 0.0, 0.0 );
    var_0.v["reactive_radius"] = 200;
    var_0.v["fxid"] = "No FX";
    var_0.v["type"] = "reactive_fx";
    var_0.v["soundalias"] = "nil";
    return var_0;
}

_id_7E8F( var_0, var_1 )
{
    if ( isdefined( level._id_2411 ) )
        var_0 += level._id_2411;

    self.v["origin"] = var_0;
    self.v["angles"] = var_1;
}

_id_7E40()
{
    self.v["up"] = anglestoup( self.v["angles"] );
    self.v["forward"] = anglestoforward( self.v["angles"] );
}

_id_21A8()
{
    if ( level._createfx._id_7C66.size < 1 )
        return;

    setdvarifuninitialized( "curr_exp_num", 1 );
    var_0 = getdvarint( "curr_exp_num" );
    var_1 = 0;

    foreach ( var_3 in level._createfx._id_7C66 )
    {
        if ( var_3.v["type"] == "oneshotfx" )
        {
            var_1 = 1;
            setfxkillondelete( var_3._id_587B, 1 );
            waittillframeend;
            var_3 common_scripts\utility::_id_671F();
            var_3.v["type"] = "exploder";
            var_3.v["exploder"] = var_0;
            var_3.v["exploder_type"] = "normal";
            var_3 common_scripts\utility::_id_06FD();
            continue;
        }

        iprintln( "^3Cannot convert createfx ent to exploder type=" + var_3.v["type"] + " at " + var_3.v["origin"] );
    }

    if ( var_1 )
        level._createfx._id_52CC = 1;
}

_id_2407()
{
    precacheshader( "black" );
    level._createfx = spawnstruct();
    level._createfx.grenade = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level._createfx.grenade.fx = loadfx( "vfx/explosion/frag_grenade_default" );
    level._createfx.grenade._id_8899 = "null";
    level._createfx.grenade.radius = 256;
    wait 0.05;
    common_scripts\utility::_id_383D( "createfx_saving" );
    common_scripts\utility::_id_383D( "createfx_started" );

    if ( !isdefined( level._id_2402 ) )
        level._id_2402 = [];

    level._id_240F = 0;
    setdvar( "ui_hidehud", "1" );
    level notify( "createfx_common_done" );
}

_id_4D07()
{
    level._createfx._id_7C6B = 0;
    level._createfx._id_7C69 = 0;
    level._createfx._id_7C6A = 0;
    level._createfx._id_7C6C = 0;
    level._createfx._id_7C6D = 0;
    level._createfx._id_7C6E = 0;
    level._createfx._id_7C65 = [];
    level._createfx._id_7C66 = [];
    level._createfx._id_52CC = 0;
    level._createfx.rate = 1;
    level._createfx._id_86BD = 0;
    level._createfx._id_86BE = 0;
    level._createfx._id_57F0 = 0;
    level._createfx._id_121A = 0;
    level._createfx._id_7C5A = 0;
    level._createfx.player_speed = getdvarfloat( "g_speed" );
    _id_7E9C();
}

_id_4D12()
{
    level._createfx._id_580E = [];
    level._createfx._id_580E["escape"] = 1;
    level._createfx._id_580E["BUTTON_LSHLDR"] = 1;
    level._createfx._id_580E["BUTTON_RSHLDR"] = 1;
    level._createfx._id_580E["mouse1"] = 1;
    level._createfx._id_580E["ctrl"] = 1;
}

_id_4CCB()
{
    var_0 = [];
    var_0["loopfx"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["loopfx"]["highlighted"] = ( 0.4, 0.95, 1.0 );
    var_0["loopfx"]["default"] = ( 0.3, 0.8, 1.0 );
    var_0["oneshotfx"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["oneshotfx"]["highlighted"] = ( 0.3, 0.6, 1.0 );
    var_0["oneshotfx"]["default"] = ( 0.1, 0.2, 1.0 );
    var_0["exploder"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["exploder"]["highlighted"] = ( 1.0, 0.2, 0.2 );
    var_0["exploder"]["default"] = ( 1.0, 0.1, 0.1 );
    var_0["rainfx"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["rainfx"]["highlighted"] = ( 0.95, 0.4, 0.95 );
    var_0["rainfx"]["default"] = ( 0.78, 0.0, 0.73 );
    var_0["soundfx"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["soundfx"]["highlighted"] = ( 0.2, 1.0, 0.2 );
    var_0["soundfx"]["default"] = ( 0.1, 1.0, 0.1 );
    var_0["soundfx_interval"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["soundfx_interval"]["highlighted"] = ( 0.3, 1.0, 0.3 );
    var_0["soundfx_interval"]["default"] = ( 0.1, 1.0, 0.1 );
    var_0["reactive_fx"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["reactive_fx"]["highlighted"] = ( 0.5, 1.0, 0.75 );
    var_0["reactive_fx"]["default"] = ( 0.2, 0.9, 0.2 );
    var_0["soundfx_dynamic"]["selected"] = ( 1.0, 1.0, 0.2 );
    var_0["soundfx_dynamic"]["highlighted"] = ( 0.3, 1.0, 0.3 );
    var_0["soundfx_dynamic"]["default"] = ( 0.1, 1.0, 0.1 );
    level._createfx._id_2058 = var_0;
}

_id_241B()
{
    waitframe;
    wait 0.05;

    if ( getdvarint( "createfx_god_mode" ) == 1 )
    {

    }

    if ( getdvarint( "createfx_demigod_mode" ) == 1 )
    {

    }

    if ( !isdefined( level._effect ) )
        level._effect = [];

    if ( getdvar( "createfx_map" ) == "" )
    {

    }
    else if ( getdvar( "createfx_map" ) == common_scripts\utility::_id_3E94() )
        [[ level._id_3AEE ]]();

    _id_4CCE();
    common_scripts\_createfxmenu::_id_4D16();
    _id_4CFE();
    _id_4D6B();
    _id_4CCE();
    _id_4D07();
    _id_4D12();
    _id_4CCB();

    if ( getdvar( "createfx_use_f4" ) == "" )
    {

    }

    if ( getdvar( "createfx_no_autosave" ) == "" )
    {

    }

    level._id_2408 = 1;
    level._id_5519 = undefined;
    level._id_195A = [];
    var_0 = ( 0.0, 0.0, 0.0 );
    common_scripts\utility::_id_383F( "createfx_started" );

    if ( !level.mp_createfx )
        var_0 = level.player.origin;

    var_1 = undefined;
    level._id_3B83 = 0;
    common_scripts\_createfxmenu::_id_7FAA( "none" );
    level._id_2414 = 0;
    var_2 = newhudelem();
    var_2.x = -120;
    var_2.y = 200;
    var_2.foreground = 0;
    var_2 setshader( "black", 250, 160 );
    var_2.alpha = 0;
    level._id_240D = 0;

    foreach ( var_4 in level._id_2417 )
        var_4 _id_6E6D();

    thread _id_2DAF();
    var_6 = undefined;
    thread _id_2404();
    level._id_240E = 0;
    thread _id_780E();
    thread _id_816A();

    for (;;)
    {
        var_7 = 0;
        var_8 = anglestoright( level.player getplayerangles() );
        var_9 = anglestoforward( level.player getplayerangles() );
        var_10 = anglestoup( level.player getplayerangles() );
        var_11 = 0.85;
        var_12 = var_9 * 750;
        level._id_2416 = bullettrace( level.player geteye(), level.player geteye() + var_12, 0, undefined );
        var_13 = undefined;
        level._id_1958 = [];
        level._id_194E = [];
        _id_6FE0();
        var_14 = _id_194D( "ctrl", "BUTTON_LSHLDR" );
        var_15 = _id_194C( "mouse1", "BUTTON_A" );
        var_16 = _id_194D( "mouse1", "BUTTON_A" );
        var_17 = _id_194D( "shift" );
        common_scripts\_createfxmenu::_id_23B9();
        var_18 = "F5";

        if ( getdvarint( "createfx_use_f4" ) )
            var_18 = "F4";

        if ( _id_194C( var_18 ) )
        {

        }

        if ( getdvarint( "scr_createfx_dump" ) )
            _id_3C84();

        if ( _id_194C( "F2" ) )
            _id_93C9();

        if ( _id_194C( "ins" ) )
            _id_4E83();

        if ( _id_194C( "del" ) )
            _id_282F();

        if ( _id_194C( "escape" ) )
            _id_1ED6();

        if ( _id_194C( "rightarrow", "space" ) && !level._id_2410 )
            _id_7E89();

        if ( _id_194C( "leftarrow" ) && !level._id_2410 )
            _id_990D();

        if ( _id_194C( "f" ) )
            _id_3A0D();

        if ( _id_194C( "u" ) )
            _id_7C5B();

        if ( _id_194C( "c" ) )
            _id_21A8();

        _id_5D4D();

        if ( !var_14 && _id_194C( "g" ) )
        {
            _id_7C59( "exploder" );
            _id_7C59( "flag" );
        }

        if ( _id_194C( "h", "F1" ) )
            _id_84D7();

        if ( _id_194C( "BUTTON_LSTICK" ) )
            _id_21D6();

        if ( _id_194C( "BUTTON_RSTICK" ) )
            _id_66BC();

        if ( _id_194C( "z" ) )
            _id_9A23();

        if ( _id_194C( "z" ) && var_17 )
            _id_72A2();

        if ( var_14 )
        {
            if ( _id_194C( "c" ) )
                _id_21D6();

            if ( _id_194C( "v" ) )
                _id_66BC();

            if ( _id_194C( "g" ) )
                _id_8904();
        }

        if ( isdefined( level._createfx._id_7C67 ) )
            common_scripts\_createfxmenu::_id_5BAE();

        for ( var_19 = 0; var_19 < level._id_2417.size; var_19++ )
        {
            var_4 = level._id_2417[var_19];
            var_20 = level.player getvieworigin();
            var_21 = vectornormalize( var_4.v["origin"] - var_20 );
            var_22 = vectordot( var_9, var_21 );

            if ( var_22 < var_11 )
                continue;

            var_11 = var_22;
            var_13 = var_4;
        }

        level._id_3B57 = var_13;

        if ( isdefined( var_13 ) )
        {
            if ( isdefined( var_1 ) )
            {
                if ( var_1 != var_13 )
                {
                    if ( !_id_32E8( var_1 ) )
                        var_1 thread _id_3311();

                    if ( !_id_32E8( var_13 ) )
                        var_13 thread _id_3312();
                }
            }
            else if ( !_id_32E8( var_13 ) )
                var_13 thread _id_3312();
        }

        _id_596D( var_13, var_15, var_16, var_14, var_8 );
        var_7 = _id_4609( var_7 );
        wait 0.05;

        if ( var_7 )
            _id_9ADC();

        if ( !level.mp_createfx )
            var_0 = [[ level._id_3AEF ]]( var_0 );

        var_1 = var_13;

        if ( _id_5555( var_6 ) )
        {
            level._id_301A = 0;
            _id_1ED6();
            common_scripts\_createfxmenu::_id_7FAA( "none" );
        }

        if ( level._createfx._id_7C66.size )
        {
            var_6 = level._createfx._id_7C66[level._createfx._id_7C66.size - 1];
            continue;
        }

        var_6 = undefined;
    }
}

_id_5D4D()
{
    var_0 = 0;
    var_1 = _id_194D( "ctrl" );

    if ( _id_194D( "." ) )
    {
        if ( var_1 )
        {
            if ( level._createfx.player_speed < 190 )
                level._createfx.player_speed = 190;
            else
                level._createfx.player_speed += 10;
        }
        else
            level._createfx.player_speed += 5;

        var_0 = 1;
    }
    else if ( _id_194D( "," ) )
    {
        if ( var_1 )
        {
            if ( level._createfx.player_speed > 190 )
                level._createfx.player_speed = 190;
            else
                level._createfx.player_speed -= 10;
        }
        else
            level._createfx.player_speed -= 5;

        var_0 = 1;
    }

    if ( var_0 )
    {
        level._createfx.player_speed = clamp( level._createfx.player_speed, 5, 500 );
        [[ level._id_3AED ]]();
        _id_7E9C();
    }
}

_id_7E9C()
{
    if ( !isdefined( level._createfx._id_6C1E ) )
    {
        var_0 = newhudelem();
        var_0.alignx = "right";
        var_0.foreground = 1;
        var_0.fontscale = 1.2;
        var_0.alpha = 1.0;
        var_0.x = 120;
        var_0.y = 420;
        var_1 = newhudelem();
        var_1.alignx = "left";
        var_1.foreground = 1;
        var_1.fontscale = 1.2;
        var_1.alpha = 1.0;
        var_1.x = 120;
        var_1.y = 420;
        var_0._id_4ADA = var_1;
        level._createfx._id_6C1E = var_0;
    }

    level._createfx._id_6C1E._id_4ADA setvalue( level._createfx.player_speed );
}

_id_93C9()
{
    level._id_2408 = !level._id_2408;
}

_id_4E83()
{
    common_scripts\_createfxmenu::_id_7FAA( "creation" );
    level._id_301A = 0;
    _id_1EB9();
    _id_7E42( "Pick effect type to create:" );
    _id_7E42( "1. One Shot FX" );
    _id_7E42( "2. Looping FX" );
    _id_7E42( "3. Looping sound" );
    _id_7E42( "4. Exploder" );
    _id_7E42( "5. One Shot Sound" );
    _id_7E42( "6. Reactive Sound" );
    _id_7E42( "7. Dynamic Ambience" );
    _id_7E42( "(c) Cancel >" );
    _id_7E42( "(x) Exit >" );
}

is_ent_filtered_out( var_0, var_1 )
{
    if ( var_1 != "" )
    {
        if ( isdefined( var_0.v["type"] ) && issubstr( var_0.v["type"], var_1 ) )
            return 0;
        else if ( isdefined( var_0.v["fxid"] ) && issubstr( var_0.v["fxid"], var_1 ) )
            return 0;
        else if ( isdefined( var_0.v["soundalias"] ) && issubstr( var_0.v["soundalias"], var_1 ) )
            return 0;
        else if ( isdefined( var_0.v["exploder"] ) && issubstr( var_0.v["exploder"], var_1 ) )
            return 0;

        return 1;
    }

    return 0;
}

_id_596D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !level._id_2408 )
        return;

    if ( level._createfx._id_7C5A )
    {
        level._createfx._id_7C5A = 0;
        var_0 = undefined;
    }
    else if ( _id_7C5C() )
        var_0 = undefined;

    for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
    {
        var_6 = level._id_2417[var_5];

        if ( !var_6._id_2DDB )
            continue;

        if ( is_ent_filtered_out( var_6, getdvar( "createfx_filter" ) ) )
            continue;

        var_7 = getdvarfloat( "createfx_scaleid" );

        if ( isdefined( var_0 ) && var_6 == var_0 )
        {
            if ( !common_scripts\_createfxmenu::_id_330E() )
                common_scripts\_createfxmenu::_id_2B49( var_6 );

            if ( var_1 )
            {
                var_8 = _id_4C42( var_5 );
                level._id_240B = 0;
                level._id_2414 = !var_8;

                if ( !var_3 )
                {
                    var_9 = level._createfx._id_7C66.size;
                    _id_1EB5();

                    if ( var_8 && var_9 == 1 )
                        _id_7C5D( var_5, var_6 );
                }

                _id_93CA( var_5, var_6 );
            }
            else if ( var_2 )
            {
                if ( var_3 )
                {
                    if ( level._id_2414 )
                        _id_7C5D( var_5, var_6 );

                    if ( !level._id_2414 )
                        _id_28B3( var_5, var_6 );
                }
            }

            var_10 = "highlighted";
        }
        else
            var_10 = "default";

        if ( _id_4C42( var_5 ) )
            var_10 = "selected";

        var_6 _id_2413( var_10, var_7, var_4 );
    }
}

draw_origin( var_0, var_1 )
{
    var_2 = level.player getvieworigin();
    var_3 = level.player getplayerangles();
    var_4 = level._createfx._id_2058[self.v["type"]][var_1];
    var_5 = 0;
    var_6 = 1;
    var_7 = ( 0.0, 0.0, 0.0 );
    var_8 = int( max( 16, getdvarfloat( "createfx_crosshairdrawdist" ) ) );
    var_9 = int( max( 16, getdvarfloat( "createfx_accuratedrawdist" ) ) );
    var_10 = var_9 * var_9;
    var_11 = distancesquared( var_2, self.v["origin"] ) < var_10 * var_0;

    if ( var_11 )
    {
        var_12 = distance( var_2, self.v["origin"] );
        var_13 = var_12 / ( var_8 - 16 );
        var_5 = 1 - clamp( var_13, 0.0, 1.0 );
        var_6 = clamp( var_13, 0.333, 1.0 );
        var_14 = anglestoright( var_3 ) * -2.5 * var_0;
        var_15 = anglestoup( var_3 ) * -3.5 * var_0;
        var_7 = var_14 + var_15;
    }

    if ( var_5 > 0 )
    {
        var_16 = common_scripts\utility::_id_A347( var_2, var_3, self.v["origin"], 0.422618 );

        if ( var_16 )
        {
            var_17 = 2.0;
            var_18 = 4.0;
            var_19 = anglestoforward( self.v["angles"] );
            var_19 *= ( var_18 * var_0 );
            var_20 = anglestoright( self.v["angles"] ) * -1;
            var_20 *= ( var_18 * var_0 );
            var_21 = anglestoup( self.v["angles"] );
            var_21 *= ( var_18 * var_0 );
        }
    }
}

_id_2413( var_0, var_1, var_2 )
{
    if ( getdvarint( "fx_showLightGridSampleOffset" ) != 0 )
    {
        var_3 = getdvarfloat( "fx_lightGridSampleOffset" );
        var_4 = anglestoforward( self.v["angles"] ) * var_3;
    }

    draw_origin( var_1, var_0 );

    if ( self._id_92BB > 0 )
    {
        var_5 = _id_3E3C();
        var_6 = var_2 * ( var_5.size * -2.93 ) * var_1;
        var_7 = level._createfx._id_2058[self.v["type"]][var_0];

        if ( isdefined( self._id_506C ) )
            var_7 = ( 1.0, 0.5, 0.0 );

        if ( isdefined( self.v["reactive_radius"] ) )
            return;

        if ( isdefined( self.v["dynamic_distance"] ) )
            return;

        return;
    }
}

_id_3E3C()
{
    switch ( self.v["type"] )
    {
        case "reactive_fx":
            return "reactive: " + self.v["soundalias"];
        case "soundfx_interval":
            return self.v["soundalias"];
        case "soundfx_dynamic":
            return "dynamic: " + self.v["ambiencename"];
        case "soundfx":
            return self.v["soundalias"];
        case "exploder":
            if ( isdefined( self.v["soundalias"] ) && self.v["soundalias"] != "nil" )
            {
                if ( self.v["fxid"] == "No FX" )
                    return "@)) " + self.v["soundalias"];
                else
                    return self.v["fxid"] + " @))";
            }
            else
                return self.v["fxid"];
        case "oneshotfx":
            if ( isdefined( self.v["soundalias"] ) && self.v["soundalias"] != "nil" )
                return self.v["fxid"] + " @))";
            else
                return self.v["fxid"];
        default:
            return self.v["fxid"];
    }
}

_id_7C5B()
{
    level._id_301A = 0;
    _id_1EB9();
    common_scripts\_createfxmenu::_id_7FAA( "select_by_name" );
    common_scripts\_createfxmenu::_id_2DB3();
}

_id_4609( var_0 )
{
    if ( level._createfx._id_7C66.size > 0 && level._id_240B == 0 )
    {
        var_0 = _id_7C64( var_0 );

        if ( !_id_24F0( "selected_ents" ) )
        {
            _id_60A9( "selected_ents" );
            _id_7EDB( "Mode:", "move" );
            _id_7EDB( "Move Rate( -/+ ):", level._createfx.rate );

            if ( level._createfx._id_86BD )
            {
                var_1 = "on";
                var_2 = ( 0.0, 1.0, 0.0 );
            }
            else
            {
                var_1 = "off";
                var_2 = ( 0.5, 0.5, 0.5 );
            }

            _id_7EDB( "Snap2Normal( S ):", var_1, var_2 );

            if ( level._createfx._id_86BE )
            {
                var_3 = "on";
                var_4 = ( 0.0, 1.0, 0.0 );
            }
            else
            {
                var_3 = "off";
                var_4 = ( 0.5, 0.5, 0.5 );
            }

            _id_7EDB( "90deg Snap( L ):", var_3, var_4 );

            if ( level._createfx._id_57F0 )
            {
                var_5 = "on";
                var_6 = ( 0.0, 1.0, 0.0 );
            }
            else
            {
                var_5 = "off";
                var_6 = ( 0.5, 0.5, 0.5 );
            }

            _id_7EDB( "Local Rotation( R ):", var_5, var_6 );
        }

        if ( level._createfx._id_121A && level._createfx._id_7C66.size > 0 )
        {
            _id_7EDB( "Mode:", "rotate" );
            thread [[ level._id_3AF0 ]]();

            if ( _id_194C( "p" ) )
                _id_7423();

            if ( _id_194C( "o" ) )
                _id_0968();

            if ( _id_194C( "v" ) )
                _id_21D0();

            for ( var_7 = 0; var_7 < level._createfx._id_7C66.size; var_7++ )
                level._createfx._id_7C66[var_7] _id_2DA1();

            if ( level._id_7C6C != 0 || level._id_7C6E != 0 || level._id_7C6D != 0 )
                var_0 = 1;
        }
        else
        {
            _id_7EDB( "Mode:", "move" );
            var_8 = _id_3E5C();

            for ( var_7 = 0; var_7 < level._createfx._id_7C66.size; var_7++ )
            {
                var_9 = level._createfx._id_7C66[var_7];

                if ( isdefined( var_9.model ) )
                    continue;

                var_9.v["origin"] += var_8;
            }

            if ( distance( ( 0.0, 0.0, 0.0 ), var_8 ) > 0 )
            {
                thread _id_780E();
                level._id_240E = 0;
                var_0 = 1;
            }
        }
    }
    else
        _id_1EDB();

    return var_0;
}

_id_7C64( var_0 )
{
    if ( _id_194C( "BUTTON_X" ) )
        _id_93C4();

    _id_5D4E();

    if ( _id_194C( "s" ) )
        _id_93DC();

    if ( _id_194C( "l" ) )
        _id_93DD();

    if ( _id_194C( "r" ) )
        _id_93D4();

    if ( _id_194C( "end" ) )
    {
        _id_2F66();
        var_0 = 1;
    }

    if ( _id_194C( "tab", "BUTTON_RSHLDR" ) )
    {
        _id_5F26();
        var_0 = 1;
    }

    return var_0;
}

_id_5D4E()
{
    var_0 = _id_194D( "shift" );
    var_1 = _id_194D( "ctrl" );

    if ( _id_194C( "=" ) )
    {
        if ( var_0 )
            level._createfx.rate += 0.025;
        else if ( var_1 )
        {
            if ( level._createfx.rate < 1 )
                level._createfx.rate = 1;
            else
                level._createfx.rate += 10;
        }
        else
            level._createfx.rate += 0.1;
    }
    else if ( _id_194C( "-" ) )
    {
        if ( var_0 )
            level._createfx.rate -= 0.025;
        else if ( var_1 )
        {
            if ( level._createfx.rate > 1 )
                level._createfx.rate = 1;
            else
                level._createfx.rate = 0.1;
        }
        else
            level._createfx.rate -= 0.1;
    }

    level._createfx.rate = clamp( level._createfx.rate, 0.025, 100 );
    _id_7EDB( "Move Rate( -/+ ):", level._createfx.rate );
}

_id_93C4()
{
    level._createfx._id_121A = !level._createfx._id_121A;
}

_id_93DC()
{
    level._createfx._id_86BD = !level._createfx._id_86BD;

    if ( level._createfx._id_86BD )
    {
        var_0 = "on";
        var_1 = ( 0.0, 1.0, 0.0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7EDB( "Snap2Normal( S ):", var_0, var_1 );
}

_id_93DD()
{
    level._createfx._id_86BE = !level._createfx._id_86BE;

    if ( level._createfx._id_86BE )
    {
        var_0 = "on";
        var_1 = ( 0.0, 1.0, 0.0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7EDB( "90deg Snap( L ):", var_0, var_1 );
}

_id_93D4()
{
    level._createfx._id_57F0 = !level._createfx._id_57F0;

    if ( level._createfx._id_57F0 )
    {
        var_0 = "on";
        var_1 = ( 0.0, 1.0, 0.0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7EDB( "Local Rotation( R ):", var_0, var_1 );
}

_id_21D0()
{
    thread _id_780E();
    level notify( "new_ent_selection" );

    for ( var_0 = 0; var_0 < level._createfx._id_7C66.size; var_0++ )
    {
        var_1 = level._createfx._id_7C66[var_0];
        var_1.v["angles"] = level._createfx._id_7C66[level._createfx._id_7C66.size - 1].v["angles"];
        var_1 _id_7E40();
    }

    _id_9ADC();
    level._id_240E = 0;
}

_id_0968()
{
    thread _id_780E();
    level notify( "new_ent_selection" );
    var_0 = level._createfx._id_7C66[level._createfx._id_7C66.size - 1];

    for ( var_1 = 0; var_1 < level._createfx._id_7C66.size - 1; var_1++ )
    {
        var_2 = level._createfx._id_7C66[var_1];
        var_3 = vectortoangles( var_0.v["origin"] - var_2.v["origin"] );
        var_2.v["angles"] = var_3;
        var_2 _id_7E40();
    }

    _id_9ADC();
    level._id_240E = 0;
}

_id_7423()
{
    level notify( "new_ent_selection" );
    thread _id_780E();

    for ( var_0 = 0; var_0 < level._createfx._id_7C66.size; var_0++ )
    {
        var_1 = level._createfx._id_7C66[var_0];
        var_1.v["angles"] = ( 0.0, 0.0, 0.0 );
        var_1 _id_7E40();
    }

    _id_9ADC();
    level._id_240E = 0;
}

_id_5555( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( !common_scripts\_createfxmenu::_id_330E() )
            return 1;
    }
    else
        return common_scripts\_createfxmenu::_id_330E();

    return var_0 != level._createfx._id_7C66[level._createfx._id_7C66.size - 1];
}

_id_2F66()
{
    thread _id_780E();

    for ( var_0 = 0; var_0 < level._createfx._id_7C66.size; var_0++ )
    {
        var_1 = level._createfx._id_7C66[var_0];
        var_2 = bullettrace( var_1.v["origin"], var_1.v["origin"] + ( 0.0, 0.0, -2048.0 ), 0, undefined );
        var_1.v["origin"] = var_2["position"];
    }

    level._id_240E = 0;
}

_id_7E89()
{
    level notify( "createfx_exploder_reset" );
    var_0 = [];

    for ( var_1 = 0; var_1 < level._createfx._id_7C66.size; var_1++ )
    {
        var_2 = level._createfx._id_7C66[var_1];

        if ( isdefined( var_2.v["exploder"] ) )
            var_0[var_2.v["exploder"]] = 1;
    }

    var_3 = getarraykeys( var_0 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        common_scripts\_exploder::_id_3528( var_3[var_1] );
}

_id_990D()
{
    level notify( "createfx_exploder_reset" );
    var_0 = [];

    for ( var_1 = 0; var_1 < level._createfx._id_7C66.size; var_1++ )
    {
        var_2 = level._createfx._id_7C66[var_1];

        if ( isdefined( var_2.v["exploder"] ) )
            var_0[var_2.v["exploder"]] = 1;
    }

    var_3 = getarraykeys( var_0 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        common_scripts\_exploder::_id_5309( var_3[var_1] );
}

_id_2DAF()
{
    var_0 = 0;

    if ( getdvarint( "createfx_drawdist" ) == 0 )
    {

    }

    for (;;)
    {
        var_1 = getdvarint( "createfx_drawdist" );
        var_1 *= var_1;

        for ( var_2 = 0; var_2 < level._id_2417.size; var_2++ )
        {
            var_3 = level._id_2417[var_2];
            var_3._id_2DDB = distancesquared( level.player.origin, var_3.v["origin"] ) <= var_1;
            var_0++;

            if ( var_0 > 100 )
            {
                var_0 = 0;
                wait 0.05;
            }
        }

        if ( level._id_2417.size == 0 )
            wait 0.05;
    }
}

_id_2404()
{
    setdvarifuninitialized( "createfx_autosave_time", "300" );

    for (;;)
    {
        wait(getdvarint( "createfx_autosave_time" ));
        common_scripts\utility::_id_3857( "createfx_saving" );

        if ( getdvarint( "createfx_no_autosave" ) )
            continue;

        _id_3C84( 1 );
    }
}

_id_75F2( var_0, var_1 )
{
    level endon( "new_ent_selection" );
    var_2 = 0.1;

    for ( var_3 = 0; var_3 < var_2 * 20; var_3++ )
    {
        if ( level._id_7C6C != 0 )
            var_0 addpitch( level._id_7C6C );
        else if ( level._id_7C6D != 0 )
            var_0 addyaw( level._id_7C6D );
        else
            var_0 addroll( level._id_7C6E );

        wait 0.05;
        var_0 _id_2DA1();

        for ( var_4 = 0; var_4 < level._createfx._id_7C66.size; var_4++ )
        {
            var_5 = level._createfx._id_7C66[var_4];

            if ( isdefined( var_5.model ) )
                continue;

            var_5.v["origin"] = var_1[var_4].origin;
            var_5.v["angles"] = var_1[var_4].angles;
        }
    }
}

_id_282F()
{
    if ( level._id_240D )
    {
        _id_737E();
        return;
    }

    _id_2833();
}

_id_737E()
{
    if ( !isdefined( level._createfx._id_7C67 ) )
        return;

    var_0 = level._createfx._id_654C[level._createfx._id_7C67]["name"];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        var_2 = level._id_2417[var_1];

        if ( !_id_32E8( var_2 ) )
            continue;

        var_2 _id_7375( var_0 );
    }

    _id_9ADC();
    _id_1ED6();
}

_id_7375( var_0 )
{
    self.v[var_0] = undefined;
}

_id_2833()
{
    _id_780E();
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        var_2 = level._id_2417[var_1];

        if ( _id_32E8( var_2 ) )
        {
            if ( isdefined( var_2._id_5891 ) )
            {
                var_2._id_5891 stoploopsound();
                var_2._id_5891 delete();
            }

            if ( isdefined( var_2._id_587B ) )
                var_2._id_587B delete();

            var_2 notify( "stop_loop" );
            continue;
        }

        var_0[var_0.size] = var_2;
    }

    level._id_2417 = var_0;
    level._createfx._id_7C65 = [];
    level._createfx._id_7C66 = [];
    _id_1EB9();
    _id_780C();
}

_id_5F26()
{
    thread _id_780E();
    var_0 = level._id_2416["position"];

    if ( level._createfx._id_7C66.size <= 0 )
        return;

    var_1 = _id_3CE7( level._createfx._id_7C66 );
    var_2 = var_1 - var_0;

    for ( var_3 = 0; var_3 < level._createfx._id_7C66.size; var_3++ )
    {
        var_4 = level._createfx._id_7C66[var_3];

        if ( isdefined( var_4.model ) )
            continue;

        var_4.v["origin"] -= var_2;

        if ( level._createfx._id_86BD )
        {
            if ( isdefined( level._id_2416["normal"] ) )
                var_4.v["angles"] = vectortoangles( level._id_2416["normal"] );
        }
    }

    level._id_240E = 0;
}

_id_7C5F()
{
    _id_7C5D( level._id_2417.size - 1, level._id_2417[level._id_2417.size - 1] );
}

_id_741D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        if ( _id_4C42( var_1 ) )
            var_0[var_0.size] = var_1;
    }

    _id_1EB5();
    _id_7C5E( var_0 );
}

_id_7C59( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._createfx._id_7C66 )
    {
        if ( !isdefined( var_3.v[var_0] ) )
            continue;

        var_4 = var_3.v[var_0];
        var_1[var_4] = 1;
    }

    foreach ( var_4, var_7 in var_1 )
    {
        foreach ( var_9, var_3 in level._id_2417 )
        {
            if ( _id_4C42( var_9 ) )
                continue;

            if ( !isdefined( var_3.v[var_0] ) )
                continue;

            if ( var_3.v[var_0] != var_4 )
                continue;

            _id_7C5D( var_9, var_3 );
        }
    }

    _id_9ADC();
}

_id_21D6()
{
    if ( level._createfx._id_7C66.size <= 0 )
        return;

    var_0 = [];

    for ( var_1 = 0; var_1 < level._createfx._id_7C66.size; var_1++ )
    {
        var_2 = level._createfx._id_7C66[var_1];
        var_3 = spawnstruct();
        var_3.v = var_2.v;
        var_3 _id_6E6D();
        var_0[var_0.size] = var_3;
    }

    level._id_8F14 = var_0;
}

_id_6E6D()
{
    self._id_92BB = 0;
    self._id_2DDB = 1;
}

_id_66BC()
{
    if ( !isdefined( level._id_8F14 ) )
        return;

    _id_1EB5();

    for ( var_0 = 0; var_0 < level._id_8F14.size; var_0++ )
        _id_0731( level._id_8F14[var_0] );

    _id_5F26();
    _id_9ADC();
    level._id_8F14 = [];
    _id_21D6();
}

_id_0731( var_0 )
{
    level._id_2417[level._id_2417.size] = var_0;
    _id_7C5F();
}

_id_3CE7( var_0 )
{
    var_1 = ( 0.0, 0.0, 0.0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1 = ( var_1[0] + var_0[var_2].v["origin"][0], var_1[1] + var_0[var_2].v["origin"][1], var_1[2] + var_0[var_2].v["origin"][2] );

    return ( var_1[0] / var_0.size, var_1[1] / var_0.size, var_1[2] / var_0.size );
}

_id_3E41( var_0 )
{
    var_1 = var_0[0].v["origin"];
    var_2 = var_0[0].v["origin"];
    var_3 = var_1[0];
    var_4 = var_1[1];
    var_5 = var_1[2];
    var_6 = var_2[0];
    var_7 = var_2[1];
    var_8 = var_2[2];

    for ( var_9 = 0; var_9 < var_0.size; var_9++ )
    {
        var_10 = var_0[var_9].v["origin"];

        if ( var_10[0] < var_1[0] )
            var_3 = var_10[0];

        if ( var_10[0] > var_2[0] )
            var_6 = var_10[0];

        if ( var_10[1] < var_1[1] )
            var_4 = var_10[1];

        if ( var_10[1] > var_2[1] )
            var_7 = var_10[1];

        if ( var_10[2] < var_1[2] )
            var_5 = var_10[2];

        if ( var_10[2] > var_2[2] )
            var_8 = var_10[2];
    }

    var_1 = ( var_3, var_4, var_5 );
    var_2 = ( var_6, var_7, var_8 );
    var_11 = distance( var_2, var_1 );
    return var_11;
}

_id_32D7()
{
    self endon( "death" );

    for (;;)
    {
        _id_2DA1();
        wait 0.05;
    }
}

_id_760D()
{
    if ( level._id_7C6D != 0 )
        return 1;

    if ( level._id_7C6C != 0 )
        return 1;

    return level._id_7C6E != 0;
}

_id_6F98( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._createfx._id_654C.size; var_3++ )
    {
        var_4 = level._createfx._id_654C[var_3];

        if ( isdefined( var_4["nowrite"] ) && var_4["nowrite"] )
            continue;

        var_5 = var_4["name"];

        if ( !isdefined( var_0.v[var_5] ) )
            continue;

        if ( !common_scripts\_createfxmenu::_id_59D2( var_4["mask"], var_0.v["type"] ) )
            continue;

        if ( !level.mp_createfx )
        {
            if ( common_scripts\_createfxmenu::_id_59D2( "fx", var_0.v["type"] ) && var_5 == "fxid" )
                continue;

            if ( var_0.v["type"] == "exploder" && var_5 == "exploder" )
                continue;

            var_6 = var_0.v["type"] + "/" + var_5;

            if ( isdefined( level._createfx._id_279C[var_6] ) && level._createfx._id_279C[var_6] == var_0.v[var_5] )
                continue;
        }

        if ( var_4["type"] == "string" )
        {
            var_7 = var_0.v[var_5] + "";

            if ( var_7 == "nil" )
                continue;

            if ( var_5 == "platform" && var_7 == "all" )
                continue;

            _id_1C19( var_1 + "ent.v[ \"" + var_5 + "\" ] = \"" + var_0.v[var_5] + "\";" );
            continue;
        }

        _id_1C19( var_1 + "ent.v[ \"" + var_5 + "\" ] = " + var_0.v[var_5] + ";" );
    }
}

_id_3311()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_92BB *= 0.85;
        self._id_92BB -= 0.05;

        if ( self._id_92BB < 0 )
            break;

        wait 0.05;
    }

    self._id_92BB = 0;
}

_id_3312()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_92BB += 0.05;
        self._id_92BB *= 1.25;

        if ( self._id_92BB > 1 )
            break;

        wait 0.05;
    }

    self._id_92BB = 1;
}

_id_1ED6()
{
    level._id_240D = 0;
    level._createfx._id_7C67 = undefined;
    _id_742D();
}

_id_742D()
{
    for ( var_0 = 0; var_0 < level._createfx._id_4AE1; var_0++ )
        level._createfx._id_4AE9[var_0][0].color = ( 1.0, 1.0, 1.0 );
}

_id_93CA( var_0, var_1 )
{
    if ( isdefined( level._createfx._id_7C65[var_0] ) )
        _id_28B3( var_0, var_1 );
    else
        _id_7C5D( var_0, var_1 );
}

_id_7C5D( var_0, var_1 )
{
    if ( isdefined( level._createfx._id_7C65[var_0] ) )
        return;

    _id_1ED6();
    level notify( "new_ent_selection" );
    var_1 thread _id_3312();
    level._createfx._id_7C65[var_0] = 1;
    level._createfx._id_7C66[level._createfx._id_7C66.size] = var_1;
    level._id_2410 = 0;
}

_id_32E7( var_0 )
{
    if ( !isdefined( level._id_3B57 ) )
        return 0;

    return var_0 == level._id_3B57;
}

_id_28B3( var_0, var_1 )
{
    if ( !isdefined( level._createfx._id_7C65[var_0] ) )
        return;

    _id_1ED6();
    level notify( "new_ent_selection" );
    level._createfx._id_7C65[var_0] = undefined;

    if ( !_id_32E7( var_1 ) )
        var_1 thread _id_3311();

    var_2 = [];

    for ( var_3 = 0; var_3 < level._createfx._id_7C66.size; var_3++ )
    {
        if ( level._createfx._id_7C66[var_3] != var_1 )
            var_2[var_2.size] = level._createfx._id_7C66[var_3];
    }

    level._createfx._id_7C66 = var_2;
}

_id_4C42( var_0 )
{
    return isdefined( level._createfx._id_7C65[var_0] );
}

_id_32E8( var_0 )
{
    for ( var_1 = 0; var_1 < level._createfx._id_7C66.size; var_1++ )
    {
        if ( level._createfx._id_7C66[var_1] == var_0 )
            return 1;
    }

    return 0;
}

_id_1EB5()
{
    for ( var_0 = 0; var_0 < level._createfx._id_7C66.size; var_0++ )
    {
        if ( !_id_32E7( level._createfx._id_7C66[var_0] ) )
            level._createfx._id_7C66[var_0] thread _id_3311();
    }

    level._createfx._id_7C65 = [];
    level._createfx._id_7C66 = [];
}

_id_2DA1()
{

}

_id_2DAB()
{

}

_id_2405( var_0 )
{
    thread _id_2406( var_0 );
}

_id_2406( var_0 )
{
    level notify( "new_createfx_centerprint" );
    level endon( "new_createfx_centerprint" );

    for ( var_1 = 0; var_1 < 5; var_1++ )
    {

    }

    wait 4.5;

    for ( var_1 = 0; var_1 < 5; var_1++ )
    {

    }
}

_id_3E5C()
{
    var_0 = level.player getplayerangles()[1];
    var_1 = ( 0, var_0, 0 );
    var_2 = anglestoright( var_1 );
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = 0;
    var_6 = level._createfx.rate;

    if ( _id_1959( "DPAD_UP" ) )
    {
        if ( level._id_7C69 < 0 )
            level._id_7C69 = 0;

        level._id_7C69 += var_6;
    }
    else if ( _id_1959( "DPAD_DOWN" ) )
    {
        if ( level._id_7C69 > 0 )
            level._id_7C69 = 0;

        level._id_7C69 -= var_6;
    }
    else
        level._id_7C69 = 0;

    if ( _id_1959( "DPAD_RIGHT" ) )
    {
        if ( level._id_7C6A < 0 )
            level._id_7C6A = 0;

        level._id_7C6A += var_6;
    }
    else if ( _id_1959( "DPAD_LEFT" ) )
    {
        if ( level._id_7C6A > 0 )
            level._id_7C6A = 0;

        level._id_7C6A -= var_6;
    }
    else
        level._id_7C6A = 0;

    if ( _id_1959( "BUTTON_Y" ) )
    {
        if ( level._id_7C6B < 0 )
            level._id_7C6B = 0;

        level._id_7C6B += var_6;
    }
    else if ( _id_1959( "BUTTON_B" ) )
    {
        if ( level._id_7C6B > 0 )
            level._id_7C6B = 0;

        level._id_7C6B -= var_6;
    }
    else
        level._id_7C6B = 0;

    var_7 = ( 0.0, 0.0, 0.0 );
    var_7 += var_3 * level._id_7C69;
    var_7 += var_2 * level._id_7C6A;
    var_7 += var_4 * level._id_7C6B;
    return var_7;
}

_id_7DBB()
{
    if ( !level._createfx._id_86BE )
        var_0 = level._createfx.rate;
    else
        var_0 = 90;

    if ( _id_1959( "kp_uparrow", "DPAD_UP" ) )
    {
        if ( level._id_7C6C < 0 )
            level._id_7C6C = 0;

        level._id_7C6C += var_0;
    }
    else if ( _id_1959( "kp_downarrow", "DPAD_DOWN" ) )
    {
        if ( level._id_7C6C > 0 )
            level._id_7C6C = 0;

        level._id_7C6C -= var_0;
    }
    else
        level._id_7C6C = 0;

    if ( _id_1959( "DPAD_LEFT" ) )
    {
        if ( level._id_7C6E < 0 )
            level._id_7C6E = 0;

        level._id_7C6E += var_0;
    }
    else if ( _id_1959( "DPAD_RIGHT" ) )
    {
        if ( level._id_7C6E > 0 )
            level._id_7C6E = 0;

        level._id_7C6E -= var_0;
    }
    else
        level._id_7C6E = 0;

    if ( _id_1959( "BUTTON_Y" ) )
    {
        if ( level._id_7C6D < 0 )
            level._id_7C6D = 0;

        level._id_7C6D += var_0;
    }
    else if ( _id_1959( "BUTTON_B" ) )
    {
        if ( level._id_7C6D > 0 )
            level._id_7C6D = 0;

        level._id_7C6D -= var_0;
    }
    else
        level._id_7C6D = 0;
}

_id_9ADC()
{
    var_0 = 0;

    foreach ( var_2 in level._createfx._id_7C66 )
    {
        if ( var_2.v["type"] == "reactive_fx" )
            var_0 = 1;

        var_2 [[ level._id_3AF1 ]]();
    }

    if ( var_0 )
        _id_72C1();
}

_id_8E8E()
{
    if ( isdefined( self._id_587B ) )
        self._id_587B delete();

    _id_8EA3();
}

stop_fx_looper_on_exploder()
{
    self endon( "death" );
    level waittill( "exploding_" + self.v["stop_on_exploder"] );
    _id_8E8E();
}

_id_8EA3()
{
    self notify( "stop_loop" );

    if ( isdefined( self._id_5891 ) )
    {
        self._id_5891 stoploopsound();
        self._id_5891 delete();
    }
}

_id_3AE8()
{
    if ( !isdefined( level._id_0590 ) )
        var_0 = getarraykeys( level._effect );
    else
    {
        var_0 = getarraykeys( level._effect );

        if ( var_0.size == level._id_0590.size )
            return level._id_0590;
    }

    var_0 = common_scripts\utility::_id_0AF9( var_0 );
    level._id_0590 = var_0;
    return var_0;
}

_id_748A()
{
    _id_8E8E();
    _id_7E40();

    switch ( self.v["type"] )
    {
        case "loopfx":
            common_scripts\_fx::_id_23C9();
            break;
        case "oneshotfx":
            common_scripts\_fx::_id_23DD();
            break;
        case "soundfx":
            common_scripts\_fx::_id_23CA();
            break;
        case "soundfx_interval":
            common_scripts\_fx::_id_23C3();
            break;
        case "soundfx_dynamic":
            common_scripts\_fx::_id_23AF();
            break;
    }
}

_id_72C1()
{
    level._id_05B2._id_718D = undefined;

    foreach ( var_1 in level._id_2417 )
    {
        if ( var_1.v["type"] == "reactive_fx" )
        {
            var_1 _id_7E40();
            var_1 common_scripts\_fx::_id_078A();
        }
    }
}

_id_6FEC()
{
    if ( level._id_3B83 )
    {
        thread _id_780E();
        level._id_240E = 0;
        return;
    }

    _id_7DBB();

    if ( !_id_760D() )
        return;

    level._id_3B83 = 1;

    if ( level._createfx._id_7C66.size > 1 && !level._createfx._id_57F0 )
    {
        var_0 = _id_3CE7( level._createfx._id_7C66 );
        var_1 = spawn( "script_origin", var_0 );
        var_1.v["angles"] = level._createfx._id_7C66[0].v["angles"];
        var_1.v["origin"] = var_0;
        var_2 = [];

        for ( var_3 = 0; var_3 < level._createfx._id_7C66.size; var_3++ )
        {
            var_2[var_3] = spawn( "script_origin", level._createfx._id_7C66[var_3].v["origin"] );
            var_2[var_3].angles = level._createfx._id_7C66[var_3].v["angles"];
            var_2[var_3] _meth_8442( var_1 );
        }

        _id_75F2( var_1, var_2 );
        var_1 delete();

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] delete();
    }
    else if ( level._createfx._id_7C66.size > 0 )
    {
        foreach ( var_5 in level._createfx._id_7C66 )
        {
            var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
            var_2.angles = var_5.v["angles"];

            if ( level._id_7C6C != 0 )
                var_2 addpitch( level._id_7C6C );
            else if ( level._id_7C6E != 0 )
                var_2 addyaw( level._id_7C6E );
            else
                var_2 addroll( level._id_7C6D );

            var_5.v["angles"] = var_2.angles;
            var_2 delete();
        }

        wait 0.05;
    }

    level._id_3B83 = 0;
}

_id_8904()
{
    playfx( level._createfx.grenade.fx, level._id_2416["position"] );
    level._createfx.grenade playsound( level._createfx.grenade._id_8899 );
    radiusdamage( level._id_2416["position"], level._createfx.grenade.radius, 50, 5, undefined, "MOD_EXPLOSIVE" );
    level notify( "code_damageradius", undefined, level._createfx.grenade.radius, level._id_2416["position"] );
}

_id_84D7()
{
    if ( level._id_240B == 1 )
    {
        _id_1EB9();
        level._id_240B = 0;
        level._id_2410 = 0;
        _id_741D();
    }
    else
    {
        level._id_240B = 1;
        level._id_2410 = 1;
        common_scripts\_createfxmenu::_id_2DB6();
        thread common_scripts\_createfxmenu::_id_4839();
        _id_1EDB();
    }

    wait 0.2;
}

_id_3C84( var_0 )
{

}

_id_A35E( var_0, var_1 )
{
    var_2 = "\\t";

    if ( getdvarint( "scr_map_exploder_dump" ) )
    {
        if ( !isdefined( var_0.model ) )
            return;
    }
    else if ( isdefined( var_0.model ) )
        return;

    if ( var_0.v["type"] == "loopfx" )
        _id_1C19( var_2 + "ent = createLoopEffect( \"" + var_0.v["fxid"] + "\" );" );

    if ( var_0.v["type"] == "oneshotfx" )
        _id_1C19( var_2 + "ent = createOneshotEffect( \"" + var_0.v["fxid"] + "\" );" );

    if ( var_0.v["type"] == "exploder" )
    {
        if ( isdefined( var_0.v["exploder"] ) && !level.mp_createfx )
            _id_1C19( var_2 + "ent = createExploderEx( \"" + var_0.v["fxid"] + "\", \"" + var_0.v["exploder"] + "\" );" );
        else
            _id_1C19( var_2 + "ent = createExploder( \"" + var_0.v["fxid"] + "\" );" );
    }

    if ( var_0.v["type"] == "soundfx" )
        _id_1C19( var_2 + "ent = createLoopSound();" );

    if ( var_0.v["type"] == "soundfx_interval" )
        _id_1C19( var_2 + "ent = createIntervalSound();" );

    if ( var_0.v["type"] == "reactive_fx" )
        _id_1C19( var_2 + "ent = createReactiveEnt();" );

    if ( var_0.v["type"] == "soundfx_dynamic" )
        _id_1C19( var_2 + "ent = createDynamicAmbience();" );

    _id_1C19( var_2 + "ent set_origin_and_angles( " + var_0.v["origin"] + ", " + var_0.v["angles"] + " );" );
    _id_6F98( var_0, var_2, var_1 );
    _id_1C19( "" );
}

_id_A35F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "\\t";
    _id_1C1B();
    _id_1C19( "//_createfx generated. Do not touch!!" );
    _id_1C19( "#include common_scripts\\utility;" );
    _id_1C19( "#include common_scripts\\_createfx;\\n" );
    _id_1C19( "" );
    _id_1C19( "main()" );
    _id_1C19( "{" );
    var_6 = var_0.size;

    if ( isdefined( var_4 ) )
        var_6 += var_4.size;

    _id_1C19( var_5 + "// CreateFX " + var_1 + " entities placed: " + var_6 );

    foreach ( var_8 in var_0 )
    {
        if ( level._id_240F > 16 )
        {
            level._id_240F = 0;
            wait 0.1;
        }

        level._id_240F++;
        _id_A35E( var_8, var_2 );
    }

    if ( isdefined( var_4 ) )
    {
        foreach ( var_11 in var_4 )
        {
            if ( level._id_240F > 16 )
            {
                level._id_240F = 0;
                wait 0.1;
            }

            level._id_240F++;
            var_8 = spawnstruct();
            var_8.v = var_11;
            _id_A35E( var_8, var_2 );
        }
    }

    _id_1C19( "}" );
    _id_1C19( " " );
    _id_1C1A( var_2, var_3, var_1 );
}

_id_2403()
{
    var_0 = 0.1;

    foreach ( var_2 in level._id_2417 )
    {
        var_3 = [];
        var_4 = [];

        for ( var_5 = 0; var_5 < 3; var_5++ )
        {
            var_3[var_5] = var_2.v["origin"][var_5];
            var_4[var_5] = var_2.v["angles"][var_5];

            if ( var_3[var_5] < var_0 && var_3[var_5] > var_0 * -1 )
                var_3[var_5] = 0;

            if ( var_4[var_5] < var_0 && var_4[var_5] > var_0 * -1 )
                var_4[var_5] = 0;
        }

        var_2.v["origin"] = ( var_3[0], var_3[1], var_3[2] );
        var_2.v["angles"] = ( var_4[0], var_4[1], var_4[2] );
    }
}

_id_3D1C( var_0 )
{
    var_1 = _id_3D1D( var_0 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = [];

    foreach ( var_7 in level._id_2417 )
    {
        var_8 = 0;

        foreach ( var_5, var_0 in var_1 )
        {
            if ( var_7.v["type"] != var_0 )
                continue;

            var_8 = 1;
            var_2[var_5][var_2[var_5].size] = var_7;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_1.size; var_12++ )
    {
        foreach ( var_7 in var_2[var_12] )
            var_11[var_11.size] = var_7;
    }

    return var_11;
}

_id_3D1D( var_0 )
{
    var_1 = [];

    if ( var_0 == "fx" )
    {
        var_1[0] = "loopfx";
        var_1[1] = "oneshotfx";
        var_1[2] = "exploder";
    }
    else
    {
        var_1[0] = "soundfx";
        var_1[1] = "soundfx_interval";
        var_1[2] = "reactive_fx";
        var_1[3] = "soundfx_dynamic";
    }

    return var_1;
}

_id_500F( var_0, var_1 )
{
    var_2 = _id_3D1D( var_1 );

    foreach ( var_4 in var_2 )
    {
        if ( var_0.v["type"] == var_4 )
            return 1;
    }

    return 0;
}

_id_240A()
{
    var_0 = [];
    var_0[0] = "soundfx";
    var_0[1] = "loopfx";
    var_0[2] = "oneshotfx";
    var_0[3] = "exploder";
    var_0[4] = "soundfx_interval";
    var_0[5] = "reactive_fx";
    var_0[6] = "soundfx_dynamic";
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_4] = [];

    foreach ( var_6 in level._id_2417 )
    {
        var_7 = 0;

        foreach ( var_4, var_9 in var_0 )
        {
            if ( var_6.v["type"] != var_9 )
                continue;

            var_7 = 1;
            var_1[var_4][var_1[var_4].size] = var_6;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_0.size; var_12++ )
    {
        foreach ( var_6 in var_1[var_12] )
            var_11[var_11.size] = var_6;
    }

    level._id_2417 = var_11;
}

_id_1C1B()
{
    common_scripts\utility::_id_36B9();
}

_id_1C19( var_0 )
{
    common_scripts\utility::_id_36B7( var_0 );
}

_id_1C1A( var_0, var_1, var_2 )
{
    var_3 = 1;

    if ( var_1 != "" || var_0 )
        var_3 = 0;

    if ( common_scripts\utility::_id_51AE() )
    {
        var_4 = common_scripts\utility::_id_3E94() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup_" + var_2 + ".gsc";
    }
    else
    {
        var_4 = common_scripts\utility::_id_3E94() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup.gsc";
    }

    common_scripts\utility::_id_36B8( "/share/raw/maps/createfx/" + var_4, var_3 );
}

_id_6FE0()
{
    _id_073A( "mouse1" );
    _id_073A( "BUTTON_RSHLDR" );
    _id_073A( "BUTTON_LSHLDR" );
    _id_073A( "BUTTON_RSTICK" );
    _id_073A( "BUTTON_LSTICK" );
    _id_073A( "BUTTON_A" );
    _id_073A( "BUTTON_B" );
    _id_073A( "BUTTON_X" );
    _id_073A( "BUTTON_Y" );
    _id_073A( "DPAD_UP" );
    _id_073A( "DPAD_LEFT" );
    _id_073A( "DPAD_RIGHT" );
    _id_073A( "DPAD_DOWN" );
    _id_076B( "shift" );
    _id_076B( "ctrl" );
    _id_076B( "escape" );
    _id_076B( "F1" );
    _id_076B( "F5" );
    _id_076B( "F4" );
    _id_076B( "F2" );
    _id_076B( "a" );
    _id_076B( "g" );
    _id_076B( "c" );
    _id_076B( "h" );
    _id_076B( "i" );
    _id_076B( "f" );
    _id_076B( "k" );
    _id_076B( "l" );
    _id_076B( "m" );
    _id_076B( "o" );
    _id_076B( "p" );
    _id_076B( "r" );
    _id_076B( "s" );
    _id_076B( "u" );
    _id_076B( "v" );
    _id_076B( "x" );
    _id_076B( "y" );
    _id_076B( "z" );
    _id_076B( "del" );
    _id_076B( "end" );
    _id_076B( "tab" );
    _id_076B( "ins" );
    _id_076B( "add" );
    _id_076B( "space" );
    _id_076B( "enter" );
    _id_076B( "1" );
    _id_076B( "2" );
    _id_076B( "3" );
    _id_076B( "4" );
    _id_076B( "5" );
    _id_076B( "6" );
    _id_076B( "7" );
    _id_076B( "8" );
    _id_076B( "9" );
    _id_076B( "0" );
    _id_076B( "-" );
    _id_076B( "=" );
    _id_076B( "," );
    _id_076B( "." );
    _id_076B( "[" );
    _id_076B( "]" );
    _id_076B( "leftarrow" );
    _id_076B( "rightarrow" );
    _id_076B( "uparrow" );
    _id_076B( "downarrow" );
}

_id_5809( var_0 )
{
    if ( isdefined( level._createfx._id_580E[var_0] ) )
        return 0;

    return _id_52D3( var_0 );
}

_id_52D3( var_0 )
{
    return level._id_240D && isdefined( level._id_194E[var_0] );
}

_id_073A( var_0 )
{
    if ( _id_5809( var_0 ) )
        return;

    if ( !isdefined( level._id_195A[var_0] ) )
    {
        if ( level.player buttonpressed( var_0 ) )
        {
            level._id_195A[var_0] = 1;
            level._id_1958[var_0] = 1;
        }
    }
    else if ( !level.player buttonpressed( var_0 ) )
        level._id_195A[var_0] = undefined;
}

_id_076B( var_0 )
{
    level._id_194E[var_0] = 1;
    _id_073A( var_0 );
}

_id_1959( var_0, var_1 )
{
    return _id_1962( var_0 ) || _id_1962( var_1 );
}

_id_1962( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _id_52D3( var_0 ) )
        return 0;

    return level.player buttonpressed( var_0 );
}

_id_194D( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_195A[var_1] ) )
            return 1;
    }

    return isdefined( level._id_195A[var_0] );
}

_id_194C( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_1958[var_1] ) )
            return 1;
    }

    return isdefined( level._id_1958[var_0] );
}

_id_4CFE()
{
    level._createfx._id_4AE9 = [];
    level._createfx._id_4AE1 = 30;
    var_0 = [];
    var_1 = [];
    var_0[0] = 0;
    var_1[0] = 0;
    var_0[1] = 1;
    var_1[1] = 1;
    var_0[2] = -2;
    var_1[2] = 1;
    var_0[3] = 1;
    var_1[3] = -1;
    var_0[4] = -2;
    var_1[4] = -1;
    level._id_1F0A = newhudelem();
    level._id_1F0A.alpha = 0;

    for ( var_2 = 0; var_2 < level._createfx._id_4AE1; var_2++ )
    {
        var_3 = [];

        for ( var_4 = 0; var_4 < 1; var_4++ )
        {
            var_5 = newhudelem();
            var_5.alignx = "left";
            var_5._id_57F4 = 0;
            var_5.foreground = 1;
            var_5.fontscale = 1.4;
            var_5.sort = 20 - var_4;
            var_5.alpha = 1;
            var_5.x = 0 + var_0[var_4];
            var_5.y = 60 + var_1[var_4] + var_2 * 15;

            if ( var_4 > 0 )
                var_5.color = ( 0.0, 0.0, 0.0 );

            var_3[var_3.size] = var_5;
        }

        level._createfx._id_4AE9[var_2] = var_3;
    }

    var_3 = [];

    for ( var_4 = 0; var_4 < 5; var_4++ )
    {
        var_5 = newhudelem();
        var_5.alignx = "center";
        var_5._id_57F4 = 0;
        var_5.foreground = 1;
        var_5.fontscale = 1.4;
        var_5.sort = 20 - var_4;
        var_5.alpha = 1;
        var_5.x = 320 + var_0[var_4];
        var_5.y = 80 + var_1[var_4];

        if ( var_4 > 0 )
            var_5.color = ( 0.0, 0.0, 0.0 );

        var_3[var_3.size] = var_5;
    }

    level._id_2405 = var_3;
}

_id_4CCE()
{
    var_0 = newhudelem();
    var_0._id_57F4 = 0;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.foreground = 1;
    var_0.fontscale = 2;
    var_0.sort = 20;
    var_0.alpha = 1;
    var_0.x = 320;
    var_0.y = 233;
}

_id_1EB9()
{
    level._id_1F0A clearalltextafterhudelem();

    for ( var_0 = 0; var_0 < level._createfx._id_4AE1; var_0++ )
    {
        for ( var_1 = 0; var_1 < 1; var_1++ )
        {

        }
    }

    level._id_3BA7 = 0;
}

_id_7E42( var_0 )
{
    for ( var_1 = 0; var_1 < 1; var_1++ )
    {

    }

    level._id_3BA7++;
}

_id_4D6B()
{
    if ( !isdefined( level._createfx._id_93EB ) )
        level._createfx._id_93EB = [];

    if ( !isdefined( level._createfx._id_93EA ) )
        level._createfx._id_93EA = 1;

    if ( !isdefined( level._createfx._id_93E9 ) )
        level._createfx._id_93E9 = "";
}

_id_60A9( var_0 )
{
    foreach ( var_3, var_2 in level._createfx._id_93EB )
    {
        if ( isdefined( var_2._id_9C54 ) )
            var_2._id_9C54 destroy();

        var_2 destroy();
        level._createfx._id_93EB[var_3] = undefined;
    }

    level._createfx._id_93E9 = var_0;
}

_id_24F0( var_0 )
{
    return level._createfx._id_93E9 == var_0;
}

_id_1EDB()
{
    _id_60A9( "" );
}

_id_60AA( var_0 )
{
    var_1 = newhudelem();
    var_1.alignx = "left";
    var_1._id_57F4 = 0;
    var_1.foreground = 1;
    var_1.fontscale = 1.2;
    var_1.alpha = 1;
    var_1.x = 0;
    var_1.y = 320 + var_0 * 15;
    return var_1;
}

_id_3E99( var_0 )
{
    if ( isdefined( level._createfx._id_93EB[var_0] ) )
        return level._createfx._id_93EB[var_0];

    return undefined;
}

_id_7EDB( var_0, var_1, var_2 )
{
    var_3 = _id_3E99( var_0 );

    if ( !isdefined( var_3 ) )
    {
        var_3 = _id_60AA( level._createfx._id_93EB.size );
        level._createfx._id_93EB[var_0] = var_3;
        var_3._id_92B2 = var_0;
    }

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_3._id_9C54 ) )
            var_4 = var_3._id_9C54;
        else
        {
            var_4 = _id_60AA( level._createfx._id_93EB.size );
            var_4.x += 110;
            var_4.y = var_3.y;
            var_3._id_9C54 = var_4;
        }

        if ( isdefined( var_4._id_92B2 ) && var_4._id_92B2 == var_1 )
            return;

        var_4._id_92B2 = var_1;

        if ( !isdefined( var_2 ) )
            var_2 = ( 1.0, 1.0, 1.0 );

        var_4.color = var_2;
    }
}

_id_7C5C()
{
    var_0 = getdvar( "select_by_substring" );

    if ( var_0 == "" )
        return 0;

    setdvar( "select_by_substring", "" );
    var_1 = [];

    foreach ( var_4, var_3 in level._id_2417 )
    {
        if ( issubstr( var_3.v["fxid"], var_0 ) )
            var_1[var_1.size] = var_4;
    }

    if ( var_1.size == 0 )
        return 0;

    _id_28B2();
    _id_7C5E( var_1 );

    foreach ( var_6 in var_1 )
    {
        var_3 = level._id_2417[var_6];
        _id_7C5D( var_6, var_3 );
    }

    return 1;
}

_id_7C5E( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_3 = level._id_2417[var_2];
        _id_7C5D( var_2, var_3 );
    }
}

_id_28B2()
{
    foreach ( var_2, var_1 in level._createfx._id_7C66 )
        _id_28B3( var_2, var_1 );
}

_id_816A()
{
    wait 0.5;

    for (;;)
    {
        level._id_240E += 0.05;

        if ( level._id_240E == 0.15 )
        {
            foreach ( var_1 in level._createfx._id_7C66 )
            {
                if ( var_1.v["type"] == "exploder" )
                    var_1 common_scripts\utility::_id_06FD();
            }

            common_scripts\_createfxmenu::_id_2B46();
            _id_780C();
        }

        if ( level._id_240E == 0.05 )
        {
            var_1 = common_scripts\_createfxmenu::_id_3DB3();
            common_scripts\_createfxmenu::_id_2B46();
        }

        wait 0.05;
    }
}

_id_3A0D()
{
    if ( level._createfx._id_7C66.size < 1 )
        return;

    if ( level._createfx._id_7C66.size > 1 )
    {
        var_0 = _id_3CE7( level._createfx._id_7C66 );
        var_1 = _id_3E41( level._createfx._id_7C66 ) + 200;
    }
    else
    {
        var_0 = level._createfx._id_7C66[0].v["origin"];
        var_1 = 200;
    }

    var_2 = anglestoforward( level.player getplayerangles() );
    var_3 = var_2 * ( -1 * var_1 );
    var_4 = level.player geteye();
    var_5 = var_4 - level.player.origin;
    level.player setorigin( var_0 + var_3 - var_5 );
}

_id_1E96()
{
    foreach ( var_1 in level._id_2417 )
    {
        if ( isdefined( var_1._id_587B ) )
            var_1._id_587B delete();

        var_1 _id_8EA3();
    }
}

_id_748B()
{
    foreach ( var_1 in level._id_2417 )
    {
        if ( var_1.v["type"] == "oneshotfx" )
            var_1 _id_748A();
    }
}

_id_748C()
{
    foreach ( var_1 in level._createfx._id_7C66 )
    {
        if ( isdefined( var_1 ) && var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::_id_06FD();
    }
}

_id_780E()
{
    if ( isdefined( level._id_2417 ) && level._id_240E > 0.15 )
        level._id_2419 = _id_21DA( level._id_2417 );
}

_id_780C()
{
    if ( isdefined( level._id_2417 ) )
        level._id_2418 = _id_21DA( level._id_2417 );
}

_id_9A23()
{
    if ( isdefined( level._id_2419 ) )
    {
        _id_1E96();
        level._id_2417 = [];
        level._id_2417 = _id_21DA( level._id_2419 );
        _id_1EB9();
        _id_741D();
        _id_748B();
        _id_748C();
    }
}

_id_72A2()
{
    if ( isdefined( level._id_2418 ) )
    {
        _id_1E96();
        level._id_2417 = [];
        level._id_2417 = _id_21DA( level._id_2418 );
        _id_1EB9();
        _id_741D();
        _id_748B();
        _id_748C();
    }
}

_id_21DA( var_0 )
{
    var_1 = [];

    if ( var_0.size > 0 )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            var_3 = spawnstruct();

            if ( isdefined( var_0[var_2].v ) )
            {
                var_3.v = [];
                var_3.v["type"] = var_0[var_2].v["type"];
                var_3.v["fxid"] = var_0[var_2].v["fxid"];
                var_3.v["soundalias"] = var_0[var_2].v["soundalias"];
                var_3.v["loopsound"] = var_0[var_2].v["loopsound"];
                var_3.v["angles"] = var_0[var_2].v["angles"];
                var_3.v["origin"] = var_0[var_2].v["origin"];
                var_3.v["exploder"] = var_0[var_2].v["exploder"];
                var_3.v["flag"] = var_0[var_2].v["flag"];
                var_3.v["exploder_type"] = var_0[var_2].v["exploder_type"];
                var_3.v["server_culled"] = var_0[var_2].v["server_culled"];
                var_3.v["delay_min"] = var_0[var_2].v["delay_min"];
                var_3.v["delay_max"] = var_0[var_2].v["delay_max"];
                var_3.v["delay"] = var_0[var_2].v["delay"];
                var_3.v["forward"] = var_0[var_2].v["forward"];
                var_3.v["up"] = var_0[var_2].v["up"];
                var_3.v["tintcolor"] = var_0[var_2].v["tintcolor"];
                var_3.v["tintalpha"] = var_0[var_2].v["tintalpha"];
                var_3.v["fadein"] = var_0[var_2].v["fadein"];
                var_3.v["fadeout"] = var_0[var_2].v["fadeout"];
                var_3.v["emissive"] = var_0[var_2].v["emissive"];
                var_3.v["sizescale"] = var_0[var_2].v["sizescale"];
                var_3.v["repeat"] = var_0[var_2].v["repeat"];
                var_3.v["reactive_radius"] = var_0[var_2].v["reactive_radius"];
                var_3.v["ambiencename"] = var_0[var_2].v["ambiencename"];
                var_3.v["dynamic_distance"] = var_0[var_2].v["dynamic_distance"];

                if ( !level.mp_createfx )
                {
                    var_3.v["firefx"] = var_0[var_2].v["firefx"];
                    var_3.v["firefxdelay"] = var_0[var_2].v["firefxdelay"];
                    var_3.v["firefxtimeout"] = var_0[var_2].v["firefxtimeout"];
                    var_3.v["firefxsound"] = var_0[var_2].v["firefxsound"];
                    var_3.v["damage"] = var_0[var_2].v["damage"];
                    var_3.v["damage_radius"] = var_0[var_2].v["damage_radius"];
                    var_3.v["earthquake"] = var_0[var_2].v["earthquake"];
                    var_3.v["ender"] = var_0[var_2].v["ender"];
                    var_3.v["rumble"] = var_0[var_2].v["rumble"];
                    var_3.v["stoppable"] = var_0[var_2].v["stoppable"];
                }

                var_3.model = var_0[var_2].model;
                var_1[var_2] = var_3;
            }

            var_1[var_2]._id_2DDB = var_0[var_2]._id_2DDB;
            var_1[var_2]._id_92BB = var_0[var_2]._id_92BB;
        }
    }

    return var_1;
}

_id_73B3( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in level._id_2417 )
    {
        if ( isdefined( var_3.model ) && var_3.model == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    level._id_2417 = var_1;
}
