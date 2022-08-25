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

_id_4105( var_0 )
{
    var_1 = self getshootatpos() + ( 0.0, 0.0, -3.0 );
    var_2 = ( var_1[0] - var_0[0], var_1[1] - var_0[1], var_1[2] - var_0[2] );
    var_2 = vectornormalize( var_2 );
    var_3 = var_2[2] * -1;
    return var_3;
}

_id_40CE()
{
    if ( isplayer( self.enemy ) )
        return randomfloatrange( self.enemy._id_4441._id_5C36, self.enemy._id_4441._id_5A17 );
    else
        return randomfloatrange( anim._id_5C36, anim._id_5A17 );
}

_id_40B6()
{
    var_0 = ( gettime() - self.a._id_55D7 ) / 1000;
    var_1 = _id_3F1E();

    if ( var_1 > var_0 )
        return var_1 - var_0;

    return 0;
}

_id_3F92()
{
    if ( !isdefined( self._id_3673 ) )
    {
        self._id_3673 = 1;
        self._id_3675 = 3;
    }

    var_0 = 0.2;
    var_1 = 0.45;

    if ( self._id_3673 % self._id_3675 == 0 )
    {
        if ( randomint( 5 ) < 3 )
        {
            var_0 = 0.45;
            var_1 = 1.0;
        }

        self._id_3675 = randomintrange( 2, 5 );
    }

    self._id_3673++;
    return randomfloatrange( var_0, var_1 );
}

_id_3F1E()
{
    if ( animscripts\utility::_id_9C3A() )
        return randomfloatrange( 0.15, 0.55 );
    else if ( animscripts\utility::_id_A2CF() )
        return randomfloatrange( 1.0, 1.7 );
    else if ( issniper() )
        return _id_40CE();
    else if ( self._id_3672 )
        return _id_3F92();
    else
        return randomfloatrange( 0.4, 0.9 );
}

burstdelay()
{
    if ( self.bulletsinclip )
    {
        if ( self._id_8415 == "full" && !self._id_3672 )
        {
            if ( self.a._id_55D7 == gettime() )
                wait 0.05;

            return;
        }

        var_0 = _id_40B6();

        if ( var_0 )
            wait(var_0);
    }
}

_id_1CAE()
{
    setdvarifuninitialized( "useCod3AmmoCheating", 1 );

    if ( getdvarint( "useCod3AmmoCheating", 1 ) == 1 )
        return cheatammoifnecessary_cod3();
    else
        return cheatammoifnecessary_h1();
}

cheatammoifnecessary_h1()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( self.team != "allies" )
    {
        if ( !isplayer( self.enemy ) )
            return 0;

        if ( self.enemy maps\_utility::_id_32D8( "player_is_invulnerable" ) )
            return 0;
    }

    if ( animscripts\utility::_id_9C3A() || animscripts\utility::_id_9C36() )
        return 0;

    if ( gettime() - self.ammocheattime < self.ammocheatinterval )
        return 0;

    if ( !self _meth_81C2( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) > 65536 )
        return 0;

    self.bulletsinclip = int( weaponclipsize( self.weapon ) / 2 );

    if ( self.bulletsinclip > weaponclipsize( self.weapon ) )
        self.bulletsinclip = weaponclipsize( self.weapon );

    self.ammocheattime = gettime();
    self notify( "cheated_reload_level_stats" );
    return 1;
}

cheatammoifnecessary_cod3()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( self.team != "allies" )
    {
        if ( !isplayer( self.enemy ) )
            return 0;

        if ( weaponclipsize( self.weapon ) < 15 )
            return 0;

        if ( self.enemy maps\_utility::_id_32D8( "player_is_invulnerable" ) )
            return 0;
    }

    if ( animscripts\utility::_id_9C3A() || animscripts\utility::_id_9C36() )
        return 0;

    if ( isdefined( self.nextcheattime ) && gettime() < self.nextcheattime )
        return 0;

    if ( !self _meth_81C2( self.enemy ) )
        return 0;

    if ( animscripts\utility::_id_50E9() )
        self.bulletsinclip = weaponclipsize( self.weapon );
    else
        self.bulletsinclip = 10;

    if ( self.bulletsinclip > weaponclipsize( self.weapon ) )
        self.bulletsinclip = weaponclipsize( self.weapon );

    self.nextcheattime = gettime() + 4000;
    self notify( "cheated_reload_level_stats" );
    return 1;
}

aimbutdontshoot()
{
    for ( var_0 = int( 60.0 ); var_0 > 0; var_0-- )
    {
        if ( isdefined( self._id_2D34 ) || isdefined( self.enemy ) && isdefined( self.enemy._id_2D2B ) )
        {
            wait 0.05;
            continue;
        }

        return 0;
    }

    return 1;
}

_id_8417()
{
    self endon( "shoot_behavior_change" );
    self endon( "stopShooting" );

    if ( _id_514A() )
    {
        if ( isdefined( self.enemy ) && isai( self.enemy ) && distancesquared( level.player.origin, self.enemy.origin ) < 147456 )
            self.enemy animscripts\battlechatter_ai::addthreatevent( "infantry", self, 1.0 );

        if ( animscripts\utility::_id_9C36() && issentient( self.enemy ) )
            wait(randomfloat( 2.0 ));
    }

    var_0 = 1;

    for (;;)
    {
        if ( !var_0 )
            burstdelay();

        var_0 = 0;

        if ( aimbutdontshoot() )
            break;

        if ( self._id_8415 == "full" )
        {
            if ( isdefined( self._id_5A7A ) && self._id_5A7A )
                _id_37EE( animscripts\utility::animarray( "fire" ), 0, 100 );
            else
                _id_37EE( animscripts\utility::animarray( "fire" ), 1, animscripts\shared::_id_2742() );
        }
        else if ( self._id_8415 == "burst" || self._id_8415 == "semi" )
        {
            var_1 = animscripts\shared::_id_2741();

            if ( var_1 == 1 )
                _id_37EE( animscripts\utility::animarraypickrandom( "single" ), 1, var_1 );
            else
                _id_37EE( animscripts\utility::animarray( self._id_8415 + var_1 ), 1, var_1 );
        }
        else if ( self._id_8415 == "single" )
            _id_37EE( animscripts\utility::animarraypickrandom( "single" ), 1, 1 );
        else
            self waittill( "hell freezes over" );

        if ( !self.bulletsinclip )
            break;
    }
}

_id_4143()
{
    anim.animflagnameindex++;
    return anim.animflagnameindex;
}
#using_animtree("generic_human");

_id_82F8( var_0 )
{
    self _meth_814D( %exposed_aiming, 1, var_0 );
    self _meth_8146( animscripts\utility::animarray( "straight_level" ), 1, var_0 );
    self _meth_8146( animscripts\utility::animarray( "add_aim_up" ), 1, var_0 );
    self _meth_8146( animscripts\utility::animarray( "add_aim_down" ), 1, var_0 );
    self _meth_8146( animscripts\utility::animarray( "add_aim_left" ), 1, var_0 );
    self _meth_8146( animscripts\utility::animarray( "add_aim_right" ), 1, var_0 );
    self._id_35C7 = animscripts\face::_id_6D9B( undefined, "aim", self._id_35C7 );
}

_id_8D17()
{
    if ( !isdefined( self.a.aimidlethread ) )
    {
        var_0 = 0.2;

        if ( isdefined( self.aimsetupblendtime ) )
            var_0 = self.aimsetupblendtime;

        _id_82F8( var_0 );

        if ( self.doaimidlethread )
            thread aimidlethread();

        thread animscripts\track::_id_9512();
    }
}

_id_315E()
{
    _id_3156();
    self _meth_8144( %add_fire, 0.1 );
    self notify( "stop tracking" );
}

_id_850C()
{
    if ( isdefined( self.a.aimidlethread ) )
        self _meth_814D( %add_idle, 0, 0.2 );

    self _meth_814D( %add_fire, 1, 0.1 );
}

_id_4873()
{
    if ( isdefined( self.a.aimidlethread ) )
        self _meth_814D( %add_idle, 1, 0.2 );

    self _meth_814D( %add_fire, 0, 0.1 );
}

aimidlethread( var_0 )
{
    self endon( "killanimscript" );
    self endon( "end_aim_idle_thread" );

    if ( isdefined( self.a.aimidlethread ) )
        return;

    self.a.aimidlethread = 1;
    wait 0.1;
    self _meth_814E( %add_idle, 1, 0.2 );
    var_1 = %add_idle;
    var_2 = 0;

    for (;;)
    {
        var_3 = "idle" + var_2;

        if ( isdefined( self.a._id_565E ) )
            var_4 = animscripts\utility::animarraypickrandom( "lean_idle" );
        else if ( animscripts\utility::animarrayanyexist( "exposed_idle" ) )
            var_4 = animscripts\utility::animarraypickrandom( "exposed_idle" );
        else
        {
            wait 0.5;
            __asm_jump( loc_711 );
        }

        if ( var_4 == var_1 )
            self setflaggedanimlimitedrestart( var_3, var_4, 1, 0.2 );
        else
            self setflaggedanimknoblimitedrestart( var_3, var_4, 1, 0.2 );

        var_1 = var_4;
        self waittillmatch( var_3, "end" );
        var_2++;
    }

    self _meth_8144( %add_idle, 0.1 );
}

_id_3156()
{
    self notify( "end_aim_idle_thread" );
    self.a.aimidlethread = undefined;
    self _meth_8144( %add_idle, 0.1 );
}

shotgunfirerate_h1og()
{
    return randomfloatrange( 1.0, 1.7 );
}

_id_8442()
{
    if ( animscripts\utility::_id_A2CF() )
        return 1.0;

    if ( animscripts\weaponlist::_id_9C2C() )
        return animscripts\weaponlist::autoshootanimrate() * 0.7;

    return 0.4;
}

_id_37EE( var_0, var_1, var_2 )
{
    var_3 = "fireAnim_" + _id_4143();
    maps\_gameskill::_id_7450();

    while ( !aimedatshootentorpos() )
        wait 0.05;

    _id_850C();
    var_4 = 1.0;

    if ( isdefined( self._id_8414 ) )
        var_4 = self._id_8414;
    else if ( self._id_8415 == "full" )
        var_4 = animscripts\weaponlist::autoshootanimrate();
    else if ( self._id_8415 == "burst" )
        var_4 = animscripts\weaponlist::burstshootanimrate();
    else if ( animscripts\utility::_id_9C3A() )
        var_4 = 3.0;
    else if ( animscripts\utility::_id_9C39() )
        var_4 = shotgunfirerate_h1og();

    self setflaggedanimknobrestart( var_3, var_0, 1, 0.2, var_4 );
    self _meth_81ED();
    var_5 = weaponfiretime( self.weapon );
    _id_37F0( var_3, var_0, var_1, var_2, var_5 );
    _id_4873();
}

_id_37EF()
{
    self endon( "killanimscript" );
    self endon( "fireAnimEnd" );
    self notify( "FireUntilOutOfAmmo_WaitTillEnded" );
    self endon( "FireUntilOutOfAmmo_WaitTillEnded" );
    var_0 = thisthread;

    for (;;)
    {
        waitframe;

        if ( !isdefined( var_0 ) )
        {
            self _meth_83D8();
            return;
        }

        wait 0.05;
    }
}

_id_37F0( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "enemy" );

    if ( isplayer( self.enemy ) && ( self._id_8415 == "full" || self._id_8415 == "semi" ) )
        level endon( "player_becoming_invulnerable" );

    if ( var_2 )
    {
        thread _id_622F( var_0, "fireAnimEnd" );
        self endon( "fireAnimEnd" );
    }

    if ( !isdefined( var_3 ) )
        var_3 = -1;

    var_5 = 0;
    var_6 = getanimlength( var_1 );
    var_7 = animhasnotetrack( var_1, "fire" );
    var_8 = weaponclass( self.weapon ) == "rocketlauncher";
    thread _id_37EF();

    while ( var_5 < var_3 && var_3 > 0 )
    {
        var_9 = 0;

        if ( var_7 )
            self waittillmatch( var_0, "fire" );

        if ( !self.bulletsinclip )
        {
            if ( !_id_1CAE() )
                break;
        }

        if ( !aimedatshootentorpos() )
            break;

        _id_83EB();

        if ( isplayer( self.enemy ) && self.enemy maps\_utility::_id_32D8( "player_is_invulnerable" ) )
        {
            if ( randomint( 3 ) == 0 )
                self.bulletsinclip--;
        }
        else
            self.bulletsinclip--;

        if ( var_8 )
        {
            self.a._id_7594--;

            if ( issubstr( tolower( self.weapon ), "rpg" ) || issubstr( tolower( self.weapon ), "panzerfaust" ) )
            {
                self hidepart( "tag_rocket" );
                self.a._id_7597 = 0;
            }
        }

        var_5++;
        thread _id_8443( var_0 );

        if ( self._id_3672 && var_5 == var_3 )
            break;

        if ( !var_7 || var_3 == 1 && self._id_8415 == "single" )
        {
            self waittillmatch( var_0, "end" );
            var_9 = var_6;
        }

        if ( var_4 - var_9 > 0 )
            wait(var_4 - var_9);
    }

    self _meth_83D8();

    if ( var_2 )
        self notify( "fireAnimEnd" );
}

aimedatshootentorpos()
{
    if ( !isdefined( self._id_840F ) )
        return 1;

    var_0 = self _meth_81BD();
    var_1 = animscripts\shared::_id_40C8();
    var_2 = vectortoangles( self._id_840F - var_1 );
    var_3 = anim.aimyawdifffartolerance;

    if ( isdefined( self.aimfaryawtolerance ) )
        var_3 = self.aimfaryawtolerance;

    var_4 = animscripts\utility::absangleclamp180( var_0[1] - var_2[1] );

    if ( var_4 > var_3 )
    {
        if ( distancesquared( self geteye(), self._id_840F ) > anim.aimyawdiffclosedistsq || var_4 > anim.aimyawdiffclosetolerance )
            return 0;
    }

    var_5 = anim.aimpitchdifftolerance;

    if ( self.a._id_6E5A == "crouch" && distancesquared( self geteye(), self._id_840F ) < anim.aimpitchdiffclosedistsq )
        var_5 = anim.aimpitchdiffclosetolerance;

    return animscripts\utility::absangleclamp180( var_0[0] - var_2[0] ) <= var_5;
}

_id_622F( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( var_1 );
    self waittillmatch( var_0, "end" );
    self notify( var_1 );
}

_id_51A9()
{
    if ( weaponburstcount( self.weapon ) > 0 )
        return 0;
    else if ( weaponisauto( self.weapon ) )
        return 0;

    return 1;
}

_id_83EB()
{
    var_0 = _id_51A9();

    if ( isdefined( self._id_83F6 ) )
    {
        if ( isdefined( self.enemy ) && self._id_83F6 == self.enemy )
            animscripts\utility::_id_83F2( var_0 );
    }
    else
        self [[ anim._id_8413 ]]( self._id_840F, var_0 );
}

_id_275F()
{
    if ( self.bulletsinclip )
        self.bulletsinclip--;
}

_id_8443( var_0 )
{
    if ( !animscripts\utility::_id_A2CF() )
        return;

    self endon( "killanimscript" );
    self notify( "shotgun_pump_sound_end" );
    self endon( "shotgun_pump_sound_end" );
    thread _id_8F03( 2.0 );
    self waittillmatch( var_0, "rechamber" );
    self playsound( "ai_shotgun_pump" );
    self notify( "shotgun_pump_sound_end" );
}

_id_8F03( var_0 )
{
    self endon( "killanimscript" );
    self endon( "shotgun_pump_sound_end" );
    wait(var_0);
    self notify( "shotgun_pump_sound_end" );
}

_id_7263( var_0 )
{

}

_id_6089( var_0 )
{
    if ( self.weapon == "none" )
        return 0;

    if ( isdefined( self._id_615B ) )
    {
        if ( self.bulletsinclip < weaponclipsize( self.weapon ) * 0.5 )
            self.bulletsinclip = int( weaponclipsize( self.weapon ) * 0.5 );

        if ( self.bulletsinclip <= 0 )
            self.bulletsinclip = 0;

        return 0;
    }

    if ( animscripts\stairs_utility::stairstransitionpendingsince( 100 ) )
        return 0;

    if ( self.bulletsinclip <= weaponclipsize( self.weapon ) * var_0 )
    {
        if ( var_0 == 0 )
        {
            if ( _id_1CAE() )
                return 0;
        }

        return 1;
    }

    return 0;
}

_id_7066()
{
    self endon( "weapon_switch_done" );
    self endon( "death" );
    self waittill( "killanimscript" );
    animscripts\shared::_id_6869( self.primaryweapon, "right" );
}

reload( var_0, var_1 )
{
    self endon( "killanimscript" );

    if ( !_id_6089( var_0 ) )
        return 0;

    animscripts\battlechatter_ai::_id_33B6();
    animscripts\battlechatter::_id_6A2E();

    if ( isdefined( var_1 ) )
    {
        self setflaggedanimknoball( "reloadanim", var_1, %body, 1, 0.1, 1 );
        animscripts\shared::_id_2D06( "reloadanim" );
        animscripts\weaponlist::_id_72B1();
        self.a._id_6084 = 0;
    }
    else
    {
        if ( self.a._id_6E5A == "prone" )
        {
            self setflaggedanimknoball( "reloadanim", %prone_reload, %body, 1, 0.1, 1 );
            self _meth_81FE( %prone_legs_up, %prone_legs_down, 1, 0.1, 1 );
        }
        else
        {
            wait 2;
            return;
        }

        animscripts\shared::_id_2D06( "reloadanim" );
        animscripts\weaponlist::_id_72B1();
        self.a._id_6084 = 0;
    }

    return 1;
}

addgrenadethrowanimoffset( var_0, var_1 )
{
    if ( !isdefined( anim._id_440A ) )
    {
        anim._id_440A = [];
        anim._id_440B = [];
    }

    var_2 = anim._id_440A.size;
    anim._id_440A[var_2] = var_0;
    anim._id_440B[var_2] = var_1;
}

_id_4DC3()
{
    addgrenadethrowanimoffset( %exposed_grenadethrowb, ( 41.5391, 7.28883, 72.2128 ) );
    addgrenadethrowanimoffset( %exposed_grenadethrowc, ( 34.8849, -4.77048, 74.0488 ) );
    addgrenadethrowanimoffset( %corner_standl_grenade_a, ( 41.605, 6.80107, 81.4785 ) );
    addgrenadethrowanimoffset( %corner_standl_grenade_b, ( 24.1585, -14.7221, 29.2992 ) );
    addgrenadethrowanimoffset( %cornercrl_grenadea, ( 25.8988, -10.2811, 30.4813 ) );
    addgrenadethrowanimoffset( %cornercrl_grenadeb, ( 24.688, 45.0702, 64.377 ) );
    addgrenadethrowanimoffset( %corner_standr_grenade_a, ( 37.1254, -32.7053, 76.5745 ) );
    addgrenadethrowanimoffset( %corner_standr_grenade_b, ( 19.356, 15.5341, 16.5036 ) );
    addgrenadethrowanimoffset( %cornercrr_grenadea, ( 39.8857, 5.92472, 24.5878 ) );
    addgrenadethrowanimoffset( %covercrouch_grenadea, ( -1.6363, -0.693674, 60.1009 ) );
    addgrenadethrowanimoffset( %covercrouch_grenadeb, ( -1.6363, -0.693674, 60.1009 ) );
    addgrenadethrowanimoffset( %coverstand_grenadea, ( 10.8573, 7.12614, 77.2356 ) );
    addgrenadethrowanimoffset( %coverstand_grenadeb, ( 19.1804, 5.68214, 73.2278 ) );
    addgrenadethrowanimoffset( %prone_grenade_a, ( 12.2859, -1.3019, 33.4307 ) );
    addgrenadethrowanimoffset( %cqb_stand_grenade_throw, ( 35.7494, 26.6052, 37.7086 ) );
    addgrenadethrowanimoffset( %s1_covercrouch_grenadea, ( -15.5413, -16.7719, 19.4304 ) );
    addgrenadethrowanimoffset( %s1_coverstand_grenadea, ( 3.99694, -2.76588, 32.8777 ) );
    addgrenadethrowanimoffset( %s1_coverstand_grenadeb, ( 5.51904, 2.92983, 32.8406 ) );
    addgrenadethrowanimoffset( %s1_exposed_crouch_fast_grenade_1, ( 16.4611, -8.55309, 30.1018 ) );
    addgrenadethrowanimoffset( %s1_exposed_crouch_fast_grenade_2, ( 30.5886, -7.6374, 47.3139 ) );
    addgrenadethrowanimoffset( %s1_exposed_grenadethrowc, ( 13.433, -0.473915, 43.3545 ) );
    addgrenadethrowanimoffset( %s1_exposed_grenadethrowb, ( -31.425, -7.62042, 42.4334 ) );
    addgrenadethrowanimoffset( %s1_cornercrr_grenade_2, ( 37.4516, -2.01701, 22.6517 ) );
    addgrenadethrowanimoffset( %s1_corner_standl_grenade_a, ( 41.605, 6.80107, 81.4785 ) );
    addgrenadethrowanimoffset( %s1_cornercrr_grenadea, ( 39.8857, 5.92472, 24.5878 ) );
}

h1_grenade_attach_detach_listener( var_0 )
{
    if ( var_0 == "grenade_left" || var_0 == "grenade_right" )
    {
        self.h1_scripted_grenade = spawn( "script_model", self gettagorigin( "tag_inhand" ) );
        var_1 = animscripts\utility::_id_3FB0();
        self.h1_scripted_grenade setmodel( var_1 );
        self.h1_scripted_grenade linkto( self, "tag_inhand", ( 0.0, 0.0, 3.0 ), ( 0.0, 0.0, 0.0 ) );
    }
    else if ( var_0 == "grenade_throw" )
    {
        self.h1_scripted_grenade delete();
        self.h1_scripted_grenade = undefined;
        return "end";
    }
}

_id_3FB1( var_0 )
{
    var_1 = ( 0.0, 0.0, 64.0 );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_4, var_3 in anim._id_440A )
        {
            if ( var_0 == var_3 )
            {
                var_1 = anim._id_440B[var_4];
                break;
            }
        }
    }

    if ( var_1[2] == 64 )
    {
        if ( !isdefined( var_0 ) )
        {

        }
        else
        {

        }
    }

    return var_1;
}

_id_933C()
{
    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        if ( level.players[var_0]._id_62A3 == 0 )
        {
            level.players[var_0]._id_440D["fraggrenade"] = 0;
            level.players[var_0]._id_440D["flash_grenade"] = 0;
        }
    }

    anim._id_933B = 1;
}

_id_7F15( var_0 )
{
    self.activegrenadetimer = spawnstruct();

    if ( isplayer( var_0 ) )
    {
        self.activegrenadetimer._id_517C = 1;
        self.activegrenadetimer.player = var_0;
        self.activegrenadetimer._id_9378 = self.grenadeweapon;
    }
    else
    {
        self.activegrenadetimer._id_517C = 0;
        self.activegrenadetimer._id_9378 = "AI_" + self.grenadeweapon;
    }
}

_id_9C32()
{
    return self.activegrenadetimer._id_517C;
}

_id_7F80( var_0, var_1 )
{
    if ( var_0._id_517C )
    {
        var_2 = var_0.player;
        var_3 = var_2._id_440D[var_0._id_9378];
        var_2._id_440D[var_0._id_9378] = max( var_1, var_3 );
    }
    else
    {
        var_3 = anim._id_440D[var_0._id_9378];
        anim._id_440D[var_0._id_9378] = max( var_1, var_3 );
    }
}

_id_3F55()
{
    var_0 = undefined;

    if ( _id_9C32() )
    {
        var_1 = self.activegrenadetimer.player;
        var_0 = gettime() + var_1._id_4441._id_6CB3 + randomint( var_1._id_4441._id_6CB4 );
    }
    else
        var_0 = gettime() + 30000 + randomint( 30000 );

    return var_0;
}

_id_3FB2( var_0 )
{
    if ( var_0._id_517C )
        return var_0.player._id_440D[var_0._id_9378];
    else
        return anim._id_440D[var_0._id_9378];
}

_id_2151( var_0 )
{
    if ( !isplayer( var_0 ) && self _meth_813F() )
    {
        if ( gettime() < _id_3FB2( self.activegrenadetimer ) )
        {
            if ( level.player.ignoreme )
                return var_0;

            var_1 = self getthreatbiasgroup();
            var_2 = level.player getthreatbiasgroup();

            if ( var_1 != "" && var_2 != "" && getthreatbias( var_2, var_1 ) < -10000 )
                return var_0;

            if ( self _meth_81C2( level.player ) || isai( var_0 ) && var_0 _meth_81C2( level.player ) )
            {
                if ( isdefined( self._id_22BA ) )
                {
                    var_3 = vectortoangles( level.player.origin - self.origin );
                    var_4 = angleclamp180( self._id_22BA.angles[1] - var_3[1] );
                }
                else
                    var_4 = animscripts\utility::_id_4177( level.player.origin );

                if ( abs( var_4 ) < 60 )
                {
                    var_0 = level.player;
                    _id_7F15( var_0 );
                }
            }
        }
    }

    return var_0;
}

_id_5A63( var_0 )
{
    if ( maps\_utility::_id_6ACB() )
        return 0;

    if ( !var_0._id_4441._id_2D8C )
        return 0;

    var_1 = gettime();

    if ( var_1 < var_0._id_440D["double_grenade"] )
        return 0;

    if ( var_1 > var_0._id_55A2 + 3000 )
        return 0;

    if ( var_1 < var_0._id_55A2 + 500 )
        return 0;

    return var_0._id_62A3 < 2;
}

_id_6036()
{
    return gettime() >= self.a._id_60CC;
}

_id_43FB( var_0 )
{
    if ( maps\_utility::_id_6ACB() )
        return 0;

    if ( self._id_79EA == 1 )
        return 1;

    if ( !_id_6036() )
        return 0;

    if ( gettime() >= _id_3FB2( self.activegrenadetimer ) )
        return 1;

    if ( self.activegrenadetimer._id_517C && self.activegrenadetimer._id_9378 == "fraggrenade" )
        return _id_5A63( var_0 );

    return 0;
}

isgrenadepossafe( var_0, var_1 )
{
    if ( isdefined( anim._id_933B ) && _id_9C32() )
        return 1;

    var_2 = 200;

    if ( self.grenadeweapon == "flash_grenade" )
        var_2 = 512;

    var_3 = var_2 * var_2;
    var_4 = undefined;
    var_5 = 100000000;
    var_6 = undefined;
    var_7 = 100000000;

    for ( var_8 = 0; var_8 < self._id_8AB0._id_5BA6.size; var_8++ )
    {
        if ( !isalive( self._id_8AB0._id_5BA6[var_8] ) )
            continue;

        var_9 = distancesquared( self._id_8AB0._id_5BA6[var_8].origin, var_1 );

        if ( var_9 > var_3 )
            continue;

        if ( var_9 < var_5 )
        {
            var_7 = var_5;
            var_6 = var_4;
            var_5 = var_9;
            var_4 = self._id_8AB0._id_5BA6[var_8];
            continue;
        }

        if ( var_9 < var_7 )
        {
            var_7 = var_9;
            var_6 = self._id_8AB0._id_5BA6[var_8];
        }
    }

    if ( isdefined( var_4 ) && sighttracepassed( var_4 geteye(), var_1, 0, undefined ) )
        return 0;

    if ( isdefined( var_6 ) && sighttracepassed( var_4 geteye(), var_1, 0, undefined ) )
        return 0;

    return 1;
}

_id_989E( var_0, var_1, var_2, var_3 )
{
    if ( !isgrenadepossafe( var_0, var_1 ) )
        return 0;
    else if ( distancesquared( self.origin, var_1 ) < 40000 )
        return 0;

    var_4 = physicstrace( var_1 + ( 0.0, 0.0, 1.0 ), var_1 + ( 0.0, 0.0, -500.0 ) );

    if ( var_4 == var_1 + ( 0.0, 0.0, -500.0 ) )
        return 0;

    var_4 += ( 0.0, 0.0, 0.1 );
    return _id_989F( var_0, var_4, var_2, var_3 );
}

_id_989D( var_0, var_1 )
{
    if ( self.weapon == "mg42" || self.grenadeammo <= 0 )
        return 0;

    _id_7F15( var_0 );
    var_0 = _id_2151( var_0 );

    if ( !_id_43FB( var_0 ) )
        return 0;

    var_2 = _id_3FB1( var_1 );

    if ( isdefined( self.enemy ) && var_0 == self.enemy )
    {
        if ( !_id_1D09() )
            return 0;

        if ( isplayer( self.enemy ) && maps\_utility::_id_5062( self.enemy ) )
            return 0;

        if ( animscripts\utility::_id_1AE2() )
        {
            if ( !isgrenadepossafe( var_0, var_0.origin ) )
                return 0;

            return _id_989F( var_0, undefined, var_1, var_2 );
        }
        else if ( animscripts\utility::_id_1AF0() )
            return _id_989E( var_0, animscripts\utility::_id_3F7E(), var_1, var_2 );
        else
        {
            if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
                var_3 = self _meth_81C5( var_0 );
            else
                var_3 = var_0.origin;

            if ( !isgrenadepossafe( var_0, var_3 ) )
                return 0;

            return _id_989F( var_0, undefined, var_1, var_2 );
        }

        return 0;
    }
    else
    {
        if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
            var_3 = self _meth_81C5( var_0 );
        else
            var_3 = var_0.origin;

        return _id_989E( var_0, var_3, var_1, var_2 );
    }
}

_id_989F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( gettime() < 10000 && !isdefined( level._id_4BB4 ) )
        return 0;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( isdefined( var_2 ) )
    {
        var_7 = var_2;
        var_8 = self.a._id_4471;
    }
    else
    {
        switch ( self.a._id_8A1A )
        {
            case "none":
            case "cover_crouch":
                if ( self.a._id_6E5A == "stand" )
                {
                    var_3 = ( 0.0, 0.0, 80.0 );
                    var_7 = %stand_grenade_throw;
                }
                else
                {
                    var_3 = ( 0.0, 0.0, 65.0 );
                    var_7 = %crouch_grenade_throw;
                }

                var_8 = "left";
                break;
            default:
                var_7 = undefined;
                var_8 = undefined;
                break;
        }
    }

    if ( !isdefined( var_7 ) )
        return 0;

    if ( isdefined( var_1 ) )
    {
        if ( !isdefined( var_4 ) )
            var_9 = self _meth_81A8( var_3, var_1, var_5, "min energy", "min time", "max time" );
        else
            var_9 = self _meth_81A8( var_3, var_1, var_5, "min time", "min energy" );
    }
    else if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_9 = self _meth_81A8( var_3, self _meth_81C5( var_0 ), var_5, "min energy", "min time", "max time" );
    else
    {
        var_10 = distance( var_0.origin, self.origin );
        var_11 = self._id_7120;

        if ( var_10 < 800 )
        {
            if ( var_10 < 256 )
                var_11 = 0;
            else
                var_11 *= ( var_10 - 256 ) / 544;
        }

        if ( !isdefined( var_4 ) )
            var_9 = self _meth_81D3( var_3, var_11, "min energy", "min time", "max time" );
        else
            var_9 = self _meth_81D3( var_3, var_11, "min time", "min energy" );
    }

    self.a._id_60CC = gettime() + randomintrange( 1000, 2000 );

    if ( isdefined( var_9 ) )
    {
        if ( !isdefined( self._id_63D2 ) )
            self._id_63D2 = self.grenadeawareness;

        self.grenadeawareness = 0;
        var_12 = _id_3F55();
        _id_7F80( self.activegrenadetimer, min( gettime() + 3000, var_12 ) );
        var_13 = 0;

        if ( _id_9C32() )
        {
            var_0._id_62A3++;
            thread _id_72A7( var_0 );

            if ( var_0._id_62A3 > 1 )
                var_13 = 1;

            if ( self.activegrenadetimer._id_9378 == "fraggrenade" )
            {
                if ( var_0._id_62A3 <= 1 )
                    var_0._id_55A2 = gettime();
            }
        }

        if ( isdefined( var_6 ) )
            thread _id_2CD7( var_7, var_9, var_12, var_13 );
        else
            _id_2CD7( var_7, var_9, var_12, var_13 );

        return 1;
    }
    else
    {

    }

    return 0;
}

_id_72A7( var_0 )
{
    self endon( "dont_reduce_giptp_on_killanimscript" );
    self waittill( "killanimscript" );
    var_0._id_62A3--;
}

_id_2CD7( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );

    if ( self.script == "combat" || self.script == "move" )
        self _meth_8193( "face direction", var_1 );

    animscripts\battlechatter_ai::_id_33B1( "grenade" );
    self notify( "stop_aiming_at_enemy" );
    self setflaggedanimknoballrestart( "throwanim", var_0, %body, _id_367A(), 0.1, 1 );
    thread animscripts\notetracks::_id_2D07( "throwanim", "killanimscript" );
    var_4 = animscripts\utility::_id_3FB0();
    var_5 = "none";

    for (;;)
    {
        self waittill( "throwanim", var_6 );

        if ( var_6 == "grenade_left" || var_6 == "grenade_right" )
        {
            var_5 = attachgrenademodel( var_4, "TAG_INHAND" );
            self._id_511B = 1;
        }

        if ( var_6 == "grenade_throw" || var_6 == "grenade throw" )
            break;

        if ( var_6 == "end" )
        {
            self.activegrenadetimer.player._id_62A3--;
            self notify( "dont_reduce_giptp_on_killanimscript" );
            return 0;
        }
    }

    self notify( "dont_reduce_giptp_on_killanimscript" );

    if ( _id_9C32() )
        thread _id_A22F( self.activegrenadetimer.player, var_2 );

    self _meth_81D6();

    if ( !_id_9C32() )
        _id_7F80( self.activegrenadetimer, var_2 );

    if ( var_3 )
    {
        var_13 = self.activegrenadetimer.player;

        if ( var_13._id_62A3 > 1 || gettime() - var_13._id_55A4 < 2000 )
            var_13._id_440D["double_grenade"] = gettime() + min( 5000, var_13._id_4441._id_6C95 );
    }

    self notify( "stop grenade check" );

    if ( var_5 != "none" )
        self detach( var_4, var_5 );
    else
    {

    }

    self._id_511B = undefined;
    self.grenadeawareness = self._id_63D2;
    self._id_63D2 = undefined;
    self waittillmatch( "throwanim", "end" );
    self notify( "done_grenade_throw" );
    self notify( "weapon_switch_done" );
    self _meth_814D( %exposed_modern, 1, 0.2 );
    self _meth_814D( %exposed_aiming, 1 );
    self _meth_8144( var_0, 0.2 );
}

_id_A22F( var_0, var_1 )
{
    var_0 endon( "death" );
    _id_A230( var_1 );
    var_0._id_62A3--;
}

_id_A230( var_0 )
{
    var_1 = self.activegrenadetimer;
    var_2 = spawnstruct();
    var_2 thread _id_A231( 5 );
    var_2 endon( "watchGrenadeTowardsPlayerTimeout" );
    var_3 = self.grenadeweapon;
    var_4 = _id_3FAF();

    if ( !isdefined( var_4 ) )
        return;

    _id_7F80( var_1, min( gettime() + 5000, var_0 ) );
    var_5 = 62500;
    var_6 = 160000;

    if ( var_3 == "flash_grenade" )
    {
        var_5 = 810000;
        var_6 = 1690000;
    }

    var_7 = level.players;
    var_8 = var_4.origin;

    for (;;)
    {
        wait 0.1;

        if ( !isdefined( var_4 ) )
            break;

        if ( distancesquared( var_4.origin, var_8 ) < 400 )
        {
            var_9 = [];

            for ( var_10 = 0; var_10 < var_7.size; var_10++ )
            {
                var_11 = var_7[var_10];
                var_12 = distancesquared( var_4.origin, var_11.origin );

                if ( var_12 < var_5 )
                {
                    var_11 _id_4402( var_1, var_0 );
                    continue;
                }

                if ( var_12 < var_6 )
                    var_9[var_9.size] = var_11;
            }

            var_7 = var_9;

            if ( var_7.size == 0 )
                break;
        }

        var_8 = var_4.origin;
    }
}

_id_4402( var_0, var_1 )
{
    var_2 = self;
    anim._id_933B = undefined;

    if ( gettime() - var_2._id_55A4 < 3000 )
        var_2._id_440D["double_grenade"] = gettime() + var_2._id_4441._id_6C95;

    var_2._id_55A4 = gettime();
    var_3 = var_2._id_440D[var_0._id_9378];
    var_2._id_440D[var_0._id_9378] = max( var_1, var_3 );
}

_id_3FAF()
{
    self endon( "killanimscript" );
    self waittill( "grenade_fire", var_0 );
    return var_0;
}

_id_A231( var_0 )
{
    wait(var_0);
    self notify( "watchGrenadeTowardsPlayerTimeout" );
}

attachgrenademodel( var_0, var_1 )
{
    self attach( var_0, var_1 );
    thread _id_2981( var_0, var_1 );
    return var_1;
}

_id_2981( var_0, var_1 )
{
    self endon( "stop grenade check" );
    self waittill( "killanimscript" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_63D2 ) )
    {
        self.grenadeawareness = self._id_63D2;
        self._id_63D2 = undefined;
    }

    self detach( var_0, var_1 );
}

_id_6384( var_0 )
{
    var_1 = anglestoforward( self.angles );
    var_2 = anglestoright( self.angles );
    var_3 = anglestoup( self.angles );
    var_1 *= var_0[0];
    var_2 *= var_0[1];
    var_3 *= var_0[2];
    return var_1 + var_2 + var_3;
}

_id_4403( var_0, var_1 )
{
    level notify( "armoffset" );
    level endon( "armoffset" );
    var_0 = self.origin + _id_6384( var_0 );

    for (;;)
        wait 0.05;
}

_id_3FAD()
{
    var_0 = randomfloat( 360 );
    var_1 = randomfloatrange( 30, 75 );
    var_2 = sin( var_1 );
    var_3 = cos( var_1 );
    var_4 = cos( var_0 ) * var_3;
    var_5 = sin( var_0 ) * var_3;
    var_6 = randomfloatrange( 100, 200 );
    var_7 = ( var_4, var_5, var_2 ) * var_6;
    return var_7;
}

_id_2F6F()
{
    var_0 = self gettagorigin( "tag_inhand" );
    var_1 = _id_3FAD();
    self magicgrenademanual( var_0, var_1, 3 );
}

_id_585F()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( self.fixednode || self.doingambush )
        return 0;

    var_0 = _id_3F15();

    if ( isdefined( var_0 ) )
        return _id_9BF3( var_0 );

    return 0;
}

_id_3F15()
{
    var_0 = self _meth_81F1();

    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = animscripts\utility::_id_3F2F();

    if ( isdefined( var_1 ) && var_0 == var_1 )
        return undefined;

    if ( isdefined( self._id_22BA ) && var_0 == self._id_22BA )
        return undefined;

    return var_0;
}

_id_9BF3( var_0 )
{
    var_1 = self.keepclaimednodeifvalid;
    var_2 = self.keepclaimednode;
    self.keepclaimednodeifvalid = 0;
    self.keepclaimednode = 0;

    if ( self _meth_81F3( var_0 ) )
        return 1;
    else
    {

    }

    self.keepclaimednodeifvalid = var_1;
    self.keepclaimednode = var_2;
    return 0;
}

_id_849C()
{
    if ( level.advancetoenemygroup[self.team] > 0 && level.advancetoenemygroup[self.team] < level.advancetoenemygroupmax )
    {
        if ( gettime() - level._id_5574[self.team] > 4000 )
            return 0;

        var_0 = level._id_5571[self.team];

        if ( var_0 == self )
            return 0;

        var_1 = isdefined( var_0 ) && distancesquared( self.origin, var_0.origin ) < 65536;

        if ( ( var_1 || distancesquared( self.origin, level._id_5573[self.team] ) < 65536 ) && ( !isdefined( self.enemy ) || distancesquared( self.enemy.origin, level._id_5572[self.team] ) < 262144 ) )
            return 1;
    }

    return 0;
}

_id_1CF0()
{
    if ( !isdefined( level._id_5574[self.team] ) )
        return 0;

    if ( _id_849C() )
        return 1;

    if ( gettime() - level._id_5574[self.team] < level.advancetoenemyinterval )
        return 0;

    if ( !issentient( self.enemy ) )
        return 0;

    if ( level.advancetoenemygroup[self.team] )
        level.advancetoenemygroup[self.team] = 0;

    var_0 = isdefined( self.advance_regardless_of_numbers ) && self.advance_regardless_of_numbers;

    if ( !var_0 && getaicount( self.team ) < getaicount( self.enemy.team ) )
        return 0;

    return 1;
}

_id_98A4( var_0 )
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( self.fixednode )
        return 0;

    if ( self.combatmode == "ambush" || self.combatmode == "ambush_nodes_only" )
        return 0;

    if ( !self _meth_8161( self.enemy.origin ) )
        return 0;

    if ( _id_514A() )
        return 0;

    if ( !_id_1CF0() )
        return 0;

    self _meth_81F6( var_0 );

    if ( self _meth_81F8() )
    {
        self.keepclaimednodeifvalid = 0;
        self.keepclaimednode = 0;
        self.a._id_58DE = 1;

        if ( level.advancetoenemygroup[self.team] == 0 )
        {
            level._id_5574[self.team] = gettime();
            level._id_5571[self.team] = self;
        }

        level._id_5573[self.team] = self.origin;
        level._id_5572[self.team] = self.enemy.origin;
        level.advancetoenemygroup[self.team]++;
        return 1;
    }

    return 0;
}

_id_27DE( var_0 )
{
    self endon( "death" );
    wait 0.5;
    var_1 = "" + anim.badplaceint;
    badplace_cylinder( var_1, 5, var_0, 16, 64, self.team );
    anim.badplaces[anim.badplaces.size] = var_1;

    if ( anim.badplaces.size >= 10 )
    {
        var_2 = [];

        for ( var_3 = 1; var_3 < anim.badplaces.size; var_3++ )
            var_2[var_2.size] = anim.badplaces[var_3];

        badplace_delete( anim.badplaces[0] );
        anim.badplaces = var_2;
    }

    anim.badplaceint++;

    if ( anim.badplaceint > 10 )
        anim.badplaceint -= 20;
}

_id_9C56( var_0, var_1, var_2 )
{
    if ( var_0 > var_1 && var_0 < var_2 )
        return 1;

    return 0;
}

_id_3FBF()
{
    if ( !isdefined( self._id_840F ) )
        return 0;

    var_0 = self _meth_81BD()[1] - animscripts\utility::_id_4171( self._id_840F );
    var_0 = angleclamp180( var_0 );
    return var_0;
}

_id_3FBE()
{
    if ( !isdefined( self._id_840F ) )
        return 0;

    var_0 = self _meth_81BD()[0] - vectortoangles( self._id_840F - self _meth_81BC() )[0];
    var_0 = angleclamp180( var_0 );
    return var_0;
}

_id_4082()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_0 = _id_3DB2( self.enemy );
    else
        var_0 = self.enemy getshootatpos();

    var_1 = var_0 - self getshootatpos();
    var_1 = vectornormalize( var_1 );
    var_2 = 360 - vectortoangles( var_1 )[0];
    return angleclamp180( var_2 );
}

_id_4085( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0 - self getshootatpos();
    var_1 = vectornormalize( var_1 );
    var_2 = 360 - vectortoangles( var_1 )[0];
    return angleclamp180( var_2 );
}

_id_4083( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return 0;

    if ( isdefined( self ) && animscripts\utility::_id_51B0() )
    {
        var_2 = anglestoforward( self.angles );
        var_3 = rotatepointaroundvector( var_2, var_0 - self.origin, self.angles[2] * -1 );
        var_0 = var_3 + self.origin;
    }

    var_4 = var_0 - var_1;
    var_4 = vectornormalize( var_4 );
    var_5 = 360 - vectortoangles( var_4 )[0];
    return angleclamp180( var_5 );
}

_id_A250()
{
    self._id_518C = 0;
    self._id_55D4 = -1;

    for (;;)
    {
        self waittill( "reload_start" );
        self._id_518C = 1;
        self._id_55D4 = gettime();
        _id_A0EE();
        self._id_518C = 0;
    }
}

_id_A0EE()
{
    thread _id_9362( 4, "reloadtimeout" );
    self endon( "reloadtimeout" );
    self endon( "weapon_taken" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self getcurrentweapon();

        if ( var_0 == "none" )
            break;

        if ( self _meth_82ED() >= weaponclipsize( var_0 ) )
            break;
    }

    self notify( "reloadtimeout" );
}

_id_9362( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
    self notify( var_1 );
}

_id_1D09()
{
    var_0 = self.enemy.origin - self.origin;
    var_1 = lengthsquared( ( var_0[0], var_0[1], 0 ) );

    if ( self.grenadeweapon == "flash_grenade" )
        return var_1 < 589824;

    if ( isdefined( level.usinggrenadedistancechecks ) && level.usinggrenadedistancechecks )
        return var_1 >= 40000 && var_1 <= 1562500;
    else
        return 1;
}

_id_5E5E()
{
    self endon( "death" );

    if ( !isdefined( level._id_6098 ) )
        self endon( "stop_monitoring_flash" );

    for (;;)
    {
        var_0 = undefined;
        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        self waittill( "flashbang", var_1, var_0, var_2, var_3, var_4 );

        if ( isdefined( self._id_38A8 ) && self._id_38A8 )
            continue;

        if ( isdefined( self._id_7A16 ) && self._id_7A16 != 0 )
            continue;

        if ( isdefined( self.team ) && isdefined( var_4 ) && self.team == var_4 )
        {
            var_0 = 3 * ( var_0 - 0.75 );

            if ( var_0 < 0 )
                continue;

            if ( isdefined( self._id_91F1 ) )
                continue;
        }

        var_5 = 0.2;

        if ( var_0 > 1 - var_5 )
            var_0 = 1.0;
        else
            var_0 /= ( 1 - var_5 );

        var_6 = 4.5 * var_0;

        if ( var_6 < 0.25 )
            continue;

        self._id_38B6 = var_4;

        if ( isdefined( self.flashbangstopsscriptedanim ) && self.flashbangstopsscriptedanim )
            self _meth_8143();

        maps\_utility::_id_38AB( var_6 );
        self notify( "doFlashBanged", var_1, var_3 );
    }
}

_id_51A4()
{
    return animscripts\utility::_id_51A3( self.primaryweapon );
}

issniper()
{
    return animscripts\utility::_id_51AC( self.primaryweapon );
}

_id_514A()
{
    return issniper() || animscripts\utility::_id_9C36();
}

_id_367A()
{
    return 1.5;
}

_id_711F()
{
    return randomfloatrange( 1, 1.2 );
}

_id_40A4( var_0 )
{
    if ( var_0.size == 0 )
        return undefined;

    if ( var_0.size == 1 )
        return var_0[0];

    if ( isdefined( self.a._id_6F4D ) && randomint( 100 ) > 20 )
    {
        foreach ( var_3, var_2 in var_0 )
        {
            if ( var_2 == self.a._id_6F4D )
            {
                if ( var_3 < var_0.size - 1 )
                    var_0[var_3] = var_0[var_0.size - 1];

                var_0[var_0.size - 1] = undefined;
                break;
            }
        }
    }

    return var_0[randomint( var_0.size )];
}

_id_6BFF()
{
    var_0 = self geteye();

    foreach ( var_2 in level.players )
    {
        if ( !self _meth_81C2( var_2 ) )
            continue;

        var_3 = var_2 geteye();
        var_4 = vectortoangles( var_0 - var_3 );
        var_5 = anglestoforward( var_4 );
        var_6 = var_2 getplayerangles();
        var_7 = anglestoforward( var_6 );
        var_8 = vectordot( var_5, var_7 );

        if ( var_8 < 0.805 )
            continue;

        if ( common_scripts\utility::_id_2006() && var_8 >= 0.996 )
            continue;

        return 1;
    }

    return 0;
}

_id_3DB2( var_0 )
{
    var_1 = self _meth_81C5( var_0 );
    var_2 = var_0 getshootatpos() - var_0.origin;
    return var_1 + var_2;
}
