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

idle_anim_think()
{
    self endon( "death" );

    if ( !isdefined( self._not_team ) )
        return;

    var_0 = getent( self._not_team, "targetname" );

    if ( !isdefined( var_0._id_793C ) )
        return;

    var_1 = undefined;

    switch ( var_0._id_793C )
    {
        case "coffee":
            var_1 = "coffee_";
            break;
        case "sleep":
            var_1 = "sleep_";
            break;
        case "phone":
            var_1 = "cellphone_";
            break;
        case "smoke":
            var_1 = "smoke_";
            break;
        case "lean_smoke":
            var_1 = "lean_smoke_";
            break;
        default:
            return;
    }

    self.allowdeath = 1;
    var_0 = getent( self._not_team, "targetname" );
    self.ref_node = var_0;

    if ( var_0._id_793C == "sleep" )
    {
        var_2 = _id_A5A4::_id_88D1( "chair" );
        self._id_46E9 = 1;
        self._id_0BEE = _id_A5A4::_id_590F( var_2 );
        var_0 thread _id_A510::_id_0BC7( var_2, "sleep_react" );
        var_0 maps\_stealth_logic::_id_8D89( self, var_1 + "idle", var_1 + "react" );
    }
    else
        var_0 maps\_stealth_logic::_id_8D8B( self, var_1 + "reach", var_1 + "idle", var_1 + "react" );
}

icbm_friendly_state_hidden()
{
    level endon( "_stealth_detection_level_change" );
    self._id_1300 = self._id_0669._id_13A2._id_4277;
    self.accuracy = self._id_0669._id_13A2._id_4277;
    self._id_0669._id_13A2._id_63CE = self.grenadeammo;
    self.grenadeammo = 0;
    self._id_39C7 = undefined;
    self.ignoreforfixednodesafecheck = 1;
    self.ignoretriggers = 1;
    _id_A5A4::_id_2A74();
    waitframe;
    self.fixednode = 0;
}

icbm_friendly_state_alert()
{
    level endon( "_stealth_detection_level_change" );
    icbm_friendly_state_hidden();
}

icbm_friendly_state_spotted()
{
    level endon( "_stealth_detection_level_change" );
    thread maps\_stealth_behavior::_id_3A80();
    self._id_1300 = self._id_0669._id_13A2.badaccuracy;
    self.accuracy = self._id_0669._id_13A2.badaccuracy;
    self.grenadeammo = self._id_0669._id_13A2._id_63CE;
    self _meth_81ce( "prone", "crouch", "stand" );
    self _meth_8143();
    self.ignoreforfixednodesafecheck = 0;
    self.ignoretriggers = 0;
    _id_A5A4::_id_2A8D();
    _id_A5A4::_id_309A();
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self _meth_81a7( 0 );
}

friendlies_stop_on_truck_spotted()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "truck_spotted" );

    if ( common_scripts\utility::_id_382E( "truckguys dead" ) )
        return;

    _id_A5A4::_id_2A74();
    self _meth_81aa( self.origin );
    self.goalradius = 30;
    common_scripts\utility::_id_384A( "truckguys dead" );
    wait 1;
    _id_A5A4::_id_309A();
}

friendlies_stop_paths_to_fight()
{
    self endon( "death" );
    level common_scripts\utility::_id_A087( "_stealth_spotted", "at_range" );

    if ( common_scripts\utility::_id_382E( "patrollers_dead" ) )
        return;

    self.fixednode = 0;
    self notify( "stop_going_to_node" );
    self.goalradius = 5000;
    common_scripts\utility::_id_384A( "patrollers_dead" );
    wait 3;
    make_friendies_not_cqb();
    _id_A5A4::_id_070A( "basement_door_nodes" );
    self.fixednode = 1;
}

disable_ignoreme_on_stealth_spotted()
{
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    stop_make_friendies_ignored();
}

disable_deadlyness_on_stealth_spotted()
{
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    disable_friendly_deadlyness();
}

disable_friendly_deadlyness()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].normal_baseaccuracy ) )
            var_0[var_1]._id_1300 = var_0[var_1].normal_baseaccuracy;
    }
}

stop_make_friendies_ignored()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].ignoretriggers = 0;
}

friendlies_fighting_nodes()
{
    level endon( "outside_cleared" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    _id_A5A4::_id_070A( "friendlies_fighting_nodes" );
}

truck_setup()
{
    self waittill( "trigger" );
    var_0 = _id_A5A8::waittill_vehiclespawn( "truck" );
    var_0._id_5A3F = 1;
    var_0 thread maps\icbm_aud::start_first_truck_audio();
    var_0 _id_A5A8::_id_9D02( "headlights" );
    wait 0.5;
    common_scripts\utility::_id_384A( "truck_stopped" );
    var_0 thread maps\icbm_aud::handle_first_truck_stop();
    var_0 _id_A5A8::_id_9D02( "brakelights" );
    common_scripts\utility::_id_383F( "truck arived" );
    common_scripts\utility::_id_384A( "price_basement_door_anim_complete" );

    if ( var_0.helmet > 0 )
        var_0 _id_A5A8::_id_9D01( "all" );
}

truck_guys_think()
{
    self endon( "death" );
    level.truckguys[level.truckguys.size] = self;
    self.ignoretriggers = 1;
    common_scripts\utility::_id_384A( "truck_stopped" );
    wait 2;
    self.ignoretriggers = 0;
}

ignore_truck_guys_till_truck_stopped()
{
    var_0 = getentarray( "truck_guys", "script_noteworthy" );
    common_scripts\utility::_id_384A( "truck_stopped" );
}

music_tension_loop( var_0, var_1, var_2, var_3 )
{
    level endon( var_0 );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    musicstop( 3 );
    wait 3.1;

    for (;;)
    {
        _id_A5A4::_id_6008( var_1 );
        wait(var_2);
        musicstop( var_3 );
        wait(var_3 + 0.2);
    }
}

friendlies_start_paths()
{
    var_0 = getnode( "path_left", "targetname" );
    var_1 = getnode( "path_center", "targetname" );
    var_2 = getnode( "path_right", "targetname" );
    var_3 = get_a_generic_friendly();
    level._id_3C61 thread _id_A581::_id_4241( var_1 );
    wait 0.5;
    level._id_6F7C thread _id_A581::_id_4241( var_0 );

    if ( isalive( var_3 ) )
    {
        wait 0.5;
        var_3 thread _id_A581::_id_4241( var_2 );
    }
}

get_a_generic_friendly()
{
    var_0 = getaiarray( "allies" );
    var_0 = _id_A5A4::_id_735E( var_0 );
    return var_0[0];
}

attach_flashlight( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( self._id_475E ) )
        return;

    if ( isdefined( var_1 ) )
        wait(randomfloatrange( 0, 5 ));

    self attach( "com_flashlight_on", "tag_inhand", 1 );
    self._id_475E = 1;
    flashlight_light( var_0 );
    thread dropflashlightondeath();
}

dropflashlightondeath()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        detach_flashlight();
}

detach_flashlight_onspotted()
{
    self endon( "death" );
    self waittill( "drop_light" );
    detach_flashlight();
}

detach_flashlight()
{
    if ( !isdefined( self._id_475E ) )
        return;

    self detach( "com_flashlight_on", "tag_inhand" );
    flashlight_light( 0 );
    self._id_475E = undefined;
}

flashlight_light( var_0 )
{
    var_1 = "tag_light";

    if ( var_0 )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 setmodel( "tag_origin" );
        var_2 hide();
        var_2 linkto( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        thread flashlight_light_death( var_2 );
        playfxontag( level._effect["flashlight"], var_2, "tag_origin" );
    }
    else if ( isdefined( self._id_475E ) )
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::_id_A087( "death", "flashlight_off" );
    var_0 delete();
    self._id_475E = undefined;
}

min_spec_kill_fx()
{
    var_0 = [];
    var_0 = _id_A5A4::_id_3FA9( "fog_icbm" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "fog_icbm_a" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "fog_icbm_b" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "fog_icbm_c" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cloud_bank" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cloud_bank_a" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cloud_bank_far" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();
}

whitein()
{
    var_0 = newhudelem();
    var_0.xpmaxmultipliertimeplayed = 0;
    var_0._id_0538 = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.hostquits = "fullscreen";
    var_0.visionsetnight = "fullscreen";
    var_0.alpha = 1;
    var_0.space = 2;
    var_1 = getent( "cloud", "targetname" );
    var_1 waittill( "trigger" );
    wait 1;
    var_0 fadewhiteout( 2, 0, 6 );
}

fadewhiteout( var_0, var_1, var_2 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    wait(var_0);
}

make_friendies_cqb()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_A5A4::_id_30B0();
}

make_friendies_not_cqb()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_A5A4::_id_2A8D();
}

make_friendies_pushplayer( var_0 )
{
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_81a7( var_0 );
}

make_friendies_deadly()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1].normal_baseaccuracy = var_0[var_1]._id_1300;
        var_0[var_1]._id_1300 = 1000;
    }
}

opforce_more_accurate()
{
    self._id_1300 = 5;
}

all_friendlies_turn_blue()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_A5A4::_id_7E38( "b" );
}

clip_nosight_logic()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( self._id_79D3 );
    thread clip_nosight_logic2();
    self setcandamage( 1 );
    clip_nosight_wait();
    self delete();
}

clip_nosight_wait()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "damage" );
}

clip_nosight_logic2()
{
    self endon( "death" );
    common_scripts\utility::_id_3852( "_stealth_spotted", "_stealth_found_corpse" );
    self delete();
}

first_chopper_fly_over()
{
    wait 3;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "enemyhelicopters" );
    var_0 = getaiarray( "allies" );
    var_1 = 0.0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_0[var_2] _id_A5A4::_id_27EF( var_1, ::prone_till_flag, "chopper_gone" );
        var_1 += randomfloatrange( 0.1, 0.5 );
    }

    wait 1;
    level.playercardbackground playsound( "h1_mi17_custom_flyby" );
    common_scripts\utility::_id_384A( "chopper_gone" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "move" );
    wait 1;
    _id_A5A4::_id_070A( "friendlies_at_tower" );
}

chopper_fail_mission()
{
    level endon( "chopper_gone" );
    var_0 = undefined;
    self waittill( "spawned", var_0 );
    var_1 = cos( 45 );
    var_2 = 16000000;

    if ( isdefined( var_0 ) )
    {
        for (;;)
        {
            var_3 = level.playercardbackground getcurrentweapon();
            var_4 = distancesquared( level.playercardbackground.origin, var_0.origin );

            if ( var_4 < var_2 && level.playercardbackground attackbuttonpressed() && var_3 != "c4" )
            {
                var_5 = anglestoforward( level.playercardbackground getplayerangles() );
                var_6 = vectornormalize( var_0.origin - level.playercardbackground.origin );
                var_7 = vectordot( var_6, var_5 );

                if ( var_7 > var_1 )
                {
                    _id_A56A::_id_7E03( &"ICBM_MISSIONFAIL_ICBM_CHOPPERS_SHOT" );
                    _id_A5A4::_id_5CDF();
                    break;
                }
            }

            wait 0.05;
        }
    }
}

prone_till_flag( var_0 )
{
    self endon( "death" );
    var_1 = randomintrange( 1, 3 );
    _id_A510::_id_0BCA( self, "gravity", "pronehide_dive" + var_1 );
    thread _id_A510::_id_0BCA( self, "gravity", "pronehide_idle" + var_1 );
    common_scripts\utility::_id_384A( var_0 );
    wait(randomfloatrange( 0, 1 ));
    thread _id_A510::_id_0BCA( self, "gravity", "pronehide_2_stand" + var_1 );
}

make_friendies_ignored()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].ignoretriggers = 1;
}

turn_off_flashlights()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        wait(randomfloatrange( 0.1, 0.3 ));
        var_0[var_1] detach_flashlight();
    }
}

ignoreme_till_close()
{
    self endon( "death" );
    self.ignoretriggers = 1;
    common_scripts\utility::_id_0D13( level.friendlies, ::notify_at_range, self, 1200, "at_range" );
    level common_scripts\utility::_id_A087( "_stealth_spotted", "at_range" );
    self.ignoretriggers = 0;
}

ignoreme_till_stealth_broken()
{
    self endon( "death" );
    self.ignoretriggers = 1;
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    self.ignoretriggers = 0;
}

notify_at_range( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    while ( distance( var_0.origin, self.origin ) > var_1 )
        wait 1;

    level notify( var_2 );
}

second_squad_talker_think()
{
    level.gm5 = self;
    level.gm5._id_0C72 = "gm5";
}

price_think()
{
    level._id_6F7C = self;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C.invisible = 100;
    level.friendlies[level.friendlies.size] = self;
    level._id_6F7C _id_A5A4::_id_5926();
}

gaz_think()
{
    level._id_3C61 = self;
    level._id_3C61._id_0C72 = "gaz";
    level._id_3C61 thread _id_A5A4::_id_58D7();
    level._id_3C61.invisible = 100;
    level.friendlies[level.friendlies.size] = self;
    level._id_3C61 _id_A5A4::_id_5926();
}

griggs_think()
{
    level.griggs = self;
    level.griggs._id_0C72 = "griggs";
    level.griggs thread _id_A5A4::_id_58D7();
    level.griggs.invisible = 100;
    level.friendlies[level.friendlies.size] = self;
    level.griggs _id_A5A4::_id_5926();
}

captured_griggs_think()
{
    self.pantssize = 1;
    _id_A5A4::_id_30B0();
    self.ignoretriggers = 1;
    level.griggs_node = getnode( "griggs_node", "targetname" );
    thread griggs_idle( level.griggs_node );
    wait 0.1;
    thread griggs_fake_gun();
    level.griggs attach( "prop_flex_cuff_obj", "tag_inhand", 1 );
    level.griggs attach( "prop_flex_cuff", "tag_inhand", 1 );
    level waittill( "griggs_loose" );
    level.griggs detach( "prop_flex_cuff_obj", "tag_inhand" );
    level.griggs detach( "prop_flex_cuff", "tag_inhand" );
}

griggs_grab_gun( var_0, var_1 )
{
    level.griggs.fake_gun delete();
    level.griggs _id_A5A4::_id_4461();
}

griggs_fake_gun()
{
    var_0 = level.griggs gettagorigin( "TAG_WEAPON_RIGHT" );
    var_1 = level.griggs gettagangles( "TAG_WEAPON_RIGHT" );
    var_2 = spawn( "script_model", var_0 );
    var_2 setmodel( "weapon_saw" );
    var_2.angles = var_1;
    level.griggs.fake_gun = var_2;
    level.griggs _id_A5A4::_id_4462();
}

griggs_idle( var_0 )
{
    self endon( "griggs_loose" );
    var_0 thread _id_A510::_id_0BE1( self, "grigsby_rescue_idle", undefined, "stop_idle" );
}

price_rescue_anims()
{
    level.griggs_node _id_A510::_id_0BFF( level._id_6F7C, "grigsby_rescue_price_in" );
    level.griggs_node _id_A510::_id_0C24( level._id_6F7C, "grigsby_rescue_price_in" );
    common_scripts\utility::_id_383F( "price_ready_for_griggs_rescue" );
    level.griggs_node thread _id_A510::_id_0BE1( level._id_6F7C, "grigsby_rescue_price_idle", undefined, "stop_price_idle" );
}

friendly_think()
{
    self._id_0C72 = "generic";
    self.invisible = 100;
    thread _id_A5A4::_id_7402();
    level.friendlies[level.friendlies.size] = self;

    if ( self.spawntime.teambalanced == "chute_start_spawners" )
        level.soldier = self;
}

respawned_friendly_think()
{
    self._id_0C72 = "generic";
    self.invisible = 100;
    level.friendlies[level.friendlies.size] = self;
}

kill_during_breach1( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].script_parentname == "interogation_buddy" )
            var_2[var_3] kill();
    }
}

kill_during_breach2( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].script_parentname == "interogation_speaker" )
        {
            var_4 = level._id_6F7C;

            if ( distancesquared( level._id_6F7C.origin, var_2[var_3].origin ) > distancesquared( level._id_3C61.origin, var_2[var_3].origin ) )
                var_4 = level._id_3C61;

            magicbullet( var_4.weapon_switch_invalid, var_4 gettagorigin( "tag_flash" ), var_2[var_3] gettagorigin( "tag_eye" ) );
            var_2[var_3] kill();
        }
    }
}

parachute_player()
{
    level thread maps\icbm_fx::playereffect();
    level.playercardbackground disableweapons();
    level thread whitein();
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowcrouch( 0 );
    var_0 = getent( "para_start", "targetname" );
    var_1 = getent( "para_stop", "targetname" );
    level.playercardbackground linkto( var_0 );
    var_0 moveto( var_1.origin, 3, 0, 0 );
    var_0 waittill( "movedone" );
    level.playercardbackground unlink();
    level.playercardbackground enableweapons();
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowcrouch( 1 );
}

trigger_wait_and_set_flag( var_0 )
{
    common_scripts\utility::_id_383D( "trigger_" + var_0 );
    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );
    var_1 common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_383F( "trigger_" + var_0 );
}

sound_fade_then_delete()
{
    self waittill( "trigger", var_0 );
    var_0 _id_A5A8::volume_down( 2 );
    wait 2;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

start_interogation()
{
    var_0 = getent( "interogation_speaker", "script_noteworthy" );
    var_0 _id_A5A4::_id_0798( ::interogation_speaker_think );
    var_1 = getentarray( "interogators", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::ignore_all_till_flag, "breach_started" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "start_interogation" );
    wait 0.5;
    thread maps\icbm_dialog::dialog_grigs_guys_jibjab();
}

ignore_all_till_flag( var_0 )
{
    self endon( "death" );
    self.ignoreforfixednodesafecheck = 1;
    common_scripts\utility::_id_384A( var_0 );
    self.ignoreforfixednodesafecheck = 0;
}

interogation_speaker_think()
{
    level.ru1 = self;
    self._id_0C72 = "ru1";
    self.a._id_2B18 = 1;
}

knife_kill_setup()
{
    var_0 = getent( "price_knife_kill", "targetname" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 = getent( "house01_badguy01", "script_noteworthy" );
    level.knifekillnode = getnode( "knifeKillNode", "targetname" );
    createthreatbiasgroup( "victims" );
    setignoremegroup( "icbm_friendlies", "victims" );

    if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        var_1 _id_A5A4::_id_0798( ::ai_hostile_think );

    var_1 _id_A5A4::_id_0798( maps\_stealth_logic::stealth_ai );
    var_1 _id_A5A4::_id_0798( ::set_threatbias_group, "victims" );
    var_2 = var_1 _id_A5A4::_id_88C3();

    if ( !common_scripts\utility::_id_382E( "knife_sequence_done" ) )
        var_2 thread ai_hostile_knife_kill_think();

    var_2 waittill( "death" );
    level._id_6F7C _id_A5A4::_id_309A();
    common_scripts\utility::_id_383F( "knife_sequence_done" );
}

ai_hostile_think()
{
    self endon( "death" );
    self._id_0C72 = "hostile";
    self.allowdeath = 1;
    self.ignoretriggers = 1;
    self.helmet = 1;
    thread maps\_stealth_logic::_id_8DCA();
    level.knifekillnode _id_A510::_id_0BFF( self, "phoneguy_idle_start" );
    level.knifekillnode thread _id_A510::_id_0BE1( self, "phoneguy_idle", undefined, "stop_idle" );
    self waittill( "stealth_enemy_endon_alert" );
    self._id_67ED delete();
    self setthreatbiasgroup();
    self.ignoretriggers = 0;
    level.knifekillnode notify( "stop_idle" );
}

ai_hostile_knife_kill_think()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    level._id_6F7C _meth_81aa( self.origin );
    common_scripts\utility::_id_383F( "knife_sequence_starting" );
    level.knifekillnode _id_A510::_id_0BFF( level._id_6F7C, "knifekill_price" );
    thread knife_kill_fx();
    thread ai_hostile_knife_kill_abort_think();
    level.price_knife = spawn( "script_model", level._id_6F7C gettagorigin( "TAG_INHAND" ) );
    level.price_knife.angles = level._id_6F7C gettagangles( "TAG_INHAND" );
    level.price_knife linkto( level._id_6F7C, "TAG_INHAND", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    level.price_knife setmodel( "weapon_parabolic_knife" );
    level.price_knife hide();
    level._id_6F7C playsound( "scn_icbm_knife_melee" );
    level.knifekillnode thread _id_A510::_id_0C24( level._id_6F7C, "knifekill_price" );
    level.knifekillnode thread _id_A510::_id_0C24( self, "phoneguy_death" );
    var_0 = getanimlength( _id_A5A4::_id_3EF5( "phoneguy_death" ) );
    var_0 -= 2.75;
    _id_A5A4::_id_27EF( var_0, ::ai_hostile_knife_kill_finish_anim );
    _id_A5A4::_id_27EF( var_0, ::set_ignore_all );
    level.knifekillnode waittill( "phoneguy_death" );
    level notify( "knife_kill_done" );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C _meth_8143();
    self.a._id_612E = 1;
    self.allowdeath = 1;
    animscripts\shared::_id_2F6C();
    self kill( ( 0, 0, 0 ) );
}

ai_hostile_knife_kill_finish_anim()
{
    self endon( "stealth_enemy_endon_alert" );
    self notify( "_stealth_stop_stealth_logic" );
    self.allowdeath = 0;
    self.a._id_612E = 1;
}

set_ignore_all()
{
    self.ignoreforfixednodesafecheck = 1;
}

ai_hostile_knife_kill_abort_think()
{
    common_scripts\utility::_id_384A( "knife_sequence_starting" );
    common_scripts\utility::_id_A087( "death", "stealth_enemy_endon_alert" );
    level._id_6F7C _meth_854d( "scn_icbm_knife_melee" );
    level.price_knife unlink();
    level.price_knife delete();
    level._id_6F7C _meth_8143();
}

knife_kill_fx()
{
    self endon( "death" );
    self waittillmatch( "single anim", "knife hit" );
    playfxontag( level._effect["knife_stab"], self, "j_neck" );
}

_id_2A05( var_0 )
{
    self endon( "death" );
    _id_A510::_id_0C21( self, var_0 );
}

friendlies_open_upstairs_door()
{

}

beehive_wait()
{
    level endon( "house1_upstairs_dead" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    common_scripts\utility::_id_383F( "beehive1_active" );
    common_scripts\utility::_id_383F( "knife_sequence_done" );
    thread beehive_attack();
}

beehive_attack()
{
    var_0 = getentarray( "beehive_enemy", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    wait 4;
    var_1 = getent( "house1_upstairs_first_door", "targetname" );
    var_2 = getent( "house1_upstairs_first_door_model", "targetname" );
    var_2 linkto( var_1 );
    thread _id_6509( var_1, -178 );
    wait 1;
    var_3 = getent( "house1_upstairs_second_door", "targetname" );
    var_4 = getent( "house1_upstairs_second_door_model", "targetname" );
    var_4 linkto( var_3 );
    var_5 = getentarray( "beehive_enemy_second_door", "targetname" );
    _id_6509( var_3, 176, var_5 );
    wait 0.1;
    thread _id_A581::_id_533A( 0 );
}

_id_6509( var_0, var_1, var_2 )
{
    while ( distance( level.playercardbackground.origin, var_0.origin ) < 160 )
        wait 0.1;

    if ( isdefined( var_2 ) )
        common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );

    var_0 rotateto( var_0.angles + ( 0, var_1, 0 ), 0.5, 0, 0 );
    var_0 connectpaths();
    var_0 playsound( "icbm_door_slams_open" );
}

beehive2_wait()
{
    level endon( "outside_dead" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    common_scripts\utility::_id_383F( "beehive2_active" );
    thread beehive2_attack();
}

beehive2_think()
{
    self endon( "death" );
    self.goalradius = 4;

    if ( !isdefined( self.script_parentname ) )
        return;

    if ( self.script_parentname == "door_dog_enemies" )
    {
        level waittill( "dog_door_open" );
        self.goalradius = 3000;
    }

    if ( self.script_parentname == "beehive2_enemies" )
    {
        self.ignoreforfixednodesafecheck = 1;
        self.ignoretriggers = 1;
        level waittill( "beehive2_door_open" );
        self.goalradius = 3000;
        self.ignoreforfixednodesafecheck = 0;
        self.ignoretriggers = 0;
    }
}

beehive2_attack()
{
    var_0 = getentarray( "beehive2_enemy", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::beehive2_think );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    wait 4;
    level notify( "beehive2_door_open" );
    var_1 = getent( "beehive2_front_door", "targetname" );
    var_2 = getent( "beehive2_front_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_3 = getent( "doorknob7", "targetname" );
    var_3 linkto( var_1 );
    var_3 = getent( "doorknob8", "targetname" );
    var_3 linkto( var_1 );
    var_1 rotateto( var_1.angles + ( 0, -92, 0 ), 0.5, 0, 0 );
    var_1 connectpaths();
    var_1 playsound( "icbm_door_slams_open" );
    wait 1;
    level notify( "dog_door_open" );
    var_4 = getent( "beehive1_front_door", "targetname" );
    var_5 = getent( "beehive1_front_door_model", "targetname" );
    var_5 linkto( var_4 );
    var_4 rotateto( var_4.angles + ( 0, -87, 0 ), 0.5, 0, 0 );
    var_4 connectpaths();
    var_4 playsound( "icbm_door_slams_open" );
}

price_gets_ready_to_open_door( var_0 )
{
    var_0 _id_A510::_id_0BF4( level._id_6F7C, "hunted_open_barndoor_stop" );
    var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    common_scripts\utility::_id_383F( "price_ready" );
}

price_opens_door( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_384A( "price_ready" );
    var_0 notify( "stop_idle" );
    var_0 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_barndoor" );

    if ( var_1.teambalanced == "house01_front_door" )
        _id_A5E8::_id_870C( "aud_open_fisrt_door" );

    var_3 = getentarray( var_1._not_team, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] linkto( var_1 );

    var_1 _id_A5A4::_id_4B09();
    common_scripts\utility::_id_3831( "price_ready" );

    if ( isdefined( var_2 ) )
        common_scripts\utility::_id_383F( var_2 );
}

base_lights()
{
    var_0 = getentarray( "windows_on", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::showwindow );
    common_scripts\utility::_id_384A( "lights_off" );
    common_scripts\utility::_id_0D13( var_0, ::hidewindow );
    common_scripts\utility::_id_384A( "lights_on" );
    common_scripts\utility::_id_0D13( var_0, ::showwindow );
}

base_fx_on()
{
    var_0 = common_scripts\utility::_id_40FD( "icbm_post_FX_origin", "targetname" );
    var_1 = 0.05;
    var_2 = 1.5;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3] thread base_fx_light( randomfloatrange( var_1, var_2 ) );

    common_scripts\utility::_id_384A( "lights_on" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3] thread base_fx_light( randomfloatrange( var_1, var_2 ) );
}

base_fx_light( var_0 )
{
    wait(var_0);
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "tag_origin" );
    playfxontag( level._effect["icbm_post_light_red"], var_1, "tag_origin" );
    common_scripts\utility::_id_384A( "lights_off" );
    var_1 delete();
}

hidewindow()
{
    self hide();
}

showwindow()
{
    wait(randomfloatrange( 0.05, 1.5 ));
    var_0 = randomint( 3 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        self show();
        wait(randomfloatrange( 0.05, 0.2 ));
        self hide();
        wait(randomfloatrange( 0.05, 0.2 ));
    }

    self show();
}

tower_rumble()
{
    var_0 = [];
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 0.0, "generic_attack_medium_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 4.0, "generic_attack_medium_1000" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 9.0, "generic_attack_heavy_1000" );
    level.playercardbackground thread _id_A5A4::rumble_sequence_play( var_0 );
    wait 6.0;
    level.playercardbackground playrumblelooponentity( "generic_quake_loop" );
    wait 2.5;
    level.playercardbackground stoprumble( "generic_quake_loop" );
}

tower_earthquakes()
{
    earthquake( 0.2, 0.5, level.playercardbackground.origin, 8000 );
    wait 4;
    earthquake( 0.2, 1, level.playercardbackground.origin, 8000 );
    wait 5;
    earthquake( 0.4, 3, level.playercardbackground.origin, 8000 );
}

tower_legbreak_fx( var_0 )
{
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_leg" ), var_0, "tag_foot_left" );
    var_1 = getent( "tower_base_left", "targetname" );
    thread common_scripts\utility::_id_69C2( "scn_icbm_tower_base1", var_1.origin );
    wait 0.1;
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_leg" ), var_0, "tag_foot_right" );
    var_2 = getent( "tower_base_right", "targetname" );
    thread common_scripts\utility::_id_69C2( "scn_icbm_tower_base2", var_2.origin );
}

tower_collapse()
{
    common_scripts\utility::_id_384A( "house1_cleared" );
    var_0 = getent( "tower", "targetname" );
    var_0 _id_A5A4::_id_0D61( "tower" );
    var_1 = 18;
    var_2 = [];
    var_2[0] = "h1_wire_le1";
    var_2[1] = "h1_wire_le2";
    var_2[2] = "h1_wire_le3";
    var_2[3] = "h1_wire_ri1";
    var_2[4] = "h1_wire_ri2";
    var_2[5] = "h1_wire_ri3";
    var_2[6] = "wire_le4";
    var_2[7] = "wire_le5";
    var_2[8] = "wire_le6";
    var_2[9] = "wire_ri4";
    var_2[10] = "wire_ri5";
    var_2[11] = "wire_ri6";
    var_2[12] = "h1_wire_ri4";
    var_2[13] = "h1_wire_ri5";
    var_2[14] = "h1_wire_ri6";
    var_2[15] = "h1_wire_le4";
    var_2[16] = "h1_wire_le5";
    var_2[17] = "h1_wire_le6";
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        var_5 = var_2[var_4];
        var_3[var_4] = getent( var_5, "targetname" );
        var_3[var_4] _id_A5A4::_id_0D61( "wire" );
    }

    var_6 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_6.origin = var_0.origin;
    var_6.angles = var_0.angles + ( 0, -90, 0 );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_6 thread _id_A510::_id_0BE1( var_3[var_4], "idle" + var_4, undefined, "stop_idle" );

    common_scripts\utility::_id_384A( "tower_destroyed" );
    var_6 notify( "stop_idle" );
    var_0 setmodel( "com_powerline_tower_destroyed" );
    var_6 thread _id_A510::_id_0C24( var_0, "explosion" );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_6 thread _id_A510::_id_0C24( var_3[var_4], "explosion" + var_4 );

    radiusdamage( var_0.origin + ( 0, 0, 96 ), level.towerblastradius, 1000, 50 );
}

tower_impact_fx( var_0 )
{
    common_scripts\_exploder::_id_3528( 5 );
}

tower_spark_fx( var_0 )
{
    thread _id_6DDC( "scn_icbm_tower_sparks", var_0.origin + ( 0, 0, 512 ) );
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left03" );
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right03" );
    wait 0.1;
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right02" );
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left02" );
    wait 0.1;
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left01" );
    playfxontag( common_scripts\utility::_id_3FA8( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right01" );
}

spraycan_fx( var_0 )
{
    level endon( "stop_spray_fx" );
    level endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::_id_3FA8( "freezespray" ), var_0, "tag_spraycan_fx" );
        wait 0.1;
    }
}

spraycan_fx_stop( var_0 )
{
    level notify( "stop_spray_fx" );
}

_id_6DDC( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0, 0, 1 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_3.origin = var_1;

    if ( isdefined( var_2 ) && var_2 )
        var_3 playsoundasmaster( var_0 );
    else
        var_3 playsound( var_0 );

    wait 10.0;
    var_3 delete();
}

tower_interface()
{
    level endon( "tower_destroyed" );

    while ( !common_scripts\utility::_id_382E( "tower_destroyed" ) )
    {
        var_0 = level.playercardbackground getcurrentweapon();

        if ( var_0 != "c4" )
            level.playercardbackground switchtoweapon( "c4" );

        wait 0.5;
    }
}

set_threatbias_group( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

_id_5308()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] kill();
}

anim_reach_and_approach_solo_set_flag( var_0, var_1, var_2 )
{
    _id_A510::_id_0BF4( var_0, var_1 );
    common_scripts\utility::_id_383F( var_2 );
}

anim_reach_solo_set_flag( var_0, var_1, var_2 )
{
    _id_A510::_id_0BFF( var_0, var_1 );
    common_scripts\utility::_id_383F( var_2 );
}

missile_launch01()
{
    var_0 = getent( "missile01_start", "targetname" );
    var_1 = getent( "missile01_end", "targetname" );
    var_2 = getent( "icbm_missile01", "targetname" );
    common_scripts\utility::_id_384A( "launch_01" );
    common_scripts\_exploder::_id_3528( 1 );
    earthquake( 0.1, 8, level.playercardbackground.origin, 8000 );
    var_2 linkto( var_0 );
    var_0 moveto( var_1.origin, 50, 10, 0 );
    playfxontag( level._effect["smoke_geotrail_icbm"], var_2, "tag_nozzle" );
    var_0 waittill( "movedone" );
    var_2 delete();
}

missile_launch02()
{
    var_0 = getent( "missile02_start", "targetname" );
    var_1 = getent( "missile02_end", "targetname" );
    var_2 = getent( "icbm_missile02", "targetname" );
    common_scripts\utility::_id_384A( "launch_02" );
    wait 1.5;
    common_scripts\_exploder::_id_3528( 2 );
    earthquake( 0.1, 8, level.playercardbackground.origin, 8000 );
    var_2 linkto( var_0 );
    var_0 moveto( var_1.origin, 50, 10, 0 );
    playfxontag( level._effect["smoke_geotrail_icbm"], var_2, "tag_nozzle" );
    var_0 waittill( "movedone" );
    var_2 delete();
}

woods_patroller_think()
{
    var_0 = [];
    var_0[var_0.size] = "patrolwalk_1";
    var_0[var_0.size] = "patrolwalk_2";
    var_0[var_0.size] = "patrolwalk_3";
    var_0[var_0.size] = "patrolwalk_4";
    var_0[var_0.size] = "patrolwalk_5";
    self._id_6719 = "patrolwalk_pause";
    self._id_6718 = var_0[randomint( var_0.size )];
    thread _id_A55F::_id_66FC();
    wait 0.05;
    maps\_stealth_behavior::_id_08D2( "animation", "wrapper", ::woods_animation_wrapper );
    thread woods_keep_patroling();
}

woods_animation_wrapper( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );

    if ( !isdefined( level.woods_pause ) )
        level.woods_pause = 0;
    else
        level.woods_pause += 0.2;

    wait(level.woods_pause);
    self notify( "drop_light" );

    if ( maps\_stealth_behavior::_id_31EF( var_0 ) )
        return;

    maps\_stealth_behavior::_id_31E9( var_0 );
    maps\_stealth_behavior::_id_31EE( var_0 );
}

woods_keep_patroling()
{
    self endon( "death" );
    self endon( "drop_light" );

    for (;;)
    {
        woods_keep_patrolling_wait();
        thread _id_A55F::_id_66FC();
    }
}

woods_keep_patrolling_wait()
{
    self endon( "death" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self waittill( "enemy" );
}

remove_vehicle_delete_trigger( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2].classname == "trigger_multiple" )
            var_1[var_2] delete();
    }
}
