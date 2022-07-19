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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "blackhawk", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_blackhawk" );
    _id_A5A8::_id_1845( "vehicle_blackhawk_low" );
    _id_A5A8::_id_1845( "vehicle_blackhawk_low_thermal" );
    _id_A5A8::_id_1845( "vehicle_blackhawk_hero_sas_night" );
    _id_A5A8::_id_1849( %bh_rotors, undefined, 0 );
    var_3 = [];
    var_3["vehicle_blackhawk"] = "fx/explosions/helicopter_explosion";
    var_3["vehicle_blackhawk_sas_night"] = "fx/explosions/helicopter_explosion";
    var_3["vehicle_blackhawk_hero_sas_night"] = "fx/explosions/helicopter_explosion";
    var_3["vehicle_blackhawk_hero"] = "fx/explosions/helicopter_explosion";
    var_3["vehicle_blackhawk_low"] = "fx/explosions/large_vehicle_explosion";
    var_3["vehicle_blackhawk_low_thermal"] = "fx/explosions/large_vehicle_explosion";
    var_4 = var_3[var_0];
    _id_A5A8::_id_1842( "fx/explosions/grenadeexp_default", "tag_engine_left", "blackhawk_helicopter_hit", undefined, undefined, undefined, 0.2, 1 );
    _id_A5A8::_id_1842( "fx/explosions/grenadeexp_default", "elevator_jnt", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 0.5, 1 );
    _id_A5A8::_id_1842( "fx/fire/fire_smoke_trail_L", "elevator_jnt", "blackhawk_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
    _id_A5A8::_id_1842( "fx/explosions/aerial_explosion", "tag_engine_right", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 2.5, 1 );
    _id_A5A8::_id_1842( "fx/explosions/aerial_explosion", "tag_deathfx", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 4.0 );
    _id_A5A8::_id_1842( var_4, undefined, "blackhawk_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_183B( ::_id_7DDA );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cargo01", "tag_light_cargo01", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_white_blink_daylight", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_white_blink_daylight", "running", 0.3 );
    _id_A5A8::_id_1857( var_2, "wingtip_green", "tag_light_L_wing", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_red", "tag_light_R_wing", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1855();
}

_id_4D10()
{
    self._id_65A7 = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_367F = 762;
    self._id_7957 = 0;
    _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 12000;
    vehicle_scripts\_blackhawk_aud::snd_init_blackhawk();
    thread _id_5D80();

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_2 = distance( self.origin, level.playercardbackground.origin );

            if ( var_0 && var_2 > var_1 )
            {
                vehicle_scripts\_blackhawk_aud::snd_stop_blackhawk( 1.0 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_2 < var_1 )
            {
                vehicle_scripts\_blackhawk_aud::snd_start_blackhawk();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_blackhawk_aud::snd_stop_blackhawk( 1.0 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    vehicle_scripts\_blackhawk_aud::snd_stop_blackhawk( 1.0 );
}

_id_7EFA( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_9CD5 = %bh_idle;

    return var_0;
}
#using_animtree("fastrope");

_id_7FE3( var_0 )
{
    var_0[3]._id_6B52 = %bh_player_idle;

    if ( !isdefined( level.override_blackhawk_unload_audio ) )
    {
        var_0[3]._id_6B28 = "fastrope_start_plr";
        var_0[3]._id_6B2A = "fastrope_loop_plr";
        var_0[3]._id_6B29 = "fastrope_end_plr";
    }

    var_0[3]._id_6B27 = %bh_player_drop;
    var_0[3].player_animtree = #animtree;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 8; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_4B63 = %bh_pilot_idle;
    var_0[1]._id_4B63 = %bh_copilot_idle;
    var_0[2]._id_4B63 = %bh_1_idle;
    var_0[3]._id_4B63 = %bh_2_idle;
    var_0[4]._id_4B63 = %bh_4_idle;
    var_0[5]._id_4B63 = %bh_5_idle;
    var_0[6]._id_4B63 = %bh_8_idle;
    var_0[7]._id_4B63 = %bh_6_idle;
    var_0[0]._id_85AE = "tag_detach";
    var_0[1]._id_85AE = "tag_detach";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[6]._id_85AE = "tag_detach";
    var_0[7]._id_85AE = "tag_detach";
    var_0[2]._id_4068 = %bh_1_drop;
    var_0[3]._id_4068 = %bh_2_drop;
    var_0[4]._id_4068 = %bh_4_drop;
    var_0[5]._id_4068 = %bh_5_drop;
    var_0[6]._id_4068 = %bh_8_drop;
    var_0[7]._id_4068 = %bh_6_drop;
    var_0[2]._id_4076 = "crouch";
    var_0[3]._id_4076 = "crouch";
    var_0[4]._id_4076 = "crouch";
    var_0[5]._id_4076 = "crouch";
    var_0[6]._id_4076 = "crouch";
    var_0[7]._id_4076 = "crouch";
    var_0[2]._id_70DB = 1;
    var_0[3]._id_70DB = 1;
    var_0[4]._id_70DB = 1;
    var_0[5]._id_70DB = 1;
    var_0[6]._id_70DB = 1;
    var_0[7]._id_70DB = 1;
    var_0[2]._id_70DA = %fastrope_fall;
    var_0[3]._id_70DA = %fastrope_fall;
    var_0[4]._id_70DA = %fastrope_fall;
    var_0[5]._id_70DA = %fastrope_fall;
    var_0[6]._id_70DA = %fastrope_fall;
    var_0[7]._id_70DA = %fastrope_fall;
    var_0[2]._id_4075 = "fastrope_getout_npc";
    var_0[3]._id_4075 = "fastrope_getout_npc";
    var_0[4]._id_4075 = "fastrope_getout_npc";
    var_0[5]._id_4075 = "fastrope_getout_npc";
    var_0[6]._id_4075 = "fastrope_getout_npc";
    var_0[7]._id_4075 = "fastrope_getout_npc";
    var_0[2]._id_406F = "fastrope_loop_npc";
    var_0[3]._id_406F = "fastrope_loop_npc";
    var_0[4]._id_406F = "fastrope_loop_npc";
    var_0[5]._id_406F = "fastrope_loop_npc";
    var_0[6]._id_406F = "fastrope_loop_npc";
    var_0[7]._id_406F = "fastrope_loop_npc";
    var_0[2]._id_3680 = "TAG_FastRope_RI";
    var_0[3]._id_3680 = "TAG_FastRope_RI";
    var_0[4]._id_3680 = "TAG_FastRope_LE";
    var_0[5]._id_3680 = "TAG_FastRope_LE";
    var_0[6]._id_3680 = "TAG_FastRope_RI";
    var_0[7]._id_3680 = "TAG_FastRope_LE";
    return _id_7FE3( var_0 );
}

_id_9A3D()
{
    var_0 = [];
    var_0["left"] = [];
    var_0["right"] = [];
    var_0["both"] = [];
    var_0["left"][var_0["left"].size] = 4;
    var_0["left"][var_0["left"].size] = 5;
    var_0["left"][var_0["left"].size] = 7;
    var_0["right"][var_0["right"].size] = 2;
    var_0["right"][var_0["right"].size] = 3;
    var_0["right"][var_0["right"].size] = 6;
    var_0["both"][var_0["both"].size] = 2;
    var_0["both"][var_0["both"].size] = 3;
    var_0["both"][var_0["both"].size] = 4;
    var_0["both"][var_0["both"].size] = 5;
    var_0["both"][var_0["both"].size] = 6;
    var_0["both"][var_0["both"].size] = 7;
    var_0["default"] = var_0["both"];
    return var_0;
}

_id_7DDA()
{
    var_0 = [];
    var_0["TAG_FastRope_LE"] = spawnstruct();
    var_0["TAG_FastRope_LE"].motiontrackerenabled = "rope_test";
    var_0["TAG_FastRope_LE"].tag_aim_animated = "TAG_FastRope_LE";
    var_0["TAG_FastRope_LE"]._id_4B79 = %bh_rope_idle_le;
    var_0["TAG_FastRope_LE"]._id_2F6D = %bh_rope_drop_le;
    var_0["TAG_FastRope_RI"] = spawnstruct();
    var_0["TAG_FastRope_RI"].motiontrackerenabled = "rope_test_ri";
    var_0["TAG_FastRope_RI"].tag_aim_animated = "TAG_FastRope_RI";
    var_0["TAG_FastRope_RI"]._id_4B79 = %bh_rope_idle_ri;
    var_0["TAG_FastRope_RI"]._id_2F6D = %bh_rope_drop_ri;
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        precachemodel( var_0[var_1[var_2]].motiontrackerenabled );

    return var_0;
}
