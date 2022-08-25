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
    if ( !level.teambased )
        return;

    precacheshader( "headicon_dead" );
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_7C76 = [];
    }
}

_id_9B10()
{

}

adddeathicon( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !level.teambased )
        return;

    if ( isdefined( var_4 ) && isplayer( var_4 ) && var_4 maps\mp\_utility::_hasperk( "specialty_silentkill" ) )
        return;

    var_6 = var_0.origin;
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );

    if ( !var_5 )
    {
        wait 0.05;
        maps\mp\_utility::_id_A0F4();
    }

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    if ( level.hardcoremode )
        return;

    if ( isdefined( self._id_5592 ) )
        self._id_5592 destroy();

    var_7 = newteamhudelem( var_2 );
    var_7.x = var_6[0];
    var_7.y = var_6[1];
    var_7.z = var_6[2] + 54;
    var_7.alpha = 0.61;
    var_7.archived = 1;

    if ( level.splitscreen )
        var_7 setshader( "headicon_dead", 14, 14 );
    else
        var_7 setshader( "headicon_dead", 7, 7 );

    var_7 setwaypoint( 0 );
    self._id_5592 = var_7;
    var_7 thread _id_28F5( var_3 );
}

_id_28F5( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self fadeovertime( 1.0 );
    self.alpha = 0;
    wait 1.0;
    self destroy();
}
