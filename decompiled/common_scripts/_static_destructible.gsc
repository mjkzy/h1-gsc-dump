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
    var_0 = getentarray( "static_destructible", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::static_destructible_think );
}

static_destructible_think()
{
    self setcandamage( 1 );
    self.destroyed_fx_id = loadfx( self._id_7A99 );
    var_0 = common_scripts\utility::_id_8959();
    var_0 linkto( self );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 != "MOD_MELEE" && var_5 != "MOD_IMPACT" )
        {
            playfxontag( self.destroyed_fx_id, var_0, "tag_origin" );
            var_6 = getent( self.target, "targetname" );
            var_6 delete();
            self delete();
            wait 15;
            var_0 delete();
            break;
        }

        wait 0.05;
    }
}
