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

_id_4D96()
{
    if ( !anim._id_9BFF )
        return;

    if ( !isdefined( self.a._id_2510 ) )
    {
        self.a._id_2510 = 0;
        self.a._id_4B7C = anim._id_09D2;
        self._id_35BF = [];
        self._id_35BB = 0;
    }
}

_id_7824( var_0 )
{
    var_1 = undefined;

    switch ( self._id_9F32 )
    {
        case "delta":
        case "american":
        case "seal":
        case "taskforce":
        case "french":
        case "czech":
        case "pmc":
        case "xslice":
            var_2 = "friendly";
            var_3 = anim._id_62A1;
            break;
        default:
            var_2 = "enemy";
            var_3 = anim._id_629D;
    }

    var_1 = 1 + self getentitynumber() % var_3;
    var_2 = var_2 + "_" + var_1;
    var_4 = undefined;

    switch ( var_0 )
    {
        case "meleeattack":
        case "meleecharge":
            var_5 = 0.5;
            break;
        case "flashbang":
            var_5 = 0.7;
            break;
        case "pain":
            var_5 = 0.9;
            break;
        case "pain_small":
            var_5 = 0.9;
            break;
        case "death":
        case "dogdeathshort":
        case "dogdeathlong":
        case "dogdeathshortplr":
        case "dogdeathlongplr":
        case "melee_death":
            var_5 = 1.0;
            break;
        default:
            var_5 = 0.3;
            break;
    }

    var_6 = undefined;

    if ( isdefined( self._id_3CA9 ) )
    {
        var_6 = self._id_3CA9 + "_" + var_0 + "_" + var_2;

        if ( !soundexists( var_6 ) )
            var_6 = "generic_" + var_0 + "_" + var_2;
    }
    else
        var_6 = "generic_" + var_0 + "_" + var_2;

    thread _id_6D9A( var_4, var_6, var_5 );
}

_id_7F90( var_0 )
{
    animscripts\battlechatter::_id_6A2E();
    self.a._id_4B7C = var_0;
}

_id_7F8F( var_0 )
{
    if ( !anim._id_9BFF )
        return;

    animscripts\battlechatter::_id_6A2E();
    self.a._id_4B7C = var_0;
    _id_6DAD();
}

_id_7828( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_6D9A( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_1D41( var_0 )
{
    return;
}

_id_6DAD()
{
    return;
}

_id_6D9A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self.a._id_35C4 = 1;
    self.a._id_35C8 = 1;

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_1 ) )
        {
            if ( !soundexists( var_1 ) )
            {
                wait 0;
                self notify( var_3 );
            }

            self playsoundatviewheight( var_1, "animscript facesound" + var_3, 1 );
            thread _id_A01C( var_3 );
        }
    }
    else
        self playsoundatviewheight( var_1 );

    if ( !anim._id_9BFF )
        return;

    _id_4D96();

    if ( !isdefined( var_0 ) && !isdefined( var_1 ) )
    {
        if ( isdefined( var_3 ) )
        {
            wait 0;
            self._id_35BD = "failed";
            self notify( var_3 );
        }
    }
    else
    {
        self endon( "death" );

        if ( isstring( var_2 ) )
        {
            switch ( var_2 )
            {
                case "any":
                    var_2 = 0.1;
                    break;
                case "pain":
                    var_2 = 0.9;
                    break;
                case "death":
                    var_2 = 1.0;
                    break;
            }
        }

        if ( var_2 <= self.a._id_2510 && ( isdefined( var_4 ) && var_4 == "wait" ) )
        {
            var_6 = self._id_35BF.size;
            var_7 = self._id_35BB + 1;
            self._id_35BF[var_6]["facialanim"] = var_0;
            self._id_35BF[var_6]["soundAlias"] = var_1;
            self._id_35BF[var_6]["importance"] = var_2;
            self._id_35BF[var_6]["notifyString"] = var_3;
            self._id_35BF[var_6]["waitOrNot"] = var_4;
            self._id_35BF[var_6]["timeToWait"] = var_5;
            self._id_35BF[var_6]["notifyNum"] = var_7;
            thread _id_6D98( "animscript face stop waiting " + self._id_35BF[var_6]["notifyNum"], "Face done waiting", "Face done waiting" );

            if ( isdefined( var_5 ) )
                thread _id_6D99( var_5, "Face done waiting", "Face done waiting" );

            self waittill( "Face done waiting" );
            var_6 = undefined;

            for ( var_8 = 0; var_8 < self._id_35BF.size; var_8++ )
            {
                if ( self._id_35BF[var_8]["notifyNum"] == var_7 )
                {
                    var_6 = var_8;
                    break;
                }
            }

            if ( self.a._id_35BE == "notify" )
                _id_6D9A( self._id_35BF[var_6]["facialanim"], self._id_35BF[var_6]["soundAlias"], self._id_35BF[var_6]["importance"], self._id_35BF[var_6]["notifyString"] );
            else if ( isdefined( var_3 ) )
            {
                self._id_35BD = "failed";
                self notify( var_3 );
            }

            for ( var_8 = var_6 + 1; var_8 < self._id_35BF.size; var_8++ )
            {
                self._id_35BF[var_8 - 1]["facialanim"] = self._id_35BF[var_8]["facialanim"];
                self._id_35BF[var_8 - 1]["soundAlias"] = self._id_35BF[var_8]["soundAlias"];
                self._id_35BF[var_8 - 1]["importance"] = self._id_35BF[var_8]["importance"];
                self._id_35BF[var_8 - 1]["notifyString"] = self._id_35BF[var_8]["notifyString"];
                self._id_35BF[var_8 - 1]["waitOrNot"] = self._id_35BF[var_8]["waitOrNot"];
                self._id_35BF[var_8 - 1]["timeToWait"] = self._id_35BF[var_8]["timeToWait"];
                self._id_35BF[var_8 - 1]["notifyNum"] = self._id_35BF[var_8]["notifyNum"];
            }

            self._id_35BF[self._id_35BF.size - 1] = undefined;
        }
        else
        {
            if ( var_2 >= self.a._id_2510 )
            {
                self notify( "end current face" );
                self endon( "end current face" );

                if ( isdefined( var_3 ) )
                {
                    if ( isdefined( self.a._id_2511 ) )
                    {
                        self._id_35BD = "interrupted";
                        self notify( self.a._id_2511 );
                    }
                }

                self.a._id_2510 = var_2;
                self.a._id_2512 = var_1;
                self.a._id_2511 = var_3;
                self.a._id_35C4 = 1;
                self.a._id_35C8 = 1;

                if ( isdefined( var_0 ) )
                {
                    maps\_anim::_id_2B04();
                    self setflaggedanimknobrestart( "animscript faceanim", var_0, 1, 0.1, 1 );
                    self.a._id_35C4 = 0;
                    thread _id_A01D();
                }
                else
                    maps\_anim::_id_2B04( 0 );

                if ( isdefined( var_1 ) )
                {
                    self playsoundatviewheight( var_1, "animscript facesound", 1 );
                    self.a._id_35C8 = 0;
                    thread _id_A01C();
                }

                while ( !self.a._id_35C4 || !self.a._id_35C8 )
                    self waittill( "animscript facedone" );

                self.a._id_2510 = 0;
                self.a._id_2512 = undefined;
                self.a._id_2511 = undefined;

                if ( isdefined( var_3 ) )
                {
                    self._id_35BD = "finished";
                    self notify( var_3 );
                }

                if ( isdefined( self._id_35BF ) && self._id_35BF.size > 0 )
                {
                    var_9 = 0;
                    var_10 = 1;

                    for ( var_8 = 0; var_8 < self._id_35BF.size; var_8++ )
                    {
                        if ( self._id_35BF[var_8]["importance"] > var_9 )
                        {
                            var_9 = self._id_35BF[var_8]["importance"];
                            var_10 = var_8;
                        }
                    }

                    self notify( "animscript face stop waiting " + self._id_35BF[var_10]["notifyNum"] );
                    return;
                }

                if ( isai( self ) )
                {
                    _id_6DAD();
                    return;
                }

                return;
                return;
            }

            if ( isdefined( var_3 ) )
            {
                self._id_35BD = "failed";
                self notify( var_3 );
            }
        }
    }
}

_id_A01D()
{
    self endon( "death" );
    self endon( "end current face" );
    animscripts\shared::_id_2D06( "animscript faceanim" );
    self.a._id_35C4 = 1;
    self notify( "animscript facedone" );
    maps\_anim::_id_2B04( 0 );
}

_id_A01C( var_0 )
{
    self endon( "death" );
    self waittill( "animscript facesound" + var_0 );
    self notify( var_0 );
}

_id_6D98( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( var_2 );
    self waittill( var_0 );
    self.a._id_35BE = "notify";
    self notify( var_1 );
}

_id_6D99( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( var_2 );
    wait(var_0);
    self.a._id_35BE = "time";
    self notify( var_1 );
}

_id_4DEF()
{
    anim._id_62A1 = 8;
    anim._id_629D = 8;
    _id_4DBC();
}
#using_animtree("generic_human");

_id_4DBC()
{
    anim._id_35C1 = [];
    anim._id_35C1["pain"] = [ %facial_pain_1, %facial_pain_2, %facial_pain_3, %facial_pain_4 ];
    anim._id_35C1["aim"] = [ %facial_aim_1, %facial_aim_2 ];
    anim._id_35C1["run"] = [ %facial_run_1, %facial_run_2 ];
    anim._id_35C1["corner_stand_L"] = [ %facial_corner_stand_l_1, %facial_corner_stand_l_2 ];
    anim._id_35C1["corner_stand_R"] = [ %facial_corner_stand_r_1, %facial_corner_stand_r_2 ];
    anim._id_35C1["death"] = [ %facial_death_1, %facial_death_2, %facial_death_3, %facial_death_4 ];
    anim._id_35C1["idle"] = [ %facial_idle_1, %facial_idle_2, %facial_idle_3 ];
    anim._id_35C1["pain_blend"] = [ %facial_pain_blend_1, %facial_pain_blend_2, %facial_pain_blend_3, %facial_pain_blend_4 ];
    anim._id_35C1["aim_blend"] = [ %facial_aim_blend_1, %facial_aim_blend_2 ];
    anim._id_35C1["run_blend"] = [ %facial_run_blend_1, %facial_run_blend_2 ];
    anim._id_35C1["corner_stand_L_blend"] = [ %facial_corner_stand_l_blend_1, %facial_corner_stand_l_blend_2 ];
    anim._id_35C1["corner_stand_R_blend"] = [ %facial_corner_stand_r_blend_1, %facial_corner_stand_r_blend_2 ];
    anim._id_35C1["death_blend"] = [ %facial_death_blend_1, %facial_death_blend_2, %facial_death_blend_3, %facial_death_blend_4 ];
    anim._id_35C1["idle_blend"] = [ %facial_idle_blend_1, %facial_idle_blend_2, %facial_idle_blend_3 ];
}

_id_0C6F( var_0 )
{
    return animhasnotetrack( var_0, "facial_override" );
}

clearfacialanim()
{
    self _meth_8144( %head, 0.2 );
}

_id_6D9B( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_35C6 ) )
        thread _id_35C3();

    if ( isdefined( self._id_1359 ) && self._id_1359 )
        self _meth_8144( %head, 0.2 );
    else
    {
        if ( isdefined( var_0 ) && _id_0C6F( var_0 ) )
        {
            self _meth_8144( %head, 0.2 );
            return;
        }

        if ( self _meth_84ea() )
            var_1 += "_blend";

        if ( !isdefined( anim._id_35C1[var_1] ) )
            return;

        if ( isdefined( var_2 ) && var_2 >= 0 && var_2 < anim._id_35C1[var_1].size )
            var_3 = var_2;
        else
            var_3 = randomint( anim._id_35C1[var_1].size );

        var_4 = anim._id_35C1[var_1][var_3];
        self _meth_8145( var_4 );

        if ( var_1 == "death" )
        {
            if ( isdefined( var_0 ) )
                thread _id_312E( getanimlength( var_0 ) );
            else
                thread _id_312E();
        }
    }
}

_id_312E( var_0 )
{
    var_1 = 1.0;
    var_2 = 0.2;

    if ( isdefined( var_0 ) )
        var_1 = clamp( var_0, var_2 + 0.5, var_1 + var_2 ) - var_2;

    wait(var_1);

    if ( isdefined( self ) )
        self _meth_8144( %head, var_2 );
}

_id_3D66()
{
    if ( self _meth_843e( "jnt_eyelid_TL" ) == -1 || self _meth_843e( "tag_eye" ) == -1 )
        return;

    if ( self _meth_843e( "jnt_eyelid_TR" ) == -1 )
        return;

    var_0 = self gettagangles( "tag_eye" );
    var_1 = self gettagangles( "jnt_eyelid_TR" );
    var_2 = self gettagangles( "jnt_eyelid_TL" );
    var_3 = angleclamp180( abs( var_0[0] - var_1[0] ) );
    var_4 = angleclamp180( abs( var_0[0] - var_2[0] ) );

    if ( !isdefined( self._id_6F3D ) )
        self._id_6F3D = var_3;

    if ( !isdefined( self._id_6F3E ) )
        self._id_6F3E = var_4;

    if ( !isdefined( self._id_35B0 ) )
        self._id_35B0 = 0;

    if ( angleclamp180( var_3 - self._id_6F3D ) > 5 || angleclamp180( var_4 - self._id_6F3E ) > 5 )
    {
        self._id_6F3D = var_3;
        self._id_6F3E = var_4;
    }
    else
        self._id_35B0++;

    if ( isdefined( self._id_35B0 ) && self._id_35B0 > 4 && isdefined( self.script_context ) && self.script_context != "scripted" && self.script_context != "death" )
    {
        var_5 = _id_6D9B( undefined, "idle", undefined );

        if ( isdefined( var_5 ) )
            wait(getanimlength( anim._id_35C1["idle"][var_5] ));

        self._id_35B0 = 0;
    }
}

_id_35C3()
{
    self endon( "death" );
    self endon( "killanimscript" );
    self._id_35C6 = 1;

    for (;;)
    {
        _id_3D66();
        wait 0.35;
    }
}
