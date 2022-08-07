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
#using_animtree("dog");

main()
{
    self useanimtree( #animtree );
    _id_4DAB();
    animscripts\init::_id_381E();
    self.index = 1;
    self.nextreadblackops2 = 0;
    self._id_1CA5 = 0;
    self.noncombat = 1;
    self._id_75DF = %root;
    self.micro_dlc_bits_next_gen = 0;
    thread _id_7FA9();
    self.a = spawnstruct();
    self.a._id_6E5A = "stand";
    self.a._id_60DD = 0;
    self.a._id_5F5B = "run";
    animscripts\init::_id_7DBE();
    self._id_8FEC = 1;
    self._id_2AF3 = 0;
    self.streaktype = anim._id_2CDE;
    self.veh_boatbounce = 0;
    self.turret_not_on_target = 0.2;
    thread animscripts\combat_utility::_id_5E5E();
    self.pathlookaheaddist = 512;
    self _meth_8174( "dog" );
    self.helmet = int( anim._id_2CA4 * self.helmet );
}

_id_7FA9()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self.enemy ) && isplayer( self.enemy ) )
            self.micro_dlc_bits_next_gen = anim._id_2CC3;
        else
            self.micro_dlc_bits_next_gen = anim._id_2CC1;

        self waittill( "enemy" );
    }
}

_id_4DAB()
{
    if ( !isdefined( level._id_2CDB ) )
    {
        level._id_2CDB = 1;
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_DO_NOTHING" );
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_TOO_LATE" );
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_TOO_SOON" );
        precachestring( &"SCRIPT_PLATFORM_DOG_HINT" );
        precachestring( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD" );
        precachestring( &"NEW_DOG_DEATH_DO_NOTHING_ALT" );
        precachestring( &"NEW_DOG_DEATH_TOO_LATE_ALT" );
        precachestring( &"NEW_DOG_DEATH_TOO_SOON_ALT" );
    }

    if ( isdefined( anim._id_61F9 ) )
        return;

    precacheshader( "hud_dog_melee" );
    precacheshader( "h1_dog_melee_prompt_star" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    anim._id_61F9 = 1;
    anim._id_2CDE = lengthsquared( getmovedelta( %german_shepherd_run_stop, 0, 1 ) * 1.2 );
    anim._id_2CDC = length( getmovedelta( %german_shepherd_run_start, 0, 1 ) );
    anim._id_2CC3 = 102;
    var_0 = getstartorigin( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), %german_shepherd_attack_ai_01_start_a );
    anim._id_2CC1 = length( var_0 );
    anim._id_2CE0 = [];
    anim._id_2CE0["wallhop"] = %german_shepherd_run_jump_40;
    anim._id_2CE0["window_40"] = %german_shepherd_run_jump_window_40;
    anim._id_2CE0["jump_down_40"] = %german_shepherd_traverse_down_40;
    anim._id_2CE0["jump_up_40"] = %german_shepherd_traverse_up_40;
    anim._id_2CE0["jump_up_80"] = %german_shepherd_traverse_up_80;
    anim.dogstartmoveangles[8] = 0;
    anim.dogstartmoveangles[6] = 90;
    anim.dogstartmoveangles[4] = -90;
    anim.dogstartmoveangles[3] = 180;
    anim.dogstartmoveangles[1] = -180;
    anim.dogstartmoveanim[8] = %german_shepherd_run_start;
    anim.dogstartmoveanim[6] = %german_shepherd_run_start_l;
    anim.dogstartmoveanim[4] = %german_shepherd_run_start_r;
    anim.dogstartmoveanim[3] = %german_shepherd_run_start_180_l;
    anim.dogstartmoveanim[1] = %german_shepherd_run_start_180_r;
    anim._id_2CD2["attackIdle"][2] = %german_shepherd_attack_look_down;
    anim._id_2CD2["attackIdle"][4] = %german_shepherd_attack_look_left;
    anim._id_2CD2["attackIdle"][6] = %german_shepherd_attack_look_right;
    anim._id_2CD2["attackIdle"][8] = %german_shepherd_attack_look_up;
    anim._id_2CD2["normal"][2] = %german_shepherd_look_down;
    anim._id_2CD2["normal"][4] = %german_shepherd_look_left;
    anim._id_2CD2["normal"][6] = %german_shepherd_look_right;
    anim._id_2CD2["normal"][8] = %german_shepherd_look_up;
    level._effect["dog_bite_blood"] = loadfx( "impacts/deathfx_dogbite" );
    level._effect["deathfx_bloodpool"] = loadfx( "impacts/deathfx_bloodpool_view" );
    var_1 = 5;
    var_2 = [];

    for ( var_3 = 0; var_3 <= var_1; var_3++ )
        var_2[var_2.size] = var_3 / var_1;

    level._id_2CAF = 0;
    level._id_2CB0 = common_scripts\utility::_id_0CF5( var_2 );
    setdvar( "friendlySaveFromDog", "0" );
}
