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
    common_scripts\utility::_id_383D( "ca_blockout" );
    common_scripts\utility::_id_383F( "ca_blockout" );
    setdvar( "bcs_enable", 0 );
    delete_enemy();
    delete_multiple_trigger();
    delete_battlechatter_trigger();
    delete_flood_spawner_trigger();
    delete_camper_spawner_trigger();
    delete_truckjunk();
    delete_color_volumes();
}

delete_enemy()
{
    var_0 = getspawnerteamarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_4 = getaiarray( "axis" );

    foreach ( var_6 in var_4 )
        var_6 delete();
}

delete_multiple_trigger()
{
    var_0 = getentarray( "trigger_multiple", "code_classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname == "trigger_multiple_visionset" )
            continue;

        if ( isdefined( var_0[var_1].targetname ) && var_0[var_1].targetname == "trigger_fog" )
            continue;

        if ( isdefined( var_0[var_1].script_noteworthy ) && var_0[var_1].script_noteworthy == "skip_blockout_delete" )
            continue;

        var_0[var_1] delete();
    }
}

delete_battlechatter_trigger()
{
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_radius", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_disk", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_multiple", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_lookat", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_once", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_use", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_damage", "code_classname" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_795D ) )
            var_0[var_1] delete();

        if ( isdefined( var_0[var_1]._id_7A0F ) )
            var_0[var_1] delete();
    }
}

delete_flood_spawner_trigger()
{
    var_0 = getentarray( "flood_spawner", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_camper_spawner_trigger()
{
    var_0 = getentarray( "camper_spawner", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_fog_trigger()
{
    var_0 = getentarray( "trigger_fog", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_script_vehicle()
{
    var_0 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_truckjunk()
{
    var_0 = getentarray( "truckjunk", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_animated_model()
{
    var_0 = getentarray( "animated_model", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_interactive_tv()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_explodable_barrel()
{
    var_0 = getentarray( "explodable_barrel", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_color_volumes()
{
    var_0 = getallnodes();
    var_1 = [];
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_multiple", "classname" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_radius", "classname" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_once", "classname" ) );
    var_2 = getentarray( "info_volume", "classname" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_7975 ) || isdefined( var_0[var_3]._id_7976 ) )
            var_0[var_3] disconnectnode();
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3]._id_7975 ) || isdefined( var_1[var_3]._id_7976 ) )
            var_1[var_3] delete();
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3]._id_7975 ) || isdefined( var_2[var_3]._id_7976 ) )
            var_2[var_3] delete();
    }
}
