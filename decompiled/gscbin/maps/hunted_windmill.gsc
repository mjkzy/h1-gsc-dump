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
    common_scripts\utility::_id_76B9( "windmill_wheel", ::windmill_wheel_setup );
}

windmill_wheel_setup()
{
    self.rotate_speed = 1.0;
    self _meth_8563( 1 );
    var_0 = getent( self._not_team, "targetname" );

    if ( !isdefined( var_0 ) )
    {

    }

    self linkto( var_0 );
    thread windmill_wheel_think();
    var_0 thread windmill_top_setup();
}

windmill_top_setup()
{
    self.missile_fire = 0.1;
    self.maxrange = 1.0;
    thread windmill_top_think();
}

windmill_wheel_think()
{
    self endon( "deleting" );

    for (;;)
    {
        self _meth_8425( ( 30, 0, 0 ), self.rotate_speed );
        wait(self.rotate_speed);
    }
}

windmill_top_think()
{
    self endon( "deleting" );
    var_0 = 1.5;

    for (;;)
    {
        var_1 = randomfloatrange( self.missile_fire, self.maxrange );
        var_0 *= -1;
        self rotateyaw( var_0, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
    }
}
