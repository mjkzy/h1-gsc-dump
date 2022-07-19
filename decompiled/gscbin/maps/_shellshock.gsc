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

main( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level thread internalmain( var_0, var_1, var_2, var_3, var_4, var_5 );
}

internalmain( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 12;
    else if ( var_0 < 7 )
        var_0 = 7;

    if ( !isdefined( var_1 ) )
        var_1 = 150;

    if ( !isdefined( var_2 ) )
        var_2 = 100;

    if ( !isdefined( var_3 ) )
        var_3 = 100;

    if ( !isdefined( var_5 ) )
        var_6 = "default";
    else
        var_6 = var_5;

    var_7 = level.playercardbackground getorigin() + ( 0, 8, 2 );
    var_8 = 320;
    var_9 = var_1 + randomint( var_2 );
    var_10 = var_3;
    level.playercardbackground playsound( "weapons_rocket_explosion" );
    wait 0.25;
    radiusdamage( var_7, var_8, var_9, var_10 );
    earthquake( 0.75, 2, var_7, 2250 );

    if ( isalive( level.playercardbackground ) )
    {
        level.playercardbackground allowstand( 0 );
        level.playercardbackground allowcrouch( 0 );
        level.playercardbackground allowprone( 1 );
        wait 0.15;
        level.playercardbackground viewkick( 127, level.playercardbackground.origin );
        level.playercardbackground shellshock( var_6, var_0 );

        if ( !isdefined( var_4 ) )
            level.playercardbackground thread playerhitable( var_0 );

        wait 1.5;
        level.playercardbackground allowstand( 1 );
        level.playercardbackground allowcrouch( 1 );
    }
}

playerhitable( var_0 )
{
    self._id_83BD = 1;
    self.ignoretriggers = 1;
    self notify( "player is shell shocked" );
    self endon( "player is shell shocked" );
    wait(var_0 - 1);
    self._id_83BD = 0;
    self.ignoretriggers = 0;
}
