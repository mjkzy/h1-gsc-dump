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

_id_087F( var_0, var_1 )
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    var_2 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_2.angles[1] );
    var_2._id_972A = var_2.origin[2] + var_2._id_972B;
    var_3 = var_2._id_972A - var_2.origin[2];
    thread _id_925E( var_3 - var_1 );
    var_4 = 0.15;
    self _meth_8144( %body, var_4 );
    self setflaggedanimknoballrestart( "traverse", var_0, %animscript_root, 1, var_4, 1 );
    var_5 = 0.2;
    var_6 = 0.2;
    thread animscripts\notetracks::_id_2D07( "traverse", "no clear" );

    if ( !animhasnotetrack( var_0, "gravity on" ) )
    {
        var_7 = 1.23;
        wait(var_7 - var_5);
        self _meth_8191( "gravity" );
        wait(var_5);
    }
    else
    {
        self waittillmatch( "traverse", "gravity on" );
        self _meth_8191( "gravity" );

        if ( !animhasnotetrack( var_0, "blend" ) )
            wait(var_5);
        else
            self waittillmatch( "traverse", "blend" );
    }
}

_id_925E( var_0 )
{
    self endon( "killanimscript" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );
    var_1 = 5;
    var_2 = ( 0, 0, var_0 / var_1 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self _meth_81ca( self.origin + var_2 );
        wait 0.05;
    }
}

_id_925F( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );

    if ( var_0 >= 0 || var_2 <= 0 )
        return;

    if ( var_1 > 0 )
        wait(var_1);

    var_4 = ( 0, 0, var_0 / var_2 );

    if ( isdefined( var_3 ) && var_3 < 1.0 )
        self setflaggedanimknoball( "traverseAnim", self._id_9735, self._id_9736, 1, 0.2, var_3 );

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        self _meth_81ca( self.origin + var_4 );
        wait 0.05;
    }

    if ( isdefined( var_3 ) && var_3 < 1.0 )
        self setflaggedanimknoball( "traverseAnim", self._id_9735, self._id_9736, 1, 0.2, 1.0 );
}

_id_2D86( var_0 )
{
    self endon( "killanimscript" );
    setdvarifuninitialized( "scr_traverse_debug", 0 );
    self notify( "traverse_started" );
    self._id_51DA = 1;
    self._id_28B4 = "stand";
    animscripts\utility::_id_9AF5();
    var_1 = self getnegotiationstartnode();

    if ( isdefined( var_1._id_972B ) )
        var_1._id_972A = var_1.origin[2] + var_1._id_972B;
    else
        var_1._id_972A = var_1.origin[2];

    var_2 = self getnegotiationendnode();
    self _meth_8193( "face angle", var_1.angles[1] );
    self._id_973D = var_0["traverseHeight"];
    self._id_973F = var_1;
    var_3 = var_0["traverseAnim"];
    var_4 = var_0["traverseToCoverAnim"];
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    self._id_9740 = self.origin[2];
    var_5 = 0;

    if ( isdefined( var_4 ) && isdefined( self.node_relinquished ) && self.node_relinquished.unlockpoints == var_0["coverType"] && distancesquared( self.node_relinquished.origin, var_2.origin ) < 625 )
    {
        if ( animscripts\utility::_id_06C4( self.node_relinquished.angles[1] - var_2.angles[1] ) > 160 )
        {
            var_5 = 1;
            var_3 = var_4;
        }
    }

    if ( var_5 )
    {
        if ( isdefined( var_0["traverseToCoverSound"] ) )
            thread maps\_utility::_id_69C4( var_0["traverseToCoverSound"] );
    }
    else if ( isdefined( var_0["traverseSound"] ) )
        thread maps\_utility::_id_69C4( var_0["traverseSound"] );

    self._id_9735 = var_3;

    if ( !animhasnotetrack( var_3, "traverse_align" ) )
        _id_4683();

    if ( isdefined( var_0["traverseBodyNode"] ) )
        self._id_9736 = var_0["traverseBodyNode"];
    else
        self._id_9736 = %body;

    self setflaggedanimknoballrestart( "traverseAnim", var_3, self._id_9736, 1, 0.2, 1 );
    var_6 = ::_id_4686;

    if ( isdefined( var_0["traverseNotetrackFunc"] ) )
        var_6 = var_0["traverseNotetrackFunc"];

    self._id_973A = 0;
    self._id_9739 = var_0["interruptDeathAnim"];
    animscripts\shared::_id_2D06( "traverseAnim", var_6 );
    self _meth_8191( "gravity" );

    if ( self.delayeddeath )
        return;

    self.a._id_612E = 0;

    if ( var_5 && isdefined( self.node_relinquished ) && distancesquared( self.origin, self.node_relinquished.origin ) < 256 )
    {
        self.a._id_5F5B = "stop";
        self _meth_81c9( self.node_relinquished.origin );
    }
    else if ( isdefined( var_0["traverseStopsAtEnd"] ) )
        self.a._id_5F5B = "stop";
    else
    {
        self.a._id_5F5B = "run";
        self _meth_8144( var_3, 0.2 );
    }

    self notify( "traverse_finish" );
    self._id_9736 = undefined;
    self._id_9735 = undefined;
    self._id_2652 = undefined;
    self._id_973F = undefined;
    self._id_51DA = undefined;
}

_id_4686( var_0 )
{
    if ( var_0 == "traverse_death" )
        return _id_4684();
    else if ( var_0 == "traverse_align" )
        return _id_4683();
    else if ( var_0 == "traverse_drop" )
        return _id_4685();
}

_id_4684()
{
    if ( isdefined( self._id_9739 ) )
    {
        var_0 = self._id_9739[self._id_973A];
        self._id_2652 = var_0[randomint( var_0.size )];
        self._id_973A++;
    }
}

_id_4683()
{
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );

    if ( isdefined( self._id_973D ) && isdefined( self._id_973F._id_972A ) )
    {
        var_0 = self._id_973F._id_972A - self._id_9740;
        thread _id_925E( var_0 - self._id_973D );
    }
}

_id_4685()
{
    var_0 = self.origin + ( 0, 0, 32 );
    var_1 = self _meth_8151( self._id_9735 );
    var_2 = getanimlength( self._id_9735 );
    var_3 = var_1 * var_2;
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = undefined;
    var_8 = 1.0;
    var_9 = getnotetracktimes( self._id_9735, "land" );

    if ( var_9.size > 0 )
    {
        var_10 = _id_403D( var_1, var_9 );
        var_8 = var_10;
        var_11 = getmovedelta( self._id_9735, var_1, var_10 );
        var_12 = ( 0, self.angles[1], 0 );
        var_11 = rotatevector( var_11, var_12 );
        var_7 = self.origin + var_11;
        var_4 = 0 - var_11[2];
        var_11 = ( var_11[0], var_11[1], 0 );
        var_0 += var_11;
        var_5 = ( var_10 - var_1 ) * var_2;
    }
    else
    {
        var_13 = getmovedelta( self._id_9735, var_1, 1.0 );
        var_12 = ( 0, self.angles[1], 0 );
        var_13 = rotatevector( var_13, var_12 );
        var_4 = 0 - var_13[2];
        var_7 = self.origin + var_13;
        var_14 = var_2 - var_3;
        var_5 = var_14 / 3.0;
    }

    var_15 = physicstrace( var_0, var_0 + ( 0, 0, -768 ) );
    var_16 = distance( var_0, var_15 );
    var_17 = var_16 - 32 - 0.5;
    var_18 = var_4 - var_17;

    if ( var_4 < var_17 )
        var_19 = var_4 / var_17;
    else
        var_19 = 1;

    var_6 = ceil( var_5 * 20 );
    thread _id_925F( var_18, 0, var_6, var_19 );
    thread _id_379C( var_15[2], var_5, var_9.size, var_18 );
}

_id_403D( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size - 1; var_2++ )
    {
        for ( var_3 = var_2 + 1; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3] < var_1[var_2] )
            {
                var_4 = var_1[var_3];
                var_1[var_3] = var_1[var_2];
                var_1[var_2] = var_4;
            }
        }
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] > var_0 )
            return var_1[var_2];
    }

    return var_1[var_1.size - 1];
}

_id_379C( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );

    if ( var_2 > 0 )
    {
        var_4 = var_1;

        if ( var_3 > 0 )
            var_4 -= 0.1;

        if ( var_4 < 0 )
            var_4 = 0.0;

        wait(var_4);
        self _meth_8191( "gravity" );
    }
    else
    {
        var_0 += 4.0;

        for (;;)
        {
            if ( self.origin[2] < var_0 )
            {
                self _meth_8191( "gravity" );
                break;
            }

            wait 0.05;
        }
    }
}

_id_2D15()
{
    self _meth_8192( "zonly_physics" );
    self waittill( "killanimscript" );
}

_id_2D8D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "killanimscript" );
    var_7 = 1;

    if ( isdefined( self._id_5F65 ) )
        var_7 = self._id_5F65;

    var_8 = self getnegotiationstartnode();
    var_9 = self.origin;

    if ( isdefined( var_0 ) )
    {
        var_10 = getmovedelta( var_0, 0, 1 );
        var_9 = _id_96EF( var_10, var_8.origin, var_8.angles );
    }

    var_11 = self getnegotiationendnode();
    var_12 = var_11.origin;

    if ( isdefined( var_2 ) )
    {
        var_13 = getmovedelta( var_2, 0, 1 );
        var_12 = _id_96EF( var_13 * -1, var_11.origin, var_11.angles );
        var_12 += ( 0, 0, 1 );
    }

    var_14 = getmovedelta( var_1, 0, 1 );
    var_15 = length( var_14 ) * var_7 / getanimlength( var_1 );
    var_16 = length( var_12 - var_9 ) / var_15;

    if ( var_16 <= 0 )
        return;

    self._id_51DA = 1;
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();

    if ( isdefined( var_3 ) )
        self _meth_8191( var_3 );
    else
        self _meth_8191( "noclip" );

    self.allowpain = 1;

    if ( isdefined( var_6 ) )
        var_17 = var_6;
    else
        var_17 = %body;

    self _meth_8193( "face angle", var_8.angles[1] );

    if ( isdefined( var_0 ) )
    {
        self setflaggedanimknoballrestart( "traversal", var_0, var_17, 1, 0.1, var_7 );
        animscripts\shared::_id_2D06( "traversal" );
    }

    self setflaggedanimknoballrestart( "traversal", var_1, var_17, 1, 0.1, var_7 );
    animscripts\notetracks::_id_2D0B( var_16, "traversal" );

    if ( isdefined( var_2 ) )
    {
        self setflaggedanimknoballrestart( "traversal", var_2, var_17, 1, 0.1, var_7 );
        animscripts\shared::_id_2D06( "traversal" );
    }

    self _meth_8191( "gravity" );

    if ( isdefined( var_4 ) )
        self.a._id_6E5A = var_4;

    if ( isdefined( var_5 ) )
        self.a._id_5F5B = var_5;

    self._id_51DA = undefined;
}

_id_96EF( var_0, var_1, var_2 )
{
    var_3 = length( var_0 );
    var_4 = vectortoangles( var_0 );
    var_5 = combineangles( var_2, var_4 );
    var_6 = anglestoforward( var_5 );
    return var_1 + var_6 * var_3;
}

_id_2CA3( var_0 )
{
    var_1 = undefined;
    var_2 = 0;
    var_3 = 0;

    if ( var_0 == "traverse_jump_start" )
    {
        var_2 = 1;
        var_4 = getnotetracktimes( self._id_9735, "traverse_align" );

        if ( var_4.size > 0 )
            var_1 = var_4;
        else
        {
            var_1 = getnotetracktimes( self._id_9735, "traverse_jump_end" );
            var_3 = 1;
        }
    }
    else if ( var_0 == "gravity on" )
    {
        var_2 = 1;
        var_1 = getnotetracktimes( self._id_9735, "traverse_jump_end" );
        var_3 = 1;
    }

    if ( var_2 )
    {
        var_5 = getnotetracktimes( self._id_9735, var_0 );
        var_6 = var_5[0];
        var_7 = getmovedelta( self._id_9735, 0, var_5[0] );
        var_8 = var_7[2];
        var_7 = getmovedelta( self._id_9735, 0, var_1[0] );
        var_9 = var_7[2];
        var_10 = var_1[0];
        var_11 = getanimlength( self._id_9735 );
        var_12 = int( ( var_10 - var_6 ) * var_11 * 30 );
        var_13 = max( 1, var_12 - 2 );
        var_14 = var_9 - var_8;

        if ( var_3 )
        {
            var_7 = getmovedelta( self._id_9735, 0, 1 );
            var_15 = var_7[2] - var_9;
            var_16 = self._id_973B.origin[2] - self.origin[2] - var_15;
        }
        else
        {
            var_17 = self._id_973F;
            var_16 = var_17._id_972B - ( self.origin[2] - var_17.origin[2] );
        }

        thread _id_925F( var_16 - var_14, 0, var_13 );
        return 1;
    }
}

_id_2CB9()
{
    self waittill( "killanimscript" );
    self._id_973F = undefined;
    self._id_973B = undefined;
}
#using_animtree("dog");

_id_2CBD( var_0, var_1, var_2 )
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_3 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_3.angles[1] );

    if ( !isdefined( var_2 ) )
    {
        var_4 = var_3._id_972A - var_3.origin[2];
        thread _id_925E( var_4 - var_1 );
    }

    self._id_9735 = anim._id_2CE0[var_0];
    self._id_973F = var_3;
    self._id_973B = self getnegotiationendnode();
    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "dog_traverse", self._id_9735, 1, 0.2, 1 );
    self._id_5F44 = "land";
    animscripts\notetracks::_id_2D10( "dog_traverse", ::_id_2CA3 );
    self._id_5F44 = undefined;
    self._id_9735 = undefined;
}

_id_2CA8( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_4 = self getnegotiationstartnode();
    var_5 = self getnegotiationendnode();
    self _meth_8193( "face angle", var_4.angles[1] );

    if ( !isdefined( var_2 ) )
        var_2 = "jump_down_40";

    self._id_9735 = anim._id_2CE0[var_2];
    self._id_9736 = %body;
    self._id_973F = var_4;
    self._id_973B = var_5;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !var_3 )
    {
        var_6 = var_4.origin[2] - var_5.origin[2];
        thread _id_925F( 40.0 - var_6, 0.1, var_0, var_1 );
    }

    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "traverseAnim", self._id_9735, 1, 0.2, 1 );

    if ( !var_3 )
        animscripts\shared::_id_2D06( "traverseAnim" );
    else
        animscripts\notetracks::_id_2D10( "traverseAnim", ::_id_2CA3 );

    self._id_5F44 = undefined;
    self _meth_8191( "gravity" );
    self._id_9736 = undefined;
    self._id_9735 = undefined;
}

_id_2CA9( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_4 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_4.angles[1] );

    if ( !isdefined( var_2 ) )
        var_2 = "jump_up_40";

    self._id_9735 = anim._id_2CE0[var_2];
    self._id_9736 = %body;
    self._id_973F = var_4;
    self._id_973B = self getnegotiationendnode();

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !var_3 )
        thread _id_925F( var_0 - 40.0, 0.2, var_1 );

    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self setflaggedanimrestart( "traverseAnim", self._id_9735, 1, 0.2, 1 );

    if ( !var_3 )
        animscripts\shared::_id_2D06( "traverseAnim" );
    else
        animscripts\notetracks::_id_2D10( "traverseAnim", ::_id_2CA3 );

    self._id_5F44 = undefined;
    self _meth_8191( "gravity" );
    self._id_9735 = undefined;
    self._id_9736 = undefined;
}

_id_2CAB( var_0, var_1 )
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_2 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_2.angles[1] );

    if ( !isdefined( var_2._id_972A ) )
        var_2._id_972A = var_2.origin[2];

    var_3 = var_2._id_972A - var_2.origin[2];
    thread _id_925E( var_3 - var_1 );
    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self setflaggedanimknoballrestart( "dog_traverse", anim._id_2CE0[var_0], 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dog_traverse" );
    self._id_5F44 = undefined;
}

_id_403B()
{
    var_0 = ( 0, 0, 0 );
    var_1 = ( 0, 0, 0 );

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
    {
        var_1 = self gettagorigin( "j2_ball_ri" );
        var_0 = self gettagorigin( "j2_ball_le" );
    }
    else
    {
        var_1 = self gettagorigin( "j_ball_ri" );
        var_0 = self gettagorigin( "j_ball_le" );
    }

    if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return "none";

    if ( var_0[2] > var_1[2] )
        return "Left";

    return "Right";
}
