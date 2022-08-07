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

getprecisegroundnear( var_0 )
{
    var_1 = var_0 + ( 0.0, 0.0, 36.0 );
    var_2 = var_0 - ( 0.0, 0.0, 36.0 );
    return getrayfromtrace( var_1, var_2 );
}

getrayfromtrace( var_0, var_1 )
{
    var_2 = self aiphysicstrace( var_0, var_1, 0, 0, 1, 1 );

    if ( var_2["fraction"] < 1 )
    {
        var_3 = vectorlerp( var_0, var_1, var_2["fraction"] );
        var_4["pos"] = var_3;
        var_4["normal"] = var_2["normal"];
    }
    else
        var_4 = undefined;

    return var_4;
}

distancefromplanetopoint( var_0, var_1, var_2 )
{
    return vectordot( var_0, var_2 ) + var_1;
}

sweptspherecast( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = distancefromplanetopoint( var_3, var_4, var_0 );
    var_6 = distancefromplanetopoint( var_3, var_4, var_1 );
    var_7 = var_0;

    if ( abs( var_5 ) <= var_2 )
        return var_7;

    if ( var_5 > var_2 && var_6 < var_2 )
    {
        var_8 = ( var_5 - var_2 ) / ( var_5 - var_6 );
        var_7 = ( 1 - var_8 ) * var_0 + var_8 * var_1;
        return var_7;
    }
    else
        return var_1;
}

findstaircorner( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = ( 0, 0, var_6 );
    var_8 = var_4[2] - var_2[2];
    var_9 = ( var_0[0], var_0[1], 0 );
    var_10 = vectornormalize( var_9 );
    var_11 = vectordot( var_3, var_10 );

    if ( var_11 > 0 )
        var_10 *= -1;

    if ( var_8 < 0 )
        var_7 += var_4;
    else
    {
        var_7 += var_2;
        var_7 += ( 0, 0, var_8 );
    }

    var_12["position"] = var_7;
    var_13 = var_7;
    var_7 -= var_10 * var_6;
    var_10 *= ( 2 * ( var_1 + var_6 ) );
    var_13 += var_10;
    var_14 = -1 * vectordot( var_3, var_2 );
    var_12["position"] = sweptspherecast( var_7, var_13, var_6, var_3, var_14 );
    var_12["position"] -= ( 0, 0, var_6 );
    var_12["stairEdgeDirection"] = vectorcross( var_3, var_5 );
    var_12["stairEdgeDirection"] = vectornormalize( var_12["stairEdgeDirection"] );
    return var_12;
}

getcurrentanimdisplacement( var_0, var_1, var_2 )
{
    var_3 = getanimlength( var_0 );
    var_4 = self _meth_8151( var_0 );
    var_5 = var_4 * var_3;
    var_6 = var_5 + var_2;

    if ( var_1 )
    {
        var_7 = var_6 / var_3;

        if ( var_6 < var_3 )
            var_8 = getmovedelta( var_0, var_4, var_7 );
        else
        {
            var_9 = var_6 - var_3;
            var_10 = var_9 / var_3;
            var_8 = getmovedelta( var_0, var_4, 1 );
            var_8 += getmovedelta( var_0, 0, var_10 );
        }
    }
    else
    {
        var_6 = min( var_6, var_3 );
        var_7 = var_6 / var_3;
        var_8 = getmovedelta( var_0, var_4, var_7 );
    }

    return var_8[0] * self._id_5F65;
}

getstairanimtranslationtoedge( var_0 )
{
    var_1 = getnotetracktimes( var_0, "stair_edge" );
    return getmovedelta( var_0, 0, var_1[0] );
}

distancebetweentwolines( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 - var_2;
    var_5 = vectordot( var_1, var_1 );
    var_6 = vectordot( var_1, var_3 );
    var_7 = vectordot( var_3, var_3 );
    var_8 = vectordot( var_1, var_4 );
    var_9 = vectordot( var_3, var_4 );
    var_10 = var_5 * var_7 - var_6 * var_6;

    if ( var_10 < 0.00001 )
    {
        var_11 = 0;

        if ( var_6 > var_7 )
            var_12 = var_8 / var_6;
        else
            var_12 = var_9 / var_7;
    }
    else
    {
        var_11 = var_6 * var_9 - var_7 * var_8;
        var_12 = var_5 * var_9 - var_6 * var_8;
    }

    var_13 = var_4 + var_11 * var_1 - var_12 * var_3;
    var_14["distance"] = length( var_13 );
    var_14["intersectionLine1"] = var_0 + var_11 * var_1;
    var_14["intersectionLine2"] = var_2 + var_12 * var_3;
    return var_14;
}

stairupdatepos( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "stair_transition" );
    self endon( "death" );
    self endon( "stair_transition_to_transition" );
    self endon( "killanimscript" );
    var_6 = var_2["wantedPos"];
    var_7 = var_2["stairEdgeDir"];
    var_8 = length( var_2["trans"] );

    if ( isdefined( var_2["startTime"] ) )
    {
        var_9 = var_2["startTime"];
        var_10 = getmovedelta( var_0, 0, var_9 );
        var_8 -= length( var_10 );
    }
    else
        var_9 = 0;

    for (;;)
    {
        if ( var_4 )
        {
            if ( lengthsquared( var_7 ) <= 0.001 )
            {
                if ( !isdefined( self.stairstransition["wantedPos"] ) )
                    self.stairstransition["wantedPos"] = var_6;
            }
            else
            {
                var_11 = vectornormalize( ( self.lookforward[0], self.lookforward[1], 0 ) );
                var_12 = distancebetweentwolines( self.origin, var_11, var_6, var_7 );
                self.stairstransition["wantedPos"] = var_12["intersectionLine2"];
            }
        }

        var_13 = var_9 + var_5;

        if ( var_13 >= var_3 )
        {
            var_14 = anglestoforward( self.angles );
            var_15 = getmovedelta( var_0, var_3, var_13 );
            var_16 = var_15[0] * var_14 + ( 0, 0, var_15[2] );
            var_17 = self.stairstransition["wantedPos"] + var_16;
            self._id_7A3F = length( var_17 - self.origin );
            return;
        }

        var_18 = self.stairstransition["wantedPos"] - self.origin;
        var_19 = 0.001;

        if ( vectordot( var_18, self.lookforward ) > var_19 )
        {
            var_20 = getmovedelta( var_0, var_9, var_13 );
            var_21 = length( var_20 ) / var_8;
            var_22 = length( self.stairstransition["wantedPos"] - var_1 );
            var_23 = length( var_18 );
            var_24 = getmovedelta( var_0, var_9, var_3 );
            var_25 = length( var_24 );
            var_26 = var_25 / var_8;
            var_27 = var_23 / var_22;
            var_28 = var_26 / var_27 * var_22;
            var_29 = var_21 * var_28;
            self._id_7A3F = min( var_29, var_23 );
        }
        else
            self._id_7A3F = 0;

        waittillframeend;
        var_9 = self _meth_8151( var_0 );

        if ( var_9 == 0 )
            return;
    }
}

poststairsedge_restoreanimrate( var_0 )
{
    self._id_5F65 = self.stairs_old_moveplaybackrate;
    self.stairs_old_moveplaybackrate = undefined;
    self _meth_83c5( var_0, self._id_5F65 );
}

poststairsedge_cleanup( var_0 )
{
    self endon( "death" );
    self endon( "stair_transition_to_transition" );
    self endon( "stair_transition" );
    self waittill( "killanimscript" );
    poststairsedge_restoreanimrate( var_0 );
    self.isinstairstransition = undefined;
}

waitforstairedge( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stair_transition_to_transition" );
    self endon( "killanimscript" );
    thread poststairsedge_cleanup( var_0 );
    var_2 = 0;

    for (;;)
    {
        waittillframeend;
        var_3 = self _meth_8151( var_0 );

        if ( var_3 == 0 )
        {
            var_2 = 1;
            break;
        }

        if ( var_3 >= var_1 )
            break;
    }

    poststairsedge_restoreanimrate( var_0 );
    self notify( "stair_transition" );

    if ( var_2 )
    {
        self.isinstairstransition = undefined;
        return;
    }

    if ( !isdefined( self.stairstransition ) )
        return;

    var_4 = self.stairstransition["wantedPos"];

    if ( isdefined( var_4 ) )
    {
        var_5 = anglestoforward( self.angles );
        var_6 = getmovedelta( var_0, var_1, var_3 );
        var_7 = var_6[0] * var_5 + ( 0, 0, var_6[2] );
        var_8 = var_4 + var_7;

        if ( lengthsquared( self.origin - var_8 ) < squared( 20 ) )
        {
            var_9 = self.origin + ( 0.0, 0.0, 15.0 );
            var_10 = var_8 + ( 0.0, 0.0, 15.0 );
            var_11 = self aiphysicstrace( var_9, var_10, 15, 30, 0, 1 );

            if ( var_11["fraction"] == 1 )
                self _meth_81ca( var_8, self.angles, 100 );
        }
    }

    var_12 = getanimlength( var_0 );
    var_13 = var_12 * ( 1 - var_3 );
    wait(var_13);
    self.isinstairstransition = undefined;
}

gettracecontactpos( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_4 * 0.5;
    var_6 = var_0 + ( 0, 0, var_5 );
    var_7 = var_1 + ( 0, 0, var_5 );
    var_8 = var_7 - var_6;
    var_9 = var_5 - var_3;
    var_10 = vectornormalize( var_8 );
    var_10 *= var_9;
    var_11 = var_8 * var_2["fraction"] + var_6;
    var_11 += var_10;
    var_11 -= var_2["normal"] * var_3;
    return var_11;
}

getstairstransition( var_0, var_1, var_2 )
{
    if ( !isdefined( self.detectedstairstransitiontime ) || self.detectedstairstransitiontime != gettime() )
    {
        if ( !checkshouldstairstransition( var_0, var_1, var_2 ) )
            return undefined;
    }

    return self.detectedstairstransition;
}

preparedetectedstairstransition()
{
    self.stairstransition = self.detectedstairstransition;

    if ( isdefined( self.stairs_old_moveplaybackrate ) )
        self notify( "stair_transition_to_transition" );
    else
        self.stairs_old_moveplaybackrate = self.stairstransition["stairs_old_moveplaybackrate"];

    self._id_5F65 = clamp( self.stairstransition["moveplaybackrate"], 1, 2 );
}

getanimstarttime( var_0, var_1, var_2 )
{
    var_3 = 0.01;
    var_4 = length( var_1 );
    var_5 = getnotetracktimes( self.stairstransition["transitionAnim"], "stair_edge" );

    if ( var_4 < 1 )
        return var_5[0];

    var_6 = length( var_2 );
    var_7 = length( var_1 ) / var_6;

    if ( var_7 > 1 )
        return 0;

    var_8 = 1 - var_7;
    var_9 = var_8 * var_5[0];
    var_10 = 0;
    var_11 = var_5[0];

    for (;;)
    {
        var_12 = getmovedelta( var_0, 0, var_9 );
        var_13 = length( var_12 ) / var_6;

        if ( var_13 < var_8 && var_13 + var_3 > var_8 )
            return var_9;

        if ( var_13 < var_8 )
            var_10 = var_9;
        else
            var_11 = var_9;

        var_9 = ( var_11 + var_10 ) * 0.5;
    }
}

checktransition_up_in( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0["stairs"] ) )
    {
        var_6 = getstairtypefromnormal( var_0["normal"] );
        var_7 = animscripts\run::_id_40E5( var_5, "up", var_6 );
        var_8 = getstairanimtranslationtoedge( var_7 );
        var_9 = gettracecontactpos( var_2, var_4, var_0, 15, 48 );
        var_10 = getprecisegroundnear( var_9 );

        if ( !isdefined( var_10 ) )
            return undefined;

        if ( vectordot( var_10["normal"], var_3 ) > 0 )
            return undefined;

        var_9 = var_10["pos"];
        var_11 = findstaircorner( self.lookforward, self.lookright, var_9, var_0["normal"], self.origin, ( 0.0, 0.0, 1.0 ), 15 );
        var_12["wantedPos"] = var_11["position"];
        var_12["stairEdgeDir"] = var_11["stairEdgeDirection"];
        var_12["inStairTransitionIn"] = 1;
        var_12["transitionAnim"] = var_7;
        var_12["trans"] = var_8;
        return var_12;
    }

    if ( var_1 < self.lookright )
        return undefined;

    if ( var_1 - self.lookright > 15 )
        var_4 -= var_3 * 15;
    else
    {
        var_13 = ( var_1 + self.lookright ) * 0.5;
        var_4 -= var_3 * var_13;
    }

    return checktransition_down_in( var_1, var_4, var_3, var_5 );
}

checktransition_down_in( var_0, var_1, var_2, var_3 )
{
    var_4 = 18;
    var_5 = var_0 * 1.333;
    var_6 = var_1 + ( 0, 0, var_4 + 15 );
    var_7 = var_1 - ( 0, 0, var_5 + 15 );
    var_8 = self aiphysicstrace( var_6, var_7, 0, 48, 1, 1 );

    if ( var_8["fraction"] >= 1 )
        return undefined;

    if ( !isdefined( var_8["stairs"] ) )
        return undefined;

    if ( var_8["normal"][2] > 0.9962 )
    {
        var_6 += var_2;
        var_7 += var_2;
        var_8 = self aiphysicstrace( var_6, var_7, 0, 48, 1, 1 );

        if ( var_8["fraction"] >= 1 )
            return undefined;

        if ( !isdefined( var_8["stairs"] ) )
            return undefined;

        if ( var_8["normal"][2] > 0.9962 )
        {
            var_9 = gettracecontactpos( var_6, var_7, var_8, 0, 48 );
            return undefined;
        }
    }

    var_10 = var_8["normal"];

    if ( vectordot( var_10, var_2 ) < 0 )
        return undefined;

    var_11 = getstairtypefromnormal( var_10 );
    var_12 = animscripts\run::_id_40E5( var_3, "down", var_11 );
    var_13 = getstairanimtranslationtoedge( var_12 );
    var_9 = gettracecontactpos( var_6, var_7, var_8, 0, 48 );
    var_14 = findstaircorner( self.lookforward, self.lookright, var_9, var_10, self.origin, ( 0.0, 0.0, 1.0 ), 15 );
    var_15["wantedPos"] = var_14["position"];
    var_15["stairEdgeDir"] = var_14["stairEdgeDirection"];
    var_15["inStairTransitionIn"] = 1;
    var_15["transitionAnim"] = var_12;
    var_15["trans"] = var_13;

    if ( getdvarint( "ai_useStairsTraceErrorOffset", 1 ) )
    {
        var_16 = ( self.lookforward[0], self.lookforward[1], 0 );
        var_16 = vectornormalize( var_16 );

        if ( vectordot( var_10, var_16 ) > 0 )
        {
            var_17 = ( var_10[0], var_10[1], 0 );
            var_17 = vectornormalize( var_17 );
            var_17 = common_scripts\utility::vectorscale( var_17, 0.5 );
            var_15["wantedPos"] += var_17;
        }
    }

    return var_15;
}

checktransition_up_out( var_0 )
{
    var_1 = getprecisegroundnear( self.origin );
    var_2 = getstairtypefromtraceresult( var_1, self.origin );
    var_3 = animscripts\run::_id_40E5( "up", "none", var_2 );
    var_4 = getstairanimtranslationtoedge( var_3 );
    var_5 = var_4[0];
    var_6 = 21;
    var_7 = var_5 * 1.333;
    var_8 = var_0 * 15;
    var_9 = self.origin + var_5 * var_0 + var_8;
    var_10 = var_9 + ( 0, 0, var_7 + var_6 );
    var_11 = var_9 - ( 0, 0, var_6 );
    var_12 = self aiphysicstrace( var_10, var_11, 0, 0, 1, 1 );

    if ( var_12["fraction"] <= 0 || var_12["fraction"] >= 1 )
        return undefined;

    if ( isdefined( var_12["stairs"] ) && abs( var_12["normal"][2] ) < 0.9962 )
        return undefined;

    var_13 = vectorlerp( var_10, var_11, var_12["fraction"] );

    if ( var_1["normal"][2] > 0.9962 )
    {
        var_1 = getprecisegroundnear( self.origin - var_0 );

        if ( var_1["normal"][2] > 0.9962 )
            return undefined;
    }

    if ( vectordot( var_1["normal"], var_0 ) > 0 )
        return undefined;

    var_14 = findstaircorner( self.lookforward, self.lookright, var_1["pos"], var_1["normal"], var_13, ( 0.0, 0.0, 1.0 ), 15 );
    var_15["wantedPos"] = var_14["position"];
    var_15["stairEdgeDir"] = var_14["stairEdgeDirection"];
    var_15["transitionAnim"] = var_3;
    var_15["trans"] = var_4;
    return var_15;
}

checktransition_down_out( var_0 )
{
    var_1 = getprecisegroundnear( self.origin );
    var_2 = getstairtypefromtraceresult( var_1, self.origin );
    var_3 = animscripts\run::_id_40E5( "down", "none", var_2 );
    var_4 = getstairanimtranslationtoedge( var_3 );
    var_5 = var_4[0];
    var_6 = 18;
    var_7 = 22;
    var_8 = var_5 * 1.333;
    var_9 = self.origin + var_5 * var_0;
    var_10 = var_9;
    var_11 = var_9 - ( 0, 0, var_8 + var_7 );
    var_12 = self aiphysicstrace( var_10, var_11, 0, 0, 1, 1 );

    if ( var_12["fraction"] <= 0 || var_12["fraction"] >= 1 )
        return undefined;

    if ( isdefined( var_12["stairs"] ) )
        return undefined;

    var_13 = vectorlerp( var_10, var_11, var_12["fraction"] );

    if ( var_1["normal"][2] >= 0.9962 )
    {
        var_1 = getprecisegroundnear( self.origin - var_0 );

        if ( var_1["normal"][2] >= 0.9962 )
            return undefined;
    }

    if ( vectordot( var_1["normal"], var_0 ) < 0 )
        return undefined;

    var_14 = findstaircorner( self.lookforward, self.lookright, var_1["pos"], var_1["normal"], var_13, ( 0.0, 0.0, 1.0 ), 15 );
    var_15["wantedPos"] = var_14["position"];
    var_15["stairEdgeDir"] = var_14["stairEdgeDirection"];
    var_15["transitionAnim"] = var_3;
    var_15["trans"] = var_4;
    return var_15;
}

getexpectedstairstransition( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( !isdefined( self.lookforward ) )
        return undefined;

    var_5 = getanimationcontext( var_0 );
    var_6 = vectornormalize( ( self.lookforward[0], self.lookforward[1], 0 ) );
    var_7 = !isdefined( var_3 ) || var_3 == "inOnly";
    var_8 = !isdefined( var_3 ) || var_3 == "outOnly";

    if ( self.start_move == "none" && var_7 )
    {
        var_9 = getcurrentanimdisplacement( var_0, var_1, var_2 );
        var_10 = self.origin + ( 0.0, 0.0, 1.0 );
        var_11 = var_10 + var_9 * var_6;
        var_12 = self aiphysicstrace( var_10, var_11, 15, 48, 1, 1 );

        if ( var_12["fraction"] < 1 )
            var_4 = checktransition_up_in( var_12, var_9, var_10, var_6, var_11, var_5 );
        else
            var_4 = checktransition_down_in( var_9, var_11, var_6, var_5 );
    }
    else if ( var_8 )
    {
        if ( self.start_move == "up" )
            var_4 = checktransition_up_out( var_6 );
        else if ( self.start_move == "down" )
            var_4 = checktransition_down_out( var_6 );
    }

    if ( isdefined( var_4 ) )
    {
        var_13 = length( var_4["trans"] );

        if ( var_13 <= 0 )
            return undefined;

        var_14 = var_4["wantedPos"] - self.origin;
        var_4["stairs_old_moveplaybackrate"] = self._id_5F65;
        var_4["moveplaybackrate"] = length( var_14 ) / var_13;
        var_4["currentContext"] = var_5;
        var_4["distanceToCorner"] = var_14;
        return var_4;
    }

    return undefined;
}

getanimationcontext( var_0 )
{
    var_1 = animscripts\move::getturnaniminfo();

    if ( var_0 == var_1["animArray"][2] )
        return "turn_L90";
    else if ( var_0 == var_1["animArray"][6] )
        return "turn_R90";

    return "none";
}

checkshouldstairstransition( var_0, var_1, var_2, var_3 )
{
    if ( !using_h1_stairs_system() )
        return 0;

    var_4 = getexpectedstairstransition( var_0, var_1, var_2, var_3 );

    if ( !isdefined( var_4 ) )
        return 0;

    self.detectedstairstransition = var_4;
    self.detectedstairstransitiontime = gettime();
    return 1;
}

threadcheckstairstransition( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !using_h1_stairs_system() )
        return;

    self endon( "death" );
    self endon( "killThreadCheckStairsTransition" );

    for (;;)
    {
        if ( checkshouldstairstransition( var_0, var_1, var_2, var_4 ) )
        {
            if ( isdefined( var_3 ) )
                [[ var_3 ]]();

            self notify( "should_stairs_transition" );
            return;
        }

        wait 0.05;
    }
}

stairstransitionpendingsince( var_0 )
{
    if ( !isdefined( self.detectedstairstransitiontime ) )
        return 0;

    return gettime() - self.detectedstairstransitiontime <= var_0;
}

isinstairstransition()
{
    return isdefined( self.isinstairstransition );
}

shouldstairstransitionnow()
{
    var_0 = animscripts\move::getexpectedcurrentmoveanim();

    if ( !isdefined( var_0["anim"] ) )
        return 0;

    var_1 = getanimlength( var_0["anim"] );
    var_2 = self _meth_8151( var_0["anim"] );
    var_3 = var_2 * var_1;
    var_3 -= floor( var_3 / var_0["updateTime"] ) * var_0["updateTime"];
    var_4 = var_0["updateTime"] - var_3;
    return checkshouldstairstransition( var_0["anim"], 1, var_4 );
}

lookaheadhitstairslistener()
{
    self endon( "death" );
    self endon( "killanimscript" );

    for (;;)
    {
        self waittill( "lookahead_hit_stairs" );

        if ( isinstairstransition() )
            continue;

        if ( self.start_move != "none" )
            continue;

        if ( shouldstairstransitionnow() )
        {
            self notify( "move_loop_restart" );
            animscripts\combat_utility::_id_315E();
        }
    }
}

getstairtransitionfinishedthisframe()
{
    if ( isdefined( self.lastfinishedstairtransitiontime ) && self.lastfinishedstairtransitiontime == gettime() )
        return self.lastfinishedstairtransitiontype;

    return "none";
}

using_h1_stairs_system()
{
    return !isdefined( self.disablestairsanims ) || !self.disablestairsanims;
}

isonstairs()
{
    return self.start_move != "none" && using_h1_stairs_system();
}

getstairtypefromtraceresult( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return getstairtypefromnormal( ( 0.0, 0.0, 1.0 ) );

    return getstairtypefromnormal( var_0["normal"] );
}

getstairtypefromnormal( var_0 )
{
    if ( var_0[2] < 0.65 )
        return "6x8";

    if ( var_0[2] < 0.75 )
        return "8x8";

    if ( var_0[2] < 0.86 )
        return "12x8";

    if ( level.script_context == "scoutsniper" )
        return "12x6";

    return "16x8";
}

getstairsanimnameatgroundpos()
{
    var_0 = getprecisegroundnear( self.origin );
    var_1 = getstairtypefromtraceresult( var_0, self.origin );
    return "stairs_" + self.start_move + "_" + var_1;
}
