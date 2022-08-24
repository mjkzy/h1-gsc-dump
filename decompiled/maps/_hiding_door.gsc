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

init_hiding_door()
{
    common_scripts\utility::_id_76B9( "hiding_door_spawner", ::hiding_door_spawner );
}

hiding_door_spawner()
{
    var_0 = undefined;

    if ( isdefined( self._id_7A99 ) && common_scripts\utility::_id_3839( self._id_7A99 ) )
        var_0 = self._id_7A99;

    var_1 = undefined;

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "open_door_when_spawner_deleted" )
        var_1 = self._id_7A99;

    var_2 = getentarray( "hiding_door_guy_org", "targetname" );
    var_3 = common_scripts\utility::_id_3F33( self.origin, var_2 );
    var_3.targetname = undefined;
    var_4 = getentarray( var_3.target, "targetname" );
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_3._id_7A26 ) )
        var_7 = var_3 common_scripts\utility::_id_3DBC();

    if ( var_4.size == 1 )
        var_5 = var_4[0];
    else
    {
        foreach ( var_9 in var_4 )
        {
            if ( var_9.code_classname == "script_brushmodel" )
            {
                var_6 = var_9;
                continue;
            }

            if ( var_9.code_classname == "script_model" )
                var_5 = var_9;
        }
    }

    var_11 = getent( var_5.target, "targetname" );
    var_12 = undefined;

    if ( isdefined( var_11.target ) )
        var_12 = getent( var_11.target, "targetname" );

    if ( isdefined( var_12 ) )
    {
        if ( isdefined( var_0 ) )
            var_12 thread toggle_pushplayerclip_with_flag( var_0 );

        var_3 thread hiding_door_guy_pushplayer( var_12 );

        if ( !isdefined( level._hiding_door_pushplayer_clips ) )
            level._hiding_door_pushplayer_clips = [];

        level._hiding_door_pushplayer_clips[level._hiding_door_pushplayer_clips.size] = var_12;
    }

    var_5 delete();
    var_13 = maps\_utility::_id_88D1( "hiding_door" );
    var_3 thread maps\_anim::_id_0BC7( var_13, "fire_3" );

    if ( isdefined( var_6 ) )
    {
        var_6 linkto( var_13, "door_hinge_jnt" );
        var_13 hide();
    }

    if ( isdefined( var_11 ) )
    {
        var_11 linkto( var_13, "door_hinge_jnt" );
        var_11 disconnectpaths();
    }

    var_14 = undefined;

    if ( isdefined( self.target ) )
    {
        var_14 = getent( self.target, "targetname" );

        if ( !issubstr( var_14.classname, "trigger" ) )
            var_14 = undefined;
    }

    if ( !isdefined( self._id_79DA ) && !isdefined( var_14 ) )
    {
        var_15 = 200;

        if ( isdefined( self.radius ) )
            var_15 = self.radius;

        var_14 = spawn( "trigger_radius", var_3.origin, 0, var_15, 48 );
    }

    if ( isdefined( var_7 ) )
        badplace_brush( var_7 getentitynumber(), 0, var_7, "allies" );

    maps\_utility::_id_0798( ::hiding_door_guy, var_3, var_14, var_13, var_11, var_7 );

    if ( isdefined( var_1 ) )
        thread hiding_door_spawner_cleanup( var_3, var_13, var_11, var_7 );
}

hiding_door_guy( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = hiding_door_starts_open( var_0 );
    self._id_0C72 = "hiding_door_guy";
    self endon( "death" );
    self endon( "damage" );
    self.grenadeammo = 2;
    maps\_utility::_id_7E06( "death_2" );
    self.allowdeath = 1;
    self.health = 50000;
    var_6 = [];
    var_6[var_6.size] = var_2;
    var_6[var_6.size] = self;
    thread hiding_door_guy_cleanup( var_0, self, var_2, var_3, var_4 );
    thread hiding_door_death( var_2, var_0, self, var_3, var_4 );

    if ( var_5 )
        var_0 thread maps\_anim::_id_0BDD( var_6, "idle" );
    else
        var_0 thread maps\_anim::_id_0BC5( var_6, "fire_3" );

    if ( isdefined( var_1 ) )
    {
        wait 0.05;
        var_1 waittill( "trigger" );
    }
    else
        common_scripts\utility::_id_384A( self._id_79DA );

    if ( var_5 )
    {
        var_0 notify( "stop_loop" );
        var_0 maps\_anim::_id_0C18( var_6, "close" );
    }

    var_7 = 0;
    var_8 = 0;

    for (;;)
    {
        var_9 = level.player;

        if ( isdefined( self.enemy ) )
            var_9 = self.enemy;

        var_10 = hiding_door_get_enemy_direction( var_2.angles, self.origin, var_9.origin );

        if ( player_entered_backdoor( var_10 ) )
        {
            if ( quit_door_behavior() )
                return;
        }

        if ( var_7 >= 2 )
        {
            if ( quit_door_behavior( 1 ) )
                return;
        }

        var_11 = undefined;

        if ( var_10 == "left" || var_10 == "front" )
            var_11 = "fire_3";
        else if ( var_10 == "right" )
        {
            var_11 = "fire_1";

            if ( common_scripts\utility::_id_2006() )
                var_11 = "fire_2";
        }
        else
        {
            var_0 maps\_anim::_id_0C18( var_6, "open" );
            var_0 maps\_anim::_id_0C18( var_6, "close" );
            var_7++;
            continue;
        }

        if ( hiding_door_guy_should_charge( var_10, var_9, var_8 ) )
        {
            var_11 = "jump";

            if ( common_scripts\utility::_id_2006() )
            {
                if ( self _meth_81c7( animscripts\utility::_id_3EFC( level._id_78AC[self._id_0C72]["kick"] ) ) )
                    var_11 = "kick";
            }

            thread hiding_door_death_door_connections( var_3, var_4 );
            var_0 notify( "push_player" );
            self notify( "charge" );
            self.allowdeath = 1;
            self.health = 100;
            maps\_utility::_id_1EAB();
            var_0 maps\_anim::_id_0C18( var_6, var_11 );
            quit_door_behavior();
            return;
        }

        if ( hiding_door_guy_should_throw_grenade( var_10, var_8 ) )
        {
            self.grenadeammo--;
            var_11 = "grenade";
        }

        var_7 = 0;
        var_8++;
        var_0 thread maps\_anim::_id_0C18( var_6, var_11 );
        maps\_utility::_id_27EF( 0.05, maps\_anim::_id_0C15, var_6, var_11, 0.3 );
        var_0 waittill( var_11 );
        var_0 thread maps\_anim::_id_0BC5( var_6, "open" );
        wait(randomfloatrange( 0.2, 1.0 ));
        var_0 notify( "stop_loop" );
    }
}

quit_door_behavior( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
    {
        if ( !sighttracepassed( level.player geteye(), self geteye(), 0, self ) )
            return 0;
    }

    self.health = 100;
    maps\_utility::_id_1EAB();
    self.goalradius = 512;
    self _meth_81aa( self.origin );
    self notify( "quit_door_behavior" );
    self _meth_8143();
    self notify( "killanimscript" );
    return 1;
}

player_entered_backdoor( var_0 )
{
    if ( var_0 != "behind" )
        return 0;

    var_1 = distance( self.origin, level.player.origin );

    if ( var_1 > 250 )
        return 0;

    if ( !sighttracepassed( level.player geteye(), self geteye(), 0, self ) )
        return 0;

    return 1;
}

hiding_door_guy_should_charge( var_0, var_1, var_2 )
{
    var_3 = 3;
    var_4 = 100;
    var_5 = 600;

    if ( var_2 < var_3 )
        return 0;

    if ( var_1 != level.player )
        return 0;

    if ( var_0 != "front" )
        return 0;

    var_6 = distance( self.origin, level.player.origin );

    if ( var_6 < var_4 )
        return 0;

    if ( var_6 > var_5 )
        return 0;

    return common_scripts\utility::_id_2006();
}

hiding_door_guy_should_throw_grenade( var_0, var_1 )
{
    if ( var_1 < 1 )
        return 0;

    if ( var_0 == "behind" )
        return 0;

    if ( randomint( 100 ) < 25 * self.grenadeammo )
        return 1;

    return 0;
}

hiding_door_get_enemy_direction( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( var_0 );
    var_4 = vectornormalize( var_3 );
    var_5 = vectortoangles( var_4 );
    var_6 = vectortoangles( var_2 - var_1 );
    var_7 = var_5[1] - var_6[1];
    var_7 += 360;
    var_7 = int( var_7 ) % 360;
    var_8 = undefined;

    if ( var_7 >= 90 && var_7 <= 270 )
        var_8 = "behind";
    else if ( var_7 >= 300 || var_7 <= 45 )
        var_8 = "front";
    else if ( var_7 < 90 )
        var_8 = "right";
    else if ( var_7 > 270 )
        var_8 = "left";

    return var_8;
}

hiding_door_spawner_cleanup( var_0, var_1, var_2, var_3 )
{
    self endon( "spawned" );
    self waittill( "death" );
    waittillframeend;
    var_0 notify( "stop_loop" );
    thread hiding_door_death_door_connections( var_2, var_3 );
    var_0 notify( "push_player" );

    if ( !isdefined( var_1.played_death_anim ) )
    {
        var_1.played_death_anim = 1;
        var_0 thread maps\_anim::_id_0C24( var_1, "death_2" );
    }
}

hiding_door_guy_cleanup( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 endon( "charge" );
    var_1 common_scripts\utility::_id_A087( "death", "quit_door_behavior" );
    var_0 notify( "stop_loop" );
    thread hiding_door_death_door_connections( var_3, var_4 );
    var_0 notify( "push_player" );

    if ( !isdefined( var_2.played_death_anim ) )
    {
        var_2.played_death_anim = 1;
        var_0 thread maps\_anim::_id_0C24( var_2, "death_2" );
    }
}

hiding_door_guy_pushplayer( var_0 )
{
    self waittill( "push_player" );
    var_0 moveto( self.origin, 1.5 );
    wait 1.5;
    var_0 delete();
}

toggle_pushplayerclip_with_flag( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        self notsolid();
        common_scripts\utility::_id_3857( var_0 );
        self solid();
    }
}

hiding_door_guy_grenade_throw( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Wrist_RI" );
    var_2 = distance( level.player.origin, var_0.origin ) * 2.0;

    if ( var_2 < 300 )
        var_2 = 300;

    if ( var_2 > 1000 )
        var_2 = 1000;

    var_3 = vectornormalize( level.player.origin - var_0.origin );
    var_4 = var_3 * var_2;
    var_0 magicgrenademanual( var_1, var_4, randomfloatrange( 3.0, 5.0 ) );
}

hiding_door_death( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 endon( "charge" );
    var_2 endon( "quit_door_behavior" );
    var_2 waittill( "damage", var_5, var_6 );

    if ( !isalive( var_2 ) )
        return;

    thread hiding_door_death_door_connections( var_3, var_4 );
    var_1 notify( "push_player" );
    var_1 thread maps\_anim::_id_0C24( var_2, "death_2" );

    if ( !isdefined( var_0.played_death_anim ) )
    {
        var_0.played_death_anim = 1;
        var_1 thread maps\_anim::_id_0C24( var_0, "death_2" );
    }

    var_2 maps\_cheat::melonhead_remove_melon( 1, 1 );
    wait 0.5;

    if ( isalive( var_2 ) )
    {
        if ( isdefined( var_6 ) )
            var_2 kill( ( 0.0, 0.0, 0.0 ), var_6 );
        else
            var_2 kill( ( 0.0, 0.0, 0.0 ) );
    }
}

hiding_door_death_door_connections( var_0, var_1 )
{
    wait 2;

    if ( isdefined( var_0 ) )
        var_0 disconnectpaths();

    if ( isdefined( var_1 ) )
        badplace_delete( var_1 getentitynumber() );
}

hiding_door_starts_open( var_0 )
{
    return isdefined( var_0.script_noteworthy ) && var_0.script_noteworthy == "starts_open";
}
