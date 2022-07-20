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

_id_4C86()
{
    var_0 = [];
    var_0["directed_energy_stand_front_head"] = [ %stand_death_head_front_a_dea ];
    var_0["directed_energy_stand_front_legs"] = [ %stand_death_legs_front_a_dea ];
    var_0["directed_energy_stand_front_default"] = [ %stand_death_torso_front_a_dea ];
    var_0["directed_energy_stand_back_default"] = [ %stand_death_torso_back_a_dea ];
    var_0["strong_legs"] = [ %death_shotgun_legs, %death_stand_sniper_leg ];
    var_0["strong_torso_lower"] = [ %death_shotgun_legs, %death_stand_sniper_leg, %death_shotgun_back_v1, %exposed_death_blowback, %death_stand_sniper_chest1, %death_stand_sniper_chest2, %death_stand_sniper_spin1 ];
    var_0["strong_default"] = [ %death_shotgun_legs, %death_stand_sniper_leg, %death_shotgun_back_v1, %exposed_death_blowback, %death_stand_sniper_chest1, %death_stand_sniper_chest2, %death_stand_sniper_spin1 ];
    var_0["strong_right"] = [ %death_shotgun_spinl, %death_stand_sniper_spin1, %death_stand_sniper_chest1, %death_stand_sniper_chest2 ];
    var_0["strong_left"] = [ %death_shotgun_spinr, %death_stand_sniper_spin2, %death_stand_sniper_chest1, %death_stand_sniper_chest2 ];
    var_0["running_forward"] = [ %run_death_facedown, %run_death_roll, %run_death_fallonback, %run_death_flop ];
    var_0["running_forward_f"] = [ %run_death_fallonback ];
    var_0["stand_pistol_forward"] = [ %pistol_death_2 ];
    var_0["stand_pistol_front"] = [ %pistol_death_2 ];
    var_0["stand_pistol_groin"] = [ %pistol_death_3, %pistol_death_3 ];
    var_0["stand_pistol_torso_upper"] = [ %pistol_death_3 ];
    var_0["stand_pistol_upper_body"] = [ %pistol_death_4 ];
    var_0["stand_pistol_default"] = [ %pistol_death_1 ];
    var_0["stand_pistol_torso_upper"] = [ %pistol_death_3, %pistol_death_1 ];
    var_0["stand_pistol_lower_body"] = [ %pistol_death_2 ];
    var_0["cover_right_stand"] = [ %corner_standr_deatha, %corner_standr_deathb ];
    var_0["cover_right_crouch_head"] = [ [ %h1_cornercrr_alert_death_neck_2 ], [ %cornercrr_alert_death_slideout ] ];
    var_0["cover_right_crouch_default"] = [ [ %h1_cornercrr_alert_death_slideout_2, %h1_cornercrr_alert_death_fallout_2, %h1_cornercrr_alert_death_back_2 ], [ %cornercrr_alert_death_slideout, %cornercrr_alert_death_back ] ];
    var_0["cover_left_stand"] = [ %corner_standl_deatha, %corner_standl_deathb ];
    var_0["cover_left_crouch"] = [ [ %h1_cornercrl_death_back_2, %h1_cornercrl_death_side_2 ], [ %cornercrl_death_side, %cornercrl_death_back ] ];
    var_0["cover_stand"] = [ %coverstand_death_left, %coverstand_death_right ];
    var_0["cover_crouch_head"] = %covercrouch_death_1;
    var_0["cover_crouch_back"] = %covercrouch_death_3;
    var_0["cover_crouch_default"] = %covercrouch_death_2;
    var_0["saw_stand"] = [ %saw_gunner_death ];
    var_0["saw_crouch"] = [ %saw_gunner_lowwall_death ];
    var_0["saw_prone"] = [ %saw_gunner_prone_death ];
    var_0["dying_crawl_crouch"] = [ %dying_back_death_v2, %dying_back_death_v3, %dying_back_death_v4 ];
    var_0["dying_crawl_prone"] = [ %dying_crawl_death_v1, %dying_crawl_death_v2 ];
    var_0["stand_lower_body"] = [ %exposed_death_groin, %stand_death_leg ];
    var_0["stand_lower_body_extended"] = [ %stand_death_crotch, %stand_death_guts ];
    var_0["stand_head"] = [ %exposed_death_headshot, %exposed_death_flop ];
    var_0["stand_neck"] = [ %exposed_death_neckgrab ];
    var_0["stand_left_shoulder"] = [ %exposed_death_twist, %stand_death_shoulder_spin, %stand_death_shoulderback ];
    var_0["stand_torso_upper"] = [ %stand_death_tumbleforward, %stand_death_stumbleforward ];
    var_0["stand_torso_upper_extended"] = [ %stand_death_fallside ];
    var_0["stand_front_head"] = [ %stand_death_face, %stand_death_headshot_slowfall ];
    var_0["stand_front_head_extended"] = [ %stand_death_head_straight_back ];
    var_0["stand_front_torso"] = [ %stand_death_tumbleback ];
    var_0["stand_front_torso_extended"] = [ %stand_death_chest_stunned ];
    var_0["stand_back"] = [ %exposed_death_falltoknees, %exposed_death_falltoknees_02 ];
    var_0["stand_default"] = [ %exposed_death_02, %exposed_death_nerve ];
    var_0["stand_default_firing"] = [ %exposed_death_firing_02, %exposed_death_firing ];
    var_0["stand_backup_default"] = %exposed_death;
    var_0["crouch_head"] = [ %exposed_crouch_death_fetal ];
    var_0["crouch_torso"] = [ %exposed_crouch_death_flip ];
    var_0["crouch_default1"] = [ %exposed_crouch_death_twist ];
    var_0["crouch_default2"] = [ %exposed_crouch_death_flip ];
    var_0["melee_standing_front"] = [ %melee_death_standing_front ];
    var_0["melee_standing_back"] = [ %melee_death_standing_back ];
    var_0["melee_standing_left"] = [ %melee_death_standing_left ];
    var_0["melee_standing_right"] = [ %melee_death_standing_right ];
    var_0["melee_crouching_front"] = [ %melee_death_crouching_front ];
    var_0["melee_crouching_back"] = [ %melee_death_crouching_back ];
    var_0["melee_crouching_left"] = [ %melee_death_crouching_left ];
    var_0["melee_crouching_right"] = [ %melee_death_crouching_right ];
    anim._id_0CCA["soldier"]["death"] = var_0;
}

main()
{
    self endon( "killanimscript" );
    self stopsounds();
    var_0 = 0.3;
    self _meth_8144( %scripted_talking, var_0 );
    maps\_anim::_id_2B04( 0 );
    self _meth_83f9();

    if ( self.a._id_612E == 1 )
        return;

    if ( isdefined( self._id_2660 ) )
    {
        var_1 = self [[ self._id_2660 ]]();

        if ( !isdefined( var_1 ) )
            var_1 = 1;

        if ( var_1 )
            return;
    }

    animscripts\utility::_id_4DD7( "death" );
    _id_73D8( self.origin );
    anim._id_629A--;
    anim._id_6299--;

    if ( isdefined( self._id_70DC ) || self.forceragdollimmediate )
        _id_2CE4();

    if ( isdefined( self._id_2652 ) )
    {
        _id_6A3D( self._id_2652, 1 );

        if ( isdefined( self._id_2653 ) )
            self [[ self._id_2653 ]]();

        return;
    }

    var_2 = animscripts\pain::_id_A1C4();

    if ( self.damagelocation == "helmet" || self.damagelocation == "head" )
        _id_4820();
    else if ( var_2 && randomint( 3 ) == 0 )
        _id_4820();

    self _meth_8144( %animscript_root, 0.3 );

    if ( !animscripts\utility::_id_25A6( "head", "helmet" ) || ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" ) && isdefined( self.attacker ) )
    {
        if ( self.diequietly )
        {

        }
        else
            _id_6A3F();
    }

    if ( var_2 && _id_6D97() )
        return;

    if ( isdefined( self._id_8A2C ) )
    {
        if ( [[ self._id_8A2C ]]() )
            return;
    }

    if ( _id_8A2B() )
        return;

    var_3 = _id_3F4D();
    _id_6A3D( var_3, 0 );
}

_id_2CE4()
{
    animscripts\shared::_id_2F6C();
    self._id_85BA = 1;
    var_0 = 10;
    var_1 = common_scripts\_destructible::_id_3F4C( self.damagemod );

    if ( isdefined( self.attacker ) && self.attacker == level.playercardbackground && var_1 == "melee" )
        var_0 = 5;

    var_2 = self.damagetaken;

    if ( var_1 == "bullet" )
        var_2 = max( var_2, 300 );

    var_3 = var_0 * var_2;

    if ( level.cheat_super_ragdoll )
        var_3 = clamp( int( var_2 / 100 ) * randomintrange( 2500, 5000 ), 2500, 25000 );

    var_4 = max( 0.3, self.damagedir[2] );
    var_5 = ( self.damagedir[0], self.damagedir[1], var_4 );

    if ( isdefined( self._id_70D9 ) )
        var_5 *= self._id_70D9;
    else
        var_5 *= var_3;

    if ( self.forceragdollimmediate )
        var_5 += self.primary * 20 * 10;

    if ( isdefined( self._id_70DD ) )
        var_5 += self._id_70DD * 10;

    self startragdollfromimpact( self.damagelocation, var_5 );
    wait 0.05;
}

_id_2478( var_0, var_1 )
{
    return var_0[0] * var_1[1] - var_1[0] * var_0[1];
}

_id_5B8A( var_0, var_1 )
{
    var_2 = vectordot( var_1, var_0 );
    var_3 = cos( 60 );

    if ( squared( var_2 ) < squared( var_3 ) )
    {
        if ( _id_2478( var_0, var_1 ) > 0 )
            return 1;
        else
            return 3;
    }
    else if ( var_2 < 0 )
        return 0;
    else
        return 2;
}

_id_6589()
{
    if ( ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" ) && isdefined( self.attacker ) )
    {
        if ( isdefined( self._id_0B04 ) && isdefined( self._id_0B05 ) )
        {
            var_0 = self._id_0B05;
            self._id_0B05 = undefined;
        }
        else
            var_0 = _id_4064();

        self _meth_8193( "face angle", var_0 );
    }
}

_id_4064()
{
    var_0 = self.origin - self.attacker.origin;
    var_1 = anglestoforward( self.angles );
    var_2 = vectornormalize( ( var_0[0], var_0[1], 0 ) );
    var_3 = vectornormalize( ( var_1[0], var_1[1], 0 ) );
    var_4 = _id_5B8A( var_3, var_2 );
    var_5 = var_4 * 90;
    var_6 = ( -1 * var_2[0], -1 * var_2[1], 0 );
    var_7 = rotatevector( var_6, ( 0, var_5, 0 ) );
    var_8 = vectortoyaw( var_7 );
    return var_8;
}

_id_594D()
{
    if ( getdvar( "mapname" ) != "sanfran_b" )
        return;

    var_0 = getentarray( "enemy_overboard_achievement_trigger", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_594E( self );
}

_id_594E( var_0 )
{
    while ( isdefined( var_0 ) )
    {
        if ( self istouching( var_0 ) && isdefined( level.playercardbackground._id_594D ) )
        {
            maps\_utility::_id_41DD( "LEVEL_12A" );
            break;
        }

        wait 0.05;
    }
}

_id_6A3D( var_0, var_1 )
{
    if ( self.damagemod == "MOD_MELEE_ALT" && getdvar( "mapname", "undefined" ) == "sanfran_b" )
        thread _id_594D();

    if ( !animhasnotetrack( var_0, "dropgun" ) && !animhasnotetrack( var_0, "fire_spray" ) )
        animscripts\shared::_id_2F6C();

    if ( !isdefined( self._id_614C ) || !self._id_614C )
        _id_6589();

    self setflaggedanimknoballrestart( "deathanim", var_0, %body, 1, 0.1 );
    animscripts\face::_id_6D9B( var_0, "death" );

    if ( isdefined( self._id_85BA ) )
    {
        if ( !isdefined( self._id_6159 ) )
            self startragdoll();

        wait 0.05;
        self _meth_8192( "gravity" );
    }
    else if ( isdefined( self._id_70E0 ) )
        thread _id_A02C( self._id_70E0 );
    else if ( !animhasnotetrack( var_0, "start_ragdoll" ) )
    {
        if ( !isdefined( var_1 ) || !var_1 )
        {
            if ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" )
                var_2 = 0.7;
            else
                var_2 = 0.35;

            thread _id_A02C( getanimlength( var_0 ) * var_2 );
        }
    }

    if ( !isdefined( self._id_85BA ) )
        thread _id_6A3E( getanimlength( var_0 ) - 0.1 );

    self endon( "forcedRagdoll" );

    if ( self.damagemod != "MOD_MELEE" )
    {
        thread _id_9B00();
        thread _id_1D00();
    }

    animscripts\shared::_id_2D06( "deathanim" );
    animscripts\shared::_id_2F6C();
    self notify( "endPlayDeathAnim" );
}

_id_9B00()
{
    self endon( "endPlayDeathAnim" );
    self endon( "forcedRagdoll" );
    wait 0.25;

    while ( isdefined( self ) )
    {
        self queryshouldearlyragdoll();
        wait 0.2;
    }
}

_id_1D00()
{
    self endon( "endPlayDeathAnim" );

    while ( isdefined( self ) )
    {
        self waittill( "ragdoll_early_result", var_0 );

        if ( !isdefined( self ) )
            return;

        if ( var_0 )
        {
            self startragdoll();
            animscripts\shared::_id_2F6C();
            break;
        }

        self waittill( "ragdoll_early_result", var_0 );
    }

    self notify( "forcedRagdoll" );
}

_id_A02C( var_0 )
{
    wait(var_0);

    if ( isdefined( self ) )
        animscripts\shared::_id_2F6C();

    if ( isdefined( self ) && !isdefined( self._id_6159 ) )
        self startragdoll();
}

_id_6A3E( var_0 )
{
    self endon( "killanimscript" );

    if ( self.start_move != "none" )
        return;

    if ( isdefined( var_0 ) )
        wait(var_0);
    else
        wait 2;

    _id_68A1();
}

_id_68A1( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_85B9 ) )
        return;

    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    var_2 = self gettagorigin( "j_SpineUpper" );
    var_3 = self gettagangles( "j_SpineUpper" );
    var_4 = anglestoforward( var_3 );
    var_5 = anglestoup( var_3 );
    var_6 = anglestoright( var_3 );
    var_2 = var_2 + var_4 * -8.5 + var_5 * 5 + var_6 * 0;
    var_7 = bullettrace( var_2 + ( 0, 0, 30 ), var_2 - ( 0, 0, 100 ), 0, self );

    if ( var_7["normal"][2] > 0.9 )
        playfx( level._effect["deathfx_bloodpool_generic"], var_7["position"] );
}

_id_8A2B()
{
    if ( level.cheat_super_ragdoll && getdvarint( "ragdoll_enable" ) )
    {
        _id_2CE4();
        return 1;
    }

    if ( self.a._id_8A1A == "none" )
        return 0;

    if ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" )
        return 0;

    switch ( self.a._id_8A1A )
    {
        case "cover_right":
            if ( self.a._id_6E5A == "stand" )
            {
                var_0 = animscripts\utility::_id_5863( "death", "cover_right_stand" );
                _id_2C25( var_0 );
            }
            else
            {
                var_0 = [];

                if ( animscripts\utility::_id_25A6( "head", "neck" ) )
                    var_0 = animscripts\utility::_id_5863( "death", "cover_right_crouch_head" )[animscripts\corner::shouldplayalerttransition( self )];
                else
                    var_0 = animscripts\utility::_id_5863( "death", "cover_right_crouch_default" )[animscripts\corner::shouldplayalerttransition( self )];

                _id_2C25( var_0 );
            }

            return 1;
        case "cover_left":
            if ( self.a._id_6E5A == "stand" )
            {
                var_0 = animscripts\utility::_id_5863( "death", "cover_left_stand" );
                _id_2C25( var_0 );
            }
            else
            {
                var_0 = animscripts\utility::_id_5863( "death", "cover_left_crouch" )[animscripts\corner::shouldplayalerttransition( self )];
                _id_2C25( var_0 );
            }

            return 1;
        case "cover_stand":
            var_0 = animscripts\utility::_id_5863( "death", "cover_stand" );
            _id_2C25( var_0 );
            return 1;
        case "cover_crouch":
            var_0 = [];

            if ( animscripts\utility::_id_25A6( "head", "neck" ) && ( self.damageyaw > 135 || self.damageyaw <= -45 ) )
                var_0[var_0.size] = animscripts\utility::_id_5863( "death", "cover_crouch_head" );

            if ( self.damageyaw > -45 && self.damageyaw <= 45 )
                var_0[var_0.size] = animscripts\utility::_id_5863( "death", "cover_crouch_back" );

            var_0[var_0.size] = animscripts\utility::_id_5863( "death", "cover_crouch_default" );
            _id_2C25( var_0 );
            return 1;
        case "saw":
            if ( self.a._id_6E5A == "stand" )
                _id_2C25( animscripts\utility::_id_5863( "death", "saw_stand" ) );
            else if ( self.a._id_6E5A == "crouch" )
                _id_2C25( animscripts\utility::_id_5863( "death", "saw_crouch" ) );
            else
                _id_2C25( animscripts\utility::_id_5863( "death", "saw_prone" ) );

            return 1;
        case "dying_crawl":
            if ( isdefined( self.a._id_6451 ) && self.a._id_6E5A == "crouch" )
            {
                var_0 = animscripts\utility::_id_5863( "death", "dying_crawl_crouch" );
                _id_2C25( var_0 );
            }
            else
            {
                var_0 = animscripts\utility::_id_5863( "death", "dying_crawl_prone" );
                _id_2C25( var_0 );
            }

            return 1;
        case "stumbling_pain":
            _id_6A3D( self.a._id_8F70[self.a._id_8F70.size - 1], 0 );
            return 1;
    }

    return 0;
}

_id_2C25( var_0 )
{
    var_1 = var_0[randomint( var_0.size )];
    _id_6A3D( var_1, 0 );

    if ( isdefined( self._id_2653 ) )
        self [[ self._id_2653 ]]();
}

_id_6A3F()
{
    if ( ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" ) && isdefined( self.attacker ) )
        animscripts\face::_id_7824( "melee_death" );
    else
        animscripts\face::_id_7824( "death" );
}

_id_6FA4( var_0, var_1, var_2 )
{
    var_3 = var_2 * 20;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

_id_4820()
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self._id_475D ) )
        return;

    var_0 = getpartname( self._id_475D, 0 );
    var_1 = spawn( "script_model", self.origin + ( 0, 0, 64 ) );
    var_2 = getheadshothelmet();
    var_1 setmodel( var_2 );
    var_1.origin = self gettagorigin( var_0 );
    var_1.angles = self gettagangles( var_0 );
    var_1 thread _id_481F( self.damagedir );
    var_3 = self._id_475D;
    self._id_475D = undefined;
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self detach( var_3, "" );
}

getheadshothelmet()
{
    var_0 = self._id_475D;

    if ( !isdefined( level.nostraphelmetmodel ) )
        return var_0;

    foreach ( var_3, var_2 in level.nostraphelmetmodel )
    {
        if ( var_0 == var_3 )
        {
            var_0 = var_2;
            break;
        }
    }

    return var_0;
}

init_headshot_helmet()
{
    level.nostraphelmetmodel = [];
    level.nostraphelmetmodel["helmet_sp_arab_regular_tariq"] = "helmet_sp_arab_regular_tariq_nostrap";
    level.nostraphelmetmodel["helmet_sp_arab_regular_suren"] = "helmet_sp_arab_regular_suren_nostrap";

    foreach ( var_1 in level.nostraphelmetmodel )
        precachemodel( var_1 );
}

_id_481F( var_0 )
{
    var_1 = var_0;
    var_1 *= randomfloatrange( 2000, 4000 );
    var_2 = var_1[0];
    var_3 = var_1[1];
    var_4 = randomfloatrange( 1500, 3000 );
    var_5 = self.origin + ( randomfloatrange( -1, 1 ), randomfloatrange( -1, 1 ), randomfloatrange( -1, 1 ) ) * 5;
    self physicslaunch( var_5, ( var_2, var_3, var_4 ) );
    wait 60;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( distancesquared( self.origin, level.playercardbackground.origin ) > 262144 )
            break;

        wait 30;
    }

    self delete();
}

_id_73D8( var_0 )
{
    for ( var_1 = 0; var_1 < anim._id_8ACE.size; var_1++ )
        anim._id_8ACE[var_1] _id_1F01( var_0 );
}

_id_1F01( var_0 )
{
    if ( !isdefined( self._id_8567 ) )
        return;

    if ( distance( var_0, self._id_8567 ) < 80 )
    {
        self._id_8567 = undefined;
        self._id_856A = gettime();
    }
}

_id_8490()
{
    if ( self.a._id_5F5B != "run" )
        return 0;

    if ( self _meth_8194() > 60 || self _meth_8194() < -60 )
        return 0;

    if ( self.damagemod == "MOD_MELEE" || self.damagemod == "MOD_MELEE_ALT" )
        return 0;

    return 1;
}

_id_848E( var_0, var_1, var_2, var_3 )
{
    if ( var_1 != "MOD_ENERGY" )
        return 0;

    if ( self.a._id_6E5A != "stand" )
        return 0;

    if ( isdefined( self.a._id_2CE7 ) )
        return 0;

    return 1;
}

_id_50A2( var_0 )
{
    if ( isdefined( var_0 ) )
        return issubstr( var_0, "onearm" );

    return 0;
}

_id_8494( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
    {
        if ( var_0 == "MOD_MELEE_ALT" )
        {
            if ( _id_50A2( var_2 ) )
                return 0;

            return 1;
        }
        else if ( var_0 == "MOD_MELEE" && isdefined( var_1 ) && isdefined( var_1._id_39AB ) )
            return 1;
    }

    return 0;
}

_id_8493( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.a._id_2CE7 ) )
        return 0;

    if ( self.a._id_6E5A == "prone" || isdefined( self.a._id_6451 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    if ( var_2 > 500 )
        return 1;

    if ( var_1 == "MOD_MELEE" || var_1 == "MOD_MELEE_ALT" )
        return 0;

    if ( self.a._id_5F5B == "run" && !_id_50C2( var_3, 275 ) )
    {
        if ( randomint( 100 ) < 65 )
            return 0;
    }

    if ( animscripts\utility::_id_51AC( var_0 ) && self.maxturnspeed < var_2 )
        return 1;

    if ( animscripts\utility::_id_51A3( var_0 ) && _id_50C2( var_3, 512 ) )
        return 1;

    if ( _id_50F1( var_0 ) && _id_50C2( var_3, 425 ) )
        return 1;

    return 0;
}

_id_50F1( var_0 )
{
    if ( var_0 == "deserteagle" )
        return 1;

    return 0;
}

_id_50C2( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( distance( self.origin, var_0.origin ) > var_1 )
        return 0;

    return 1;
}

_id_3F4D()
{
    if ( _id_8494( self.damagemod, self.attacker, self.damageweapon ) )
    {
        self._id_0B04 = 1;
        var_0 = _id_3EEE();

        if ( isdefined( var_0 ) )
            return var_0;
    }

    if ( _id_848E( self.damageweapon, self.damagemod, self.damagetaken, self.attacker ) )
    {
        var_0 = _id_3F59();

        if ( isdefined( var_0 ) )
            return var_0;
    }

    if ( _id_8493( self.damageweapon, self.damagemod, self.damagetaken, self.attacker ) )
    {
        var_0 = _id_40FA();

        if ( isdefined( var_0 ) )
            return var_0;
    }

    if ( isdefined( self.a._id_6451 ) )
    {
        if ( self.a._id_6E5A == "crouch" )
            return _id_3F0F();
        else
            animscripts\notetracks::_id_8EFD();
    }

    if ( self.a._id_6E5A == "stand" )
    {
        if ( _id_8490() )
            return _id_40BE();
        else
            return _id_40E8();
    }
    else if ( self.a._id_6E5A == "crouch" )
        return _id_3F41();
    else if ( self.a._id_6E5A == "prone" )
        return _id_409C();
}

_id_3EEE()
{
    self._id_0B05 = _id_4064();
    var_0 = self._id_0B05 - self.angles[1];
    var_1 = angleclamp180( self.damageyaw - var_0 );
    var_2 = self.a._id_6E5A;

    if ( !isdefined( self.attacker ) || self.attacker != level.playercardbackground )
        return;

    var_3 = level.playercardbackground getstance();
    var_4 = [];

    if ( var_1 < -135 || var_1 > 135 )
    {
        var_4 = animscripts\utility::_id_5863( "death", "melee_exo_front_" + var_3 + "_" + var_2 );

        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_4 = common_scripts\utility::_id_0CDD( var_4, animscripts\utility::_id_5863( "death", "melee_exo_" + var_2 + "_front_head" ) );
    }
    else if ( var_1 < 45 && var_1 > -45 )
    {
        var_4 = animscripts\utility::_id_5863( "death", "melee_exo_back_" + var_3 + "_" + var_2 );

        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_4 = common_scripts\utility::_id_0CDD( var_4, animscripts\utility::_id_5863( "death", "melee_exo_" + var_2 + "_back_head" ) );
    }
    else if ( var_1 < -45 && var_1 > -135 )
    {
        var_4 = animscripts\utility::_id_5863( "death", "melee_exo_left_" + var_3 + "_" + var_2 );

        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_4 = common_scripts\utility::_id_0CDD( var_4, animscripts\utility::_id_5863( "death", "melee_exo_" + var_2 + "_left_head" ) );
    }
    else
    {
        var_4 = animscripts\utility::_id_5863( "death", "melee_exo_right_" + var_3 + "_" + var_2 );

        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_4 = common_scripts\utility::_id_0CDD( var_4, animscripts\utility::_id_5863( "death", "melee_exo_" + var_2 + "_right_head" ) );
    }

    return var_4[randomint( var_4.size )];
}

_id_40FA()
{
    var_0 = abs( self.damageyaw );

    if ( var_0 < 45 )
        return;

    if ( var_0 > 150 )
    {
        if ( animscripts\utility::_id_25A6( "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower", "left_foot", "right_foot" ) )
            var_1 = animscripts\utility::_id_5863( "death", "strong_legs" );
        else if ( self.damagelocation == "torso_lower" )
            var_1 = animscripts\utility::_id_5863( "death", "strong_torso_lower" );
        else
            var_1 = animscripts\utility::_id_5863( "death", "strong_default" );
    }
    else if ( self.damageyaw < 0 )
        var_1 = animscripts\utility::_id_5863( "death", "strong_right" );
    else
        var_1 = animscripts\utility::_id_5863( "death", "strong_left" );

    return var_1[randomint( var_1.size )];
}

_id_3F59()
{
    var_0 = abs( self.damageyaw );

    if ( var_0 > 135 )
    {
        var_1 = "directed_energy_stand_front_default";

        if ( isdefined( self._id_5518 ) )
        {
            if ( self._id_5518[2] < self.origin[2] + 20 )
                var_1 = "directed_energy_stand_front_legs";
            else if ( self._id_5518[2] > self.origin[2] + 40 )
                var_1 = "directed_energy_stand_front_head";
        }
    }
    else
        var_1 = "directed_energy_stand_back_default";

    var_2 = animscripts\utility::_id_5863( "death", var_1 );
    var_3 = var_2[randomint( var_2.size )];
    return var_3;
}

_id_40BE()
{
    if ( abs( self.damageyaw ) < 45 )
    {
        var_0 = animscripts\utility::_id_5863( "death", "running_forward_f" );
        var_1 = _id_40A8( var_0 );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_0 = animscripts\utility::_id_5863( "death", "running_forward" );
    var_1 = _id_40A8( var_0 );

    if ( isdefined( var_1 ) )
        return var_1;

    return _id_40E8();
}

_id_40A8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;

    for ( var_2 = var_0.size; var_2 > 0; var_2-- )
    {
        var_3 = randomint( var_2 );
        var_1 = var_0[var_3];

        if ( !_id_50B7( var_1 ) )
            return var_1;

        var_0[var_3] = var_0[var_2 - 1];
        var_0[var_2 - 1] = undefined;
    }

    return undefined;
}

_id_73E7( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2] ) )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

_id_50B7( var_0 )
{
    var_1 = 1;

    if ( animhasnotetrack( var_0, "code_move" ) )
        var_1 = getnotetracktimes( var_0, "code_move" )[0];

    var_2 = getmovedelta( var_0, 0, var_1 );
    var_3 = self localtoworldcoords( var_2 );
    return !self _meth_81c7( var_3, 1, 1 );
}

_id_40EA()
{
    var_0 = [];

    if ( abs( self.damageyaw ) < 50 )
        var_0 = animscripts\utility::_id_5863( "death", "stand_pistol_forward" );
    else
    {
        if ( abs( self.damageyaw ) < 110 )
            var_0 = animscripts\utility::_id_5863( "death", "stand_pistol_front" );

        if ( self.damagelocation == "torso_upper" )
            var_0 = common_scripts\utility::_id_0CDD( animscripts\utility::_id_5863( "death", "stand_pistol_torso_upper" ), var_0 );
        else if ( animscripts\utility::_id_25A6( "torso_lower", "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower" ) )
            var_0 = common_scripts\utility::_id_0CDD( animscripts\utility::_id_5863( "death", "stand_pistol_torso_upper" ), var_0 );

        if ( !animscripts\utility::_id_25A6( "head", "neck", "helmet", "left_foot", "right_foot", "left_hand", "right_hand", "gun" ) && randomint( 2 ) == 0 )
            var_0 = common_scripts\utility::_id_0CDD( animscripts\utility::_id_5863( "death", "stand_pistol_upper_body" ), var_0 );

        if ( var_0.size == 0 || animscripts\utility::_id_25A6( "torso_lower", "torso_upper", "neck", "head", "helmet", "right_arm_upper", "left_arm_upper" ) )
            var_0 = common_scripts\utility::_id_0CDD( animscripts\utility::_id_5863( "death", "stand_pistol_default" ), var_0 );
    }

    return var_0;
}

_id_40E8()
{
    var_0 = [];
    var_1 = [];

    if ( animscripts\utility::_id_9C3A() )
        var_0 = _id_40EA();
    else if ( isdefined( self._id_3066 ) && self._id_3066 )
        var_0 = animscripts\utility::_id_5863( "death", "emp" );
    else if ( isdefined( self.attacker ) && self _meth_8400( self.attacker ) )
    {
        if ( self.damageyaw <= 120 || self.damageyaw > -120 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_standing_front" );
        else if ( self.damageyaw <= -60 && self.damageyaw > 60 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_standing_back" );
        else if ( self.damageyaw < 0 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_standing_left" );
        else
            var_0 = animscripts\utility::_id_5863( "death", "melee_standing_right" );
    }
    else
    {
        if ( animscripts\utility::_id_25A6( "torso_lower", "left_leg_upper", "left_leg_lower", "right_leg_lower", "right_leg_lower" ) )
        {
            var_0 = animscripts\utility::_id_5863( "death", "stand_lower_body" );
            var_1 = animscripts\utility::_id_5863( "death", "stand_lower_body_extended" );
        }
        else if ( animscripts\utility::_id_25A6( "head", "helmet" ) )
            var_0 = animscripts\utility::_id_5863( "death", "stand_head" );
        else if ( animscripts\utility::_id_25A6( "neck" ) )
            var_0 = animscripts\utility::_id_5863( "death", "stand_neck" );
        else if ( animscripts\utility::_id_25A6( "torso_upper", "left_arm_upper" ) )
            var_0 = animscripts\utility::_id_5863( "death", "stand_left_shoulder" );

        if ( animscripts\utility::_id_25A6( "torso_upper" ) )
        {
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_torso_upper" ) );
            var_1 = common_scripts\utility::_id_0CDD( var_1, animscripts\utility::_id_5863( "death", "stand_torso_upper_extended" ) );
        }

        if ( self.damageyaw > 135 || self.damageyaw <= -135 )
        {
            if ( animscripts\utility::_id_25A6( "neck", "head", "helmet" ) )
            {
                var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_front_torso" ) );
                var_1 = common_scripts\utility::_id_0CDD( var_1, animscripts\utility::_id_5863( "death", "stand_front_torso_extended" ) );
            }

            if ( animscripts\utility::_id_25A6( "torso_upper" ) )
            {
                var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_front_torso" ) );
                var_1 = common_scripts\utility::_id_0CDD( var_1, animscripts\utility::_id_5863( "death", "stand_front_torso_extended" ) );
            }
        }
        else if ( self.damageyaw > -45 && self.damageyaw <= 45 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_back" ) );

        var_2 = var_0.size > 0;

        if ( !var_2 || randomint( 100 ) < 15 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_default" ) );

        if ( randomint( 100 ) < 10 && _id_3803() )
        {
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "stand_default_firing" ) );
            var_0 = _id_73E7( var_0 );
        }
    }

    if ( var_0.size == 0 )
        var_0[var_0.size] = animscripts\utility::_id_5863( "death", "stand_backup_default" );

    if ( !self.a._id_2B18 && self.start_move == "none" && !isdefined( self.a._id_665A ) )
    {
        var_3 = randomint( var_0.size + var_1.size );

        if ( var_3 < var_0.size )
            return var_0[var_3];
        else
            return var_1[var_3 - var_0.size];
    }

    return var_0[randomint( var_0.size )];
}

_id_3F41()
{
    var_0 = [];

    if ( isdefined( self.attacker ) && self _meth_8400( self.attacker ) )
    {
        if ( self.damageyaw <= 120 || self.damageyaw > -120 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_crouching_front" );
        else if ( self.damageyaw <= -60 && self.damageyaw > 60 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_crouching_back" );
        else if ( self.damageyaw < 0 )
            var_0 = animscripts\utility::_id_5863( "death", "melee_crouching_left" );
        else
            var_0 = animscripts\utility::_id_5863( "death", "melee_crouching_right" );
    }
    else
    {
        if ( animscripts\utility::_id_25A6( "head", "neck" ) )
            var_0 = animscripts\utility::_id_5863( "death", "crouch_head" );

        if ( animscripts\utility::_id_25A6( "torso_upper", "torso_lower", "left_arm_upper", "right_arm_upper", "neck" ) )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "crouch_torso" ) );

        if ( var_0.size < 2 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "crouch_default1" ) );

        if ( var_0.size < 2 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, animscripts\utility::_id_5863( "death", "crouch_default2" ) );
    }

    return var_0[randomint( var_0.size )];
}

_id_409C()
{
    return %prone_death_quickdeath;
}

_id_3F0F()
{
    var_0 = animscripts\utility::_id_0CD8( %dying_back_death_v1, %dying_back_death_v2, %dying_back_death_v3, %dying_back_death_v4 );
    return var_0[randomint( var_0.size )];
}

_id_3803()
{
    if ( !isdefined( self.weapon_switch_invalid ) || !animscripts\utility::_id_9C35() || !weaponisauto( self.weapon_switch_invalid ) || self.diequietly || animscripts\utility::_id_9C36() )
        return 0;

    if ( self.a._id_A2E2["right"] == "none" )
        return 0;

    return 1;
}

_id_9894( var_0 )
{
    return var_0;
}

_id_9895( var_0 )
{
    return var_0;
}

_id_6D97()
{
    if ( isdefined( self._id_529C ) || isdefined( self._id_5A7A ) )
        return 0;

    if ( self.damagelocation != "none" )
        return 0;

    var_0 = [];

    if ( self.a._id_5F5B != "run" )
    {
        if ( self.damageyaw > 135 || self.damageyaw <= -135 )
        {
            var_0[var_0.size] = _id_9894( %death_explosion_stand_b_v1 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_b_v2 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_b_v3 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_b_v4 );
        }
        else if ( self.damageyaw > 45 && self.damageyaw <= 135 )
        {
            var_0[var_0.size] = _id_9894( %death_explosion_stand_l_v1 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_l_v2 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_l_v3 );
        }
        else if ( self.damageyaw > -45 && self.damageyaw <= 45 )
        {
            var_0[var_0.size] = _id_9894( %death_explosion_stand_f_v1 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_f_v2 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_f_v3 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_f_v4 );
        }
        else
        {
            var_0[var_0.size] = _id_9894( %death_explosion_stand_r_v1 );
            var_0[var_0.size] = _id_9894( %death_explosion_stand_r_v2 );
        }
    }
    else if ( self.damageyaw > 135 || self.damageyaw <= -135 )
    {
        var_0[var_0.size] = _id_9894( %death_explosion_run_b_v1 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_b_v2 );
    }
    else if ( self.damageyaw > 45 && self.damageyaw <= 135 )
    {
        var_0[var_0.size] = _id_9894( %death_explosion_run_l_v1 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_l_v2 );
    }
    else if ( self.damageyaw > -45 && self.damageyaw <= 45 )
    {
        var_0[var_0.size] = _id_9894( %death_explosion_run_f_v1 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_f_v2 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_f_v3 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_f_v4 );
    }
    else
    {
        var_0[var_0.size] = _id_9894( %death_explosion_run_r_v1 );
        var_0[var_0.size] = _id_9894( %death_explosion_run_r_v2 );
    }

    var_1 = var_0[randomint( var_0.size )];

    if ( getdvar( "scr_expDeathMayMoveCheck", "on" ) == "on" )
    {
        var_2 = getmovedelta( var_1, 0, 1 );
        var_3 = self localtoworldcoords( var_2 );

        if ( !self _meth_81c7( var_3, 0 ) )
            return 0;
    }

    self _meth_8192( "nogravity" );
    _id_6A3D( var_1, 0 );
    return 1;
}
