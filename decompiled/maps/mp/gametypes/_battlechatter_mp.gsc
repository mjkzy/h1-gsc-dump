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
    if ( level.multiteambased )
    {
        foreach ( var_1 in level.teamnamelist )
        {
            level.isteamspeaking[var_1] = 0;
            level.speakers[var_1] = [];
        }
    }
    else
    {
        level.isteamspeaking["allies"] = 0;
        level.isteamspeaking["axis"] = 0;
        level.speakers["allies"] = [];
        level.speakers["axis"] = [];
    }

    level.bcsounds = [];
    level.bcsounds["reload"] = "inform_reloading_generic";
    level.bcsounds["frag_out"] = "inform_attack_grenade";
    level.bcsounds["flash_out"] = "inform_attack_flashbang";
    level.bcsounds["smoke_out"] = "inform_attack_smoke";
    level.bcsounds["conc_out"] = "inform_attack_stun";
    level.bcsounds["c4_plant"] = "inform_attack_thwc4";
    level.bcsounds["claymore_plant"] = "inform_plant_claymore";
    level.bcsounds["kill"] = "inform_killfirm_infantry";
    level._id_133F = [];

    foreach ( var_5, var_4 in level.speakers )
    {
        level._id_9F33[var_5]["m"] = 0;
        level._id_9F33[var_5]["fe"] = 0;
    }

    var_6 = getdvar( "g_gametype" );
    level.istactical = 1;

    if ( var_6 == "war" || var_6 == "conf" || var_6 == "dom" )
        level.istactical = 0;

    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( maps\mp\_utility::_id_5092( level._id_9E56 ) )
            continue;

        self._id_133F = [];
        var_0 = maps\mp\gametypes\_teams::_id_4120( self.team );

        if ( !isdefined( self.pers["voiceIndex"] ) )
        {
            var_1 = 4;
            var_2 = 4;
            var_3 = "m";

            if ( !isagent( self ) && self hasfemalecustomizationmodel() )
                var_3 = "fe";

            self.pers["voiceNum"] = level._id_9F33[self.team][var_3] + 1;

            if ( var_3 == "fe" )
                level._id_9F33[self.team][var_3] = ( level._id_9F33[self.team][var_3] + 1 ) % var_2;
            else
                level._id_9F33[self.team][var_3] = ( level._id_9F33[self.team][var_3] + 1 ) % var_1;

            self.pers["voicePrefix"] = var_0 + self.pers["voiceNum"] + var_3 + "_";
        }

        if ( level.splitscreen )
            continue;

        if ( !level.teambased )
            continue;

        thread _id_731E();
        thread _id_440E();
        thread claymoretracking();
    }
}

_id_731E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload_start" );
        level thread _id_7826( self, "reload", 0 );
    }
}

_id_440E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "h1_fraggrenade_mp" )
        {
            level thread _id_7826( self, "frag_out", 0 );
            continue;
        }

        if ( var_1 == "h1_flashgrenade_mp" )
        {
            level thread _id_7826( self, "flash_out", 0 );
            continue;
        }

        if ( var_1 == "h1_concussiongrenade_mp" )
        {
            level thread _id_7826( self, "conc_out", 0 );
            continue;
        }

        if ( var_1 == "h1_smokegrenade_mp" )
        {
            level thread _id_7826( self, "smoke_out", 0 );
            continue;
        }

        if ( var_1 == "h1_c4_mp" )
            level thread _id_7826( self, "c4_plant", 0 );
    }
}

claymoretracking()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "begin_firing" );
        var_0 = self getcurrentweapon();

        if ( var_0 == "h1_claymore_mp" )
            level thread _id_7826( self, "claymore_plant", 0 );
    }
}

_id_7827( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    wait(var_2);

    if ( !isdefined( var_3 ) && isdefined( 0 ) )
        var_3 = 0;

    _id_7826( var_0, var_1, var_3, var_4 );
}

_id_7826( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_1CA7 ) && level._id_1CA7 )
        return;

    if ( isdefined( var_0._id_133C ) && var_0._id_133C == 1 )
        return;

    if ( _id_51B2( var_0 ) )
        return;

    if ( var_0.team != "spectator" )
    {
        var_4 = var_0.pers["voicePrefix"];

        if ( isdefined( level.bcsounds[var_1] ) )
        {
            var_5 = var_4 + level.bcsounds[var_1];

            switch ( var_1 )
            {
                case "callout_sniper":
                case "callout_hover":
                case "callout_shield":
                case "callout_cloak":
                case "callout_overclock":
                    var_1 = "callout_generic";
                    break;
            }
        }
        else
        {
            _id_57F5( var_1 );
            var_5 = var_4 + "co_loc_" + var_1;
            var_0 thread _id_2D82( var_5, var_1 );
            var_1 = "callout_location";
        }

        var_0 _id_9AFF( var_1 );
        var_0 thread _id_2D7C( var_5, var_2, var_3 );
    }
}

_id_2D7C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = self.pers["team"];
    level _id_0830( self, var_3 );

    if ( var_2 && ( !level.istactical || !maps\mp\_utility::_hasperk( "specialty_coldblooded" ) && ( isagent( self ) || self issighted() ) ) )
    {
        if ( isagent( self ) || level._id_09DD[var_3] > 3 )
            thread _id_2D7D( var_0, var_3 );
    }

    if ( !soundexists( var_0 ) )
    {
        level _id_73DF( self, var_3 );
        return;
    }

    if ( isagent( self ) || isdefined( var_1 ) && var_1 )
        self playsoundtoteam( var_0, var_3 );
    else
        self playsoundtoteam( var_0, var_3, self );

    thread _id_9363( var_0 );
    common_scripts\utility::_id_A069( var_0, "death", "disconnect" );
    level _id_73DF( self, var_3 );
}

_id_2D7D( var_0, var_1 )
{
    if ( soundexists( var_0 ) )
    {
        foreach ( var_3 in level.teamnamelist )
        {
            if ( var_3 != var_1 )
                self playsoundtoteam( var_0, var_3 );
        }
    }
}

_id_2D82( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_A070( var_0, "death", "disconnect" );

    if ( var_2 == var_0 )
    {
        var_3 = self.team;

        if ( !isagent( self ) )
            var_4 = self hasfemalecustomizationmodel();
        else
            var_4 = 0;

        var_5 = self.pers["voiceNum"];
        var_6 = self.origin;
        wait 0.5;

        foreach ( var_8 in level.participants )
        {
            if ( !isdefined( var_8 ) )
                continue;

            if ( var_8 == self )
                continue;

            if ( !maps\mp\_utility::_id_5189( var_8 ) )
                continue;

            if ( var_8.team != var_3 )
                continue;

            if ( !isagent( var_8 ) )
                var_9 = var_8 hasfemalecustomizationmodel();
            else
                var_9 = 0;

            if ( ( var_5 != var_8.pers["voiceNum"] || var_4 != var_9 ) && distancesquared( var_6, var_8.origin ) <= 262144 && !_id_51B2( var_8 ) )
            {
                var_10 = var_8.pers["voicePrefix"];
                var_11 = var_10 + "co_loc_" + var_1 + "_echo";

                if ( common_scripts\utility::_id_2006() && soundexists( var_11 ) )
                    var_12 = var_11;
                else
                    var_12 = var_10 + level.bcsounds["callout_response_generic"];

                var_8 thread _id_2D7C( var_12, 0, 0 );
                break;
            }
        }
    }
}

_id_9363( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 2.0;
    self notify( var_0 );
}

_id_51B2( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( var_1 ) )
        var_1 = 1000;

    var_2 = var_1 * var_1;

    if ( isdefined( var_0 ) && isdefined( var_0.team ) && var_0.team != "spectator" )
    {
        for ( var_3 = 0; var_3 < level.speakers[var_0.team].size; var_3++ )
        {
            var_4 = level.speakers[var_0.team][var_3];

            if ( var_4 == var_0 )
                return 1;

            if ( !isdefined( var_4 ) )
                continue;

            if ( distancesquared( var_4.origin, var_0.origin ) < var_2 )
                return 1;
        }
    }

    return 0;
}

_id_0830( var_0, var_1 )
{
    level.speakers[var_1][level.speakers[var_1].size] = var_0;
}

_id_73DF( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level.speakers[var_1].size; var_3++ )
    {
        if ( level.speakers[var_1][var_3] == var_0 )
            continue;

        var_2[var_2.size] = level.speakers[var_1][var_3];
    }

    level.speakers[var_1] = var_2;
}

_id_2AF6( var_0 )
{
    var_0._id_133C = 1;
}

_id_3109( var_0 )
{
    var_0._id_133C = undefined;
}

_id_9AFF( var_0 )
{
    var_1 = self.pers["team"];
    self._id_133F["last_say_time"][var_0] = gettime();
    level._id_133F["last_say_time"][var_1][var_0] = gettime();
    level._id_133F["last_say_pos"][var_1][var_0] = self.origin;
}

_id_400A()
{
    var_0 = _id_3CBF();
    var_0 = common_scripts\utility::_id_0CF5( var_0 );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F7( var_2 ) )
                return var_2;
        }

        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F8( var_2 ) )
                return var_2;
        }
    }

    return undefined;
}

_id_414B( var_0 )
{
    var_1 = _id_3CBF();
    var_1 = common_scripts\utility::_id_0CF5( var_1 );

    if ( var_1.size )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F7( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }

        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F8( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }
    }

    return undefined;
}

_id_3CBF()
{
    var_0 = anim._id_134A;
    var_1 = self getistouchingentities( var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_57FB ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_9AA2()
{
    if ( isdefined( anim._id_134A ) )
        anim._id_134A = common_scripts\utility::_id_0D01( anim._id_134A );
}

_id_503C()
{
    var_0 = _id_3CBF();

    foreach ( var_2 in var_0 )
    {
        if ( !_id_57F8( var_2 ) )
            return 1;
    }

    return 0;
}

_id_57F7( var_0 )
{
    var_1 = _id_57FA( var_0._id_57FB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    return 1;
}

_id_57F8( var_0 )
{
    var_1 = _id_57FA( var_0._id_57FB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = var_1 + 25000;

    if ( gettime() < var_2 )
        return 1;

    return 0;
}

_id_57F5( var_0 )
{
    anim._id_57FC[var_0] = gettime();
}

_id_57FA( var_0 )
{
    if ( isdefined( anim._id_57FC[var_0] ) )
        return anim._id_57FC[var_0];

    return undefined;
}

_id_1AB0( var_0 )
{
    foreach ( var_2 in var_0._id_57FB )
    {
        var_3 = _id_400B( "co_loc_" + var_2 );
        var_4 = _id_409F( var_2, 0 );
        var_5 = _id_400B( "concat_loc_" + var_2 );
        var_6 = soundexists( var_3 ) || soundexists( var_4 ) || soundexists( var_5 );

        if ( var_6 )
            return var_6;
    }

    return 0;
}

_id_1AC2( var_0 )
{
    var_1 = var_0._id_57FB;

    foreach ( var_3 in var_1 )
    {
        if ( _id_50D3( var_3, self ) )
            return 1;
    }

    return 0;
}

_id_3F24( var_0 )
{
    var_1 = undefined;
    var_2 = self._id_57FB;

    foreach ( var_4 in var_2 )
    {
        if ( _id_50D4( var_4, var_0 ) && !isdefined( self.qafinished ) )
        {
            var_1 = var_4;
            break;
        }

        if ( _id_50D5( var_4 ) )
            var_1 = var_4;
    }

    return var_1;
}

_id_50D5( var_0 )
{
    return issubstr( var_0, "_report" );
}

_id_50D3( var_0, var_1 )
{
    var_2 = var_1 _id_400B( "concat_loc_" + var_0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_50D4( var_0, var_1 )
{
    if ( issubstr( var_0, "_qa" ) && soundexists( var_0 ) )
        return 1;

    var_2 = var_1 _id_409F( var_0, 0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_400B( var_0 )
{
    var_1 = self.pers["voicePrefix"] + var_0;
    return var_1;
}

_id_409F( var_0, var_1 )
{
    var_2 = _id_400B( var_0 );
    var_2 += ( "_qa" + var_1 );
    return var_2;
}

_id_132E()
{
    return 0;
}

_id_132F()
{
    return 0;
}

_id_1335( var_0 )
{

}

_id_1336( var_0 )
{

}

_id_1330( var_0 )
{

}

_id_3EE9( var_0 )
{

}

_id_1337( var_0, var_1, var_2 )
{

}

_id_3A71( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 262144;

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == self.pers["team"] )
        {
            if ( var_2 != self && distancesquared( var_2.origin, self.origin ) <= var_0 )
                return 1;
        }
    }

    return 0;
}
