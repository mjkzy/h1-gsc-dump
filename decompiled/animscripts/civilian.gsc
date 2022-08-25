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
#using_animtree("generic_human");

cover()
{
    self endon( "killanimscript" );
    self _meth_8144( %animscript_root, 0.2 );
    animscripts\utility::_id_9B2B();

    if ( animscripts\utility::_id_5124() )
        var_0 = "idle_combat";
    else
        var_0 = "idle_noncombat";

    var_1 = undefined;

    if ( isdefined( self.animname ) && isdefined( level._id_78AC[self.animname] ) )
        var_1 = level._id_78AC[self.animname][var_0];

    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( level._id_78AC["default_civilian"] ) )
            return;

        var_1 = level._id_78AC["default_civilian"][var_0];
    }

    thread _id_5F05();

    for (;;)
    {
        self setflaggedanimknoball( "idle", common_scripts\utility::_id_710E( var_1 ), %animscript_root, 1, 0.2, 1 );
        self waittillmatch( "idle", "end" );
    }
}

_id_5F05()
{
    self endon( "killanimscript" );

    while ( !isdefined( self._id_1C65 ) )
        wait 1;
}

stop()
{
    cover();
}

_id_3D70()
{
    return anim._id_1E0F[randomint( anim._id_1E0F.size )];
}
