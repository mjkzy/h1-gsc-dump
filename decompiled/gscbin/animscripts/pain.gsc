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

_id_4C9F()
{
    var_0 = [];
    var_0["damage_shield_crouch"] = %exposed_crouch_extendedpaina;
    var_0["damage_shield_pain_array"] = [ %stand_exposed_extendedpain_chest, %stand_exposed_extendedpain_head_2_crouch, %stand_exposed_extendedpain_hip_2_crouch ];
    var_0["back"] = %back_pain;
    var_0["run_long"] = [ %run_pain_leg, %run_pain_shoulder, %run_pain_stomach_stumble, %run_pain_head, %run_pain_fallonknee_02, %run_pain_stomach, %run_pain_stumble, %run_pain_stomach_fast, %run_pain_leg_fast, %run_pain_fall ];
    var_0["run_medium"] = [ %run_pain_fallonknee_02, %run_pain_stomach, %run_pain_stumble, %run_pain_stomach_fast, %run_pain_leg_fast, %run_pain_fall ];
    var_0["run_short"] = [ %run_pain_fallonknee, %run_pain_fallonknee_03 ];
    var_0["pistol_torso_upper"] = [ %pistol_stand_pain_chest, %pistol_stand_pain_rightshoulder, %pistol_stand_pain_leftshoulder ];
    var_0["pistol_torso_lower"] = [ %pistol_stand_pain_chest, %pistol_stand_pain_groin ];
    var_0["pistol_neck"] = [ %pistol_stand_pain_chest, %pistol_stand_pain_head ];
    var_0["pistol_head"] = [ %pistol_stand_pain_head ];
    var_0["pistol_leg"] = [ %pistol_stand_pain_groin ];
    var_0["pistol_left_arm_upper"] = [ %pistol_stand_pain_chest, %pistol_stand_pain_leftshoulder ];
    var_0["pistol_right_arm_upper"] = [ %pistol_stand_pain_chest, %pistol_stand_pain_rightshoulder ];
    var_0["pistol_left_arm_lower"] = [ %pistol_stand_pain_leftshoulder ];
    var_0["pistol_right_arm_lower"] = [ %pistol_stand_pain_rightshoulder ];
    var_0["pistol_default1"] = [ %pistol_stand_pain_chest ];
    var_0["pistol_default2"] = [ %pistol_stand_pain_groin ];
    var_0["torso_pistol"] = %pistol_stand_pain_chest;
    var_0["torso_upper"] = [ %exposed_pain_face, %stand_exposed_extendedpain_neck ];
    var_0["torso_upper_extended"] = [ %stand_exposed_extendedpain_gut, %stand_exposed_extendedpain_stomach, %stand_exposed_extendedpain_head_2_crouch ];
    var_0["torso_lower"] = [ %exposed_pain_groin, %stand_exposed_extendedpain_hip ];
    var_0["torso_lower_extended"] = [ %stand_exposed_extendedpain_gut, %stand_exposed_extendedpain_stomach, %stand_exposed_extendedpain_hip_2_crouch, %stand_exposed_extendedpain_feet_2_crouch, %stand_exposed_extendedpain_stomach ];
    var_0["head"] = [ %exposed_pain_face, %stand_exposed_extendedpain_neck ];
    var_0["head_extended"] = [ %stand_exposed_extendedpain_head_2_crouch ];
    var_0["right_arm"] = [ %exposed_pain_right_arm ];
    var_0["right_arm_extended"] = [];
    var_0["left_arm"] = [ %stand_exposed_extendedpain_shoulderswing ];
    var_0["left_arm_extended"] = [ %stand_exposed_extendedpain_shoulder_2_crouch ];
    var_0["leg"] = [ %exposed_pain_groin, %stand_exposed_extendedpain_hip ];
    var_0["leg_extended"] = [ %stand_exposed_extendedpain_hip_2_crouch, %stand_exposed_extendedpain_feet_2_crouch, %stand_exposed_extendedpain_stomach ];
    var_0["foot"] = [ %stand_exposed_extendedpain_thigh ];
    var_0["foot_extended"] = [ %stand_exposed_extendedpain_feet_2_crouch ];
    var_0["default_long"] = [ %exposed_pain_2_crouch, %stand_extendedpainb ];
    var_0["default_short"] = [ %exposed_pain_right_arm, %exposed_pain_face, %exposed_pain_groin ];
    var_0["default_extended"] = [ %stand_extendedpainc, %stand_exposed_extendedpain_chest ];
    var_0["crouch_longdeath"] = [ %exposed_crouch_extendedpaina ];
    var_0["crouch_default"] = [ %exposed_crouch_pain_chest, %exposed_crouch_pain_headsnap, %exposed_crouch_pain_flinch ];
    var_0["crouch_left_arm"] = [ %exposed_crouch_pain_left_arm ];
    var_0["crouch_right_arm"] = [ %exposed_crouch_pain_right_arm ];
    var_0["prone"] = [ %prone_reaction_a, %prone_reaction_b ];
    var_0["cover_left_stand"] = [ %corner_standl_painb, %corner_standl_painc, %corner_standl_paind, %corner_standl_paine ];
    var_0["cover_left_crouch"] = [ [ %h1_cornercrl_painb_2 ], [ %cornercrl_painb ] ];
    var_0["cover_right_stand"] = [ %corner_standr_pain, %corner_standr_painb, %corner_standr_painc ];
    var_0["cover_right_crouch"] = [ [ %h1_cornercrr_alert_paina_2, %h1_cornercrr_alert_painb_2, %h1_cornercrr_alert_painc_2 ], [ %cornercrr_alert_paina, %cornercrr_alert_painc ] ];
    var_0["cover_right_stand_A"] = %h1_cornerstndr_pain_2_cover_a;
    var_0["cover_right_stand_B"] = %h1_cornerstndr_pain_2_cover_b;
    var_0["cover_left_stand_A"] = %h1_cornerstndl_pain_2_cover_a;
    var_0["cover_left_stand_B"] = %h1_cornerstndl_pain_2_cover_b;
    var_0["cover_crouch"] = [ %covercrouch_pain_front, %covercrouch_pain_left_3 ];
    var_0["cover_stand"] = [ %coverstand_pain_groin, %coverstand_pain_leg ];
    var_0["cover_stand_aim"] = [ %coverstand_pain_aim_2_hide_01, %coverstand_pain_aim_2_hide_02 ];
    var_0["smg_cover_stand_aim"] = [ %smg_coverstand_pain_aim_2_hide_01, %smg_coverstand_pain_aim_2_hide_02 ];
    var_0["cover_crouch_aim"] = [ %covercrouch_pain_aim_2_hide_01 ];
    var_0["saw_stand"] = %saw_gunner_pain;
    var_0["saw_crouch"] = %saw_gunner_lowwall_pain_02;
    var_0["saw_prone"] = %saw_gunner_prone_pain;
    anim._id_0CCA["soldier"]["pain"] = var_0;
    var_0 = [];
    var_0["prone_transition"] = [ %dying_crawl_2_back ];
    var_0["stand_transition"] = [ %dying_stand_2_back_v1, %dying_stand_2_back_v2 ];
    var_0["crouch_transition"] = [ %dying_crouch_2_back ];
    var_0["default_transition"] = %dying_crawl_2_back;
    var_0["stand_2_crawl"] = [ %dying_stand_2_crawl_v1, %dying_stand_2_crawl_v2, %dying_stand_2_crawl_v3 ];
    var_0["crouch_2_crawl"] = [ %dying_crouch_2_crawl ];
    var_0["crawl"] = %dying_crawl;
    var_0["death"] = [ %dying_crawl_death_v1, %dying_crawl_death_v2 ];
    var_0["back_idle"] = %dying_back_idle;
    var_0["back_idle_twitch"] = [ %dying_back_twitch_a, %dying_back_twitch_b ];
    var_0["back_crawl"] = %dying_crawl_back;
    var_0["back_fire"] = %dying_back_fire;
    var_0["back_death"] = [ %dying_back_death_v1, %dying_back_death_v2, %dying_back_death_v3 ];
    var_0["aim_4"] = %dying_back_aim_4;
    var_0["aim_6"] = %dying_back_aim_6;
    var_0["longdeath"] = [];
    var_0["longdeath"]["gut_b"] = [ [ %stand_2_longdeath_wander_gut, %longdeath_wander_gut, %longdeath_wander_gut_collapse, %longdeath_wander_gut_death ], [ %stand_2_longdeath_gut_wounded_b, %longdeath_gut_wounded_b_walk, %longdeath_gut_wounded_b_collapse ], [ %stand_2_longdeath_gut_b, %longdeath_gut_b_walk, %longdeath_gut_b_impact ] ];
    var_0["longdeath"]["gut_l"] = [ [ %stand_2_longdeath_gut_l, %longdeath_gut_l_walk, %longdeath_gut_l_impact ] ];
    var_0["longdeath"]["gut_r"] = [ [ %stand_2_longdeath_gut_r, %longdeath_gut_r_walk, %longdeath_gut_r_impact ] ];
    var_0["longdeath"]["leg_b"] = [ [ %stand_2_longdeath_wander_leg_1, %longdeath_wander_leg_1, %longdeath_wander_leg_collapse_1, %longdeath_wander_leg_death ], [ %stand_2_longdeath_wander_leg_2, %longdeath_wander_leg_2, %longdeath_wander_leg_collapse_2, %longdeath_wander_leg_death ], [ %stand_2_longdeath_leg_wounded_b_1, %longdeath_leg_wounded_b_walk_1, %longdeath_leg_wounded_b_collapse_1 ], [ %stand_2_longdeath_leg_wounded_b_2, %longdeath_leg_wounded_b_walk_2, %longdeath_leg_wounded_b_collapse_2 ] ];
    anim._id_0CCA["soldier"]["crawl_death"] = var_0;
    var_0 = [];
    var_0["pain"] = %corner_standr_death_grenade_hit;
    var_0["idle"] = %corner_standr_death_grenade_idle;
    var_0["release"] = %corner_standr_death_grenade_slump;
    var_0["premature_death"] = [ %dying_back_death_v1, %dying_back_death_v2, %dying_back_death_v3, %dying_back_death_v4 ];
    anim._id_0CCA["soldier"]["corner_grenade_death"] = var_0;
    var_0 = [];
    var_0["default"] = [ %pain_add_standing_belly, %pain_add_standing_left_arm, %pain_add_standing_right_arm ];
    var_0["left_arm"] = %pain_add_standing_left_arm;
    var_0["right_arm"] = %pain_add_standing_right_arm;
    var_0["left_leg"] = %pain_add_standing_left_leg;
    var_0["right_leg"] = %pain_add_standing_right_leg;
    anim._id_0CCA["soldier"]["additive_pain"] = var_0;
}

shouldplaypreh1painanim()
{
    if ( isdefined( self.preh1_pain_anims ) && self.preh1_pain_anims )
        return 1;

    return 0;
}

verifypreh1()
{

}

verifyh1()
{

}

main()
{
    if ( !animscripts\utility::using_improved_transitions() )
        self.preh1_pain_anims = 1;

    if ( isdefined( self._id_584E ) )
    {
        self waittill( "killanimscript" );
        return;
    }

    if ( [[ anim._id_664F ]]() )
        return;

    if ( self.a._id_2B20 )
        return;

    self notify( "kill_long_death" );
    self._id_35C5 = undefined;

    if ( isdefined( self.a._id_665F ) )
        self.a._id_55C7 = self.a._id_665F;
    else
        self.a._id_55C7 = 0;

    if ( isdefined( self._id_58D7 ) && self._id_58D7 && gettime() - self.a._id_55C7 < 1500 )
        return;

    self.a._id_665F = gettime();

    if ( self.start_move != "none" )
        self.a._id_665A = 1;
    else
        self.a._id_665A = undefined;

    if ( self.a._id_60DD )
        self.helmet = 1;

    self notify( "anim entered pain" );
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "pain" );
    self _meth_8192( "gravity" );

    if ( !isdefined( self._id_6107 ) )
        animscripts\face::_id_7824( "pain" );

    if ( self.damagelocation == "helmet" )
        animscripts\death::_id_4820();
    else if ( _id_A1C4() && randomint( 2 ) == 0 )
        animscripts\death::_id_4820();

    if ( isdefined( self._id_6658 ) )
    {
        self [[ self._id_6658 ]]();
        return;
    }

    if ( _id_238E() )
        return;

    if ( _id_8A33( self.a._id_8A1A ) )
        return;

    var_0 = _id_4079();

    if ( isdefined( var_0 ) )
        self.a._id_6651 = getanimlength( var_0 );

    _id_6DCE( var_0 );
}

_id_4DF7()
{
    level._effect["crawling_death_blood_smear"] = loadfx( "vfx/blood/blood_smear_decal" );
}

end_script()
{
    if ( isdefined( self._id_25B0 ) )
    {
        self._id_25AF = undefined;
        self._id_25B0 = undefined;
        self.allowpain = 1;

        if ( !isdefined( self._id_6EEA ) )
            self.ignoretriggers = 0;

        self._id_6EEA = undefined;
    }

    if ( isdefined( self._id_14B4 ) )
    {
        self._id_14B4 = undefined;
        self.allowpain = 1;
    }

    self _meth_8144( %head, 0.2 );
    self._id_35C5 = undefined;
}

_id_A1C4()
{
    if ( isexplosivedamagemod( self.damagemod ) )
        return 1;

    if ( gettime() - anim._id_5583 <= 50 )
    {
        var_0 = anim._id_5582 * anim._id_5582 * 1.2 * 1.2;

        if ( distancesquared( self.origin, anim._id_5580 ) < var_0 )
        {
            var_1 = var_0 * 0.5 * 0.5;
            self._id_5A5D = distancesquared( self.origin, anim._id_5581 ) < var_1;
            return 1;
        }
    }

    return 0;
}

_id_3F4B()
{
    verifyh1();

    if ( self.a._id_6E5A == "prone" )
        return;

    if ( isdefined( self.laststand ) && isdefined( self.laststand.team ) && self.laststand.team == self.team )
        return;

    if ( !isdefined( self._id_25AF ) || gettime() - self.a._id_55C7 > 1500 )
        self._id_25AF = randomintrange( 2, 3 );

    if ( isdefined( self.laststand ) && distancesquared( self.origin, self.laststand.origin ) < squared( 512 ) )
        self._id_25AF = 0;

    if ( self._id_25AF > 0 )
        self._id_25AF--;
    else
    {
        self._id_25B0 = 1;
        self.allowpain = 0;

        if ( self.ignoretriggers )
            self._id_6EEA = 1;
        else
            self.ignoretriggers = 1;

        if ( animscripts\utility::_id_9C3A() )
            animscripts\shared::_id_6869( self.primaryweapon, "right" );

        if ( self.a._id_6E5A == "crouch" )
            return animscripts\utility::_id_5863( "pain", "damage_shield_crouch" );

        var_0 = animscripts\utility::_id_5863( "pain", "damage_shield_pain_array" );
    }
}

getpainanim_preh1()
{
    verifypreh1();

    if ( self.a._id_6E5A == "stand" )
    {
        if ( self.a._id_5F5B == "run" && self _meth_8194() < 60 && self _meth_8194() > -60 )
            return getrunningforwardpainanim_preh1();

        self.a._id_5F5B = "stop";
        return getstandpainanim_preh1();
    }
    else if ( self.a._id_6E5A == "crouch" )
    {
        self.a._id_5F5B = "stop";
        return getcrouchpainanim_preh1();
    }
    else if ( self.a._id_6E5A == "prone" )
    {
        self.a._id_5F5B = "stop";
        return getpronepainanim_preh1();
    }
    else
    {
        self.a._id_5F5B = "stop";
        return %back_pain;
    }
}

_id_4079()
{
    if ( shouldplaypreh1painanim() )
        return getpainanim_preh1();

    verifyh1();

    if ( self.damageshield && !isdefined( self._id_2B03 ) )
    {
        var_0 = _id_3F4B();

        if ( isdefined( var_0 ) )
            return var_0;
    }

    if ( isdefined( self.a._id_6451 ) )
    {
        if ( self.a._id_6E5A == "crouch" )
            return animscripts\utility::_id_5863( "pain", "back" );
        else
            animscripts\notetracks::_id_8EFD();
    }

    if ( self.a._id_6E5A == "stand" )
    {
        var_1 = isdefined( self.node_relinquished ) && distancesquared( self.origin, self.node_relinquished.origin ) < 4096;

        if ( !var_1 && self.a._id_5F5B == "run" && abs( self _meth_8194() ) < 60 )
            return _id_40BF();

        self.a._id_5F5B = "stop";
        return _id_40E9();
    }
    else if ( self.a._id_6E5A == "crouch" )
    {
        self.a._id_5F5B = "stop";
        return _id_3F42();
    }
    else if ( self.a._id_6E5A == "prone" )
    {
        self.a._id_5F5B = "stop";
        return _id_409D();
    }
}

removeblockedanims( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = getmovedelta( var_0[var_2], 0, 1 );
        var_4 = self localtoworldcoords( var_3 );

        if ( self _meth_81c7( var_4 ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

getrunningforwardpainanim_preh1()
{
    verifypreh1();
    var_0 = animscripts\utility::_id_0CD8( %run_pain_fallonknee, %run_pain_fallonknee_02, %run_pain_fallonknee_03, %run_pain_stomach, %run_pain_stumble );
    var_0 = removeblockedanims( var_0 );

    if ( !var_0.size )
    {
        self.a._id_5F5B = "stop";
        return getstandpainanim_preh1();
    }

    return var_0[randomint( var_0.size )];
}

_id_40BF()
{
    verifyh1();
    var_0 = [];
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    if ( self _meth_81c7( self localtoworldcoords( ( 300, 0, 0 ) ) ) )
    {
        var_2 = 1;
        var_1 = 1;
    }
    else if ( self _meth_81c7( self localtoworldcoords( ( 200, 0, 0 ) ) ) )
        var_1 = 1;

    if ( isdefined( self.a._id_2B1A ) )
    {
        var_2 = 0;
        var_1 = 0;
    }

    if ( var_2 )
        var_0 = animscripts\utility::_id_5863( "pain", "run_long" );
    else if ( var_1 )
        var_0 = animscripts\utility::_id_5863( "pain", "run_medium" );
    else if ( self _meth_81c7( self localtoworldcoords( ( 120, 0, 0 ) ) ) )
        var_0 = animscripts\utility::_id_5863( "pain", "run_short" );

    if ( !var_0.size )
    {
        self.a._id_5F5B = "stop";
        return _id_40E9();
    }

    return var_0[randomint( var_0.size )];
}

_id_40EB()
{
    var_0 = [];

    if ( animscripts\utility::_id_25A6( "torso_upper" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_torso_upper" );
    else if ( animscripts\utility::_id_25A6( "torso_lower" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_torso_lower" );
    else if ( animscripts\utility::_id_25A6( "neck" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_neck" );
    else if ( animscripts\utility::_id_25A6( "head" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_head" );
    else if ( animscripts\utility::_id_25A6( "left_leg_upper", "right_leg_upper" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_leg" );
    else if ( animscripts\utility::_id_25A6( "left_arm_upper" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_left_arm_upper" );
    else if ( animscripts\utility::_id_25A6( "left_arm_lower" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_left_arm_lower" );
    else if ( animscripts\utility::_id_25A6( "right_arm_upper" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_right_arm_upper" );
    else if ( animscripts\utility::_id_25A6( "right_arm_lower" ) )
        var_0 = animscripts\utility::_id_5863( "pain", "pistol_right_arm_lower" );

    if ( var_0.size < 2 )
        var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "pistol_default1" ) );

    if ( var_0.size < 2 )
        var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "pistol_default2" ) );

    return var_0[randomint( var_0.size )];
}

weaponanims()
{
    var_0 = getweaponmodel( self.weapon_switch_invalid );

    if ( isdefined( self.holdingweapon ) && !self.holdingweapon || var_0 == "" )
        return "none";

    var_1 = weaponclass( self.weapon_switch_invalid );

    switch ( var_1 )
    {
        case "mg":
        case "smg":
            return "rifle";
        case "pistol":
        case "rocketlauncher":
        case "spread":
        case "rifle":
            return var_1;
        default:
            return "rifle";
    }
}

getstandpainanim_preh1()
{
    verifypreh1();
    var_0 = [];

    if ( weaponanims() == "pistol" )
    {
        if ( animscripts\utility::_id_25A6( "torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck" ) )
            var_0[var_0.size] = %pistol_stand_pain_chest;

        if ( animscripts\utility::_id_25A6( "torso_lower", "left_leg_upper", "right_leg_upper" ) )
            var_0[var_0.size] = %pistol_stand_pain_groin;

        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_0[var_0.size] = %pistol_stand_pain_head;

        if ( animscripts\utility::_id_25A6( "left_arm_lower", "left_arm_upper", "torso_upper" ) )
            var_0[var_0.size] = %pistol_stand_pain_leftshoulder;

        if ( animscripts\utility::_id_25A6( "right_arm_lower", "right_arm_upper", "torso_upper" ) )
            var_0[var_0.size] = %pistol_stand_pain_rightshoulder;

        if ( var_0.size < 2 )
            var_0[var_0.size] = %pistol_stand_pain_chest;

        if ( var_0.size < 2 )
            var_0[var_0.size] = %pistol_stand_pain_groin;
    }
    else
    {
        var_1 = self.damagetaken / self.maxturnspeed;

        if ( var_1 > 0.4 && !animscripts\utility::_id_25A6( "left_hand", "right_hand", "left_foot", "right_foot", "helmet" ) )
            var_0[var_0.size] = %exposed_pain_2_crouch;

        if ( animscripts\utility::_id_25A6( "torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck" ) )
            var_0[var_0.size] = %exposed_pain_back;

        if ( animscripts\utility::_id_25A6( "right_hand", "right_arm_upper", "right_arm_lower", "torso_upper" ) )
            var_0[var_0.size] = %exposed_pain_dropgun;

        if ( animscripts\utility::_id_25A6( "torso_lower", "left_leg_upper", "right_leg_upper" ) )
            var_0[var_0.size] = %exposed_pain_groin;

        if ( animscripts\utility::_id_25A6( "left_hand", "left_arm_lower", "left_arm_upper" ) )
            var_0[var_0.size] = %exposed_pain_left_arm;

        if ( animscripts\utility::_id_25A6( "right_hand", "right_arm_lower", "right_arm_upper" ) )
            var_0[var_0.size] = %exposed_pain_right_arm;

        if ( animscripts\utility::_id_25A6( "left_foot", "right_foot", "left_leg_lower", "right_leg_lower", "left_leg_upper", "right_leg_upper" ) )
            var_0[var_0.size] = %exposed_pain_leg;

        if ( var_0.size < 2 )
            var_0[var_0.size] = %exposed_pain_back;

        if ( var_0.size < 2 )
            var_0[var_0.size] = %exposed_pain_dropgun;
    }

    return var_0[randomint( var_0.size )];
}

_id_40E9()
{
    verifyh1();

    if ( animscripts\utility::_id_9C3A() )
        return _id_40EB();

    var_0 = [];
    var_1 = [];

    if ( animscripts\utility::_id_25A6( "torso_upper" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "torso_upper" );
        var_1 = animscripts\utility::_id_5863( "pain", "torso_upper_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "torso_lower" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "torso_lower" );
        var_1 = animscripts\utility::_id_5863( "pain", "torso_lower_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "head", "helmet", "neck" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "head" );
        var_1 = animscripts\utility::_id_5863( "pain", "head_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "right_arm_upper", "right_arm_lower" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "right_arm" );
        var_1 = animscripts\utility::_id_5863( "pain", "right_arm_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "left_arm_upper", "left_arm_lower" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "left_arm" );
        var_1 = animscripts\utility::_id_5863( "pain", "left_arm_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "left_leg_upper", "right_leg_upper" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "leg" );
        var_1 = animscripts\utility::_id_5863( "pain", "leg_extended" );
    }
    else if ( animscripts\utility::_id_25A6( "left_foot", "right_foot", "left_leg_lower", "right_leg_lower" ) )
    {
        var_0 = animscripts\utility::_id_5863( "pain", "foot" );
        var_1 = animscripts\utility::_id_5863( "pain", "foot_extended" );
    }

    if ( var_0.size < 2 )
    {
        if ( !self.a._id_2B18 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "default_long" ) );
        else
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "default_short" ) );
    }

    if ( var_1.size < 2 )
        var_1 = common_scripts\utility::_id_0CDD( var_1, animscripts\utility::_id_5863( "pain", "default_extended" ) );

    if ( !self.damageshield && !self.a._id_2B18 )
    {
        var_2 = randomint( var_0.size + var_1.size );

        if ( var_2 < var_0.size )
            return var_0[var_2];
        else
            return var_1[var_2 - var_0.size];
    }

    return var_0[randomint( var_0.size )];
}

getcrouchpainanim_preh1()
{
    verifypreh1();
    var_0 = [];

    if ( animscripts\utility::_id_25A6( "torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck" ) )
        var_0[var_0.size] = %exposed_crouch_pain_chest;

    if ( animscripts\utility::_id_25A6( "head", "neck", "torso_upper" ) )
        var_0[var_0.size] = %exposed_crouch_pain_headsnap;

    if ( animscripts\utility::_id_25A6( "left_hand", "left_arm_lower", "left_arm_upper" ) )
        var_0[var_0.size] = %exposed_crouch_pain_left_arm;

    if ( animscripts\utility::_id_25A6( "right_hand", "right_arm_lower", "right_arm_upper" ) )
        var_0[var_0.size] = %exposed_crouch_pain_right_arm;

    if ( var_0.size < 2 )
        var_0[var_0.size] = %exposed_crouch_pain_flinch;

    if ( var_0.size < 2 )
        var_0[var_0.size] = %exposed_crouch_pain_chest;

    return var_0[randomint( var_0.size )];
}

_id_3F42()
{
    verifyh1();
    var_0 = [];

    if ( !self.damageshield && !self.a._id_2B18 )
        var_0 = animscripts\utility::_id_5863( "pain", "crouch_longdeath" );

    var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "crouch_default" ) );

    if ( animscripts\utility::_id_25A6( "left_hand", "left_arm_lower", "left_arm_upper" ) )
        var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "crouch_left_arm" ) );

    if ( animscripts\utility::_id_25A6( "right_hand", "right_arm_lower", "right_arm_upper" ) )
        var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "pain", "crouch_right_arm" ) );

    return var_0[randomint( var_0.size )];
}

getpronepainanim_preh1()
{
    verifypreh1();

    if ( randomint( 2 ) == 0 )
        return %prone_reaction_a;
    else
        return %prone_reaction_b;
}

_id_409D()
{
    verifyh1();
    var_0 = animscripts\utility::_id_5863( "pain", "prone" );
    return var_0[randomint( var_0.size )];
}

playpainanim_preh1( var_0 )
{
    verifypreh1();

    if ( isdefined( self._id_58D7 ) )
        var_1 = 1.5;
    else
        var_1 = self._id_0C78;

    self setflaggedanimknoballrestart( "painanim", var_0, %body, 1, 0.1, var_1 );

    if ( self.a._id_6E5A == "prone" )
        self _meth_81fe( %prone_legs_up, %prone_legs_down, 1, 0.1, 1 );

    if ( animhasnotetrack( var_0, "start_aim" ) )
    {
        thread _id_6235( "painanim" );
        self endon( "start_aim" );
    }

    animscripts\shared::_id_2D06( "painanim" );
}

_id_6DCE( var_0 )
{
    if ( shouldplaypreh1painanim() )
    {
        playpainanim_preh1( var_0 );
        return;
    }

    verifyh1();
    var_1 = 1;
    _id_664D( "painanim", var_0, %body, 1, 0.1, var_1 );

    if ( self.a._id_6E5A == "prone" )
        self _meth_81fe( %prone_legs_up, %prone_legs_down, 1, 0.1, 1 );

    if ( animhasnotetrack( var_0, "start_aim" ) )
    {
        thread _id_6235( "painanim" );
        self endon( "start_aim" );
    }

    if ( animhasnotetrack( var_0, "code_move" ) )
        animscripts\shared::_id_2D06( "painanim" );

    animscripts\shared::_id_2D06( "painanim" );
}

_id_6235( var_0 )
{
    self endon( "killanimscript" );
    self waittillmatch( var_0, "start_aim" );
    self notify( "start_aim" );
}

_id_8A34()
{
    self endon( "killanimscript" );
    self._id_14B4 = 1;
    self.allowpain = 0;
    wait 0.5;
    self._id_14B4 = undefined;
    self.allowpain = 1;
}

_id_8A33( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    self.a._id_8A1A = "none";
    thread _id_8A34();

    switch ( var_0 )
    {
        case "cover_left":
            if ( self.a._id_6E5A == "stand" )
            {
                var_1 = animscripts\utility::_id_5863( "pain", "cover_left_stand" );
                _id_2D6F( var_1 );
                var_2 = 1;
            }
            else if ( self.a._id_6E5A == "crouch" )
            {
                var_1 = animscripts\utility::_id_5863( "pain", "cover_left_crouch" )[animscripts\corner::shouldplayalerttransition( self )];
                _id_2D6F( var_1 );
                var_2 = 1;
            }
            else
                var_2 = 0;

            break;
        case "cover_right":
            if ( self.a._id_6E5A == "stand" )
            {
                var_1 = animscripts\utility::_id_5863( "pain", "cover_right_stand" );
                _id_2D6F( var_1 );
                var_2 = 1;
            }
            else if ( self.a._id_6E5A == "crouch" )
            {
                var_1 = animscripts\utility::_id_5863( "pain", "cover_right_crouch" )[animscripts\corner::shouldplayalerttransition( self )];
                _id_2D6F( var_1 );
                var_2 = 1;
            }
            else
                var_2 = 0;

            break;
        case "cover_right_stand_A":
            if ( self._id_1C86 || isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
                var_2 = 0;
            else
            {
                _id_2D6E( animscripts\utility::_id_5863( "pain", "cover_right_stand_A" ) );
                var_2 = 1;
            }

            break;
        case "cover_right_stand_B":
            if ( self._id_1C86 )
                var_2 = 0;
            else
            {
                _id_2D6E( animscripts\utility::_id_5863( "pain", "cover_right_stand_B" ) );
                var_2 = 1;
            }

            break;
        case "cover_left_stand_A":
            if ( self._id_1C86 )
                var_2 = 0;
            else
            {
                _id_2D6E( animscripts\utility::_id_5863( "pain", "cover_left_stand_A" ) );
                var_2 = 1;
            }

            break;
        case "cover_left_stand_B":
            if ( self._id_1C86 )
                var_2 = 0;
            else
            {
                _id_2D6E( animscripts\utility::_id_5863( "pain", "cover_left_stand_B" ) );
                var_2 = 1;
            }

            break;
        case "cover_crouch":
            var_1 = animscripts\utility::_id_5863( "pain", "cover_crouch" );
            _id_2D6F( var_1 );
            var_2 = 1;
            break;
        case "cover_stand":
            var_1 = animscripts\utility::_id_5863( "pain", "cover_stand" );
            _id_2D6F( var_1 );
            var_2 = 1;
            break;
        case "cover_stand_aim":
            var_1 = animscripts\utility::_id_5863( "pain", "cover_stand_aim" );
            _id_2D6F( var_1 );
            var_2 = 1;
            break;
        case "smg_cover_stand_aim":
            var_1 = animscripts\utility::_id_5863( "pain", var_0 );
            _id_2D6F( var_1 );
            var_2 = 1;
            break;
        case "cover_crouch_aim":
            if ( self.a._id_6E5A != "stand" )
            {
                self _meth_8144( %exposed_aiming, 0 );
                var_1 = animscripts\utility::_id_5863( "pain", "cover_crouch_aim" );
            }
            else
                var_1 = [ %exposed_pain_back, %exposed_pain_groin, %exposed_pain_left_arm, %exposed_pain_leg, %exposed_pain_right_arm ];

            _id_2D6F( var_1 );
            var_2 = 1;
            break;
        case "saw":
            if ( self.a._id_6E5A == "stand" )
                var_3 = animscripts\utility::_id_5863( "pain", "saw_stand" );
            else if ( self.a._id_6E5A == "crouch" )
                var_3 = animscripts\utility::_id_5863( "pain", "saw_crouch" );
            else
                var_3 = animscripts\utility::_id_5863( "pain", "saw_prone" );

            _id_664C( "painanim", var_3, 1, 0.3, 1 );
            animscripts\shared::_id_2D06( "painanim" );
            var_2 = 1;
            break;
        case "mg42":
            _id_5BCF( self.a._id_6E5A );
            var_2 = 1;
            break;
        case "minigun":
            var_2 = 0;
            break;
        case "corner_right_martyrdom":
            var_2 = _id_9897();
            break;
        case "dying_crawl":
        case "rambo_left":
        case "rambo_right":
        case "rambo":
            var_2 = 0;
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_6657()
{
    self endon( "death" );
    wait 0.05;
    self notify( "pain_death" );
}

_id_2D6F( var_0 )
{
    var_1 = var_0[randomint( var_0.size )];
    _id_664C( "painanim", var_1, 1, 0.3, 1 );
    animscripts\shared::_id_2D06( "painanim" );
}

_id_2D6E( var_0 )
{
    _id_664C( "painanim", var_0, 1, 0.3, 1 );
    animscripts\shared::_id_2D06( "painanim" );
}

_id_5BCF( var_0 )
{
    _id_664C( "painanim", level._id_5BBF["pain_" + var_0], 1, 0.1, 1 );
    animscripts\shared::_id_2D06( "painanim" );
}

_id_A059( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( "death" );

    if ( isdefined( var_1 ) )
        self endon( var_1 );

    wait(var_0);
    self.a._id_5F5B = "stop";
}

_id_238E()
{
    if ( self.a._id_2B18 || self.diequietly || self.damageshield )
        return 0;

    if ( self.start_move != "none" )
        return 0;

    if ( isdefined( self.a._id_6451 ) )
        return 0;

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
        return 0;

    var_0 = animscripts\utility::_id_25A6( "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower", "left_foot", "right_foot" );

    if ( isdefined( self._id_39C2 ) )
    {
        _id_7F42( var_0 );
        self.helmet = 10;
        thread _id_2391();
        self waittill( "killanimscript" );
        return 1;
    }

    if ( self.helmet > 100 )
        return 0;

    if ( var_0 && self.helmet < self.maxturnspeed * 0.4 )
    {
        if ( gettime() < anim._id_60C8 )
            return 0;
    }
    else
    {
        if ( anim._id_629A > 0 )
            return 0;

        if ( gettime() < anim._id_60C7 )
            return 0;
    }

    if ( isdefined( self._id_2660 ) )
        return 0;

    foreach ( var_2 in level.players )
    {
        if ( distancesquared( self.origin, var_2.origin ) < 30625 )
            return 0;
    }

    if ( animscripts\utility::_id_25A6( "head", "helmet", "gun", "right_hand", "left_hand" ) )
        return 0;

    if ( animscripts\utility::_id_9C3A() )
        return 0;

    _id_7F42( var_0 );

    if ( !isdefined( self.a._id_8F70 ) && !_id_50EC( self.a._id_2390 ) )
        return 0;

    anim._id_60C7 = gettime() + 3000;
    anim._id_60C8 = gettime() + 3000;
    thread _id_2391();
    self waittill( "killanimscript" );
    return 1;
}

_id_7F42( var_0 )
{
    var_1 = [];
    var_2 = undefined;

    if ( self.a._id_6E5A == "stand" )
    {
        var_2 = _id_8484( var_0 );

        if ( isdefined( var_2 ) )
            var_1 = [ var_2[0] ];
        else
            var_1 = animscripts\utility::_id_5863( "crawl_death", "stand_transition" );
    }
    else if ( self.a._id_6E5A == "crouch" )
        var_1 = animscripts\utility::_id_5863( "crawl_death", "crouch_transition" );
    else
        var_1 = animscripts\utility::_id_5863( "crawl_death", "prone_transition" );

    self.a._id_2390 = var_1[randomint( var_1.size )];
    self.a._id_8F70 = var_2;
}

_id_50EC( var_0 )
{
    if ( isdefined( self.a._id_399D ) )
        return 1;

    var_1 = getmovedelta( var_0, 0, 1 );
    var_2 = self localtoworldcoords( var_1 );
    return self _meth_81c7( var_2 );
}

_id_2391()
{
    self endon( "kill_long_death" );
    self endon( "death" );
    thread _id_6F52( "crawling" );
    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;
    self _meth_8202();
    thread _id_6657();
    level notify( "ai_crawling", self );
    thread crawling_stab_achievement();
    self _meth_8149( %dying, %body, 1, 0.1, 1 );

    if ( isdefined( self.a._id_8F70 ) )
    {
        _id_8F6F();
        self.a._id_8F70 = undefined;
        return;
    }

    if ( !_id_2FD3() )
        return;

    _id_664C( "transition", self.a._id_2390, 1, 0.5, 1 );
    animscripts\notetracks::_id_2D10( "transition", ::_id_464C );
    self.a._id_8A1A = "dying_crawl";
    thread _id_2FD5();

    if ( isdefined( self.enemy ) )
    {
        if ( !( isdefined( level.crewchief ) && self.enemy == level.crewchief ) )
            self _meth_8202( self.enemy );
    }

    _id_2740();

    while ( _id_849D() )
    {
        var_0 = animscripts\utility::_id_5863( "crawl_death", "back_crawl" );

        if ( !_id_50EC( var_0 ) )
            break;

        _id_664E( "back_crawl", var_0, 1, 0.1, 1.0 );
        animscripts\notetracks::_id_2D10( "back_crawl", ::_id_464C );
    }

    self._id_28B7 = gettime() + randomintrange( 4000, 20000 );

    while ( _id_84B3() )
    {
        if ( animscripts\utility::_id_1AE1() && _id_0977() )
        {
            var_1 = animscripts\utility::_id_5863( "crawl_death", "back_fire" );
            _id_664E( "back_idle_or_fire", var_1, 1, 0.2, 1.0 );
            animscripts\shared::_id_2D06( "back_idle_or_fire" );
            continue;
        }

        var_1 = animscripts\utility::_id_5863( "crawl_death", "back_idle" );

        if ( randomfloat( 1 ) < 0.4 )
        {
            var_2 = animscripts\utility::_id_5863( "crawl_death", "back_idle_twitch" );
            var_1 = var_2[randomint( var_2.size )];
        }

        _id_664E( "back_idle_or_fire", var_1, 1, 0.1, 1.0 );
        var_3 = getanimlength( var_1 );

        while ( var_3 > 0 )
        {
            if ( animscripts\utility::_id_1AE1() && _id_0977() )
                break;

            var_4 = 0.5;

            if ( var_4 > var_3 )
            {
                var_4 = var_3;
                var_3 = 0;
            }
            else
                var_3 -= var_4;

            animscripts\notetracks::_id_2D0B( var_4, "back_idle_or_fire" );
        }
    }

    self notify( "end_dying_crawl_back_aim" );
    self _meth_8144( %dying_back_aim_4_wrapper, 0.3 );
    self _meth_8144( %dying_back_aim_6_wrapper, 0.3 );
    var_5 = animscripts\utility::_id_5863( "crawl_death", "back_death" );
    self._id_2652 = var_5[randomint( var_5.size )];
    _id_53B7();
    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;
}

_id_8484( var_0 )
{
    if ( self.a._id_6E5A != "stand" )
        return;

    var_1 = 2;

    if ( randomint( 10 ) > var_1 )
        return;

    var_2 = 0;

    if ( !var_0 )
    {
        var_2 = animscripts\utility::_id_25A6( "torso_upper", "torso_lower" );

        if ( !var_2 )
            return;
    }

    var_3 = 0;
    var_4 = "leg";
    var_5 = "b";

    if ( var_0 )
        var_3 = 200;
    else
    {
        var_4 = "gut";
        var_3 = 128;

        if ( 45 < self.damageyaw && self.damageyaw < 135 )
            var_5 = "l";
        else if ( -135 < self.damageyaw && self.damageyaw < -45 )
            var_5 = "r";
        else if ( -45 < self.damageyaw && self.damageyaw < 45 )
            return;
    }

    switch ( var_5 )
    {
        case "b":
            var_6 = anglestoforward( self.angles );
            var_7 = self.origin - var_6 * var_3;
            break;
        case "l":
            var_8 = anglestoright( self.angles );
            var_7 = self.origin - var_8 * var_3;
            break;
        case "r":
            var_8 = anglestoright( self.angles );
            var_7 = self.origin + var_8 * var_3;
            break;
        default:
            return;
    }

    if ( !self _meth_81c7( var_7 ) )
        return;

    var_9 = animscripts\utility::_id_5863( "crawl_death", "longdeath" );
    var_10 = var_4 + "_" + var_5;
    var_11 = randomint( var_9[var_10].size );
    var_12 = var_9[var_10][var_11];
    return var_12;
}

_id_8F6F()
{
    _id_664E( "stumblingPainInto", self.a._id_8F70[0] );
    animscripts\shared::_id_2D06( "stumblingPainInto" );
    self.a._id_8A1A = "stumbling_pain";
    var_0 = getmovedelta( self.a._id_8F70[2] );
    var_1 = getanimlength( self.a._id_8F70[2] ) * 1000;

    for ( var_2 = randomint( 2 ) + 1; var_2 > 0; var_2-- )
    {
        var_3 = anglestoforward( self.angles );
        var_4 = self.origin + var_3 * var_0;

        if ( !self _meth_81c7( var_4 ) )
            break;

        _id_664E( "stumblingPain", self.a._id_8F70[1] );
        animscripts\shared::_id_2D06( "stumblingPain" );
    }

    self.a._id_612E = 1;
    self.a._id_8A1A = "none";
    _id_664E( "stumblingPainCollapse", self.a._id_8F70[2], 1, 0.75 );
    animscripts\notetracks::_id_2D10( "stumblingPainCollapse", ::_id_8F71 );
    animscripts\shared::_id_2D06( "stumblingPainCollapse" );
    _id_53B7();
}

_id_8F71( var_0 )
{
    if ( var_0 == "start_ragdoll" )
    {
        animscripts\notetracks::_id_466C( var_0, "stumblingPainCollapse" );
        return 1;
    }
}

crawling_stab_achievement()
{
    if ( self.team == "allies" )
        return;

    self endon( "end_dying_crawl_back_aim" );
    self waittill( "death", var_0, var_1 );

    if ( !isdefined( self ) || !isdefined( var_0 ) || !isplayer( var_0 ) )
        return;

    if ( var_1 == "MOD_MELEE" )
        _id_A5A4::_id_41DD( "NO_REST_FOR_THE_WEARY" );
}

_id_84B3()
{
    if ( !_id_32B1( anglestoforward( self.angles ) ) )
        return 0;

    return gettime() < self._id_28B7;
}

_id_2FD3()
{
    if ( !isdefined( self._id_39C2 ) )
    {
        if ( self.a._id_6E5A == "prone" )
            return 1;

        if ( self.a._id_5F5B == "stop" )
        {
            if ( randomfloat( 1 ) < 0.4 )
            {
                if ( randomfloat( 1 ) < 0.5 )
                    return 1;
            }
            else if ( abs( self.damageyaw ) > 90 )
                return 1;
        }
        else if ( abs( self _meth_8194() ) > 90 )
            return 1;
    }

    if ( self.a._id_6E5A != "prone" )
    {
        var_0 = animscripts\utility::_id_5863( "crawl_death", self.a._id_6E5A + "_2_crawl" );
        var_1 = var_0[randomint( var_0.size )];

        if ( !_id_50EC( var_1 ) )
            return 1;

        thread _id_2FD6();
        _id_664C( "falling", var_1, 1, 0.5, 1 );
        animscripts\shared::_id_2D06( "falling" );
    }
    else
        thread _id_2FD6();

    self.a._id_2390 = animscripts\utility::_id_5863( "crawl_death", "default_transition" );
    self.a._id_8A1A = "dying_crawl";
    _id_2740();
    var_2 = animscripts\utility::_id_5863( "crawl_death", "crawl" );

    while ( _id_849D() )
    {
        if ( !_id_50EC( var_2 ) )
            return 1;

        if ( isdefined( self._id_253A ) )
            self playsound( self._id_253A );

        _id_664E( "crawling", var_2, 1, 0.1, 1.0 );
        animscripts\shared::_id_2D06( "crawling" );
    }

    self notify( "done_crawling" );

    if ( !isdefined( self._id_39C2 ) && _id_32B1( anglestoforward( self.angles ) * -1 ) )
        return 1;

    var_3 = animscripts\utility::_id_5863( "crawl_death", "death" );
    var_4 = var_3[randomint( var_3.size )];

    if ( var_4 != %dying_crawl_death_v2 )
        self.a._id_612E = 1;

    animscripts\death::_id_6A3D( var_4, 0 );
    _id_53B7();
    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;
    return 0;
}

_id_2FD6()
{
    self endon( "death" );

    if ( self.a._id_6E5A != "prone" )
    {
        for (;;)
        {
            self waittill( "falling", var_0 );

            if ( issubstr( var_0, "bodyfall" ) )
                break;
        }
    }

    var_1 = "J_SpineLower";
    var_2 = "tag_origin";
    var_3 = 0.25;
    var_4 = level._effect["crawling_death_blood_smear"];

    if ( isdefined( self.a._id_238A ) )
        var_3 = self.a._id_238A;

    if ( isdefined( self.a._id_2389 ) )
        var_4 = level._effect[self.a._id_2389];

    while ( var_3 )
    {
        var_5 = self gettagorigin( var_1 );
        var_6 = self gettagangles( var_2 );
        var_7 = anglestoright( var_6 );
        var_8 = anglestoforward( ( 270, 0, 0 ) );
        playfx( var_4, var_5, var_8, var_7 );
        wait(var_3);
    }
}

_id_2FD5()
{
    self endon( "kill_long_death" );
    self endon( "death" );
    self endon( "end_dying_crawl_back_aim" );

    if ( isdefined( self._id_2FD4 ) )
        return;

    self._id_2FD4 = 1;
    self _meth_814e( animscripts\utility::_id_5863( "crawl_death", "aim_4" ), 1, 0 );
    self _meth_814e( animscripts\utility::_id_5863( "crawl_death", "aim_6" ), 1, 0 );
    var_0 = 0;

    for (;;)
    {
        var_1 = animscripts\utility::_id_4175();
        var_2 = angleclamp180( var_1 - var_0 );

        if ( abs( var_2 ) > 3 )
            var_2 = common_scripts\utility::_id_856D( var_2 ) * 3;

        var_1 = angleclamp180( var_0 + var_2 );

        if ( var_1 < 0 )
        {
            if ( var_1 < -45.0 )
                var_1 = -45.0;

            var_3 = var_1 / -45.0;
            self _meth_814d( %dying_back_aim_4_wrapper, var_3, 0.05 );
            self _meth_814d( %dying_back_aim_6_wrapper, 0, 0.05 );
        }
        else
        {
            if ( var_1 > 45.0 )
                var_1 = 45.0;

            var_3 = var_1 / 45.0;
            self _meth_814d( %dying_back_aim_6_wrapper, var_3, 0.05 );
            self _meth_814d( %dying_back_aim_4_wrapper, 0, 0.05 );
        }

        var_0 = var_1;
        wait 0.05;
    }
}

_id_8D0E()
{
    self endon( "kill_long_death" );
    self endon( "death" );
    wait 0.5;
    thread _id_2FD5();
}

_id_464C( var_0 )
{
    if ( var_0 == "fire_spray" )
    {
        if ( !animscripts\utility::_id_1AE1() )
            return 1;

        if ( !_id_0977() )
            return 1;

        animscripts\utility::_id_83F2();
        return 1;
    }
    else if ( var_0 == "pistol_pickup" )
    {
        thread _id_8D0E();
        return 0;
    }

    return 0;
}

_id_0977()
{
    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_0 = animscripts\combat_utility::_id_3DB2( self.enemy );
    else
        var_0 = self.enemy getshootatpos();

    var_1 = self _meth_81bd();
    var_2 = vectortoangles( var_0 - self _meth_81bc() );
    var_3 = animscripts\utility::_id_06C4( var_1[1] - var_2[1] );

    if ( var_3 > anim._id_6663 )
    {
        if ( distancesquared( self geteye(), var_0 ) > anim._id_6661 || var_3 > anim._id_6662 )
            return 0;
    }

    return animscripts\utility::_id_06C4( var_1[0] - var_2[0] ) <= anim._id_665B;
}

_id_32B1( var_0 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_1 = animscripts\combat_utility::_id_3DB2( self.enemy );
    else
        var_1 = self.enemy getshootatpos();

    var_2 = vectornormalize( var_1 - self geteye() );
    return vectordot( var_2, var_0 ) > 0.5;
}

_id_6F52( var_0 )
{
    self endon( "kill_long_death" );
    self endon( "death" );
    self._id_38A8 = 1;
    self._id_584E = 1;
    self.a._id_2CE7 = 1;
    self notify( "long_death" );
    self.helmet = 10000;
    wait 0.75;

    if ( self.helmet > 1 )
        self.helmet = 1;

    wait 0.05;
    self._id_584E = undefined;
    self.a._id_5A5F = 1;

    if ( var_0 == "crawling" )
    {
        wait 1.0;

        if ( isdefined( level.playercardbackground ) && distancesquared( self.origin, level.playercardbackground.origin ) < 1048576 )
        {
            anim._id_629A = randomintrange( 10, 30 );
            anim._id_60C7 = gettime() + randomintrange( 15000, 60000 );
        }
        else
        {
            anim._id_629A = randomintrange( 5, 12 );
            anim._id_60C7 = gettime() + randomintrange( 5000, 25000 );
        }

        anim._id_60C8 = gettime() + randomintrange( 7000, 13000 );
    }
    else if ( var_0 == "corner_grenade" )
    {
        wait 1.0;

        if ( isdefined( level.playercardbackground ) && distancesquared( self.origin, level.playercardbackground.origin ) < 490000 )
        {
            anim._id_6299 = randomintrange( 10, 30 );
            anim._id_60C6 = gettime() + randomintrange( 15000, 60000 );
        }
        else
        {
            anim._id_6299 = randomintrange( 5, 12 );
            anim._id_60C6 = gettime() + randomintrange( 5000, 25000 );
        }
    }
}

_id_2740()
{
    if ( isdefined( self.a._id_399D ) )
        self.a._id_6297 = self.a._id_399D;
    else
        self.a._id_6297 = randomintrange( 1, 5 );
}

_id_849D()
{
    if ( !self.a._id_6297 )
    {
        self.a._id_6297 = undefined;
        return 0;
    }

    self.a._id_6297--;
    return 1;
}

_id_9897()
{
    if ( anim._id_6299 > 0 )
        return 0;

    if ( gettime() < anim._id_60C6 )
        return 0;

    if ( self.a._id_2B18 || self.diequietly || self.damageshield )
        return 0;

    if ( isdefined( self._id_2660 ) )
        return 0;

    if ( distance( self.origin, level.playercardbackground.origin ) < 175 )
        return 0;

    anim._id_60C6 = gettime() + 3000;
    thread _id_2229();
    self waittill( "killanimscript" );
    return 1;
}

_id_2229()
{
    self endon( "kill_long_death" );
    self endon( "death" );
    thread _id_6657();
    thread _id_6F52( "corner_grenade" );
    thread _id_A5A4::_id_7DDF( 0 );
    self.threatsightdelayfalloff = -1000;
    _id_664D( "corner_grenade_pain", animscripts\utility::_id_5863( "corner_grenade_death", "pain" ), %body, 1, 0.1 );
    self waittillmatch( "corner_grenade_pain", "dropgun" );
    animscripts\shared::_id_2F6C();
    self waittillmatch( "corner_grenade_pain", "anim_pose = \"back\"" );
    animscripts\notetracks::_id_61DD();
    self waittillmatch( "corner_grenade_pain", "grenade_left" );
    var_0 = getweaponmodel( "fraggrenade" );
    self attach( var_0, "tag_inhand" );
    self._id_2660 = ::_id_6F0B;
    self waittillmatch( "corner_grenade_pain", "end" );
    var_1 = gettime() + randomintrange( 25000, 60000 );
    _id_664D( "corner_grenade_idle", animscripts\utility::_id_5863( "corner_grenade_death", "pain" ), %body, 1, 0.2 );
    thread _id_A215();

    while ( !_id_32AF() )
    {
        if ( gettime() >= var_1 )
            break;

        animscripts\notetracks::_id_2D0B( 0.1, "corner_grenade_idle" );
    }

    var_2 = animscripts\utility::_id_5863( "corner_grenade_death", "release" );
    _id_664D( "corner_grenade_release", var_2, %body, 1, 0.2 );
    var_3 = getnotetracktimes( var_2, "grenade_drop" );
    var_4 = var_3[0] * getanimlength( var_2 );
    wait(var_4 - 1.0);
    animscripts\death::_id_6A3F();
    wait 0.7;
    self._id_2660 = ::_id_A0DC;
    var_5 = ( 0, 0, 30 ) - anglestoright( self.angles ) * 70;
    _id_2224( var_5, randomfloatrange( 2.0, 3.0 ) );
    wait 0.05;
    self detach( var_0, "tag_inhand" );
    thread _id_5379();
}

_id_2224( var_0, var_1 )
{
    var_2 = self gettagorigin( "tag_inhand" );
    var_3 = var_2 + ( 0, 0, 20 );
    var_4 = var_2 - ( 0, 0, 20 );
    var_5 = bullettrace( var_3, var_4, 0, undefined );

    if ( var_5["fraction"] < 0.5 )
        var_2 = var_5["position"];

    var_6 = "default";

    if ( var_5["surfacetype"] != "none" )
        var_6 = var_5["surfacetype"];

    thread _id_6DDB( "grenade_bounce_" + var_6, var_2 );
    self.groundentchanged = "fraggrenade";
    self magicgrenademanual( var_2, var_0, var_1 );
}

_id_6DDB( var_0, var_1 )
{
    var_2 = spawn( "script_origin", var_1 );
    var_2 playsound( var_0, "sounddone" );
    var_2 waittill( "sounddone" );
    var_2 delete();
}

_id_5379()
{
    self.a._id_612E = 1;
    _id_53B7();
    self _meth_8144( %head, 0.2 );
    self startragdoll();
    wait 0.1;
    self notify( "grenade_drop_done" );
}

_id_53B7()
{
    if ( isdefined( self._id_551A ) )
        self kill( self.origin, self._id_551A );
    else
        self kill();
}

_id_32AF()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( distancesquared( self.origin, self.enemy.origin ) > 147456 )
        return 0;

    if ( distancesquared( self.origin, self.enemy.origin ) < 16384 )
        return 1;

    var_0 = self.enemy.origin + self._id_32CC * 3.0;
    var_1 = self.enemy.origin;

    if ( self.enemy.origin != var_0 )
        var_1 = pointonsegmentnearesttopoint( self.enemy.origin, var_0, self.origin );

    if ( distancesquared( self.origin, var_1 ) < 16384 )
        return 1;

    return 0;
}

_id_6F0B()
{
    var_0 = animscripts\utility::_id_5863( "corner_grenade_death", "premature_death" );
    var_1 = var_0[randomint( var_0.size )];
    animscripts\death::_id_6A3F();
    _id_664D( "corner_grenade_die", var_1, %body, 1, 0.2 );
    var_2 = animscripts\combat_utility::_id_3FAD();
    _id_2224( var_2, 3.0 );
    var_3 = getweaponmodel( "fraggrenade" );
    self detach( var_3, "tag_inhand" );
    wait 0.05;
    self _meth_8144( %head, 0.2 );
    self startragdoll();
    self waittillmatch( "corner_grenade_die", "end" );
}

_id_A0DC()
{
    self waittill( "grenade_drop_done" );
}

_id_A215()
{
    self endon( "kill_long_death" );
    self endon( "death" );
    self._id_32CC = ( 0, 0, 0 );
    var_0 = undefined;
    var_1 = self.origin;
    var_2 = 0.15;

    for (;;)
    {
        if ( isdefined( self.enemy ) && isdefined( var_0 ) && self.enemy == var_0 )
        {
            var_3 = self.enemy.origin;
            self._id_32CC = ( var_3 - var_1 ) * 1 / var_2;
            var_1 = var_3;
        }
        else
        {
            if ( isdefined( self.enemy ) )
                var_1 = self.enemy.origin;
            else
                var_1 = self.origin;

            var_0 = self.enemy;
            self._id_83F7 = ( 0, 0, 0 );
        }

        wait(var_2);
    }
}

_id_07F0( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_2CE5 ) )
        return;

    if ( !isdefined( self._id_5A7A ) || isdefined( self._id_5A7A ) && !self._id_5A7A )
    {
        if ( var_0 < self.missile_passed_target )
            return;
    }
    else if ( var_0 < self.missile_passed_target / 3 )
        return;

    self._id_2CE5 = 1;
    var_7 = undefined;

    if ( animscripts\utility::_id_25A6( "left_arm_lower", "left_arm_upper", "left_hand" ) )
        var_7 = animscripts\utility::_id_5863( "additive_pain", "left_arm" );

    if ( animscripts\utility::_id_25A6( "right_arm_lower", "right_arm_upper", "right_hand" ) )
        var_7 = animscripts\utility::_id_5863( "additive_pain", "right_arm" );
    else if ( animscripts\utility::_id_25A6( "left_leg_upper", "left_leg_lower", "left_foot" ) )
        var_7 = animscripts\utility::_id_5863( "additive_pain", "left_leg" );
    else if ( animscripts\utility::_id_25A6( "right_leg_upper", "right_leg_lower", "right_foot" ) )
        var_7 = animscripts\utility::_id_5863( "additive_pain", "right_leg" );
    else
    {
        var_8 = animscripts\utility::_id_5863( "additive_pain", "default" );
        var_7 = var_8[randomint( var_8.size )];
    }

    self _meth_814e( %add_pain, 1, 0.1, 1 );
    self _meth_814e( var_7, 1, 0, 1 );
    wait 0.4;
    self _meth_8144( var_7, 0.2 );
    self _meth_8144( %add_pain, 0.2 );
    self._id_2CE5 = undefined;
}

_id_664C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0.2;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    self _meth_8154( var_0, var_1, var_2, var_3, var_4 );
    self._id_35C5 = animscripts\face::_id_6D9B( var_1, "pain", self._id_35C5 );
}

_id_664E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0.2;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    self setflaggedanimknobrestart( var_0, var_1, var_2, var_3, var_4 );
    self._id_35C5 = animscripts\face::_id_6D9B( var_1, "pain", self._id_35C5 );
}

_id_664D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0.2;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    self setflaggedanimknoballrestart( var_0, var_1, var_2, var_3, var_4, var_5 );
    self._id_35C5 = animscripts\face::_id_6D9B( var_1, "pain", self._id_35C5 );
}
