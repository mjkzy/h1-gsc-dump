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

main( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_2 ) )
        var_2 = "weapon_c4_obj";

    if ( !isdefined( var_0 ) )
        level._id_196C = "c4";
    else
        level._id_196C = var_0;

    precachemodel( var_1 );
    precachemodel( var_2 );
    precacheitem( level._id_196C );

    if ( isdefined( level.c4_explosion_fx_override ) )
        level._effect["c4_explosion"] = level.c4_explosion_fx_override;
    else
        level._effect["c4_explosion"] = loadfx( "fx/explosions/grenadeExp_metal" );
}

c4_location( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    if ( !isdefined( var_4 ) )
        var_4 = "weapon_c4";

    if ( !isdefined( var_5 ) )
        var_5 = "weapon_c4_obj";

    if ( isdefined( var_0 ) )
        var_6 = self gettagorigin( var_0 );
    else if ( isdefined( var_3 ) )
        var_6 = var_3;
    else
    {

    }

    var_7 = spawn( "script_model", var_6 + var_1 );
    var_7 setmodel( var_5 );

    if ( isdefined( var_0 ) )
        var_7 linkto( self, var_0, var_1, var_2 );
    else
        var_7.angles = self.angles;

    var_7.trigger = get_use_trigger();

    if ( isdefined( level.c4_hintstring ) )
        var_7.trigger sethintstring( level.c4_hintstring );
    else
        var_7.trigger sethintstring( &"SCRIPT_PLATFORM_HINT_PLANTEXPLOSIVES" );

    if ( isdefined( var_0 ) )
    {
        var_7.trigger linkto( self, var_0, var_1, var_2 );
        var_7.trigger.islinked = 1;
    }
    else
        var_7.trigger.origin = var_7.origin;

    var_7 thread handle_use( self, var_4 );

    if ( !isdefined( self.multiple_c4 ) )
        var_7 thread handle_delete( self );

    var_7 thread handle_clear_c4( self );
    return var_7;
}

_id_6A35()
{
    self endon( "death" );
    wait 0.1;
    playfxontag( common_scripts\utility::_id_3FA8( "c4_light_blink" ), self, "tag_fx" );
}

handle_use( var_0, var_1 )
{
    var_0 endon( "clear_c4" );

    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_0.multiple_c4 ) )
        var_0 endon( "c4_planted" );

    if ( !isdefined( var_0.c4_count ) )
        var_0.c4_count = 0;

    var_0.c4_count++;
    self.trigger usetriggerrequirelookat();
    self.trigger waittill( "trigger", var_2 );
    level notify( "c4_in_place", self );
    self.trigger unlink();
    self.trigger release_use_trigger();
    self playsound( "c4_bounce_default" );
    self setmodel( var_1 );
    thread _id_6A35();
    var_0.c4_count--;

    if ( !isdefined( var_0.multiple_c4 ) || !var_0.c4_count )
        var_2 switch_to_detonator();

    thread handle_detonation( var_0, var_2 );
    var_0 notify( "c4_planted", self );
}

handle_delete( var_0 )
{
    var_0 endon( "clear_c4" );
    self.trigger endon( "trigger" );
    var_0 waittill( "c4_planted", var_1 );
    self.trigger unlink();
    self.trigger release_use_trigger();
    self delete();
}

handle_detonation( var_0, var_1 )
{
    var_0 endon( "clear_c4" );
    var_1 waittill( "detonate" );
    playfx( level._effect["c4_explosion"], self.origin );
    var_2 = spawn( "script_origin", self.origin );

    if ( isdefined( level.c4_sound_override ) )
        var_2 playsound( "detpack_explo_main", "sound_done" );

    self entityradiusdamage( self.origin, 256, 200, 50 );
    earthquake( 0.4, 1, self.origin, 1000 );

    if ( isdefined( self ) )
        self delete();

    var_1 thread remove_detonator();
    var_0 notify( "c4_detonation" );
    var_2 waittill( "sound_done" );
    var_2 delete();
}

handle_clear_c4( var_0 )
{
    var_0 endon( "c4_detonation" );
    var_0 waittill( "clear_c4" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.trigger.isradarblocked ) && self.trigger.isradarblocked )
        self.trigger release_use_trigger();

    if ( isdefined( self ) )
        self delete();

    level.playercardbackground thread remove_detonator();
}

remove_detonator()
{
    level endon( "c4_in_place" );
    wait 1;
    var_0 = 0;

    if ( level._id_196C == self getcurrentweapon() && isdefined( self._id_63C1 ) )
    {
        if ( self._id_63C1 == "none" )
        {
            var_0 = 1;
            self switchtoweapon( self getweaponslistprimaries()[0] );
        }
        else if ( self hasweapon( self._id_63C1 ) && self._id_63C1 != level._id_196C )
            self switchtoweapon( self._id_63C1 );
        else
            self switchtoweapon( self getweaponslistprimaries()[0] );
    }

    self._id_63C1 = undefined;

    if ( 0 != self getammocount( level._id_196C ) )
        return;

    self waittill( "weapon_change" );
    self takeweapon( level._id_196C );
}

switch_to_detonator()
{
    var_0 = undefined;

    if ( !isdefined( self._id_63C1 ) )
        self._id_63C1 = self getcurrentweapon();

    var_1 = self getweaponslistall();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] != level._id_196C )
            continue;

        var_0 = var_1[var_2];
    }

    if ( !isdefined( var_0 ) )
    {
        self giveweapon( level._id_196C );
        self setweaponammoclip( level._id_196C, 0 );
        self setactionslot( 2, "weapon", level._id_196C );
    }

    self switchtoweapon( level._id_196C );
}

get_use_trigger()
{
    var_0 = getentarray( "generic_use_trigger", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].isradarblocked ) && var_0[var_1].isradarblocked )
            continue;

        if ( !isdefined( var_0[var_1].isradarblocked ) )
            var_0[var_1] enablelinkto();

        var_0[var_1].isradarblocked = 1;
        var_0[var_1]._id_63DC = var_0[var_1].origin;
        return var_0[var_1];
    }
}

release_use_trigger()
{
    if ( isdefined( self.islinked ) )
        self unlink();

    self.islinked = undefined;
    self.origin = self._id_63DC;
    self.isradarblocked = 0;
}
