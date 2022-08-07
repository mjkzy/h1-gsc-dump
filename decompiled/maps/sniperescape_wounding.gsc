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

bring_out_the_hounds()
{
    level endon( "break_for_apartment" );
    wait 20;
    var_0 = getentarray( "kill_dog_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::seek_player );

    for (;;)
    {
        if ( getaispeciesarray( "all", "all" ).size >= 24 )
        {
            wait 1;
            continue;
        }

        var_1 = common_scripts\utility::_id_3CCB( level.playercardbackground.origin, var_0 );
        var_2 = 0;

        for ( var_3 = var_1.size - 1; var_3 >= 0; var_3-- )
        {
            var_4 = var_1[var_3];

            if ( bullettracepassed( level.playercardbackground.origin + ( 0, 0, 32 ), var_4.origin + ( 0, 0, 32 ), 0, level.playercardbackground ) )
                continue;

            var_2++;
            var_4.count = 1;
            var_4 dospawn();
            wait(randomfloat( 2 ));

            if ( var_2 >= 8 )
                break;
        }

        wait 3;
    }
}

seek_player()
{
    self endon( "death" );

    for (;;)
    {
        self _meth_81aa( level.playercardbackground.origin );
        self.goalradius = 512;
        wait 1;
    }
}

pool_dog_think( var_0 )
{
    self.team = "allies";
    var_1 = "dog_food";

    if ( !isdefined( level.first_pool_dog ) )
    {
        level.first_pool_dog = 1;
        thread dog_loop_sound();
    }

    self endon( "death" );
    self.allowdeath = 1;
    var_2 = getent( self._not_team, "targetname" );
    self._id_60FA = 1;
    var_2 thread maps\_anim::_id_0BCE( self, var_1 );
    wait 0.05;
    self setanimtime( maps\_utility::_id_3EF7( "dog_food_nonidle" ), randomfloat( 1 ) );
    self.goalheight = 512;
    thread dog_attacks_player_if_he_feels_threatened( var_2 );
    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );

    if ( !common_scripts\utility::_id_382E( "player_looked_in_pool" ) )
        self delete();

    wait 3;
    var_2 notify( "stop_loop" );
    self _meth_8143();
    self.goalradius = 20;
    var_3 = getent( "park_reinforce" + ( var_0 + 1 ), "targetname" );
    self _meth_81aa( var_3.origin );
}

dog_loop_sound()
{
    common_scripts\utility::_id_383D( "dogs_disturbed" );
    self playloopsound( "anml_dogs_eating_body_loop" );
    level maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "dogs_disturbed" );
    maps\_utility::_id_07BE( maps\_utility::_id_A099, "death" );
    maps\_utility::_id_2BDD();

    if ( isalive( self ) )
        self stoploopsound( "anml_dogs_eating_body_loop" );
}

wait_for_angry_dog()
{
    level endon( "dog_attack_trigger" );

    for (;;)
    {
        common_scripts\utility::_id_3857( "price_picked_up" );
        common_scripts\utility::_id_384A( "pool_lookat" );

        if ( !common_scripts\utility::_id_382E( "price_picked_up" ) )
            break;
    }
}

dog_attacks_player_if_he_feels_threatened( var_0 )
{
    self endon( "death" );
    level endon( "fairbattle_high_intensity" );
    wait_for_angry_dog();
    var_0 notify( "stop_loop" );
    self _meth_8143();
    common_scripts\utility::_id_383F( "dogs_disturbed" );
    wait(randomfloatrange( 0.2, 0.9 ));
    var_1 = getent( "dog_flee_org", "targetname" );
    self _meth_8143();
    maps\_spawner::_id_4248( var_1 );
    self delete();
}

go_prone_line_check()
{
    if ( common_scripts\utility::_id_382E( "price_told_player_to_go_prone" ) )
        return;

    var_0 = level.playercardbackground maps\_utility::_id_4088();

    if ( var_0 > 0 )
        return;

    thread maps\sniperescape_code::price_line( "find_spot_go_prone" );
    common_scripts\utility::_id_383F( "price_told_player_to_go_prone" );
}

wait_for_player_to_place_claymores()
{
    var_0 = 0;
    var_1 = level.playercardbackground maps\_utility::_id_4088();

    for ( var_2 = 0; var_2 < 30; var_2++ )
    {
        var_3 = level.playercardbackground maps\_utility::_id_4088();

        if ( var_3 < var_1 )
            var_0 += 3.5;

        var_1 = var_3;

        if ( level.playercardbackground getstance() == "prone" && var_3 == 0 )
            return;

        go_prone_line_check();
        wait 1;
    }

    if ( var_0 > 0 )
    {
        for ( var_2 = 0; var_2 < var_0; var_2++ )
        {
            var_3 = level.playercardbackground maps\_utility::_id_4088();

            if ( level.playercardbackground getstance() == "prone" && var_3 == 0 )
                return;

            go_prone_line_check();
            wait 1;
        }
    }
}

autosave_on_good_claymore_placement( var_0 )
{
    var_1 = getent( "alt_fair_trigger", "targetname" );

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        if ( level.playercardbackground istouching( var_1 ) )
        {
            wait 1;
            continue;
        }

        break;
    }

    if ( level.playercardbackground istouching( var_1 ) )
        return 0;

    var_3 = getentarray( "claymore_spot", "targetname" );

    if ( var_0 <= 0 )
        return 1;

    var_4 = var_0 * 0.4;
    var_4 = int( var_4 );
    var_5 = getentarray( "grenade", "classname" );
    var_6 = maps\_utility::_id_7390( var_5, "claymore" );
    var_7 = 0;

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        for ( var_8 = 0; var_8 < var_3.size; var_8++ )
        {
            if ( distance( var_6[var_2].origin, var_3[var_8].origin ) < var_3[var_8].rank )
            {
                var_7++;
                break;
            }
        }

        if ( var_7 >= var_4 )
            return 1;
    }

    return 0;
}

_id_60FD()
{
    self.grenadeammo = 0;
}

price_says_a_bit_farther()
{
    level endon( "beacon_placed" );
    common_scripts\utility::_id_382F( "beacon_placed" );
    var_0 = getent( "price_putdown_hint_trigger", "targetname" );
    var_1 = [];
    var_2 = 0;
    var_1[var_1.size] = "a_bit_farther_north_2";
    var_1[var_1.size] = "check_your_compass";

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( common_scripts\utility::_id_382E( "price_picked_up" ) )
        {
            maps\sniperescape_code::price_line( var_1[var_2] );
            var_2++;

            if ( var_2 >= var_1.size )
                var_2 = 0;

            wait(randomfloatrange( 10, 12 ));
        }
    }
}

fairground_keep_player_out_of_pool()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "player_goes_to_pool" );
        common_scripts\utility::_id_3831( "can_save" );
        wait(randomfloat( 4 ));

        if ( !common_scripts\utility::_id_382E( "player_goes_to_pool" ) )
        {
            if ( !common_scripts\utility::_id_382E( "seaknight_lands" ) )
                common_scripts\utility::_id_383F( "can_save" );

            continue;
        }

        maps\sniperescape_code::price_dies();
        common_scripts\utility::_id_3857( "player_goes_to_pool" );
    }
}

player_abandons_seaknight_protection()
{
    common_scripts\utility::_id_384A( "price_picked_up" );
    level waittill( "foawerawer" );
    common_scripts\utility::_id_383F( "seaknight_leaves_prematurely" );
}

wait_for_seaknight_to_take_off()
{
    level endon( "seaknight_leaves_prematurely" );
    common_scripts\utility::_id_384A( "player_made_it_to_seaknight" );
}

player_boards_seaknight( var_0, var_1 )
{
    var_2 = 0;

    for (;;)
    {
        if ( isalive( level._id_6F7C ) )
            objective_position( getobj( "seaknight" ), level._id_6F7C.origin );
        else
            objective_position( getobj( "seaknight" ), var_1.origin );

        wait 0.05;

        if ( distance( level.playercardbackground.origin, var_1.origin ) >= var_1.rank )
            continue;

        if ( !isalive( level._id_6F7C ) )
            break;

        if ( !var_2 )
        {
            thread maps\sniperescape_code::price_line( "where_is_he" );
            var_2 = 1;
            level.playercardbackground maps\_utility::_id_27EF( 2, maps\_utility::_id_2B4A, "where_is_he" );
        }
    }

    if ( common_scripts\utility::_id_382E( "seaknight_leaves" ) )
        return;

    thread player_cant_die();
    common_scripts\utility::_id_383F( "player_made_it_to_seaknight" );
    maps\_hud_util::_id_8AF4();
    level.playercardbackground disableweapons();
    maps\_utility::enable_scuff_footsteps_sound( 0 );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_3 = maps\_utility::_id_88D1( level.wounded_model );
        var_3 hide();
    }
    else
    {
        maps\_move_with_animation::carrystop();
        level.playercardbackground playerlinktodelta( level.eplayerview, "tag_player", 1, 0, 0, 0, 0 );
        var_3 = level.eplayerview;
    }

    var_0 maps\_anim::_id_0BC7( var_3, "wounded_seaknight_putdown", "tag_detach" );
    var_3 linkto( var_0, "tag_detach" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        var_3 maps\_utility::_id_5696( "tag_player", 0.5, 0.9, 35, 35, 45, 0 );

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.price_carried delete();

    var_4 = getent( "price_spawner", "targetname" );
    var_4._id_0C72 = "price";
    var_4.origin = level.playercardbackground.origin;
    var_4.count = 1;
    level._id_6F7C = var_4 stalingradspawn();
    maps\_utility::_id_88F1( level._id_6F7C );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C setmodel( "body_complete_usmc_ghillie_price_damaged" );
    level._id_6F7C thread maps\sniperescape::monitor_macmellon();
    var_5 = [];
    var_5[var_5.size] = var_3;
    var_5[var_5.size] = level._id_6F7C;
    maps\_utility::_id_0761( "axis", ::no_accuracy );
    var_6 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_6, ::no_accuracy );
    maps\_utility::_id_27EF( 0.5, common_scripts\utility::_id_383F, "player_putting_down_price_seaknight" );
    var_0 maps\_anim::_id_0C18( var_5, "wounded_seaknight_putdown", "tag_detach" );
    level._id_6F7C delete();
    level.playercardbackground enableweapons();
    level.playercardbackground playerlinktodelta( var_3, "tag_player", 1, 20, 45, 5, 25 );
}

no_accuracy()
{
    self endon( "death" );
    self._id_1300 = 0;
    level waittill( "stop_having_low_accuracy" );
    self._id_1300 = 1;
}

seaknight_leaving_warning( var_0 )
{
    level endon( "player_made_it_to_seaknight" );
    wait(var_0 - 30);
    thread maps\sniperescape_code::price_line( "heli_got_thirty_seconds" );
    wait 30;
    thread maps\sniperescape_code::price_line( "heli_goodbye" );
}

update_objective_position_for_fairground( var_0 )
{
    level endon( "price_moves_to_position" );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::_id_3857( "price_picked_up" );
        objective_position( var_0, level._id_6F7C.origin );
        thread price_complains_until_he_is_picked_up();
        common_scripts\utility::_id_384A( "price_picked_up" );
        objective_position( var_0, maps\sniperescape_code::price_fair_defendspot() );
    }
}

price_complains_until_he_is_picked_up()
{
    level endon( "price_picked_up" );
    level endon( "price_moves_to_position" );
    wait 0.5;
    var_0 = getent( "price_putdown_hint_trigger", "targetname" );

    for (;;)
    {
        if ( level._id_6F7C istouching( var_0 ) )
            maps\sniperescape_code::price_line( "pick_me_up_and_move_me" );
        else
            maps\sniperescape_code::price_line( "over_there_behind_ferris_wheel" );

        wait(randomfloat( 7 ));

        if ( level._id_6F7C istouching( var_0 ) )
            maps\sniperescape_code::price_line( "a_bit_farther_north" );
        else
            maps\sniperescape_code::price_line( "over_to_that_hill" );

        wait(randomfloat( 6 ));
    }
}

plant_price()
{
    var_0 = physicstrace( level._id_6F7C.origin + ( 0, 0, 2 ), level._id_6F7C.origin + ( 0, 0, -100 ), level._id_6F7C );
    level._id_6F7C _meth_81c9( var_0 );
}

player_gets_on_barret()
{
    var_0 = getent( "turret2", "targetname" );
    var_0 _meth_815c( -30 );
    var_0 restoredefaultdroppitch();

    for (;;)
    {
        if ( isdefined( var_0 getturretowner() ) )
            break;

        wait 0.05;
    }

    setomnvar( "ui_barret", 1 );
    common_scripts\utility::_id_383F( "player_on_barret" );
    soundscripts\_snd::_id_870C( "start_snipe_scoped_in_mix" );
}

get_ent_with_key_from_array( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_1, var_2 );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            if ( var_3[var_5] == var_0[var_4] )
                return var_3[var_5];
        }
    }
}

go_axis()
{
    self.team = "axis";
}

modify_objective_destination_babystep( var_0 )
{
    var_1 = getent( "objective_depth", "targetname" );
    var_2 = getent( var_1._not_team, "targetname" );
    var_3 = getent( var_1._id_7A26, "script_linkname" );
    var_4 = getent( var_3._not_team, "targetname" );
    objective_position( var_0, var_3.origin );
    var_5 = var_2.origin;
    var_6 = var_5 + ( var_1.origin - var_5 ) * 2;
    var_7 = distance( var_5, var_6 );
    var_8 = common_scripts\utility::_id_8959();
    var_8.origin = var_3.origin;
    objective_onentity( var_0, var_8 );

    for (;;)
    {
        var_1 waittill( "trigger", var_9 );
        var_10 = undefined;

        while ( level.playercardbackground istouching( var_1 ) )
        {
            var_10 = maps\_utility::_id_3E3D( var_5, var_6, level.playercardbackground.origin, var_7 );

            if ( var_10 < 0 )
                var_10 = 0;

            if ( var_10 > 1 )
                var_10 = 1;

            var_1 set_obj_progress( var_0, var_10, var_3.origin, var_4.origin, var_8 );

            if ( var_10 == 1 )
                break;

            wait 0.05;
        }

        var_10 = 0;
        var_1 set_obj_progress( var_0, var_10, var_3.origin, var_4.origin, var_8 );
    }

    var_1 delete();
}

set_obj_progress( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3 * var_1 + var_2 * ( 1 - var_1 );
    var_4.origin = var_5;
}

rappel_obj_org()
{
    var_0 = getnode( "player_rappel_node", "targetname" );
    return var_0.origin;
}

addobj( var_0 )
{
    level._id_6302[var_0] = level._id_6302.size;
}

getobj( var_0 )
{
    return level._id_6302[var_0];
}

apartment_price_waits_for_dog_death()
{
    level._id_6F7C endon( "death" );
    var_0 = getent( "price_dog_death_trigger", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::_id_382E( "fence_dog_dies" ) )
    {
        level._id_6F7C.dontavoidplayer = 1;
        level._id_6F7C maps\_utility::_id_7E38( "p" );
        common_scripts\utility::_id_384A( "fence_dog_dies" );
        level._id_6F7C maps\_utility::_id_7E38( "y" );
        level._id_6F7C.dontavoidplayer = 0;
    }
}

pool_have_body()
{
    var_0 = getent( "dog_body", "targetname" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_1._id_0C72 = "dead_guy";
    var_1 maps\_utility::_id_0D61();
    var_1 character\character_sp_spetsnaz_derik::main();
    var_1 _meth_855d();
    var_1 _meth_814d( var_1 maps\_utility::_id_3EF5( "pool_death" ), 1, 0, 1 );
}

heat_helis_transport_guys_in()
{
    common_scripts\utility::_id_384A( "heat_heli_transport" );
    level endon( "heat_enemies_back_off" );

    for (;;)
    {
        maps\_vehicle::_id_8979( "heat_transport_1" );
        wait 10;
        maps\_vehicle::_id_8979( "heat_transport_2" );
        wait 25;
    }
}

fairground_patrollers()
{
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", maps\_utility::_id_0798, ::fair_patroller_reset_sight_dist );
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", maps\_utility::_id_0798, ::fair_patroller_think );
    common_scripts\utility::_id_384A( "pool_heli_attacks" );
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", maps\_utility::_id_88C3 );
}

fair_patroller_think()
{
    self endon( "death" );
    self.melee_fired = 360000;
    maps\_patrol::_id_66FC( self._not_team, 1, 1 );
    self notify( "stop_going_to_node" );
    maps\_utility::_id_1ED1();
    var_0 = getnode( "fair_sniper_node", "targetname" );

    if ( isalive( self.enemy ) && self.enemy.classname == "actor_enemy_dog" )
    {
        self.pathlookaheaddist = 0;
        self.pathrandompercent = 0;
        self _meth_81a9( var_0 );
        self.goalradius = var_0.rank;
        self.enemy waittill( "death" );
        maps\_utility::_id_7E0B();
        return;
    }

    self _meth_81a9( var_0 );
    self.goalradius = var_0.rank;
}

fair_patroller_reset_sight_dist()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "player_enters_fairgrounds" );
    self.melee_fired = 640000;
}

seaknight_sound()
{
    var_0 = "sniperescape_seaknight_fly";
    var_1 = "sniperescape_seaknight_idle";
    var_2 = spawn( "sound_blend", ( 0, 0, 0 ) );
    var_2 thread maps\_utility::_id_5972( self, ( 0, 0, 0 ) );
    var_3 = spawn( "sound_blend", ( 0, 0, 0 ) );
    var_3 thread maps\_utility::_id_5972( self, ( 0, 0, 64 ) );
    soundscripts\_snd::_id_870C( "seaknight_rescue_submix_arrival" );
    thread play_extra_seaknight_sound();
    var_2 thread maps\_utility::_id_5CEC( var_0 );
    common_scripts\utility::_id_384A( "seaknight_lands" );
    soundscripts\_snd::_id_870C( "seaknight_rescue_submix" );
    var_2 thread maps\_utility::_id_5CEA( var_0 );
    var_3 thread maps\_utility::_id_5CEC( var_1 );
    common_scripts\utility::_id_384A( "seaknight_prepares_to_leave" );
    soundscripts\_snd::_id_870C( "seaknight_rescue_submix_waiting" );
    common_scripts\utility::_id_384A( "seaknight_leaves" );
    var_2 thread maps\_utility::_id_5CEC( var_0 );
    var_3 thread maps\_utility::_id_5CEA( var_1 );
    soundscripts\_snd::_id_870C( "seaknight_rescue_submix_fade_out" );
    level.seaknight playsound( "mi17_by_windup_02" );
}

play_extra_seaknight_sound()
{
    wait 19.5;
    level.seaknight playloopsound( "seaknight_idle_high" );
}

bus_grenade_think()
{
    var_0 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        wait 4;

        if ( !common_scripts\utility::_id_382E( "kill_heli_attacks" ) )
            continue;

        for (;;)
        {
            if ( !self istouching( level.playercardbackground ) )
                break;

            var_1 = common_scripts\utility::_id_3CCB( level.playercardbackground.origin, var_0 );
            var_1 = remove_can_sighttrace( level.playercardbackground.origin, var_1 );

            if ( !var_1.size )
            {
                wait 0.5;
                continue;
            }

            var_2 = [];

            for ( var_3 = 0; var_3 < 3; var_3++ )
            {
                if ( var_3 > var_1.size )
                    break;

                var_2[var_2.size] = var_1[var_3];
            }

            var_4 = common_scripts\utility::_id_710E( var_2 );
            var_4 spot_launches_grenade();
            wait(randomfloat( 1.0 ));
        }
    }
}

spot_launches_grenade()
{
    var_0 = common_scripts\utility::_id_40FB( self._not_team, "targetname" );
    var_1 = getaiarray( "axis" );

    if ( !var_1.size )
        return;

    var_1[0].groundentchanged = "fraggrenade";
    var_1[0] magicgrenade( self.origin, var_0.origin, randomfloat( 4 ) );
}

remove_can_sighttrace( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !sighttracepassed( var_0, var_1[var_3].origin, 1, undefined ) )
            var_2[var_2.size] = var_1[var_3];
    }

    return var_2;
}

fair_grenade_trigger_think()
{
    var_0 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );
    var_1 = [];
    var_1[0] = 25;
    var_1[1] = 20;
    var_1[2] = 15;
    var_1[3] = 15;
    var_2 = 0;

    for (;;)
    {
        if ( !self istouching( level.playercardbackground ) )
            self waittill( "trigger" );

        var_3 = getaiarray( "axis" );

        if ( !var_3.size )
        {
            wait 1;
            continue;
        }

        var_4 = common_scripts\utility::_id_3F33( level.playercardbackground.origin, var_3 );

        if ( distance( var_4.origin, level.playercardbackground.origin ) > 1500 )
        {
            wait 1;
            continue;
        }

        if ( var_2 < var_1[level._id_3BFE] )
        {
            var_2++;
            wait 1;
            continue;
        }

        var_5 = common_scripts\utility::_id_710E( var_0 );
        var_5 spot_launches_grenade();
        wait(randomfloat( 5.0 ));
    }
}

heli_shoots_targetnamed_rocket( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 setmodel( "tag_origin" );
    var_3 playsound( "weap_lau61c_fire" );
    var_3.origin = var_2.origin;
    playfx( common_scripts\utility::_id_3FA8( "heli_missile_launch" ), var_3.origin );
    var_3 playloopsound( "h1_scn_se_rocket_trail" );
    playfxontag( common_scripts\utility::_id_3FA8( "rocket_geo" ), var_3, "tag_origin" );

    if ( !isdefined( var_1 ) )
        var_3.units_per_second = 2000;
    else
        var_3 thread wall_explosion_rocket_acceleration( var_1 );

    for (;;)
    {
        if ( isdefined( var_2.script_parentname ) && isdefined( int( var_2.script_parentname ) ) )
            thread common_scripts\_exploder::_id_3528( int( var_2.script_parentname ) );

        if ( !isdefined( var_2._not_team ) )
            break;

        var_4 = getent( var_2._not_team, "targetname" );
        var_5 = distance( var_2.origin, var_4.origin );
        var_6 = var_5 / var_3.units_per_second;
        var_3 moveto( var_4.origin, var_6, 0, 0 );
        var_2 = var_4;
        wait(var_6);
    }

    thread common_scripts\utility::_id_69C2( "scn_se_rocket_explode_building", var_3.origin );
    var_3 delete();
}

wall_explosion_rocket_acceleration( var_0 )
{
    self endon( "death" );
    self.units_per_second = var_0.startspeed;

    while ( isdefined( self ) && self.units_per_second < var_0.finalspeed )
    {
        self.units_per_second += var_0.acceleration * 0.05;

        if ( self.units_per_second >= var_0.finalspeed )
        {
            self.units_per_second = var_0.finalspeed;
            break;
        }

        wait 0.05;
    }
}

linktoblade( var_0 )
{
    self linkto( var_0, self.tag_aim_animated, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self.root = var_0;
}

spawn_blade( var_0 )
{
    var_1 = maps\_utility::_id_88D1( "blade1" );
    var_2 = maps\_utility::_id_88D1( "blade2" );
    var_3 = maps\_utility::_id_88D1( "blade3" );
    var_4 = maps\_utility::_id_88D1( "blade4" );
    var_5 = maps\_utility::_id_88D1( "blade5" );
    var_2.tag_aim_animated = "tag_blade1";
    var_3.tag_aim_animated = "tag_blade2";
    var_4.tag_aim_animated = "tag_blade3";
    var_5.tag_aim_animated = "tag_blade4";
    var_6 = [];
    var_6[var_6.size] = var_2;
    var_6[var_6.size] = var_3;
    var_6[var_6.size] = var_4;
    var_6[var_6.size] = var_5;
    var_1.blades = var_6;
    common_scripts\utility::_id_0D13( var_6, ::linktoblade, var_1 );
    var_6[var_6.size] = var_1;
    common_scripts\utility::_id_0D13( var_6, ::get_blade_clip );
    var_1._id_0C72 = var_0;
    return var_1;
}

get_blade_clip()
{
    var_0 = getentarray( "clip_" + self._id_0C72, "targetname" );
    var_1 = var_0[0];
    var_1.teambalanced = "used";
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 linkto( self );
    var_1 thread kill_toucher_until_msg( "blades_stop_killing" );
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    var_1 delete();
}

kill_toucher_until_msg( var_0 )
{
    level endon( var_0 );
    kill_player_on_touch( self );
}

kill_player_on_touch( var_0 )
{
    level.playercardbackground endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( var_0 istouching( level.playercardbackground ) || level.playercardbackground.origin[2] < -50 )
        {
            level.playercardbackground enablehealthshield( 0 );
            level.playercardbackground maps\_utility::_id_2A51();
            level.playercardbackground maps\_utility::_id_2A51();
            level.playercardbackground maps\_utility::_id_2A51();
            level.playercardbackground maps\_utility::_id_2A51();
        }

        wait 0.05;
    }
}

spawn_blades()
{
    var_0 = [];

    for ( var_1 = 1; var_1 <= 5; var_1++ )
        var_0[var_0.size] = spawn_blade( "blade" + var_1 );

    return var_0;
}

remove_blade( var_0 )
{
    var_1 = var_0.blades[var_0.blades.size - 1];
    var_0.blades[var_0.blades.size - 1] = undefined;
    playfx( common_scripts\utility::_id_3FA8( "rotor_smash" ), var_1.origin, var_1.angles );
    var_1 delete();
}

drawpos()
{
    var_0 = self.root gettagorigin( self.tag_aim_animated );
    var_1 = self.root gettagangles( self.tag_aim_animated );

    for (;;)
    {
        maps\_debug::_id_2DD0( var_0, var_1 );
        wait 0.05;
    }
}

rotor_blades( var_0 )
{
    var_1 = spawn_blades();
    var_0.node_relinquished thread maps\_anim::_id_0C18( var_1, "spin" );
    var_0 hidepart( "main_rotor_jnt" );
    var_0 hidepart( "tail_rotor_jnt" );
}

rotor_hub( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 setmodel( "vehicle_mi28_center_hub" );
    var_1.origin = var_0 gettagorigin( "main_rotor_jnt" );
    var_1.angles = var_0 gettagangles( "main_rotor_jnt" );
    var_1 linkto( var_0, "main_rotor_jnt" );
}

add_dirtmodel( var_0, var_1 )
{
    var_2 = spawn( "script_model", ( 90, 0, 0 ) );
    var_2 setmodel( "tag_origin" );
    var_2 hide();
    var_2 linkto( self, "tag_body", var_0, var_1 );
    return var_2;
}

surprisers_die_soon()
{
    self endon( "death" );
    wait(randomfloatrange( 6, 9 ));
    maps\_utility::_id_2A51();
}

drawatag()
{
    for (;;)
    {
        var_0 = getdvar( "heli_tag" );

        if ( var_0 != "" )
            maps\_debug::_id_2DE7( var_0 );

        wait 0.05;
    }
}

final_heli_clip()
{
    self notsolid();
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    level.price_heli._id_1F96 delete();
    self solid();

    if ( !level.playercardbackground istouching( self ) )
        return;

    for (;;)
    {
        level.playercardbackground enablehealthshield( 0 );
        level.playercardbackground maps\_utility::_id_2A51();
        level.playercardbackground maps\_utility::_id_2A51();
        level.playercardbackground maps\_utility::_id_2A51();
        level.playercardbackground maps\_utility::_id_2A51();
        wait 0.05;
    }
}

heli_dirt_mesh()
{
    self movez( -40, 0.5 );
    self hide();
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self show();
    self movez( 40, 0.5 );
}

heli_dirt_mesh_hide()
{
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self movez( -8, 0.5 );
    wait 0.5;
    self hide();
}

heli_fence_clip_delete()
{
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self delete();
}

heli_attacks_price_new()
{
    var_0 = getnode( "price_apartment_destination_node", "targetname" );
    var_1 = maps\_vehicle::_id_8979( "heli_price" );
    level.heli_turret = var_1._id_5BD5;
    var_2 = var_1;
    var_1 = var_1 maps\_vehicle::_id_9D58();
    var_3 = getent( "death_heli_clip", "targetname" );
    var_3 linkto( var_1, "origin_animate_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 hide();
    var_1 thread kill_toucher_until_stop( var_3 );
    var_1._id_1F96 = var_3;
    var_4 = spawn( "script_model", ( 0, 0, 0 ) );
    var_4 setmodel( "tag_origin" );
    var_4 hide();
    var_4 linkto( var_1, "tail_rotor_jnt", ( 0, 0, 0 ), ( 0, 90, 0 ) );
    var_5 = [];
    var_6 = 1;
    var_7 = 230;
    var_8 = var_7 / var_6;

    for ( var_9 = 0; var_9 < var_6; var_9++ )
        var_5[var_5.size] = var_1 add_dirtmodel( ( -20 + var_8 * var_9, 0, -70 ), ( 0, 90, 0 ) );

    level.price_heli = var_1;
    var_1._id_0C72 = "mi28";
    wait 1;
    level._id_6F7C endon( "death" );
    var_0 = getnode( "price_wounding_node", "targetname" );
    var_1.node_relinquished = var_0;
    var_10 = [];
    var_10[var_10.size] = var_1;
    var_10[var_10.size] = level._id_6F7C;
    thread price_death_failure();
    thread price_swap_to_damaged_model();
    level._id_6F7C maps\_utility::_id_39D0( level._id_6F7C.primaryweapon, "primary" );
    level._id_6F7C._id_615B = 1;
    level._id_6F7C._id_6109 = 1;
    maps\_utility::_id_07BE( ::wait_for_surprise_guys );
    maps\_utility::_id_07BE( maps\_utility::_id_0694, 20 );
    maps\_utility::_id_2BDD();
    common_scripts\utility::_id_383F( "crash_heli_shows_up" );
    common_scripts\utility::_id_0D13( level._id_265B["surprise_guys_dead"]["ai"], ::surprisers_die_soon );
    common_scripts\utility::_id_0D13( level._id_265B["patrol_guys_dead"]["ai"], ::surprisers_die_soon );
    soundscripts\_snd::_id_870C( "havoc_appear_mix" );
    var_11 = getent( "havoc_arrival_sfx", "targetname" );
    var_11 thread common_scripts\utility::_id_69C2( "h1_havoc_appear", var_11.origin );

    if ( getdvarint( "use_old_point_chopper" ) == 1 )
    {
        maps\_utility::_id_27EF( 3, maps\sniperescape_code::price_line, "incoming_helicopter" );
        var_0 maps\_anim::_id_0C24( var_1, "entrance" );
        var_0 thread maps\_anim::_id_0BE1( var_1, "idle", undefined, "heli_loop" );
        var_0 maps\_anim::_id_0BFF( level._id_6F7C, "crash" );
        common_scripts\utility::_id_3856( "surprise_guys_dead", 20 );
        var_0 thread maps\_anim::_id_0BE1( level._id_6F7C, "precrash_idle", undefined, "price_loop" );
    }
    else
    {
        var_0 thread maps\_anim::_id_0C24( var_1, "entrance" );
        var_1 thread heli_to_idle_once_in_place( var_0 );
        level._id_6F7C _meth_81ce( "stand" );
        common_scripts\utility::_id_3856( "surprise_guys_dead", 20 );
        level._id_6F7C.ignoreforfixednodesafecheck = 1;
        level._id_6F7C.a.animreachcustomradius = 10;
        thread maps\_anim::_id_0BFC( level._id_6F7C, 3 );
        var_0 maps\_anim::_id_0BFF( level._id_6F7C, "crash" );
        level._id_6F7C.a.animreachcustomradius = undefined;
        var_12 = spawn( "script_origin", level._id_6F7C.origin );
        var_12.angles = ( 0, 35, 0 );
        var_12 maps\_anim::_id_0C24( level._id_6F7C, "chopper_point" );
        var_0 thread maps\_anim::_id_0BE1( level._id_6F7C, "precrash_idle", undefined, "price_loop" );
        level._id_6F7C.ignoreforfixednodesafecheck = 0;
        level._id_6F7C._id_615B = undefined;
        level._id_6F7C._id_6109 = undefined;
    }

    wait 1;
    var_0 notify( "price_loop" );
    var_0 thread maps\_anim::_id_0BE1( level._id_6F7C, "fire_idle" );
    thread heli_shot_down_detection();
    level notify( "start_continues" );
    var_1 thread heli_fires_around_price();
    var_1 thread heli_kills_price();
    price_snipes_heli_until_player_does();
    level._id_6F7C _meth_81ce( "prone", "crouch", "stand" );

    if ( !isalive( level._id_6F7C ) )
        return;

    soundscripts\_snd::_id_870C( "havoc_explode_mix" );
    wait 1;
    var_0 notify( "stop_loop" );
    var_0 notify( "heli_loop" );
    var_1 thread enginefirefx();
    playfxontag( common_scripts\utility::_id_3FA8( "aerial_explosion_heli" ), var_1, "tag_engine_rear_left" );
    var_1 playsound( "scn_se_rocket_explode_building" );
    level._id_9373 = gettime();
    var_13 = getent( "crash_missile_org", "targetname" );
    var_1 maps\_utility::_id_27EF( 5.6, ::heli_hits_wall );
    var_1 maps\_utility::_id_27EF( 5.65, ::heli_shoots_targetnamed_rocket, "rocket_1_org" );
    var_14 = spawnstruct();
    var_14.startspeed = 1100;
    var_14.finalspeed = 2000;
    var_14.acceleration = 300;
    var_1 maps\_utility::_id_27EF( 5.75, ::heli_shoots_targetnamed_rocket, "rocket_2_org", var_14 );
    var_1 maps\_utility::_id_27EF( 5.85, ::heli_shoots_targetnamed_rocket, "rocket_3_org" );
    var_1 maps\_utility::_id_27EF( 9.65, ::heli_hits_ground, var_2 );
    var_1 maps\_utility::_id_27EF( 9.65, ::enginesmolderfx );
    var_1 maps\_utility::_id_27EF( 9.7, ::heli_shoots_dirt, var_5 );
    var_1 maps\_utility::_id_27EF( 9.7, ::heli_rumbles );
    var_1 maps\_utility::_id_27EF( 9.75, ::crash_dust_fx );
    var_1 maps\_utility::_id_27EF( 15.0, ::heli_stops_rumbles );
    var_1 maps\_utility::_id_27EF( 16.0, ::heli_rumbles_at_rest );
    var_1 maps\_utility::_id_27EF( 10.0, maps\_utility::_id_7C82, "stop_tail_fx" );
    var_4 maps\_utility::_id_27EF( 10.0, ::heli_makes_sparks, var_1 );
    var_4 maps\_utility::_id_27EF( 12.05, maps\_utility::_id_7C82, "stop" );
    var_2 maps\_utility::_id_27EF( 11.0, maps\_utility::_id_7C82, "stop_kicking_up_dust" );
    var_1 maps\_utility::_id_27EF( 13, common_scripts\_exploder::_id_3528, 456 );
    var_1 maps\_utility::_id_27EF( 14, common_scripts\_exploder::_id_3528, 457 );
    var_1 maps\_utility::_id_27EF( 14.5, maps\_utility::_id_7C82, "kill_dirt" );
    var_1 maps\_utility::_id_27EF( 15, maps\_utility::_id_7C82, "stop_crash_dust_fx" );
    maps\_utility::_id_27EF( 10.4, common_scripts\utility::_id_383F, "throw_modelswing" );
    maps\_utility::_id_27EF( 10.65, common_scripts\utility::_id_383F, "throw_modelslide" );
    maps\_utility::_id_27EF( 11.15, common_scripts\utility::_id_383F, "throw_modelmerry_go_round" );
    level maps\_utility::_id_27EF( 18.5, maps\_utility::_id_7C82, "blades_stop_killing" );
    maps\_utility::_id_27EF( 3.5, maps\sniperescape_code::price_line, "goodnight_ya_bastard" );
    maps\_utility::_id_27EF( 9.2, maps\sniperescape_code::price_line, "ahh_crap" );
    common_scripts\utility::_id_383F( "havoc_hits_ground" );
    maps\_utility::_id_27EF( 14.0, common_scripts\utility::_id_383F, "heli_swap_dirt" );
    maps\_utility::_id_27EF( 15.5, common_scripts\utility::_id_383F, "heli_comes_to_rest" );
    var_1 playloopsound( "havoc_helicopter_dying_loop" );
    var_1 thread dead_heli_pilots();
    var_2._id_86CE = 1;
    var_0 thread maps\_anim::_id_0C18( var_10, "crash" );
    wait 18.5;
    var_1 notify( "stop" );
    thread maps\sniperescape::wounded_combat();
    soundscripts\_snd::_id_870C( "havoc_crashed_mix" );
}

price_swap_to_damaged_model()
{
    level._id_6F7C endon( "death" );
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    level._id_6F7C setmodel( "body_complete_usmc_ghillie_price_damaged" );
}

heli_to_idle_once_in_place( var_0 )
{
    var_0 endon( "heli_loop" );
    self waittillmatch( "single anim", "end" );
    var_0 thread maps\_anim::_id_0BE1( self, "idle", undefined, "heli_loop" );
}

heli_rumbles()
{
    self.rumbler = spawn( "script_origin", self.origin );
    self.rumbler linkto( self, "main_rotor_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self.rumbler playrumblelooponentity( "crash_heli_rumble" );
}

heli_rumbles_at_rest()
{
    playrumbleonposition( "crash_heli_rumble", self gettagorigin( "main_rotor_jnt" ) );
    wait 0.25;
    playrumbleonposition( "crash_heli_rumble_rest", self gettagorigin( "main_rotor_jnt" ) );
}

heli_stops_rumbles()
{
    self.rumbler stoprumble( "crash_heli_rumble" );
    self.rumbler delete();
}

blocking_fence_falls()
{
    var_0 = getent( "blocking_fence", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" );
    var_1 connectpaths();
    var_1 linkto( var_0 );
    var_0 rotatepitch( 90, 1, 0.2 );
    wait 1;
    var_1 delete();
}

heli_shoots_dirt( var_0 )
{
    common_scripts\utility::_id_0CF0( var_0, ::dirt_model_shoots_dirt );
}

dirt_model_shoots_dirt( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 setmodel( "tag_origin" );
    var_1 hide();
    playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt" ), var_1, "tag_origin" );
    var_1 linkto( level.price_heli, "tag_deathfx", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2 setmodel( "tag_origin" );
    var_2 hide();
    playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt_rear" ), var_2, "tag_origin" );
    var_2 linkto( level.price_heli, "tag_deathfx", ( -100, 0, 100 ), ( 0, 0, 0 ) );
    self waittill( "kill_dirt" );
    var_1 delete();
    var_2 delete();

    if ( 1 )
        return;

    for (;;)
    {
        var_3 = anglestoforward( var_0.angles );
        var_4 = anglestoup( var_0.angles );
        var_5 = var_3 * 500;
        var_6 = bullettrace( var_0.origin, var_0.origin + var_5, 1, self );
        var_7 = var_6["position"];

        if ( !isdefined( level.dirtfx_org ) )
        {
            var_8 = spawn( "script_model", var_7 );
            var_8 setmodel( "tag_origin" );
            var_8 hide();
            playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt" ), var_8, "tag_origin" );
            level.dirtfx_org = var_8;
        }

        level.dirtfx_org.angles = var_0.angles + ( -90, 0, 0 );
        level.dirtfx_org.origin = var_7;
        wait 0.05;
    }
}

sparkgen()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self.spark ) )
            playfx( common_scripts\utility::_id_3FA8( "helicopter_tail_sparks" ), self.origin );

        wait 0.05;
    }
}

heli_makes_sparks( var_0 )
{
    self endon( "stop" );
    var_1 = getent( "spark_org", "targetname" );
    var_2 = anglestoforward( var_1.angles );
    var_3 = 0;

    for (;;)
    {
        var_4 = anglestoforward( self.angles );
        var_5 = var_4 * 500;
        var_6 = bullettrace( self.origin, self.origin + var_5, 1, var_0 );
        var_7 = var_6["position"] + ( 8, 8, 16 );
        playfx( common_scripts\utility::_id_3FA8( "helicopter_tail_sparks" ), var_7, var_2 );
        var_3--;

        if ( var_3 <= 0 )
        {
            playfx( common_scripts\utility::_id_3FA8( "brick_chunk" ), var_7, var_2 );
            var_3 = randomintrange( 4, 5 );
        }

        wait 0.05;
    }

    if ( 1 )
        return;

    var_8 = spawn( "script_model", ( 0, 0, 0 ) );
    var_8 setmodel( "tag_origin" );
    var_8.origin = var_1.origin;
    var_8.angles = var_1.angles;
    playfxontag( common_scripts\utility::_id_3FA8( "rocket_geo" ), var_8, "tag_origin" );
    var_9 = spawn( "script_model", ( 0, 0, 0 ) );
    var_9 linkto( var_8, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_10 = 1200;
    var_11 = var_10;
    var_8.spark = 1;
    var_8 thread sparkgen();

    for (;;)
    {
        if ( isdefined( var_1.sprint_begin ) )
            var_10 = var_11 * var_1.sprint_begin * 0.01;

        playfx( common_scripts\utility::_id_3FA8( "brick_chunk" ), var_8.origin );
        var_12 = getent( var_1._not_team, "targetname" );
        var_13 = distance( var_1.origin, var_12.origin );
        var_14 = var_13 / var_10;
        var_8 moveto( var_12.origin, var_14, 0, 0 );
        var_1 = var_12;
        wait(var_14);

        if ( !isdefined( var_1._not_team ) )
            break;
    }

    var_8 delete();
}

heli_hits_wall()
{
    thread common_scripts\_exploder::_id_3528( 66 );
    self stoploopsound();
    self playsound( "scn_se_havoc_downed" );
    maps\_utility::_id_27EF( 0.1, maps\_utility::_id_058E, 0.4, 1.2, self.origin, 6000 );
    thread tailfx();
}

heli_hits_ground( var_0 )
{
    thread common_scripts\_exploder::_id_3528( 67 );
    level.playercardbackground playrumbleonentity( "damage_heavy" );
    self _meth_8468( "mtl_h1_mi_28_glass", "mtl_h1_mi_28_glass_damaged" );
    self _meth_8468( "mtl_h1_mi_28_body", "mtl_h1_mi_28_body_damaged" );
    self _meth_8468( "mtl_h1_mi_28_details", "mtl_h1_mi_28_details_damaged" );
    maps\_utility::_id_27EF( 0.1, maps\_utility::_id_058E, 0.6, 1.2, self.origin, 6000 );
    var_0 thread maps\_vehicle::_id_9D01( "running" );
    self notify( "stop_enginefire_fx" );
    wait 0.8;
    level.playercardbackground playrumblelooponentity( "tank_rumble" );
    var_1 = 6;
    earthquake( 0.3, var_1, self.origin, 2000 );
    level.playercardbackground stoprumble( "tank_rumble" );
    wait(var_1);
    earthquake( 0.1, 1, self.origin, 2000 );
}

tailfx()
{
    self endon( "stop_tail_fx" );
    var_0 = [];
    var_0[var_0.size] = "tail_rotor_jnt";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "smoke_trail_heli" ), var_4 );
        }

        wait 0.1;
    }
}

enginefirefx()
{
    self endon( "stop_enginefire_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_engine_rear_left";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "fire_trail_heli" ), var_4 );
        }

        wait 0.1;
    }
}

enginesmolderfx()
{
    self endon( "stop_enginesmoke_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_engine_rear_left";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "heli_engine_smolder" ), var_4 );
        }

        wait 0.1;
    }
}

crash_dust_fx()
{
    self endon( "stop_crash_dust_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_deathfx";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "heli_crash_dust" ), var_4 );
            common_scripts\utility::_id_697A( "fire_wood_small", var_4 );
        }

        wait 0.2;
    }
}

clip_setup()
{
    var_0 = getent( self._id_7A26, "script_linkname" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    var_0 hide();
    common_scripts\utility::_id_384A( "throw_model" + self.script_parentname );
    kill_toucher_until_stop( var_0 );
}

kill_toucher_until_stop( var_0 )
{
    self endon( "stop" );
    kill_player_on_touch( var_0 );
}

script_animator()
{
    common_scripts\utility::_id_383D( "throw_model" + self.script_parentname );

    if ( isdefined( self._id_7A26 ) )
        thread clip_setup();

    var_0 = self;
    var_0 = getent( var_0._not_team, "targetname" );

    for (;;)
    {
        var_0.origin += ( 0, 0, -5000 );
        var_0 hide();

        if ( !isdefined( var_0._not_team ) )
            break;

        var_0 = getent( var_0._not_team, "targetname" );
    }

    self show();
    common_scripts\utility::_id_384A( "throw_model" + self.script_parentname );
    var_0 = self;
    var_0 = getent( var_0._not_team, "targetname" );

    for (;;)
    {
        var_0.origin += ( 0, 0, 5000 );

        if ( !isdefined( var_0._not_team ) )
            break;

        var_0 = getent( var_0._not_team, "targetname" );
    }

    var_1 = 0.15;
    var_0 = self;

    for (;;)
    {
        if ( !isdefined( var_0._not_team ) )
            break;

        var_0 = getent( var_0._not_team, "targetname" );
        self moveto( var_0.origin, var_1, 0, 0 );
        self rotateto( var_0.angles, var_1, 0, 0 );
        wait(var_1);
    }

    self notify( "stop" );
}

check_for_price()
{
    var_0 = level._id_265B["fair_snipers_died"]["ai"];
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E0B );

    if ( !isalive( level._id_6F7C ) )
        return;

    setdvar( "ui_deadquote", &"SNIPERESCAPE_YOU_LEFT_YOUR_SPOTTER" );
    maps\_utility::_id_5CDF();
}

grass_obj()
{
    self setmodel( "h1_sniperescape_grassobjective" );
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( "h1_sniperescape_grassobjective_obj" );
    var_0 hide();
    hide_and_show_glowing_grass( var_0 );
    self show();
    var_0 delete();
}

hide_and_show_glowing_grass( var_0 )
{
    level endon( "price_is_put_down_near_wheel" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "put_price_near_wheel" );
        self hide();
        var_0 show();
        level waittill( "foreverever" );
        common_scripts\utility::_id_3857( "price_picked_up" );
        var_0 hide();
    }
}

ferris_wheel_placement_objective()
{
    var_0 = getentarray( "grass_obj", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setmodel( "h1_sniperescape_grassobjective" );

    common_scripts\utility::_id_384A( "put_price_near_wheel" );
    thread common_scripts\_exploder::_id_3528( 100 );
    common_scripts\utility::_id_384A( "price_is_put_down_near_wheel" );
    thread common_scripts\_exploder::_id_3528( 101 );
}

player_is_enemy()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isalive( var_0[var_1].enemy ) )
        {
            if ( level.playercardbackground == var_0[var_1].enemy )
                return 1;
        }
    }

    return 0;
}

price_goes_to_window_to_shoot()
{
    if ( common_scripts\utility::_id_382E( "wounding_enemy_detected" ) )
        return;

    level endon( "wounding_enemy_detected" );
    maps\_utility::_id_1143( "standby" );
    level._id_6F7C maps\_utility::_id_2A74();
    level._id_6F7C.ignoreforfixednodesafecheck = 1;
    level._id_6F7C _meth_816a();
    level._id_6F7C.ignoretriggers = 1;
    level._id_6F7C maps\_utility::_id_27EF( 1.2, maps\_anim::_id_0C21, level._id_6F7C, "standby" );
    var_0 = getent( "halt_node", "targetname" );
    var_0 maps\_anim::_id_0BFF( level._id_6F7C, "halt" );
    var_0 maps\_anim::_id_0C24( level._id_6F7C, "halt" );
    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C._id_2B0E = 1;
    wait 1;
    var_1 = level.playercardbackground maps\_utility::_id_4088();

    if ( var_1 > 0 )
    {
        thread maps\sniperescape_code::price_line( "plant_claymore_by_door" );
        wait 1;
    }

    level._id_6F7C maps\_utility::_id_309A();
    maps\_utility::_id_070A( "price_moves_to_window_trigger" );
    common_scripts\utility::_id_384A( "price_at_wounding_window" );
    wait 0.5;
    level._id_6F7C.ignoretriggers = 0;
    level._id_6F7C.ignoreforfixednodesafecheck = 0;
    maps\sniperescape_code::delete_wounding_sight_blocker();
    common_scripts\utility::_id_384A( "wounding_enemy_detected" );
}

price_snipes_heli_until_player_does()
{
    level endon( "heli_shot_down" );
    common_scripts\utility::_id_382F( "heli_shot_down" );
    level._id_6F7C endon( "death" );

    for (;;)
    {
        maps\sniperescape_code::price_line( "shoot_the_helicopter" );
        level.price_heli maps\_utility::_id_07BE( maps\_utility::_id_A0AC, 0.995, 1.0, 1 );
        var_0 = randomfloatrange( 8, 12 );
        maps\_utility::_id_07BE( maps\_utility::_id_0694, var_0 );
        maps\_utility::_id_2BDD();

        if ( maps\_utility::_id_6B91( level.price_heli.origin, 0.995 ) )
            break;
    }

    maps\sniperescape_code::price_line( "hit_the_rotor" );
    wait 2.0;
    maps\sniperescape_code::price_line( "fire_fire" );
    common_scripts\utility::_id_384A( "heli_shot_down" );
}

heli_fires_around_price()
{
    common_scripts\utility::_id_382F( "heli_shot_down" );
    var_0 = getentarray( "death_heli_target", "targetname" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    var_2 = var_1;

    for (;;)
    {
        while ( var_2 == var_1 )
            var_1 = common_scripts\utility::_id_710E( var_0 );

        var_2 = var_1;
        wait(randomfloat( 0.35 ));
        heli_fires( var_1 );

        if ( common_scripts\utility::_id_382E( "heli_shot_down" ) )
            return;
    }
}

heli_fires( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1.origin = self.origin;
    var_2 = randomfloat( 1 ) * 10;
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 setmodel( "tag_origin" );

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_1 playsound( "h1_wep_air_cannon_cls" );
        var_5 = var_0.origin + common_scripts\utility::_id_712D( 16 );
        var_6 = self gettagorigin( "tag_flash" );
        var_3.origin = var_6;
        var_7 = vectortoangles( var_5 - var_6 );
        var_3.angles = var_7;
        playfxontag( common_scripts\utility::_id_3FA8( "hind_fire" ), var_3, "tag_origin" );
        magicbullet( "barrett_fake", self gettagorigin( "tag_flash" ), var_5 );
        wait 0.1;
    }

    var_3 delete();
    var_1 delete();
}

heli_kills_price()
{
    level endon( "heli_shot_down" );
    common_scripts\utility::_id_382F( "heli_shot_down" );
    level._id_6F7C endon( "death" );
    wait 25;
    level notify( "heli_kills_price" );
    level._id_6F7C.allowdeath = 1;

    if ( isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C maps\_utility::_id_8EA4();

    level._id_6F7C.helmet = 150;

    for (;;)
    {
        var_0 = randomfloatrange( 1, 2 ) * 10;

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            magicbullet( "barrett_fake", level.price_heli gettagorigin( "tag_flash" ), level._id_6F7C geteye() );
            wait 0.1;
        }

        wait(randomfloatrange( 0.3, 0.7 ));
    }
}

price_death_failure()
{
    level endon( "heli_comes_to_rest" );
    common_scripts\utility::_id_382F( "heli_comes_to_rest" );
    level._id_6F7C waittill( "death" );
    wait 4;
    setdvar( "ui_deadquote", &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    maps\_utility::_id_5CDF();
}

price_sets_stance()
{
    level._id_6F7C waittill( "goal" );
    level._id_6F7C _meth_81ce( "crouch" );
}

player_becomes_invul_on_pickup()
{
    level endon( "player_made_it_to_seaknight" );
    var_0 = level.playercardbackground.deathinvulnerabletime;

    for (;;)
    {
        common_scripts\utility::_id_384A( "price_picked_up" );
        level.playercardbackground.deathinvulnerabletime = 10000;
        common_scripts\utility::_id_3857( "price_picked_up" );
        level.playercardbackground.deathinvulnerabletime = var_0;
    }
}

heli_shot_down_detection()
{
    level endon( "heli_shot_down" );
    var_0 = 0;

    for (;;)
    {
        if ( maps\_utility::_id_6B91( level.price_heli.origin, 0.995 ) )
            var_0++;

        if ( var_0 > 35 )
            break;

        wait 0.05;
    }

    common_scripts\utility::_id_383F( "heli_shot_down" );
}

helicopter_broadcast( var_0 )
{
    common_scripts\utility::_id_384A( var_0 );
    var_1 = level.heli_flag[var_0];
    common_scripts\utility::_id_69C2( level._id_78BA["heli"][var_1], level.playercardbackground.origin + ( 0, 0, 800 ) );
}

dead_heli_pilots()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 linkto( self, "tag_gunner", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_0C72 = "dead_heli_pilot";
    var_0 character\character_sp_spetsnaz_collins::main();
    var_0 maps\_utility::_id_0D61();
    var_0 _meth_814d( maps\_utility::_id_3EF7( "dead_gunner" ) );
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 linkto( self, "tag_pilot", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_0C72 = "dead_heli_pilot";
    var_0 character\character_sp_spetsnaz_geoff::main();
    var_0 maps\_utility::_id_0D61();
    var_0 _meth_814d( maps\_utility::_id_3EF7( "dead_pilot" ) );
}

set_dog_threatbias_group()
{
    self endon( "death" );
    waitframe;

    if ( self.team == "allies" )
        self setthreatbiasgroup( "dog_allies" );
}

merry_go_round_bottom()
{
    var_0 = getent( "merry_go_round", "script_noteworthy" );
    self linkto( var_0 );
}

merry_grass_delete()
{
    common_scripts\utility::_id_384A( "throw_modelmerry_go_round" );
    wait 1.5;
    self delete();
}

wait_for_surprise_guys()
{
    for (;;)
    {
        if ( level._id_265B["surprise_guys_dead"]["spawners"].size > 0 )
        {
            wait 0.05;
            continue;
        }

        if ( level._id_265B["surprise_guys_dead"]["ai"].size <= 2 )
            break;

        wait 0.05;
    }
}

player_cant_die()
{
    maps\_utility::_id_0CC5();
    level.playercardbackground endon( "death" );

    for (;;)
    {
        level.playercardbackground.deathinvulnerabletime = 70000;
        level.playercardbackground enableinvulnerability();
        level.playercardbackground.attackeraccuracy = 0;
        wait 0.05;
    }
}
