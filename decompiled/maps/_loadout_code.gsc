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

_id_781E( var_0 )
{
    var_1 = level.player getcurrentweapon();

    if ( !isdefined( var_1 ) || var_1 == "none" )
    {

    }

    game["weaponstates"][var_0]["current"] = var_1;
    var_2 = level.player getcurrentoffhand();
    game["weaponstates"][var_0]["offhand"] = var_2;
    game["weaponstates"][var_0]["list"] = [];
    var_3 = level.player getweaponslistall();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        game["weaponstates"][var_0]["list"][var_4]["name"] = var_3[var_4];
}

_id_74B1( var_0 )
{
    if ( !isdefined( game["weaponstates"] ) )
        return 0;

    if ( !isdefined( game["weaponstates"][var_0] ) )
        return 0;

    level.player takeallweapons();

    for ( var_1 = 0; var_1 < game["weaponstates"][var_0]["list"].size; var_1++ )
    {
        var_2 = game["weaponstates"][var_0]["list"][var_1]["name"];

        if ( isdefined( level.legit_weapons ) )
        {
            if ( !isdefined( level.legit_weapons[var_2] ) )
                continue;
        }

        if ( var_2 == "c4" )
            continue;

        if ( var_2 == "claymore" )
            continue;

        level.player giveweapon( var_2 );
        level.player givemaxammo( var_2 );
    }

    if ( isdefined( level.legit_weapons ) )
    {
        var_2 = game["weaponstates"][var_0]["offhand"];

        if ( isdefined( level.legit_weapons[var_2] ) )
            level.player switchtooffhand( var_2 );

        var_2 = game["weaponstates"][var_0]["current"];

        if ( isdefined( level.legit_weapons[var_2] ) )
            level.player switchtoweapon( var_2 );
    }
    else
    {
        level.player switchtooffhand( game["weaponstates"][var_0]["offhand"] );
        level.player switchtoweapon( game["weaponstates"][var_0]["current"] );
    }

    return 1;
}

_id_7F46()
{
    self setactionslot( 1, "" );
    self setactionslot( 2, "" );
    self setactionslot( 3, "altMode" );
    self setactionslot( 4, "" );
}

_id_4D31()
{
    _id_7F46();
    self takeallweapons();
}

_id_3DCC()
{
    if ( isdefined( level._id_57D6 ) )
        return level._id_57D6;

    return level.script;
}

_id_67D9( var_0, var_1 )
{
    var_2 = _id_3DCC();

    if ( var_0 != var_2 )
        return;

    if ( !isdefined( game["previous_map"] ) )
        return;

    if ( game["previous_map"] != var_1 )
        return;

    level._lc_persists = 1;
    _id_74B1( var_1 );
    level._id_46F3 = 1;
}

_id_57D6( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_0 ) )
    {
        var_7 = _id_3DCC();

        if ( var_0 != var_7 )
            return;
    }

    if ( !isdefined( level._lc_persists ) )
    {
        if ( isdefined( var_1 ) )
        {
            level._id_2792 = var_1;
            level.player giveweapon( var_1 );
        }

        if ( isdefined( var_2 ) )
            level.player giveweapon( var_2 );

        if ( isdefined( var_1 ) )
            level.player switchtoweapon( var_1 );
        else if ( isdefined( var_2 ) )
            level.player switchtoweapon( var_2 );
    }

    if ( isdefined( var_3 ) )
    {
        level.player setoffhandprimaryclass( var_3 );
        level.player giveweapon( var_3 );
    }

    if ( isdefined( var_4 ) )
    {
        level.player setoffhandsecondaryclass( var_4 );
        level.player giveweapon( var_4 );
    }

    if ( isdefined( var_5 ) )
        level.player setviewmodel( var_5 );

    if ( isdefined( var_6 ) )
        level._id_1A3D = var_6;

    level._id_46F3 = 1;
}

_id_57DB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( level.script != var_0 )
        return;

    if ( isdefined( var_1 ) )
    {
        level.player giveweapon( var_1 );
        level.player setactionslot( 2, "weapon", var_1 );
    }

    if ( isdefined( var_2 ) )
    {
        level.player giveweapon( var_2 );
        level.player setactionslot( 4, "weapon", var_2 );
    }
}

_id_57D8()
{
    level._id_57DA = 1;
    level notify( "loadout complete" );
}

_id_2783()
{
    if ( level._id_46F3 )
        return;

    _id_57D6( undefined, "mp5", undefined, "fraggrenade", "flash_grenade", "viewmodel_base_viewhands" );
    level._id_5985 = 1;
}

loadoutcustomization()
{
    switch ( level.script )
    {
        case "killhouse":
            loadout_killhouse();
            break;
        case "cargoship":
            break;
        case "coup":
            break;
        case "blackout":
            loadout_blackout();
            break;
        case "armada":
            break;
        case "bog_a":
            break;
        case "hunted":
            break;
        case "ac130":
            break;
        case "bog_b":
            break;
        case "airlift":
            break;
        case "aftermath":
            break;
        case "village_assault":
            break;
        case "scoutsniper":
            loadout_scoutsniper();
            break;
        case "sniperescape":
            loadout_sniperescape();
            break;
        case "village_defend":
            loadout_village_defend();
            break;
        case "ambush":
            loadout_ambush();
            break;
        case "icbm":
            break;
        case "launchfacility_a":
            loadout_launchfacility_a();
            break;
        case "launchfacility_b":
            loadout_launchfacility_b();
            break;
        case "jeepride":
            break;
        case "airplane":
            break;
        case "simplecredits":
            break;
    }
}

loadout_killhouse()
{
    level.player setweaponammoclip( "fraggrenade", 0 );
    level.player setweaponammoclip( "flash_grenade", 0 );
}

loadout_blackout()
{
    level.player givemaxammo( "m4m203_silencer_reflex" );
    level.player givemaxammo( "m14_scoped_silencer_woodland" );
}

loadout_scoutsniper()
{
    level.player givemaxammo( "m14_scoped_silencer" );
    level.player givemaxammo( "usp_silencer" );
}

loadout_sniperescape()
{
    if ( level._id_3BFE >= 2 )
    {
        level.player setweaponammoclip( "claymore", 10 );
        level.player setweaponammoclip( "c4", 6 );
    }
    else
    {
        level.player setweaponammoclip( "claymore", 8 );
        level.player setweaponammoclip( "c4", 3 );
    }
}

loadout_village_defend()
{
    level.player givemaxammo( "claymore" );
}

loadout_ambush()
{
    level.player setweaponammostock( "remington700", 10 );
}

loadout_launchfacility_a()
{
    level.player givemaxammo( "claymore" );
}

loadout_launchfacility_b()
{
    var_0 = undefined;
    var_1 = 0;
    var_2 = level.player getweaponslistprimaries();

    foreach ( var_4 in var_2 )
    {
        if ( issubstr( var_4, "javelin" ) )
        {
            var_0 = var_4;
            continue;
        }

        if ( issubstr( var_4, "m4m203_silencer_reflex" ) )
            var_1 = 1;
    }

    if ( isdefined( var_0 ) )
    {
        level.player takeweapon( var_0 );

        if ( var_1 )
            level.player giveweapon( "usp_silencer" );
        else
            level.player giveweapon( "m4m203_silencer_reflex" );

        level.player switchtoweaponimmediate( "m4m203_silencer_reflex" );
    }
}
