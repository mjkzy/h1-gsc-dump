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

_id_4492( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self.vehicletype ) )
        return;

    var_2 = self.classname;
    var_3 = level._id_9C82[var_2];
    var_4 = level._id_9C82[var_2].size;
    self._id_0DF4[self._id_0DF4.size] = var_0;
    var_5 = _id_7E9F( var_0, var_4 );

    if ( !isdefined( var_5 ) )
        return;

    if ( var_5 == 0 )
        var_0._id_2E18 = 1;

    var_6 = _id_0BE9( self, var_5 );
    self._id_9BFD[var_5] = 1;
    var_0._id_9D1B = var_5;
    var_0._id_9CE7 = 0;

    if ( isdefined( var_6._id_27C0 ) )
    {
        var_0._id_27C0 = var_6._id_27C0;

        if ( isdefined( var_6._id_27E8 ) )
            self._id_27E6 = var_0._id_27C0;
    }

    if ( isdefined( var_6._id_27E8 ) )
    {
        self._id_27E6 += var_6._id_27E8;
        var_0._id_27C0 = self._id_27E6;
    }

    var_0._id_750E = self;
    var_0._id_6587 = var_0.health;
    var_0._id_9CE4 = var_6._id_4B63;
    var_0._id_9D48 = var_6._id_8B05;

    if ( isdefined( var_6._id_612E ) )
        var_0.a._id_612E = 1;

    var_0._id_2642 = var_6._id_2642;
    var_0._id_5C3B = var_6._id_5C3B;
    var_0._id_2653 = var_6._id_2667;
    var_0._id_8B09 = 0;

    if ( isdefined( var_6._id_4068 ) )
    {
        var_0._id_3E0A = getanimlength( var_6._id_4068 );
        var_0._id_3E08 = var_6._id_4068;

        if ( isdefined( var_6.getout_ik ) )
            var_0.getout_ik = 1;
    }

    var_0.allowdeath = 0;

    if ( isdefined( var_0._id_2652 ) && !isdefined( var_0._id_58D7 ) )
        var_0.allowdeath = 1;

    if ( isdefined( var_6.death ) )
        thread _id_4487( var_0, var_6 );

    if ( !isdefined( var_0._id_9CE4 ) )
        var_0.allowdeath = 1;

    self._id_750A[self._id_750A.size] = var_0;

    if ( var_0.classname != "script_model" && maps\_utility::_id_88F1( var_0 ) )
        return;

    var_7 = _id_9C8A( var_6 );
    var_8 = _id_9C89( var_6 );
    _id_5781( var_0, var_6._id_85AE, var_6._id_85AF, var_6._id_579D, var_6._id_85B0, var_6._id_5BD5 );

    if ( isai( var_0 ) )
    {
        var_0 _meth_81c9( var_7, var_8 );
        var_0.a._id_2B19 = var_0.a._id_2B18;
        var_0.a._id_2B18 = 1;

        if ( isdefined( var_6._id_1433 ) && !var_6._id_1433 )
            var_0 maps\_utility::_id_4462();

        if ( _id_44AF( var_6 ) )
            thread _id_44A4( var_0, var_5, var_1 );
    }
    else
    {
        if ( isdefined( var_6._id_1433 ) && !var_6._id_1433 )
            _id_297A( var_0, "weapon_" );

        var_0.origin = var_7;
        var_0.angles = var_8;
    }

    if ( var_5 == 0 && isdefined( var_3[0].death ) )
        thread _id_2E07( var_0 );

    self notify( "guy_entered", var_0, var_5 );
    thread _id_449A( var_0, var_5 );

    if ( isdefined( var_6._id_7508 ) )
        var_0 [[ var_6._id_7508 ]]();
    else
    {
        if ( isdefined( self._id_667F ) )
            var_0._id_667F = 1;

        if ( isdefined( var_6._id_3FD4 ) )
        {
            thread [[ var_6._id_3FD4 ]]( var_0, var_5 );
            return;
        }

        thread _id_449B( var_0, var_5 );
    }
}

_id_9C8A( var_0 )
{
    var_1 = self;

    if ( isdefined( var_0._id_85B0 ) && var_0._id_85B0 )
        var_1 = self._id_5BD5[var_0._id_5BD5];

    return var_1 gettagorigin( var_0._id_85AE );
}

_id_9C89( var_0 )
{
    var_1 = self;

    if ( isdefined( var_0._id_85B0 ) && var_0._id_85B0 )
        var_1 = self._id_5BD5[var_0._id_5BD5];

    return var_1 gettagangles( var_0._id_85AE );
}

_id_9C85()
{
    if ( !isdefined( self._id_7931 ) )
        return 0;

    return self._id_7931;
}

_id_9C86()
{
    if ( !isdefined( self._id_7933 ) )
        return 1;

    return self._id_7933;
}

_id_44AF( var_0 )
{
    if ( !isdefined( var_0._id_5BD5 ) )
        return 0;

    if ( !isdefined( self._id_7A81 ) )
        return 1;

    return !self._id_7A81;
}

_id_451F()
{
    var_0 = self.classname;
    self._id_0DF4 = [];

    if ( !( isdefined( level._id_9C82 ) && isdefined( level._id_9C82[var_0] ) ) )
        return;

    var_1 = level._id_9C82[var_0].size;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "ai_wait_go" )
        thread _id_0935();

    self._id_76E4 = [];
    self._id_9BFD = [];
    self._id_3FD7 = [];
    self._id_27E6 = 0;
    var_2 = level._id_9C82[var_0];

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self._id_9BFD[var_3] = 0;

        if ( isdefined( self._id_7A81 ) && self._id_7A81 && isdefined( var_2[var_3]._id_1484 ) && var_2[var_3]._id_1484 )
            self._id_9BFD[1] = 1;
    }
}

_id_57C0( var_0 )
{
    _id_57BF( var_0, 1 );
}

_id_4487( var_0, var_1 )
{
    waitframe;
    var_0 setcandamage( 1 );
    var_0 endon( "death" );
    var_0.allowdeath = 0;
    var_0.health = 10150;

    if ( isdefined( var_0._id_7ADB ) )
        var_0.health += var_0._id_7ADB;

    var_0 endon( "jumping_out" );

    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
    {
        while ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
            wait 0.05;
    }

    while ( var_0.health > 10000 )
        var_0 waittill( "damage" );

    thread _id_448A( var_0, var_1 );
}

_id_448A( var_0, var_1 )
{
    var_2 = gettime() + getanimlength( var_1.death ) * 1000;
    var_3 = var_0.angles;
    var_4 = var_0.origin;
    var_0 = _id_21A2( var_0 );
    [[ level._id_422E ]]( "MOD_RIFLE_BULLET", "torso_upper", var_4 );
    _id_297A( var_0, "weapon_" );
    var_0 linkto( self, var_1._id_85AE, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 notsolid();
    thread _id_0C74( var_0, var_1._id_85AE, var_1.death );

    if ( !isdefined( var_1._id_2640 ) )
        var_0 waittillmatch( "animontagdone", "start_ragdoll" );
    else
    {
        var_0 unlink();
        var_0 startragdoll();
        wait(var_1._id_2640);
        var_0 delete();
        return;
    }

    var_0 unlink();

    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        var_0 delete();
        return;
    }

    while ( gettime() < var_2 && !var_0 isragdoll() )
    {
        var_0 startragdoll();
        wait 0.05;
    }

    if ( !var_0 isragdoll() )
        var_0 delete();
}

_id_57BF( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = _id_9CCC();

    maps\_utility::_id_32DA( "unloaded" );
    maps\_utility::_id_32DA( "loaded" );
    common_scripts\utility::_id_0CF0( var_0, ::_id_3DA8, var_1, var_2 );
}

_id_5077( var_0 )
{
    for ( var_1 = 0; var_1 < self._id_750A.size; var_1++ )
    {
        if ( self._id_750A[var_1] == var_0 )
            return 1;
    }

    return 0;
}

_id_9CCC()
{
    var_0 = [];
    var_1 = getaiarray( self._id_7AEF );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3._id_7B19 ) )
            continue;

        if ( var_3._id_7B19 != self._id_7B19 )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_3DE1()
{
    var_0 = [];
    var_1 = maps\_vehicle::get_script_vehicles();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3._id_7B19 ) )
            continue;

        if ( var_3._id_7B19 != self._id_7B19 )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0[0];
}

_id_3DA8( var_0, var_1, var_2 )
{
    if ( _id_5077( var_0 ) )
        return;

    if ( !_id_454B() )
        return;

    _id_44AC( var_0, self, var_1, var_2 );
}

_id_454B()
{
    if ( _id_9CDF() )
        return 1;
}

_id_9CDF()
{
    if ( level._id_9C82[self.classname].size - self._id_76E4.size )
        return 1;
    else
        return 0;
}

_id_44AE( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "stop_loading" );
    var_2 = var_0 common_scripts\utility::_id_A070( "long_death", "death", "enteredvehicle" );

    if ( var_2 != "enteredvehicle" && isdefined( var_0._id_39B7 ) )
        var_1._id_9BFD[var_0._id_39B7] = 0;

    var_1._id_76E4 = common_scripts\utility::_id_0CF6( var_1._id_76E4, var_0 );
    _id_9D07( var_1 );
}

_id_9D07( var_0 )
{
    if ( isdefined( var_0.vehicletype ) && isdefined( var_0._id_9D08 ) )
    {
        if ( var_0._id_750A.size == var_0._id_9D08 )
            var_0 maps\_utility::_id_32DE( "loaded" );
    }
    else if ( !var_0._id_76E4.size && var_0._id_750A.size )
    {
        if ( var_0._id_9BFD[0] )
            var_0 maps\_utility::_id_32DE( "loaded" );
        else
            var_0 thread _id_9D1D();
    }
}

_id_9D1D()
{
    var_0 = self._id_750A;
    maps\_vehicle::_id_9D67();
    maps\_utility::_id_32E0( "unloaded" );
    var_0 = maps\_utility::_id_0CFD( var_0 );
    thread maps\_vehicle::_id_9D05( var_0 );
}

_id_736A( var_0 )
{
    common_scripts\utility::_id_A069( "unload", "death" );
    var_0 maps\_utility::_id_8EA4();
}

_id_44AC( var_0, var_1, var_2, var_3 )
{
    var_1 endon( "stop_loading" );
    var_4 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_5 = level._id_9C82[var_1.classname];

    if ( isdefined( var_1._id_76EA ) )
    {
        var_1 thread [[ var_1._id_76EA ]]( var_0 );
        return;
    }

    var_1 endon( "death" );
    var_0 endon( "death" );
    var_1._id_76E4[var_1._id_76E4.size] = var_0;
    thread _id_44AE( var_0, var_1 );
    var_6 = [];
    var_7 = undefined;
    var_8 = 0;
    var_9 = 0;

    for ( var_10 = 0; var_10 < var_5.size; var_10++ )
    {
        if ( isdefined( var_5[var_10]._id_3FD2 ) )
            var_9 = 1;
    }

    if ( !var_9 )
    {
        var_0 notify( "enteredvehicle" );
        var_1 _id_4492( var_0, var_4 );
        return;
    }

    if ( !isdefined( var_0._id_3DA7 ) )
    {
        while ( var_1 vehicle_getspeed() > 1 )
            wait 0.05;
    }

    var_11 = var_1 _id_3CCF( var_3 );

    if ( isdefined( var_0._id_7ADC ) )
        var_7 = var_1 _id_9CD4( var_0._id_7ADC );
    else if ( !var_1._id_9BFD[0] )
    {
        var_7 = var_1 _id_9CD4( 0 );

        if ( var_2 )
        {
            var_0 thread maps\_utility::_id_58D7();
            thread _id_736A( var_0 );
        }
    }
    else if ( var_11._id_1174.size )
        var_7 = common_scripts\utility::_id_3F33( var_0.origin, var_11._id_1174 );
    else
        var_7 = undefined;

    if ( !var_11._id_1174.size && var_11._id_6151.size )
    {
        var_0 notify( "enteredvehicle" );
        var_1 _id_4492( var_0, var_4 );
        return;
    }
    else if ( !isdefined( var_7 ) )
        return;

    var_8 = var_7.origin;
    var_12 = var_7.angles;
    var_0._id_39B7 = var_7._id_9D1B;
    var_1._id_9BFD[var_7._id_9D1B] = 1;
    var_0._id_7A40 = 1;
    var_0 notify( "stop_going_to_node" );
    var_0 maps\_utility::_id_7E3F();
    var_0 maps\_utility::_id_2A7A();
    var_0.goalradius = 16;
    var_0 _meth_81aa( var_8 );
    var_0 waittill( "goal" );
    var_0 maps\_utility::_id_30A1();
    var_0 maps\_utility::_id_9A61();
    var_0 notify( "boarding_vehicle" );
    var_13 = _id_0BE9( var_1, var_7._id_9D1B );

    if ( isdefined( var_13._id_27C0 ) )
    {
        var_0._id_27C0 = var_13._id_27C0;

        if ( isdefined( var_13._id_27E8 ) )
            self._id_27E6 = var_0._id_27C0;
    }

    if ( isdefined( var_13._id_27E8 ) )
    {
        self._id_27E6 += var_13._id_27E8;
        var_0._id_27C0 = self._id_27E6;
    }

    var_1 _id_5781( var_0, var_13._id_85AE, var_13._id_85AF, var_13._id_579D );
    var_0.allowdeath = 0;
    var_13 = var_5[var_7._id_9D1B];

    if ( isdefined( var_7 ) )
    {
        if ( isdefined( var_13._id_9CD0 ) )
        {
            if ( isdefined( var_13._id_9CD5 ) )
            {
                var_14 = isdefined( var_0._id_6114 );

                if ( !var_14 )
                    var_1 _meth_8144( var_13._id_9CD5, 0 );
            }

            var_1 = var_1 _id_3EFA();
            var_1 thread _id_7F22( var_13._id_9CD0, var_13._id_9CD1 );
            level thread maps\_anim::_id_8C17( var_1, "vehicle_anim_flag" );
        }

        if ( isdefined( var_13._id_9CD3 ) )
            var_8 = var_1 gettagorigin( var_13._id_9CD3 );
        else
            var_8 = var_1.origin;

        if ( isdefined( var_13._id_9CD2 ) )
            thread common_scripts\utility::_id_69C2( var_13._id_9CD2, var_8 );

        var_15 = undefined;
        var_16 = undefined;

        if ( isdefined( var_13._id_3FD3 ) )
        {
            var_15 = [];
            var_15[0] = var_13._id_3FD3;
            var_16 = [];
            var_16[0] = ::_id_3306;
            var_1 _id_5781( var_0, var_13._id_85AE, var_13._id_85AF, var_13._id_579D );
        }

        var_1 _id_0C74( var_0, var_13._id_85AE, var_13._id_3FD2, var_15, var_16 );
    }

    var_0 notify( "enteredvehicle" );
    var_1 _id_4492( var_0, var_4 );
}

_id_3306()
{
    self notify( "enteredvehicle" );
}

_id_2E07( var_0 )
{
    if ( maps\_vehicle::_id_5118() )
        return;

    self._id_2E04 = var_0;
    self endon( "death" );
    var_0 endon( "jumping_out" );
    var_0 waittill( "death" );

    if ( isdefined( self._id_9CED ) )
        return;

    self notify( "driver dead" );
    self._id_2639 = 1;

    if ( isdefined( self._id_4746 ) && self._id_4746 )
    {
        self setwaitspeed( 0 );
        self vehicle_setspeed( 0, 10 );
        self waittill( "reached_wait_speed" );
    }

    maps\_vehicle::_id_9D67();
}

_id_21D5()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( self.model );
    var_1 = self getattachsize();

    for ( var_2 = 0; var_2 < var_1; var_2++ )
        var_0 attach( self getattachmodelname( var_2 ) );

    return var_0;
}

_id_4482( var_0, var_1 )
{
    if ( isai( var_0 ) )
        return var_0;

    if ( var_0._id_2E3F == 1 )
        var_0 delete();
    else
    {
        var_0 = maps\_utility::_id_9007( var_0 );
        var_2 = self.classname;
        var_3 = level._id_9C82[var_2].size;
        var_4 = _id_0BE9( self, var_1 );
        _id_5781( var_0, var_4._id_85AE, var_4._id_85AF, var_4._id_579D );
        var_0._id_9CE4 = var_4._id_4B63;
        thread _id_449B( var_0, var_1 );
    }
}

_id_5781( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self;

    if ( isdefined( var_4 ) && var_4 )
        var_6 = self._id_5BD5[var_5];

    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( var_3 && !isdefined( var_0._id_79AD ) )
        var_0 linktoblendtotag( var_6, var_1, 0 );
    else
        var_0 linkto( var_6, var_1, var_2, ( 0.0, 0.0, 0.0 ) );
}

_id_0BE9( var_0, var_1 )
{
    return level._id_9C82[var_0.classname][var_1];
}

_id_4489( var_0, var_1 )
{
    var_0 waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self._id_750A = common_scripts\utility::_id_0CF6( self._id_750A, var_0 );
    self._id_9BFD[var_1] = 0;
}

_id_8045()
{
    if ( !isdefined( level._id_9C83 ) )
        level._id_9C83 = [];

    if ( !isdefined( level._id_9C81 ) )
        level._id_9C81 = [];

    level._id_9C83["idle"] = ::_id_449B;
    level._id_9C83["duck"] = ::_id_448D;
    level._id_9C83["duck_once"] = ::_id_448F;
    level._id_9C81["duck_once"] = ::_id_4490;
    level._id_9C83["weave"] = ::_id_44C5;
    level._id_9C81["weave"] = ::_id_44C6;
    level._id_9C83["turn_right"] = ::_id_44B9;
    level._id_9C81["turn_right"] = ::_id_44BA;
    level._id_9C83["turn_left"] = ::_id_44B7;
    level._id_9C81["turn_left"] = ::_id_44BA;
    level._id_9C83["turn_hardright"] = ::_id_44B6;
    level._id_9C83["turn_hardleft"] = ::_id_44B5;
    level._id_9C83["turret_fire"] = ::_id_44BB;
    level._id_9C83["turret_turnleft"] = ::_id_44BC;
    level._id_9C83["turret_turnright"] = ::_id_44BD;
    level._id_9C83["unload"] = ::_id_44BF;
    level._id_9C83["pre_unload"] = ::_id_44A8;
    level._id_9C81["pre_unload"] = ::_id_44A9;
    level._id_9C83["idle_alert"] = ::_id_449C;
    level._id_9C81["idle_alert"] = ::_id_449D;
    level._id_9C83["idle_alert_to_casual"] = ::_id_449E;
    level._id_9C81["idle_alert_to_casual"] = ::_id_449F;
    level._id_9C83["reaction"] = ::_id_44BD;
}

_id_449A( var_0, var_1 )
{
    var_0._id_9CE7 = 1;
    thread _id_4489( var_0, var_1 );
}

_id_44B1( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_0._id_8B09 = 1;
    var_3 = 0;

    for (;;)
    {
        var_4 = gettime() + 2000;

        while ( gettime() < var_4 && isdefined( var_0.enemy ) )
            _id_0C74( var_0, var_2._id_85AE, var_0._id_9D48, undefined, undefined, "firing" );

        var_5 = randomint( 5 ) + 10;

        for ( var_6 = 0; var_6 < var_5; var_6++ )
            _id_0C74( var_0, var_2._id_85AE, var_2._id_8B07 );
    }
}

_id_44B2( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );

    if ( !isdefined( var_2._id_8B06 ) )
    {
        thread _id_44B1( var_0, var_1 );
        return;
    }

    _id_0C74( var_0, var_2._id_85AE, var_2._id_8B06 );
    var_0._id_8B09 = 0;
    thread _id_449B( var_0, var_1 );
}

_id_2E05( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    for (;;)
    {
        if ( self vehicle_getspeed() == 0 )
            var_0._id_9CE4 = var_2._id_4B6A;
        else
            var_0._id_9CE4 = var_2._id_4B66;

        wait 0.25;
    }
}

_id_44AA( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );

    if ( isdefined( var_2._id_717C ) )
        _id_0C74( var_0, var_2._id_85AE, var_2._id_717C );

    thread _id_449B( var_0, var_1 );
}

_id_44BC( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
        _id_0C74( var_0, var_2._id_85AE, var_0._id_999D );
}

_id_44BD( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    for (;;)
        _id_0C74( var_0, var_2._id_85AE, var_0._id_999D );
}

_id_44BB( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_9D5F ) )
        maps\_vehicle_code::_id_05B3() _meth_814f( var_2._id_9D5F );

    if ( isdefined( var_2.turret_fire ) )
    {
        if ( isdefined( var_2._id_9959 ) )
            _id_0C74( var_0, var_2._id_9959, var_2.turret_fire );
        else
            _id_0C74( var_0, var_2._id_85AE, var_2.turret_fire );
    }

    thread _id_449B( var_0, var_1 );
}

_id_449B( var_0, var_1, var_2 )
{
    var_0 endon( "newanim" );

    if ( !isdefined( var_2 ) )
        self endon( "death" );

    var_0 endon( "death" );
    var_0._id_9CE7 = 1;
    var_0 notify( "gotime" );

    if ( !isdefined( var_0._id_9CE4 ) )
        return;

    var_3 = _id_0BE9( self, var_1 );

    if ( isdefined( var_3._id_5BD5 ) )
        return;

    if ( isdefined( var_3._id_4879 ) && var_3._id_4879 )
        var_0 hide();

    if ( isdefined( var_3._id_4B6A ) && isdefined( var_3._id_4B66 ) )
        thread _id_2E05( var_0, var_1 );

    for (;;)
    {
        var_0 notify( "idle" );
        _id_6984( var_0, var_3 );
    }
}

_id_6984( var_0, var_1 )
{
    if ( isdefined( var_0._id_9CE5 ) )
    {
        _id_0C74( var_0, var_1._id_85AE, var_0._id_9CE5 );
        return;
    }

    if ( isdefined( var_1._id_4B7E ) )
    {
        var_2 = _id_712A( var_0, var_1._id_4B7E );
        _id_0C74( var_0, var_1._id_85AE, var_0._id_9CE4[var_2] );
        return;
    }

    if ( isdefined( var_0._id_6D23 ) && isdefined( var_1._id_6B52 ) )
    {
        _id_0C74( var_0, var_1._id_85AE, var_1._id_6B52 );
        return;
    }

    if ( isdefined( var_1._id_9CE4 ) )
        thread _id_7F22( var_1._id_9CE4 );

    _id_0C74( var_0, var_1._id_85AE, var_0._id_9CE4 );
}

_id_712A( var_0, var_1 )
{
    var_2 = [];
    var_3 = 0;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_3 += var_1[var_4];
        var_2[var_4] = var_3;
    }

    var_5 = randomint( var_3 );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( var_5 < var_2[var_4] )
            return var_4;
    }
}

_id_4490( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_2FB6 );
}

_id_448F( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_2FB6 ) )
    {
        if ( isdefined( var_2._id_9CBE ) )
            thread _id_7F22( var_2._id_9CBE );

        _id_0C74( var_0, var_2._id_85AE, var_2._id_2FB6 );
    }

    thread _id_449B( var_0, var_1 );
}

_id_44C6( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_A2F7 );
}

_id_44C5( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_A2F7 ) )
    {
        if ( isdefined( var_2._id_9D6C ) )
            thread _id_7F22( var_2._id_9D6C );

        _id_0C74( var_0, var_2._id_85AE, var_2._id_A2F7 );
    }

    thread _id_449B( var_0, var_1 );
}

_id_448D( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_2FBD ) )
        _id_0C74( var_0, var_2._id_85AE, var_2._id_2FBD );

    thread _id_448E( var_0, var_1 );
}

_id_448E( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );
    var_3 = _id_712A( var_0, var_2._id_2FBC );

    for (;;)
        _id_0C74( var_0, var_2._id_85AE, var_2._id_2FBB[var_3] );
}

_id_4491( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_2FBE ) && var_0._id_2FBE )
    {
        _id_0C74( var_0, var_2._id_85AE, var_2._id_2FBF );
        var_0._id_2FBE = 0;
    }

    thread _id_449B( var_0, var_1 );
}

_id_44C1( var_0 )
{
    self endon( "death" );
    self._id_9A44 = common_scripts\utility::_id_0CDA( self._id_9A44, var_0 );
    var_0 common_scripts\utility::_id_A069( "death", "jumpedout" );
    self._id_9A44 = common_scripts\utility::_id_0CF6( self._id_9A44, var_0 );

    if ( !self._id_9A44.size )
    {
        maps\_utility::_id_32DE( "unloaded" );
        self._id_9A3C = "default";
    }
}

_id_750C( var_0 )
{
    if ( !self._id_750A.size )
        return 0;

    for ( var_1 = 0; var_1 < self._id_750A.size; var_1++ )
    {
        if ( !isalive( self._id_750A[var_1] ) )
            continue;

        if ( _id_1CEC( self._id_750A[var_1]._id_9D1B, var_0 ) )
            return 1;
    }

    return 0;
}

_id_3EAE()
{
    var_0 = [];
    var_1 = [];
    var_2 = "default";

    if ( isdefined( self._id_9A3C ) )
        var_2 = self._id_9A3C;

    var_1 = level._id_9D69[self.classname][var_2];

    if ( !isdefined( var_1 ) )
        var_1 = level._id_9D69[self.classname]["default"];

    if ( isdefined( var_1 ) )
    {
        foreach ( var_4 in var_1 )
            var_0[var_4] = var_4;
    }

    return var_0;
}

_id_1CEC( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self._id_9A3C;

    var_2 = self.classname;

    if ( !isdefined( level._id_9D69[var_2] ) )
        return 1;

    if ( !isdefined( level._id_9D69[var_2][var_1] ) )
        return 1;

    var_3 = level._id_9D69[var_2][var_1];

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_0 == var_3[var_4] )
            return 1;
    }

    return 0;
}

_id_4074( var_0, var_1, var_2 )
{
    self endon( "unloading" );

    for (;;)
        _id_0C74( var_0, var_1, var_2 );
}

_id_4073( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self.classname;

    if ( var_4 )
    {
        thread _id_4074( var_1, var_2, level._id_9C8D[var_5][var_0._id_3680]._id_4B79 );
        self waittill( "unloading" );
    }

    self._id_9A44 = common_scripts\utility::_id_0CDA( self._id_9A44, var_1 );
    thread _id_4070( var_1, var_2, var_3 );

    if ( !isdefined( self._id_235D ) )
        _id_0C74( var_1, var_2, var_3 );

    var_1 unlink();

    if ( !isdefined( self ) )
    {
        var_1 delete();
        return;
    }

    self._id_9A44 = common_scripts\utility::_id_0CF6( self._id_9A44, var_1 );

    if ( !self._id_9A44.size )
        self notify( "unloaded" );

    self._id_3680[var_0._id_3680] = undefined;
    wait 10;
    var_1 delete();
}

_id_4072()
{
    wait 0.05;

    while ( isalive( self ) && self._id_9A44.size > 2 )
        wait 0.05;

    if ( !isalive( self ) || isdefined( self._id_235D ) && self._id_235D )
        return;

    self notify( "getoutrig_disable_abort" );
}

_id_4071()
{
    self endon( "end_getoutrig_abort_while_deploying" );

    while ( !isdefined( self._id_235D ) )
        wait 0.05;

    common_scripts\utility::_id_0CF0( self._id_750A, maps\_utility::_id_284E );
    self notify( "crashed_while_deploying" );
}

_id_4070( var_0, var_1, var_2 )
{
    var_3 = getanimlength( var_2 );
    var_4 = var_3 - 1.0;

    if ( self.vehicletype == "mi17" )
        var_4 = var_3 - 0.5;

    var_5 = 2.5;
    self endon( "getoutrig_disable_abort" );
    thread _id_4072();
    thread _id_4071();
    common_scripts\utility::_id_A0A0( "crashed_while_deploying", var_5 );
    self notify( "end_getoutrig_abort_while_deploying" );

    while ( !isdefined( self._id_235D ) )
        wait 0.05;

    thread _id_0C74( var_0, var_1, var_2 );
    waitframe;
    var_0 setanimtime( var_2, var_4 / var_3 );
    var_6 = self;

    if ( isdefined( self._id_06E0 ) )
        var_6 = self._id_06E0;

    for ( var_7 = 0; var_7 < self._id_750A.size; var_7++ )
    {
        if ( !isdefined( self._id_750A[var_7] ) )
            continue;

        if ( !isdefined( self._id_750A[var_7]._id_70DB ) )
            continue;

        if ( self._id_750A[var_7]._id_70DB != 1 )
            continue;

        if ( !isdefined( self._id_750A[var_7]._id_750E ) )
            continue;

        self._id_750A[var_7]._id_39BF = 1;

        if ( isalive( self._id_750A[var_7] ) )
            thread _id_0C76( self._id_750A[var_7], self, var_6 );
    }
}

_id_7F22( var_0, var_1 )
{
    self endon( "death" );
    self endon( "dont_clear_anim" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = getanimlength( var_0 );
    var_3 = maps\_vehicle_code::_id_05B3();
    var_3 endon( "death" );
    var_3 setflaggedanimrestart( "vehicle_anim_flag", var_0, 1, 0, 1 );
    wait(var_2);

    if ( var_1 && ( !isdefined( self._id_2D1D ) || !self._id_2D1D ) )
        var_3 _meth_8144( var_0, 0 );
}
#using_animtree("generic_human");

_id_406B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = self.classname;
    var_4 = _id_0BE9( self, var_1 );

    if ( isdefined( self._id_0DE8 ) && isdefined( self._id_0DE8[var_4._id_3680] ) )
        var_5 = 1;
    else
        var_5 = 0;

    if ( !isdefined( var_4._id_3680 ) || isdefined( self._id_3680[var_4._id_3680] ) || var_5 )
        return;

    var_6 = var_0 gettagorigin( level._id_9C8D[var_3][var_4._id_3680].tag );
    var_7 = var_0 gettagangles( level._id_9C8D[var_3][var_4._id_3680].tag );
    self._id_3681[var_4._id_3680] = 1;
    var_8 = spawn( "script_model", var_6 );
    var_8.angles = var_7;
    var_8.origin = var_6;
    var_8 setmodel( level._id_9C8D[var_3][var_4._id_3680].model );
    self._id_3680[var_4._id_3680] = var_8;
    var_8 useanimtree( #animtree );
    var_8 linkto( var_0, level._id_9C8D[var_3][var_4._id_3680].tag, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread _id_4073( var_4, var_8, level._id_9C8D[var_3][var_4._id_3680].tag, level._id_9C8D[var_3][var_4._id_3680]._id_2F6D, var_2 );
    return var_8;
}

_id_1CE6( var_0 )
{
    if ( !isdefined( self._id_88A8 ) )
        self._id_88A8 = [];

    var_1 = 0;

    if ( !isdefined( self._id_88A8[var_0] ) )
        self._id_88A8[var_0] = 1;
    else
        var_1 = 1;

    thread _id_1CE7( var_0 );
    return var_1;
}

_id_1CE7( var_0 )
{
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self._id_88A8[var_0] = 0;
    var_1 = getarraykeys( self._id_88A8 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( self._id_88A8[var_1[var_2]] )
            return;
    }

    self._id_88A8 = undefined;
}

_id_44C0( var_0, var_1 )
{
    if ( !_id_1CEC( var_1 ) )
    {
        thread _id_449B( var_0, var_1 );
        return;
    }

    self._id_9A44 = common_scripts\utility::_id_0CDA( self._id_9A44, var_0 );
    var_2 = var_0 [[ var_0._id_2569 ]]( self, var_1 );

    if ( !var_2 )
        thread _id_449B( var_0, var_1 );
    else
        _id_448B( var_0, var_1 );

    self._id_9A44 = common_scripts\utility::_id_0CF6( self._id_9A44, var_0 );
    waitframe;

    if ( !self._id_9A44.size )
    {
        maps\_utility::_id_32DE( "unloaded" );
        self._id_9A3C = "default";
    }
}

_id_44BF( var_0, var_1 )
{
    if ( isdefined( var_0._id_2569 ) )
    {
        _id_44C0( var_0, var_1 );
        return;
    }

    var_2 = _id_0BE9( self, var_1 );
    var_3 = self.vehicletype;

    if ( isdefined( var_2._id_612E ) )
        var_0.a._id_612E = 0;

    if ( !_id_1CEC( var_1 ) )
    {
        thread _id_449B( var_0, var_1 );
        return;
    }

    if ( !isdefined( var_2._id_4068 ) && !isdefined( var_2._id_14CB ) )
    {
        thread _id_449B( var_0, var_1 );
        return;
    }

    if ( isdefined( var_2._id_4879 ) && var_2._id_4879 )
        var_0 show();

    thread _id_44C1( var_0 );
    self endon( "death" );

    if ( isai( var_0 ) && isalive( var_0 ) )
        var_0 endon( "death" );

    if ( isdefined( var_0._id_405F ) )
    {
        if ( isdefined( var_2._id_27C0 ) )
        {
            wait(var_2._id_27C0);
            var_2._id_27C0 = undefined;
            var_0._id_27C0 = undefined;
        }

        var_0 [[ var_0._id_405F ]]();
    }

    if ( isdefined( var_0._id_64E3 ) )
    {
        var_0._id_64E3 = undefined;

        if ( isdefined( var_0._id_405F ) )
            var_0 [[ var_0._id_405F ]]();
    }

    var_4 = _id_3EFA();

    if ( isdefined( var_2._id_9CD5 ) )
    {
        var_4 thread _id_7F22( var_2._id_9CD5, var_2._id_9CD6 );
        var_5 = 0;

        if ( isdefined( var_2._id_9CD8 ) )
        {
            var_5 = _id_1CE6( var_2._id_9CD8 );
            var_6 = var_4 gettagorigin( var_2._id_9CD8 );
        }
        else
            var_6 = var_4.origin;

        if ( isdefined( var_2._id_9CD7 ) && !var_5 )
            thread common_scripts\utility::_id_69C2( var_2._id_9CD7, var_6 );

        var_5 = undefined;
    }

    var_7 = 0;

    if ( isdefined( var_2._id_406E ) )
        var_7 += getanimlength( var_2._id_406E );

    if ( isdefined( var_2._id_27C0 ) )
        var_7 += var_2._id_27C0;

    if ( isdefined( var_0._id_27C0 ) )
        var_7 += var_0._id_27C0;

    if ( var_7 > 0 )
    {
        thread _id_449B( var_0, var_1 );
        wait(var_7);
    }

    var_8 = isdefined( var_2._id_4069 );

    if ( !var_8 && var_0._id_8B09 )
        _id_44B2( var_0, var_1 );
    else if ( !var_8 && !var_0._id_9CE7 && isdefined( var_0._id_9CE4 ) )
        var_0 waittill( "idle" );

    var_0._id_2652 = undefined;
    var_0._id_2653 = undefined;
    var_0 notify( "newanim" );

    if ( isdefined( var_2._id_1433 ) && !var_2._id_1433 )
    {
        if ( !isdefined( var_0._id_2AAA ) )
            var_0 maps\_utility::_id_4461();
    }

    if ( isai( var_0 ) )
        var_0 _meth_81a7( 1 );

    var_9 = 0;

    if ( isdefined( var_2._id_14CB ) )
        var_9 = 1;
    else if ( !isdefined( var_2._id_4068 ) || !isdefined( self._id_7B08 ) && ( isdefined( var_2._id_1484 ) && var_2._id_1484 ) || isdefined( self._id_7A1B ) && var_1 == 0 )
    {
        thread _id_449B( var_0, var_1 );
        return;
    }

    if ( var_0 _id_846B() )
        var_0.health = var_0._id_6587;

    var_0._id_6587 = undefined;

    if ( isai( var_0 ) && isalive( var_0 ) )
        var_0 endon( "death" );

    var_0.allowdeath = 0;

    if ( isdefined( var_2._id_344E ) )
        var_10 = var_2._id_344E;
    else
        var_10 = var_2._id_85AE;

    if ( var_8 && var_0._id_8B09 )
        var_11 = var_2._id_4069;
    else if ( isdefined( var_0._id_3E09 ) )
        var_11 = var_0._id_3E09;
    else if ( isdefined( var_0._id_6D23 ) && isdefined( var_2._id_6B27 ) )
        var_11 = var_2._id_6B27;
    else
        var_11 = var_2._id_4068;

    if ( !var_9 )
    {
        if ( !isdefined( var_0._id_667F ) )
            thread _id_44BE( var_0 );

        if ( isdefined( var_2._id_3680 ) )
        {
            if ( !isdefined( self._id_3680[var_2._id_3680] ) )
            {
                thread _id_449B( var_0, var_1 );
                var_12 = _id_406B( var_4, var_0._id_9D1B, 0 );
            }
        }

        if ( isdefined( var_2._id_4075 ) )
            var_0 thread maps\_utility::_id_69C5( var_2._id_4075, "J_Wrist_RI", 1 );

        if ( isdefined( var_0._id_6D23 ) && isdefined( var_2._id_6B28 ) )
            var_0 thread maps\_utility::_id_69C4( var_2._id_6B28 );

        if ( isdefined( var_2._id_406F ) )
            var_0 thread maps\_utility::_id_6976( var_2._id_406F );

        if ( isdefined( var_0._id_6D23 ) && isdefined( var_2._id_6B2A ) )
            level.player thread common_scripts\utility::_id_6975( var_2._id_6B2A );

        var_0 notify( "newanim" );
        var_0 notify( "jumping_out" );
        var_13 = 0;

        if ( !isai( var_0 ) && !var_0 should_stay_drone() )
        {
            var_13 = 1;
            var_0 = _id_4482( var_0, var_1 );
        }

        if ( !isalive( var_0 ) )
            return;

        var_0._id_70DB = 1;

        if ( isdefined( var_2._id_713F ) )
            var_0 maps\_utility::_id_3097();

        if ( isdefined( var_2._id_3680 ) )
            var_0 maps\_utility::enable_achievement_reinforcement_denied( self, var_2._id_3680 );

        if ( isdefined( var_2._id_70DB ) )
        {
            var_0._id_70DB = 1;

            if ( isdefined( var_2._id_70DA ) )
                var_0._id_70DA = var_2._id_70DA;
        }

        if ( var_13 )
        {
            self._id_750A = common_scripts\utility::_id_0CDA( self._id_750A, var_0 );
            thread _id_4489( var_0, var_1 );
            thread _id_44C1( var_0 );
            var_0._id_750E = self;
        }

        if ( isai( var_0 ) )
            var_0 endon( "death" );

        var_0 notify( "newanim" );
        var_0 notify( "jumping_out" );

        if ( isdefined( var_2._id_57B7 ) && var_2._id_57B7 )
            thread _id_8AE2( var_0 );

        if ( isdefined( var_2._id_406C ) )
        {
            _id_0C74( var_0, var_10, var_11 );
            var_14 = var_10;

            if ( isdefined( var_2._id_406D ) )
                var_14 = var_2._id_406D;

            _id_0C74( var_0, var_14, var_2._id_406C );
        }
        else if ( isdefined( var_2._id_667F ) )
        {
            if ( !isdefined( self._id_0B96 ) )
            {
                self._id_0B96 = 0;
                self._id_6595 = ( 0.0, 0.0, 0.0 );
                self._id_9A3B = 0.5;
            }
            else
            {
                self._id_9A3B += randomfloatrange( 0.5, 1 );
                wait(self._id_9A3B);
            }

            if ( !isdefined( self ) )
                return;

            var_15 = spawn( "script_model", self gettagorigin( var_10 ) );
            var_15.angles = ( 0, self.angles[1] + self._id_0B96, 0 );
            self._id_0B96 += 5;
            var_15 setmodel( "tag_origin" );
            var_16 = maps\_utility::_id_4417( self.origin ) + ( 0, 0, self._id_9A3A );
            var_15.origin = var_16 + ( randomintrange( 10, 20 ), randomintrange( 10, 20 ), 0 );
            var_17 = spawn( "script_model", var_15.origin );
            var_17.angles = var_15.angles;
            var_17 setmodel( self._id_9A40 );
            var_17._id_0C72 = "parachute";
            var_17 useanimtree( level._id_78B1["parachute"] );
            var_17 hide();
            var_17 maps\_utility::_id_32DD( "parachute_open" );

            if ( isdefined( var_2._id_667C ) )
                var_15 _id_667F( var_0, var_17, self._id_9A41, var_11, var_2._id_667C );
            else
                var_15 _id_667F( var_0, var_17, self._id_9A41, var_11 );

            var_15 delete();
        }
        else
        {
            var_0._id_0BBC = 1;

            if ( isdefined( var_0.getout_ik ) )
            {
                thread _id_0C74( var_0, var_10, var_11, undefined, undefined );
                var_0 thread wait_do_ik_on();
                var_0.a._id_612E = 1;
                var_18 = var_0 wait_interrupt_or_done();

                if ( isdefined( var_18 ) && var_18 == "interrupt" )
                {
                    while ( !isdefined( var_0.ik_turned_on ) )
                        waittillframeend;

                    var_0 _meth_8143();
                    var_0 notify( "newanim" );
                    var_0 notify( "animontag_thread" );
                }

                var_0 _meth_8570( 0 );
                self.ik_turned_on = undefined;
                var_0.getout_ik = undefined;
                var_0.a._id_612E = 0;
            }
            else
                _id_0C74( var_0, var_10, var_11, undefined, undefined );
        }

        if ( isdefined( var_0._id_6D23 ) && isdefined( var_2._id_6B2A ) )
            level.player thread common_scripts\utility::_id_8EA1( var_2._id_6B2A );

        if ( isdefined( var_2._id_406F ) )
            var_0 thread common_scripts\utility::_id_8EA1( var_2._id_406F );

        if ( isdefined( var_0._id_6D23 ) && isdefined( var_2._id_6B29 ) )
            level.player thread maps\_utility::_id_69C4( var_2._id_6B29 );
    }
    else if ( !isai( var_0 ) )
    {
        if ( var_0._id_2E3F == 1 )
        {
            var_0 delete();
            return;
        }

        var_0 = maps\_utility::_id_9007( var_0 );
    }

    self._id_750A = common_scripts\utility::_id_0CF6( self._id_750A, var_0 );
    self._id_9BFD[var_1] = 0;
    var_0._id_750E = undefined;
    var_0._id_2E18 = undefined;

    if ( !isalive( self ) && !isdefined( var_2._id_9A43 ) )
    {
        var_0 delete();
        return;
    }

    var_0 unlink();

    if ( !isdefined( var_0._id_58D7 ) )
    {
        if ( isdefined( var_0._id_6159 ) )
            var_0._id_6159 = undefined;
    }

    if ( !isai( var_0 ) && var_0 should_stay_drone() )
    {
        if ( var_0._id_2E3F )
        {
            var_0 delete();
            return;
        }
    }

    if ( isalive( var_0 ) )
    {
        if ( isai( var_0 ) )
        {
            if ( isdefined( var_0.a._id_2B19 ) )
                var_0.a._id_2B18 = var_0.a._id_2B19;
            else
                var_0.a._id_2B18 = !var_0 _meth_813f();
        }

        var_0._id_39B7 = undefined;
        var_0 notify( "jumpedout" );
        var_0 maps\_utility::_id_2A72();

        if ( isdefined( var_2._id_3680 ) && isalive( var_0 ) )
            var_0 maps\_utility::disable_achievement_reinforcement_denied();

        if ( isai( var_0 ) )
        {
            if ( isdefined( var_2._id_4076 ) )
            {
                var_0._id_28B4 = var_2._id_4076;
                var_0 _meth_81ce( "crouch" );
                var_0 thread animscripts\utility::_id_9AF5();
                var_0 _meth_81ce( "stand", "crouch", "prone" );
            }

            var_0 _meth_81a7( 0 );

            if ( _id_44AB( var_0 ) )
            {
                var_0.goalradius = 600;
                var_0 _meth_81aa( var_0.origin );
            }
        }
    }

    if ( isdefined( var_2._id_406A ) && var_2._id_406A )
    {
        var_0 delete();
        return;
    }

    var_0 _id_4486();
}

wait_do_ik_on()
{
    self endon( "newanim" );
    self endon( "animontag_thread" );
    self waittillmatch( "animontagdone", "start_foot_ik" );
    self _meth_8570( 1 );
    self.ik_turned_on = 1;
}

wait_interrupt_or_done()
{
    self endon( "anim_on_tag_done" );
    common_scripts\utility::_id_A069( "damage", "death", "explode", "bullethit", "gunshot", "explode", "doFlashBanged", "bulletwhizby" );
    return "interrupt";
}

should_stay_drone()
{
    if ( isdefined( self._id_7AE0 ) )
        return 1;

    if ( isdefined( self._id_2E3F ) && self._id_2E3F )
        return 1;

    return 0;
}

_id_667F( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 unlink();
    var_5 = var_1 gettagorigin( "tag_driver" );
    var_6 = var_1 gettagangles( "tag_driver" );
    var_0 _meth_81ca( var_5, var_6 );
    var_0 linkto( var_1, "tag_driver" );
    var_1 _meth_8140( "parachute_unload", self.origin, self.angles, var_2 );

    if ( isdefined( var_4 ) )
        var_1 thread _id_667E( "parachute_unload", "show_parachute", var_4 );
    else
        var_1 thread _id_667E( "parachute_unload", "show_parachute" );

    var_0 _meth_8140( "parachute_unload", var_0.origin, var_0.angles, var_3 );
    level thread _id_667B( var_0, var_1 );
    var_1 waittillmatch( "parachute_unload", "end" );
    var_1 notify( "parachute_landed" );

    if ( isalive( var_0 ) )
        var_0 unlink();
}

_id_667D( var_0 )
{
    var_1 = anglestoforward( var_0.angles );
    var_2 = vectornormalize( common_scripts\utility::_id_38C8( var_1 ) );
    var_3 = self.origin + var_2 * 10000;
    thread maps\_utility::_id_2DB9( self, var_3, 1, 0, 0, 10 );
    self moveto( var_3, 1 );
}

_id_667B( var_0, var_1 )
{
    var_1 endon( "parachute_landed" );

    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
        return;

    if ( !isai( var_0 ) )
        var_0 setcandamage( 1 );

    var_2 = undefined;
    var_3 = undefined;

    for (;;)
    {
        var_0 waittill( "damage", var_2, var_3 );

        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2 < 1 )
            continue;

        if ( !isdefined( var_3 ) )
            continue;

        if ( isplayer( var_3 ) )
            break;
    }

    if ( !var_1 maps\_utility::_id_32D8( "parachute_open" ) )
    {
        var_1 notify( "rider_dead" );
        thread _id_0C76( var_0, undefined, var_3 );
        wait 2;
        var_1 delete();
    }
    else
        iprintln( "parachute death anim here!" );
}

_id_667E( var_0, var_1, var_2 )
{
    self endon( "rider_dead" );
    self waittillmatch( var_0, var_1 );

    if ( isdefined( var_2 ) )
        self thread [[ var_2 ]]();

    maps\_utility::_id_32DE( "parachute_open" );
}

_id_44AB( var_0 )
{
    if ( isdefined( var_0._id_7991 ) )
        return 0;

    if ( var_0 maps\_utility::_id_46E8() )
        return 0;

    if ( isdefined( var_0._id_7074 ) )
        return 0;

    if ( !isdefined( var_0.target ) )
        return 1;

    var_1 = getnodearray( var_0.target, "targetname" );

    if ( var_1.size > 1 )
        return 0;

    var_2 = getent( var_0.target, "targetname" );

    if ( isdefined( var_2 ) && var_2.classname == "info_volume" )
    {
        var_0 _meth_81ad( var_2 );
        return 0;
    }
    else if ( var_1.size == 1 )
        return 0;

    return 1;
}

_id_0C74( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 notify( "animontag_thread" );
    var_0 endon( "animontag_thread" );

    if ( !isdefined( var_5 ) )
        var_5 = "animontagdone";

    if ( isdefined( self._id_5D40 ) )
        var_6 = self._id_5D40;
    else
        var_6 = self;

    if ( !isdefined( var_1 ) )
    {
        var_7 = var_0.origin;
        var_8 = var_0.angles;
    }
    else
    {
        var_7 = var_6 gettagorigin( var_1 );
        var_8 = var_6 gettagangles( var_1 );
    }

    if ( isdefined( var_0._id_70DB ) && !isdefined( var_0._id_6115 ) )
        level thread _id_0C75( var_0, self );

    var_0 _meth_8140( var_5, var_7, var_8, var_2 );

    if ( isai( var_0 ) )
        thread _id_2D06( var_0, var_6, var_5 );

    if ( isdefined( var_0._id_0BBC ) )
    {
        var_0._id_0BBC = undefined;
        var_9 = getanimlength( var_2 ) - 0.25;

        if ( var_9 > 0 )
            wait(var_9);

        if ( !isdefined( var_0 ) || isremovedentity( var_0 ) )
            return;

        var_0 _meth_8143();
        var_0.interval = 0;
        var_0 thread _id_7290();
    }
    else
    {
        if ( isdefined( var_3 ) )
        {
            for ( var_10 = 0; var_10 < var_3.size; var_10++ )
            {
                var_0 waittillmatch( var_5, var_3[var_10] );
                var_0 thread [[ var_4[var_10] ]]();
            }
        }

        var_0 waittillmatch( var_5, "end" );
    }

    var_0 notify( "anim_on_tag_done" );
    var_0._id_70DB = undefined;
}

_id_7290()
{
    self endon( "death" );
    wait 2;

    if ( isdefined( self ) && self.interval == 0 )
        self.interval = 80;
}

_id_0C75( var_0, var_1 )
{
    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
        return;

    if ( !isai( var_0 ) )
        var_0 setcandamage( 1 );

    var_0 endon( "anim_on_tag_done" );

    if ( !isdefined( var_0._id_1AF1 ) || !var_0._id_1AF1 )
        thread _id_0C77( var_0, var_1 );

    var_2 = undefined;
    var_3 = undefined;
    var_4 = var_1.health <= 0;

    for (;;)
    {
        if ( !var_4 && !( isdefined( var_1 ) && var_1.health > 0 ) )
            break;

        var_0 waittill( "damage", var_2, var_3 );

        while ( isdefined( var_0.getout_ik ) && !isdefined( var_0.ik_turned_on ) )
            waittillframeend;

        if ( isdefined( var_0._id_39BF ) )
            break;

        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2 < 1 )
            continue;

        if ( !isdefined( var_3 ) )
            continue;

        if ( isplayer( var_3 ) )
            break;
    }

    if ( !isalive( var_0 ) )
        return;

    thread _id_0C76( var_0, var_1, var_3 );
}

_id_0C76( var_0, var_1, var_2 )
{
    var_0._id_2652 = undefined;
    var_0._id_2660 = undefined;
    var_0._id_0BB9 = 1;

    if ( isdefined( var_0._id_70DA ) )
    {
        var_3 = getmovedelta( var_0._id_70DA, 0, 1 );
        var_4 = physicstrace( var_0.origin + ( 0.0, 0.0, 16.0 ), var_0.origin - ( 0.0, 0.0, 10000.0 ) );
        var_5 = distance( var_0.origin + ( 0.0, 0.0, 16.0 ), var_4 );

        if ( abs( var_3[2] + 16 ) <= abs( var_5 ) )
        {
            var_0 thread maps\_utility::_id_69C4( "generic_death_falling" );
            var_0 _meth_8140( "fastrope_fall", var_0.origin, var_0.angles, var_0._id_70DA );
            var_0 waittillmatch( "fastrope_fall", "start_ragdoll" );
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    var_0._id_2652 = undefined;
    var_0._id_2660 = undefined;
    var_0._id_0BB9 = 1;
    var_0 notify( "rope_death", var_2 );
    maps\_spawner::_id_263C( var_2 );
    var_0 kill( var_2.origin, var_2 );

    if ( isdefined( var_0._id_7AE0 ) || isdefined( var_0._id_2E3F ) )
    {
        var_0 notsolid();
        var_6 = getweaponmodel( var_0.weapon );
        var_7 = var_0.weapon;

        if ( isdefined( var_6 ) )
        {
            var_0 detach( var_6, "tag_weapon_right" );
            var_8 = var_0 gettagorigin( "tag_weapon_right" );
            var_9 = var_0 gettagangles( "tag_weapon_right" );
            level._id_4454 = spawn( "weapon_" + var_7, ( 0.0, 0.0, 0.0 ) );
            level._id_4454.angles = var_9;
            level._id_4454.origin = var_8;
        }
    }
    else
        var_0 animscripts\shared::_id_2F6C();

    if ( isdefined( var_0._id_2642 ) )
    {
        if ( isdefined( var_0._id_3E0A ) )
        {
            var_10 = 0.33;

            if ( isdefined( var_0._id_5C3B ) )
                var_10 = var_0._id_5C3B;

            var_11 = var_0 _meth_8151( var_0._id_3E08 );

            if ( var_11 < var_10 )
                wait(var_0._id_3E0A * ( var_10 - var_11 ));

            if ( isremovedentity( var_0 ) )
                return;
        }

        var_12 = length( var_0._id_2642 );
        var_13 = vectornormalize( var_1 localtoworldcoords( var_0._id_2642 ) - var_0.origin ) * var_12;
        var_0 startragdollfromimpact( "torso_lower", var_13 );
    }
    else
        var_0 startragdoll();
}

_id_0C77( var_0, var_1 )
{
    var_0 endon( "anim_on_tag_done" );
    var_0 endon( "death" );
    var_1 waittill( "death", var_2, var_3, var_4 );

    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
        return;

    var_5 = 0;

    if ( isdefined( var_0._id_5C3B ) )
    {
        var_6 = var_0 _meth_8151( var_0._id_3E08 );

        if ( var_6 < var_0._id_5C3B )
            var_5 = 1;
    }

    if ( !isremovedentity( var_0 ) )
    {
        if ( var_5 )
        {
            var_0 notify( "killanimscript" );
            waitframe;
            var_0 thread _id_27DA();
        }

        if ( isdefined( var_2 ) )
            var_0 kill( var_0.origin, var_2 );
        else
            var_0 kill();
    }
}

_id_27DA()
{
    waittillframeend;

    if ( !isremovedentity( self ) )
        self delete();
}

_id_2D06( var_0, var_1, var_2 )
{
    var_0 endon( "newanim" );
    var_1 endon( "death" );
    var_0 endon( "death" );
    var_0 animscripts\shared::_id_2D06( var_2 );
}

_id_0C65( var_0, var_1, var_2, var_3 )
{
    var_0 _meth_8140( "movetospot", var_1, var_2, var_3 );
    var_0 waittillmatch( "movetospot", "end" );
}

_id_44C4( var_0, var_1, var_2 )
{
    if ( !isalive( var_0 ) )
        return;

    if ( isdefined( self._id_610D ) )
        return;

    var_3 = _id_0BE9( self, var_0._id_9D1B );
    var_0._id_9C8E = var_1;

    if ( isdefined( var_3._id_3540 ) )
        return _id_4483( var_0 );

    if ( isdefined( level._id_9D24 ) && isdefined( level._id_9D24[self.classname] ) )
    {
        self [[ level._id_9D24[self.classname] ]]();
        return;
    }

    if ( isdefined( var_3._id_9A43 ) && isdefined( self ) )
    {
        if ( isdefined( self._id_2D3C ) && self._id_2D3C )
            return;

        thread _id_449B( var_0, var_0._id_9D1B, 1 );
        wait(var_3._id_9A43);

        if ( isdefined( var_0 ) && isdefined( self ) )
        {
            self._id_443C = var_0._id_9D1B;
            maps\_vehicle::_id_9C7F( "unload" );
        }

        return;
    }

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_70DB ) && var_2 != "bm21_troops" )
            return;

        [[ level._id_422E ]]( "MOD_RIFLE_BULLET", "torso_upper", var_0.origin );
        var_0 delete();
    }
}

_id_44BA( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_9925 );
}

_id_44B9( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_9D5D ) )
        thread _id_7F22( var_2._id_9D5D );

    _id_0C74( var_0, var_2._id_85AE, var_2._id_9925 );
    thread _id_449B( var_0, var_1 );
}

_id_44B7( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_0BE9( self, var_1 );

    if ( isdefined( var_2._id_9D5C ) )
        thread _id_7F22( var_2._id_9D5C );

    _id_0C74( var_0, var_2._id_85AE, var_2._id_990B );
    thread _id_449B( var_0, var_1 );
}

_id_44B8( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_990B );
}

_id_44B6( var_0, var_1 )
{
    var_2 = level._id_9C82[self.classname][var_1];

    if ( isdefined( var_2._id_4B6D ) )
        var_0._id_9CE5 = var_2._id_4B6D;
}

_id_44B5( var_0, var_1 )
{
    var_2 = level._id_9C82[self.classname][var_1];

    if ( isdefined( var_2._id_4B6C ) )
        var_0._id_9CE5 = var_2._id_4B6C;
}

_id_0935()
{
    self endon( "death" );
    self waittill( "loaded" );
    maps\_vehicle::_id_427A( self );
}

_id_7E9F( var_0, var_1 )
{
    var_2 = var_0._id_7ADC;

    if ( isdefined( var_0._id_39B7 ) )
        var_2 = var_0._id_39B7;

    if ( isdefined( var_2 ) )
        return var_2;

    if ( !isdefined( self._id_9BFD ) )
        return;

    for ( var_3 = 0; var_3 < self._id_9BFD.size; var_3++ )
    {
        if ( self._id_9BFD[var_3] )
            continue;

        return var_3;
    }

    if ( isdefined( var_0._id_7B19 ) )
    {

    }
}

_id_44A4( var_0, var_1, var_2 )
{
    var_3 = _id_0BE9( self, var_1 );
    var_4 = self._id_5BD5[var_3._id_5BD5];

    if ( !isalive( var_0 ) )
        return;

    var_4 endon( "death" );
    var_0 endon( "death" );

    if ( isdefined( var_2 ) && var_2 && isdefined( var_3._id_66B4 ) )
        [[ var_3._id_66B4 ]]( self, var_0, var_1, var_4 );

    maps\_vehicle_code::_id_7EE3( var_4 );
    var_4 _meth_815c( 0 );
    wait 0.1;
    var_0 endon( "guy_man_turret_stop" );
    level thread maps\_mgturret::_id_5BC8( var_4, maps\_utility::_id_3F58() );
    var_4 setmode( "auto_ai" );
    var_4 setturretignoregoals( 1 );

    if ( isdefined( var_3._id_85B0 ) && var_3._id_85B0 )
        var_4 thread maps\_mgturret_auto_nonai::main( var_0, var_3 );
    else
    {
        for (;;)
        {
            if ( !isdefined( var_0 _meth_8198() ) )
                var_0 _meth_818e( var_4 );

            wait 1;
        }
    }
}

_id_44BE( var_0 )
{
    var_0 endon( "jumpedout" );
    var_0 waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 unlink();
}

_id_4483( var_0 )
{
    if ( !isdefined( var_0._id_9D1B ) )
        return;

    var_1 = var_0._id_9D1B;
    var_2 = _id_0BE9( self, var_1 );

    if ( !isdefined( var_2._id_3540 ) )
        return;

    [[ level._id_422E ]]( "MOD_RIFLE_BULLET", "torso_upper", var_0.origin );
    var_0._id_2652 = var_2._id_3540;
    var_3 = self.angles;
    var_4 = var_0.origin;

    if ( isdefined( var_2._id_3541 ) )
    {
        var_4 += anglestoforward( var_3 ) * var_2._id_3541[0];
        var_4 += anglestoright( var_3 ) * var_2._id_3541[1];
        var_4 += anglestoup( var_3 ) * var_2._id_3541[2];
    }

    var_0 = _id_21A2( var_0 );
    _id_297A( var_0, "weapon_" );
    var_0 notsolid();
    var_0.origin = var_4;
    var_0.angles = var_3;
    var_0 _meth_8140( "deathanim", var_4, var_3, var_2._id_3540 );
    var_5 = 0.3;

    if ( isdefined( var_2._id_3542 ) )
        var_5 = var_2._id_3542;

    var_6 = getanimlength( var_2._id_3540 );
    var_7 = gettime() + var_6 * 1000;
    wait(var_6 * var_5);
    var_8 = ( 0.0, 0.0, 1.0 );
    var_9 = var_0.origin;

    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        var_0 delete();
        return;
    }

    if ( isai( var_0 ) )
        var_0 animscripts\shared::_id_2F6C();
    else
        _id_297A( var_0, "weapon_" );

    while ( !var_0 isragdoll() && gettime() < var_7 )
    {
        var_9 = var_0.origin;
        wait 0.05;
        var_8 = var_0.origin - var_9;
        var_0 startragdoll();
    }

    wait 0.05;
    var_8 *= 20000;

    for ( var_10 = 0; var_10 < 3; var_10++ )
    {
        if ( isdefined( var_0 ) )
            var_9 = var_0.origin;

        wait 0.05;
    }

    if ( !var_0 isragdoll() )
        var_0 delete();
}

_id_21A2( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = spawn( "script_model", var_0.origin );
    var_3.angles = var_0.angles;
    var_3 setmodel( var_0.model );
    var_4 = var_0 getattachsize();

    for ( var_5 = 0; var_5 < var_4 && ( var_2 || var_5 < 1 ); var_5++ )
        var_3 attach( var_0 getattachmodelname( var_5 ), var_0 getattachtagname( var_5 ) );

    var_3 useanimtree( #animtree );

    if ( isdefined( var_0.team ) )
        var_3.team = var_0.team;

    if ( !var_1 )
        var_0 delete();

    var_3 makefakeai();
    return var_3;
}

_id_9C88( var_0, var_1 )
{
    self useanimtree( var_1 );
    self _meth_814d( var_0 );
}

_id_9CD4( var_0 )
{
    var_1 = _id_0BE9( self, var_0 );
    return _id_9CCE( var_1._id_3FD2, var_1._id_85AE, var_0 );
}

_id_9CCE( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_4 = undefined;
    var_5 = undefined;
    var_6 = self gettagorigin( var_1 );
    var_7 = self gettagangles( var_1 );
    var_4 = getstartorigin( var_6, var_7, var_0 );
    var_5 = getstartangles( var_6, var_7, var_0 );
    var_3.origin = var_4;
    var_3.angles = var_5;
    var_3._id_9D1B = var_2;
    return var_3;
}

_id_506E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        return 1;

    var_3 = var_0.classname;
    var_4 = level._id_9D69[var_3][var_2];

    foreach ( var_6 in var_4 )
    {
        if ( var_6 == var_1 )
            return 1;
    }

    return 0;
}

_id_3CCF( var_0 )
{
    var_1 = level._id_9C82[self.classname];
    var_2 = [];
    var_3 = [];

    for ( var_4 = 0; var_4 < self._id_9BFD.size; var_4++ )
    {
        if ( self._id_9BFD[var_4] )
            continue;

        if ( isdefined( var_1[var_4]._id_3FD2 ) && _id_506E( self, var_4, var_0 ) )
        {
            var_2[var_2.size] = _id_9CD4( var_4 );
            continue;
        }

        var_3[var_3.size] = var_4;
    }

    var_5 = spawnstruct();
    var_5._id_1174 = var_2;
    var_5._id_6151 = var_3;
    return var_5;
}

_id_3EFA()
{
    if ( isdefined( self._id_5D40 ) )
        return self._id_5D40;
    else
        return self;
}

_id_297A( var_0, var_1 )
{
    var_2 = var_0 getattachsize();
    var_3 = [];
    var_4 = [];
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_2; var_6++ )
    {
        var_7 = var_0 getattachmodelname( var_6 );
        var_8 = var_0 getattachtagname( var_6 );

        if ( issubstr( var_7, var_1 ) )
        {
            var_3[var_5] = var_7;
            var_4[var_5] = var_8;
            var_5++;
        }
    }

    for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        var_0 detach( var_3[var_6], var_4[var_6] );
}

_id_846B()
{
    if ( !isai( self ) )
        return 0;

    if ( !isdefined( self._id_6587 ) )
        return 0;

    return !isdefined( self._id_58D7 );
}

_id_44A9( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_6EAF );
}

_id_44A8( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );

    if ( !isdefined( var_2._id_6EAF ) )
        return;

    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    _id_0C74( var_0, var_2._id_85AE, var_2._id_6EAF );

    for (;;)
        _id_0C74( var_0, var_2._id_85AE, var_2._id_6EB0 );
}

_id_449C( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );

    if ( !isdefined( var_2._id_4B64 ) )
        return;

    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
        _id_0C74( var_0, var_2._id_85AE, var_2._id_4B64 );
}

_id_449D( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_4B64 );
}

_id_449E( var_0, var_1 )
{
    var_2 = _id_0BE9( self, var_1 );

    if ( !isdefined( var_2._id_4B64 ) )
        return;

    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    _id_0C74( var_0, var_2._id_85AE, var_2._id_4B65 );
    thread _id_449B( var_0, var_1 );
}

_id_449F( var_0, var_1 )
{
    return isdefined( _id_0BE9( self, var_1 )._id_4B65 );
}

_id_8AE2( var_0 )
{
    self waittill( "stable_for_unlink" );

    if ( isalive( var_0 ) )
        var_0 unlink();
}

_id_94A4()
{

}

_id_0C57( var_0 )
{
    var_1 = [];

    foreach ( var_3 in self._id_750A )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( isdefined( level._id_9C81[var_0] ) && ![[ level._id_9C81[var_0] ]]( var_3, var_3._id_9D1B ) )
            continue;

        if ( isdefined( level._id_9C83[var_0] ) )
        {
            var_3 notify( "newanim" );
            var_3._id_7099 = [];
            thread [[ level._id_9C83[var_0] ]]( var_3, var_3._id_9D1B );
            var_1[var_1.size] = var_3;
            continue;
        }

        var_3 notify( "newanim" );
        var_3._id_7099 = [];
        thread _id_44C3( var_3, var_3._id_9D1B, var_0 );
        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_44C3( var_0, var_1, var_2 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_3 = _id_0BE9( self, var_1 );

    if ( isdefined( var_3._id_0940[var_2] ) )
        thread _id_7F22( var_3._id_0940[var_2] );

    _id_0C74( var_0, var_3._id_85AE, var_3._id_093F[var_2] );
    _id_449B( var_0, var_1 );
}

_id_4486()
{
    self._id_9CE7 = undefined;
    self._id_8B09 = undefined;
    self._id_9D1B = undefined;
    self._id_27C0 = undefined;
}

_id_2807()
{
    var_0 = self getcentroid();
    var_1 = self getpointinbounds( 1, 0, 0 );
    var_2 = distance( var_1, var_0 );
    var_3 = getcorpsearray();

    foreach ( var_5 in var_3 )
    {
        if ( distance( var_5.origin, var_0 ) < var_2 )
            var_5 delete();
    }
}

_id_2B2F()
{
    if ( isdefined( self._id_750E ) )
        self._id_750E _id_448B( self, self._id_9D1B );
}

_id_448B( var_0, var_1 )
{
    var_0 notify( "jumpedout" );
    self._id_750A = common_scripts\utility::_id_0CF6( self._id_750A, var_0 );
    self._id_9BFD[var_1] = 0;
    var_0._id_750E = undefined;
    var_0._id_2E18 = undefined;
    var_0 _id_4486();
}
