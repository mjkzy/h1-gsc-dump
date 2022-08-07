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
    if ( !maps\_utility::is_h1_level() )
        return;

    precachestring( &"SCRIPT_INTELLIGENCE_OF_THIRTY" );
    precacheshader( "h1_hud_ammo_status_glow" );
    precacheshader( "h1_hud_ammo_status_scanlines" );
    level.intel_items_total = 30;
    level._id_4E97 = _id_239B();
    level._id_90AA = _id_239C();
    _id_4DDA();
}

_id_4DDA()
{
    for ( var_0 = 0; var_0 < level._id_4E97.size; var_0++ )
    {
        var_1 = level._id_4E97[var_0];
        var_2 = var_1.origin;
        level._id_4E97[var_0]._id_627D = _id_3DFB( var_2 );

        if ( level._id_4E97[var_0] _id_1CCD() )
        {
            var_1.j_exoclav04_r hide();
            var_1.j_exoclav04_r notsolid();
            var_1 common_scripts\utility::_id_97CC();
            level._id_4E97[var_0]._id_39F1 = 1;
            continue;
        }

        level._id_4E97[var_0] thread _id_9FB5();
    }

    remove_found_intel();
}

remove_found_intel()
{
    for (;;)
    {
        for ( var_0 = 0; var_0 < level._id_4E97.size; var_0++ )
        {
            if ( !isdefined( level._id_4E97[var_0]._id_739C ) && level._id_4E97[var_0] _id_1CCD() )
            {
                level._id_4E97[var_0]._id_739C = 1;
                level._id_4E97[var_0].j_exoclav04_r hide();
                level._id_4E97[var_0].j_exoclav04_r notsolid();
                level._id_4E97[var_0] common_scripts\utility::_id_97CC();
                level._id_4E97[var_0] notify( "end_trigger_thread" );
            }
        }

        wait 0.1;
    }
}

_id_1CCD()
{
    return level.playercardbackground _meth_823d( self._id_627D );
}

_id_239B()
{
    var_0 = getentarray( "intelligence_item", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1].j_exoclav04_r = getent( var_0[var_1]._not_team, "targetname" );
        var_0[var_1]._id_39F1 = 0;
    }

    return var_0;
}

_id_239C()
{
    var_0 = [];

    for ( var_1 = 1; var_1 <= level.intel_items_total; var_1++ )
    {
        var_2 = tablelookup( "sp/_intel_items.csv", 0, var_1, 4 );

        if ( isdefined( var_2 ) && var_2 != "undefined" )
        {
            var_3 = strtok( var_2, "," );

            for ( var_4 = 0; var_4 < var_3.size; var_4++ )
                var_3[var_4] = int( var_3[var_4] );

            var_0[var_1] = ( var_3[0], var_3[1], var_3[2] );
            continue;
        }

        var_0[var_1] = undefined;
    }

    return var_0;
}

_id_9FB5()
{
    self sethintstring( &"SCRIPT_INTELLIGENCE_PICKUP" );
    self usetriggerrequirelookat();
    self endon( "end_trigger_thread" );
    self waittill( "trigger" );
    self._id_39F1 = 1;
    common_scripts\utility::_id_97CC();
    save_that_item_is_found();
    updategamerprofile();
    thread _id_4E96();
}

save_that_item_is_found()
{
    level.playercardbackground _meth_823e( self._id_627D );
}

_id_3DFB( var_0 )
{
    for ( var_1 = 1; var_1 < level._id_90AA.size + 1; var_1++ )
    {
        if ( !isdefined( level._id_90AA[var_1] ) )
            continue;

        if ( distancesquared( var_0, level._id_90AA[var_1] ) < 25 )
            return var_1;
    }
}

_id_4E96()
{
    self.j_exoclav04_r hide();
    self.j_exoclav04_r notsolid();
    level thread common_scripts\utility::_id_69C2( "intelligence_pickup", self.j_exoclav04_r.origin );
    var_0 = 3000;
    var_1 = 700;
    var_2 = maps\_hud_util::_id_2420( "h1_hud_ammo_status_glow", 400, 75 );
    var_2.color = ( 1, 0.95, 0.4 );
    var_2.xpmaxmultipliertimeplayed = 0;
    var_2._id_0538 = -65;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2.hostquits = "center";
    var_2.visionsetnight = "middle";
    var_2.foreground = 1;
    var_2.alpha = 0.0;
    var_3 = maps\_hud_util::_id_2420( "h1_hud_ammo_status_scanlines", 800, 75 );
    var_3.color = ( 1, 0.85, 0 );
    var_3.xpmaxmultipliertimeplayed = 0;
    var_3._id_0538 = -65;
    var_3.alignx = "center";
    var_3.aligny = "middle";
    var_3.hostquits = "center";
    var_3.visionsetnight = "middle";
    var_3.foreground = 1;
    var_3.alpha = 0.0;
    var_4 = maps\_hud_util::_id_2401( "objective", 1.5 );
    var_4 _id_814B();
    var_4 setpulsefx( 19, var_0, var_1 );
    var_4 setvalue( intel_found_total() );
    var_5 = intel_found_total();

    if ( var_5 == 15 || maps\_achievements::platform_tracks_progression() )
        maps\_utility::_id_41DD( "LOOK_SHARP" );

    if ( var_5 == 30 || maps\_achievements::platform_tracks_progression() )
        maps\_utility::_id_41DD( "EYES_AND_EARS" );

    wait 0.7;
    var_2.alpha = 0.5;
    wait 0.05;
    var_3.alpha = 0.6;
    var_2 fadeovertime( 0.035 );
    var_2.alpha = 0.0;
    wait 0.05;
    var_3 fadeovertime( 1.0 );
    var_3.alpha = 0.0;
    wait(( var_0 + var_1 ) / 1000);
    var_4 destroy();
    var_2 destroy();
    var_3 destroy();
}

_id_814B()
{
    self.fontscale = 1.2;
    self.glowcolor = ( 0.96, 0.81, 0 );
    self.glowalpha = 0.2;
    self.color = ( 0.99, 0.97, 0.85 );
    self.alpha = 1;
    self.xpmaxmultipliertimeplayed = 0;
    self._id_0538 = -65;
    self.alignx = "center";
    self.aligny = "middle";
    self.hostquits = "center";
    self.visionsetnight = "middle";
    self.foreground = 1;
    self.land = &"SCRIPT_INTELLIGENCE_OF_THIRTY";
}

intel_found_total()
{
    var_0 = 0;

    for ( var_1 = 1; var_1 <= level.intel_items_total; var_1++ )
    {
        if ( level.playercardbackground _meth_823d( var_1 ) )
            var_0++;
    }

    return var_0;
}
