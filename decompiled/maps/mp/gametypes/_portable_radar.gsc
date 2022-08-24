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

_id_2865( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2 ) )
            var_2._id_4E40 = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
}

_id_5EB2()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_6E4E = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "portabl_radar" || var_1 == "portable_radar_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                continue;
            }

            self._id_6E4E = common_scripts\utility::_id_0D01( self._id_6E4E );

            if ( self._id_6E4E.size >= level.maxperplayerexplosives )
                _id_2865( self._id_6E4E[0] );

            var_0 waittill( "missile_stuck" );
            var_2 = var_0.origin;

            if ( isdefined( var_0 ) )
                var_0 delete();

            var_3 = spawn( "script_model", var_2 );
            var_3.health = 100;
            var_3.team = self.team;
            var_3.owner = self;
            var_3 setcandamage( 1 );
            var_3 makeportableradar( self );
            var_3 _id_6E52( self );
            var_3 thread maps\mp\gametypes\_weapons::_id_23E6( "weapon_radar_bombsquad", "tag_origin", self );
            var_3 thread _id_6E51();
            thread _id_6E54( var_3 );
            self._id_6E4E[self._id_6E4E.size] = var_3;
        }
    }
}

_id_6E52( var_0 )
{
    self setmodel( "weapon_radar" );

    if ( level.teambased )
        maps\mp\_entityheadicons::_id_8028( self.team, ( 0.0, 0.0, 20.0 ) );
    else
        maps\mp\_entityheadicons::_id_7FE5( var_0, ( 0.0, 0.0, 20.0 ) );

    thread _id_6E50( var_0 );
    thread _id_6E53( var_0 );
    thread _id_6E4F();
    thread maps\mp\_utility::_id_6240( var_0 );
}

_id_6E54( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    common_scripts\utility::_id_A069( "disconnect", "joined_team", "joined_spectators", "spawned_player" );
    level thread _id_2865( var_0 );
}

_id_6E4F()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 2.0;
        self playsound( "sentry_gun_beep" );
    }
}

_id_6E50( var_0 )
{
    self endon( "death" );
    self.health = 999999;
    self.maxhealth = 100;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !maps\mp\gametypes\_weapons::_id_3AA6( self.owner, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
            var_11 = maps\mp\_utility::_id_8F5C( var_10, "_lefthand" );
        else
            var_11 = undefined;

        if ( isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "concussion_grenade_mp":
                case "flash_grenade_mp":
                case "smoke_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( maps\mp\_utility::_id_5150( var_5 ) )
            self.damagetaken += self.maxhealth;

        if ( isdefined( var_9 ) && var_9 & level._id_4B5C )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        self.damagetaken += var_1;

        if ( isplayer( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::_id_9B0C( "portable_radar" );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self playsound( "sentry_explode" );
            self._id_265A = playfx( common_scripts\utility::_id_3FA8( "equipment_explode" ), self.origin );
            self freeentitysentient();
            var_2 thread _id_2865( self );
        }
    }
}

_id_6E53( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"MP_PATCH_PICKUP_PORTABLE_RADAR" );
    maps\mp\_utility::_id_8005( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = var_0 getweaponammostock( "portable_radar_mp" );

        if ( var_1 < weaponmaxammo( "portable_radar_mp" ) )
        {
            var_0 playlocalsound( "scavenger_pack_pickup" );
            var_0 setweaponammostock( "portable_radar_mp", var_1 + 1 );
            var_0 thread _id_2865( self );
        }
    }
}

_id_6E51()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 512;

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( level.teambased && var_2.team == self.team )
                continue;

            if ( var_2 maps\mp\_utility::_hasperk( "specialty_class_lowprofile" ) )
                continue;

            var_3 = distancesquared( self.origin, var_2.origin );

            if ( distancesquared( var_2.origin, self.origin ) < var_0 * var_0 )
            {
                var_2._id_4E40 = self.owner;
                continue;
            }

            var_2._id_4E40 = undefined;
        }

        wait 0.05;
    }
}
