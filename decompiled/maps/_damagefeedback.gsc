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
    precacheshader( "damage_feedback" );
    precacheshader( "damage_feedback_headshot" );
    maps\_utility::_id_30B2();
    maps\_utility::_id_30B3();
    common_scripts\utility::_id_0D13( level.players, ::_id_4CCF );
    common_scripts\utility::_id_0D13( level.players, maps\_utility::_id_3C8C );
    common_scripts\utility::_id_0D13( level.players, ::_id_5E3F );
}

_id_4CCF()
{
    self._id_4AB7 = newclienthudelem( self );
    self._id_4AB7.alignx = "center";
    self._id_4AB7.aligny = "middle";
    self._id_4AB7.horzalign = "center";
    self._id_4AB7.vertalign = "middle";
    self._id_4AB7.alpha = 0;
    self._id_4AB7.archived = 1;
    self._id_4AB7 setshader( "damage_feedback", 50, 100 );
    self._id_4AB7.y = 25;
    self._id_4AB8 = newclienthudelem( self );
    self._id_4AB8.alignx = "center";
    self._id_4AB8.aligny = "middle";
    self._id_4AB8.horzalign = "center";
    self._id_4AB8.vertalign = "middle";
    self._id_4AB8.alpha = 0;
    self._id_4AB8.archived = 1;
    self._id_4AB8 setshader( "damage_feedback_headshot", 50, 100 );
    self._id_4AB8.y = 25;
}

_id_5E3F()
{
    maps\_utility::_id_0749( ::_id_259E );
}

_id_8EF9()
{
    maps\_utility::_id_733C( ::_id_259E );
}

_id_259E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = 0;

    if ( isdefined( self._id_18A8 ) )
    {
        var_11 = [];
        var_11["MOD_PISTOL_BULLET"] = 1;
        var_11["MOD_RIFLE_BULLET"] = 1;

        if ( isdefined( var_11[var_4] ) )
        {
            if ( var_0 <= self._id_18A8 && ( !isdefined( self._id_5A7A ) || !self._id_5A7A || !isdefined( var_9 ) || !issubstr( var_9, "iw5_em1" ) ) )
                return;
        }
    }

    if ( isdefined( self.damagelocation ) && ( self.damagelocation == "head" || self.damagelocation == "helmet" ) )
        var_10 = 1;

    var_1 _id_9B0C( self, var_10 );
}

_id_9B0C( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( var_0.team ) )
        var_2 = var_0.team;
    else if ( isdefined( var_0._id_7AEF ) )
        var_2 = var_0._id_7AEF;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "neutral" || isdefined( self.team ) && var_2 == self.team )
        return;

    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
        return;

    if ( isdefined( var_0._id_4257 ) && var_0._id_4257 )
        return;

    if ( isdefined( var_0._id_7A06 ) && var_0._id_7A06 )
        return;

    _id_9B0E( var_0 );
    _id_9B0D( var_1, var_0 );
}

_id_9B0E( var_0 )
{
    if ( !maps\_utility::_id_5012() )
        return;

    if ( isdefined( var_0 ) && isdefined( var_0._id_2B02 ) && var_0._id_2B02 )
        return;

    if ( isplayer( self ) )
    {
        var_1 = "SP_hit_alert_npc";

        if ( soundexists( var_1 ) )
        {
            level.player playlocalsound( var_1 );
            return;
        }
    }
    else if ( isplayer( var_0 ) )
        return;
}

_id_9B0D( var_0, var_1 )
{
    if ( !maps\_utility::_id_5011() )
        return;

    if ( !isplayer( self ) )
        return;

    var_2 = 1;

    if ( isdefined( level._id_8637._id_8A56 ) )
        var_2 = level._id_8637._id_8A56;

    if ( 0 && isdefined( var_0 ) && var_0 && isdefined( var_1 ) && !isalive( var_1 ) )
    {
        self._id_4AB8.alpha = 1;
        self._id_4AB8 fadeovertime( var_2 );
        self._id_4AB8.alpha = 0;
        var_3 = getdvarfloat( "cg_crosshairVerticalOffset" ) * 240;
        self._id_4AB8.y = 25 - int( var_3 );
    }
    else
    {
        self._id_4AB7.alpha = 1;
        self._id_4AB7 fadeovertime( var_2 );
        self._id_4AB7.alpha = 0;
        var_3 = getdvarfloat( "cg_crosshairVerticalOffset" ) * 240;
        self._id_4AB7.y = 25 - int( var_3 );
    }
}
