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

main( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    level.level_name = var_0;

    switch ( var_0 )
    {
        case "descent":
            level._id_8F58["hint_detpack"] = &"DESCENT_HINTSTR_DETPACK";
            precachestring( level._id_8F58["hint_detpack"] );
            break;
    }

    friendly_main();
    ai_generic_main();
    misc_main();
    interactive_main();
}

ai_generic_main()
{
    var_0 = getspawnerarray();
    common_scripts\utility::_id_0D13( var_0, ::ai_special_parameters );
}

ai_special_parameters()
{
    if ( isdefined( self._not_team ) && isdefined( self._id_79E6 ) )
        thread ai_nodebeforecolor_think();

    if ( !isdefined( self._id_7A99 ) )
        return;

    var_0 = strtok( self._id_7A99, ":;, " );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( tolower( var_0[var_1] ) == "ignoreme" )
        {
            var_1++;

            if ( int( var_0[var_1] ) == 0 )
            {
                self.stopignorenotifyent = var_0[var_1];
                var_1++;
                self.stopignorenotifymsg = var_0[var_1];
                thread ai_ignoreme_think();
            }
            else
            {
                self.stopignoretime = int( var_0[var_1] );
                thread ai_ignoreme_think();
            }

            continue;
        }

        if ( tolower( var_0[var_1] ) == "setforcegoal" )
        {
            var_1++;

            if ( int( var_0[var_1] ) == 0 )
            {
                self.stopforcegoalnotifyent = var_0[var_1];
                var_1++;
                self.stopforcegoalnotifymsg = var_0[var_1];
                thread ai_setforcegoal_think();
            }
            else
            {
                self.stopforcegoaltime = int( var_0[var_1] );
                thread ai_setforcegoal_think();
            }

            continue;
        }

        if ( tolower( var_0[var_1] ) == "setforcecolor" )
        {
            var_1++;
            self.setforcecolorvalue = var_0[var_1];
            var_1++;

            if ( int( var_0[var_1] ) == 0 )
            {
                self.setforcecolornotifyent = var_0[var_1];
                var_1++;
                self.setforcecolornotifymsg = var_0[var_1];
                thread ai_setforcecolor_think();
            }
            else
            {
                self.setforcecolortime = int( var_0[var_1] );
                thread ai_setforcecolor_think();
            }

            continue;
        }

        if ( tolower( var_0[var_1] ) == "magicbulletshield" )
        {
            var_1++;

            if ( int( var_0[var_1] ) == 0 )
            {
                self.stopbulletshieldnotifyent = var_0[var_1];
                var_1++;
                self.stopbulletshieldnotifymsg = var_0[var_1];
                thread ai_magicbulletshield_think();
            }
            else
            {
                self.stopbulletshieldtime = int( var_0[var_1] );
                thread ai_magicbulletshield_think();
            }

            continue;
        }

        if ( tolower( var_0[var_1] ) == "floodspawner" )
        {
            var_1++;
            self.floodspawncount = int( var_0[var_1] );
            thread ai_floodspawn_think();
            continue;
        }

        if ( tolower( var_0[var_1] ) == "forcespawn" )
        {
            self._id_39C8 = 1;
            continue;
        }

        if ( tolower( var_0[var_1] ) == "nobackup" )
            self.no_check_wave = 1;
    }
}

ai_nodebeforecolor_think()
{
    var_0 = getnode( self._not_team, "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_1 );

        if ( maps\_utility::_id_88F1( var_1 ) )
            continue;

        break;
    }

    wait 0.05;
    var_1 _meth_81a9( var_0 );

    if ( isdefined( var_0.rank ) )
        var_1.goalradius = var_0.rank;
}

ai_floodspawn_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        self.floodspawncount--;
        break;
    }

    while ( self.floodspawncount > 0 )
    {
        var_0 waittill( "death" );
        self.count = 1;

        if ( isdefined( var_0 ) )
        {
            if ( !maps\_utility::_id_7B20() )
                wait(randomfloatrange( 5, 9 ));
        }

        for (;;)
        {
            if ( isdefined( self._id_39C8 ) )
                var_0 = self stalingradspawn();
            else
                var_0 = self dospawn();

            if ( !maps\_utility::_id_88F1( var_0 ) )
            {
                self.floodspawncount--;
                break;
            }

            wait 1;
        }
    }

    waitframe;
    self delete();
}

ai_magicbulletshield_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        if ( isdefined( self.stopbulletshieldtime ) )
            var_0.stopbulletshieldtime = self.stopbulletshieldtime;
        else if ( isdefined( self.stopbulletshieldnotifymsg ) )
        {
            var_0.stopbulletshieldnotifyent = self.stopbulletshieldnotifyent;
            var_0.stopbulletshieldnotifymsg = self.stopbulletshieldnotifymsg;
        }
        else
        {

        }

        var_0 thread ai_magicbulletshield_think2();
    }
}

ai_magicbulletshield_think2()
{
    self endon( "death" );
    self endon( "internal_stop_magic_bullet_shield" );
    thread maps\_utility::_id_58D7();

    if ( isdefined( self.stopforcegoaltime ) )
        wait(self.stopforcegoaltime);
    else if ( isdefined( self.stopforcegoalnotifymsg ) )
    {
        if ( tolower( self.stopforcegoalnotifyent ) == "self" )
            self waittill( self.stopforcegoalnotifymsg );
        else if ( tolower( self.stopforcegoalnotifyent ) == "level" )
            level waittill( self.stopforcegoalnotifymsg );
        else
        {

        }
    }
    else
        return;

    maps\_utility::_id_8EA4();
}

ai_setforcecolor_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        var_0.setforcecolorvalue = self.setforcecolorvalue;

        if ( isdefined( self.setforcecolortime ) )
            var_0.setforcecolortime = self.setforcecolortime;
        else if ( isdefined( self.setforcecolornotifymsg ) )
        {
            var_0.setforcecolornotifyent = self.setforcecolornotifyent;
            var_0.setforcecolornotifymsg = self.setforcecolornotifymsg;
        }
        else
        {

        }

        var_0 thread ai_setforcecolor_think2();
    }
}

ai_setforcecolor_think2()
{
    self endon( "death" );

    if ( isdefined( self.setforcecolortime ) )
        wait(self.setforcecolortime);
    else if ( isdefined( self.setforcecolornotifymsg ) )
    {
        if ( tolower( self.setforcecolornotifyent ) == "self" )
            self waittill( self.setforcecolornotifymsg );
        else if ( tolower( self.setforcecolornotifyent ) == "level" )
            level waittill( self.setforcecolornotifymsg );
        else
        {

        }
    }

    maps\_utility::_id_7E38( self.setforcecolorvalue );
}

ai_setforcegoal_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        if ( isdefined( self.stopforcegoaltime ) )
            var_0.stopforcegoaltime = self.stopforcegoaltime;
        else if ( isdefined( self.stopforcegoalnotifymsg ) )
        {
            var_0.stopforcegoalnotifyent = self.stopforcegoalnotifyent;
            var_0.stopforcegoalnotifymsg = self.stopforcegoalnotifymsg;
        }
        else
        {

        }

        var_0 thread ai_setforcegoal_think2();
    }
}

ai_setforcegoal_think2()
{
    self endon( "death" );
    maps\_utility::_id_7E3F();

    if ( isdefined( self.stopforcegoaltime ) )
        wait(self.stopforcegoaltime);
    else if ( isdefined( self.stopforcegoalnotifymsg ) )
    {
        if ( tolower( self.stopforcegoalnotifyent ) == "self" )
            self waittill( self.stopforcegoalnotifymsg );
        else if ( tolower( self.stopforcegoalnotifyent ) == "level" )
            level waittill( self.stopforcegoalnotifymsg );
        else
        {

        }
    }

    maps\_utility::_id_9A61();
}

ai_ignoreme_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( maps\_utility::_id_88F1( var_0 ) )
            continue;

        if ( isdefined( self.stopignoretime ) )
            var_0.stopignoretime = self.stopignoretime;
        else if ( isdefined( self.stopignorenotifymsg ) )
        {
            var_0.stopignorenotifyent = self.stopignorenotifyent;
            var_0.stopignorenotifymsg = self.stopignorenotifymsg;
        }
        else
        {

        }

        var_0 thread ai_ignoreme_think2();
    }
}

ai_ignoreme_think2()
{
    self endon( "death" );
    self.ignoretriggers = 1;

    if ( isdefined( self.stopignoretime ) )
        wait(self.stopignoretime);
    else if ( isdefined( self.stopignorenotifymsg ) )
    {
        if ( tolower( self.stopignorenotifyent ) == "self" )
            self waittill( self.stopignorenotifymsg );
        else if ( tolower( self.stopignorenotifyent ) == "level" )
            level waittill( self.stopignorenotifymsg );
        else
        {

        }
    }

    self.ignoretriggers = 0;
}

friendly_main()
{
    level.friendly_globals = spawnstruct();
    level.friendly_globals.max_num = 4;
    level.friendly_globals.wav_num = 2;
    level.friendly_globals.cur_num = 0;
    level.friendly_globals.force_this_color = [];
    var_0 = getentarray( "friendly_spawner", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::friendly_trigger_think );
    thread friendly_logic();
}

friendly_logic()
{
    for (;;)
    {
        level waittill( "friendly_globals_check_wave" );
        var_0 = level.friendly_globals.max_num - level.friendly_globals.cur_num;

        if ( var_0 < level.friendly_globals.wav_num && !( isdefined( level.fastrope_globals.heli_inflight ) && level.fastrope_globals.heli_inflight == 1 ) )
            continue;

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            var_2 = level.friendly_globals.curr_trigger friendly_cycle_spawner();
            var_2 thread friendly_spawner_think();
        }
    }
}

friendly_cycle_spawner()
{
    var_0 = self.spawner_index;

    for (;;)
    {
        self.spawner_index++;

        if ( self.spawner_array.size == self.spawner_index )
            self.spawner_index = 0;

        if ( !level.friendly_globals.force_this_color.size )
            break;

        if ( self.spawner_array[self.spawner_index] maps\_utility::_id_1CC0( level.friendly_globals.force_this_color[level.friendly_globals.force_this_color.size - 1] ) )
        {
            level.friendly_globals.force_this_color = common_scripts\utility::_id_0CF6( level.friendly_globals.force_this_color, level.friendly_globals.force_this_color[level.friendly_globals.force_this_color.size - 1] );
            break;
        }

        if ( var_0 == self.spawner_index )
        {
            self.spawner_index++;

            if ( self.spawner_array.size == self.spawner_index )
                self.spawner_index = 0;

            break;
        }
    }

    return self.spawner_array[self.spawner_index];
}

friendly_spawner_think()
{
    self endon( "death" );
    self.count = 1;
    var_0 = self dospawn();

    if ( maps\_utility::_id_88F1( var_0 ) )
        return;

    level.friendly_globals.cur_num++;

    if ( isdefined( self.script_parentname ) )
    {
        if ( self.script_parentname == "repel_friendlies" )
        {
            var_1 = common_scripts\utility::_id_40FB( self.teambalanced, "target" );
            var_0 thread friendly_repel_spawner_think( var_1 );
        }
    }

    thread friendly_spawner_death( var_0 );
    return var_0;
}

friendly_spawner_death( var_0 )
{
    self endon( "death" );
    var_0 common_scripts\utility::_id_A069( "death", "get_off_friendly_logic" );

    if ( isdefined( self.force_this_color ) )
        level.friendly_globals.force_this_color[level.friendly_globals.force_this_color.size] = self.force_this_color;

    level.friendly_globals.cur_num--;

    if ( isdefined( self.no_check_wave ) )
        return;

    level notify( "friendly_globals_check_wave" );
}
#using_animtree("generic_human");

friendly_repel_animload()
{
    if ( isdefined( level.global_repel_anims_loaded ) )
        return;

    level._id_78AC["repel_friendly"]["rappel"] = %rappel;
    level._id_78AC["repel_friendly"]["aim"][0] = %stand_aim_straight;
    level.global_repel_anims_loaded = 1;
}

friendly_repel_spawner_think( var_0 )
{
    self endon( "death" );
    self._id_0C72 = "repel_friendly";
    thread maps\_anim::_id_0BE1( self, "aim", undefined, "stop_aim" );
    wait(randomfloat( 1 ));
    self notify( "stop_aim" );
    var_0 thread maps\_anim::_id_0C24( self, "rappel" );
}

friendly_force_spawner_think( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger" );
        thread friendly_spawner_think();
    }
}

friendly_trigger_think()
{
    self.spawner_array = getentarray( self.teambalanced, "target" );
    self.spawner_index = 0;

    for ( var_0 = 0; var_0 < self.spawner_array.size; var_0++ )
    {
        if ( isdefined( self.spawner_array[var_0]._id_7A99 ) )
        {
            var_1 = strtok( self.spawner_array[var_0]._id_7A99, ":;, " );

            for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            {
                if ( tolower( var_1[var_2] ) == "force_friendlies" )
                    self.spawner_array[var_0] thread friendly_force_spawner_think( self );

                if ( tolower( var_1[var_2] ) == "force_this_color" )
                {
                    var_2++;
                    self.spawner_array[var_0].force_this_color = var_1[var_2];
                }
            }
        }

        if ( isdefined( self.spawner_array[var_0].script_parentname ) && self.spawner_array[var_0].script_parentname == "repel_friendlies" )
            friendly_repel_animload();
    }

    self.max_num = self.spawner_array.size;
    self.wav_num = 0;

    if ( isdefined( self._id_7A99 ) )
    {
        var_1 = strtok( self._id_7A99, ", " );

        switch ( var_1.size )
        {
            case 2:
                self.max_num = int( var_1[1] );
            case 1:
                self.wav_num = int( var_1[0] );
        }
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( level.friendly_globals.curr_trigger ) )
            level.friendly_globals.curr_trigger common_scripts\utility::_id_97CE();

        level.friendly_globals.curr_trigger = self;

        if ( self.max_num > 0 )
            level.friendly_globals.max_num = self.max_num;

        if ( self.wav_num > 0 )
            level.friendly_globals.wav_num = self.wav_num;

        level notify( "friendly_globals_check_wave" );
        common_scripts\utility::_id_97CC();
    }
}

interactive_main()
{
    var_0 = getentarray( "crate_breakable", "targetname" );
    var_0 thread interactive_precachefx();
    common_scripts\utility::_id_0D13( var_0, ::interactive_cratethink );
    var_1 = getentarray( "interactive_cardboard_box", "targetname" );
    var_1 thread interactive_precachefx();
    common_scripts\utility::_id_0D13( var_1, ::interactive_cardboardboxthink );
    var_2 = getentarray( "wall_breakable", "targetname" );
    var_2 thread interactive_precachefx();
    common_scripts\utility::_id_0D13( var_2, ::interactive_wallthink );
    var_3 = getentarray( "fence_shootable", "targetname" );
    var_3 thread interactive_precachefx();
    common_scripts\utility::_id_0D13( var_3, ::interactive_fencethink );
}

interactive_precachefx()
{
    if ( !self.size )
        return;

    if ( self[0].teambalanced == "crate_breakable" )
    {
        level._effect["exp_crate1"] = loadfx( "props/crateExp_dust" );
        level._effect["exp_crate2"] = loadfx( "props/crateExp_ammo" );
        return;
    }

    if ( self[0].teambalanced == "wall_breakable" )
    {
        level._effect["exp_wall"] = loadfx( "props/wallExp_concrete" );
        return;
    }

    if ( self[0].teambalanced == "fence_shootable" )
    {
        level._effect["fence"] = loadfx( "impacts/small_metalhit_1" );
        return;
    }
}

interactive_fencethink()
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3 );
        var_4 = undefined;
        var_5 = var_3 + maps\_utility::vector_multiply( var_2, 1 );
        var_6 = var_3 + maps\_utility::vector_multiply( var_2, 1024 );
        magicbullet( "mp5", var_5, var_6 );
        playfx( level._effect["fence"], var_3, maps\_utility::vector_multiply( var_2, -1 ) );
    }
}

interactive_wallthink()
{
    self setcandamage( 1 );
    var_0 = undefined;
    var_1 = undefined;

    if ( isdefined( self._not_team ) )
    {
        var_1 = getent( self._not_team, "targetname" );

        if ( isdefined( var_1.script_parentname ) && var_1.script_parentname == "doorframe" )
        {
            var_2 = self getorigin();
            var_3 = undefined;

            if ( distance( var_2, var_1.origin ) < var_1.rank )
                var_3 = var_1.origin;
            else
            {
                var_0 = anglestoforward( var_1.angles );
                var_4 = maps\_utility::vector_multiply( var_0, 88 );
                var_3 = var_1.origin + var_4;
            }

            var_0 = anglestoup( var_1.angles );
            var_4 = maps\_utility::vector_multiply( var_0, 64 );
            var_5 = var_3 + var_4;
            var_4 = maps\_utility::vector_multiply( var_0, -64 );
            var_6 = var_3 + var_4;
            var_0 = vectorfromlinetopoint( var_5, var_6, var_2 );
        }

        if ( isdefined( var_1.script_parentname ) && var_1.script_parentname == "windowframe" )
        {
            var_2 = self getorigin();
            var_3 = undefined;

            if ( distance( var_2, var_1.origin ) < var_1.rank )
                var_3 = var_1.origin;
            else
            {
                var_0 = anglestoforward( var_1.angles );
                var_4 = maps\_utility::vector_multiply( var_0, 72 );
                var_3 = var_1.origin + var_4;
            }

            var_0 = anglestoup( var_1.angles );
            var_4 = maps\_utility::vector_multiply( var_0, 64 );
            var_5 = var_3 + var_4;
            var_4 = maps\_utility::vector_multiply( var_0, -64 );
            var_6 = var_3 + var_4;
            var_0 = vectorfromlinetopoint( var_5, var_6, var_2 );
        }
        else
        {
            var_5 = var_1.origin;
            var_0 = anglestoforward( var_1.angles );
            var_0 = maps\_utility::vector_multiply( var_0, 128 );
            var_6 = var_5 + var_0;
            var_2 = self getorigin();
            var_0 = vectorfromlinetopoint( var_5, var_6, var_2 );
        }
    }

    wait 0.1;

    if ( isdefined( var_1 ) )
        var_1 delete();

    self waittill( "damage", var_7, var_8, var_9, var_2 );
    self delete();

    if ( isdefined( var_0 ) )
        playfx( level._effect["exp_wall"], var_2, var_0 );
    else
        playfx( level._effect["exp_wall"], var_2 );

    thread common_scripts\utility::_id_69C2( "stone_wall_impact_med", var_2 );
}

interactive_cardboardboxthink()
{
    self setcandamage( 1 );
    var_0 = ( 0.0, 0.0, 1.0 );
    var_1 = 5;

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( var_6 == "MOD_MELEE" || var_6 == "MOD_IMPACT" )
            continue;

        var_7 = anglestoright( vectortoangles( var_4 ) );
        var_0 = maps\_utility::vector_multiply( var_0, randomfloatrange( 400, 600 ) );
        var_8 = var_4;
        var_8 = maps\_utility::vector_multiply( var_8, 1.5 );
        var_8 += var_0;
        var_9 = maps\_utility::vector_multiply( var_5 - self.origin, 0.25 );
        self physicslaunch( self.origin + var_9, var_8 );
        break;
    }
}

interactive_cratethink()
{
    self setcandamage( 1 );

    if ( isdefined( self._not_team ) )
    {
        self.debri = getent( self._not_team, "targetname" );
        self.debri hide();
    }

    self waittill( "damage", var_0, var_1 );

    if ( isdefined( self.debri ) )
        self.debri show();

    var_2 = randomint( 5 );

    if ( var_2 > 0 )
        playfx( level._effect["exp_crate1"], self.origin );
    else
        playfx( level._effect["exp_crate2"], self.origin );

    thread common_scripts\utility::_id_69C2( "wood_crate_break_med", self.origin );
    var_3 = getentarray( "crate_breakable", "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_6 = abs( self.origin[0] - var_5.origin[0] );
        var_7 = abs( self.origin[1] - var_5.origin[1] );

        if ( var_6 <= 20 && var_7 <= 20 )
        {
            var_8 = self.origin[2] - var_5.origin[2];

            if ( var_8 <= 0 )
                var_5 notify( "damage", var_0, var_1 );
        }
    }

    self delete();
}

misc_main()
{
    var_0 = getentarray( "autosave", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::auto_save_think );
    var_1 = getentarray( "wall_breach_check", "targetname" );

    if ( var_1.size )
    {
        precacheshader( "hudStopwatch" );
        precacheshader( "hudStopwatchNeedle" );
        precacheshader( "objective" );
    }

    common_scripts\utility::_id_0D13( var_1, ::wall_breach_think );
    level._id_78AC["player_link"]["loop"][0] = %bh_fastrope_loop;
    level._id_78AC["player_link"]["land"] = %bh_fastrope_land;
}

auto_save_think()
{
    self waittill( "trigger" );

    if ( isdefined( self.script_parentname ) )
        maps\_utility::_id_1143( self.script_parentname );
    else
        maps\_utility::_id_1143( "default" );
}

wall_breach_think()
{
    var_0 = spawnstruct();
    var_0.on = self;
    var_0.off = getent( var_0.on._not_team, "targetname" );
    var_0.obj_glow = getentarray( var_0.off._not_team, "targetname" );
    var_0.obj_mdl = getentarray( var_0.obj_glow[0]._not_team, "targetname" );
    var_0.use_trig = getentarray( var_0.obj_mdl[0]._not_team, "targetname" );
    var_0.whole = getent( var_0.use_trig[0]._not_team, "targetname" );
    var_0._id_1819 = getent( var_0.whole._not_team, "targetname" );

    if ( isdefined( var_0._id_1819._not_team ) )
        var_0.chain = getent( var_0._id_1819._not_team, "targetname" );

    var_0.obj_glow[0] hide();
    var_0.obj_glow[1] hide();
    var_0.obj_mdl[0] hide();
    var_0.obj_mdl[1] hide();
    var_0._id_1819 hide();
    var_0.whole disconnectpaths();
    var_0.use_trig[0].titleunlocked = 4;
    var_0.use_trig[0] sethintstring( level._id_8F58["hint_detpack"] );
    var_0.use_trig[1] sethintstring( level._id_8F58["hint_detpack"] );
    var_0 endon( "used" );
    var_0 thread wall_breach_think2();

    for (;;)
    {
        var_0.on waittill( "trigger" );
        var_0 notify( "on" );
        var_0.obj_glow[0] show();
        var_0.obj_glow[1] show();
        var_0.off waittill( "trigger" );
        var_0 notify( "off" );
        var_0.obj_glow[0] hide();
        var_0.obj_glow[1] hide();
    }
}

wall_breach_think2()
{
    maps\_utility::_id_0D18( self.use_trig, "trigger", 0 );
    self notify( "used" );
    self.use_trig[0] common_scripts\utility::_id_97CC();
    self.use_trig[1] common_scripts\utility::_id_97CC();
    self.obj_glow[0] delete();
    self.obj_glow[1] delete();
    self.obj_mdl[0] show();
    self.obj_mdl[1] show();

    if ( isdefined( self.use_trig[0].jumptorandomtype ) || isdefined( self.use_trig[1].jumptorandomtype ) )
    {
        self.whole delete();
        self._id_1819 show();

        if ( self._id_1819.specialgrenade & 1 )
            self._id_1819 disconnectpaths();

        return;
    }

    self.obj_mdl[0] playloopsound( "bomb_tick" );
    var_0 = maps\_utility::_id_3E75( 60, self.use_trig[0].titleunlocked );
    wait(self.use_trig[0].titleunlocked * 0.5);
    thread common_scripts\utility::_id_69C2( level.level_name + "_ge1_fireinhole", self.on getorigin() );
    wait(self.use_trig[0].titleunlocked * 0.5);
    self.obj_mdl[0] stoploopsound( "bomb_tick" );
    var_0 destroy();
    playfx( level._effect["exp_breach"], self.obj_mdl[0].origin );
    thread common_scripts\utility::_id_69C2( "detpack_explo_concrete", self.obj_mdl[0].origin );
    self.use_trig[0] delete();
    self.use_trig[1] delete();
    self.whole delete();
    self.obj_mdl[0] delete();
    self.obj_mdl[1] delete();
    self._id_1819 show();

    if ( self._id_1819.specialgrenade & 1 )
        self._id_1819 disconnectpaths();

    self.on delete();
    self.off delete();

    if ( !isdefined( self.chain ) )
        return;

    wait 0.5;
    self.chain notify( "trigger" );
}
