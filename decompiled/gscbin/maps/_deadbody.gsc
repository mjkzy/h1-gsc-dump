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
#using_animtree("generic_human");

main()
{
    level._id_78AC["dead_guy"]["death1"] = %exposed_death_nerve;
    level._id_78AC["dead_guy"]["death2"] = %exposed_death_falltoknees;
    level._id_78AC["dead_guy"]["death3"] = %exposed_death_headtwist;
    level._id_78AC["dead_guy"]["death4"] = %exposed_crouch_death_twist;
    level._id_78AC["dead_guy"]["death5"] = %exposed_crouch_death_fetal;
    level._id_78AC["dead_guy"]["death6"] = %death_sitting_pose_v1;
    level._id_78AC["dead_guy"]["death7"] = %death_sitting_pose_v2;
    level._id_78AC["dead_guy"]["death8"] = %death_pose_on_desk;
    level._id_78AC["dead_guy"]["death9"] = %death_pose_on_window;
    level._id_78AC["dead_guy"]["death6_aftermath"] = %death_sitting_pose_v1_alt_aftermath;
    level._id_78B1["dead_guy"] = #animtree;
    level.dead_body_count = 1;
    var_0 = getdvarint( "ragdoll_max_simulating" ) - 6;

    if ( var_0 > 0 )
        level.max_number_of_dead_bodies = var_0;
    else
        level.max_number_of_dead_bodies = 0;

    var_1 = spawnstruct();
    var_1.bodies = [];
    common_scripts\utility::_id_76BB( "trigger_body", ::trigger_body, var_1 );
    common_scripts\utility::_id_76BB( "dead_body", ::spawn_dead_body, var_1 );
}

trigger_body( var_0 )
{
    self waittill( "trigger" );
    var_1 = getentarray( self._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::spawn_dead_body, var_0 );
}

spawn_dead_body( var_0 )
{
    set_deadbody_info();

    if ( !h1_ragdollspecialcase( self ) && !getdvarint( "ragdoll_enable" ) && isdefined( self.require_ragdoll ) && self.require_ragdoll )
        return;

    if ( !h1_ragdollspecialcase( self ) && level.max_number_of_dead_bodies == 0 )
        return;

    var_1 = undefined;

    if ( isdefined( self._id_7A18 ) )
        var_1 = self._id_7A18;
    else
    {
        level.dead_body_count++;

        if ( level.dead_body_count > 3 )
            level.dead_body_count = 1;

        var_1 = level.dead_body_count;
    }

    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2.origin = self.origin;
    var_2.angles = self.angles;
    var_2._id_0C72 = "dead_guy";
    var_2 _id_A5A4::_id_0D61();

    if ( _id_A5A4::is_h1_level() )
        var_2 _meth_855d();

    if ( !h1_ragdollspecialcase( self ) )
        var_0 que_body( var_2 );

    if ( isdefined( self.custom_deadbody ) )
    {
        precache_custom_deadbody();
        custom_deadbody( var_2 );
    }
    else
        var_2 [[ level.scr_deadbody[var_1] ]]();

    if ( !isdefined( self._id_7AF8 ) )
    {
        var_3 = bullettrace( var_2.origin + ( 0, 0, 5 ), var_2.origin + ( 0, 0, -64 ), 0, undefined );
        var_2.origin = var_3["position"];
    }

    if ( isdefined( self.custom_death_anim ) )
    {
        if ( isdefined( self.link_corpse_clip ) )
        {
            var_4 = getent( "corpse_clip_" + self.script_parentname, "targetname" );

            if ( isdefined( var_4 ) )
            {
                var_4.origin = var_2.origin;
                var_4 linkto( var_2, "tag_origin" );
            }
        }

        var_2 thread lookat_custom_death_anim( self.script_parentname );
    }
    else
    {
        var_2 setflaggedanim( "flag", var_2 _id_A5A4::_id_3EF5( self.script_parentname ), 1, 0, 1 );
        var_2 waittillmatch( "flag", "end" );

        if ( !isdefined( self._id_7ADA ) )
            var_2 startragdoll();
    }
}

que_body( var_0 )
{
    self.bodies[self.bodies.size] = var_0;

    if ( self.bodies.size <= level.max_number_of_dead_bodies )
        return;

    self.bodies[0] delete();
    self.bodies = common_scripts\utility::_id_0D01( self.bodies );
}

lookat_custom_death_anim( var_0 )
{
    _id_A510::_id_0BC7( self, var_0 );
    wait 0.5;
    var_1 = cos( 45 );
    var_2 = 0;

    for (;;)
    {
        if ( distancesquared( level.playercardbackground.origin, self.origin ) > 5000 && ( !checksighttrace( self ) || !common_scripts\utility::_id_A347( level.playercardbackground geteye(), level.playercardbackground getplayerangles(), self.origin + ( 0, 0, 12 ), var_1 ) ) )
            var_2 = 0;
        else
            var_2++;

        if ( var_2 > 5 )
            break;

        waittillframeend;
    }

    _id_A510::_id_0C24( self, var_0 );
}

checksighttrace( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_LE" ) + ( 0, 0, 3 );
    var_2 = var_0 gettagorigin( "J_Hip_RI" );
    var_3 = var_0 gettagorigin( "J_HEAD" );
    return sighttracepassed( level.playercardbackground geteye(), var_1, 0, level.playercardbackground, self ) || sighttracepassed( level.playercardbackground geteye(), var_2, 0, level.playercardbackground, self ) || sighttracepassed( level.playercardbackground geteye(), var_3, 0, level.playercardbackground, self );
}

set_deadbody_info()
{
    if ( !isdefined( self._id_7A99 ) )
        return;

    var_0 = strtok( self._id_7A99, "|" );

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "custom_deadbody" ) )
        {
            self.custom_deadbody = get_custom_deadbody( var_2 );
            continue;
        }

        if ( issubstr( var_2, "custom_death_anim" ) )
        {
            self.custom_death_anim = 1;
            continue;
        }

        if ( issubstr( var_2, "require_ragdoll" ) )
        {
            self.require_ragdoll = 1;
            continue;
        }

        if ( issubstr( var_2, "link_corpse_clip" ) )
            self.link_corpse_clip = 1;
    }
}

get_custom_deadbody( var_0 )
{
    var_1 = strtok( var_0, ":, " );
    var_1 = common_scripts\utility::_id_0CF6( var_1, var_1[0] );
    var_2 = spawnstruct();
    var_2.body = var_1[0];
    var_2.headshots = var_1[1];
    var_2._id_9F32 = var_1[2];
    var_2.clothtype = var_1[3];
    return var_2;
}

precache_custom_deadbody()
{
    precachemodel( self.custom_deadbody.body );
    precachemodel( self.custom_deadbody.headshots );
}

custom_deadbody( var_0 )
{
    var_0 setmodel( self.custom_deadbody.body );
    var_0 attach( self.custom_deadbody.headshots, "", 1 );
    var_0.headmodel = self.custom_deadbody.headshots;
    var_0._id_9F32 = self.custom_deadbody._id_9F32;
    var_0 setclothtype( self.custom_deadbody.clothtype );
}

h1_ragdollspecialcase( var_0 )
{
    return isdefined( level.dead_bodies_ignore_ragdoll_settings ) || isdefined( var_0.custom_death_anim );
}
