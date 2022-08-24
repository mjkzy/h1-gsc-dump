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
    level.mw1_health_regen = 1;
    level.healthoverlaycutoff = 0.55;
    var_0 = 5;
    var_0 = maps\mp\gametypes\_tweakables::_id_4142( "player", "healthregentime" );
    level.playerhealth_regularregendelay = var_0 * 1000;
    level.healthregendisabled = level.playerhealth_regularregendelay <= 0;
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
        thread _id_6CC4();
    }
}

_id_6CC4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( self.health <= 0 )
        return;

    var_0 = 0;
    var_1 = 0;
    thread _id_6D22();

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( self.health <= 0 )
            return;

        var_1 = gettime();
        var_7 = self.health / self.maxhealth;

        if ( !isdefined( self._id_4792 ) )
            self.regenspeed = 1;
        else if ( self._id_4792 == 0.33 )
            self.regenspeed = 0.75;
        else if ( self._id_4792 == 0.66 )
            self.regenspeed = 0.5;
        else if ( self._id_4792 == 0.99 )
            self.regenspeed = 0.3;
        else
            self.regenspeed = 1;

        if ( var_7 <= level.healthoverlaycutoff )
            self.atbrinkofdeath = 1;

        thread _id_4790( var_1, var_7 );
        thread _id_17E5( var_1, var_7, var_2, var_6 );
    }
}

_id_17E5( var_0, var_1, var_2, var_3 )
{
    self notify( "breathingManager" );
    self endon( "breathingManager" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
        return;

    if ( !isplayer( self ) )
        return;

    if ( isdefined( var_3 ) && var_3 != "MOD_FALLING" || isdefined( var_2 ) && var_2 > 1 )
        _id_6A3C( var_0 );

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( isdefined( level.playerdobreathing ) && !self [[ level.playerdobreathing ]]() )
        return;

    if ( level.mw1_health_regen )
    {
        self.breathingstoptime = var_0 + 6000 * self.regenspeed;
        return;
    }

    self.breathingstoptime = var_0 + 3000 * self.regenspeed;
    wait(7 * self.regenspeed);

    if ( !level.gameended && isdefined( self.atbrinkofdeath ) && self.atbrinkofdeath == 1 )
    {
        if ( self hasfemalecustomizationmodel() )
            self playlocalsound( "deaths_door_exit_female" );
        else
            self playlocalsound( "deaths_door_exit" );

        self.atbrinkofdeath = 0;
    }
}

_id_6A3C( var_0 )
{
    if ( isdefined( level.customplaydamagesound ) )
        self thread [[ level.customplaydamagesound ]]( var_0 );
    else
    {
        if ( isdefined( self._id_258B ) && self._id_258B + 5000 > var_0 )
            return;

        self._id_258B = var_0;
        var_1 = randomintrange( 1, 8 );

        if ( self.team == "axis" )
        {
            if ( self hasfemalecustomizationmodel() )
                self playsound( "generic_pain_enemy_fm_" + var_1 );
            else
                self playsound( "generic_pain_enemy_" + var_1 );
        }
        else
        {
            if ( self hasfemalecustomizationmodel() )
            {
                self playsound( "generic_pain_friendly_fm_" + var_1 );
                return;
            }

            self playsound( "generic_pain_friendly_" + var_1 );
        }
    }
}

_id_4790( var_0, var_1 )
{
    self notify( "healthRegeneration" );
    self endon( "healthRegeneration" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    level endon( "game_ended" );

    if ( level.healthregendisabled )
        return;

    if ( !isdefined( self._id_4BB9 ) )
        self._id_4BB9 = 0;

    if ( self._id_4BB9 == 0 )
        wait(level.playerhealth_regularregendelay / 1000 * self.regenspeed);
    else
        self._id_4BB9 = 0;

    if ( var_1 < 0.55 )
        var_2 = 1;
    else
        var_2 = 0;

    for (;;)
    {
        if ( level.mw1_health_regen && !var_2 )
        {
            if ( level.mw1_health_regen )
                wait 0.05;

            self.health = self.maxhealth;
            break;
        }
        else if ( self.regenspeed == 0.75 )
        {
            wait 0.2;

            if ( self.health < self.maxhealth )
                self.health += 5;
            else
                break;
        }
        else if ( self.regenspeed == 0.5 )
        {
            wait 0.05;

            if ( self.health < self.maxhealth )
                self.health += 2;
            else
                break;
        }
        else if ( self.regenspeed == 0.3 )
        {
            wait 0.15;

            if ( self.health < self.maxhealth )
                self.health += 40;
            else
                break;
        }
        else if ( !isdefined( self.regenspeed ) || self.regenspeed == 1 )
        {
            if ( !level.mw1_health_regen )
                wait 0.05;

            if ( self.health < self.maxhealth )
            {
                if ( level.mw1_health_regen )
                {
                    self.health += 10;

                    if ( self.health > self.maxhealth )
                        self.health = self.maxhealth;

                    wait 0.05;
                }
                else
                    self.health += 1;
            }
            else
                break;
        }

        if ( self.health > self.maxhealth )
            self.health = self.maxhealth;
    }

    maps\mp\gametypes\_damage::_id_7445();
    maps\mp\gametypes\_misions::_id_478F();
}

_id_9FB2()
{
    self notify( "waiting_to_stop_remote" );
    self endon( "waiting_to_stop_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "stopped_using_remote" );
    maps\mp\_utility::_id_74FA( 0 );
}

_id_6D22()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return;

    if ( !isplayer( self ) )
        return;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    wait 3;

    for (;;)
    {
        wait 0.2;

        if ( self.health <= 0 )
            return;

        if ( self.health >= self.maxhealth * 0.55 )
            continue;

        if ( level.healthregendisabled && gettime() > self.breathingstoptime )
            continue;

        if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
            continue;

        if ( self hasfemalecustomizationmodel() )
            self playlocalsound( "deaths_door_mp_female" );
        else
            self playlocalsound( "deaths_door_mp_male" );

        wait 1.284;
        wait(0.1 + randomfloat( 0.8 ));
    }
}
