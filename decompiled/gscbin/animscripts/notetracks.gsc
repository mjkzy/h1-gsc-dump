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

_id_619D( var_0 )
{
    if ( isdefined( self ) && soundexists( var_0 ) )
        self playsound( var_0 );
    else
    {

    }
}

_id_4658( var_0 )
{
    switch ( var_0 )
    {
        case "footstep_front_left_small":
        case "footstep_front_right_small":
        case "footstep_back_left_small":
        case "footstep_back_right_small":
        case "footstep_front_left_large":
        case "footstep_front_right_large":
        case "footstep_back_left_large":
        case "footstep_back_right_large":
        case "fs_fr_l_sm":
        case "fs_fr_r_sm":
        case "fs_bk_l_sm":
        case "fs_bk_r_sm":
        case "fs_fr_l_lg":
        case "fs_fr_r_lg":
        case "fs_bk_l_lg":
        case "fs_bk_r_lg":
            var_1 = undefined;

            if ( isdefined( self.gunshot_teammate ) )
            {
                var_1 = self.gunshot_teammate;
                self._id_55A7 = var_1;
            }
            else if ( isdefined( self._id_55A7 ) )
                var_1 = self._id_55A7;
            else
                var_1 = "dirt";

            if ( var_1 != "dirt" && var_1 != "concrete" && var_1 != "wood" && var_1 != "metal" )
                var_1 = "dirt";

            if ( var_1 == "concrete" )
                var_1 = "cement";

            var_2 = self._id_5F44;

            if ( !isdefined( var_2 ) )
                var_2 = "run";

            var_3 = self _meth_83cb() || isdefined( self._id_2198 );

            if ( var_3 )
                self playsound( "dogstep_plr_" + var_2 + "_" + var_1 );
            else
                self playsound( "dogstep_" + var_2 + "_" + var_1 );

            if ( !isdefined( self._id_135A ) || self._id_135A )
            {
                if ( issubstr( var_0, "front_left" ) || issubstr( var_0, "fr_l" ) )
                {
                    var_4 = "anml_dog_mvmt_accent";
                    var_5 = "anml_dog_mvmt_vest";

                    if ( var_3 )
                    {
                        if ( !isdefined( self._id_2E03 ) || self._id_2E03 == "walk" )
                            var_6 = "_plr";
                        else
                            var_6 = "_run_plr";
                    }
                    else if ( var_2 == "walk" )
                        var_6 = "_npc";
                    else
                        var_6 = "_run_npc";

                    self playsound( var_4 + var_6 );
                    self playsound( var_5 + var_6 );
                }
            }

            return 1;
    }

    return 0;
}

_id_4659( var_0 )
{
    if ( _id_4658( var_0 ) )
        return 1;

    if ( var_0 == "sound_dogstep_run_default" )
    {
        _id_619D( "dogstep_run_default" );
        return 1;
    }

    var_1 = getsubstr( var_0, 0, 5 );

    if ( var_1 != "sound" )
        return 0;

    var_2 = "anml" + getsubstr( var_0, 5 );

    if ( soundexists( var_2 ) )
    {
        if ( isalive( self ) )
            thread maps\_utility::_id_69C6( var_2, "tag_eye" );
        else
            thread common_scripts\utility::_id_69C2( var_2, self geteye() );
    }

    return 1;
}

_id_4440()
{
    return isdefined( self._id_7A0B );
}

_id_72F3()
{
    anim._id_61E5["anim_pose = \"stand\""] = ::_id_61E1;
    anim._id_61E5["anim_pose = \"crouch\""] = ::_id_61DF;
    anim._id_61E5["anim_pose = \"prone\""] = ::_id_61E0;
    anim._id_61E5["anim_pose = \"crawl\""] = ::_id_61DE;
    anim._id_61E5["anim_pose = \"back\""] = ::_id_61DD;
    anim._id_61E5["anim_movement = \"stop\""] = ::_id_61D7;
    anim._id_61E5["anim_movement = \"walk\""] = ::_id_61D8;
    anim._id_61E5["anim_movement = \"run\""] = ::_id_61D6;
    anim._id_61E5["anim_aiming = 1"] = ::_id_61BE;
    anim._id_61E5["anim_aiming = 0"] = ::_id_61BF;
    anim._id_61E5["anim_alertness = causal"] = ::_id_61C0;
    anim._id_61E5["anim_alertness = alert"] = ::_id_61BF;
    anim._id_61E5["anim_alertness = aiming"] = ::_id_61BE;
    anim._id_61E5["gunhand = (gunhand)_left"] = ::_id_61CE;
    anim._id_61E5["anim_gunhand = \"left\""] = ::_id_61CE;
    anim._id_61E5["gunhand = (gunhand)_right"] = ::_id_61CE;
    anim._id_61E5["anim_gunhand = \"right\""] = ::_id_61CE;
    anim._id_61E5["anim_gunhand = \"none\""] = ::_id_61CE;
    anim._id_61E5["equip_secondary"] = ::notetracksecondaryguntorighthand;
    anim._id_61E5["gun drop"] = ::_id_61CD;
    anim._id_61E5["dropgun"] = ::_id_61CD;
    anim._id_61E5["gun_2_chest"] = ::_id_61D0;
    anim._id_61E5["gun_2_back"] = ::_id_61CF;
    anim._id_61E5["pistol_pickup"] = ::_id_61DA;
    anim._id_61E5["pistol_putaway"] = ::_id_61DB;
    anim._id_61E5["drop clip"] = ::_id_61C5;
    anim._id_61E5["refill clip"] = ::_id_61E2;
    anim._id_61E5["reload done"] = ::_id_61E2;
    anim._id_61E5["load_shell"] = ::_id_61D4;
    anim._id_61E5["pistol_rechamber"] = ::_id_61DC;
    anim._id_61E5["gravity on"] = ::_id_61CC;
    anim._id_61E5["gravity off"] = ::_id_61CC;
    anim._id_61E5["footstep"] = ::_id_61CA;
    anim._id_61E5["step"] = ::_id_61CA;
    anim._id_61E5["footstep_right_large"] = ::_id_61CA;
    anim._id_61E5["footstep_right_small"] = ::_id_61CA;
    anim._id_61E5["footstep_left_large"] = ::_id_61CA;
    anim._id_61E5["footstep_left_small"] = ::_id_61CA;
    anim._id_61E5["footscrape"] = ::_id_61C9;
    anim._id_61E5["land"] = ::_id_61D2;
    anim._id_61E5["bodyfall large"] = ::_id_61C1;
    anim._id_61E5["bodyfall small"] = ::_id_61C1;
    anim._id_61E5["crouch_to_prone"] = ::notetrackcrouchtoprone;
    anim._id_61E5["crouch_drop"] = ::notetrackcrouchdrop;
    anim._id_61E5["pain_small"] = ::_id_61D9;
    anim._id_61E5["pain_large"] = ::_id_61D9;
    anim._id_61E5["meleeattack_eft"] = ::_id_61D5;
    anim._id_61E5["code_move"] = ::_id_61C2;
    anim._id_61E5["face_enemy"] = ::_id_61C6;
    anim._id_61E5["laser_on"] = ::_id_61D3;
    anim._id_61E5["laser_off"] = ::_id_61D3;
    anim._id_61E5["start_ragdoll"] = ::_id_61F6;
    anim._id_61E5["fire"] = ::_id_61C7;
    anim._id_61E5["fire_spray"] = ::_id_61C8;
    anim._id_61E5["bloodpool"] = animscripts\death::_id_68A1;
    anim._id_61E5["space_jet_top"] = ::_id_61F4;
    anim._id_61E5["space_jet_top_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_top_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_bottom"] = ::_id_61F4;
    anim._id_61E5["space_jet_bottom_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_bottom_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_left"] = ::_id_61F4;
    anim._id_61E5["space_jet_left_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_left_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_right"] = ::_id_61F4;
    anim._id_61E5["space_jet_right_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_right_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_front"] = ::_id_61F4;
    anim._id_61E5["space_jet_front_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_front_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_back"] = ::_id_61F4;
    anim._id_61E5["space_jet_back_1"] = ::_id_61F4;
    anim._id_61E5["space_jet_back_2"] = ::_id_61F4;
    anim._id_61E5["space_jet_back_3"] = ::_id_61F4;
    anim._id_61E5["space_jet_back_4"] = ::_id_61F4;
    anim._id_61E5["space_jet_random"] = ::_id_61F4;

    if ( isdefined( level._id_0601 ) )
    {
        var_0 = getarraykeys( level._id_0601 );

        foreach ( var_2 in var_0 )
            anim._id_61E5[var_2] = ::_id_2566;
    }
}

_id_61C7( var_0, var_1 )
{
    if ( !isdefined( self.script_context ) )
        return;

    if ( isdefined( anim._id_37BF[self.script_context] ) )
        thread [[ anim._id_37BF[self.script_context] ]]();
    else
        thread [[ ::_id_840D ]]();
}

_id_61D3( var_0, var_1 )
{
    if ( issubstr( var_0, "on" ) )
        self.a._id_54FB = 1;
    else
        self.a._id_54FB = 0;

    animscripts\shared::_id_9B2D();
}

_id_61F7( var_0, var_1 )
{

}

_id_9A35()
{
    wait 0.1;

    if ( isdefined( self ) )
        self unlink();
}

_id_61F6( var_0, var_1 )
{
    if ( isdefined( self._id_6159 ) )
        return;

    if ( isdefined( self._id_70E0 ) )
        return;

    if ( !isdefined( self._id_2D29 ) )
        self unlink();

    animscripts\shared::_id_2F6C();
    self startragdoll();
}

_id_61D7( var_0, var_1 )
{
    self.a._id_5F5B = "stop";
}

_id_61D8( var_0, var_1 )
{
    self.a._id_5F5B = "walk";
}

_id_61D6( var_0, var_1 )
{
    self.a._id_5F5B = "run";
}

_id_61BE( var_0, var_1 )
{

}

_id_61C0( var_0, var_1 )
{

}

_id_61BF( var_0, var_1 )
{

}

_id_8EFD()
{
    animscripts\utility::_id_344B( 1.0 );
    self.a._id_6451 = undefined;
}

_id_7FF0( var_0 )
{
    self.a._id_6E5A = var_0;

    if ( isdefined( self.a._id_6451 ) )
        _id_8EFD();

    self notify( "entered_pose" + var_0 );
}

_id_61E1( var_0, var_1 )
{
    if ( self.a._id_6E5A == "prone" )
    {
        self _meth_8193( "face default" );
        animscripts\utility::_id_344B( 1.0 );
    }

    _id_7FF0( "stand" );
}

_id_61DF( var_0, var_1 )
{
    if ( self.a._id_6E5A == "prone" )
    {
        self _meth_8193( "face default" );
        animscripts\utility::_id_344B( 1.0 );
    }

    _id_7FF0( "crouch" );
}
#using_animtree("generic_human");

_id_61E0( var_0, var_1 )
{
    if ( !issentient( self ) )
        return;

    self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( 1.0 );
    _id_7FF0( "prone" );

    if ( isdefined( self.a._id_425B ) )
        self.a._id_7021 = 1;
    else
        self.a._id_7021 = undefined;
}

_id_61DE( var_0, var_1 )
{
    if ( !issentient( self ) )
        return;

    self _meth_81fd( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( 1.0 );
    _id_7FF0( "prone" );
    self.a._id_7021 = undefined;
}

_id_61DD( var_0, var_1 )
{
    if ( !issentient( self ) )
        return;

    _id_7FF0( "crouch" );
    self.a._id_6451 = 1;
    self.a._id_5F5B = "stop";
    self _meth_81fd( -90, 90, %prone_legs_down, %exposed_aiming, %prone_legs_up );
    animscripts\utility::_id_3308( 1.0 );
}

_id_61CE( var_0, var_1 )
{
    if ( issubstr( var_0, "left" ) )
    {
        animscripts\shared::_id_6869( self.weapon_switch_invalid, "left" );
        self notify( "weapon_switch_done" );
    }
    else if ( issubstr( var_0, "right" ) )
    {
        animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
        self notify( "weapon_switch_done" );
    }
    else if ( issubstr( var_0, "none" ) )
        animscripts\shared::_id_6869( self.weapon_switch_invalid, "none" );
}

notetracksecondaryguntorighthand( var_0, var_1 )
{
    self notify( "weapon_switch_done" );
    thread placeweapononkillanimscript( self.secondaryweapon, "right" );
    self.weapon_switch_invalid = self.secondaryweapon;
}

placeweapononkillanimscript( var_0, var_1 )
{
    self endon( "weapon_switch_done" );
    self endon( "death" );
    self waittill( "killanimscript" );
    animscripts\shared::_id_6869( var_0, var_1 );
}

_id_61CD( var_0, var_1 )
{
    animscripts\shared::_id_2F6B();
    self._id_560F = self.weapon_switch_invalid;
}

_id_61D0( var_0, var_1 )
{
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "chest" );
}

_id_61CF( var_0, var_1 )
{
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "back" );
    self.weapon_switch_invalid = animscripts\utility::_id_409A();
    self._id_18B0 = weaponclipsize( self.weapon_switch_invalid );
}

_id_61DA( var_0, var_1 )
{
    animscripts\shared::_id_6869( self._id_855D, "right" );
    self._id_18B0 = weaponclipsize( self.weapon_switch_invalid );
    self notify( "weapon_switch_done" );
}

_id_61DB( var_0, var_1 )
{
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "none" );
    self.weapon_switch_invalid = animscripts\utility::_id_409A();
    self._id_18B0 = weaponclipsize( self.weapon_switch_invalid );
}

_id_61C5( var_0, var_1 )
{
    thread animscripts\shared::_id_465B( var_1 );
}

_id_61E2( var_0, var_1 )
{
    animscripts\weaponlist::_id_72B1();
    self.a._id_6084 = 0;
}

_id_61D4( var_0, var_1 )
{
    _id_619D( "weap_reload_shotgun_loop_npc" );
}

_id_61DC( var_0, var_1 )
{
    _id_619D( "weap_reload_pistol_chamber_npc" );
}

_id_61CC( var_0, var_1 )
{
    if ( issubstr( var_0, "on" ) )
        self _meth_8192( "gravity" );
    else if ( issubstr( var_0, "off" ) )
        self _meth_8192( "nogravity" );
}

_id_61CA( var_0, var_1 )
{
    var_2 = issubstr( var_0, "left" );
    var_3 = issubstr( var_0, "large" );
    _id_6D9F( var_2, var_3 );

    if ( isdefined( level.play_additionnal_fs_sfx ) )
        soundscripts\_snd::_id_870C( "play_additionnal_fs_sfx" );

    self.leftfootdown = var_2;
}

_id_3DF2()
{
    var_0 = "run";

    if ( isdefined( self._id_8AA8 ) )
        var_0 = "sprint";

    if ( isdefined( self.a ) )
    {
        if ( isdefined( self.a._id_5F5B ) )
        {
            if ( self.a._id_5F5B == "walk" )
                var_0 = "walk";
        }

        if ( isdefined( self.a._id_6E5A ) )
        {
            if ( self.a._id_6E5A == "prone" )
                var_0 = "prone";
        }
    }

    return var_0;
}

_id_61F4( var_0, var_1 )
{
    thread _id_61F5( var_0, var_1 );
}

_id_61F5( var_0, var_1 )
{
    self endon( "death" );
    var_2 = [];
    var_3 = undefined;

    switch ( var_0 )
    {
        case "space_jet_bottom":
            var_2 = [ "tag_jet_bottom_1", "tag_jet_bottom_2" ];
            break;
        case "space_jet_bottom_1":
            var_2 = [ "tag_jet_bottom_1" ];
            break;
        case "space_jet_bottom_2":
            var_2 = [ "tag_jet_bottom_2" ];
            break;
        case "space_jet_top":
            var_2 = [ "tag_jet_top_1", "tag_jet_top_2" ];
            break;
        case "space_jet_top_1":
            var_2 = [ "tag_jet_top_1" ];
            break;
        case "space_jet_top_2":
            var_2 = [ "tag_jet_top_2" ];
            break;
        case "space_jet_left":
            var_2 = [ "tag_jet_le_1", "tag_jet_le_2" ];
            break;
        case "space_jet_left_1":
            var_2 = [ "tag_jet_le_1" ];
            break;
        case "space_jet_left_2":
            var_2 = [ "tag_jet_le_2" ];
            break;
        case "space_jet_right":
            var_2 = [ "tag_jet_ri_1", "tag_jet_ri_2" ];
            break;
        case "space_jet_right_1":
            var_2 = [ "tag_jet_ri_1" ];
            break;
        case "space_jet_right_2":
            var_2 = [ "tag_jet_ri_2" ];
            break;
        case "space_jet_front":
            var_2 = [ "tag_jet_front_1", "tag_jet_front_2" ];
            break;
        case "space_jet_front_1":
            var_2 = [ "tag_jet_front_1" ];
            break;
        case "space_jet_front_2":
            var_2 = [ "tag_jet_front_2" ];
            break;
        case "space_jet_back":
            var_2 = [ "tag_jet_back_1", "tag_jet_back_2", "tag_jet_back_3", "tag_jet_back_4" ];
            break;
        case "space_jet_back_1":
            var_2 = [ "tag_jet_back_1" ];
            break;
        case "space_jet_back_2":
            var_2 = [ "tag_jet_back_2" ];
            break;
        case "space_jet_back_3":
            var_2 = [ "tag_jet_back_3" ];
            break;
        case "space_jet_back_4":
            var_2 = [ "tag_jet_back_4" ];
            break;
        case "space_jet_random":
            var_2 = [ "tag_jet_bottom_1", "tag_jet_bottom_2", "tag_jet_top_1", "tag_jet_top_2", "tag_jet_le_1", "tag_jet_le_2", "tag_jet_ri_1", "tag_jet_ri_2" ];
            break;
    }

    if ( common_scripts\utility::_id_3BA5( "space_jet_small" ) && isdefined( var_2 ) )
    {
        if ( isdefined( var_2 ) )
        {
            if ( var_0 == "space_jet_random" )
            {
                for ( var_4 = 0; var_4 < 6; var_4++ )
                {
                    var_5 = randomint( 8 );
                    var_6 = var_2[var_5];

                    if ( maps\_utility::_id_4749( self.motiontrackerenabled, var_6 ) )
                    {
                        if ( !isdefined( self._id_10F2 ) )
                            self._id_10F2 = 0;

                        self._id_10F2++;

                        if ( self._id_10F2 > 5 )
                            self._id_10F2 = 0;

                        if ( self._id_10F2 == 1 )
                            self playsound( "space_npc_jetpack_boost_ss" );

                        playfxontag( level._effect["space_jet_small"], self, var_6 );
                    }

                    wait(randomfloatrange( 0.1, 0.3 ));
                }
            }
            else
            {
                foreach ( var_6 in var_2 )
                {
                    if ( isdefined( var_6 ) && maps\_utility::_id_4749( self.motiontrackerenabled, var_6 ) )
                    {
                        if ( !isdefined( self._id_10F2 ) )
                            self._id_10F2 = 0;

                        self._id_10F2++;

                        if ( self._id_10F2 > 5 )
                            self._id_10F2 = 0;

                        if ( self._id_10F2 == 1 )
                            self playsound( "space_npc_jetpack_boost_ss" );

                        playfxontag( level._effect["space_jet_small"], self, var_6 );
                        wait 0.1;
                    }
                }
            }
        }
    }
}

_id_2566( var_0, var_1 )
{
    if ( isdefined( self.gunshot_teammate ) )
        var_2 = self.gunshot_teammate;
    else
        var_2 = "dirt";

    var_3 = undefined;

    if ( isdefined( level._id_0601[var_0][var_2] ) )
        var_3 = level._id_0601[var_0][var_2];
    else if ( isdefined( level._id_0601[var_0]["all"] ) )
        var_3 = level._id_0601[var_0]["all"];

    if ( !isdefined( var_3 ) )
        return;

    if ( isai( self ) && isdefined( var_3.fx ) )
        playfxontag( var_3.fx, self, var_3.tag_aim_animated );

    if ( !isdefined( var_3._id_88A4 ) && !isdefined( var_3._id_88A6 ) )
        return;

    var_4 = "" + var_3._id_88A4 + var_2 + var_3._id_88A6;

    if ( !soundexists( var_4 ) )
        var_4 = "" + var_3._id_88A4 + "default" + var_3._id_88A6;

    _id_619D( var_4 );
}

_id_61C9( var_0, var_1 )
{
    if ( isdefined( self.gunshot_teammate ) )
        var_2 = self.gunshot_teammate;
    else
        var_2 = "dirt";

    self playfoley( "scrape", var_2 );
}

_id_61D2( var_0, var_1 )
{
    if ( isdefined( self.gunshot_teammate ) )
        var_2 = self.gunshot_teammate;
    else
        var_2 = "dirt";

    self playfoley( "land", var_2 );
}

_id_61C2( var_0, var_1 )
{
    return "code_move";
}

_id_61C6( var_0, var_1 )
{
    if ( self.script_context != "reactions" )
        self _meth_8193( "face enemy" );
    else if ( isdefined( self.enemy ) && distancesquared( self.enemy.origin, self.recipename ) < 4096 )
        self _meth_8193( "face enemy" );
    else
        self _meth_8193( "face point", self.recipename );
}

notetrackcrouchtoprone( var_0, var_1 )
{
    if ( isdefined( self.gunshot_teammate ) )
        var_2 = self.gunshot_teammate;
    else
        var_2 = "default";

    var_3 = "step_prone_drop_" + var_2;

    if ( !soundexists( var_3 ) )
        var_3 = "step_prone_drop_default";

    _id_619D( var_3 );
}

notetrackcrouchdrop( var_0, var_1 )
{
    var_2 = "gear_rattle_crouch_drop";
    _id_619D( var_2 );
}

_id_61C1( var_0, var_1 )
{
    var_2 = "_small";

    if ( issubstr( var_0, "large" ) )
        var_2 = "_large";

    if ( isdefined( self.gunshot_teammate ) )
        var_3 = self.gunshot_teammate;
    else
        var_3 = "dirt";

    var_4 = "bodyfall_" + var_3 + var_2;

    if ( !soundexists( var_4 ) )
        var_4 = "bodyfall_default" + var_2;

    _id_619D( var_4 );
}

_id_61D9( var_0, var_1 )
{
    var_2 = "_small";

    if ( issubstr( var_0, "large" ) )
        var_2 = "";

    animscripts\face::_id_7824( "pain" + var_2 );
}

_id_61D5( var_0, var_1 )
{
    animscripts\face::_id_7824( "meleeattack" );
}

_id_467A()
{
    self endon( "detached" );
    common_scripts\utility::_id_A069( "death", "killanimscript" );

    if ( isdefined( self._id_7590 ) )
        self._id_7590 delete();
}

_id_61E3()
{
    self._id_7590 = spawn( "script_model", self.origin );

    if ( issubstr( tolower( self.weapon_switch_invalid ), "panzerfaust" ) )
        self._id_7590 setmodel( "weapon_panzerfaust3_missle" );
    else
        self._id_7590 setmodel( "projectile_rpg7" );

    self._id_7590 linkto( self, "tag_inhand", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    thread _id_467A();
}

_id_61E4()
{
    self notify( "detached" );

    if ( isdefined( self._id_7590 ) )
        self._id_7590 delete();

    self.a._id_7597 = 1;

    if ( isai( self ) && !isalive( self ) )
        return;

    if ( maps\_utility::_id_4749( getweaponmodel( self.weapon_switch_invalid ), "tag_rocket" ) )
        self showpart( "tag_rocket" );
}

_id_466C( var_0, var_1, var_2, var_3 )
{
    if ( isai( self ) && self.unlockpoints == "dog" )
    {
        if ( _id_4659( var_0 ) )
            return;
    }

    var_4 = anim._id_61E5[var_0];

    if ( isdefined( var_4 ) )
        return [[ var_4 ]]( var_0, var_1 );

    if ( !isdefined( var_3 ) || !var_3 )
    {
        var_5 = getsubstr( var_0, 0, 3 );

        if ( var_5 == "ps_" )
        {
            var_6 = getsubstr( var_0, 3 );
            _id_619D( var_6 );
        }
    }

    switch ( var_0 )
    {
        case "finish":
        case "end":
        case "undefined":
            return var_0;
        case "finish early":
            if ( isdefined( self.enemy ) )
                return var_0;

            break;
        case "swish small":
            thread common_scripts\utility::_id_69C2( "melee_swing_small", self gettagorigin( "TAG_WEAPON_RIGHT" ) );
            break;
        case "swish large":
            thread common_scripts\utility::_id_69C2( "melee_swing_large", self gettagorigin( "TAG_WEAPON_RIGHT" ) );
            break;
        case "torso_mvmnt":
            thread common_scripts\utility::_id_69C2( "foly_mvmnt_cloth_npc", self.origin );
            break;
        case "rechamber":
            if ( animscripts\utility::_id_A2CF() )
                _id_619D( "weap_reload_shotgun_pump_npc" );

            self.a._id_6084 = 0;
            break;
        case "no death":
            self.a._id_612E = 1;
            break;
        case "no pain":
            self.allowpain = 0;
            break;
        case "allow pain":
            self.allowpain = 1;
            break;
        case "anim_melee = right":
        case "anim_melee = "right"":
            self.a._id_5B90 = "right";
            break;
        case "anim_melee = left":
        case "anim_melee = "left"":
            self.a._id_5B90 = "left";
            break;
        case "swap taghelmet to tagleft":
            if ( isdefined( self._id_475D ) )
            {
                if ( isdefined( self._id_4821 ) )
                {
                    self detach( self._id_4821, "TAG_HELMETSIDE" );
                    self._id_4821 = undefined;
                }

                self detach( self._id_475D, "" );
                self attach( self._id_475D, "TAG_WEAPON_LEFT" );
                self._id_475D = undefined;
            }

            break;
        case "stop anim":
            maps\_utility::_id_0C3D();
            return var_0;
        case "break glass":
            level notify( "glass_break", self );
            break;
        case "break_glass":
            level notify( "glass_break", self );
            break;
        case "attach clip left":
            if ( animscripts\utility::_id_9C36() )
                _id_61E3();

            break;
        case "detach clip left":
            if ( animscripts\utility::_id_9C36() )
                _id_61E4();
        default:
            if ( isdefined( var_2 ) )
                return [[ var_2 ]]( var_0 );

            break;
    }
}

_id_2D10( var_0, var_1, var_2 )
{
    for (;;)
    {
        self waittill( var_0, var_3 );

        if ( !isdefined( var_3 ) )
            var_3 = "undefined";

        var_4 = [[ var_1 ]]( var_3 );

        if ( isdefined( var_4 ) && var_4 )
            continue;

        var_5 = _id_466C( var_3, var_0 );

        if ( isdefined( var_5 ) )
            return var_5;
    }
}

_id_2D11( var_0, var_1 )
{
    for (;;)
    {
        self waittill( var_0, var_2 );

        if ( !isdefined( var_2 ) )
            var_2 = "undefined";

        var_3 = _id_466C( var_2, var_0 );
        [[ var_1 ]]( var_2 );

        if ( isdefined( var_3 ) )
            return var_3;
    }
}

_id_2D0E( var_0, var_1, var_2, var_3 )
{
    animscripts\shared::_id_2D06( var_0, var_2, var_3 );
}

_id_2D07( var_0, var_1, var_2, var_3 )
{
    _id_2D09( animscripts\shared::_id_2D06, var_0, var_1, var_2, var_3 );
}

_id_2D08( var_0, var_1, var_2, var_3 )
{
    _id_2D09( ::_id_2D10, var_0, var_1, var_2, var_3 );
}

_id_2D09( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_2 ) )
        self endon( var_2 );

    self endon( "killanimscript" );

    if ( !isdefined( var_4 ) )
        var_4 = "undefined";

    for (;;)
    {
        var_5 = gettime();
        var_6 = [[ var_0 ]]( var_1, var_3, var_4 );
        var_7 = gettime() - var_5;

        if ( var_7 < 0.05 )
        {
            var_5 = gettime();
            var_6 = [[ var_0 ]]( var_1, var_3, var_4 );
            var_7 = gettime() - var_5;

            if ( var_7 < 0.05 )
                wait(0.05 - var_7);
        }
    }
}

_id_2D14( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4 thread _id_2D0C( var_1 );
    _id_2D0F( ::_id_2D0E, var_0, var_2, var_3, var_4 );
}

_id_2D0B( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4 thread _id_2D0C( var_0 );
    _id_2D0F( ::_id_2D07, var_1, var_2, var_3, var_4 );
}

_id_2D0D( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4 thread _id_2D0C( var_0 );
    _id_2D0F( ::_id_2D08, var_1, var_2, var_3, var_4 );
}

_id_2D0F( var_0, var_1, var_2, var_3, var_4 )
{
    var_4 endon( "stop_notetracks" );
    [[ var_0 ]]( var_1, undefined, var_2, var_3 );
}

_id_2D0C( var_0 )
{
    wait(var_0);
    self notify( "stop_notetracks" );
}

_id_6D9F( var_0, var_1 )
{
    if ( isdefined( self._id_6DA2 ) )
        self thread [[ self._id_6DA2 ]]( var_0, var_1 );
    else
    {
        if ( !isai( self ) )
        {
            _id_619D( "step_run_dirt" );
            return;
        }

        var_2 = _id_3DF2();
        var_3 = undefined;

        if ( !isdefined( self.gunshot_teammate ) )
        {
            if ( !isdefined( self._id_55A7 ) )
            {
                self playfoley( var_2, "dirt" );
                return;
            }

            var_3 = self._id_55A7;
        }
        else
        {
            var_3 = self.gunshot_teammate;
            self._id_55A7 = self.gunshot_teammate;
        }

        var_4 = "J_Ball_RI";

        if ( var_0 )
            var_4 = "J_Ball_LE";

        var_5 = self gettagorigin( var_4 );
        var_6 = bullettrace( var_5 + ( 0, 0, 16 ), var_5 + ( 0, 0, -4 ), 0 );

        if ( var_6["fraction"] < 1 && var_6["fraction"] > 0 && var_6["surfacetype"] != "none" )
        {
            var_3 = var_6["surfacetype"];
            var_5 = var_6["position"];
        }

        self playfoley( var_2, var_3 );

        if ( var_1 )
        {
            if ( ![[ anim._id_6548 ]]( var_4, var_3, var_5 ) )
            {
                _id_6DA1( var_4, var_3, var_5 );
                return;
            }

            return;
        }

        if ( ![[ anim._id_654A ]]( var_4, var_3, var_5 ) )
            _id_6DA0( var_4, var_3, var_5 );
    }
}

_id_6DA0( var_0, var_1, var_2 )
{
    if ( !isdefined( anim._id_6549[var_1] ) )
        return 0;

    if ( !isdefined( var_2 ) )
        var_2 = self gettagorigin( var_0 );

    var_3 = self.angles;
    var_4 = anglestoforward( var_3 );
    var_5 = var_4 * -1;
    var_6 = anglestoup( var_3 );
    playfx( level._effect["step_" + var_1], var_2, var_6, var_5 );
    return 1;
}

_id_6DA1( var_0, var_1, var_2 )
{
    if ( !isdefined( anim._id_654B[var_1] ) )
        return 0;

    if ( !isdefined( var_2 ) )
        var_2 = self gettagorigin( var_0 );

    var_3 = self.angles;
    var_4 = anglestoforward( var_3 );
    var_5 = var_4 * -1;
    var_6 = anglestoup( var_3 );
    playfx( level._effect["step_small_" + var_1], var_2, var_6, var_5 );
    return 1;
}

_id_840D()
{
    waitframe;

    if ( isdefined( self ) && gettime() > self.a._id_55D7 )
    {
        animscripts\utility::_id_83F2();
        animscripts\combat_utility::_id_275F();

        if ( weaponclass( self.weapon_switch_invalid ) == "rocketlauncher" )
            self.a._id_7594--;
    }
}

_id_37C7()
{
    if ( self.a._id_A2E2["right"] == "none" )
        return;

    if ( isdefined( self._id_2D3A ) )
    {
        _id_840D();
        return;
    }

    var_0 = self _meth_81bc();
    var_1 = anglestoforward( self _meth_81bd() );
    var_2 = var_0 + var_1 * 1000;
    self _meth_81ea( 1, var_2 );
    animscripts\combat_utility::_id_275F();
}

_id_61C8( var_0, var_1 )
{
    if ( !isalive( self ) && self _meth_813f() )
    {
        if ( isdefined( self._id_1C7F ) )
            return;

        self._id_1C7F = 1;
        var_2["axis"] = "team3";
        var_2["team3"] = "axis";
        self.team = var_2[self.team];
    }

    if ( !issentient( self ) )
    {
        self notify( "fire" );
        return;
    }

    if ( self.a._id_A2E2["right"] == "none" )
        return;

    var_3 = self _meth_81bc();
    var_4 = anglestoforward( self _meth_81bd() );
    var_5 = 10;

    if ( isdefined( self._id_5187 ) )
        var_5 = 20;

    var_6 = 0;

    if ( isalive( self.enemy ) && issentient( self.enemy ) && self _meth_81c1() )
    {
        var_7 = vectornormalize( self.enemy geteye() - var_3 );

        if ( vectordot( var_4, var_7 ) > cos( var_5 ) )
            var_6 = 1;
    }

    if ( var_6 )
        animscripts\utility::_id_83F2();
    else
    {
        var_4 += ( ( randomfloat( 2 ) - 1 ) * 0.1, ( randomfloat( 2 ) - 1 ) * 0.1, ( randomfloat( 2 ) - 1 ) * 0.1 );
        var_8 = var_3 + var_4 * 1000;
        self [[ anim._id_8413 ]]( var_8 );
    }

    animscripts\combat_utility::_id_275F();
}
