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
    self endon( "death" );
    self endon( "stop_animmode" );
    self notify( "killanimscript" );
    self._tag_entity endon( self._anime );

    if ( isdefined( self._custom_anim_thread ) )
    {
        self thread [[ self._custom_anim_thread ]]();
        self._custom_anim_thread = undefined;
    }

    var_0 = isdefined( self._custom_anim_loop ) && self._custom_anim_loop;

    if ( var_0 )
    {
        self endon( "stop_loop" );
        self._custom_anim_loop = undefined;
    }
    else
        thread _id_6216( self._anime );

    var_1 = self._anime;
    self._anime = undefined;
    var_2 = 0;

    if ( var_0 || isarray( level._id_78AC[self._animname][var_1] ) )
    {
        var_2 = level._id_78AC[self._animname][var_1].size;
        var_3 = level._id_78AC[self._animname][var_1][randomint( var_2 )];
    }
    else
        var_3 = level._id_78AC[self._animname][var_1];

    var_4 = getstartorigin( self._tag_entity.origin, self._tag_entity.angles, var_3 );
    var_5 = getstartangles( self._tag_entity.origin, self._tag_entity.angles, var_3 );
    var_6 = self _meth_813E( var_4 );

    if ( isdefined( var_6 ) )
        var_4 = var_6;
    else
    {

    }

    if ( !isdefined( self._id_6175 ) )
        self _meth_81C9( var_4, var_5 );

    self.pushable = 0;
    var_7 = 0.3;
    var_8 = 0.2;

    if ( isdefined( self.anim_blend_time_override ) )
    {
        var_7 = self.anim_blend_time_override;
        var_8 = self.anim_blend_time_override;
    }

    self _meth_8192( self._animmode );
    self _meth_8144( self._id_75DF, var_7 );
    self _meth_8193( "face angle", var_5[1] );
    var_9 = "custom_animmode";
    self setflaggedanimrestart( var_9, var_3, 1, var_8, 1 );
    self._tag_entity thread maps\_anim::_id_8C17( self, var_9, var_1, self._animname, var_3 );
    self._tag_entity thread maps\_anim::animscriptdonotetracksthread( self, var_9, var_1 );
    var_10 = self._tag_entity;
    self._tag_entity = undefined;
    self._animmode = undefined;
    self endon( "killanimscript" );
    var_11 = "end";

    if ( !var_0 )
    {
        if ( animhasnotetrack( var_3, "finish" ) )
            var_11 = "finish";
        else if ( animhasnotetrack( var_3, "stop anim" ) )
            var_11 = "stop anim";
    }

    for (;;)
    {
        self waittillmatch( var_9, var_11 );

        if ( var_0 )
        {
            var_3 = level._id_78AC[self._animname][var_1][randomint( var_2 )];
            self setflaggedanimknoblimitedrestart( var_9, var_3, 1, 0.2, 1 );

            if ( isdefined( var_10 ) )
            {
                var_10 thread maps\_anim::_id_8C17( self, var_9, var_1, self._animname, var_3 );
                var_10 thread maps\_anim::animscriptdonotetracksthread( self, var_9, var_1 );
            }

            continue;
        }

        break;
    }

    if ( var_11 != "end" )
        self _meth_8193( "face motion" );

    self notify( "finished_custom_animmode" + var_1 );
}

_id_6216( var_0 )
{
    self endon( "death" );
    self endon( "finished_custom_animmode" + var_0 );
    self waittill( "killanimscript" );
    self notify( "finished_custom_animmode" + var_0 );
}
