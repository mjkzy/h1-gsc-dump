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
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );

    if ( isdefined( self.a._id_612E ) )
    {
        wait 1.1;
        var_0 = self _meth_813e();

        if ( isdefined( var_0 ) )
        {
            var_1 = common_scripts\utility::_id_8959();
            var_1.origin = self.origin;
            var_1.angles = self.angles;
            self linkto( var_1 );
            var_1 moveto( var_0, 0.5 );
            wait 0.5;
            self unlink();
            var_1 delete();
        }
        else
            wait 0.5;

        return;
    }

    self unlink();

    if ( isdefined( self.enemy ) && isdefined( self.enemy.syncedmeleetarget ) && self.enemy.syncedmeleetarget == self )
        self.enemy.syncedmeleetarget = undefined;

    self _meth_8144( %root, 0.2 );
    self setflaggedanimrestart( "dog_anim", %german_shepherd_death_front, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dog_anim" );
}
