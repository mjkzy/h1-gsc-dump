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
    common_scripts\utility::_id_383D( "no_ai_tv_damage" );
    var_0 = 0;
    var_1 = getentarray( "explodable_barrel", "targetname" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_0 = 1;

    var_1 = getentarray( "explodable_barrel", "script_noteworthy" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_0 = 1;

    if ( var_0 )
    {
        setbreakablesfx( "barrel", "explode", "fx/props/barrelExp", "explo_metal_barrel" );
        setbreakablesfx( "barrel", "burn_start", "fx/props/barrel_ignite" );
        setbreakablesfx( "barrel", "burn", "fx/props/barrel_fire_top", "explo_metal_barrel_pre_fire" );
    }

    var_2 = getentarray( "oil_spill", "targetname" );

    if ( isdefined( var_2 ) && var_2.size > 0 )
    {
        setbreakablesfx( "oilspill", "burn", "fx/props/barrel_fire" );
        setbreakablesfx( "oilspill", "spark", "fx/impacts/small_metalhit_1" );
    }

    var_3 = getentarray( "tincan", "targetname" );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        setbreakablesfx( "tincan", undefined, "fx/props/tincan_bounce" );

    var_4 = 0;
    var_5 = getentarray( "breakable", "targetname" );

    if ( isdefined( var_5 ) && var_5.size > 0 )
        var_4 = 1;

    var_5 = getentarray( "breakable_vase", "targetname" );

    if ( isdefined( var_5 ) && var_5.size > 0 )
        var_4 = 1;

    var_5 = getentarray( "breakable box", "targetname" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_4 = 1;

    var_5 = getentarray( "breakable box", "script_noteworthy" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_4 = 1;

    if ( var_4 )
    {
        setbreakablesfx( "vase", undefined, "fx/props/vase_water", "bullet_large_vase" );
        setbreakablesfx( "bottle", undefined, "fx/props/wine_bottle", "bullet_small_bottle" );
        setbreakablesfx( "box", 0, "fx/props/crateExp_dust", "bullet_large_crate" );
        setbreakablesfx( "box", 1, "fx/props/crateExp_dust", "bullet_large_crate" );
        setbreakablesfx( "box", 2, "fx/props/crateExp_dust", "bullet_large_crate" );
        setbreakablesfx( "box", 3, "fx/props/crateExp_ammo", "bullet_large_crate" );
    }

    var_6 = getentarray( "glass", "targetname" );
    var_6 = common_scripts\utility::_id_0CDD( var_6, getentarray( "glass", "script_noteworthy" ) );

    if ( isdefined( var_6 ) && var_6.size > 0 )
    {
        level._glass_info = [];
        level._glass_info["glass_large"]["breakfx"] = loadfx( "fx/props/car_glass_large" );
        level._glass_info["glass_large"]["breaksnd"] = "veh_glass_break_large";
        level._glass_info["glass_med"]["breakfx"] = loadfx( "fx/props/car_glass_med" );
        level._glass_info["glass_med"]["breaksnd"] = "veh_glass_break_small";
        level._glass_info["glass_small"]["breakfx"] = loadfx( "fx/props/car_glass_headlight" );
        level._glass_info["glass_small"]["breaksnd"] = "veh_glass_break_small";
    }

    var_7 = getentarray( "interactive_tv", "targetname" );

    if ( isdefined( var_7 ) && var_7.size > 0 )
    {
        precachemodel( "com_tv2_d" );
        precachemodel( "com_tv1" );
        precachemodel( "com_tv1_d" );
        precachemodel( "com_tv2" );
        precachemodel( "com_tv1_testpattern" );
        precachemodel( "com_tv2_testpattern" );
        setbreakablesfx( "tv_explode", undefined, "fx/explosions/tv_explosion", "tv_shot_burst" );
        level._id_99D2 = getentarray( "interactive_tv_light", "targetname" );
    }

    var_8 = getentarray( "destroyable_security_camera", "script_noteworthy" );

    if ( isdefined( var_8 ) && var_8.size > 0 )
    {
        precachemodel( "com_security_camera" );
        precachemodel( "com_security_camera_destroyed" );
        setbreakablesfx( "security_camera_explode", undefined, "fx/props/securitycamera_explosion", "security_camera_sparks" );
    }

    var_9 = 25;
    level.breakables_peicescollide["orange vase"] = 1;
    level.breakables_peicescollide["green vase"] = 1;
    level.breakables_peicescollide["bottle"] = 1;
    level.barrelhealth = 150;
    level.precachemodeltype = [];
    level.barrelexplodingthisframe = 0;
    level.breakables_clip = [];
    level.breakables_clip = getentarray( "vase_break_remove", "targetname" );
    level.console_auto_aim = [];
    level.console_auto_aim = getentarray( "xenon_auto_aim", "targetname" );
    level.console_auto_aim_2nd = getentarray( "xenon_auto_aim_secondary", "targetname" );

    for ( var_10 = 0; var_10 < level.console_auto_aim.size; var_10++ )
        level.console_auto_aim[var_10] notsolid();

    for ( var_10 = 0; var_10 < level.console_auto_aim_2nd.size; var_10++ )
        level.console_auto_aim_2nd[var_10] notsolid();

    maps\_utility::_id_7DF3();

    if ( level.console )
    {
        level.console_auto_aim = undefined;
        level.console_auto_aim_2nd = undefined;
    }

    var_11 = getentarray( "breakable clip", "targetname" );

    for ( var_10 = 0; var_10 < var_11.size; var_10++ )
        level.breakables_clip[level.breakables_clip.size] = var_11[var_10];

    level._breakable_utility_modelarray = [];
    level._breakable_utility_modelindex = 0;
    level._breakable_utility_maxnum = var_9;
    common_scripts\utility::_id_0D13( getentarray( "tincan", "targetname" ), ::tincan_think );
    common_scripts\utility::_id_0D13( getentarray( "helmet_pop", "targetname" ), ::helmet_pop );
    common_scripts\utility::_id_0D13( getentarray( "explodable_barrel", "targetname" ), ::explodable_barrel_think );
    common_scripts\utility::_id_0D13( getentarray( "explodable_barrel", "script_noteworthy" ), ::explodable_barrel_think );
    common_scripts\utility::_id_0D13( getentarray( "shuddering_entity", "targetname" ), ::shuddering_entity_think );
    common_scripts\utility::_id_0D13( getentarray( "breakable box", "targetname" ), ::breakable_think );
    common_scripts\utility::_id_0D13( getentarray( "breakable box", "script_noteworthy" ), ::breakable_think );
    common_scripts\utility::_id_0D13( getentarray( "breakable", "targetname" ), ::breakable_think );
    common_scripts\utility::_id_0D13( getentarray( "breakable_vase", "targetname" ), ::breakable_think );
    common_scripts\utility::_id_0D13( getentarray( "oil_spill", "targetname" ), ::oil_spill_think );
    common_scripts\utility::_id_0D13( getentarray( "glass", "targetname" ), ::glass_logic );
    common_scripts\utility::_id_0D13( getentarray( "interactive_tv", "targetname" ), ::_id_99D3 );
    common_scripts\utility::_id_0D13( getentarray( "destroyable_security_camera", "script_noteworthy" ), ::security_camera_logic );
    common_scripts\utility::_id_0D13( getentarray( "hanging_object", "targetname" ), ::hanging_object_logic );
    common_scripts\utility::_id_0D13( getentarray( "platestack", "targetname" ), ::destroy_platestack );
    misc_rotate_fans();
}

security_camera_logic()
{
    self setcandamage( 1 );
    var_0 = undefined;

    switch ( self.motiontrackerenabled )
    {
        case "com_security_camera":
            var_0 = "com_security_camera_destroyed";
            break;
    }

    self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
    self setmodel( var_0 );
    playfxontag( level._id_17DD["security_camera_explode"], self, "tag_deathfx" );

    if ( isdefined( level.breakables_sfx["security_camera_explode"] ) )
        thread maps\_utility::_id_69C6( level.breakables_sfx["security_camera_explode"] );
}

_id_99D3()
{
    self setcandamage( 1 );
    self._id_25A7 = undefined;
    self._id_6378 = undefined;

    if ( issubstr( self.motiontrackerenabled, "1" ) )
    {
        self._id_6378 = "com_tv1";
        self._id_64BC = "com_tv1_testpattern";
        self._id_25A7 = "com_tv1_d";
    }
    else if ( issubstr( self.motiontrackerenabled, "2" ) )
    {
        self._id_25A7 = "com_tv2_d";
        self._id_6378 = "com_tv2";
        self._id_64BC = "com_tv2_testpattern";
    }

    if ( isdefined( self._not_team ) )
    {
        self._id_9C1A = getent( self._not_team, "targetname" );
        self._id_9C1A usetriggerrequirelookat();
        self._id_9C1A setcursorhint( "HINT_NOICON" );
    }

    if ( !isdefined( self.script_parentname ) || self.script_parentname != "nolite" )
    {
        var_0 = common_scripts\utility::_id_3CCB( self.origin, level._id_99D2, undefined, undefined, 64 );

        if ( var_0.size )
        {
            self._id_57A7 = var_0[0];
            level._id_99D2 = common_scripts\utility::_id_0CF6( level._id_99D2, self._id_57A7 );
            self._id_57A9 = self._id_57A7 getlightintensity();
            self._id_57A7.tv = self;
        }
    }

    thread _id_99CF();

    if ( isdefined( self._not_team ) )
        thread _id_99D6();
}

_id_99D6()
{
    self._id_9C1A endon( "death" );

    for (;;)
    {
        wait 0.2;
        self._id_9C1A waittill( "trigger" );
        thread maps\_utility::_id_69C6( "scn_tv_trigger_on_off" );
        self notify( "off" );

        if ( is_tv_off() )
        {
            self setmodel( self._id_64BC );

            if ( isdefined( self._id_57A7 ) )
                self._id_57A7 setlightintensity( self._id_57A9 );

            continue;
        }

        self setmodel( self._id_6378 );

        if ( isdefined( self._id_57A7 ) )
            self._id_57A7 setlightintensity( 0 );
    }
}

_id_99CF()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( common_scripts\utility::_id_382E( "no_ai_tv_damage" ) )
        {
            if ( !isalive( var_1 ) )
                continue;

            if ( var_1 != level.playercardbackground )
                continue;
        }

        break;
    }

    if ( isdefined( level.tvhook ) )
        [[ level.tvhook ]]();

    self notify( "off" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A notify( "death" );

    self setmodel( self._id_25A7 );

    if ( isdefined( self._id_57A7 ) )
        self._id_57A7 setlightintensity( 0 );

    playfxontag( level._id_17DD["tv_explode"], self, "tag_fx" );

    if ( isdefined( level.breakables_sfx["tv_explode"] ) )
        thread maps\_utility::_id_69C5( level.breakables_sfx["tv_explode"], "tag_fx" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A delete();
}

is_tv_on()
{
    return self.motiontrackerenabled == self._id_64BC;
}

is_tv_off()
{
    return self.motiontrackerenabled == self._id_6378;
}

is_tv_damaged()
{
    return self.motiontrackerenabled == self._id_25A7;
}

is_tv_emitting_light()
{
    return is_tv_on();
}

destroy_platestack()
{
    setbreakablesfx( "platestack_shatter", undefined, self._id_7A99 );
    self setcandamage( 1 );
    var_0 = getentarray( self._not_team, "targetname" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 != "MOD_MELEE" && var_5 != "MOD_IMPACT" )
        {
            playfx( level._id_17DD["platestack_shatter"], self.origin );

            foreach ( var_7 in var_0 )
                var_7 delete();

            self delete();
        }

        wait 0.01;
    }
}

hanging_object_logic()
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
        {
            self physicslaunch( self.origin, ( 0, 0, 0 ) );
            break;
        }

        wait 0.01;
    }
}

glass_logic()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = 0;

    if ( isdefined( self._not_team ) )
        var_2 = getent( self._not_team, "targetname" );

    if ( isdefined( self._id_7A26 ) )
    {
        var_4 = common_scripts\utility::_id_3DC3();
        var_5 = getent( var_4[0], "script_linkname" );
        self linkto( var_5 );
    }

    switch ( self.destructible_type )
    {
        case "glass_large":
            break;
        case "glass_med":
            break;
        case "glass_small":
            break;
        default:
            break;
    }

    if ( isdefined( var_2 ) )
    {
        var_3 = 99;
        var_2 linkto( self );
        var_2 hide();
        var_1 = var_2 setcontents( 0 );
    }

    if ( isdefined( self._id_7A0C ) )
        var_3 = self._id_7A0C;
    else if ( isdefined( var_2 ) )
        var_3 = 99;
    else
        var_3 = 250;

    self setcandamage( 1 );

    while ( var_3 > 0 )
    {
        self waittill( "damage", var_6, var_7, var_0, var_8, var_9 );

        if ( !isdefined( var_0 ) )
            var_0 = ( 0, 0, 1 );

        if ( !isdefined( var_9 ) )
            var_6 = 100000;
        else if ( var_9 == "MOD_GRENADE_SPLASH" )
            var_6 *= 1.75;
        else if ( var_9 == "MOD_IMPACT" )
            var_6 = 100000;

        var_3 -= var_6;
    }

    var_10 = var_3 * -1;
    self hide();
    self notsolid();

    if ( isdefined( var_2 ) )
    {
        var_2 show();
        var_2 setcandamage( 1 );
        var_3 = 200 - var_10;
        var_2 setcontents( var_1 );

        while ( var_3 > 0 )
        {
            var_2 waittill( "damage", var_6, var_11, var_0, var_8, var_9 );

            if ( !isdefined( var_0 ) )
                var_0 = ( 0, 0, 1 );

            if ( !isdefined( var_9 ) )
                var_6 = 100000;
            else if ( var_9 == "MOD_GRENADE_SPLASH" )
                var_6 *= 1.75;
            else if ( var_9 == "MOD_IMPACT" )
                break;

            var_3 -= var_6;
        }

        var_2 delete();
    }

    glass_play_break_fx( self getorigin(), self.destructible_type, var_0 );
    self delete();
}

glass_play_break_fx( var_0, var_1, var_2 )
{
    thread common_scripts\utility::_id_69C2( level._glass_info[var_1]["breaksnd"], var_0 );
    playfx( level._glass_info[var_1]["breakfx"], var_0, var_2 );
    level notify( "glass_shatter" );
}

oil_spill_think()
{
    self._id_311C = common_scripts\utility::_id_40FB( self._not_team, "targetname" );
    self._id_8B20 = common_scripts\utility::_id_40FB( self._id_311C._not_team, "targetname" );
    self._id_12E4 = getclosestent( self._id_8B20.origin, getentarray( "explodable_barrel", "targetname" ) );

    if ( isdefined( self._id_12E4 ) )
    {
        self._id_12E4.oilspill = 1;
        thread oil_spill_burn_after();
    }

    self.extra = getent( self._not_team, "targetname" );
    self setcandamage( 1 );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 == "MOD_MELEE" || var_5 == "MOD_IMPACT" )
            continue;

        self._id_25A9 = var_2;
        playfx( level._id_17DD["oilspill"]["spark"], var_4, var_3 );
        var_0 = spawn( "script_origin", var_4 );

        if ( isdefined( level.breakables_sfx["oilspill"]["spark"] ) )
            var_0 thread maps\_utility::_id_69C6( level.breakables_sfx["oilspill"]["spark"] );

        var_4 = pointonsegmentnearesttopoint( self._id_8B20.origin, self._id_311C.origin, var_4 );
        thread oil_spill_burn_section( var_4 );
        thread oil_spill_burn( var_4, self._id_8B20.origin );
        thread oil_spill_burn( var_4, self._id_311C.origin );
        break;
    }

    if ( isdefined( self._id_12E4 ) )
        self._id_12E4 waittill( "exploding" );

    if ( isdefined( level.breakables_sfx["oilspill"]["spark"] ) )
        var_0 _meth_854d( level.breakables_sfx["oilspill"]["spark"] );

    self.extra delete();
    self hide();
    wait 10;
    var_0 delete();
    self delete();
}

oil_spill_burn_after()
{
    for (;;)
    {
        self._id_12E4 waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        self._id_25A9 = var_1;
        break;
    }

    self entityradiusdamage( self._id_8B20.origin, 4, 10, 10, self._id_25A9 );
}

oil_spill_burn( var_0, var_1 )
{
    var_2 = vectornormalize( var_1 - var_0 );
    var_3 = distance( var_0, var_1 );
    var_4 = 8;
    var_5 = maps\_utility::vector_multiply( var_2, var_4 );
    var_6 = vectortoangles( var_2 );
    var_7 = anglestoright( var_6 );
    var_8 = getentarray( "explodable_barrel", "targetname" );
    var_9 = 484;
    var_10 = spawn( "script_origin", var_0 );
    var_11 = 0;

    for (;;)
    {
        var_3 -= var_4;

        if ( var_3 < var_4 * 0.1 )
            break;

        var_0 += ( var_5 + maps\_utility::vector_multiply( var_7, randomfloatrange( -6, 6 ) ) );
        thread oil_spill_burn_section( var_0 );
        var_11++;

        if ( var_11 == 4 )
        {
            badplace_cylinder( "", 5, var_0, 64, 64 );
            var_11 = 0;
        }

        var_10.origin = var_0;
        var_12 = [];
        var_8 = common_scripts\utility::_id_0D01( var_8 );

        for ( var_13 = 0; var_13 < var_8.size; var_13++ )
        {
            var_14 = anglestoup( var_8[var_13].angles );
            var_15 = var_8[var_13].origin + maps\_utility::vector_multiply( var_14, 22 );
            var_16 = physicstrace( var_15, var_15 + ( 0, 0, -64 ) );

            if ( distancesquared( var_0, var_16 ) < var_9 )
            {
                var_12[var_12.size] = var_8[var_13];
                var_8[var_13] dodamage( 80 + randomfloat( 10 ), var_0 );
            }
        }

        for ( var_13 = 0; var_13 < var_12.size; var_13++ )
            var_8 = common_scripts\utility::_id_0CF6( var_8, var_12[var_13] );

        wait 0.1;
    }

    if ( !isdefined( self._id_12E4 ) )
        return;

    if ( distance( var_0, self._id_8B20.origin ) < 32 )
        self._id_12E4 dodamage( 80 + randomfloat( 10 ), var_0 );
}

oil_spill_burn_section( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    playfx( level._id_17DD["oilspill"]["burn"], var_0 );

    if ( isdefined( level.breakables_sfx["oilspill"]["burn"] ) )
        thread maps\_utility::_id_6976( level.breakables_sfx["oilspill"]["burn"], undefined, 1, 1 );
}

explodable_barrel_think()
{
    if ( self.classname != "script_model" )
        return;

    if ( !isdefined( level.precachemodeltype["com_barrel_benzin"] ) )
    {
        level.precachemodeltype["com_barrel_benzin"] = 1;
        precachemodel( "com_barrel_piece" );
        precachemodel( "com_barrel_piece2" );
    }

    self endon( "exploding" );
    breakable_clip();
    xenon_auto_aim();
    self.damagetaken = 0;
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        self._id_25A9 = var_1;

        if ( level.barrelexplodingthisframe )
            wait(randomfloat( 1 ));

        self.damagetaken += var_0;

        if ( self.damagetaken == var_0 )
            thread explodable_barrel_burn();
    }
}

explodable_barrel_burn()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = anglestoup( self.angles );
    var_3 = anglestoup( ( 0, 90, 0 ) );
    var_4 = vectordot( var_2, var_3 );
    var_5 = ( 0, 0, 0 );
    var_6 = maps\_utility::vector_multiply( var_2, 44 );

    if ( var_4 < 0.5 )
    {
        var_5 = maps\_utility::vector_multiply( var_2, 22 ) - ( 0, 0, 30 );
        var_6 = maps\_utility::vector_multiply( var_2, 22 ) + ( 0, 0, 14 );
    }

    var_7 = spawn( "script_origin", self.origin + var_6 );

    while ( self.damagetaken < level.barrelhealth )
    {
        if ( !var_1 )
        {
            playfx( level._id_17DD["barrel"]["burn_start"], self.origin + var_5 );

            if ( isdefined( level.breakables_sfx["barrel"]["burn_start"] ) )
                thread maps\_utility::_id_69C6( level.breakables_sfx["barrel"]["burn_start"] );

            var_1 = 1;
        }

        if ( var_0 > 20 )
            var_0 = 0;

        playfx( level._id_17DD["barrel"]["burn"], self.origin + var_6 );

        if ( isdefined( level.breakables_sfx["barrel"]["burn"] ) )
            var_7 thread maps\_utility::_id_6976( level.breakables_sfx["barrel"]["burn"], undefined, 1, 1 );

        if ( var_0 == 0 )
        {
            self.damagetaken += ( 10 + randomfloat( 10 ) );
            badplace_cylinder( "", 1, self.origin, 128, 250 );
        }

        var_0++;
        wait 0.05;
    }

    var_7 stopsounds();
    self stopsounds();
    thread explodable_barrel_explode();
    wait 1.0;
    var_7 delete();
}

explodable_barrel_explode()
{
    self notify( "exploding" );
    self notify( "death" );
    var_0 = anglestoup( self.angles );
    var_1 = anglestoup( ( 0, 90, 0 ) );
    var_2 = vectordot( var_0, var_1 );
    var_3 = ( 0, 0, 0 );

    if ( var_2 < 0.5 )
    {
        var_4 = self.origin + maps\_utility::vector_multiply( var_0, 22 );
        var_5 = physicstrace( var_4, var_4 + ( 0, 0, -64 ) );
        var_3 = var_5 - self.origin;
    }

    var_3 += ( 0, 0, 4 );
    playfx( level._id_17DD["barrel"]["explode"], self.origin + var_3 );

    if ( isdefined( level.breakables_sfx["barrel"]["explode"] ) )
        thread maps\_utility::_id_69C6( level.breakables_sfx["barrel"]["explode"] );

    physicsexplosionsphere( self.origin + var_3, 100, 80, 1 );
    level.barrelexplodingthisframe = 1;

    if ( isdefined( self.remove ) )
    {
        self.remove connectpaths();
        self.remove delete();
    }

    var_6 = 1;
    var_7 = 250;
    var_8 = 250;

    if ( isdefined( self.rank ) )
        var_8 = self.rank;

    var_9 = undefined;

    if ( isdefined( self._id_25A9 ) )
    {
        var_9 = self._id_25A9;

        if ( isplayer( var_9 ) )
            maps\_utility::arcademode_kill( self.origin, "rifle", 150 );
    }

    level._id_55A0["time"] = gettime();
    level._id_55A0["origin"] = self.origin + ( 0, 0, 30 );
    level._id_55A0["radius"] = 350;
    self entityradiusdamage( self.origin + ( 0, 0, 30 ), var_8, var_7, var_6, var_9 );

    if ( randomint( 2 ) == 0 )
        self setmodel( "com_barrel_piece" );
    else
        self setmodel( "com_barrel_piece2" );

    if ( var_2 < 0.5 )
    {
        var_4 = self.origin + maps\_utility::vector_multiply( var_0, 22 );
        var_10 = physicstrace( var_4, var_4 + ( 0, 0, -64 ) );
        self.origin = var_10;
        self.angles += ( 0, 0, 90 );
    }

    wait 0.05;
    level.barrelexplodingthisframe = 0;
}

shuddering_entity_think()
{
    var_0 = 0;

    if ( self.motiontrackerenabled == "prop_helmet_german_normandy" )
        var_0 = 1;

    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4 );

        if ( var_0 )
            self vibrate( var_3, 20, 0.6, 0.75 );
        else
            self vibrate( var_3, 0.4, 0.4, 0.4 );

        self waittill( "rotatedone" );
    }
}

tincan_think()
{
    if ( self.classname != "script_model" )
        return;

    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1 );

    if ( issentient( var_1 ) )
        var_2 = var_1 geteye() - ( 0, 0, randomint( 50 ) + 50 );
    else
        var_2 = var_1.origin;

    var_3 = vectornormalize( self.origin - var_2 );
    var_3 = common_scripts\utility::vectorscale( var_3, 0.5 + randomfloat( 1 ) );
    self notify( "death" );
    playfx( level._id_17DD["tincan"], self.origin, var_3 );

    if ( isdefined( level.breakables_sfx["tincan"] ) )
        thread common_scripts\utility::_id_69C2( level.breakables_sfx["tincan"], self.origin );

    self delete();
}

helmet_pop()
{
    if ( self.classname != "script_model" )
        return;

    xenon_auto_aim();
    self setcandamage( 1 );
    thread helmet_logic();
}

helmet_logic()
{
    self waittill( "damage", var_0, var_1 );

    if ( issentient( var_1 ) )
        var_2 = var_1 geteye();
    else
        var_2 = var_1.origin;

    var_3 = vectornormalize( self.origin - var_2 );

    if ( !isdefined( self.dontremove ) && var_1 == level.playercardbackground )
    {
        thread animscripts\death::_id_481F( var_3 );
        return;
    }

    self notsolid();
    self hide();
    var_4 = spawn( "script_model", self.origin + ( 0, 0, 5 ) );
    var_4.angles = self.angles;
    var_4 setmodel( self.motiontrackerenabled );
    var_4 thread animscripts\death::_id_481F( var_3 );
    self.dontremove = 0;
    self notify( "ok_remove" );
}

allowbreak( var_0 )
{
    if ( !isdefined( level.breakingents ) )
        return 1;

    if ( level.breakingents.size == 0 )
        return 0;
    else
    {
        for ( var_1 = 0; var_1 < level.breakingents.size; var_1++ )
        {
            if ( var_0 == level.breakingents[var_1] )
                return 1;
        }

        return 0;
    }

    return 1;
}

breakable_think_triggered( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_0 notify( "damage", 100, var_1 );
    }
}

breakable_think()
{
    if ( self.classname != "script_model" )
        return;

    if ( !isdefined( self.motiontrackerenabled ) )
        return;

    var_0 = undefined;

    if ( self.motiontrackerenabled == "egypt_prop_vase1" || self.motiontrackerenabled == "egypt_prop_vase3" || self.motiontrackerenabled == "egypt_prop_vase4" )
    {
        if ( !isdefined( level.precachemodeltype["egypt_prop_vase_o"] ) )
        {
            level.precachemodeltype["egypt_prop_vase_o"] = 1;
            precachemodel( "egypt_prop_vase_br2" );
            precachemodel( "egypt_prop_vase_br5" );
            precachemodel( "egypt_prop_vase_br7" );
        }

        var_0 = "orange vase";
        breakable_clip();
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "egypt_prop_vase2" || self.motiontrackerenabled == "egypt_prop_vase5" || self.motiontrackerenabled == "egypt_prop_vase6" )
    {
        if ( !isdefined( level.precachemodeltype["egypt_prop_vase_g"] ) )
        {
            level.precachemodeltype["egypt_prop_vase_g"] = 1;
            precachemodel( "egypt_prop_vase_br1" );
            precachemodel( "egypt_prop_vase_br3" );
            precachemodel( "egypt_prop_vase_br4" );
            precachemodel( "egypt_prop_vase_br6" );
        }

        var_0 = "green vase";
        breakable_clip();
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_crate_dak1" || self.motiontrackerenabled == "prop_crate_dak2" || self.motiontrackerenabled == "prop_crate_dak3" || self.motiontrackerenabled == "prop_crate_dak4" || self.motiontrackerenabled == "prop_crate_dak5" || self.motiontrackerenabled == "prop_crate_dak6" || self.motiontrackerenabled == "prop_crate_dak7" || self.motiontrackerenabled == "prop_crate_dak8" || self.motiontrackerenabled == "prop_crate_dak9" )
    {
        if ( !isdefined( level.precachemodeltype["prop_crate_dak_shard"] ) )
        {
            level.precachemodeltype["prop_crate_dak_shard"] = 1;
            precachemodel( "prop_crate_dak_shard" );
        }

        var_0 = "wood box";
        breakable_clip();
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_winebottle_breakable" )
    {
        if ( !isdefined( level.precachemodeltype["prop_winebottle"] ) )
        {
            level.precachemodeltype["prop_winebottle"] = 1;
            precachemodel( "prop_winebottle_broken_top" );
            precachemodel( "prop_winebottle_broken_bot" );
        }

        var_0 = "bottle";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_roundfloral" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenfloral"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenfloral"] = 1;
            precachemodel( "prop_diningplate_brokenfloral1" );
            precachemodel( "prop_diningplate_brokenfloral2" );
            precachemodel( "prop_diningplate_brokenfloral3" );
            precachemodel( "prop_diningplate_brokenfloral4" );
        }

        var_0 = "plate";
        self.plate = "round_floral";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_roundplain" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenplain"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenplain"] = 1;
            precachemodel( "prop_diningplate_brokenplain1" );
            precachemodel( "prop_diningplate_brokenplain2" );
            precachemodel( "prop_diningplate_brokenplain3" );
            precachemodel( "prop_diningplate_brokenplain4" );
        }

        var_0 = "plate";
        self.plate = "round_plain";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_roundstack" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenplain"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenplain"] = 1;
            precachemodel( "prop_diningplate_brokenplain1" );
            precachemodel( "prop_diningplate_brokenplain2" );
            precachemodel( "prop_diningplate_brokenplain3" );
            precachemodel( "prop_diningplate_brokenplain4" );
        }

        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenfloral"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenfloral"] = 1;
            precachemodel( "prop_diningplate_brokenfloral1" );
            precachemodel( "prop_diningplate_brokenfloral2" );
            precachemodel( "prop_diningplate_brokenfloral3" );
            precachemodel( "prop_diningplate_brokenfloral4" );
        }

        var_0 = "plate";
        self.plate = "round_stack";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_ovalfloral" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenfloral"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenfloral"] = 1;
            precachemodel( "prop_diningplate_brokenfloral1" );
            precachemodel( "prop_diningplate_brokenfloral2" );
            precachemodel( "prop_diningplate_brokenfloral3" );
            precachemodel( "prop_diningplate_brokenfloral4" );
        }

        var_0 = "plate";
        self.plate = "oval_floral";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_ovalplain" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenplain"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenplain"] = 1;
            precachemodel( "prop_diningplate_brokenplain1" );
            precachemodel( "prop_diningplate_brokenplain2" );
            precachemodel( "prop_diningplate_brokenplain3" );
            precachemodel( "prop_diningplate_brokenplain4" );
        }

        var_0 = "plate";
        self.plate = "oval_plain";
        xenon_auto_aim();
    }
    else if ( self.motiontrackerenabled == "prop_diningplate_ovalstack" )
    {
        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenplain"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenplain"] = 1;
            precachemodel( "prop_diningplate_brokenplain1" );
            precachemodel( "prop_diningplate_brokenplain2" );
            precachemodel( "prop_diningplate_brokenplain3" );
            precachemodel( "prop_diningplate_brokenplain4" );
        }

        if ( !isdefined( level.precachemodeltype["prop_diningplate_brokenfloral"] ) )
        {
            level.precachemodeltype["prop_diningplate_brokenfloral"] = 1;
            precachemodel( "prop_diningplate_brokenfloral1" );
            precachemodel( "prop_diningplate_brokenfloral2" );
            precachemodel( "prop_diningplate_brokenfloral3" );
            precachemodel( "prop_diningplate_brokenfloral4" );
        }

        var_0 = "plate";
        self.plate = "oval_stack";
        xenon_auto_aim();
    }

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( self._not_team ) )
    {
        var_1 = getent( self._not_team, "targetname" );

        if ( isdefined( var_1 ) && var_1.classname == "trigger_multiple" )
            var_1 thread breakable_think_triggered( self );
    }

    self setcandamage( 1 );
    thread breakable_logic( var_0 );
}

breakable_logic( var_0 )
{
    var_1 = undefined;

    for (;;)
    {
        self waittill( "damage", var_2, var_1 );

        if ( isdefined( var_1 ) && var_1.code_classname == "script_vehicle" )
            var_1 joltbody( self.origin + ( 0, 0, -90 ), 0.2 );

        if ( var_0 == "wood box" )
        {
            if ( !allowbreak( var_1 ) )
                continue;

            if ( !isdefined( level._id_386B ) || !isdefined( level._id_386B["Breakable Boxes"] ) )
                break;

            if ( isdefined( level._id_386B["Breakable Boxes"] ) && level._id_386B["Breakable Boxes"] == 1 )
                break;
        }
        else
            break;
    }

    self notify( "death" );
    var_3 = undefined;
    var_4 = undefined;
    var_5 = 0;

    switch ( var_0 )
    {
        case "orange vase":
        case "green vase":
            if ( isdefined( level.breakables_sfx["vase"] ) )
                var_3 = level.breakables_sfx["vase"];
            else
                var_3 = "bullet_large_vase";

            var_4 = level._id_17DD["vase"];
            break;
        case "wood box":
            var_6 = randomint( level._id_17DD["box"].size );

            if ( isdefined( level.breakables_sfx["box"][var_6] ) )
                var_3 = level.breakables_sfx["box"][var_6];
            else
                var_3 = "bullet_large_crate";

            var_4 = level._id_17DD["box"][var_6];
            var_5 = 1;
            break;
        case "bottle":
            if ( isdefined( level.breakables_sfx["bottle"] ) )
                var_3 = level.breakables_sfx["bottle"];
            else
                var_3 = "bullet_small_bottle";

            var_4 = level._id_17DD["bottle"];
            break;
        case "plate":
            if ( isdefined( level.breakables_sfx["plate"] ) )
                var_3 = level.breakables_sfx["plate"];
            else
                var_3 = "bullet_small_plate";

            break;
    }

    thread common_scripts\utility::_id_69C2( var_3, self.origin );
    thread make_broken_peices( self, var_0 );

    if ( isdefined( var_4 ) )
        playfx( var_4, self.origin );

    if ( var_5 )
    {
        var_7 = getentarray( "breakable", "targetname" );

        for ( var_8 = 0; var_8 < var_7.size; var_8++ )
        {
            var_9 = var_7[var_8];
            var_10 = abs( self.origin[0] - var_9.origin[0] );
            var_11 = abs( self.origin[1] - var_9.origin[1] );

            if ( var_10 <= 20 && var_11 <= 20 )
            {
                var_12 = self.origin[2] - var_9.origin[2];

                if ( var_12 <= 0 )
                    var_9 notify( "damage", var_2, var_1 );
            }
        }
    }

    if ( isdefined( self.remove ) )
    {
        self.remove connectpaths();
        self.remove delete();
    }

    if ( !isdefined( self.dontremove ) )
        self delete();
    else
        self.dontremove = 0;

    self notify( "ok_remove" );
}

xenon_auto_aim()
{
    if ( isdefined( level.console_auto_aim ) && level.console_auto_aim.size > 0 )
        self.autoaim = getclosestaccurantent( self.origin, level.console_auto_aim );

    if ( isdefined( self.autoaim ) )
    {
        level.console_auto_aim = common_scripts\utility::_id_0CF6( level.console_auto_aim, self.autoaim );
        thread xenon_remove_auto_aim();
    }
}

xenon_auto_aim_stop_logic()
{
    self notify( "entered_xenon_auto_aim_stop_logic" );
    self endon( "entered_xenon_auto_aim_stop_logic" );
    self.autoaim waittill( "xenon_auto_aim_stop_logic" );
    self.dontremove = undefined;
}

xenon_remove_auto_aim( var_0 )
{
    thread xenon_auto_aim_stop_logic();
    self endon( "xenon_auto_aim_stop_logic" );
    self.autoaim endon( "xenon_auto_aim_stop_logic" );
    self notify( "xenon_remove_auto_aim" );
    self.autoaim thread xenon_enable_auto_aim( var_0 );
    self.dontremove = 1;
    self waittill( "damage", var_1, var_2 );
    self.autoaim _meth_81d7();
    self.autoaim delete();

    if ( self.dontremove )
        self waittill( "ok_remove" );

    self delete();
}

xenon_enable_auto_aim( var_0 )
{
    self endon( "xenon_auto_aim_stop_logic" );
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( self.script_parentname ) && var_0 )
    {
        var_1 = "enable_xenon_autoaim_" + self.script_parentname;
        level waittill( var_1 );
    }

    self.wait_message = 0;

    if ( isdefined( self.recreate ) && self.recreate == 1 )
        self waittill( "recreate" );

    self _meth_81b9();
}

breakable_clip()
{
    if ( isdefined( self._not_team ) )
    {
        var_0 = getent( self._not_team, "targetname" );

        if ( var_0.classname == "script_brushmodel" )
        {
            self.remove = var_0;
            return;
        }
    }

    if ( isdefined( level.breakables_clip ) && level.breakables_clip.size > 0 )
        self.remove = getclosestent( self.origin, level.breakables_clip );

    if ( isdefined( self.remove ) )
        level.breakables_clip = common_scripts\utility::_id_0CF6( level.breakables_clip, self.remove );
}

make_broken_peices( var_0, var_1 )
{
    var_2 = anglestoright( var_0.angles );
    var_3 = anglestoforward( var_0.angles );
    var_4 = anglestoup( var_0.angles );
    var_5 = [];

    switch ( var_1 )
    {
        case "orange vase":
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -7, 0, 22, var_0, ( 0, 0, 0 ), "egypt_prop_vase_br2" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 13, -6, 28, var_0, ( 0, 245.1, 0 ), "egypt_prop_vase_br7" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 12, 10, 27, var_0, ( 0, 180, 0 ), "egypt_prop_vase_br7" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, 2, 0, var_0, ( 0, 0, 0 ), "egypt_prop_vase_br5" );
            break;
        case "green vase":
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -6, -1, 26, var_0, ( 0, 0, 0 ), "egypt_prop_vase_br1" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 12, 1, 31, var_0, ( 0, 348.5, 0 ), "egypt_prop_vase_br3" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 6, 13, 29, var_0, ( 0, 153.5, 0 ), "egypt_prop_vase_br6" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, 1, 0, var_0, ( 0, 0, 0 ), "egypt_prop_vase_br4" );
            break;
        case "wood box":
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -10, 10, 25, var_0, ( 0, 0, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 10, 10, 25, var_0, ( 0, 90, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 10, -10, 25, var_0, ( 0, 180, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -10, -10, 25, var_0, ( 0, 270, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 10, 10, 5, var_0, ( 180, 0, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 10, -10, 5, var_0, ( 180, 90, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -10, -10, 5, var_0, ( 180, 180, 0 ), "prop_crate_dak_shard" );
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, -10, 10, 5, var_0, ( 180, 270, 0 ), "prop_crate_dak_shard" );
            break;
        case "bottle":
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 0, 0, 10, var_0, ( 0, 0, 0 ), "prop_winebottle_broken_top" );
            var_5[var_5.size - 1].unlockpoints = "bottle_top";
            var_5[var_5.size] = addpiece( var_2, var_3, var_4, 0, 0, 0, var_0, ( 0, 0, 0 ), "prop_winebottle_broken_bot" );
            var_5[var_5.size - 1].unlockpoints = "bottle_bot";
            break;
        case "plate":
            switch ( var_0.plate )
            {
                case "round_floral":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -4, 0.5, var_0, ( 0, 150, 0 ), "prop_diningplate_brokenfloral1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, -2, 0.5, var_0, ( 0, 149.8, 0 ), "prop_diningplate_brokenfloral2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 1, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenfloral3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 2, 0.5, var_0, ( 0, 146.8, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
                case "round_plain":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -4, 0.5, var_0, ( 0, 150, 0 ), "prop_diningplate_brokenplain1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, -2, 0.5, var_0, ( 0, 149.8, 0 ), "prop_diningplate_brokenplain2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 1, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenplain3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 2, 0.5, var_0, ( 0, 146.8, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
                case "round_stack":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -4, 0.5, var_0, ( 0, 150, 0 ), "prop_diningplate_brokenfloral1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, -2, 0.5, var_0, ( 0, 149.8, 0 ), "prop_diningplate_brokenfloral2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 1, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenfloral3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 2, 0.5, var_0, ( 0, 146.8, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 3, 2.5, var_0, ( 0, 60, 0 ), "prop_diningplate_brokenplain1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -1, -3, 2.5, var_0, ( 0, 59.8, 0 ), "prop_diningplate_brokenplain2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 2, -1, 2.5, var_0, ( 0, 60.2, 0 ), "prop_diningplate_brokenplain3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 2, 4, 2.5, var_0, ( 0, 56.8, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -4, 4.5, var_0, ( 0, 150, 0 ), "prop_diningplate_brokenfloral1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, -2, 4.5, var_0, ( 0, 149.8, 0 ), "prop_diningplate_brokenfloral2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 1, 2, 4.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenfloral3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 2, 4.5, var_0, ( 0, 146.8, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
                case "oval_floral":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, -4, 0.5, var_0, ( 0, 205.9, 0 ), "prop_diningplate_brokenfloral1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -6, 1, 0.5, var_0, ( 0, 352.2, 0 ), "prop_diningplate_brokenfloral2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenfloral3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -2, 5, 0.5, var_0, ( 0, 102.3, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -3, 0.5, var_0, ( 0, 246.7, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
                case "oval_plain":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, -4, 0.5, var_0, ( 0, 205.9, 0 ), "prop_diningplate_brokenplain1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -6, 1, 0.5, var_0, ( 0, 352.2, 0 ), "prop_diningplate_brokenplain2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenplain3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -2, 5, 0.5, var_0, ( 0, 102.3, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -3, 0.5, var_0, ( 0, 246.7, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
                case "oval_stack":
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, -4, 0.5, var_0, ( 0, 205.9, 0 ), "prop_diningplate_brokenfloral1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -6, 1, 0.5, var_0, ( 0, 352.2, 0 ), "prop_diningplate_brokenfloral2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 4, 2, 0.5, var_0, ( 0, 150.2, 0 ), "prop_diningplate_brokenfloral3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -2, 5, 0.5, var_0, ( 0, 102.3, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -3, -3, 0.5, var_0, ( 0, 246.7, 0 ), "prop_diningplate_brokenfloral4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, 5, 2.5, var_0, ( 0, 25.9, 0 ), "prop_diningplate_brokenplain1" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 6, 0, 2.5, var_0, ( 0, 172.2, 0 ), "prop_diningplate_brokenplain2" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, -4, -1, 2.5, var_0, ( 0, 330.2, 0 ), "prop_diningplate_brokenplain3" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 2, -4, 2.5, var_0, ( 0, 282.3, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    var_5[var_5.size] = addpiece( var_2, var_3, var_4, 3, 4, 2.5, var_0, ( 0, 66.7, 0 ), "prop_diningplate_brokenplain4" );
                    var_5[var_5.size - 1].unlockpoints = "plate";
                    break;
            }

            break;
        default:
            return;
    }

    common_scripts\utility::_id_0D13( var_5, ::pieces_move, var_0.origin );

    if ( isdefined( level.breakables_peicescollide[var_1] ) && level.breakables_peicescollide[var_1] == 1 )
    {
        var_6 = var_5[0].origin[2];

        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( var_6 > var_5[var_7].origin[2] )
                var_6 = var_5[var_7].origin[2];
        }

        common_scripts\utility::_id_0D13( var_5, ::pieces_collision, var_6 );
    }
    else
    {
        wait 2;

        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( isdefined( var_5[var_7] ) )
                var_5[var_7] delete();
        }
    }
}

list_add( var_0 )
{
    if ( isdefined( level._breakable_utility_modelarray[level._breakable_utility_modelindex] ) )
        level._breakable_utility_modelarray[level._breakable_utility_modelindex] delete();

    level._breakable_utility_modelarray[level._breakable_utility_modelindex] = var_0;
    level._breakable_utility_modelindex++;

    if ( !( level._breakable_utility_modelindex < level._breakable_utility_maxnum ) )
        level._breakable_utility_modelindex = 0;
}

pieces_move( var_0 )
{
    self endon( "do not kill" );

    if ( isdefined( self.unlockpoints ) && self.unlockpoints == "bottle_bot" )
        return;

    var_1 = spawn( "script_origin", self.origin );
    self linkto( var_1 );
    var_2 = self.origin + ( randomfloat( 10 ) - 5, randomfloat( 10 ) - 5, randomfloat( 10 ) + 5 );
    var_3 = undefined;

    if ( isdefined( self.unlockpoints ) && self.unlockpoints == "bottle_top" )
    {
        var_3 = ( randomfloat( 40 ) - 20, randomfloat( 40 ) - 20, 70 + randomfloat( 15 ) );
        var_4 = 1;
        var_5 = 1;
        var_6 = 1;

        if ( randomint( 100 ) > 50 )
            var_4 = -1;

        if ( randomint( 100 ) > 50 )
            var_5 = -1;

        if ( randomint( 100 ) > 50 )
            var_6 = -1;

        var_1 rotatevelocity( ( 250 * var_4, 250 * var_5, randomfloat( 100 ) * var_6 ), 2, 0, 0.5 );
    }
    else if ( isdefined( self.unlockpoints ) && self.unlockpoints == "plate" )
    {
        var_3 = vectornormalize( var_2 - var_0 );
        var_3 = common_scripts\utility::vectorscale( var_3, 125 + randomfloat( 25 ) );

        if ( randomint( 100 ) > 50 )
            var_1 rotateroll( ( 800 + randomfloat( 4000 ) ) * -1, 5, 0, 0 );
        else
            var_1 rotateroll( 800 + randomfloat( 4000 ), 5, 0, 0 );
    }
    else
    {
        var_3 = vectornormalize( var_2 - var_0 );
        var_3 = common_scripts\utility::vectorscale( var_3, 60 + randomfloat( 50 ) );

        if ( randomint( 100 ) > 50 )
            var_1 rotateroll( ( 800 + randomfloat( 1000 ) ) * -1, 5, 0, 0 );
        else
            var_1 rotateroll( 800 + randomfloat( 1000 ), 5, 0, 0 );
    }

    var_1 movegravity( var_3, 5 );
    wait 5;

    if ( isdefined( self ) )
        self unlink();

    var_1 delete();
}

pieces_collision( var_0 )
{
    self endon( "death" );
    wait 0.1;
    var_1 = bullettrace( self.origin, self.origin - ( 0, 0, 50000 ), 0, undefined );
    var_2 = var_1["position"];

    while ( self.origin[2] > var_2[2] )
        wait 0.05;

    self unlink();
    self.origin = ( self.origin[0], self.origin[1], var_2[2] );
    self notify( "do not kill" );
    self unlink();
}

addpiece( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = 1;
    var_10 = var_0;
    var_11 = var_1;
    var_12 = var_2;
    var_10 = common_scripts\utility::vectorscale( var_10, var_4 * var_9 );
    var_11 = common_scripts\utility::vectorscale( var_11, var_3 * var_9 );
    var_12 = common_scripts\utility::vectorscale( var_12, var_5 * var_9 );
    var_13 = var_6.origin + var_10 + var_11 + var_12;
    var_14 = spawn( "script_model", var_13 );
    var_14 setmodel( var_8 );
    var_14._id_5D46 = var_9;
    var_14.angles = var_6.angles + var_7;
    list_add( var_14 );
    return var_14;
}

getfurthestent( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = distance( var_1[0] getorigin(), var_0 );
    var_3 = var_1[0];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distance( var_1[var_4] getorigin(), var_0 );

        if ( var_5 < var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

getclosestent( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = 256;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distance( var_1[var_4] getorigin(), var_0 );

        if ( var_5 >= var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

getclosestaccurantent( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = 8;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distance( var_1[var_4] getorigin(), var_0 );

        if ( var_5 >= var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

getclosestaiment( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = 1000000;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distance( var_1[var_4] getorigin(), var_0 );

        if ( var_5 >= var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

setbreakablesfx( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.breakables_fx_override ) && isdefined( level.breakables_fx_override[var_2] ) )
        var_2 = level.breakables_fx_override[var_2];

    if ( isdefined( level.breakables_sfx_override ) && isdefined( level.breakables_sfx_override[var_0] ) )
        var_3 = level.breakables_sfx_override[var_0];

    if ( isdefined( var_1 ) )
    {
        level._id_17DD[var_0][var_1] = loadfx( var_2 );
        level.breakables_sfx[var_0][var_1] = var_3;
    }
    else
    {
        level._id_17DD[var_0] = loadfx( var_2 );
        level.breakables_sfx[var_0] = var_3;
    }
}

misc_rotate_fans()
{
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_slow", "targetname" ), ::_id_366A, "veryslow" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate", "targetname" ), ::_id_366A, "slow" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_fast", "targetname" ), ::_id_366A, "fast" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_custom", "targetname" ), ::fan_blade_rotate_custom );
}

_id_366A( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_1 = 0;
    var_2 = 20000;
    var_3 = 1.0;

    if ( isdefined( self.sprint_begin ) )
        var_3 = self.sprint_begin;

    if ( var_0 == "slow" )
    {
        if ( isdefined( self.script_parentname ) && self.script_parentname == "lockedspeed" )
            var_1 = 180;
        else
            var_1 = randomfloatrange( 100 * var_3, 360 * var_3 );
    }
    else if ( var_0 == "fast" )
        var_1 = randomfloatrange( 720 * var_3, 1000 * var_3 );
    else if ( var_0 == "veryslow" )
        var_1 = randomfloatrange( 1 * var_3, 2 * var_3 );
    else
    {

    }

    if ( !isdefined( self.script_parentname ) || self.script_parentname == "lockedspeed" )
        wait(randomfloatrange( 0, 1 ));

    var_4 = self.angles;
    var_5 = anglestoright( self.angles ) * 100;
    var_5 = vectornormalize( var_5 );

    if ( isdefined( self.script_parentname ) && self.script_parentname == "reverse" )
        var_1 *= -1;

    for (;;)
    {
        var_6 = abs( vectordot( var_5, ( 1, 0, 0 ) ) );
        var_7 = abs( vectordot( var_5, ( 0, 1, 0 ) ) );
        var_8 = abs( vectordot( var_5, ( 0, 0, 1 ) ) );

        if ( var_6 > 0.9 )
            self rotatevelocity( ( var_1, 0, 0 ), var_2 );
        else if ( var_7 > 0.9 )
            self rotatevelocity( ( var_1, 0, 0 ), var_2 );
        else if ( var_8 > 0.9 )
            self rotatevelocity( ( 0, var_1, 0 ), var_2 );
        else
            self rotatevelocity( ( 0, var_1, 0 ), var_2 );

        wait(var_2);
    }
}

fan_blade_rotate_custom()
{
    for (;;)
    {
        self addyaw( 24 );
        wait 0.05;
    }
}
