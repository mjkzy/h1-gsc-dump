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
    if ( isdefined( level._id_05E5 ) )
        return;

    level._id_05E5 = 1;
    level._id_9E56 = getdvarint( "virtualLobbyActive", 0 );
    maps\mp\_utility::_id_7DF3();
    level._id_2409 = getdvar( "createfx" ) != "";
    common_scripts\utility::_id_8F63();
    maps\mp\_utility::_id_4DC0();
    maps\mp\_utility::_id_4DF0();
    maps\mp\_utility::_id_4DC1();
    level._id_3C9D = 0;
    level._id_3846 = spawnstruct();
    level._id_3846 common_scripts\utility::_id_0D6F();

    if ( !isdefined( level._id_382E ) )
    {
        level._id_382E = [];
        level._id_386C = [];
    }

    level.requiredmapaspectratio = getdvarfloat( "scr_RequiredMapAspectratio", 1 );
    level._id_23EE = maps\mp\gametypes\_hud_util::_id_2401;
    level._id_4AFD = maps\mp\gametypes\_hud_util::_id_7FEE;
    level._id_5656 = maps\mp\_utility::_id_5655;
    thread maps\mp\gametypes\_tweakables::init();

    if ( !isdefined( level._id_3AE4 ) )
        level._id_3AE4 = [];

    level._id_3AE4["precacheMpAnim"] = ::precachempanim;
    level._id_3AE4["scriptModelPlayAnim"] = ::scriptmodelplayanim;
    level._id_3AE4["scriptModelClearAnim"] = ::scriptmodelclearanim;

    if ( !level._id_2409 )
    {
        thread maps\mp\_movers::init();
        thread maps\mp\_shutter::main();
        thread maps\mp\_destructables::init();
        thread common_scripts\_elevator::init();
    }

    game["thermal_vision"] = "default";
    _func_143( "", 0 );
    _func_144( "default_night_mp" );
    visionsetthermal( game["thermal_vision"] );
    visionsetpain( "near_death_mp", 0 );
    var_0 = getentarray( "lantern_glowFX_origin", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread _id_54BD();

    maps\mp\_audio::_id_4CB6();
    maps\mp\_art::main();
    _id_8313();
    thread common_scripts\_fx::_id_4DBF();

    if ( level._id_2409 )
    {
        maps\mp\gametypes\_spawnlogic::_id_7FA6();
        maps\mp\_createfx::_id_2402();
    }

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        _id_284D();
        maps\mp\gametypes\_spawnlogic::_id_7FA6();
        maps\mp\_global_fx::main();
        level waittill( "eternity" );
    }

    thread maps\mp\_global_fx::main();

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        switch ( var_2 )
        {
            case 0:
                var_3 = "trigger_multiple";
                break;
            case 1:
                var_3 = "trigger_once";
                break;
            case 2:
                var_3 = "trigger_use";
                break;
            case 3:
                var_3 = "trigger_radius";
                break;
            case 4:
                var_3 = "trigger_lookat";
                break;
            default:
                var_3 = "trigger_damage";
                break;
        }

        var_4 = getentarray( var_3, "classname" );

        for ( var_1 = 0; var_1 < var_4.size; var_1++ )
        {
            if ( isdefined( var_4[var_1]._id_7AA6 ) )
                var_4[var_1]._id_79BF = var_4[var_1]._id_7AA6;

            if ( isdefined( var_4[var_1]._id_79BF ) )
                level thread _id_352F( var_4[var_1] );
        }
    }

    var_5 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_7 in var_5 )
        var_7 thread _id_4B0C();

    level._id_3AE4["damagefeedback"] = maps\mp\gametypes\_damagefeedback::_id_9B0C;
    level._id_3AE4["setTeamHeadIcon"] = maps\mp\_entityheadicons::_id_8028;
    level._id_54FC = ::laseron;
    level._id_54F9 = ::laseroff;
    level._id_214E = ::connectpaths;
    level._id_2B39 = ::disconnectpaths;
    setdvar( "sm_spotLightScoreModelScale", 0.1 );
    setdvar( "sm_spotShadowFadeTime", 1.0 );
    setdvar( "r_specularcolorscale", 2.5 );
    setdvar( "r_diffusecolorscale", 1 );
    setdvar( "r_lightGridEnableTweaks", 0 );
    setdvar( "r_lightGridIntensity", 1 );
    setdvar( "r_lightGridContrast", 0 );
    setdvar( "r_dof_physical_enable", 1 );
    setdvar( "r_volumeLightScatter", 0 );
    setdvar( "r_uiblurdstmode", 0 );
    setdvar( "r_blurdstgaussianblurradius", 1 );
    setdvar( "r_dof_physical_bokehEnable", 0 );

    if ( level.nextreadghosts1 )
        setdvar( "sm_polygonOffsetPreset", 0 );

    _id_830E();
    watchfordestructiblevehicles();

    if ( level._id_9E56 == 0 && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
        precacheitem( "bomb_site_mp" );

    level._id_3694 = 0;
    _id_57C2();
}

_id_352F( var_0 )
{
    level endon( "killexplodertridgers" + var_0._id_79BF );
    var_0 waittill( "trigger" );

    if ( isdefined( var_0._id_796E ) && randomfloat( 1 ) > var_0._id_796E )
    {
        if ( isdefined( var_0.script_lightset ) )
            wait(var_0.script_lightset);
        else
            wait 4;

        level thread _id_352F( var_0 );
        return;
    }

    common_scripts\_exploder::_id_3528( var_0._id_79BF );
    level notify( "killexplodertridgers" + var_0._id_79BF );
}

_id_8313()
{
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_7AA6 ) )
            var_0[var_2]._id_79BF = var_0[var_2]._id_7AA6;

        if ( isdefined( var_0[var_2]._id_79BF ) )
        {
            if ( var_0[var_2].motiontrackerenabled == "fx" && ( !isdefined( var_0[var_2].teambalanced ) || var_0[var_2].teambalanced != "exploderchunk" ) )
            {
                var_0[var_2] hide();
                continue;
            }

            if ( isdefined( var_0[var_2].teambalanced ) && var_0[var_2].teambalanced == "exploder" )
            {
                var_0[var_2] hide();
                var_0[var_2] notsolid();
                continue;
            }

            if ( isdefined( var_0[var_2].teambalanced ) && var_0[var_2].teambalanced == "exploderchunk" )
            {
                var_0[var_2] hide();
                var_0[var_2] notsolid();
            }
        }
    }

    var_3 = [];
    var_4 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA6 ) )
            var_4[var_2]._id_79BF = var_4[var_2]._id_7AA6;

        if ( isdefined( var_4[var_2]._id_79BF ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA6 ) )
            var_4[var_2]._id_79BF = var_4[var_2]._id_7AA6;

        if ( isdefined( var_4[var_2]._id_79BF ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA6 ) )
            var_4[var_2]._id_79BF = var_4[var_2]._id_7AA6;

        if ( isdefined( var_4[var_2]._id_79BF ) )
            var_3[var_3.size] = var_4[var_2];
    }

    if ( !isdefined( level._id_2417 ) )
        level._id_2417 = [];

    var_5 = [];
    var_5["exploderchunk visible"] = 1;
    var_5["exploderchunk"] = 1;
    var_5["exploder"] = 1;

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        var_6 = var_3[var_2];
        var_7 = common_scripts\utility::_id_23FE( var_6.script_fxid );
        var_7.v = [];
        var_7.v["origin"] = var_6.origin;
        var_7.v["angles"] = var_6.angles;
        var_7.v["delay"] = var_6.script_lightset;
        var_7.v["firefx"] = var_6._id_79CB;
        var_7.v["firefxdelay"] = var_6._id_79CC;
        var_7.v["firefxsound"] = var_6._id_79CD;
        var_7.v["firefxtimeout"] = var_6._id_79CE;
        var_7.v["earthquake"] = var_6._id_79B5;
        var_7.v["damage"] = var_6._id_7981;
        var_7.v["damage_radius"] = var_6._id_7AB2;
        var_7.v["soundalias"] = var_6._id_7ACB;
        var_7.v["repeat"] = var_6._id_7AB6;
        var_7.v["delay_min"] = var_6._id_798E;
        var_7.v["delay_max"] = var_6._id_798D;
        var_7.v["target"] = var_6._not_team;
        var_7.v["ender"] = var_6._id_79B8;
        var_7.v["type"] = "exploder";

        if ( !isdefined( var_6.script_fxid ) )
            var_7.v["fxid"] = "No FX";
        else
            var_7.v["fxid"] = var_6.script_fxid;

        var_7.v["exploder"] = var_6._id_79BF;

        if ( !isdefined( var_7.v["delay"] ) )
            var_7.v["delay"] = 0;

        if ( isdefined( var_6._not_team ) )
        {
            var_8 = getentarray( var_7.v["target"], "targetname" )[0];

            if ( isdefined( var_8 ) )
            {
                var_9 = var_8.origin;
                var_7.v["angles"] = vectortoangles( var_9 - var_7.v["origin"] );
            }
            else
            {
                var_8 = common_scripts\utility::_id_3E89( var_7.v["target"] );

                if ( isdefined( var_8 ) )
                {
                    var_9 = var_8.origin;
                    var_7.v["angles"] = vectortoangles( var_9 - var_7.v["origin"] );
                }
            }
        }

        if ( var_6.classname == "script_brushmodel" || isdefined( var_6.motiontrackerenabled ) )
        {
            var_7.motiontrackerenabled = var_6;
            var_7.motiontrackerenabled._id_2B34 = var_6._id_79A0;
        }

        if ( isdefined( var_6.teambalanced ) && isdefined( var_5[var_6.teambalanced] ) )
            var_7.v["exploder_type"] = var_6.teambalanced;
        else
            var_7.v["exploder_type"] = "normal";

        var_7 common_scripts\_createfx::_id_6E6D();
    }
}

_id_54BD()
{
    common_scripts\_fx::_id_587C( "lantern_light", self.origin, 0.3, self.origin + ( 0, 0, 1 ) );
}

_id_4B0C()
{
    level endon( "game_ended" );
    wait(randomfloat( 1.0 ));

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( var_1 istouching( self ) && maps\mp\_utility::_id_5189( var_1 ) )
                var_1 maps\mp\_utility::_id_066F();
        }

        wait 0.5;
    }
}

_id_830E()
{
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
    {
        switch ( getdvar( "mapname" ) )
        {
            case "mp_interchange":
                if ( var_2.origin[2] > 150.0 )
                    continue;

                break;
        }

        var_3 = var_2.origin + ( 0, 0, 5 );
        var_4 = var_2.origin + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534D = spawn( "script_model", var_5["position"] );
        var_2._id_534D.teambalanced = "killCamEnt_destructible_vehicle";
        var_2._id_534D setscriptmoverkillcam( "explosive" );
        var_2 thread _id_284C();
    }

    var_7 = getentarray( "destructible_toy", "targetname" );

    foreach ( var_2 in var_7 )
    {
        var_3 = var_2.origin + ( 0, 0, 5 );
        var_4 = var_2.origin + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534D = spawn( "script_model", var_5["position"] );
        var_2._id_534D.teambalanced = "killCamEnt_destructible_toy";
        var_2._id_534D setscriptmoverkillcam( "explosive" );
        var_2 thread _id_284C();
    }

    var_10 = getentarray( "explodable_barrel", "targetname" );

    foreach ( var_2 in var_10 )
    {
        var_3 = var_2.origin + ( 0, 0, 5 );
        var_4 = var_2.origin + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534D = spawn( "script_model", var_5["position"] );
        var_2._id_534D.teambalanced = "killCamEnt_explodable_barrel";
        var_2._id_534D setscriptmoverkillcam( "explosive" );
        var_2 thread _id_284C();
    }
}

_id_284C()
{
    level endon( "game_ended" );
    var_0 = self._id_534D;
    var_0 endon( "death" );
    self waittill( "death" );
    wait 10;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

watchfordestructiblevehicles()
{
    var_0 = getscriptablearray();

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 _meth_8438();

        if ( issubstr( var_3, "destpv_" ) )
            var_2 thread destructiblevehiclewatch();
    }
}

destructiblevehiclewatch()
{
    self endon( "death" );
    self waittill( "explode", var_0 );

    if ( isdefined( var_0 ) && var_0 != self )
        var_0 notify( "destroyed_car" );
}

_id_284D()
{
    var_0 = getentarray( "boost_jump_border", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_0 = getentarray( "mp_recovery_signage", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_6 = getentarray( "horde_dome", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 delete();

    var_10 = getentarray( "hp_zone_center", "targetname" );

    foreach ( var_12 in var_10 )
    {
        if ( isdefined( var_12._not_team ) )
        {
            var_0 = getentarray( var_12._not_team, "targetname" );

            foreach ( var_2 in var_0 )
                var_2 delete();
        }
    }

    var_16 = getentarray( "orbital_bad_spawn_overlay", "targetname" );

    foreach ( var_18 in var_16 )
        var_18 delete();
}

_id_57C2()
{
    if ( isdefined( level._id_2239 ) )
        return;

    level._id_2239 = [ "gender", "shirt", "head", "gloves" ];
    level._id_2238 = [];

    for ( var_0 = 0; var_0 < level._id_2239.size; var_0++ )
    {
        var_1 = level._id_2239[var_0];
        level._id_2238[var_1] = var_0;
    }
}
