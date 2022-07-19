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

main()
{
    precacheshellshock( "flashbang_mp" );
}

_id_8D2B()
{
    thread _id_5E5E();
}

_id_8EFA( var_0 )
{
    self notify( "stop_monitoring_flash" );
}

_id_38C5( var_0 )
{
    self endon( "stop_monitoring_flash" );
    self endon( "flash_rumble_loop" );
    self notify( "flash_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

_id_5E5E()
{
    self endon( "disconnect" );
    self notify( "monitorFlash" );
    self endon( "monitorFlash" );
    self.flashendtime = 0;
    var_0 = 6;

    for (;;)
    {
        self waittill( "flashbang", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( self ) )
            continue;

        if ( isdefined( self.usingremote ) )
            continue;

        if ( !isdefined( var_6 ) )
            var_6 = 0;

        var_7 = 0;
        var_8 = 1;

        if ( var_3 < 0.5 )
            var_3 = 0.5;
        else if ( var_3 > 0.8 )
            var_3 = 1;

        var_9 = var_2 * var_3 * var_0;
        var_9 += var_6;

        if ( isdefined( self.stunscaler ) )
            var_9 *= self.stunscaler;

        if ( var_9 < 0.25 )
            continue;

        var_10 = undefined;

        if ( var_9 > 2 )
            var_10 = 0.75;
        else
            var_10 = 0.25;

        if ( level.teambased && isdefined( var_4 ) && isdefined( var_4.team ) && var_4.team == self.team && var_4 != self )
        {
            if ( level.friendlyfire == 0 )
                continue;
            else if ( level.friendlyfire == 1 )
            {

            }
            else if ( level.friendlyfire == 2 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_8 = 0;
                var_7 = 1;
            }
            else if ( level.friendlyfire == 3 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_7 = 1;
            }
        }
        else if ( isdefined( var_4 ) )
        {
            if ( var_4 != self )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_flash" );

            var_11 = maps\mp\_utility::_id_4015();

            if ( var_11 == "mp_crash_snow" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_wc_tactical" );
            else if ( var_11 == "mp_farm_spring" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_stpatty_tactical" );
            else if ( var_11 == "mp_bog_summer" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_summer_tactical" );
        }

        if ( var_8 && isdefined( self ) )
        {
            thread _id_0CAD( var_9, var_10 );

            if ( isdefined( var_4 ) && var_4 != self )
            {
                var_4 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( "flash" );
                self.flashattacker = var_4;
                var_12 = self;

                if ( isplayer( var_4 ) && var_4 isitemunlocked( "specialty_paint" ) && var_4 maps\mp\_utility::_hasperk( "specialty_paint" ) )
                    var_12 thread maps\mp\perks\_perkfunctions::_id_7FDB( var_4 );
            }
            else
                self.flashattacker = undefined;
        }

        if ( var_7 && isdefined( var_4 ) )
            var_4 thread _id_0CAD( var_9, var_10 );
    }
}

_id_0CAD( var_0, var_1 )
{
    if ( !isdefined( self.flashduration ) || var_0 > self.flashduration )
        self.flashduration = var_0;

    if ( !isdefined( self.flashrumbleduration ) || var_1 > self.flashrumbleduration )
        self.flashrumbleduration = var_1;

    wait 0.05;

    if ( isdefined( self.flashduration ) )
    {
        self shellshock( "flashbang_mp", self.flashduration );
        self.flashendtime = gettime() + self.flashduration * 1000;
    }

    if ( isdefined( self.flashrumbleduration ) )
        thread _id_38C5( self.flashrumbleduration );

    self.flashduration = undefined;
    self.flashrumbleduration = undefined;
}

_id_5107()
{
    return isdefined( self.flashendtime ) && gettime() < self.flashendtime;
}

getlastflashbangattacker()
{
    return self.flashattacker;
}
