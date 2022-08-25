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
    _id_4D05();
    level.cheat_invert_override = "_bright";
    thread play_flickering_light();
    thread _id_80C6();
    thread _id_7E68();
    shadow_triggers_setup();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_9E6E( "airlift_intro", 0 );
    level.player maps\_utility::set_light_set_player( "airlift_Start" );
    level.player _meth_848C( "clut_airlift", 0.0 );
    setsaveddvar( "fx_cast_shadow", 0 );
}

apply_lighting_pass_airlift( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "airlift":
            var_1 = 3;
            var_2 = "airlift";
            var_3 = "airlift";
            var_0 = "airlift";
            var_4 = "clut_airlift";
            break;
        case "airlift_cobra":
            var_1 = 3;
            var_2 = "airlift_cobra";
            var_3 = "airlift_cobra";
            var_0 = "airlift";
            var_4 = "clut_airlift";
            break;
        case "airlift_streets":
            var_1 = 3;
            var_2 = "airlift_streets";
            var_3 = "airlift_streets";
            var_0 = "airlift_streets";
            var_4 = "clut_airlift";
            break;
        case "airlift_escape":
            var_1 = 3;
            var_2 = "airlift_cobra";
            var_3 = "airlift_cobra";
            var_0 = "airlift";
            var_4 = "clut_airlift";
            break;
        case "airlift_streets_rescue":
            var_1 = 3;
            var_2 = "airlift_streets_rescue";
            var_3 = "airlift_streets_rescue";
            var_0 = "airlift_streets";
            var_4 = "clut_airlift";
            break;
        case "airlift_nuke":
            var_1 = 6.25;
            var_2 = "airlift_nuke";
            var_3 = "airlift_nuke";
            var_0 = "airlift_nuke";
            var_4 = "clut_airlift";
            break;
        case "airlift_nuke_flash":
            var_1 = 0.25;
            var_2 = "airlift_nuke_flash";
            var_3 = "airlift_nuke_flash";
            var_0 = "airlift_nuke_flash";
            var_4 = "clut_airlift";
            break;
        case "airlift_nuke_wavehit":
            var_1 = 10;
            var_2 = "airlift_nuke_wavehit";
            var_3 = "airlift_nuke_wavehit";
            var_0 = "airlift_nuke_wavehit";
            var_4 = "clut_airlift";
            break;
        default:
            var_1 = 3;
            var_2 = "airlift";
            var_3 = "airlift";
            var_0 = "airlift";
            var_4 = "clut_airlift";
            break;
    }

    maps\_utility::_id_7F00( var_2, var_1 );
    maps\_utility::_id_395E( var_3, var_1 );
    level.player maps\_utility::set_light_set_player( var_0 );
    level.player _meth_848C( var_4, var_1 );
    level.current_light_set = var_0;
}

play_flickering_light()
{
    thread maps\_lighting::_id_5D3A( "flicker_1", 0, 1500, 4000, undefined, undefined, 0.01, 0.4, 0.01, 0.04, undefined, undefined, 1500 );
    thread maps\_lighting::_id_5D3A( "flicker_2", 0, 400, 2500, undefined, undefined, 0.03, 0.6, 0.01, 0.08, undefined, undefined, 1500 );
    thread maps\_lighting::_id_5D3A( "flicker_3", 0, 1500, 1850, undefined, undefined, 0.03, 0.6, 0.01, 0.08, undefined, undefined, 1500 );
    thread maps\_lighting::_id_5D3A( "flicker_4", 0, 1500, 2000, undefined, undefined, 0.03, 0.6, 0.01, 0.08, undefined, undefined, 1500 );
}

shadow_triggers_setup()
{
    var_0 = getentarray( "turn_off_shadows", "targetname" );
    var_1 = getentarray( "shadow_trigger", "targetname" );
    level.current_shadow = "on";
    common_scripts\utility::array_thread( var_1, ::shadow_trigger_think, var_0 );
}

shadow_trigger_think( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( self.script_noteworthy != level.current_shadow )
        {
            var_1 = common_scripts\utility::_id_9294( self.script_noteworthy == "on", "normal", "force_off" );

            foreach ( var_3 in var_0 )
                var_3 _meth_8494( var_1 );

            level.current_shadow = var_1;
        }
    }
}
