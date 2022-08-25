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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::build_template( "m1a1", var_0, var_1, var_2 );
    maps\_vehicle::build_localinit( ::_id_4D10 );
    maps\_vehicle::build_deathmodel( "vehicle_m1a1_abrams", "vehicle_m1a1_abrams_dmg" );
    maps\_vehicle::build_shoot_shock( "tankblast" );
    maps\_vehicle::build_drive( %abrams_movement, %abrams_movement_backwards, 10 );
    maps\_vehicle::build_exhaust( "fx/distortion/abrams_exhaust" );
    maps\_vehicle::build_deckdust( "fx/dust/abrams_deck_dust" );
    maps\_vehicle::build_treadfx();
    maps\_vehicle::build_deathfx( "fx/explosions/large_vehicle_explosion", undefined, "exp_armor_vehicle" );
    maps\_vehicle::build_turret( "m1a1_coaxial_mg", "tag_coax_mg", "vehicle_m1a1_abrams_PKT_Coaxial_MG" );
    maps\_vehicle::build_life( 999, 500, 1500 );
    maps\_vehicle::build_rumble( "tank_rumble", 0.15, 4.5, 900, 1, 1 );
    maps\_vehicle::build_team( "allies" );
    maps\_vehicle::build_mainturret();
    maps\_vehicle::build_aianims( ::_id_7F23, ::_id_7EFA );
    maps\_vehicle::build_frontarmor( 0.33 );
}

_id_4D10()
{
    if ( !isdefined( level.aud.disable_m1a1_audio ) )
        _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 6000;
    var_2 = 1.0;
    vehicle_scripts\_m1a1_aud::snd_init_m1a1();
    thread _id_5D80();
    self._id_86CE = self._id_799F;

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_3 = distance( self.origin, level.player.origin );

            if ( var_0 && var_3 > var_1 )
            {
                vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_2 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_3 < var_1 )
            {
                vehicle_scripts\_m1a1_aud::snd_start_m1a1();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_2 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    var_0 = 1.0;
    vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_0 );
}

_id_7EFA( var_0 )
{
    return var_0;
}

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 11; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_406A = 1;
    return var_0;
}
