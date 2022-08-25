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

_id_64DA()
{
    game["bomb_grabbed_sound"] = "mp_suitcase_pickup";
    game["bomb_dropped_sound"] = "h1_mp_war_objective_lost";
    game["bomb_dropped_enemy_sound"] = "h1_mp_war_objective_taken";
    game["bomb_recovered_sound"] = "h1_mp_war_objective_taken";
    game["bomb_planted_sound"] = "mp_obj_notify_pos_med";
    game["bomb_planted_enemy_sound"] = "mp_obj_notify_neg_med";
    game["bomb_disarm_sound"] = "mp_obj_notify_pos_lrg";
    game["bomb_disarm_enemy_sound"] = "mp_obj_notify_neg_lrg";
}

loadbombfx()
{
    level._effect["bomb_explosion"] = loadfx( "vfx/explosion/mp_gametype_bomb" );
}

getcarrybombvisuals( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
    {
        var_1 setmodel( "wpn_h1_briefcase_bomb_npc" );
        return [ var_1 ];
    }

    return undefined;
}

createbombcarryobject( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\mp\gametypes\_gameobjects::_id_23E9( var_0, var_2, var_3, ( 0.0, 0.0, 32.0 ) );
    var_4 maps\mp\gametypes\_gameobjects::allowcarry( var_1 );
    var_4 maps\mp\gametypes\_gameobjects::_id_8352( var_1 );

    if ( var_1 == "friendly" || var_1 == "any" )
    {
        var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_bomb" );
        var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_bomb" );
    }

    if ( var_1 == "enemy" || var_1 == "any" )
    {
        var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_bomb" );
        var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_bomb" );
    }

    var_4.allowweapons = 1;
    var_4._id_1AFB = ::canusebomb;

    foreach ( var_6 in var_3 )
        var_6 notsolid();

    return var_4;
}

canusebomb( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 maps\mp\_utility::_id_5131() )
        return 0;

    return 1;
}

oncarrybombpickup( var_0, var_1 )
{
    level notify( "bomb_picked_up" );
    var_0._id_50C8 = 1;

    if ( isplayer( var_0 ) )
    {
        var_0 thread maps\mp\_matchdata::_id_5827( "pickup", var_0.origin );
        var_0 setclientomnvar( "ui_carrying_bomb", 1 );
    }

    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_escort" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_escort" );

    if ( isdefined( var_1 ) )
        maps\mp\_utility::_id_6DDD( game["bomb_recovered_sound"], var_1 );
    else
        maps\mp\_utility::_id_6DDD( game["bomb_recovered_sound"] );

    var_0 playlocalsound( game["bomb_grabbed_sound"] );
}

oncarrybombdrop( var_0, var_1 )
{
    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_bomb" );
    maps\mp\_utility::_id_6DDD( game["bomb_dropped_sound"], var_0 );
}

createbombzoneobject( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getentarray( var_3.target, "targetname" );
    var_7 = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_3, var_6, ( 0.0, 0.0, 64.0 ) );
    var_7.label = var_7 maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_7 resetbombzone( var_4, var_1, var_2, var_5 );
    var_7._id_6242 = 1;
    var_7._id_4B53 = "bombZone";

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        if ( isdefined( var_6[var_8]._id_79BF ) )
        {
            var_7._id_353B = var_6[var_8]._id_79BF;
            var_6[var_8] thread _id_831E( var_7 );
            break;
        }
    }

    return var_7;
}

resetbombzone( var_0, var_1, var_2, var_3 )
{
    maps\mp\gametypes\_gameobjects::allowuse( var_1 );
    maps\mp\gametypes\_gameobjects::_id_8352( var_2 );
    maps\mp\gametypes\_gameobjects::setusetime( level._id_688D );
    maps\mp\gametypes\_gameobjects::_id_834A( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::_id_7F99( var_0 );
    var_4 = "waypoint_defend";
    var_5 = "waypoint_target";

    if ( var_1 == "any" )
    {
        var_4 = "waypoint_target";
        var_5 = "waypoint_target";
    }

    if ( var_3 )
    {
        var_4 += self.label;
        var_5 += self.label;
    }

    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_4 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_4 );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_5 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_5 );
    self._id_9C1C = "briefcase_bomb_mp";
    self.cantuseweapon = "briefcase_bomb_defuse_mp";
    self.bombplantedon = 0;
}

_id_831E( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    var_1 rotateyaw( -45, 0.05 );
    wait 0.05;
    var_2 = self.origin + ( 0.0, 0.0, 5.0 );
    var_3 = self.origin + anglestoforward( var_1.angles ) * 100 + ( 0.0, 0.0, 128.0 );
    var_4 = bullettrace( var_2, var_3, 0, self );
    self._id_534D = spawn( "script_model", var_4["position"] );
    self._id_534D setscriptmoverkillcam( "explosive" );
    var_0._id_534E = self._id_534D getentitynumber();
    var_1 delete();
}

setupzonefordefusing( var_0 )
{
    var_1 = "waypoint_defuse";
    var_2 = "waypoint_defend";

    if ( var_0 )
    {
        var_1 += self.label;
        var_2 += self.label;
    }

    maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    maps\mp\gametypes\_gameobjects::setusetime( level._id_27BF );
    maps\mp\gametypes\_gameobjects::_id_834A( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::_id_7F99( undefined );
    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_1 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_1 );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_2 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_2 );
    maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    self._id_9C1C = "briefcase_bomb_defuse_mp";
    self.cantuseweapon = "briefcase_bomb_mp";
}

onbeginplantbomb( var_0 )
{
    var_0 allowmelee( 0 );

    if ( !level._id_8572 )
    {
        var_0 maps\mp\_utility::_id_6205( "plant" );
        var_0 playsound( "mp_snd_bomb_arming" );
        level thread _id_6979( var_0 );
    }

    var_0._id_5174 = 1;
}

onbegindefusebomb( var_0, var_1 )
{
    var_0 allowmelee( 0 );

    if ( !level._id_8572 )
    {
        var_0 maps\mp\_utility::_id_6205( "defuse" );
        var_0 playsound( "mp_snd_bomb_disarming" );
        level thread _id_6979( var_0 );
    }

    var_0._id_50EF = 1;

    if ( isdefined( var_1 ) )
    {
        var_1 hide();
        self.hiddenmodel = var_1;
    }
}

_id_6979( var_0 )
{
    var_1 = common_scripts\utility::array_remove( level.players, var_0 );

    if ( var_1.size )
        var_0 maps\mp\_utility::_id_6DC5( "snd_bomb_button_press_lp", undefined, var_1 );
}

_id_8EA2( var_0 )
{
    var_0 common_scripts\utility::_id_8EA1( "snd_bomb_button_press_lp" );
}

onendusebomb( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 allowmelee( 1 );

    if ( isalive( var_0 ) )
    {
        var_0._id_50EF = 0;
        var_0._id_5174 = 0;
    }

    level thread _id_8EA2( var_0 );
    var_0 _meth_854D( "weap_suitcase_raise_plr" );

    if ( var_1 && isdefined( self.hiddenmodel ) )
    {
        self.hiddenmodel show();
        self.hiddenmodel = undefined;
    }
}

onplayerplantbomb( var_0, var_1, var_2 )
{
    self notify( "bomb_planted" );
    thread maps\mp\_events::bombplantevent();
    self.bombplantedtime = gettime();

    if ( isplayer( self ) && var_0 )
    {
        self._id_50C8 = 0;
        self setclientomnvar( "ui_carrying_bomb", 0 );
    }

    self playsound( "mp_bomb_plant" );
    maps\mp\_utility::_id_6DDD( game["bomb_planted_sound"], var_1 );
    maps\mp\_utility::_id_6DDD( game["bomb_planted_enemy_sound"], var_2 );
    maps\mp\_utility::_id_564B( "bomb_planted" );
    level.bombowner = self;
}

onbombplanted( var_0 )
{
    level notify( "bomb_planted", self );
    self.bombplantedon = 1;
    level._id_9366 = 1;
    maps\mp\gametypes\_gamelogic::_id_6727();
    level.timepausestart = gettime();
    maps\mp\_utility::_id_6DDC( "mp_snd_bomb_planted", var_0 );
    self._id_9345 = self.visuals[0];
    self._id_9345 thread _id_6DE5();
}

_id_6DE5()
{
    self endon( "death" );
    self endon( "stop_ticking" );
    level endon( "game_ended" );
    var_0 = level.bombtimer;

    for (;;)
    {
        self playsound( "ui_mp_suitcasebomb_timer" );

        if ( var_0 > 10 )
        {
            var_0 -= 1;
            wait 1;
        }
        else if ( var_0 > 4 )
        {
            var_0 -= 0.5;
            wait 0.5;
        }
        else if ( var_0 > 1 )
        {
            var_0 -= 0.4;
            wait 0.4;
        }
        else
        {
            var_0 -= 0.3;
            wait 0.3;
        }

        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_8F06()
{
    self notify( "stop_ticking" );
}

onplayerdefusebomb( var_0, var_1, var_2 )
{
    self notify( "bomb_defused" );
    thread maps\mp\_events::bombdefuseevent( var_0 );
    maps\mp\_utility::_id_6DDD( game["bomb_disarm_sound"], var_1 );
    maps\mp\_utility::_id_6DDD( game["bomb_disarm_enemy_sound"], var_2 );
    maps\mp\_utility::_id_564B( "bomb_defused" );
    level.bombowner = undefined;
}

onbombexploded( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        self.visuals[0] entityradiusdamage( var_0, 512, var_1, 20, var_2, "MOD_EXPLOSIVE", "bomb_site_mp" );
        var_2 thread maps\mp\_events::bombdetonateevent();
    }
    else
        self.visuals[0] entityradiusdamage( var_0, 512, var_1, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

    var_3 = "bomb_explosion";

    if ( isdefined( self.trigger._id_3018 ) )
        var_3 = self.trigger._id_3018;

    var_4 = randomfloat( 360 );
    var_5 = var_0 + ( 0.0, 0.0, 50.0 );
    var_6 = spawnfx( level._effect[var_3], var_5 + ( 0.0, 0.0, 50.0 ), ( 0.0, 0.0, 1.0 ), ( cos( var_4 ), sin( var_4 ), 0 ) );
    triggerfx( var_6 );
    physicsexplosionsphere( var_5, 200, 100, 3 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.75, 2.0, var_0, 2000 );
    thread maps\mp\_utility::_id_6DDC( "h1_briefcase_exp_mid", var_0 );

    if ( isdefined( self._id_353B ) )
        common_scripts\_exploder::_id_3528( self._id_353B );
}
