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

_id_4C9E()
{
    var_0 = [];
    var_0["standard"] = %melee_1;
    var_0["standard_stand_to_melee"] = %stand_2_melee_1;
    var_0["standard_run_to_melee"] = %run_2_melee_charge;
    var_0["aivai_exposed_attackerwins_attack"] = %melee_f_awin_attack;
    var_0["aivai_exposed_attackerwins_defend"] = %melee_f_awin_defend;
    var_0["aivai_exposed_attackerwins_defend_survive"] = %melee_f_awin_defend_survive;
    var_0["aivai_exposed_defenderwins_attack"] = %melee_f_dwin_attack;
    var_0["aivai_exposed_defenderwins_defend"] = %melee_f_dwin_defend;
    var_0["aivai_wrestle_attackerwins_attack"] = %bog_melee_r_attack;
    var_0["aivai_wrestle_attackerwins_defend"] = %bog_melee_r_defend;
    var_0["aivai_wrestle_attackerwins_defend_survive"] = %bog_melee_r_backdeath2;
    var_0["aivai_behind_attackerwins_attack"] = %melee_sync_attack;
    var_0["aivai_behind_attackerwins_defend"] = %melee_sync_defend;
    var_0["aivai_exposed_defenderwins_attack_kick"] = %melee_f_dwin_attack_kick;
    var_0["aivai_exposed_defenderwins_defend_kick"] = %melee_f_dwin_defend_kick;
    var_0["aivai_exposed_defenderwins_attack_survive_kick"] = %melee_f_dwin_attack_survive_kick;
    var_0["aivai_coverleft_attackerwins_attack"] = %cornersdl_melee_wina_attacker;
    var_0["aivai_coverleft_attackerwins_defend"] = %cornersdl_melee_wina_defender;
    var_0["aivai_coverleft_attackerwins_defend_survive"] = %cornersdl_melee_wina_defender_survive;
    var_0["aivai_coverleft_defenderwins_attack"] = %cornersdl_melee_wind_attacker;
    var_0["aivai_coverleft_defenderwins_attack_survive"] = %cornersdl_melee_wind_attacker_survive;
    var_0["aivai_coverleft_defenderwins_defend"] = %cornersdl_melee_wind_defender;
    var_0["aivai_coverright_attackerwins_attack"] = %cornersdr_melee_wina_attacker;
    var_0["aivai_coverright_attackerwins_defend"] = %cornersdr_melee_wina_defender;
    var_0["aivai_coverright_defenderwins_attack"] = %cornersdr_melee_wind_attacker;
    var_0["aivai_coverright_defenderwins_defend"] = %cornersdr_melee_wind_defender;
    anim.archetypes["soldier"]["melee"] = var_0;
}

_id_5B61()
{
    precachemodel( "weapon_parabolic_knife" );
    level._effect["melee_knife_ai"] = loadfx( "vfx/weaponimpact/flesh_impact_knife" );
}

_id_5B78()
{
    if ( !isdefined( self._stealth ) )
        return 0;

    if ( isdefined( self._id_32D8 ) && isdefined( self._id_32D8["_stealth_enabled"] ) && self._id_32D8["_stealth_enabled"] )
    {
        if ( isdefined( self._id_32D8["_stealth_attack"] ) && !self._id_32D8["_stealth_attack"] )
            return 1;
    }

    return 0;
}

_id_5B7B()
{
    if ( !isdefined( self.enemy ) )
        return 0;

    if ( isdefined( self._id_2D38 ) )
        return 0;

    if ( _id_5B78() )
        return 0;

    if ( !_id_5B38( self.enemy ) )
        return 0;

    _id_5B6B();

    if ( !_id_5B4A() )
    {
        _id_5B6A( self.enemy );
        return 0;
    }

    self _meth_819E( ::_id_5B63, ::_id_5B54 );
}

_id_5B6B()
{
    self._id_5B36.target = self.enemy;
    self._id_5B36._id_4DE7 = 0;
    self._id_5B36._id_4E43 = 0;
}

_id_5B4A()
{
    if ( !_id_5B62() )
        return 0;

    self._id_5B36._id_4DE7 = 1;

    if ( _id_5B3A() )
    {
        self._id_5B36._id_3AE4 = ::_id_5B45;
        return 1;
    }

    if ( _id_5B70() )
    {
        if ( isdefined( self._id_8A31 ) )
            self._id_5B36._id_3AE4 = self._id_8A31;
        else
            self._id_5B36._id_3AE4 = ::_id_5B73;

        return 1;
    }

    self._id_5B36._id_3AE4 = undefined;
    self._id_60D2 = gettime() + 150;
    self._id_60D1 = self._id_5B36.target;
    return 0;
}

_id_5B7E()
{
    var_0 = 1;
    var_1 = distance2d( self._id_5B36._id_8D38, self._id_5B36.target.origin );

    if ( var_1 < 32 )
    {
        var_2 = vectornormalize( ( self._id_5B36._id_8D38[0] - self._id_5B36.target.origin[0], self._id_5B36._id_8D38[1] - self._id_5B36.target.origin[1], 0 ) );
        self._id_5B36._id_8D38 += var_2 * ( 32 - var_1 );

        if ( distance( self._id_5B36._id_8D38, self._id_5B36.target.origin ) < 31.9 )
            return 0;

        var_0 = 0;
    }

    var_3 = self _meth_813E( self._id_5B36._id_8D38 );

    if ( !isdefined( var_3 ) )
        return 0;

    if ( abs( self._id_5B36._id_8D38[2] - var_3[2] ) > 51.2 )
        return 0;

    if ( abs( self.origin[2] - var_3[2] ) > 51.2 )
        return 0;

    self._id_5B36._id_8D38 = var_3;

    if ( !self _meth_81C7( self._id_5B36._id_8D38, 1, var_0 ) )
        return 0;

    if ( isdefined( self._id_5B36._id_8D43 ) )
    {
        var_4 = self._id_5B36._id_8D38 - self._id_5B36.target.origin;
        var_5 = anglestoforward( self._id_5B36._id_8D43 );
        var_6 = vectordot( var_5, var_4 );
        var_7 = self._id_5B36._id_8D38 - var_5 * var_6;
        var_8 = self._id_5B36.target.origin - var_7;
        var_9 = distance2d( self._id_5B36.target.origin, var_7 );

        if ( var_9 < 32 )
            var_7 -= var_8 * ( 32 - var_9 ) / 32;
    }
    else
    {
        var_2 = vectornormalize( ( self._id_5B36._id_8D38[0] - self._id_5B36.target.origin[0], self._id_5B36._id_8D38[1] - self._id_5B36.target.origin[1], 0 ) );
        var_7 = self._id_5B36.target.origin + var_2 * 32;
    }

    if ( !self _meth_81C8( self._id_5B36._id_8D38, var_7, 1, 0 ) )
        return 0;

    if ( !self _meth_81C8( var_7, self._id_5B36.target.origin, 1, 1 ) )
        return 0;

    return 1;
}

_id_5B62()
{
    if ( !isdefined( self._id_5B36.target ) )
        return 0;

    var_0 = self._id_5B36.target;

    if ( isdefined( var_0._id_2D38 ) )
        return 0;

    var_1 = distancesquared( self.origin, var_0.origin );

    if ( isdefined( self._id_5B82 ) )
        var_2 = self._id_5B82;
    else if ( isplayer( var_0 ) )
        var_2 = 40000;
    else
        var_2 = 25600;

    if ( !self._id_5B36._id_4DE7 && var_1 > var_2 )
        return 0;

    if ( !isalive( self ) )
        return 0;

    if ( isdefined( self.a._id_6143 ) && self.a._id_7B46 >= gettime() + 50 )
        return 0;

    if ( isdefined( self._id_60D2 ) && isdefined( self._id_60D1 ) && gettime() < self._id_60D2 && self._id_60D1 == var_0 )
        return 0;

    if ( isdefined( self.a._id_6451 ) || self.a._id_6E5A == "prone" )
        return 0;

    if ( animscripts\utility::_id_9C3A() )
        return 0;

    if ( isdefined( self.grenade ) && self.frontshieldanglecos == 1 )
        return 0;

    if ( !isalive( var_0 ) )
        return 0;

    if ( isdefined( var_0._id_2D2B ) || isdefined( var_0.ignoreme ) && var_0.ignoreme )
        return 0;

    if ( !isai( var_0 ) && !isplayer( var_0 ) )
        return 0;

    if ( isai( var_0 ) )
    {
        if ( var_0 _meth_819F() )
            return 0;

        if ( var_0 maps\_utility::_id_2CE7() || var_0.delayeddeath )
            return 0;
    }

    if ( isplayer( var_0 ) )
        var_3 = var_0 getstance();
    else
        var_3 = var_0.a._id_6E5A;

    if ( var_3 != "stand" && var_3 != "crouch" )
        return 0;

    if ( isdefined( self._id_58D7 ) && isdefined( var_0._id_58D7 ) )
        return 0;

    if ( isdefined( var_0.grenade ) )
        return 0;

    if ( self._id_5B36._id_4E43 )
        var_4 = 110;
    else
        var_4 = 60;

    var_5 = angleclamp180( self.angles[1] - animscripts\utility::_id_4171( var_0.origin ) );

    if ( abs( var_5 ) > var_4 )
        return 0;

    if ( var_1 <= 4096 )
        return 1;

    if ( self._id_5B36._id_4E43 )
        return 0;

    if ( isdefined( self._id_60D0 ) && isdefined( self._id_60CF ) && gettime() < self._id_60D0 && self._id_60CF == var_0 )
        return 0;

    return 1;
}

_id_5B77()
{
    self._id_5B36._id_6DB8 = 1;
    self.a._id_5F5B = "run";
}

_id_5B79()
{
    self _meth_8144( %body, 0.2 );
    self._id_5B36._id_6DB8 = undefined;
    self.a._id_5F5B = "stop";
    self _meth_8193( "face default" );
}

_id_5B63()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );

    for (;;)
    {
        var_0 = self._id_5B36._id_3AE4;
        [[ self._id_5B36._id_3AE4 ]]();

        if ( !isdefined( self._id_5B36._id_3AE4 ) || var_0 == self._id_5B36._id_3AE4 )
            break;
    }
}

_id_5B71( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    self._id_60D4 = gettime() + 2500;
    self._id_60D3 = var_0;
}

_id_5B6F()
{
    var_0 = distancesquared( self._id_5B36.target.origin, self.origin );

    if ( var_0 > 4096 && isdefined( self._id_60D4 ) && isdefined( self._id_60D3 ) && gettime() < self._id_60D4 && self._id_60D3 == self._id_5B36.target )
        return 0;

    return 1;
}

_id_5B70()
{
    if ( isdefined( self._id_5B36.target._id_58D7 ) )
        return 0;

    if ( !_id_5B6F() )
        return 0;

    if ( isdefined( self._id_5B36.target._id_8A32 ) )
        return 0;

    return _id_5B76();
}

_id_5B75()
{
    if ( isdefined( self._id_5B82 ) )
        var_0 = self._id_5B82;
    else if ( isplayer( self._id_5B36.target ) )
        var_0 = 40000;
    else
        var_0 = 25600;

    if ( distancesquared( self.origin, self._id_5B36.target.origin ) > var_0 )
        self._id_5B36._id_420F = gettime() + 3000;
    else
        self._id_5B36._id_420F = gettime() + 1000;
}

_id_5B73()
{
    self _meth_8192( "zonly_physics" );

    if ( isdefined( self._id_5B36.target ) )
        _id_5B75();

    while ( isdefined( self._id_5B36.target ) )
    {
        if ( !_id_5B72() )
        {
            self._id_60D0 = gettime() + 1500;
            self._id_60CF = self._id_5B36.target;
            break;
        }

        if ( !isdefined( self._id_5B36.target ) )
            break;

        animscripts\battlechatter_ai::_id_33B4();
        self _meth_8193( "face point", self._id_5B36.target.origin );
        var_0 = animscripts\utility::_id_5863( "melee", "standard" );
        self setflaggedanimknoballrestart( "meleeanim", var_0, %body, 1, 0.2, 1 );
        _id_5B68( var_0 );
        self._id_5B36._id_4E43 = 1;

        if ( !_id_5B74() )
        {
            _id_5B71( self._id_5B36.target );
            break;
        }
    }

    self _meth_8192( "none" );
}

_id_5B74()
{
    for (;;)
    {
        self waittill( "meleeanim", var_0 );

        if ( var_0 == "end" )
            return 1;

        if ( var_0 == "stop" )
        {
            if ( !_id_5B4A() )
                return 0;

            if ( self._id_5B36._id_3AE4 != ::_id_5B73 )
                return 1;
        }

        if ( var_0 == "fire" )
        {
            if ( isdefined( self._id_5B36.target ) )
            {
                var_1 = self._id_5B36.target.health;
                self _meth_81EC();

                if ( isdefined( self._id_5B36.target ) && self._id_5B36.target.health < var_1 )
                    _id_5B75();
            }
        }
    }
}

_id_5B76()
{
    if ( !isdefined( self._id_5B36.target ) )
        return 0;

    if ( !isdefined( self.enemy ) )
        return 0;

    if ( !_id_5B62() )
        return 0;

    var_0 = vectornormalize( self._id_5B36.target.origin - self.origin );
    self._id_5B36._id_8D38 = self._id_5B36.target.origin - 40.0 * var_0;
    return _id_5B7E();
}

_id_5B72()
{
    if ( !_id_5B76() )
        return 0;

    var_0 = common_scripts\utility::_id_2B73( self.origin, self._id_5B36.target.origin );

    if ( var_0 <= 4096 )
    {
        var_1 = animscripts\utility::_id_5863( "melee", "standard_stand_to_melee" );
        self setflaggedanimknoball( "readyanim", var_1, %body, 1, 0.3, 1 );
        _id_5B68( var_1 );
        animscripts\shared::_id_2D06( "readyanim" );
        return 1;
    }

    _id_5B67();
    var_2 = self._id_5B36.target.origin;
    var_3 = 0.1;
    var_4 = animscripts\utility::_id_5863( "melee", "standard_run_to_melee" );
    var_5 = length( getmovedelta( var_4, 0, 1 ) );
    var_6 = 32;
    var_7 = 48.0 + var_6 + var_5;
    var_8 = var_7 * var_7;
    var_9 = 64 + var_6;
    var_10 = var_9 * var_9;
    var_11 = getanimlength( var_4 ) * 1000;
    var_12 = var_11 - 100;
    var_13 = var_11 - 200;
    var_14 = 0;
    var_15 = undefined;
    var_16 = animscripts\utility::_id_5863( "run", "straight" );

    if ( isplayer( self._id_5B36.target ) && self._id_5B36.target == self.enemy )
        self _meth_8193( "face enemy" );
    else
        self _meth_8193( "face point", self._id_5B36.target.origin );

    self setflaggedanimknoball( "chargeanim", var_16, %body, 1, 0.2, 1 );
    _id_5B68( var_16 );
    var_17 = 0;

    for (;;)
    {
        var_18 = gettime();
        var_19 = isdefined( var_15 ) && var_15 <= var_8;

        if ( !var_17 )
        {
            if ( var_19 )
            {
                _id_5B77();
                self setflaggedanimknoballrestart( "chargeanim", var_4, %body, 1, 0.1, 1 );
                _id_5B68( var_4 );
                var_14 = var_18;
                var_17 = 1;
            }
        }
        else
        {
            var_20 = var_0 <= var_8;

            if ( var_18 - var_14 >= var_12 || !var_19 && !var_20 )
            {
                _id_5B77();
                self setflaggedanimknoball( "chargeanim", var_16, %body, 1, 0.3, 1 );
                _id_5B68( var_16 );
                var_17 = 0;
            }
        }

        animscripts\notetracks::_id_2D0B( var_3, "chargeanim" );

        if ( !_id_5B76() )
        {
            _id_5B79();
            return 0;
        }

        var_0 = common_scripts\utility::_id_2B73( self.origin, self._id_5B36.target.origin );
        var_21 = ( self._id_5B36.target.origin - var_2 ) * 1 / ( gettime() - var_18 );
        var_2 = self._id_5B36.target.origin;
        var_22 = self._id_5B36.target.origin + var_21 * var_13;
        var_15 = common_scripts\utility::_id_2B73( self.origin, var_22 );

        if ( var_17 && var_0 <= var_10 && ( gettime() - var_14 >= var_12 || !isplayer( self._id_5B36.target ) ) )
            break;

        if ( !var_17 && gettime() >= self._id_5B36._id_420F )
        {
            _id_5B79();
            return 0;
        }
    }

    _id_5B79();
    return 1;
}

_id_5B67()
{
    if ( !isdefined( self.a._id_60CE ) )
        self.a._id_60CE = 0;

    if ( isdefined( self.enemy ) && isplayer( self.enemy ) || randomint( 3 ) == 0 )
    {
        if ( gettime() > self.a._id_60CE )
        {
            animscripts\face::_id_7824( "meleecharge" );
            self.a._id_60CE = gettime() + 8000;
        }
    }
}

_id_5B3F( var_0 )
{
    var_1 = 90;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( abs( var_0 ) < var_1 )
        return 0;

    var_2 = self._id_5B36.target;
    _id_5B4F();

    if ( self._id_5B36._id_A342 )
    {
        self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_attack" );
        var_2._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_defend" );
        var_2._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_defend_survive" );
    }
    else
    {
        self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack" );
        var_2._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_defend" );
    }

    return 1;
}

_id_5B40( var_0 )
{
    var_1 = 100;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( abs( var_0 ) < var_1 )
        return 0;

    var_2 = self._id_5B36.target;

    if ( isdefined( var_2._id_58D7 ) )
        return 0;

    if ( isdefined( var_2._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 1;
    self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_attack" );
    var_2._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_defend" );
    var_2._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_defend_survive" );
    return 1;
}

melee_aivsai_exposed_chooseanimationandposition_kick( var_0 )
{
    var_1 = 90;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( abs( var_0 ) < var_1 )
        return 0;

    if ( isdefined( self._id_58D7 ) )
        return 0;

    var_2 = self._id_5B36.target;

    if ( isdefined( self._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 0;
    self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack_kick" );
    self._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack_survive_kick" );
    var_2._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_defend_kick" );
    return 1;
}

_id_5B3D( var_0 )
{
    if ( -90 > var_0 || var_0 > 0 )
        return 0;

    var_1 = self._id_5B36.target;

    if ( isdefined( var_1._id_58D7 ) )
        return 0;

    if ( isdefined( var_1._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 1;
    self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_behind_attackerwins_attack" );
    var_1._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_behind_attackerwins_defend" );
    return 1;
}

_id_5B3E()
{
    if ( isdefined( self._id_5B88 ) )
        var_0[0] = ::_id_5B3F;
    else if ( isdefined( self._id_5B89 ) )
        var_0[0] = ::_id_5B40;
    else
    {
        var_0[0] = ::_id_5B3F;
        var_0[1] = ::_id_5B40;
        var_0[2] = ::melee_aivsai_exposed_chooseanimationandposition_kick;
        var_0[3] = ::_id_5B3D;

        for ( var_1 = 2; var_1 > 0; var_1-- )
        {
            var_2 = randomint( var_1 + 1 );
            var_3 = var_0[var_1];
            var_0[var_1] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_5B3C()
{
    if ( isdefined( self.h1_melee_animations_enabled ) && !self.h1_melee_animations_enabled )
        return 0;

    var_0 = self._id_5B36.target;
    var_1 = vectortoangles( var_0.origin - self.origin );
    var_2 = angleclamp180( var_0.angles[1] - var_1[1] );
    var_3 = _id_5B3E();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( [[ var_3[var_4] ]]( var_2 ) )
        {
            self._id_5B36._id_8CFF = ( 0, var_1[1], 0 );
            self._id_5B36._id_8D38 = getstartorigin( var_0.origin, var_0.angles, self._id_5B36.animname );

            if ( _id_5B7E() )
                return 1;
        }
    }

    return 0;
}

_id_5B4F()
{
    var_0 = self._id_5B36.target;

    if ( isdefined( self._id_5B7F ) )
    {
        self._id_5B36._id_A342 = 1;
        return;
    }
    else if ( isdefined( var_0._id_5B7F ) )
    {
        self._id_5B36._id_A342 = 0;
        return;
    }

    if ( isdefined( self._id_58D7 ) )
        self._id_5B36._id_A342 = 1;
    else if ( isdefined( var_0._id_58D7 ) )
        self._id_5B36._id_A342 = 0;
    else
        self._id_5B36._id_A342 = common_scripts\utility::_id_2006();
}

_id_5B48()
{
    var_0 = self._id_5B36.target;
    _id_5B4F();
    var_1 = var_0._id_22BA.type;

    if ( var_1 == "Cover Multi" )
        var_1 = animscripts\utility::_id_3F3F( var_0._id_22BA );

    if ( var_1 == "Cover Left" )
    {
        if ( self._id_5B36._id_A342 )
        {
            self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_attack" );
            var_0._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_defend" );
            var_0._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_defend_survive" );
        }
        else
        {
            self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_attack" );
            self._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_attack_survive" );
            var_0._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_defend" );
        }
    }
    else if ( self._id_5B36._id_A342 )
    {
        self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverright_attackerwins_attack" );
        var_0._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverright_attackerwins_defend" );
    }
    else
    {
        self._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverright_defenderwins_attack" );
        var_0._id_5B36.animname = animscripts\utility::_id_5863( "melee", "aivai_coverright_defenderwins_defend" );
    }

    self._id_5B36._id_8D38 = getstartorigin( var_0._id_22BA.origin, var_0._id_22BA.angles, self._id_5B36.animname );
    self._id_5B36._id_8CFF = ( var_0._id_22BA.angles[0], angleclamp180( var_0._id_22BA.angles[1] + 180 ), var_0._id_22BA.angles[2] );
    var_0._id_5B36._id_35C0 = animscripts\utility::_id_404B( var_0._id_22BA );
    self._id_5B36._id_8D43 = var_0._id_22BA.angles;

    if ( !_id_5B7E() )
    {
        self._id_5B36._id_8D43 = undefined;
        return 0;
    }

    return 1;
}

_id_5B47()
{
    if ( isdefined( self.h1_melee_animations_enabled ) && !self.h1_melee_animations_enabled )
        return 0;

    var_0 = self._id_5B36.target._id_22BA;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( distancesquared( var_0.origin, self._id_5B36.target.origin ) > 16 && isdefined( self._id_5B36.target.a._id_22AB ) && ( self._id_5B36.target.a._id_22AB != "hide" && self._id_5B36.target.a._id_22AB != "lean" ) )
        return 0;

    var_1 = vectortoangles( self.origin - var_0.origin );
    var_2 = angleclamp180( var_0.angles[1] - var_1[1] );
    var_3 = var_0.type;

    if ( var_3 == "Cover Multi" )
        var_3 = animscripts\utility::_id_3F3F( var_0 );

    if ( var_3 == "Cover Left" )
    {
        if ( var_2 >= -50 && var_2 <= 0 )
            return 1;
    }
    else if ( var_3 == "Cover Right" )
    {
        if ( var_2 >= 0 && var_2 <= 50 )
            return 1;
    }

    return 0;
}

_id_5B3A()
{
    var_0 = self._id_5B36.target;

    if ( !isai( var_0 ) || var_0.type != "human" )
        return 0;

    if ( self.stairsstate != "none" || var_0.stairsstate != "none" )
        return 0;

    if ( isdefined( self._id_5B7F ) && isdefined( var_0._id_5B7F ) )
        return 0;

    if ( isdefined( self._id_58D7 ) && isdefined( var_0._id_58D7 ) )
        return 0;

    if ( isdefined( self._id_5B7F ) && isdefined( var_0._id_58D7 ) || isdefined( var_0._id_5B7F ) && isdefined( self._id_58D7 ) )
        return 0;

    if ( isdefined( self._id_8A32 ) )
    {
        if ( ![[ self._id_8A32 ]]() )
            return 0;

        self._id_5B36._id_6EE9 = 1;
    }
    else if ( isdefined( var_0._id_8A32 ) )
        return 0;
    else if ( _id_5B47() && _id_5B48() )
        self._id_5B36._id_6EE9 = 1;
    else
    {
        if ( !_id_5B3C() )
            return 0;

        self._id_5B36._id_6EE9 = 0;
    }

    if ( !isdefined( var_0._id_5B36._id_35C0 ) )
        var_0._id_5B36._id_35C0 = var_0.angles[1];

    self._id_5B36._id_8D39 = self._id_5B36._id_8D38 - var_0.origin;
    return 1;
}

_id_5B46( var_0 )
{
    self._id_5B36._id_9088 = var_0;
    var_0._id_5B36._id_9088 = undefined;
}

_id_5B49( var_0 )
{
    if ( !isdefined( var_0._id_5B36 ) )
        return;

    _id_5B67();

    if ( !isalive( var_0 ) )
        return;

    self.syncedmeleetarget = var_0;
    var_0.syncedmeleetarget = self;
    self._id_5B36._id_5786 = 1;
    var_0._id_5B36._id_5786 = 1;
    self linktoblendtotag( var_0, "tag_sync", 1, 1 );
}

_id_5B45()
{
    if ( !_id_5B41() )
    {
        self._id_60D0 = gettime() + 1500;
        self._id_60CF = self._id_5B36.target;
        return;
    }

    var_0 = self._id_5B36.target;

    if ( !animhasnotetrack( self._id_5B36.animname, "sync" ) )
        return;

    _id_5B46( var_0 );

    if ( self._id_5B36._id_A342 )
    {
        self._id_5B36.death = undefined;
        var_0._id_5B36.death = 1;
    }
    else
    {
        var_0._id_5B36.death = undefined;
        self._id_5B36.death = 1;
    }

    self._id_5B36._id_66A5 = var_0;
    var_0._id_5B36._id_66A5 = self;

    if ( animscripts\utility::_id_9C3A() )
    {
        maps\_utility::_id_39D0( self.primaryweapon, "primary" );
        self._id_560F = self.primaryweapon;
    }

    if ( var_0 animscripts\utility::_id_9C3A() )
    {
        var_0 maps\_utility::_id_39D0( var_0.primaryweapon, "primary" );
        var_0._id_560F = var_0.primaryweapon;
    }

    self._id_5B36.weapon = self.weapon;
    self._id_5B36._id_A2E9 = animscripts\utility::_id_3F47();
    var_0._id_5B36.weapon = var_0.weapon;
    var_0._id_5B36._id_A2E9 = var_0 animscripts\utility::_id_3F47();
    self._id_5B36._id_4E43 = 1;
    var_0 _meth_819E( ::_id_5B3B, ::_id_5B54 );
    var_0 thread _id_5B39( self );
    self._id_5B36.target = undefined;
    _id_5B3B();
}

_id_5B39( var_0 )
{
    self endon( "end_melee" );
    self endon( "melee_aivsai_execute" );
    wait 0.1;

    if ( isdefined( var_0 ) )
        var_0 notify( "end_melee" );

    self notify( "end_melee" );
}

_id_5B44( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 <= gettime() )
        return 0;

    if ( !_id_5B62() )
        return 0;

    var_2 = self._id_5B36.target;
    var_3 = distancesquared( var_2.origin, var_0 );

    if ( self._id_5B36._id_6EE9 )
        var_4 = 256;
    else
        var_4 = 1296;

    if ( var_3 > var_4 )
        return 0;

    self._id_5B36._id_8D38 = var_2.origin + self._id_5B36._id_8D39;

    if ( !_id_5B7E() )
        return 0;

    return 1;
}

_id_5B43( var_0 )
{
    var_1 = distancesquared( ( self.origin[0], self.origin[1], 0 ), ( self._id_5B36._id_8D38[0], self._id_5B36._id_8D38[1], 0 ) );

    if ( var_1 < 64 && abs( self._id_5B36._id_8D38[2] - self.origin[2] ) < 64 )
        return 1;

    var_2 = distancesquared( ( var_0[0], var_0[1], 0 ), ( self._id_5B36._id_8D38[0], self._id_5B36._id_8D38[1], 0 ) );
    var_3 = distancesquared( ( self.origin[0], self.origin[1], 0 ), ( self._id_5B36.target.origin[0], self._id_5B36.target.origin[1], 0 ) );

    if ( var_2 > var_3 && abs( self._id_5B36.target.origin[2] - self.origin[2] ) < 64 )
        return 1;

    return 0;
}

_id_5B42( var_0 )
{
    _id_5B79();

    if ( self._id_5B36._id_6EE9 )
    {
        self _meth_81CA( self._id_5B36._id_8D38, self._id_5B36._id_8CFF );
        wait 0.05;
    }
    else
    {
        self _meth_8193( "face angle", self._id_5B36._id_8CFF[1] );
        wait 0.05;
    }

    return _id_5B44( var_0 );
}

_id_5B41()
{
    if ( !_id_5B62() )
        return 0;

    _id_5B77();
    self _meth_8144( %body, 0.2 );
    self _meth_8149( animscripts\run::_id_40BD(), %body, 1, 0.2 );
    self _meth_8192( "zonly_physics" );
    self.keepclaimednode = 1;
    var_0 = gettime() + 1500;
    var_1 = self._id_5B36.target.origin;

    while ( _id_5B44( var_1, var_0 ) )
    {
        if ( _id_5B43( var_1 ) )
            return _id_5B42( var_1 );

        self _meth_8193( "face point", self._id_5B36._id_8D38 );
        wait 0.05;
    }

    _id_5B79();
    return 0;
}

_id_5B3B()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self notify( "melee_aivsai_execute" );
    self _meth_8192( "zonly_physics" );
    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;
    thread _id_5B52();
    thread _id_5B65();

    if ( isdefined( self._id_5B36._id_35C0 ) )
        self _meth_8193( "face angle", self._id_5B36._id_35C0 );
    else
        self _meth_8193( "face current" );

    self.a._id_6E5A = "stand";
    self _meth_8144( %body, 0.2 );

    if ( isdefined( self._id_5B36.death ) )
        _id_5B50();

    self setflaggedanimknoballrestart( "meleeAnim", self._id_5B36.animname, %body, 1, 0.2 );
    _id_5B68( self._id_5B36.animname );
    var_0 = animscripts\shared::_id_2D06( "meleeAnim", ::_id_5B5C );

    if ( var_0 == "melee_death" && ( isdefined( self._id_5B36._id_8FF9 ) || isdefined( self._id_58D7 ) && self._id_58D7 ) )
    {
        _id_5B53();
        self setflaggedanimknoballrestart( "meleeAnim", self._id_5B36._id_8FFB, %body, 1, 0.2 );
        _id_5B68( self._id_5B36._id_8FFB );
        var_0 = animscripts\shared::_id_2D06( "meleeAnim", ::_id_5B5C );
    }

    if ( isdefined( self._id_5B36 ) && isdefined( self._id_5B36.death ) )
        self kill();

    self.keepclaimednode = 0;
}

_id_5B50()
{
    self._id_5B36._id_A1BF = self.allowpain;
    self._id_5B36._id_A1C9 = self._id_38A8;
    maps\_utility::_id_2AC2();
    maps\_utility::_id_7F71( 1 );
}

_id_5B64()
{
    return isdefined( self._id_5B36.weapon ) && self._id_5B36.weapon != "none" && self.weapon != self._id_5B36.weapon;
}

_id_5B53()
{
    if ( self.weapon != "none" && self._id_560F != "none" )
        return;

    if ( !isdefined( self._id_5B36.weapon ) || self._id_5B36.weapon == "none" )
        return;

    maps\_utility::_id_39D0( self._id_5B36.weapon, self._id_5B36._id_A2E9 );

    if ( isdefined( self._id_5B36._id_2F75 ) )
    {
        self._id_5B36._id_2F75 delete();
        self._id_5B36._id_2F75 = undefined;
    }
}

_id_5B52()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self waittill( "weapon_dropped", var_0 );

    if ( isdefined( var_0 ) )
        self._id_5B36._id_2F75 = var_0;
}

_id_5B66()
{
    if ( !isdefined( self._id_5B36._id_8FFB ) )
        return 0;

    if ( !isdefined( self._id_5B36._id_8FFA ) )
        return 0;

    return 1;
}

_id_5B65()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self waittill( "partner_end_melee" );

    if ( isdefined( self._id_5B36.death ) )
    {
        if ( isdefined( self._id_5B36.animateddeath ) || isdefined( self._id_5B36._id_4EC1 ) )
            self kill();
        else
        {
            self._id_5B36.death = undefined;

            if ( _id_5B66() )
                self._id_5B36._id_8FF9 = 1;
            else
                self notify( "end_melee" );
        }
    }
    else if ( !isdefined( self._id_5B36._id_9A98 ) )
        self notify( "end_melee" );
}

_id_5B7C()
{
    if ( !isdefined( self._id_5B36._id_5786 ) )
        return;

    if ( isdefined( self.syncedmeleetarget ) )
        self.syncedmeleetarget _id_5B7D();

    _id_5B7D();
}

_id_5B7D()
{
    self unlink();
    self.syncedmeleetarget = undefined;

    if ( !isalive( self ) )
        return;

    self._id_5B36._id_5786 = undefined;
    self _meth_8192( "zonly_physics" );
    self _meth_8193( "face angle", self.angles[1] );
}

_id_5B5F()
{
    _id_5B7C();
    self._id_5B36._id_9A98 = 1;

    if ( isdefined( self._id_5B36._id_66A5 ) && isdefined( self._id_5B36._id_66A5._id_5B36 ) )
        self._id_5B36._id_66A5._id_5B36._id_9A98 = 1;
}

_id_5B5E()
{
    if ( animhasnotetrack( self._id_5B36.animname, "melee_death" ) )
        return 0;

    return isdefined( self._id_5B36.death );
}

_id_5B5D( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        self._id_5B36._id_4EC1 = 1;
    else
        self._id_5B36.animateddeath = 1;
}

_id_5B5C( var_0 )
{
    if ( issubstr( var_0, "ps_" ) )
    {
        var_1 = getsubstr( var_0, 3 );
        self playsound( var_1 );
    }
    else if ( var_0 == "sync" )
    {
        if ( isdefined( self._id_5B36._id_9088 ) )
        {
            _id_5B49( self._id_5B36._id_9088 );
            self._id_5B36._id_9088 = undefined;
        }
    }
    else if ( var_0 == "unsync" )
    {
        _id_5B5F();

        if ( _id_5B5E() )
            _id_5B5D();
    }
    else if ( var_0 == "melee_interact" )
        self._id_5B36._id_8FFA = 1;
    else if ( var_0 == "melee_death" )
    {
        var_2 = isdefined( self._id_58D7 ) && self._id_58D7;

        if ( isdefined( self._id_5B36._id_8FF9 ) || var_2 )
        {
            if ( var_2 )
                self._id_5B36.death = undefined;

            return var_0;
        }

        _id_5B5D();

        if ( isdefined( self._id_5B36.animateddeath ) )
        {
            return var_0;
            return;
        }
    }
    else if ( var_0 == "attach_knife" )
    {
        self attach( "weapon_parabolic_knife", "TAG_INHAND", 1 );
        self._id_5B36._id_4732 = 1;
    }
    else
    {
        if ( var_0 == "detach_knife" )
        {
            self detach( "weapon_parabolic_knife", "TAG_INHAND", 1 );
            self._id_5B36._id_4732 = undefined;
            return;
        }

        if ( var_0 == "stab" )
        {
            self playsound( "melee_knife_hit_body" );

            if ( maps\_utility::_id_4749( self.model, "TAG_KNIFE_FX" ) )
                playfxontag( level._effect["melee_knife_ai"], self, "TAG_KNIFE_FX" );
            else
            {

            }

            if ( isdefined( self._id_5B36._id_66A5 ) && isdefined( self._id_5B36._id_66A5._id_5B36 ) )
                self._id_5B36._id_66A5 _id_5B5D( 1 );
        }
    }
}

_id_5B4E()
{
    self endon( "end_melee" );
    animscripts\shared::_id_2F6C();
    return 0;
}

_id_5B4D()
{
    self endon( "end_melee" );
    animscripts\notetracks::_id_2D14( "meleeAnim", 10.0 );
    animscripts\shared::_id_2F6C();
    self startragdoll();
    return 1;
}

_id_5B55()
{
    if ( !isalive( self ) && isdefined( self._id_5B36.death ) )
    {
        if ( isdefined( self._id_5B36.animateddeath ) )
            self._id_2660 = ::_id_5B4D;
        else
            self._id_2660 = ::_id_5B4E;
    }
}

_id_5B56()
{
    if ( !isalive( self ) )
        return;

    if ( isdefined( self._id_5B36._id_6DB8 ) )
        _id_5B79();

    var_0 = self _meth_813E();

    if ( isdefined( var_0 ) )
        self _meth_81CA( var_0, self.angles );
    else
    {

    }
}

_id_5B58()
{
    if ( isdefined( self._id_5B36._id_4732 ) )
        self detach( "weapon_parabolic_knife", "TAG_INHAND", 1 );

    if ( isalive( self ) )
        _id_5B53();
}

_id_5B57()
{
    if ( isdefined( self._id_5B36._id_A1BF ) )
    {
        if ( self._id_5B36._id_A1BF )
            maps\_utility::_id_30D9();
        else
            maps\_utility::_id_2AC2();
    }

    if ( isdefined( self._id_5B36._id_A1C9 ) )
        maps\_utility::_id_7F71( self._id_5B36._id_A1C9 );
}

_id_5B54()
{
    _id_5B7C();
    _id_5B55();
    _id_5B56();
    _id_5B58();
    _id_5B57();

    if ( isdefined( self._id_5B36._id_66A5 ) )
        self._id_5B36._id_66A5 notify( "partner_end_melee" );

    _id_5B6A( self._id_5B36.target );
    _id_5B4B();
}

_id_5B38( var_0 )
{
    if ( isdefined( self._id_5B36 ) )
        return 0;

    if ( isdefined( var_0._id_5B36 ) )
        return 0;

    self._id_5B36 = spawnstruct();
    var_0._id_5B36 = spawnstruct();
    return 1;
}

_id_5B6A( var_0 )
{
    self._id_5B36 = undefined;

    if ( isdefined( var_0 ) )
        var_0._id_5B36 = undefined;
}

_id_5B68( var_0 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, "pain", self._id_35C7 );
}

_id_5B4B()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}
