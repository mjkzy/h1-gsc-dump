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
    if ( !isdefined( self.cover ) )
        self.cover = spawnstruct();

    self.cover._id_8D56 = "none";
    self.cover._id_55FA = 0;
    self.cover._id_51CA = 0;
    self.cover._id_4880 = _id_22AC();
    self._id_22BA = self.node;
    _id_22B9();
    self waittill( "killanimscript" );
}

end_script()
{
    _id_22AF( self.cover._id_8D56 );
    self.cover._id_3936 = undefined;
    self.cover._id_55FA = undefined;
    self.cover._id_51CA = undefined;
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::end_script( "multi" );
}

_id_22B9()
{
    if ( !isdefined( self._id_22BA ) )
        return;

    var_0 = self._id_22BA getvalidcoverpeekouts();

    if ( isdefined( self.cover.arrivalnodetype ) )
    {
        if ( _id_22B5( self.cover.arrivalnodetype, var_0 ) )
        {
            var_1 = _id_22B6( self.cover.arrivalnodetype );
            self.cover.arrivalnodetype = undefined;
            return;
        }
    }

    if ( !isdefined( self.enemy ) )
    {
        _id_22B6( _id_22B3( var_0 ) );
        return;
    }

    var_2 = self._id_22BA.origin;
    var_3 = self.enemy.origin;
    var_4 = var_3 - var_2;
    var_5 = vectortoangles( var_4 );
    var_6 = angleclamp180( var_5[1] - self._id_22BA.angles[1] );
    var_7 = undefined;

    if ( var_6 > 12 )
        var_8 = [ "left", "over", "right" ];
    else if ( var_6 < -12 )
        var_8 = [ "right", "over", "left" ];
    else if ( var_6 > 5 )
    {
        var_8 = [ [ "left", "over" ], "right" ];
        var_7 = 15000;
    }
    else if ( var_6 < -5 )
    {
        var_8 = [ [ "right", "over" ], "left" ];
        var_7 = 15000;
    }
    else
    {
        var_8 = [ "over", [ "right", "left" ] ];
        var_7 = 15000;
    }

    var_9 = _id_22B1( var_8, var_0 );
    var_1 = _id_22B6( var_9, var_7 );
}

_id_22B5( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self.node getvalidcoverpeekouts();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == var_0 )
            return 1;
    }

    return 0;
}

_id_22B1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self.node getvalidcoverpeekouts();

    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        if ( !isarray( var_4 ) )
        {
            var_2[var_2.size] = var_4;
            continue;
        }

        var_4 = common_scripts\utility::array_randomize( var_4 );

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
            var_2[var_2.size] = var_4[var_5];
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( _id_22B5( var_2[var_3], var_1 ) )
            return var_2[var_3];
    }
}

_id_22B3( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.node getvalidcoverpeekouts();

    var_1 = randomint( var_0.size );
    return var_0[var_1];
}

_id_22B2( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self getvalidcoverpeekouts();

    if ( var_0[0] == "over" )
    {
        if ( self doesnodeallowstance( "stand" ) )
            return "stand";
        else
            return "crouch";
    }

    return var_0[0];
}

_id_22B6( var_0, var_1 )
{
    if ( var_0 == "over" )
    {
        var_2 = self.node doesnodeallowstance( "stand" );
        var_3 = self.node doesnodeallowstance( "crouch" );

        if ( var_2 )
        {
            if ( self.cover._id_8D56 != "crouch" || !var_3 )
                _id_22B7( "stand", var_1 );

            return 1;
        }
        else if ( var_3 )
        {
            if ( self.cover._id_8D56 != "stand" || !var_2 )
                _id_22B7( "crouch", var_1 );

            return 1;
        }
        else
        {

        }
    }
    else
    {
        _id_22B7( var_0, var_1 );
        return 1;
    }

    return 0;
}

_id_22B7( var_0, var_1 )
{
    if ( self.cover._id_8D56 == var_0 )
        return 0;

    if ( !isdefined( var_1 ) || var_1 < 0 )
        var_1 = 8000;

    var_2 = gettime();

    if ( self.cover._id_55FA > 0 && var_2 - self.cover._id_55FA < var_1 )
        return 0;

    self.cover._id_55FA = var_2;
    thread _id_22B8( var_0 );
    return 1;
}

_id_22B8( var_0 )
{
    var_1 = _id_22AC();
    _id_22AD( self.cover._id_8D56, self.a._id_6E5A, self.cover._id_4880, var_0, self.a._id_6E5A, var_1 );
    _id_22AF( self.cover._id_8D56 );
    self.cover._id_8D56 = var_0;
    self.cover._id_4880 = var_1;
    _id_22AE( self.cover._id_8D56 );
}

_id_22AE( var_0 )
{
    if ( var_0 == "left" )
        animscripts\cover_left::main();
    else if ( var_0 == "right" )
        animscripts\cover_right::main();
    else if ( var_0 == "stand" )
        animscripts\cover_stand::main();
    else if ( var_0 == "crouch" )
        animscripts\cover_crouch::main();
    else
    {

    }
}

_id_22AF( var_0 )
{
    switch ( var_0 )
    {
        case "left":
            animscripts\cover_left::end_script();
            break;
        case "right":
            animscripts\cover_right::end_script();
            break;
        case "stand":
            animscripts\cover_stand::end_script();
            break;
        case "crouch":
            animscripts\cover_crouch::end_script();
            break;
    }
}
#using_animtree("generic_human");

_id_22AD( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "killanimscript" );

    if ( var_0 == "none" || var_3 == "none" )
        return;

    var_6 = _id_22B0( var_0, var_1, var_2, var_3, var_4, var_5 );

    if ( !isdefined( var_6 ) )
        return;

    self setflaggedanimknoball( "cover_multi_trans", var_6, %body, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "cover_multi_trans" );
}

_id_22AC()
{
    if ( !isdefined( self.a.array ) || !isdefined( self.a.array["alert_idle_back"] ) )
        return "forward";

    if ( common_scripts\utility::_id_2006() )
        return "forward";
    else
        return "back";
}

_id_22B4( var_0, var_1 )
{
    if ( var_1 == "left" || var_1 == "right" )
        return var_1;

    if ( var_0 doesnodeallowstance( "stand" ) )
        return "stand";

    return "crouch";
}

_id_22B0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( var_2 == "back" )
        var_6 = var_1 + "_back";
    else if ( var_0 == "stand" || var_0 == "crouch" )
        var_6 = var_0 + "_forward";
    else
        var_6 = var_0 + "_" + var_1;

    var_6 += "_to_";

    if ( var_5 == "back" )
        var_6 += ( var_4 + "_back" );
    else if ( var_3 == "stand" || var_3 == "crouch" )
        var_6 += ( var_3 + "_forward" );
    else
        var_6 += ( var_3 + "_" + var_4 );

    var_7 = self.animarchetype;

    if ( !isdefined( var_7 ) || !isdefined( anim.archetypes[var_7]["cover_multi"] ) )
        var_7 = "soldier";

    return anim.archetypes[var_7]["cover_multi"][var_6];
}

_id_4C7E()
{
    var_0 = [];
    var_0["stand"] = [];
    var_0["stand"]["trans"] = [];
    var_0["stand"]["trans"]["left_stand"] = [];
    var_0["stand"]["trans"]["left_crouch"] = [];
    var_0["stand"]["trans"]["right_stand"] = [];
    var_0["stand"]["trans"]["right_crouch"] = [];
    var_0["stand"]["trans"]["front_stand"] = [];
    var_0["stand"]["trans"]["front_crouch"] = [];
    var_0["stand"]["trans"]["back_stand"] = [];
    var_0["stand"]["trans"]["back_crouch"] = [];
    var_0["left_stand_to_right_stand"] = undefined;
    var_0["left_stand_to_right_crouch"] = undefined;
    var_0["left_stand_to_stand_back"] = undefined;
    var_0["left_stand_to_stand_forward"] = undefined;
    var_0["left_stand_to_crouch_back"] = undefined;
    var_0["left_stand_to_crouch_forward"] = undefined;
    var_0["left_crouch_to_right_stand"] = undefined;
    var_0["left_crouch_to_right_crouch"] = undefined;
    var_0["left_crouch_to_stand_back"] = undefined;
    var_0["left_crouch_to_stand_forward"] = undefined;
    var_0["left_crouch_to_crouch_back"] = undefined;
    var_0["left_crouch_to_crouch_forward"] = undefined;
    var_0["crouch"] = [];
    anim.archetypes["soldier"]["cover_multi"] = var_0;
}
