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

main( var_0, var_1, var_2 )
{
    vehicle_scripts\_mi17_noai::main( var_0, "mi17", var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1839( ::_id_7F23, ::_id_7EFA );
    maps\_vehicle::_id_183B( ::_id_7DDA );
    maps\_vehicle::_id_1873( ::_id_9A3D );
    maps\_vehicle::_id_1855();
}

_id_4D10()
{
    self._id_65A7 = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_367F = 710;
    self._id_7957 = 0;
    maps\_vehicle::_id_9D02( "running" );
    thread _id_4521();
    thread keep_ragdolls_alive();
}

keep_ragdolls_alive()
{
    while ( isdefined( self ) )
    {
        wakeupragdollsphere( self.origin, 300 );
        wait 0.05;
    }
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 12000;
    vehicle_scripts\_mi17_aud::_id_86FA();
    thread _id_5D80();

    if ( isdefined( level.override_aud_mi17_dist_treshold ) )
        var_1 = level.override_aud_mi17_dist_treshold;

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_2 = distance( self.origin, level.player.origin );

            if ( var_0 && var_2 > var_1 )
            {
                vehicle_scripts\_mi17_aud::_id_8777( 1.0 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_2 < var_1 )
            {
                vehicle_scripts\_mi17_aud::_id_876D();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_mi17_aud::_id_8777( 1.0 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    vehicle_scripts\_mi17_aud::_id_8777( 1.0 );
}
#using_animtree("vehicles");

_id_7EFA( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_9CD5 = %mi17_heli_idle;

    return var_0;
}

_id_7FE3( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 10; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[1]._id_4B63 = %mi17_1_idle;
    var_0[2]._id_4B63 = %mi17_2_idle;
    var_0[3]._id_4B63 = %mi17_3_idle;
    var_0[4]._id_4B63 = %mi17_4_idle;
    var_0[5]._id_4B63 = %mi17_5_idle;
    var_0[6]._id_4B63 = %mi17_6_idle;
    var_0[7]._id_4B63 = %mi17_7_idle;
    var_0[8]._id_4B63 = %mi17_8_idle;
    var_0[0]._id_4B63[0] = %helicopter_pilot1_idle;
    var_0[0]._id_4B63[1] = %helicopter_pilot1_twitch_clickpannel;
    var_0[0]._id_4B63[2] = %helicopter_pilot1_twitch_lookback;
    var_0[0]._id_4B63[3] = %helicopter_pilot1_twitch_lookoutside;
    var_0[0]._id_4B7E[0] = 500;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    var_0[0]._id_4B7E[3] = 100;
    var_0[0]._id_1433 = 0;
    var_0[9]._id_1433 = 0;
    var_0[9]._id_4B63[0] = %helicopter_pilot2_idle;
    var_0[9]._id_4B63[1] = %helicopter_pilot2_twitch_clickpannel;
    var_0[9]._id_4B63[2] = %helicopter_pilot2_twitch_lookoutside;
    var_0[9]._id_4B63[3] = %helicopter_pilot2_twitch_radio;
    var_0[9]._id_4B7E[0] = 450;
    var_0[9]._id_4B7E[1] = 100;
    var_0[9]._id_4B7E[2] = 100;
    var_0[9]._id_4B7E[3] = 100;
    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_detach";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[6]._id_85AE = "tag_detach";
    var_0[7]._id_85AE = "tag_detach";
    var_0[8]._id_85AE = "tag_detach";
    var_0[9]._id_85AE = "tag_passenger";
    var_0[1]._id_4068 = %mi17_1_drop;
    var_0[2]._id_4068 = %mi17_2_drop;
    var_0[3]._id_4068 = %mi17_3_drop;
    var_0[4]._id_4068 = %mi17_4_drop;
    var_0[5]._id_4068 = %mi17_5_drop;
    var_0[6]._id_4068 = %mi17_6_drop;
    var_0[7]._id_4068 = %mi17_7_drop;
    var_0[8]._id_4068 = %mi17_8_drop;
    var_0[1]._id_4076 = "crouch";
    var_0[2]._id_4076 = "crouch";
    var_0[3]._id_4076 = "crouch";
    var_0[4]._id_4076 = "crouch";
    var_0[5]._id_4076 = "crouch";
    var_0[6]._id_4076 = "crouch";
    var_0[7]._id_4076 = "crouch";
    var_0[8]._id_4076 = "crouch";
    var_0[1]._id_70DB = 1;
    var_0[2]._id_70DB = 1;
    var_0[3]._id_70DB = 1;
    var_0[4]._id_70DB = 1;
    var_0[5]._id_70DB = 1;
    var_0[6]._id_70DB = 1;
    var_0[7]._id_70DB = 1;
    var_0[8]._id_70DB = 1;
    var_0[1]._id_70DA = %fastrope_fall;
    var_0[2]._id_70DA = %fastrope_fall;
    var_0[3]._id_70DA = %fastrope_fall;
    var_0[4]._id_70DA = %fastrope_fall;
    var_0[5]._id_70DA = %fastrope_fall;
    var_0[6]._id_70DA = %fastrope_fall;
    var_0[7]._id_70DA = %fastrope_fall;
    var_0[8]._id_70DA = %fastrope_fall;
    var_0[1]._id_4075 = "fastrope_getout_npc";
    var_0[2]._id_4075 = "fastrope_getout_npc";
    var_0[3]._id_4075 = "fastrope_getout_npc";
    var_0[4]._id_4075 = "fastrope_getout_npc";
    var_0[5]._id_4075 = "fastrope_getout_npc";
    var_0[6]._id_4075 = "fastrope_getout_npc";
    var_0[7]._id_4075 = "fastrope_getout_npc";
    var_0[8]._id_4075 = "fastrope_getout_npc";
    var_0[1]._id_406F = "fastrope_loop_npc";
    var_0[2]._id_406F = "fastrope_loop_npc";
    var_0[3]._id_406F = "fastrope_loop_npc";
    var_0[4]._id_406F = "fastrope_loop_npc";
    var_0[5]._id_406F = "fastrope_loop_npc";
    var_0[6]._id_406F = "fastrope_loop_npc";
    var_0[7]._id_406F = "fastrope_loop_npc";
    var_0[8]._id_406F = "fastrope_loop_npc";
    var_0[1]._id_3680 = "TAG_FastRope_RI";
    var_0[2]._id_3680 = "TAG_FastRope_RI";
    var_0[3]._id_3680 = "TAG_FastRope_RI";
    var_0[4]._id_3680 = "TAG_FastRope_RI";
    var_0[5]._id_3680 = "TAG_FastRope_LE";
    var_0[6]._id_3680 = "TAG_FastRope_LE";
    var_0[7]._id_3680 = "TAG_FastRope_LE";
    var_0[8]._id_3680 = "TAG_FastRope_LE";
    return _id_7FE3( var_0 );
}

_id_9A3D()
{
    var_0 = [];
    var_0["back"] = [];
    var_0["front"] = [];
    var_0["both"] = [];
    var_0["back"][var_0["back"].size] = 1;
    var_0["back"][var_0["back"].size] = 2;
    var_0["back"][var_0["back"].size] = 3;
    var_0["back"][var_0["back"].size] = 4;
    var_0["front"][var_0["front"].size] = 5;
    var_0["front"][var_0["front"].size] = 6;
    var_0["front"][var_0["front"].size] = 7;
    var_0["front"][var_0["front"].size] = 8;
    var_0["both"][var_0["both"].size] = 1;
    var_0["both"][var_0["both"].size] = 2;
    var_0["both"][var_0["both"].size] = 3;
    var_0["both"][var_0["both"].size] = 4;
    var_0["both"][var_0["both"].size] = 5;
    var_0["both"][var_0["both"].size] = 6;
    var_0["both"][var_0["both"].size] = 7;
    var_0["both"][var_0["both"].size] = 8;
    var_0["default"] = var_0["both"];
    return var_0;
}

_id_7DDA()
{
    var_0 = [];
    var_0["TAG_FastRope_LE"] = spawnstruct();
    var_0["TAG_FastRope_LE"].model = "rope_test";
    var_0["TAG_FastRope_LE"].tag = "TAG_FastRope_LE";
    var_0["TAG_FastRope_LE"]._id_4B79 = %mi17_rope_idle_le;
    var_0["TAG_FastRope_LE"]._id_2F6D = %mi17_rope_drop_le;
    var_0["TAG_FastRope_RI"] = spawnstruct();
    var_0["TAG_FastRope_RI"].model = "rope_test_ri";
    var_0["TAG_FastRope_RI"].tag = "TAG_FastRope_RI";
    var_0["TAG_FastRope_RI"]._id_4B79 = %mi17_rope_idle_ri;
    var_0["TAG_FastRope_RI"]._id_2F6D = %mi17_rope_drop_ri;
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        precachemodel( var_0[var_1[var_2]].model );

    return var_0;
}
