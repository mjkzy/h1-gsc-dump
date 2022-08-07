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
    level.fastrope_globals = spawnstruct();
    level.fastrope_globals.helicopters = [];
    level.fastrope_globals.animload = [];
    level.fastrope_globals.animload["blackhawk"] = 0;
    level.fastrope_globals.heli_inflight = 0;
    level.fastrope_globals.basename = "fastrope_vehicle";
    var_0 = getspawnerarray();
    fastrope_precache();
    common_scripts\utility::_id_0D13( var_0, ::fastrope_setup );
}

fastrope_override( var_0, var_1, var_2, var_3 )
{
    var_4 = fastrope_animname( self.unlockpoints, var_0 );
    level._id_78AC[var_4]["custom_all" + self.teambalanced] = var_1;
    level._id_78AC[var_4]["custom_ride" + self.teambalanced] = var_2;
    level._id_78AC[var_4]["custom_unload" + self.teambalanced] = var_3;
    maps\_anim::_id_0807( var_4, "start", ::play_fastrope_start_sfx, "custom_unload" + self.teambalanced );
    maps\_anim::_id_0807( var_4, "fastrope_end_sfx", ::play_fastrope_end_sfx, "custom_unload" + self.teambalanced );
    maps\_anim::_id_0807( var_4, "custom_land", ::play_fastrope_land_sfx, "custom_unload" + self.teambalanced );
}

fastrope_override_vehicle( var_0, var_1 )
{
    level._id_78AC[self._id_0C72]["pathanim"] = var_0;
    self.pathnode = var_1;
}

play_fastrope_start_sfx( var_0 )
{
    var_0 thread maps\_utility::_id_69C4( "fastrope_start_npc" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
}

play_fastrope_end_sfx( var_0 )
{
    var_0 notify( "stop soundfastrope_loop_npc" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_end_npc" );
}

play_fastrope_land_sfx( var_0 )
{
    var_0 thread maps\_utility::_id_69C4( "step_land_hv_concrete_wet" );
}

fastrope_spawner_think()
{
    self endon( "death" );

    if ( isdefined( self._id_7A99 ) )
    {
        var_0 = strtok( self._id_7A99, ":;, " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( tolower( var_0[var_1] ) == "fastrope_seat" )
            {
                var_1++;
                self.fastrope_seat = int( var_0[var_1] );
            }

            if ( tolower( var_0[var_1] ) == "nounload" )
                self.nounload = 1;
        }
    }

    for (;;)
    {
        self waittill( "spawned", var_2 );

        if ( maps\_utility::_id_88F1( var_2 ) )
            continue;

        var_2.spawntime = self;
        var_2 thread fastrope_ai_think( self );
    }
}

fastrope_ai_think_hack( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.2;

    wait(var_0 - var_1);
    self _meth_8143();
    self notify( "single_anim_done" );
}

fastrope_ai_think( var_0 )
{
    self endon( "death" );
    self endon( "overtakenow" );
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    self linkto( var_1 );
    var_1._id_08B4 = self;
    var_1._id_08B4 hide();
    var_0 fastrope_wait_que( var_1 );

    if ( isdefined( var_0.nounload ) && var_0.nounload == 1 )
    {
        if ( var_1._id_08B4.seat_pos < 9 )
        {
            var_0 fastrope_post_unload( var_1 );
            var_0._id_47A3 waittill( "unload_rest" );
            var_0._id_47A3.que[var_0._id_47A3.que.size] = var_0;
        }
        else
        {
            var_0 fastrope_post_unload( var_1 );

            if ( var_1._id_08B4.seat_pos == 10 )
            {
                common_scripts\utility::_id_384A( "heli_shoot_deck_windows" );
                self.spawntime._id_47A3.motiontrackerenabled notify( "stop_" + var_1._id_08B4.seat_index );
                self.spawntime._id_47A3.motiontrackerenabled thread maps\_anim::_id_0BE1( self, "minigun", "tag_detach" );
            }

            var_0._id_47A3._id_9C7E waittill( "reached_end_node" );
            var_1 delete();
            self delete();
            return;
        }
    }

    var_0._id_47A3 notify( "unload_" + var_1._id_08B4.side );
    var_0 fastrope_pre_unload( var_1 );
    var_2 = "custom_unload" + var_0._id_47A3.teambalanced;
    var_3 = "custom_all" + var_0._id_47A3.teambalanced;

    if ( isdefined( level._id_78AC[var_1._id_08B4._id_0C72][var_3] ) )
    {
        self waittillmatch( "single anim", "start" );
        thread maps\_utility::_id_69C4( "fastrope_start_npc" );
        var_1 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        self waittillmatch( "single_anim_done" );
        var_1 notify( "stop soundfastrope_loop_npc" );
        thread maps\_utility::_id_69C4( "fastrope_end_npc" );
        self unlink();
    }
    else if ( isdefined( level._id_78AC[var_1._id_08B4._id_0C72][var_2] ) )
    {
        thread fastrope_ai_think_hack( getanimlength( level._id_78AC[var_1._id_08B4._id_0C72][var_2] ) );
        var_0._id_47A3.motiontrackerenabled thread maps\_anim::_id_0C24( self, var_2, "tag_detach" );
        self waittillmatch( "single anim", "start" );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        self waittillmatch( "single_anim_done" );
        self unlink();
    }
    else
    {
        var_4 = 45 * var_1._id_08B4.info_player_start + 90;
        var_5 = 360 * var_1._id_08B4.spin;

        if ( var_1._id_08B4.side == "right" )
            var_4 += 180;

        self unlink();
        var_1.origin = self.origin;
        var_1.angles = self.angles;
        var_1 linkto( self );
        var_0._id_47A3 thread fastrope_ropethink( self );
        var_0._id_47A3.motiontrackerenabled thread maps\_anim::_id_0C24( self, "grab", "tag_detach" );
        wait 2.5;
        fastrope_calc( var_1 );
        self waittillmatch( "single anim", "end" );
        var_1 unlink();
        self linkto( var_1 );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        var_1 thread maps\_anim::_id_0BE1( self, "loop", undefined, "stopanimscripted" );
        thread maps\_utility::_id_69C4( "fastrope_start_npc" );
        var_1 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
        var_1 movez( var_1._id_7131 * -1, var_1.titleunlocked );
        var_6 = var_4 - var_5;
        var_1 rotateyaw( var_6, var_1.titleunlocked );
        wait(var_1.titleunlocked);
        var_1 notify( "stopanimscripted" );
        var_1.angles = self.angles;
        var_1 maps\_anim::_id_0C24( self, "land" );
        var_1 notify( "stop soundfastrope_loop_npc" );
        thread maps\_utility::_id_69C4( "fastrope_end_npc" );
        self unlink();
    }

    var_1 delete();
    wait 3;
    self _meth_81a7( 0 );
}

fastrope_wait_que( var_0 )
{
    var_0._id_08B4 endon( "death" );
    fastrope_waiton_helicopter( var_0 );

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_unload" + self._id_47A3.teambalanced] ) )
        return;

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3.teambalanced] ) )
        return;

    if ( var_0._id_08B4.side == "left" )
        wait 0.5;
}
#using_animtree("generic_human");

fastrope_ropethink( var_0 )
{
    var_1 = var_0.side;
    var_2 = "ropeidle" + var_1;
    var_3 = "ropeall" + var_1;

    if ( !isdefined( level._id_78AC[self.teambalanced] ) )
        return;

    if ( !( isdefined( level._id_78AC[self.teambalanced][var_2] ) || isdefined( level._id_78AC[self.teambalanced][var_3] ) ) )
        return;

    if ( isdefined( self.rope_dropped[var_1] ) && self.rope_dropped[var_1] == 1 )
        return;

    self.rope_dropped[var_1] = 1;
    var_4 = undefined;

    switch ( self.unlockpoints )
    {
        case "blackhawk":
            switch ( var_1 )
            {
                case "left":
                    var_4 = "TAG_FastRope_LE";
                    break;
                case "right":
                    var_4 = "TAG_FastRope_RI";
                    break;
            }

            break;
    }

    var_5 = spawn( "script_model", self.motiontrackerenabled gettagorigin( var_4 ) );
    var_5.angles = self.motiontrackerenabled gettagangles( var_4 );
    var_5 setmodel( level._id_5D45["heli"]["rope"][var_1] );
    var_5._id_0C72 = self._id_0C72;
    var_5 useanimtree( #animtree );
    var_5 linkto( self.motiontrackerenabled, var_4 );

    if ( isdefined( level._id_78AC[self.teambalanced][var_3] ) )
    {
        var_6 = getanimlength( level._id_78AC[self.teambalanced][var_3] );
        self.motiontrackerenabled thread maps\_anim::_id_0C24( var_5, var_3, var_4 );
        wait(var_6 - 1.5);
    }
    else
    {
        self.motiontrackerenabled thread maps\_anim::_id_0BE1( var_5, var_2, var_4, "stop_" + var_2 );
        self waittill( "unload_" + var_1 );
        self.motiontrackerenabled notify( "stop_" + var_2 );
        var_2 = "ropedrop" + var_1;
        self.motiontrackerenabled thread maps\_anim::_id_0C24( var_5, var_2, var_4 );

        while ( self.que.size )
            self waittill( "check_fastrope_que" );

        wait(self._id_5605);
    }

    var_5 unlink();
    self waittill( "returnflight" );
    self.rope_dropped[var_1] = 0;
}

fastrope_pre_unload( var_0 )
{
    fastrope_free_seat( var_0 );
}

fastrope_post_unload( var_0 )
{
    self._id_47A3._id_5605 = var_0.titleunlocked;
    wait 0.1;
    self._id_47A3.que = common_scripts\utility::_id_0CF6( self._id_47A3.que, self );
    self._id_47A3 thread fastrope_que_check();
}

fastrope_que_check()
{
    wait(self.unloadwait);
    self notify( "check_fastrope_que" );
}

fastrope_waiton_helicopter( var_0 )
{
    var_0._id_08B4 endon( "death" );
    thread fastrope_attach_helicopter( var_0 );

    if ( !self._id_47A3.inflight )
        self._id_47A3 thread fastrope_heli_fly();

    self._id_47A3 endon( "overtakenow" );

    if ( !self._id_47A3._id_71D4 )
        self._id_47A3 waittill( "ready" );
}

fastrope_attach_helicopter( var_0 )
{
    var_0._id_08B4 endon( "death" );
    var_0._id_08B4 endon( "overtakenow" );

    for (;;)
    {
        if ( !self._id_47A3.inflight )
            self._id_47A3 waittill( "inflight" );

        fastrope_find_seat( var_0._id_08B4 );

        if ( !isdefined( var_0._id_08B4.seat_index ) )
        {
            self._id_47A3 waittill( "seat_open" );
            continue;
        }
        else
            break;
    }

    self._id_47A3.motiontrackerenabled endon( "death" );
    var_1 = var_0._id_08B4.seat_index;
    var_0._id_08B4._id_0C72 = self._id_47A3.seats[var_1]._id_0C72;
    var_0._id_08B4.info_player_start = self._id_47A3.seats[var_1].info_player_start;
    var_0._id_08B4.side = self._id_47A3.seats[var_1].side;
    var_0._id_08B4.spin = self._id_47A3.seats[var_1].spin;
    self._id_47A3.que[self._id_47A3.que.size] = self;
    var_0 moveto( self._id_47A3.motiontrackerenabled gettagorigin( "tag_detach" ), 0.05 );
    wait 0.1;
    var_0.angles = self._id_47A3.motiontrackerenabled gettagangles( "tag_detach" );
    var_0 linkto( self._id_47A3.motiontrackerenabled, "tag_detach" );
    var_0._id_08B4 show();
    var_0._id_08B4 linkto( self._id_47A3.motiontrackerenabled, "tag_detach" );
    self._id_47A3 thread fastrope_ropethink( var_0._id_08B4 );
    self._id_47A3.motiontrackerenabled endon( "stop_" + var_1 );

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3.teambalanced] ) )
    {
        var_0._id_08B4 linkto( self._id_47A3.motiontrackerenabled, "tag_detach" );
        var_0._id_08B4 _meth_81a7( 1 );
        var_0 linkto( var_0._id_08B4 );
        self._id_47A3.motiontrackerenabled thread maps\_anim::_id_0C24( var_0._id_08B4, "custom_all" + self._id_47A3.teambalanced, "tag_detach" );
        var_0 notify( "custom_all" );
        var_0._id_08B4 thread fastrope_ai_think_hack( getanimlength( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3.teambalanced] ), 0.25 );
        return;
    }

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_ride" + self._id_47A3.teambalanced] ) )
    {
        var_0._id_08B4 linkto( self._id_47A3.motiontrackerenabled, "tag_detach" );
        var_0._id_08B4 _meth_81a7( 1 );
        var_0 linkto( var_0._id_08B4 );
        self._id_47A3.motiontrackerenabled maps\_anim::_id_0C24( var_0._id_08B4, "custom_ride" + self._id_47A3.teambalanced, "tag_detach" );

        if ( self._id_47A3._id_71D4 )
            return;
    }

    self._id_47A3.motiontrackerenabled thread maps\_anim::_id_0BE1( var_0._id_08B4, "idle", "tag_detach", "stop_" + var_1 );
}

fastrope_free_seat( var_0 )
{
    if ( !isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3.teambalanced] ) )
    {
        self._id_47A3.motiontrackerenabled notify( "stop_" + var_0._id_08B4.seat_index );
        var_0._id_08B4 _meth_8143();
        var_0.origin = var_0._id_08B4.origin;
        var_0.angles = var_0._id_08B4.angles;
    }

    self._id_47A3.seats[var_0._id_08B4.seat_index].taken = undefined;
    self._id_47A3 notify( "seat_open" );
}

fastrope_find_seat( var_0 )
{
    var_0.seat_index = undefined;

    if ( isdefined( self.fastrope_seat ) )
    {
        for ( var_1 = 0; var_1 < self._id_47A3.seats.size; var_1++ )
        {
            if ( self._id_47A3.seats[var_1]._id_6E57 != self.fastrope_seat )
                continue;

            if ( isdefined( self._id_47A3.seats[var_1].taken ) )
                self._id_47A3.seats[var_1].taken.spawntime fastrope_find_seat( self._id_47A3.seats[var_1].taken );

            self._id_47A3.seats[var_1].taken = var_0;
            var_0.seat_index = var_1;
            var_0.seat_pos = self._id_47A3.seats[var_1]._id_6E57;
            return;
        }
    }

    for ( var_1 = 0; var_1 < self._id_47A3.seats.size; var_1++ )
    {
        if ( isdefined( self._id_47A3.seats[var_1].taken ) )
            continue;

        self._id_47A3.seats[var_1].taken = var_0;
        var_0.seat_index = var_1;
        var_0.seat_pos = self._id_47A3.seats[var_1]._id_6E57;
        break;
    }
}

fastrope_player_think()
{
    maps\mo_tools::playerweapontake();
    var_0 = fastrope_player_attach();
    level.playercardbackground.cgocamera = var_0;
    self.motiontrackerenabled thread fastrope_player_quake();
    self endon( "overtakenow" );
    wait 0.1;
    var_1 = 0;

    for ( var_2 = 0; var_2 < self.seats.size; var_2++ )
    {
        if ( isdefined( self.seats[var_2].taken ) )
        {
            if ( self.seats[var_2].taken != level.playercardbackground )
            {
                var_1++;
                continue;
            }

            break;
        }
    }

    self.que = common_scripts\utility::_id_0CED( self.que, level.playercardbackground, var_1 );
    wait 2;
    level.playercardbackground setplayerangles( ( 15.0, 70.0, 0.0 ) );
    self._id_9C7E waittill( "reached_wait_node" );
    wait 2.5;

    if ( getdvar( "fastropeunlock" ) == "" )
        setdvar( "fastropeunlock", "0" );

    if ( !isdefined( getdvar( "fastropeunlock" ) ) )
        setdvar( "fastropeunlock", "0" );

    fastrope_player_viewshift();
    fastrope_player_unload();
}

play_fast_rope_fx()
{
    var_0 = spawn( "script_model", level.playercardbackground.origin );
    var_0 setmodel( "tag_origin" );
    var_0 linkto( level.playercardbackground );
    playfxontag( level._effect["rain_drops_fastrope"], var_0, "tag_origin" );
    wait 3;
    var_0 delete();
}

fastrope_player_viewshift()
{
    var_0 = int( getdvar( "fastropeunlock" ) );

    if ( !var_0 )
        fastrope_player_viewshift_lock();
    else
        fastrope_player_viewshift_nolock();
}

fastrope_player_unload()
{
    var_0 = int( getdvar( "fastropeunlock" ) );

    if ( !var_0 )
        fastrope_player_unload_lock();
    else
        fastrope_player_unload_nolock();
}

fastrope_player_viewshift_nolock()
{
    var_0 = level.playercardbackground.cgocamera;
    wait 1;
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 100, 100, 30, 80 );
    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_nolock()
{
    var_0 = level.playercardbackground.cgocamera;
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_0 linkto( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0.0, 233.0, 0.0 ) );
    var_3 = maps\_utility::vector_multiply( var_3, 30 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level.playercardbackground );
    thread fastrope_que_check();
    fastrope_calc( level.playercardbackground );
    level.playercardbackground.titleunlocked += 1;
    self._id_5605 = level.playercardbackground.titleunlocked;
    var_4 = ( level.playercardbackground._id_7131 + 100 ) * -1;
    var_1 moveto( ( 3220.0, 255.0, 435.0 ), level.playercardbackground.titleunlocked );
    var_1 thread maps\_anim::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    wait(level.playercardbackground.titleunlocked);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_end_plr" );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "hud_drawhud", "1" );
    level.playercardbackground unlink();
    level.playercardbackground allowlean( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    var_1 delete();
    var_0 delete();
}

fastrope_player_viewshift_nolock2()
{
    var_0 = level.playercardbackground.cgocamera;
    wait 1;
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 100, 100, 30, 80 );
    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_nolock2()
{
    var_0 = level.playercardbackground.cgocamera;
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_0 linkto( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0.0, 233.0, 0.0 ) );
    var_3 = maps\_utility::vector_multiply( var_3, 30 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level.playercardbackground );
    thread fastrope_que_check();
    fastrope_calc( level.playercardbackground );
    level.playercardbackground.titleunlocked += 1;
    self._id_5605 = level.playercardbackground.titleunlocked;
    var_4 = ( level.playercardbackground._id_7131 + 100 ) * -1;
    var_1 moveto( ( 3220.0, 300.0, 400.0 ), level.playercardbackground.titleunlocked );
    var_1 thread maps\_anim::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    var_5 = 0.5;
    wait(level.playercardbackground.titleunlocked - var_5);
    var_1 rotateto( ( -60.0, 225.0, 0.0 ), var_5, var_5 * 0.5, var_5 * 0.5 );
    wait(var_5);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_end_plr" );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "hud_drawhud", "1" );
    level.playercardbackground unlink();
    level.playercardbackground allowlean( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    var_1 delete();
    var_0 delete();
}

fastrope_player_viewshift_lock()
{
    var_0 = level.playercardbackground.cgocamera;

    if ( isdefined( level.playercardbackground.ropecamera ) )
    {
        level.playercardbackground lerpviewangleclamp( 1, 0.1, 0.1, 0, 0, 0, 0 );
        wait 1;
        level.playercardbackground playerlinktodelta( level.playercardbackground.ropecamera, "tag_player", 1, 0, 0, 0, 0, 1 );
        wait 0.1;
    }
    else
    {
        var_1 = spawn( "script_origin", var_0.origin );
        var_1.angles = level.playercardbackground getplayerangles();
        var_2 = 1;
        var_3 = var_0 gettagangles( "tag_player" );
        var_1 rotateto( var_3, var_2, var_2 * 0.5, var_2 * 0.5 );
        var_4 = int( var_2 * 20 );
        var_5 = var_4;
        level.playercardbackground freezecontrols( 1 );

        while ( var_4 )
        {
            var_4--;
            level.playercardbackground setplayerangles( ( var_1.angles[0], var_1.angles[1], level.playercardbackground getplayerangles()[2] ) );
            wait 0.05;

            if ( var_4 > var_5 * 0.5 )
                continue;

            if ( var_4 % 2 )
                continue;

            if ( !var_4 )
                break;

            var_3 = var_0 gettagangles( "tag_player" );
            var_1 rotateto( var_3, var_2 * var_4 / var_5 );
        }

        level.playercardbackground setplayerangles( ( var_1.angles[0], var_1.angles[1], level.playercardbackground getplayerangles()[2] ) );
        level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 15, 15, 5, 5 );
        wait 0.1;
        level.playercardbackground freezecontrols( 0 );
        var_1 delete();
    }

    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_lock()
{
    var_0 = level.playercardbackground.cgocamera;
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_0 linkto( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0.0, 233.0, 0.0 ) );
    var_3 = maps\_utility::vector_multiply( var_3, -50 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level.playercardbackground );
    thread fastrope_que_check();
    fastrope_calc( level.playercardbackground );
    level.playercardbackground.titleunlocked += 0.5;
    self._id_5605 = level.playercardbackground.titleunlocked;
    var_4 = ( level.playercardbackground._id_7131 + 100 ) * -1;
    var_5 = var_2 / ( level.playercardbackground.titleunlocked + 0.5 );
    var_6 = var_4 * var_5;
    var_7 = var_1.origin + var_3 + ( 0, 0, var_6 );
    var_1 rotateto( ( 80.0, 233.0, 0.0 ), var_2, var_2 * 0.5, var_2 * 0.5 );
    var_1 moveto( var_7, var_2 );
    var_1 thread maps\_anim::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    thread play_fast_rope_fx();
    wait(var_2);
    var_8 = 0.5;
    var_9 = level.playercardbackground.titleunlocked - var_2 + 0.5 - var_8;
    var_6 = var_4 - var_6;
    var_5 = ( level.playercardbackground.titleunlocked + 0.5 ) * var_6 / var_4;
    var_3 = maps\_utility::vector_multiply( var_3, -1 );
    var_7 = var_1.origin + var_3 + ( 0, 0, var_6 );
    var_1 moveto( var_7, level.playercardbackground.titleunlocked + 0.5 - var_2 );
    wait(var_9);
    var_1 rotateto( ( 10.0, 233.0, 0.0 ), var_8, var_8 * 0.5, var_8 * 0.5 );
    wait(var_8 - 0.25);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread maps\_utility::_id_69C4( "fastrope_end_plr" );
    var_1 moveto( ( 3200.0, 225.0, 337.0 ), 0.5 );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "hud_drawhud", "1" );
    wait 0.4;
    level.playercardbackground unlink();
    level.playercardbackground allowlean( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    var_1 delete();
    var_0 delete();

    if ( isdefined( level.playercardbackground.ropecamera ) )
    {
        level.playercardbackground.ropecamera delete();
        level.playercardbackground.ropecamera = undefined;
    }
}
#using_animtree("fastrope");

fastrope_player_attach()
{
    var_0 = spawn( "script_model", self.motiontrackerenabled gettagorigin( "tag_detach" ) );
    var_0 setmodel( level._id_5D45["player"]["fastrope"] );
    var_0 linkto( self.motiontrackerenabled, "tag_detach", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0._id_0C72 = fastrope_animname( self.unlockpoints, "player" );
    var_0 useanimtree( #animtree );
    var_0 hide();
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 100, 100, 30, 60 );
    self.motiontrackerenabled thread maps\_anim::_id_0C24( var_0, "ride", "tag_detach", self.motiontrackerenabled );
    level.playercardbackground allowlean( 0 );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );

    if ( isdefined( level._id_78B5["fastrope_intro"] ) )
    {
        var_1 = maps\_utility::_id_88D1( "fastrope_intro" );
        var_1 linkto( self.motiontrackerenabled, "tag_detach" );
        self.motiontrackerenabled thread maps\_anim::_id_0C24( var_1, "opening", "tag_detach", self.motiontrackerenabled );
        level.playercardbackground playerlinktodelta( var_1, "tag_player", 1, 65, 74, 30, 35, 1 );
        level.playercardbackground.ropecamera = var_1;

        if ( isdefined( level.scr_gun["fastrope_intro"] ) )
            var_1 attach( level.scr_gun["fastrope_intro"], "tag_weapon" );
    }

    return var_0;
}

fastrope_player_quake()
{
    self endon( "death" );
    self endon( "stopquake" );

    for (;;)
    {
        wait 0.1;
        earthquake( 0.2, 0.1, self.origin, 256 );
    }
}
#using_animtree("vehicles");

fastrope_heli_fly()
{
    self.inflight = 1;

    if ( self._id_71D4 )
        return;

    if ( self.returnflight )
        self waittill( "returnflight" );

    if ( isdefined( self.pathnode ) )
    {
        var_0 = getstartorigin( self.pathnode.origin, self.pathnode.angles, level._id_78AC[self._id_0C72]["pathanim"] );
        var_1 = getstartangles( self.pathnode.origin, self.pathnode.angles, level._id_78AC[self._id_0C72]["pathanim"] );
        self._id_9C7E = spawn( "script_model", var_0 );
        self._id_9C7E.angles = var_1;
    }
    else if ( isdefined( self.startnode ) )
        self._id_9C7E = spawnvehicle( self.modelname, self.teambalanced, self.unlockpoints, self.startnode.origin, self.startnode.angles );
    else
        return;

    self._id_9C7E setmodel( self.modelname );
    self.motiontrackerenabled = self._id_9C7E;

    if ( isdefined( level._sea_org ) )
    {
        self.motiontrackerenabled = spawn( "script_model", self._id_9C7E.origin );
        self.motiontrackerenabled setmodel( self.modelname );
        self.motiontrackerenabled.angles = self._id_9C7E.angles;
        self.motiontrackerenabled thread fastrope_heli_fly_sea( self._id_9C7E );
        self._id_9C7E hide();
        self._id_9C7E setcontents( 0 );
    }

    self.motiontrackerenabled linkto( self._id_9C7E, "tag_detach" );
    self.motiontrackerenabled useanimtree( #animtree );
    self.motiontrackerenabled _meth_814d( level._id_78AC[fastrope_animname( self.unlockpoints, "heli" )]["loop"][0] );
    self.motiontrackerenabled.visionsetnaked = self.unlockpoints;
    self.motiontrackerenabled thread maps\_vehicle_code::_id_0995();
    self notify( "inflight" );

    if ( self.playercardbackground )
        thread fastrope_player_think();

    self endon( "overtakenow" );
    wait 0.1;
    level.fastrope_globals.heli_inflight = 1;
    fastrope_heli_waittill_unload();
    self._id_9C7E notify( "reached_wait_node" );
    self.inflight = 0;
    level.fastrope_globals.heli_inflight = 0;
    self.returnflight = 1;
    self._id_71D4 = 1;
    self notify( "ready" );
    self._id_71D4 = 0;

    while ( self.que.size )
        self waittill( "check_fastrope_que" );

    wait(self._id_5605);
    self._id_9C7E notify( "going_home" );

    if ( isdefined( self.overtake ) )
    {
        self notify( "overtake" );
        return;
    }

    if ( isdefined( self.pathnode ) )
    {
        self._id_9C7E waittillmatch( "single anim", "end" );
        self._id_9C7E notify( "reached_end_node" );
    }
    else
    {
        self._id_9C7E resumespeed( 10 );
        self._id_9C7E waittill( "reached_end_node" );
    }

    fastrope_heli_cleanup();
}

fastrope_heli_waittill_unload()
{
    if ( isdefined( self.pathnode ) )
    {
        self._id_9C7E endon( "fake_wait_node" );
        wait 0.1;
        self.motiontrackerenabled thread common_scripts\utility::_id_6975( self.enginesnd );
        self._id_9C7E._id_0C72 = self._id_0C72;
        self._id_9C7E useanimtree( #animtree );
        wait 1.15;
        self.pathnode thread maps\_anim::_id_0C24( self._id_9C7E, "pathanim" );
        self._id_9C7E waittillmatch( "single anim", "stop" );
    }
    else
    {
        self._id_9C7E attachpath( self.startnode );
        self._id_9C7E startpath();
        wait 0.1;
        self.motiontrackerenabled thread common_scripts\utility::_id_6975( self.enginesnd );
        self._id_9C7E setwaitnode( self.stopnode );
        self._id_9C7E waittill( "reached_wait_node" );
        self notify( "almost_ready" );
        self._id_9C7E vehicle_setspeed( 0, 25 );

        while ( self._id_9C7E vehicle_getspeed() > 0 )
            wait 0.1;
    }
}

fastrope_heli_cleanup()
{
    self.motiontrackerenabled notify( "stop_anim_loop" );
    self.motiontrackerenabled notify( "stop sound" + self.enginesnd );
    self._id_9C7E delete();
    self._id_9C7E = undefined;

    if ( isdefined( self.motiontrackerenabled ) )
    {
        self.motiontrackerenabled delete();
        self.motiontrackerenabled = undefined;
    }

    self.returnflight = 0;
    self notify( "returnflight" );
}

fastrope_heli_overtake()
{
    self.overtake = 1;
    self waittill( "overtake" );
    self.motiontrackerenabled notify( "overtake" );
    var_0 = self.motiontrackerenabled.angles;
    var_1 = self._id_9C7E.origin;
    self._id_9C7E delete();
    self._id_9C7E = undefined;
    self._id_9C7E = spawnvehicle( self.modelname, self.teambalanced, self.unlockpoints, var_1, var_0 );
    self._id_9C7E.visionsetnaked = "blackhawk";
    self._id_9C7E.helmet = 100000;
    self._id_9C7E hide();
    self._id_9C7E setcontents( 0 );
    self.motiontrackerenabled linkto( self._id_9C7E, "tag_detach" );
    self.motiontrackerenabled thread fastrope_heli_fly_sea( self._id_9C7E );
}

fastrope_heli_overtake_now()
{
    self.overtake = 1;
    self notify( "overtakenow" );
    self.motiontrackerenabled notify( "overtake" );
    var_0 = self._id_9C7E.angles;
    var_1 = self._id_9C7E.origin;
    self._id_9C7E delete();
    self._id_9C7E = undefined;
    self._id_9C7E = spawnvehicle( self.modelname, self.teambalanced, self.unlockpoints, var_1, var_0 );
    self._id_9C7E.visionsetnaked = "blackhawk";
    self._id_9C7E.helmet = 100000;
    self._id_9C7E hide();
    self._id_9C7E setcontents( 0 );
    self.motiontrackerenabled thread fastrope_heli_fly_sea( self._id_9C7E );
}

fastrope_heli_playexteriorlightfx()
{
    playfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_L_wing" );
    playfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_R_wing" );
    playfxontag( level._effect["aircraft_light_white_blink"], self, "tag_light_belly" );
    wait 0.25;
    playfxontag( level._effect["aircraft_light_white_blink"], self, "tag_light_tail" );
}

fastrope_heli_playinteriorlightfx()
{
    playfxontag( level._effect["aircraft_light_cockpit_blue"], self, "tag_light_cockpit01" );
}

fastrope_heli_playinteriorlightfx2()
{
    playfxontag( level._effect["aircraft_light_cockpit_red"], self, "tag_light_cargo01" );
}

fastrope_heli_playinteriorlightgreenfx( var_0 )
{
    var_1 = common_scripts\utility::_id_8959();
    var_1 linkto( self, "tag_light_cargo01", ( 0.0, 0.0, 0.0 ), ( 0.0, -90.0, 0.0 ) );

    if ( var_0 == 1 )
        playfxontag( level._effect["aircraft_light_cockpit_green"], var_1, "tag_origin" );
}

fastrope_heli_fly_sea( var_0 )
{
    self endon( "death" );
    self endon( "overtake" );

    for (;;)
    {
        var_1 = level._sea_link localtoworldcoords( var_0.origin );
        var_2 = combineangles( level._sea_link.angles, var_0 gettagangles( "tag_detach" ) );
        self moveto( var_1 + level._sea_link._id_6379, 0.1 );
        self rotateto( var_2, 0.1 );
        wait 0.1;
    }
}

fastrope_calc( var_0 )
{
    var_1 = var_0.origin;
    var_2 = physicstrace( var_1, var_1 + ( 0.0, 0.0, -10000.0 ) );
    var_3 = distance( var_1, var_2 ) + 1;
    var_4 = 400;
    var_5 = int( var_3 - 128 );
    var_6 = int( var_5 / var_4 );
    var_7 = var_5 - var_4 * var_6;
    var_8 = var_7 / var_4;
    var_9 = ( var_6 + var_8 ) * 1.6;
    var_10 = var_8 * -360;
    var_11 = var_0.angles + ( 0, var_10, 0 );
    var_0._id_7131 = var_5;
    var_0.titleunlocked = var_9;
    var_0.startangle = var_11;
}

fastrope_setup()
{
    if ( !( isdefined( self.script_parentname ) && self.script_parentname == "fastrope_friendlies" ) )
        return;

    self._id_47A3 = fastrope_heli_setup( self.teambalanced );
    fastrope_animload( self._id_47A3 );
    thread fastrope_spawner_think();
}

fastrope_heli_setup( var_0 )
{
    var_1 = undefined;
    var_1 = level.fastrope_globals.helicopters[fastrope_heliname( var_0 )];

    if ( isdefined( var_1 ) )
        return var_1;

    var_2 = common_scripts\utility::_id_40FB( var_0, "target" );
    var_1 = spawnstruct();
    var_1._id_9C7E = undefined;
    var_1.teambalanced = fastrope_heliname( var_0 );
    var_1._id_0C72 = var_1.teambalanced;
    var_1.startnode = getvehiclenode( var_0, "targetname" );
    var_1.stopnode = undefined;
    var_1._id_5605 = undefined;
    var_1._id_71D4 = 0;
    var_1.inflight = 0;
    var_1.returnflight = 0;
    var_1.que = [];
    var_1.rope_dropped = [];
    var_1.modelname = "vehicle_blackhawk_hero_sas_night";
    var_1.unlockpoints = "blackhawk";
    var_1.enginesnd = "blackhawk_engine_high";
    var_1.playercardbackground = 0;
    var_1.unload = "both";
    var_1.unloadwait = 1;

    if ( isdefined( var_2._id_7A99 ) )
    {
        var_3 = strtok( var_2._id_7A99, ":;,= " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( tolower( var_3[var_4] ) == "model" )
            {
                var_4++;

                switch ( var_3[var_4] )
                {
                    case "blackhawk":
                        var_1.modelname = "vehicle_blackhawk_hero_sas_night";
                        var_1.unlockpoints = "blackhawk";
                        var_1.enginesnd = "blackhawk_engine_high";
                        break;
                }

                continue;
            }

            if ( tolower( var_3[var_4] ) == "player" )
            {
                var_4++;

                if ( tolower( var_3[var_4] ) == "true" )
                    var_1.playercardbackground = 1;

                continue;
            }

            if ( tolower( var_3[var_4] ) == "unload" )
            {
                var_4++;

                if ( var_3[var_4] == "both" || var_3[var_4] == "left" || var_3[var_4] == "right" )
                    var_1.unload = var_3[var_4];
            }
        }
    }

    fastrope_heli_setup_seats( var_1 );

    if ( isdefined( var_1.startnode ) )
    {
        var_5 = var_1.startnode;

        while ( isdefined( var_5._not_team ) )
        {
            var_5 = getvehiclenode( var_5._not_team, "targetname" );

            if ( isdefined( var_5.script_parentname ) && var_5.script_parentname == "stop" )
            {
                var_1.stopnode = var_5;
                break;
            }
        }

        if ( !isdefined( var_1.stopnode ) )
        {

        }
    }

    level.fastrope_globals.helicopters[var_1.teambalanced] = var_1;
    return var_1;
}

fastrope_heli_setup_seats( var_0 )
{
    var_0.seats = [];

    switch ( var_0.unlockpoints )
    {
        case "blackhawk":
            switch ( var_0.unload )
            {
                case "both":
                    var_0.seats[0] = fastrope_createseat( var_0.unlockpoints, 1 );
                    var_0.seats[1] = fastrope_createseat( var_0.unlockpoints, 2 );
                    var_0.seats[2] = fastrope_createseat( var_0.unlockpoints, 5 );
                    var_0.seats[3] = fastrope_createseat( var_0.unlockpoints, 4 );
                    var_0.seats[4] = fastrope_createseat( var_0.unlockpoints, 8 );
                    var_0.seats[5] = fastrope_createseat( var_0.unlockpoints, 6 );
                    var_0.seats[6] = fastrope_createseat( var_0.unlockpoints, 7 );
                    var_0.seats[7] = fastrope_createseat( var_0.unlockpoints, 3 );
                    var_0.seats[8] = fastrope_createseat( var_0.unlockpoints, 9 );
                    var_0.seats[9] = fastrope_createseat( var_0.unlockpoints, 10 );

                    if ( var_0.playercardbackground )
                    {
                        level.playercardbackground.side = "right";
                        var_0.seats[4].taken = level.playercardbackground;
                    }

                    break;
                case "right":
                    var_0.seats[0] = fastrope_createseat( var_0.unlockpoints, 1 );
                    var_0.seats[1] = fastrope_createseat( var_0.unlockpoints, 2 );
                    var_0.seats[2] = fastrope_createseat( var_0.unlockpoints, 8 );
                    var_0.seats[3] = fastrope_createseat( var_0.unlockpoints, 7 );
                    var_0.seats[4] = fastrope_createseat( var_0.unlockpoints, 9 );
                    var_0.seats[5] = fastrope_createseat( var_0.unlockpoints, 10 );

                    if ( var_0.playercardbackground )
                    {
                        level.playercardbackground.side = "right";
                        var_0.seats[2].taken = level.playercardbackground;
                    }

                    break;
                case "left":
                    var_0.seats[0] = fastrope_createseat( var_0.unlockpoints, 5 );
                    var_0.seats[1] = fastrope_createseat( var_0.unlockpoints, 4 );
                    var_0.seats[2] = fastrope_createseat( var_0.unlockpoints, 6 );
                    var_0.seats[3] = fastrope_createseat( var_0.unlockpoints, 3 );
                    var_0.seats[4] = fastrope_createseat( var_0.unlockpoints, 9 );
                    var_0.seats[5] = fastrope_createseat( var_0.unlockpoints, 10 );

                    if ( var_0.playercardbackground )
                        level.playercardbackground.side = "right";

                    break;
            }

            break;
    }
}

fastrope_precache()
{
    level._id_5D45["player"]["fastrope"] = "fastrope_arms";
    level._id_5D45["heli"]["rope"]["right"] = "rope_test_ri";
    level._id_5D45["heli"]["rope"]["left"] = "rope_test";
    precachemodel( level._id_5D45["player"]["fastrope"] );
    precachemodel( level._id_5D45["heli"]["rope"]["right"] );
    precachemodel( level._id_5D45["heli"]["rope"]["left"] );
}

fastrope_ropeanimload( var_0, var_1, var_2, var_3 )
{
    level._id_78AC[self.teambalanced]["ropeall" + var_2] = var_3;
    level._id_78AC[self.teambalanced]["ropeidle" + var_2][0] = var_0;
    level._id_78AC[self.teambalanced]["ropedrop" + var_2] = var_1;
}
#using_animtree("generic_human");

fastrope_animload( var_0 )
{
    var_1 = var_0.unlockpoints;

    if ( level.fastrope_globals.animload[var_1] )
        return;

    level.fastrope_globals.animload[var_1] = 1;
    fastrope_animload_heli( var_1 );
    fastrope_animload_player( var_1 );

    switch ( var_1 )
    {
        case "blackhawk":
            var_2 = fastrope_animname( var_1, 1 );
            level._id_78AC[var_2]["idle"][0] = %bh_1_idle;
            level._id_78AC[var_2]["grab"] = %bh_1_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 2 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 3 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 4 );
            level._id_78AC[var_2]["idle"][0] = %bh_4_idle;
            level._id_78AC[var_2]["grab"] = %bh_4_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 5 );
            level._id_78AC[var_2]["idle"][0] = %bh_5_idle;
            level._id_78AC[var_2]["grab"] = %bh_5_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 6 );
            level._id_78AC[var_2]["idle"][0] = %bh_6_idle;
            level._id_78AC[var_2]["grab"] = %bh_6_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 7 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 8 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 9 );
            level._id_78AC[var_2]["idle"][0] = %bh_pilot_idle;
            var_2 = fastrope_animname( var_1, 10 );
            level._id_78AC[var_2]["idle"][0] = %bh_copilot_idle;
            level._id_78AC[var_2]["minigun"][0] = %h1_cargoship_blackhawk_copilote_minigun;
            break;
    }
}

fastrope_createseat( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.taken = undefined;
    var_2._id_0C72 = fastrope_animname( var_0, var_1 );
    var_2.side = fastrope_getside( var_0, var_1 );
    var_2.info_player_start = fastrope_getindex( var_0, var_1 );
    var_2.spin = fastrope_getspin( var_0, var_1 );
    var_2._id_6E57 = var_1;
    return var_2;
}

fastrope_heliname( var_0 )
{
    return level.fastrope_globals.basename + var_0;
}

fastrope_animname( var_0, var_1 )
{
    return "fastrope_" + var_0 + "_" + var_1;
}

fastrope_get_heli( var_0 )
{
    return level.fastrope_globals.helicopters[level.fastrope_globals.basename + var_0];
}

fastrope_getspin( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = 0;
            var_2[2] = 0;
            var_2[8] = 0;
            var_2[7] = 0;
            var_2[5] = 0;
            var_2[4] = 1;
            var_2[6] = 1;
            var_2[3] = 1;
            var_2[9] = undefined;
            var_2[10] = undefined;
    }

    return var_2[var_1];
}

fastrope_getindex( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = 0;
            var_2[2] = 0.25;
            var_2[8] = -1.5;
            var_2[7] = 1;
            var_2[5] = 0;
            var_2[4] = 0.25;
            var_2[6] = -1.5;
            var_2[3] = 1;
            var_2[9] = undefined;
            var_2[10] = undefined;
    }

    return var_2[var_1];
}

fastrope_getside( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = "right";
            var_2[2] = "right";
            var_2[3] = "left";
            var_2[4] = "left";
            var_2[5] = "left";
            var_2[6] = "left";
            var_2[7] = "right";
            var_2[8] = "right";
            var_2[9] = "right";
            var_2[10] = "right";
    }

    return var_2[var_1];
}
#using_animtree("fastrope");

fastrope_animload_player( var_0 )
{
    switch ( var_0 )
    {
        case "blackhawk":
            var_1 = fastrope_animname( var_0, "player" );
            level._id_78AC[var_1]["idle"][0] = %cs_bh_player_idle;
            level._id_78AC[var_1]["ride"] = %bh_player_rope_start;
            level._id_78AC[var_1]["loop"][0] = %bh_player_rope_middle;
            level._id_78AC[var_1]["land"] = %bh_player_rope_end;
            break;
    }
}
#using_animtree("vehicles");

fastrope_animload_heli( var_0 )
{
    switch ( var_0 )
    {
        case "blackhawk":
            var_1 = fastrope_animname( var_0, "heli" );
            level._id_78AC[var_1]["loop"][0] = %bh_rotors;
            break;
    }
}
