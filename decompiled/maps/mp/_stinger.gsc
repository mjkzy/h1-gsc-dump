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

_id_4E2A()
{
    self.stingerstage = undefined;
    self.stingertarget = undefined;
    self.stingerlockstarttime = undefined;
    self.stingerlostsightlinetime = undefined;
    thread _id_7460();
}

_id_745F()
{
    if ( !isdefined( self.stingeruseentered ) )
        return;

    self.stingeruseentered = undefined;
    self notify( "stop_javelin_locking_feedback" );
    self notify( "stop_javelin_locked_feedback" );
    self weaponlockfree();
    _id_4E2A();
}

_id_7460()
{
    self endon( "disconnect" );
    self notify( "ResetStingerLockingOnDeath" );
    self endon( "ResetStingerLockingOnDeath" );

    for (;;)
    {
        self waittill( "death" );
        _id_745F();
    }
}

_id_8E38( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self circle( var_0.origin, 65, 85 ) )
        return 0;

    if ( isdefined( level.ac130 ) && self.stingertarget == level.ac130.planemodel && !isdefined( level.ac130player ) )
        return 0;

    return 1;
}

_id_5894()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level.chopper ) && isdefined( level.chopper.gunner ) && isdefined( self.stingertarget ) && self.stingertarget == level.chopper.gunner )
            level.chopper.gunner playlocalsound( "missile_locking" );

        if ( isdefined( level.ac130player ) && isdefined( self.stingertarget ) && self.stingertarget == level.ac130.planemodel )
            level.ac130player playlocalsound( "missile_locking" );

        self playlocalsound( "stinger_locking" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.6;
    }
}

_id_5893()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level.chopper ) && isdefined( level.chopper.gunner ) && isdefined( self.stingertarget ) && self.stingertarget == level.chopper.gunner )
            level.chopper.gunner playlocalsound( "missile_locking" );

        if ( isdefined( level.ac130player ) && isdefined( self.stingertarget ) && self.stingertarget == level.ac130.planemodel )
            level.ac130player playlocalsound( "missile_locking" );

        self playlocalsound( "stinger_locked" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.25;
    }
}

_id_5818( var_0 )
{
    var_1 = self geteye();

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = sighttracepassed( var_1, var_0.origin, 0, var_0 );

    if ( var_2 )
        return 1;

    var_3 = var_0 getpointinbounds( 1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_3, 0, var_0 );

    if ( var_2 )
        return 1;

    var_4 = var_0 getpointinbounds( -1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_4, 0, var_0 );

    if ( var_2 )
        return 1;

    return 0;
}

_id_8E45( var_0 )
{

}

_id_8862()
{
    var_0 = 500;

    if ( _id_5818( self.stingertarget ) )
    {
        self.stingerlostsightlinetime = 0;
        return 1;
    }

    if ( self.stingerlostsightlinetime == 0 )
        self.stingerlostsightlinetime = gettime();

    var_1 = gettime() - self.stingerlostsightlinetime;

    if ( var_1 >= var_0 )
    {
        _id_745F();
        return 0;
    }

    return 1;
}

_id_4107()
{
    var_0 = [];

    if ( maps\mp\_utility::_id_4FA6() )
        return var_0;

    if ( level.teambased )
    {
        if ( isdefined( level.chopper ) && ( level.chopper.team != self.team || isdefined( level.chopper.owner ) && level.chopper.owner == self ) )
            var_0[var_0.size] = level.chopper;

        if ( isdefined( level.ac130player ) && level.ac130player.team != self.team )
            var_0[var_0.size] = level.ac130.planemodel;

        if ( isdefined( level._id_46DF ) )
        {
            foreach ( var_2 in level._id_46DF )
            {
                if ( isdefined( var_2 ) && ( var_2.team != self.team || isdefined( var_2.owner ) && var_2.owner == self ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level.multiteambased )
        {
            for ( var_4 = 0; var_4 < level.teamnamelist.size; var_4++ )
            {
                if ( self.team != level.teamnamelist[var_4] )
                {
                    if ( level._id_99E9[level.teamnamelist[var_4]].size )
                    {
                        foreach ( var_6 in level._id_99E9[level.teamnamelist[var_4]] )
                            var_0[var_0.size] = var_6;
                    }
                }
            }
        }
        else if ( level._id_99E9[level._id_65B3[self.team]].size )
        {
            foreach ( var_6 in level._id_99E9[level._id_65B3[self.team]] )
                var_0[var_0.size] = var_6;
        }

        if ( isdefined( level._id_57B8 ) )
        {
            foreach ( var_11 in level._id_57B8 )
            {
                if ( isdefined( var_11 ) && ( var_11.team != self.team || isdefined( var_11.owner ) && var_11.owner == self ) )
                    var_0[var_0.size] = var_11;
            }
        }

        if ( isdefined( level._id_99EF ) )
        {
            foreach ( var_14 in level._id_99EF )
            {
                if ( isdefined( var_14 ) && ( var_14.team != self.team || isdefined( var_14.owner ) && var_14.owner == self ) )
                    var_0[var_0.size] = var_14;
            }
        }
    }
    else
    {
        if ( isdefined( level.chopper ) )
            var_0[var_0.size] = level.chopper;

        if ( isdefined( level.ac130player ) )
            var_0[var_0.size] = level.ac130.planemodel;

        if ( isdefined( level._id_46DF ) )
        {
            foreach ( var_2 in level._id_46DF )
            {
                if ( isdefined( var_2 ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level._id_99E9.size )
        {
            foreach ( var_19, var_6 in level._id_99E9 )
            {
                if ( isdefined( var_6.owner ) && var_6.owner == self )
                    continue;

                var_0[var_0.size] = var_6;
            }
        }

        if ( isdefined( level._id_57B8 ) )
        {
            foreach ( var_11 in level._id_57B8 )
            {
                if ( !isdefined( var_11 ) )
                    continue;

                var_0[var_0.size] = var_11;
            }
        }

        if ( isdefined( level._id_99EF ) )
        {
            foreach ( var_14 in level._id_99EF )
            {
                if ( !isdefined( var_14 ) )
                    continue;

                var_0[var_0.size] = var_14;
            }
        }
    }

    return var_0;
}

_id_8E5B()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1000;
    _id_4E2A();

    for (;;)
    {
        wait 0.05;

        if ( self playerads() < 0.95 )
        {
            _id_745F();
            continue;
        }

        var_1 = self getcurrentweapon();

        if ( issubstr( var_1, "stingerm7" ) )
            continue;

        if ( var_1 != "stinger_mp" )
        {
            _id_745F();
            continue;
        }

        self.stingeruseentered = 1;

        if ( !isdefined( self.stingerstage ) )
            self.stingerstage = 0;

        _id_8E45( self.stingertarget );

        if ( self.stingerstage == 0 )
        {
            var_2 = _id_4107();

            if ( var_2.size == 0 )
                continue;

            var_3 = [];

            foreach ( var_5 in var_2 )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                var_6 = self circle( var_5.origin, 65, 75 );

                if ( var_6 )
                    var_3[var_3.size] = var_5;
            }

            if ( var_3.size == 0 )
                continue;

            var_8 = sortbydistance( var_3, self.origin );

            if ( !_id_5818( var_8[0] ) )
                continue;

            thread _id_5894();
            self.stingertarget = var_8[0];
            self.stingerlockstarttime = gettime();
            self.stingerstage = 1;
            self.stingerlostsightlinetime = 0;
        }

        if ( self.stingerstage == 1 )
        {
            if ( !_id_8E38( self.stingertarget ) )
            {
                _id_745F();
                continue;
            }

            var_9 = _id_8862();

            if ( !var_9 )
                continue;

            var_10 = gettime() - self.stingerlockstarttime;

            if ( maps\mp\_utility::_hasperk( "specialty_fasterlockon" ) )
            {
                if ( var_10 < var_0 * 0.5 )
                    continue;
            }
            else if ( var_10 < var_0 )
                continue;

            self notify( "stop_javelin_locking_feedback" );
            thread _id_5893();
            self weaponlockfinalize( self.stingertarget );
            self.stingerstage = 2;
        }

        if ( self.stingerstage == 2 )
        {
            var_9 = _id_8862();

            if ( !var_9 )
                continue;

            if ( !_id_8E38( self.stingertarget ) )
            {
                _id_745F();
                continue;
            }
        }
    }
}
