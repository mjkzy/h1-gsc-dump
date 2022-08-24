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

_id_2743( var_0 )
{
    self endon( "killanimscript" );
    self notify( "stop_deciding_how_to_shoot" );
    self endon( "stop_deciding_how_to_shoot" );
    self endon( "death" );
    maps\_gameskill::_id_7450();
    self._id_840E = var_0;
    self._id_83F6 = undefined;
    self._id_840F = undefined;
    self._id_8415 = "none";
    self._id_3672 = 0;
    self._id_84A7 = undefined;

    if ( !isdefined( self._id_1C86 ) )
        self._id_1C86 = 0;

    var_1 = isdefined( self._id_22BA ) && self._id_22BA.type != "Cover Prone" && self._id_22BA.type != "Conceal Prone";

    if ( var_1 )
        wait 0.05;

    var_2 = self._id_83F6;
    var_3 = self._id_840F;
    var_4 = self._id_8415;

    if ( isdefined( self.has_ir ) )
    {
        self.a._id_54FB = 1;
        animscripts\shared::_id_9B2D();
    }

    if ( animscripts\combat_utility::issniper() )
        _id_745D();

    if ( var_1 && ( !self.a._id_0D83 || !animscripts\utility::_id_1AE1() ) )
        thread _id_A223();

    thread _id_76E6();
    self._id_0B69 = undefined;

    for (;;)
    {
        if ( isdefined( self._id_8411 ) )
        {
            if ( !isdefined( self.enemy ) )
            {
                self._id_840F = self._id_8411;
                self._id_8411 = undefined;
                _id_A003();
            }
            else
                self._id_8411 = undefined;
        }

        var_5 = undefined;

        if ( self.weapon == "none" )
            _id_6147();
        else if ( animscripts\utility::_id_9C36() )
            var_5 = _id_766E();
        else if ( animscripts\utility::_id_9C3A() || isdefined( self._id_0B0F ) )
            var_5 = _id_6830();
        else
            var_5 = _id_7510();

        if ( isdefined( self.a._id_8A36 ) )
            [[ self.a._id_8A36 ]]();

        if ( _id_1CF7( var_2, self._id_83F6 ) || !isdefined( self._id_83F6 ) && _id_1CF7( var_3, self._id_840F ) || _id_1CF7( var_4, self._id_8415 ) )
            self notify( "shoot_behavior_change" );

        var_2 = self._id_83F6;
        var_3 = self._id_840F;
        var_4 = self._id_8415;

        if ( !isdefined( var_5 ) )
            _id_A003();
    }
}

_id_A003()
{
    self endon( "enemy" );
    self endon( "done_changing_cover_pos" );
    self endon( "weapon_position_change" );
    self endon( "enemy_visible" );

    if ( isdefined( self._id_83F6 ) )
    {
        self._id_83F6 endon( "death" );
        self endon( "do_slow_things" );
        wait 0.05;

        while ( isdefined( self._id_83F6 ) )
        {
            if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
                self._id_840F = animscripts\combat_utility::_id_3DB2( self._id_83F6 );
            else
                self._id_840F = self._id_83F6 getshootatpos();

            wait 0.05;
        }
    }
    else
        self waittill( "do_slow_things" );
}

_id_6147()
{
    self._id_83F6 = undefined;
    self._id_840F = undefined;
    self._id_8415 = "none";
    self._id_840E = "normal";
}

_id_84B6()
{
    return !animscripts\combat_utility::issniper() && !animscripts\utility::_id_51A3( self.weapon );
}

_id_84A9()
{
    if ( !animscripts\utility::_id_1AE1() )
        return 0;

    return 1;
}

_id_7512()
{
    if ( !_id_84A9() )
    {
        if ( animscripts\combat_utility::issniper() )
            _id_745D();

        if ( self.doingambush )
        {
            self._id_840E = "ambush";
            return "retry";
        }

        if ( !isdefined( self.enemy ) )
            _id_4760();
        else
        {
            _id_59B1();

            if ( ( self.providecoveringfire || randomint( 5 ) > 0 ) && _id_84B6() )
                self._id_840E = "suppress";
            else
                self._id_840E = "ambush";

            return "retry";
        }
    }
    else
    {
        _id_8009();
        _id_800C();
    }
}

_id_7513( var_0 )
{
    if ( !var_0 )
        _id_4760();
    else
    {
        self._id_83F6 = undefined;
        self._id_840F = animscripts\utility::_id_3F7E();
        _id_800B();
    }
}

_id_7511( var_0 )
{
    self._id_8415 = "none";
    self._id_83F6 = undefined;

    if ( !var_0 )
    {
        _id_3EEF();

        if ( _id_84B4() )
        {
            self._id_0B69 = undefined;
            self notify( "return_to_cover" );
            self._id_84A7 = 1;
        }
    }
    else
    {
        self._id_840F = animscripts\utility::_id_3F7E();

        if ( _id_84B4() )
        {
            self._id_0B69 = undefined;

            if ( _id_84B6() )
                self._id_840E = "suppress";

            if ( randomint( 3 ) == 0 )
            {
                self notify( "return_to_cover" );
                self._id_84A7 = 1;
            }

            return "retry";
        }
    }
}

_id_3EEF()
{
    if ( isdefined( self.enemy ) && self _meth_81c2( self.enemy ) )
    {
        _id_8009();
        return;
    }

    var_0 = self _meth_8196();

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_22BA ) )
            var_0 = self._id_22BA.angles;
        else if ( isdefined( self._id_0B6A ) )
            var_0 = self._id_0B6A.angles;
        else
            var_0 = self.angles;
    }

    var_1 = 1024;

    if ( isdefined( self.enemy ) )
        var_1 = distance( self.origin, self.enemy.origin );

    var_2 = self geteye() + anglestoforward( var_0 ) * var_1;

    if ( !isdefined( self._id_840F ) || distancesquared( var_2, self._id_840F ) > 25 )
        self._id_840F = var_2;
}

_id_7510()
{
    if ( self._id_840E == "normal" )
        _id_7512();
    else
    {
        if ( _id_84A9() )
        {
            self._id_840E = "normal";
            self._id_0B69 = undefined;
            return "retry";
        }

        _id_59B1();

        if ( animscripts\combat_utility::issniper() )
            _id_745D();

        var_0 = animscripts\utility::_id_1AEF();

        if ( self._id_840E == "suppress" || self.team == "allies" && !isdefined( self.enemy ) && !var_0 )
            _id_7513( var_0 );
        else
            _id_7511( var_0 );
    }
}

_id_84B4()
{
    if ( !isdefined( self._id_0B69 ) )
    {
        if ( self _meth_813f() )
            self._id_0B69 = gettime() + randomintrange( 10000, 60000 );
        else
            self._id_0B69 = gettime() + randomintrange( 4000, 10000 );
    }

    return self._id_0B69 < gettime();
}

_id_766E()
{
    if ( !_id_84A9() )
    {
        _id_59B1();
        _id_4760();
        return;
    }

    _id_8009();
    _id_800A( "single", 0 );
    var_0 = lengthsquared( self.origin - self._id_840F );

    if ( var_0 < squared( 512 ) )
    {
        self notify( "return_to_cover" );
        self._id_84A7 = 1;
        return;
    }
}

_id_6830()
{
    if ( self._id_840E == "normal" )
    {
        if ( !_id_84A9() )
        {
            if ( !isdefined( self.enemy ) )
            {
                _id_4760();
                return;
            }
            else
            {
                _id_59B1();
                self._id_840E = "ambush";
                return "retry";
            }
        }
        else
        {
            _id_8009();
            _id_800A( "single", 0 );
        }
    }
    else
    {
        if ( _id_84A9() )
        {
            self._id_840E = "normal";
            self._id_0B69 = undefined;
            return "retry";
        }

        _id_59B1();
        self._id_83F6 = undefined;
        self._id_8415 = "none";
        self._id_840F = animscripts\utility::_id_3F7E();

        if ( !isdefined( self._id_0B69 ) )
            self._id_0B69 = gettime() + randomintrange( 4000, 8000 );

        if ( self._id_0B69 < gettime() )
        {
            self._id_840E = "normal";
            self._id_0B69 = undefined;
            return "retry";
        }
    }
}

_id_59B1()
{
    if ( isdefined( self.enemy ) && !self._id_1C86 && self.script != "combat" )
    {
        if ( isai( self.enemy ) && isdefined( self.enemy.script ) && ( self.enemy.script == "cover_stand" || self.enemy.script == "cover_crouch" ) )
        {
            if ( isdefined( self.enemy.a._id_22AB ) && self.enemy.a._id_22AB == "hide" )
                return;
        }

        self._id_223B = self.enemy.origin;
    }
}

_id_A223()
{
    self endon( "killanimscript" );
    self endon( "stop_deciding_how_to_shoot" );

    for (;;)
    {
        self waittill( "suppression" );

        if ( self.suppressionmeter > self._id_8FEC )
        {
            if ( _id_71E7() )
            {
                self notify( "return_to_cover" );
                self._id_84A7 = 1;
            }
        }
    }
}

_id_71E7()
{
    if ( self._id_1C86 )
        return 0;

    if ( !isdefined( self.enemy ) || !self _meth_81c2( self.enemy ) )
        return 1;

    if ( gettime() < self._id_22BC + 800 )
        return 0;

    if ( isplayer( self.enemy ) && self.enemy.health < self.enemy.maxhealth * 0.5 )
    {
        if ( gettime() < self._id_22BC + 3000 )
            return 0;
    }

    return 1;
}

_id_76E6()
{
    self endon( "death" );
    common_scripts\utility::_id_A069( "killanimscript", "stop_deciding_how_to_shoot" );
    self.a._id_54FB = 0;
    animscripts\shared::_id_9B2D();
}

_id_1CF7( var_0, var_1 )
{
    if ( isdefined( var_0 ) != isdefined( var_1 ) )
        return 1;

    if ( !isdefined( var_1 ) )
        return 0;

    return var_0 != var_1;
}

_id_8009()
{
    self._id_83F6 = self.enemy;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
    {
        if ( isdefined( self._id_32A0 ) && self._id_32A0 == self.enemy )
            self._id_840F = self._id_83F6 getshootatpos();
        else
            self._id_840F = animscripts\combat_utility::_id_3DB2( self._id_83F6 );
    }
    else
        self._id_840F = self._id_83F6 getshootatpos();
}

_id_4760()
{
    self._id_83F6 = undefined;
    self._id_840F = undefined;
    self._id_8415 = "none";

    if ( self.doingambush )
        self._id_840E = "ambush";

    if ( !self._id_1C86 )
    {
        self notify( "return_to_cover" );
        self._id_84A7 = 1;
    }
}

_id_8486()
{
    return level._id_3BFE == 3 && isplayer( self.enemy );
}

_id_800C()
{
    if ( isdefined( self._id_83F6.enemy ) && isdefined( self._id_83F6.enemy.syncedmeleetarget ) )
        return _id_800A( "single", 0 );

    if ( animscripts\combat_utility::issniper() )
        return _id_800A( "single", 0 );

    if ( animscripts\utility::_id_51A3( self.weapon ) )
        return _id_800A( "single", 0 );

    if ( weaponclass( self.weapon ) == "grenade" )
        return _id_800A( "single", 0 );

    if ( weaponburstcount( self.weapon ) > 0 )
        return _id_800A( "burst", 0 );

    if ( isdefined( self._id_529C ) && self._id_529C || isdefined( self._id_5A7A ) && self._id_5A7A )
        return _id_800A( "full", 1 );

    var_0 = distancesquared( self getshootatpos(), self._id_840F );
    var_1 = weaponclass( self.weapon ) == "mg";

    if ( var_1 )
        return _id_800A( "full", 0 );

    if ( var_0 < 90000 )
    {
        if ( isdefined( self._id_83F6 ) && isdefined( self._id_83F6._id_58D7 ) )
            return _id_800A( "single", 0 );
        else
            return _id_800A( "full", 0 );
    }
    else if ( var_0 < 810000 || _id_8486() )
        return _id_800A( "burst", 1 );
    else if ( self.providecoveringfire || var_1 || var_0 < 2560000 )
    {
        if ( _id_8491() )
            return _id_800A( "semi", 0 );
        else
            return _id_800A( "burst", 0 );
    }

    return _id_800A( "single", 0 );
}

_id_800B()
{
    var_0 = distancesquared( self getshootatpos(), self._id_840F );

    if ( weaponissemiauto( self.weapon ) )
    {
        if ( var_0 < 2560000 )
            return _id_800A( "semi", 0 );

        return _id_800A( "single", 0 );
    }

    if ( weaponclass( self.weapon ) == "mg" )
        return _id_800A( "full", 0 );

    if ( self.providecoveringfire || var_0 < 1690000 )
    {
        if ( _id_8491() )
            return _id_800A( "semi", 0 );
        else
            return _id_800A( "burst", 0 );
    }

    return _id_800A( "single", 0 );
}

_id_800A( var_0, var_1 )
{
    self._id_8415 = var_0;
    self._id_3672 = var_1;
}

_id_8491()
{
    if ( weaponclass( self.weapon ) != "rifle" )
        return 0;

    if ( self.team != "allies" )
        return 0;

    var_0 = animscripts\utility::_id_77CB( int( self.origin[1] ), 10000 ) + 2000;
    var_1 = int( self.origin[0] ) + gettime();
    return var_1 % 2 * var_0 > var_0;
}

_id_745D()
{
    self._id_8832 = 0;
    self._id_8803 = 0;
    thread _id_87D5();
}

_id_87D5()
{
    self endon( "killanimscript" );
    self endon( "enemy" );
    self endon( "return_to_cover" );
    self notify( "new_glint_thread" );
    self endon( "new_glint_thread" );

    if ( isdefined( self._id_2ACF ) && self._id_2ACF )
        return;

    if ( !isdefined( level._effect["sniper_glint"] ) )
        return;

    if ( !isalive( self.enemy ) )
        return;

    var_0 = common_scripts\utility::_id_3FA8( "sniper_glint" );
    wait 0.2;

    for (;;)
    {
        if ( self.weapon == self.primaryweapon && animscripts\combat_utility::_id_6BFF() )
        {
            if ( distancesquared( self.origin, self.enemy.origin ) > 65536 )
                playfxontag( var_0, self, "tag_flash" );

            var_1 = randomfloatrange( 3, 5 );
            wait(var_1);
        }

        wait 0.2;
    }
}
