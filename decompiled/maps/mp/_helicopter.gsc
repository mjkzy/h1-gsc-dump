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

precachehelicopter( var_0 )
{
    precachemodel( var_0 );
}

_id_6ED5()
{
    precacheitem( "cobra_ffar_mp" );
    precacheitem( "hind_ffar_mp" );
    precacheitem( "cobra_20mm_mp" );
    level._id_1FFC = [];
    level._id_1FFC["cobra_Hellfire"] = "projectile_hellfire_missile";
    precachemodel( level._id_1FFC["cobra_Hellfire"] );
    level._id_47E1["allies"]["hit"] = "h1_ks_chopper_damage_exp";
    level._id_47E1["allies"]["hitsecondary"] = "h1_ks_chopper_damage_exp";
    level._id_47E1["allies"]["damaged"] = "cobra_helicopter_damaged";
    level._id_47E1["allies"]["spinloop"] = "h1_ks_chopper_death_spin_mid";
    level._id_47E1["allies"]["spinstart"] = "cobra_helicopter_dying_layer";
    level._id_47E1["allies"]["crash"] = "h1_ks_chopper_crash_mid";
    level._id_47E1["allies"]["missilefire"] = "h1_ks_chopper_missile_shot";
    level._id_47E1["axis"]["hit"] = "h1_ks_chopper_damage_exp";
    level._id_47E1["axis"]["hitsecondary"] = "h1_ks_chopper_damage_exp";
    level._id_47E1["axis"]["damaged"] = "hind_helicopter_damaged";
    level._id_47E1["axis"]["spinloop"] = "h1_ks_chopper_death_spin_mid";
    level._id_47E1["axis"]["spinstart"] = "hind_helicopter_dying_layer";
    level._id_47E1["axis"]["crash"] = "h1_ks_chopper_crash_mid";
    level._id_47E1["axis"]["missilefire"] = "h1_ks_chopper_missile_shot";
}

heli_path_graph()
{
    var_0 = _id_3F87( "heli_start", "targetname" );
    var_1 = _id_3F87( "heli_dest", "targetname" );
    var_2 = _id_3F87( "heli_loop_start", "targetname" );
    var_3 = _id_3F87( "heli_leave", "targetname" );
    var_4 = _id_3F87( "heli_crash_start", "targetname" );

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = [];
        var_7 = var_1[var_5];
        var_8 = _id_3F86( var_7.target, "targetname" );

        for ( var_9 = 0; var_9 < var_0.size; var_9++ )
        {
            var_10 = 0;

            for ( var_11 = var_0[var_9]; isdefined( var_11.target ); var_11 = var_12 )
            {
                var_12 = _id_3F86( var_11.target, "targetname" );

                if ( var_12.origin == var_8.origin )
                {
                    var_10 = 1;
                    break;
                }

                debug_print3d_simple( "+", var_11, ( 0.0, 0.0, -10.0 ) );

                if ( isdefined( var_12.target ) )
                {
                    var_13 = _id_3F86( var_12.target, "targetname" );

                    if ( isdefined( var_13 ) && isdefined( var_13.origin ) )
                        _id_26AB( var_12.origin, var_13.origin, ( 0.25, 0.5, 0.25 ) );
                }

                if ( isdefined( var_11.script_delay ) )
                    debug_print3d_simple( "Wait: " + var_11.script_delay, var_11, ( 0.0, 0.0, 10.0 ) );
            }

            if ( var_10 )
                var_6[var_6.size] = _id_3F86( var_0[var_9].target, "targetname" );
        }

        level.heli_paths[level.heli_paths.size] = var_6;
    }

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_14 = _id_3F86( var_2[var_5].target, "targetname" );
        level.heli_loop_paths[level.heli_loop_paths.size] = var_14;
    }

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        level.heli_leavenodes[level.heli_leavenodes.size] = var_3[var_5];

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( isdefined( var_4[var_5].target ) )
            var_15 = _id_3F86( var_4[var_5].target, "targetname" );
        else
            var_15 = var_4[var_5];

        level.heli_crash_paths[level.heli_crash_paths.size] = var_15;
    }
}

_id_3F86( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return common_scripts\utility::_id_40FB( var_0, var_1 );
}

_id_3F87( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_40FD( var_0, var_1 );
    var_3 = getentarray( var_0, var_1 );

    if ( var_3.size > 0 )
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_3 );

    return var_2;
}

init()
{
    var_0 = _id_3F87( "heli_start", "targetname" );
    var_1 = _id_3F87( "heli_loop_start", "targetname" );

    if ( !var_0.size && !var_1.size )
        return;

    _id_6ED5();
    precachehelicopter( "vehicle_cobra_helicopter_fly" );
    precachehelicopter( "h1_vehicle_mi24_hind" );
    level.chopper = undefined;
    level.heli_paths = [];
    level.heli_loop_paths = [];
    level.heli_leavenodes = [];
    level.heli_crash_paths = [];
    thread heli_update_global_dvars();
    level._id_1D55["explode"]["death"] = loadfx( "fx/explosions/helicopter_explosion_cobra" );
    level._id_1D55["explode"]["large"] = loadfx( "fx/explosions/aerial_explosion_large" );
    level._id_1D55["explode"]["medium"] = loadfx( "fx/explosions/aerial_explosion" );
    level._id_1D55["smoke"]["trail"] = loadfx( "vfx/trail/trail_smk_white_heli" );
    level._id_1D55["fire"]["trail"]["medium"] = loadfx( "vfx/trail/trail_smk_black_heli" );
    level._id_1D55["fire"]["trail"]["large"] = loadfx( "vfx/trail/trail_fire_smoke_l" );
    heli_path_graph();
}

heli_update_global_dvars()
{
    level.heli_loopmax = heli_get_dvar_int( "scr_heli_loopmax", "1" );
    level.heli_missile_rof = heli_get_dvar_int( "scr_heli_missile_rof", "5" );
    level.heli_armor = heli_get_dvar_int( "scr_heli_armor", "500" );
    level.heli_rage_missile = heli_get_dvar( "scr_heli_rage_missile", "5" );
    level._id_47D4 = heli_get_dvar_int( "scr_heli_maxhealth", "1100" );
    level.heli_missile_max = heli_get_dvar_int( "scr_heli_missile_max", "3" );
    level.heli_dest_wait = heli_get_dvar_int( "scr_heli_dest_wait", "2" );
    level.heli_debug = heli_get_dvar_int( "scr_heli_debug", "0" );
    level._id_47FA = heli_get_dvar( "scr_heli_targeting_delay", "0.5" );
    level.heli_turretreloadtime = heli_get_dvar( "scr_heli_turretReloadTime", "1.5" );
    level.heli_turretclipsize = heli_get_dvar_int( "scr_heli_turretClipSize", "40" );
    level.heli_visual_range = heli_get_dvar_int( "scr_heli_visual_range", "3500" );
    level.heli_health_degrade = heli_get_dvar_int( "scr_heli_health_degrade", "0" );
    level.heli_target_spawnprotection = heli_get_dvar_int( "scr_heli_target_spawnprotection", "5" );
    level.heli_turret_engage_dist = heli_get_dvar_int( "scr_heli_turret_engage_dist", "1000" );
    level.heli_missile_engage_dist = heli_get_dvar_int( "scr_heli_missile_engage_dist", "2000" );
    level.heli_missile_regen_time = heli_get_dvar( "scr_heli_missile_regen_time", "10" );
    level.heli_turret_spinup_delay = heli_get_dvar( "scr_heli_turret_spinup_delay", "0.75" );
    level.heli_target_recognition = heli_get_dvar( "scr_heli_target_recognition", "0.5" );
    level.heli_missile_friendlycare = heli_get_dvar_int( "scr_heli_missile_friendlycare", "256" );
    level.heli_missile_target_cone = heli_get_dvar( "scr_heli_missile_target_cone", "0.3" );
    level.heli_armor_bulletdamage = heli_get_dvar( "scr_heli_armor_bulletdamage", "0.3" );
    level._id_47A7 = heli_get_dvar( "scr_heli_attract_strength", "1000" );
    level._id_47A6 = heli_get_dvar( "scr_heli_attract_range", "4096" );
}

heli_get_dvar_int( var_0, var_1 )
{
    return int( var_1 );
}

heli_get_dvar( var_0, var_1 )
{
    return float( var_1 );
}

spawn_helicopter( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnhelicopter( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_0E54 = missile_createattractorent( var_5, level._id_47A7, level._id_47A6 );
    return var_5;
}

heli_think( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1.origin;
    var_5 = var_1.angles;

    if ( var_2 == "allies" )
    {
        var_6 = "vehicle_cobra_helicopter_fly";

        if ( isdefined( level.heli_model_allies_override ) )
            var_6 = level.heli_model_allies_override;

        var_7 = spawn_helicopter( var_0, var_4, var_5, "cobra_mp", var_6 );
        var_7 playloopsound( "h1_ks_chopper_cobra_mid" );
    }
    else
    {
        var_6 = "h1_vehicle_mi24_hind";

        if ( isdefined( level.heli_model_axis_override ) )
            var_6 = level.heli_model_axis_override;

        var_7 = spawn_helicopter( var_0, var_4, var_5, "hind_mp", var_6 );
        var_7 playloopsound( "h1_ks_chopper_hind_mid" );
    }

    var_7.requireddeathcount = var_0.deaths;
    var_7.team = var_2;
    var_7.pers["team"] = var_2;
    var_7.owner = var_0;
    var_7 setotherent( var_0 );
    var_7 thread _id_47BA();
    level.chopper = var_7;
    var_7.reached_dest = 0;
    var_7.maxhealth = level._id_47D4;
    var_7.waittime = level.heli_dest_wait;
    var_7.loopcount = 0;
    var_7.evasive = 0;
    var_7.health_bulletdamageble = level.heli_armor;
    var_7.health_evasive = level.heli_armor;
    var_7.health_low = level._id_47D4 * 0.8;
    var_7._id_91CC = level._id_47FA;
    var_7._id_6F8C = undefined;
    var_7._id_7BFC = undefined;
    var_7.attacker = undefined;
    var_7.missile_ammo = level.heli_missile_max;
    var_7._id_2525 = "ok";
    var_7.lastrocketfiretime = -1;
    var_7._id_4818 = "helicopter";
    var_7 common_scripts\utility::_id_5923( var_2 );
    var_7 thread heli_fly( var_1 );
    var_7 thread _id_47B1();
    var_7 thread heli_health();
    var_7 thread attack_targets();
    var_7 thread heli_targeting();
    var_7 thread heli_missile_regen();
}

aud_chopper_full_volume( var_0 )
{

}

_id_47BA()
{
    common_scripts\utility::_id_A069( "death", "crashing", "leaving" );
    level notify( "helicopter gone" );
}

heli_missile_regen()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        debug_print3d( "Missile Ammo: " + self.missile_ammo, ( 0.5, 0.5, 1.0 ), self, ( 0.0, 0.0, -100.0 ), 0 );

        if ( self.missile_ammo >= level.heli_missile_max )
            self waittill( "missile fired" );
        else if ( self._id_2525 == "heavy smoke" )
            wait(level.heli_missile_regen_time / 4);
        else if ( self._id_2525 == "light smoke" )
            wait(level.heli_missile_regen_time / 2);
        else
            wait(level.heli_missile_regen_time);

        if ( self.missile_ammo < level.heli_missile_max )
            self.missile_ammo++;
    }
}

heli_targeting()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        var_0 = [];
        var_1 = level.players;

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( cantarget_turret( var_3 ) )
            {
                if ( isdefined( var_3 ) )
                    var_0[var_0.size] = var_3;

                continue;
            }

            continue;
        }

        if ( var_0.size == 0 )
        {
            self._id_6F8C = undefined;
            self._id_7BFC = undefined;
            debug_print_target();
            wait(self._id_91CC);
            continue;
        }
        else if ( var_0.size == 1 )
        {
            update_player_threat( var_0[0] );
            self._id_6F8C = var_0[0];
            self notify( "primary acquired" );
            self._id_7BFC = undefined;
            debug_print_target();
            wait(self._id_91CC);
            continue;
        }
        else if ( var_0.size > 1 )
            assigntargets( var_0 );

        debug_print_target();
    }
}

cantarget_turret( var_0 )
{
    var_1 = 1;

    if ( !isalive( var_0 ) || var_0.sessionstate != "playing" )
        return 0;

    if ( distance( var_0.origin, self.origin ) > level.heli_visual_range )
        return 0;

    if ( !isdefined( var_0.pers["team"] ) )
        return 0;

    if ( level.teambased && var_0.pers["team"] == self.team )
        return 0;

    if ( isdefined( self.owner ) && var_0 == self.owner )
        return 0;

    if ( var_0.pers["team"] == "spectator" )
        return 0;

    if ( isdefined( var_0.spawntime ) && ( gettime() - var_0.spawntime ) / 1000 <= level.heli_target_spawnprotection )
        return 0;

    var_2 = self.origin + ( 0.0, 0.0, -160.0 );
    var_3 = anglestoforward( self.angles );
    var_4 = var_2 + 144 * var_3;

    if ( var_0 _meth_81db( var_4, self, 1 ) < level.heli_target_recognition )
        return 0;

    return var_1;
}

assigntargets( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        update_player_threat( var_0[var_1] );

    var_2 = 0;
    var_3 = 0;
    var_4 = undefined;
    var_5 = undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].threatlevel >= var_2 )
        {
            var_2 = var_0[var_1].threatlevel;
            var_4 = var_0[var_1];
        }
    }

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].threatlevel >= var_3 && var_0[var_1] != var_4 )
        {
            var_3 = var_0[var_1].threatlevel;
            var_5 = var_0[var_1];
        }
    }

    self._id_6F8C = var_4;
    self notify( "primary acquired" );
    self._id_7BFC = var_5;
    self notify( "secondary acquired" );
    wait(self._id_91CC);
}

update_player_threat( var_0 )
{
    var_0.threatlevel = 0;
    var_1 = distance( var_0.origin, self.origin );
    var_0.threatlevel += ( level.heli_visual_range - var_1 ) / level.heli_visual_range * 100;

    if ( isdefined( self.attacker ) && var_0 == self.attacker )
        var_0.threatlevel += 100;

    if ( isdefined( var_0.pers["class"] ) && ( var_0.pers["class"] == "CLASS_ASSAULT" || var_0.pers["class"] == "CLASS_RECON" ) )
        var_0.threatlevel += 200;

    var_0.threatlevel += var_0.score * 4;

    if ( isdefined( var_0.antithreat ) )
        var_0.threatlevel -= var_0.antithreat;

    if ( var_0.threatlevel <= 0 )
        var_0.threatlevel = 1;
}

_id_47DB()
{
    self cleartargetyaw();
    self cleargoalyaw();
    self vehicle_setspeed( 60, 25 );
    self setyawspeed( 75, 45, 45 );
    self setmaxpitchroll( 30, 30 );
    self neargoalnotifydist( 256 );
    self setturningability( 0.9 );
}

heli_wait( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "evasive" );
    wait(var_0);
}

_id_47B1()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self.damagetaken = 0;
    self._id_0E31 = [];

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isdefined( var_1 ) || !isplayer( var_1 ) )
            continue;

        var_10 = maps\mp\gametypes\_weapons::_id_3AA6( self.owner, var_1 );

        if ( !var_10 )
            continue;

        if ( isdefined( self.owner ) && var_1 == self.owner )
            continue;

        if ( level.teambased )
            var_11 = isdefined( var_1.pers["team"] ) && var_1.pers["team"] != self.team;
        else
            var_11 = 1;

        if ( !var_11 )
            continue;

        var_1 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( 0 );
        self.attacker = var_1;
        maps\mp\gametypes\_hardpoints::_id_539C( var_1, var_9, self );

        if ( maps\mp\gametypes\_damage::_id_5159( var_1 ) )
            self._id_0E31[self._id_0E31.size] = var_1;

        if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
        {
            if ( self.damagetaken >= self.health_bulletdamageble )
                self.damagetaken += var_0;
            else
                self.damagetaken += var_0 * level.heli_armor_bulletdamage;
        }
        else
            self.damagetaken += var_0;

        if ( self.damagetaken > self.maxhealth )
        {
            var_1 notify( "destroyed_helicopter" );
            maps\mp\gametypes\_damage::_id_64B6( var_1, var_9, var_4, var_0, "helicopter_destroyed", undefined, "callout_destroyed_helicopter", 1 );
            return;
        }
    }
}

heli_health()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self._id_2525 = "ok";
    self._id_55F9 = "ok";
    self setdamagestage( 3 );

    for (;;)
    {
        if ( self.health_bulletdamageble > self.health_low )
        {
            if ( self.damagetaken >= self.health_bulletdamageble )
                self._id_2525 = "heavy smoke";
            else if ( self.damagetaken >= self.health_low )
                self._id_2525 = "light smoke";
        }
        else if ( self.damagetaken >= self.health_low )
            self._id_2525 = "heavy smoke";
        else if ( self.damagetaken >= self.health_bulletdamageble )
            self._id_2525 = "light smoke";

        if ( self._id_2525 == "light smoke" && self._id_55F9 != "light smoke" )
        {
            self setdamagestage( 2 );
            self._id_55F9 = self._id_2525;
        }

        if ( self._id_2525 == "heavy smoke" && self._id_55F9 != "heavy smoke" )
        {
            self setdamagestage( 1 );
            self notify( "stop body smoke" );
            self._id_55F9 = self._id_2525;
        }

        if ( self._id_2525 == "heavy smoke" )
        {
            self.damagetaken += level.heli_health_degrade;
            level.heli_rage_missile = 20;
        }

        if ( self._id_2525 == "light smoke" )
        {
            self.damagetaken += level.heli_health_degrade / 2;
            level.heli_rage_missile = 10;
        }

        if ( self.damagetaken >= self.health_evasive )
        {
            if ( !self.evasive )
                thread heli_evasive();
        }

        if ( self.damagetaken > self.maxhealth )
        {
            self setdamagestage( 0 );
            thread _id_47AB();
        }

        if ( self.damagetaken <= level.heli_armor )
            debug_print3d_simple( "Armor: " + level.heli_armor - self.damagetaken, self, ( 0.0, 0.0, 100.0 ), 20 );
        else
            debug_print3d_simple( "Health: " + self.maxhealth - self.damagetaken, self, ( 0.0, 0.0, 100.0 ), 20 );

        wait 1;
    }
}

heli_evasive()
{
    self notify( "evasive" );
    self.evasive = 1;
    var_0 = level.heli_loop_paths[0];
    thread heli_fly( var_0 );
}

_id_47AB()
{
    self notify( "crashing" );
    thread heli_fly( level.heli_crash_paths[0] );
    thread _id_47E2( 180 );
    self waittill( "path start" );
    playfxontag( level._id_1D55["explode"]["large"], self, "tag_engine_left" );
    self playsound( level._id_47E1[self.team]["hitsecondary"] );
    thread trail_fx( level._id_1D55["fire"]["trail"]["large"], "tag_engine_left", "stop body fire" );
    self waittill( "destination reached" );
    thread _id_47BB();
}

_id_47E2( var_0 )
{
    self endon( "death" );
    playfxontag( level._id_1D55["explode"]["medium"], self, "tail_rotor_jnt" );
    self playsound( level._id_47E1[self.team]["hit"] );
    thread _id_8A61();
    thread trail_fx( level._id_1D55["smoke"]["trail"], "tail_rotor_jnt", "stop tail smoke" );
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self settargetyaw( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

_id_8A61()
{
    self endon( "death" );
    wait 0.25;
    self stoploopsound();
    wait 0.05;
    self playloopsound( level._id_47E1[self.team]["spinloop"] );
    wait 0.05;
}

trail_fx( var_0, var_1, var_2 )
{
    self notify( var_2 );
    self endon( var_2 );
    self endon( "death" );

    for (;;)
    {
        playfxontag( var_0, self, var_1 );
        wait 0.05;
    }
}

_id_47BB()
{
    self notify( "death" );
    var_0 = self.origin + ( 0.0, 0.0, 100.0 ) - self.origin;
    playfx( level._id_1D55["explode"]["death"], self.origin, var_0 );
    self playsound( level._id_47E1[self.team]["crash"] );
    level.chopper = undefined;
    self delete();
}

_id_47CD()
{
    self notify( "desintation reached" );
    self notify( "leaving" );
    self scalevolume( 0, 5 );
    var_0 = randomint( level.heli_leavenodes.size );
    var_1 = level.heli_leavenodes[var_0];
    _id_47DB();
    self vehicle_setspeed( 100, 45 );
    self setgoalpos( var_1.origin, 1 );
    self waittillmatch( "goal" );
    self notify( "death" );
    level.chopper = undefined;
    self delete();
}

heli_fly( var_0 )
{
    self endon( "death" );
    self notify( "flying" );
    self endon( "flying" );
    self endon( "abandoned" );
    self.reached_dest = 0;
    _id_47DB();
    var_1 = self.origin;
    wait 2;

    while ( isdefined( var_0.target ) )
    {
        maps\mp\gametypes\_hostmigration::_id_A0DD();
        var_2 = _id_3F86( var_0.target, "targetname" );
        var_1 = var_2.origin + ( 0.0, 0.0, 30.0 );

        if ( isdefined( var_0._id_7930 ) && isdefined( var_0._id_7929 ) )
        {
            var_3 = var_0._id_7930;
            var_4 = var_0._id_7929;
        }
        else
        {
            var_3 = 30 + randomint( 20 );
            var_4 = 15 + randomint( 15 );
        }

        if ( !isdefined( var_2.target ) )
            var_5 = 1;
        else
            var_5 = 0;

        _id_26AB( var_0.origin, var_2.origin, ( 1.0, 0.5, 0.5 ), 200 );

        if ( self._id_2525 == "heavy smoke" || self._id_2525 == "light smoke" )
        {
            self vehicle_setspeed( var_3, var_4 );
            self setgoalpos( var_1, var_5 );
            self waittill( "near_goal" );
            self notify( "path start" );
        }
        else
        {
            if ( isdefined( var_2.script_delay ) )
                var_5 = 1;

            self vehicle_setspeed( var_3, var_4 );
            self setgoalpos( var_1, var_5 );

            if ( !isdefined( var_2.script_delay ) )
            {
                self waittill( "near_goal" );
                self notify( "path start" );
            }
            else
            {
                self setgoalyaw( var_2.angles[1] );
                self waittillmatch( "goal" );
                heli_wait( var_2.script_delay );
            }
        }

        for ( var_6 = 0; var_6 < level.heli_loop_paths.size; var_6++ )
        {
            if ( level.heli_loop_paths[var_6].origin == var_2.origin )
                self.loopcount++;
        }

        if ( self.loopcount >= level.heli_loopmax )
        {
            thread _id_47CD();
            return;
        }

        var_0 = var_2;
    }

    self setgoalyaw( var_0.angles[1] );
    self.reached_dest = 1;
    self notify( "destination reached" );
    heli_wait( self.waittime );

    if ( isdefined( self ) )
        thread heli_evasive();
}

_id_37BA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_3 = undefined;
    var_4 = undefined;
    var_5 = "cobra_20mm_mp";
    var_6 = [];

    switch ( var_0 )
    {
        case "ffar":
            if ( self.team == "allies" )
                var_3 = "cobra_ffar_mp";
            else
                var_3 = "hind_ffar_mp";

            var_6[0] = "tag_store_r_2";
            break;
        default:
            break;
    }

    var_4 = weaponfiretime( var_3 );
    self setvehweapon( var_3 );
    var_7 = -1;

    for ( var_8 = 0; var_8 < var_1; var_8++ )
    {
        var_7++;

        if ( var_7 >= var_6.size )
            var_7 = 0;

        if ( isdefined( var_2 ) )
            var_9 = self fireweapon( var_6[var_7], var_2 );
        else
            var_9 = self fireweapon( var_6[var_7] );

        self.lastrocketfiretime = gettime();

        if ( var_8 < var_1 - 1 )
            wait(var_4);
    }
}

check_owner()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.pers["team"] ) || self.owner.pers["team"] != self.team )
    {
        self notify( "abandoned" );
        thread _id_47CD();
    }
}

attack_targets()
{
    thread attack_primary();
    thread attack_secondary();
}

attack_secondary()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        if ( isdefined( self._id_7BFC ) )
        {
            self._id_7BFC.antithreat = undefined;
            self.missiletarget = self._id_7BFC;
            var_0 = 0;

            while ( isdefined( self.missiletarget ) && isalive( self.missiletarget ) )
            {
                if ( missile_target_sight_check( self.missiletarget ) )
                    thread missile_support( self.missiletarget, level.heli_missile_rof, 1, undefined );
                else
                    break;

                var_0 += 100;
                self.missiletarget.antithreat = var_0;
                self waittill( "missile ready" );

                if ( !isdefined( self._id_7BFC ) || isdefined( self._id_7BFC ) && self.missiletarget != self._id_7BFC )
                    break;
            }

            if ( isdefined( self.missiletarget ) )
                self.missiletarget.antithreat = undefined;
        }

        self waittill( "secondary acquired" );
        check_owner();
    }
}

missile_target_sight_check( var_0 )
{
    var_1 = vectornormalize( var_0.origin - self.origin );
    var_2 = anglestoforward( self.angles );
    var_3 = vectornormalize( var_2 );
    var_4 = vectordot( var_1, var_3 );

    if ( var_4 >= level.heli_missile_target_cone )
    {
        debug_print3d_simple( "Missile sight: " + var_4, self, ( 0.0, 0.0, -40.0 ), 40 );
        return 1;
    }

    return 0;
}

missile_support( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    self.turret_giveup = 0;

    if ( !var_2 )
    {
        wait(var_1);
        self.turret_giveup = 1;
        self notify( "give up" );
    }

    if ( isdefined( var_0 ) )
    {
        if ( level.teambased )
        {
            for ( var_4 = 0; var_4 < level.players.size; var_4++ )
            {
                var_5 = level.players[var_4];

                if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == self.team && distance( var_5.origin, var_0.origin ) <= level.heli_missile_friendlycare )
                {
                    debug_print3d_simple( "Missile omitted due to nearby friendly", self, ( 0.0, 0.0, -80.0 ), 40 );
                    self notify( "missile ready" );
                    return;
                }
            }
        }
        else
        {
            var_5 = self.owner;

            if ( isdefined( var_5 ) && isdefined( var_5.pers["team"] ) && var_5.pers["team"] == self.team && distance( var_5.origin, var_0.origin ) <= level.heli_missile_friendlycare )
            {
                debug_print3d_simple( "Missile omitted due to nearby friendly", self, ( 0.0, 0.0, -80.0 ), 40 );
                self notify( "missile ready" );
                return;
            }
        }
    }

    if ( self.missile_ammo > 0 && isdefined( var_0 ) )
    {
        _id_37BA( "ffar", 1, var_0 );
        self.missile_ammo--;
        self notify( "missile fired" );
    }
    else
        return;

    if ( var_2 )
    {
        wait(var_1);
        self notify( "missile ready" );
    }
}

attack_primary()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        if ( isdefined( self._id_6F8C ) )
        {
            self._id_6F8C.antithreat = undefined;
            self.turrettarget = self._id_6F8C;
            var_0 = 0;
            var_1 = undefined;

            while ( isdefined( self.turrettarget ) && isalive( self.turrettarget ) )
            {
                self setturrettargetent( self.turrettarget, ( 0.0, 0.0, 40.0 ) );

                if ( missile_target_sight_check( self.turrettarget ) )
                    thread missile_support( self.turrettarget, 10 / level.heli_rage_missile, 0, "turret on target" );

                self waittill( "turret_on_target" );
                self notify( "turret on target" );
                thread turret_target_flag( self.turrettarget );
                wait(level.heli_turret_spinup_delay);
                var_2 = weaponfiretime( "cobra_20mm_mp" );
                self setvehweapon( "cobra_20mm_mp" );

                for ( var_3 = 0; var_3 < level.heli_turretclipsize; var_3++ )
                {
                    if ( isdefined( self.turrettarget ) && isdefined( self._id_6F8C ) )
                    {
                        if ( self._id_6F8C != self.turrettarget )
                            self setturrettargetent( self._id_6F8C, ( 0.0, 0.0, 40.0 ) );
                    }
                    else if ( isdefined( self.targetlost ) && self.targetlost && isdefined( self.turret_last_pos ) )
                        self _meth_825d( self.turret_last_pos );
                    else
                        self clearturrettargetent();

                    if ( gettime() != self.lastrocketfiretime )
                    {
                        self setvehweapon( "cobra_20mm_mp" );
                        var_4 = self fireweapon( "tag_flash" );
                    }

                    if ( var_3 < level.heli_turretclipsize - 1 )
                        wait(var_2);
                }

                self notify( "turret reloading" );
                wait(level.heli_turretreloadtime);

                if ( isdefined( self.turrettarget ) && isalive( self.turrettarget ) )
                {
                    var_0 += 100;
                    self.turrettarget.antithreat = var_0;
                }

                if ( !isdefined( self._id_6F8C ) || isdefined( self.turrettarget ) && isdefined( self._id_6F8C ) && self._id_6F8C != self.turrettarget )
                    break;
            }

            if ( isdefined( self.turrettarget ) )
                self.turrettarget.antithreat = undefined;
        }

        self waittill( "primary acquired" );
        check_owner();
    }
}

turret_target_flag( var_0 )
{
    self notify( "flag check is running" );
    self endon( "flag check is running" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "turret reloading" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    self.targetlost = 0;
    self.turret_last_pos = undefined;

    while ( isdefined( var_0 ) )
    {
        var_1 = self.origin + ( 0.0, 0.0, -160.0 );
        var_2 = anglestoforward( self.angles );
        var_3 = var_1 + 144 * var_2;
        var_4 = var_0 _meth_81db( var_3, self, 1 );

        if ( var_4 < level.heli_target_recognition )
            break;

        wait 0.05;
    }

    if ( isdefined( var_0 ) && isdefined( var_0.origin ) )
    {
        self.turret_last_pos = var_0.origin + ( 0.0, 0.0, 40.0 );
        self _meth_825d( self.turret_last_pos );
        debug_print3d_simple( "Turret target lost at: " + self.turret_last_pos, self, ( 0.0, 0.0, -70.0 ), 60 );
        self.targetlost = 1;
    }
    else
    {
        self.targetlost = undefined;
        self.turret_last_pos = undefined;
    }
}

debug_print_target()
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
    {
        if ( isdefined( self._id_6F8C ) && isdefined( self._id_6F8C.threatlevel ) )
            var_0 = "Primary: " + self._id_6F8C.name + " : " + self._id_6F8C.threatlevel;
        else
            var_0 = "Primary: ";

        if ( isdefined( self._id_7BFC ) && isdefined( self._id_7BFC.threatlevel ) )
            var_1 = "Secondary: " + self._id_7BFC.name + " : " + self._id_7BFC.threatlevel;
        else
            var_1 = "Secondary: ";

        var_2 = int( self._id_91CC * 20 ) + 1;
        thread draw_text( var_0, ( 1.0, 0.6, 0.6 ), self, ( 0.0, 0.0, 40.0 ), var_2 );
        thread draw_text( var_1, ( 1.0, 0.6, 0.6 ), self, ( 0.0, 0.0, 0.0 ), var_2 );
    }
}

debug_print3d( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
        thread draw_text( var_0, var_1, var_2, var_3, var_4 );
}

debug_print3d_simple( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
    {
        if ( isdefined( var_3 ) )
            thread draw_text( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, var_3 );
        else
            thread draw_text( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, 0 );
    }
}

_id_26AB( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 && !isdefined( var_3 ) )
        thread _id_2DB7( var_0, var_1, var_2 );
    else if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
        thread _id_2DB7( var_0, var_1, var_2, var_3 );
}

draw_text( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 == 0 )
    {
        while ( isdefined( var_2 ) )
            wait 0.05;
    }
    else
    {
        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            if ( !isdefined( var_2 ) )
                break;

            wait 0.05;
        }
    }
}

_id_2DB7( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        for ( var_4 = 0; var_4 < var_3; var_4++ )
            wait 0.05;
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}
