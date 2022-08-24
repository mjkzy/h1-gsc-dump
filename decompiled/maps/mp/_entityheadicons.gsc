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

init()
{
    if ( isdefined( level.initedentityheadicons ) )
        return;

    level.initedentityheadicons = 1;

    if ( level.multiteambased )
    {
        foreach ( var_1 in level.teamnamelist )
        {
            var_2 = "entity_headicon_" + var_1;
            game[var_2] = maps\mp\gametypes\_teams::_id_5FDA( var_1 );
            precacheshader( game[var_2] );
        }
    }
    else
    {
        game["entity_headicon_allies"] = maps\mp\gametypes\_teams::_id_4116( "allies" );
        game["entity_headicon_axis"] = maps\mp\gametypes\_teams::_id_4116( "axis" );
        precacheshader( game["entity_headicon_allies"] );
        precacheshader( game["entity_headicon_axis"] );
    }
}

_id_7F86( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( maps\mp\_utility::_id_5112( var_0 ) && !isplayer( var_0 ) )
        return;

    if ( !isdefined( self.entityheadicons ) )
        self.entityheadicons = [];

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0.05;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    if ( !isdefined( var_8 ) )
        var_8 = 1;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !isdefined( var_11 ) )
        var_11 = "";

    if ( !isplayer( var_0 ) && var_0 == "none" )
    {
        foreach ( var_14, var_13 in self.entityheadicons )
        {
            if ( isdefined( var_13 ) )
                var_13 destroy();

            self.entityheadicons[var_14] = undefined;
        }
    }
    else
    {
        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self.entityheadicons[var_0.guid] ) )
            {
                self.entityheadicons[var_0.guid] destroy();
                self.entityheadicons[var_0.guid] = undefined;
            }

            if ( var_1 == "" )
                return;

            if ( isdefined( self.entityheadicons[var_0.team] ) )
            {
                self.entityheadicons[var_0.team] destroy();
                self.entityheadicons[var_0.team] = undefined;
            }

            var_13 = newclienthudelem( var_0 );
            self.entityheadicons[var_0.guid] = var_13;
        }
        else
        {
            if ( isdefined( self.entityheadicons[var_0] ) )
            {
                self.entityheadicons[var_0] destroy();
                self.entityheadicons[var_0] = undefined;
            }

            if ( var_1 == "" )
                return;

            foreach ( var_14, var_16 in self.entityheadicons )
            {
                if ( var_14 == "axis" || var_14 == "allies" )
                    continue;

                var_17 = maps\mp\_utility::_id_408B( var_14 );

                if ( var_17.team == var_0 )
                {
                    self.entityheadicons[var_14] destroy();
                    self.entityheadicons[var_14] = undefined;
                }
            }

            var_13 = newteamhudelem( var_0 );
            self.entityheadicons[var_0] = var_13;
        }

        if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        {
            var_3 = 10;
            var_4 = 10;
        }

        var_13.archived = var_5;
        var_13.alpha = 0.85;
        var_13 setshader( var_1, var_3, var_4 );
        var_13 setwaypoint( var_7, var_8, var_9, var_10 );

        if ( var_11 == "" )
        {
            var_13.x = self.origin[0] + var_2[0];
            var_13.y = self.origin[1] + var_2[1];
            var_13.z = self.origin[2] + var_2[2];
            var_13 thread _id_52E0( self, var_2, var_6 );
        }
        else
        {
            var_13.x = var_2[0];
            var_13.y = var_2[1];
            var_13.z = var_2[2];
            var_13 settargetent( self, var_11 );
        }

        thread _id_28EE();

        if ( isplayer( var_0 ) )
            var_13 thread _id_28F0( var_0 );

        if ( isplayer( self ) )
            var_13 thread _id_28F0( self );
    }
}

_id_28F0( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self destroy();
}

_id_28EE()
{
    self notify( "destroyIconsOnDeath" );
    self endon( "destroyIconsOnDeath" );
    self waittill( "death" );

    foreach ( var_2, var_1 in self.entityheadicons )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 destroy();
    }
}

_id_52E0( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = var_0.origin;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_3 != var_0.origin )
        {
            var_3 = var_0.origin;
            self.x = var_3[0] + var_1[0];
            self.y = var_3[1] + var_1[1];
            self.z = var_3[2] + var_1[2];
        }

        if ( var_2 > 0.05 )
        {
            self.alpha = 0.85;
            self fadeovertime( var_2 );
            self.alpha = 0;
        }

        wait(var_2);
    }
}

_id_8028( var_0, var_1, var_2, var_3 )
{
    if ( !level.teambased )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331B ) )
    {
        self._id_331B = "none";
        self._id_3317 = undefined;
    }

    if ( isdefined( var_3 ) && var_3 == 0 )
        var_4 = undefined;

    var_5 = game["entity_headicon_" + var_0];
    self._id_331B = var_0;

    if ( isdefined( var_1 ) )
        self._id_3318 = var_1;
    else
        self._id_3318 = ( 0.0, 0.0, 0.0 );

    self notify( "kill_entity_headicon_thread" );

    if ( var_0 == "none" )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 destroy();

        return;
    }

    var_6 = newteamhudelem( var_0 );
    var_6.archived = 1;
    var_6.alpha = 0.8;
    var_6 setshader( var_5, 10, 10 );
    var_6 setwaypoint( 0, 0, 0, 1 );
    self._id_3317 = var_6;

    if ( !isdefined( var_3 ) )
    {
        if ( var_2 == "" )
        {
            var_6.x = self.origin[0] + self._id_3318[0];
            var_6.y = self.origin[1] + self._id_3318[1];
            var_6.z = self.origin[2] + self._id_3318[2];
            thread _id_52DE();
        }
        else
        {
            var_6.x = self._id_3318[0];
            var_6.y = self._id_3318[1];
            var_6.z = self._id_3318[2];
            var_6 settargetent( self, var_2 );
        }
    }
    else
    {
        var_7 = anglestoup( self.angles );
        var_8 = self.origin + var_7 * 28;

        if ( var_2 == "" )
        {
            var_6.x = var_8[0];
            var_6.y = var_8[1];
            var_6.z = var_8[2];
            thread _id_52DE( var_3 );
        }
        else
        {
            var_6.x = var_8[0];
            var_6.y = var_8[1];
            var_6.z = var_8[2];
            var_6 settargetent( self, var_2 );
        }
    }

    thread _id_28EC();
}

_id_7FE5( var_0, var_1, var_2 )
{
    if ( level.teambased )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331B ) )
    {
        self._id_331B = "none";
        self._id_3317 = undefined;
    }

    self notify( "kill_entity_headicon_thread" );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 destroy();

        return;
    }

    var_3 = var_0.team;
    self._id_331B = var_3;

    if ( isdefined( var_1 ) )
        self._id_3318 = var_1;
    else
        self._id_3318 = ( 0.0, 0.0, 0.0 );

    var_4 = game["entity_headicon_" + var_3];
    var_5 = newclienthudelem( var_0 );
    var_5.archived = 1;
    var_5.alpha = 0.8;
    var_5 setshader( var_4, 10, 10 );
    var_5 setwaypoint( 0, 0, 0, 1 );
    self._id_3317 = var_5;

    if ( var_2 == "" )
    {
        var_5.x = self.origin[0] + self._id_3318[0];
        var_5.y = self.origin[1] + self._id_3318[1];
        var_5.z = self.origin[2] + self._id_3318[2];
        thread _id_52DE();
    }
    else
    {
        var_5.x = self._id_3318[0];
        var_5.y = self._id_3318[1];
        var_5.z = self._id_3318[2];
        var_5 settargetent( self, var_2 );
    }

    thread _id_28EC();
}

_id_52DE( var_0 )
{
    self endon( "kill_entity_headicon_thread" );
    self endon( "death" );
    var_1 = self.origin;

    for (;;)
    {
        if ( var_1 != self.origin )
        {
            _id_9B24( var_0 );
            var_1 = self.origin;
        }

        wait 0.05;
    }
}

_id_28EC()
{
    self endon( "kill_entity_headicon_thread" );
    self waittill( "death" );

    if ( !isdefined( self._id_3317 ) )
        return;

    self._id_3317 destroy();
}

_id_9B24( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        self._id_3317.x = self.origin[0] + self._id_3318[0];
        self._id_3317.y = self.origin[1] + self._id_3318[1];
        self._id_3317.z = self.origin[2] + self._id_3318[2];
    }
    else
    {
        var_1 = anglestoup( self.angles );
        var_2 = self.origin + var_1 * 28;
        self._id_3317.x = var_2[0];
        self._id_3317.y = var_2[1];
        self._id_3317.z = var_2[2];
    }
}
