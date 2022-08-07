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

_id_4CB8()
{
    if ( isdefined( anim._id_1CA5 ) && anim._id_1CA5 )
        return;

    if ( getdvar( "bcs_enable" ) == "" )
        setdvar( "bcs_enable", "on" );

    if ( getdvar( "bcs_enable" ) == "off" )
    {
        anim._id_1CA5 = 0;
        anim.playercardbackground._id_1CA5 = 0;
        return;
    }

    anim._id_1CA5 = 1;
    anim.playercardbackground._id_1CA5 = 0;

    if ( getdvar( "bcs_filterThreat" ) == "" )
        setdvar( "bcs_filterThreat", "off" );

    if ( getdvar( "bcs_filterInform" ) == "" )
        setdvar( "bcs_filterInform", "off" );

    if ( getdvar( "bcs_filterOrder" ) == "" )
        setdvar( "bcs_filterOrder", "off" );

    if ( getdvar( "bcs_filterReaction" ) == "" )
        setdvar( "bcs_filterReaction", "off" );

    if ( getdvar( "bcs_filterResponse" ) == "" )
        setdvar( "bcs_filterResponse", "off" );

    if ( getdvar( "bcs_threatLimitTargettedBySelf" ) == "" )
        setdvar( "bcs_threatLimitTargettedBySelf", "off" );

    if ( getdvar( "bcs_threatLimitTargetingPlayer" ) == "" )
        setdvar( "bcs_threatLimitTargetingPlayer", "off" );

    if ( getdvar( "bcs_threatLimitInPlayerFOV" ) == "" )
        setdvar( "bcs_threatLimitInPlayerFOV", "on" );

    if ( getdvar( "bcs_threatLimitInLocation" ) == "" )
        setdvar( "bcs_threatLimitInLocation", "on" );

    if ( getdvar( "bcs_threatLimitSpeakerDist" ) == "" )
        setdvar( "bcs_threatLimitSpeakerDist", "512" );

    if ( getdvar( "bcs_threatLimitThreatDist" ) == "" )
        setdvar( "bcs_threatLimitThreatDist", "2048" );

    if ( getdvar( "bcs_threatPlayerRelative" ) == "" )
        setdvar( "bcs_threatPlayerRelative", "off" );

    if ( getdvar( "debug_bcprint" ) == "" )
        setdvar( "debug_bcprint", "off" );

    if ( getdvar( "debug_bcshowqueue" ) == "" )
        setdvar( "debug_bcshowqueue", "off" );

    if ( getdvar( "debug_bcprintdump" ) == "" )
        setdvar( "debug_bcprintdump", "off" );

    anim._id_2244["british"] = "UK";
    anim._id_2244["american"] = "US";
    anim._id_2244["russian"] = "RU";
    anim._id_2244["arab"] = "AB";
    anim._id_9BF9 = [];
    anim._id_9BF9["russian"] = [];
    anim._id_9BF9["russian"][0] = spawnstruct();
    anim._id_9BF9["russian"][0].count = 0;
    anim._id_9BF9["russian"][0]._id_6252 = "0";
    anim._id_9BF9["russian"][1] = spawnstruct();
    anim._id_9BF9["russian"][1].count = 0;
    anim._id_9BF9["russian"][1]._id_6252 = "1";
    anim._id_9BF9["russian"][2] = spawnstruct();
    anim._id_9BF9["russian"][2].count = 0;
    anim._id_9BF9["russian"][2]._id_6252 = "3";
    anim._id_9BF9["british"] = [];
    anim._id_9BF9["british"][0] = spawnstruct();
    anim._id_9BF9["british"][0].count = 0;
    anim._id_9BF9["british"][0]._id_6252 = "0";
    anim._id_9BF9["british"][1] = spawnstruct();
    anim._id_9BF9["british"][1].count = 0;
    anim._id_9BF9["british"][1]._id_6252 = "1";
    anim._id_9BF9["british"][2] = spawnstruct();
    anim._id_9BF9["british"][2].count = 0;
    anim._id_9BF9["british"][2]._id_6252 = "2";
    anim._id_9BF9["british"][3] = spawnstruct();
    anim._id_9BF9["british"][3].count = 0;
    anim._id_9BF9["british"][3]._id_6252 = "3";
    anim._id_9BF9["american"] = [];
    anim._id_9BF9["american"][0] = spawnstruct();
    anim._id_9BF9["american"][0].count = 0;
    anim._id_9BF9["american"][0]._id_6252 = "0";
    anim._id_9BF9["american"][1] = spawnstruct();
    anim._id_9BF9["american"][1].count = 0;
    anim._id_9BF9["american"][1]._id_6252 = "1";
    anim._id_9BF9["american"][2] = spawnstruct();
    anim._id_9BF9["american"][2].count = 0;
    anim._id_9BF9["american"][2]._id_6252 = "2";
    anim._id_9BF9["arab"] = [];
    anim._id_9BF9["arab"][0] = spawnstruct();
    anim._id_9BF9["arab"][0].count = 0;
    anim._id_9BF9["arab"][0]._id_6252 = "0";
    anim._id_9BF9["arab"][1] = spawnstruct();
    anim._id_9BF9["arab"][1].count = 0;
    anim._id_9BF9["arab"][1]._id_6252 = "1";
    anim._id_9BF9["arab"][2] = spawnstruct();
    anim._id_9BF9["arab"][2].count = 0;
    anim._id_9BF9["arab"][2]._id_6252 = "2";
    anim._id_9BF9["arab"][3] = spawnstruct();
    anim._id_9BF9["arab"][3].count = 0;
    anim._id_9BF9["arab"][3]._id_6252 = "3";
    anim._id_33DE = [];
    anim._id_33DE["threat"] = [];
    anim._id_33DE["response"] = [];
    anim._id_33DE["reaction"] = [];
    anim._id_33DE["order"] = [];
    anim._id_33DE["inform"] = [];
    anim._id_33DE["custom"] = [];
    anim._id_33DE["direction"] = [];

    if ( isdefined( level._id_0669 ) )
    {
        anim._id_33D9["threat"]["self"] = 20000;
        anim._id_33D9["threat"]["squad"] = 30000;
    }
    else
    {
        anim._id_33D9["threat"]["self"] = 12000;
        anim._id_33D9["threat"]["squad"] = 8000;
    }

    anim._id_33D9["response"]["self"] = 1000;
    anim._id_33D9["response"]["squad"] = 1000;
    anim._id_33D9["reaction"]["self"] = 1000;
    anim._id_33D9["reaction"]["squad"] = 1000;
    anim._id_33D9["order"]["self"] = 8000;
    anim._id_33D9["order"]["squad"] = 40000;
    anim._id_33D9["inform"]["self"] = 6000;
    anim._id_33D9["inform"]["squad"] = 8000;
    anim._id_33D9["custom"]["self"] = 0;
    anim._id_33D9["custom"]["squad"] = 5000;
    anim._id_33DE["reaction"]["casualty"] = 20000;
    anim._id_33DE["reaction"]["taunt"] = 200000;
    anim._id_33DE["inform"]["reloading"] = 20000;
    anim._id_33DC["threat"]["infantry"] = 0.5;
    anim._id_33DC["threat"]["vehicle"] = 0.7;
    anim._id_33DC["response"]["killfirm"] = 0.8;
    anim._id_33DC["response"]["ack"] = 0.9;
    anim._id_33DC["reaction"]["casualty"] = 0.5;
    anim._id_33DC["reaction"]["taunt"] = 0.9;
    anim._id_33DC["order"]["cover"] = 0.9;
    anim._id_33DC["order"]["action"] = 0.5;
    anim._id_33DC["order"]["move"] = 0.9;
    anim._id_33DC["order"]["displace"] = 0.5;
    anim._id_33DC["inform"]["killfirm"] = 0.6;
    anim._id_33DC["inform"]["attack"] = 0.9;
    anim._id_33DC["inform"]["incoming"] = 0.8;
    anim._id_33DC["inform"]["reloading"] = 0.2;
    anim._id_33DC["inform"]["suppressed"] = 0.2;
    anim._id_33DC["custom"]["generic"] = 1.0;
    anim._id_33DB["threat"]["infantry"] = 1000;
    anim._id_33DB["threat"]["vehicle"] = 1000;
    anim._id_33DB["response"]["killfirm"] = 3000;
    anim._id_33DB["response"]["ack"] = 2000;
    anim._id_33DB["reaction"]["casualty"] = 2000;
    anim._id_33DB["reaction"]["taunt"] = 2000;
    anim._id_33DB["order"]["cover"] = 3000;
    anim._id_33DB["order"]["action"] = 3000;
    anim._id_33DB["order"]["move"] = 3000;
    anim._id_33DB["order"]["displace"] = 3000;
    anim._id_33DB["inform"]["killfirm"] = 1000;
    anim._id_33DB["inform"]["attack"] = 1000;
    anim._id_33DB["inform"]["incoming"] = 1000;
    anim._id_33DB["inform"]["reloading"] = 1000;
    anim._id_33DB["inform"]["suppressed"] = 2000;
    anim._id_33DB["custom"]["generic"] = 1000;
    anim.chatcount = 0;
    anim._id_5F63 = spawn( "script_origin", ( 0, 0, 0 ) );
    anim.areas = getentarray( "trigger_location", "targetname" );
    anim.locations = getentarray( "trigger_location", "targetname" );
    anim.landmarks = getentarray( "trigger_landmark", "targetname" );
    anim._id_8AC9[anim._id_8AC9.size] = ::_id_4D5E;
    anim._id_8ACA[anim._id_8ACA.size] = "::init_squadBattleChatter";
    anim.isteamspeaking["allies"] = 0;
    anim._id_51CF["allies"]["threat"] = 0;
    anim._id_51CF["allies"]["order"] = 0;
    anim._id_51CF["allies"]["reaction"] = 0;
    anim._id_51CF["allies"]["response"] = 0;
    anim._id_51CF["allies"]["inform"] = 0;
    anim._id_51CF["allies"]["custom"] = 0;
    anim.isteamspeaking["axis"] = 0;
    anim._id_51CF["axis"]["threat"] = 0;
    anim._id_51CF["axis"]["order"] = 0;
    anim._id_51CF["axis"]["reaction"] = 0;
    anim._id_51CF["axis"]["response"] = 0;
    anim._id_51CF["axis"]["inform"] = 0;
    anim._id_51CF["axis"]["custom"] = 0;
    anim.isteamspeaking["neutral"] = 0;
    anim._id_51CF["neutral"]["threat"] = 0;
    anim._id_51CF["neutral"]["order"] = 0;
    anim._id_51CF["neutral"]["reaction"] = 0;
    anim._id_51CF["neutral"]["response"] = 0;
    anim._id_51CF["neutral"]["inform"] = 0;
    anim._id_51CF["neutral"]["custom"] = 0;

    if ( !isdefined( level._id_132D ) )
    {
        level._id_132D = [];
        level._id_132D["allies"] = 1;
        level._id_132D["axis"] = 1;
        level._id_132D["neutral"] = 1;
    }

    anim._id_5602 = [];
    anim._id_5602["allies"] = -5000;
    anim._id_5602["axis"] = -5000;

    for ( var_0 = 0; var_0 < anim._id_8ACE.size; var_0++ )
    {
        if ( isdefined( anim._id_8ACE[var_0]._id_1CA5 ) && anim._id_8ACE[var_0]._id_1CA5 )
            continue;

        anim._id_8ACE[var_0] _id_4D5E();
    }

    level notify( "battlechatter initialized" );
    anim notify( "battlechatter initialized" );
}

_id_854B()
{
    anim._id_2244 = undefined;
    anim._id_33DE = undefined;
    anim._id_33D9 = undefined;
    anim._id_33DE = undefined;
    anim._id_33DC = undefined;
    anim._id_33DB = undefined;
    anim.chatcount = undefined;
    anim._id_5F63 = undefined;
    anim.areas = undefined;
    anim.locations = undefined;
    anim.landmarks = undefined;
    anim._id_9BF9 = undefined;
    anim._id_1CA5 = 0;
    anim.playercardbackground._id_1CA5 = 0;
    level._id_132D = undefined;

    for ( var_0 = 0; var_0 < anim._id_8AC9.size; var_0++ )
    {
        if ( anim._id_8ACA[var_0] != "::init_squadBattleChatter" )
            continue;

        if ( var_0 != anim._id_8AC9.size - 1 )
        {
            anim._id_8AC9[var_0] = anim._id_8AC9[anim._id_8AC9.size - 1];
            anim._id_8ACA[var_0] = anim._id_8ACA[anim._id_8ACA.size - 1];
        }

        anim._id_8AC9[anim._id_8AC9.size - 1] = undefined;
        anim._id_8ACA[anim._id_8ACA.size - 1] = undefined;
    }

    level notify( "battlechatter disabled" );
    anim notify( "battlechatter disabled" );
}

_id_4D5E()
{
    var_0 = self;
    var_0._id_62AE = 0;
    var_0._id_5A54 = 1;
    var_0._id_60DA = gettime() + 50;
    var_0._id_60DB["threat"] = gettime() + 50;
    var_0._id_60DB["order"] = gettime() + 50;
    var_0._id_60DB["reaction"] = gettime() + 50;
    var_0._id_60DB["response"] = gettime() + 50;
    var_0._id_60DB["inform"] = gettime() + 50;
    var_0._id_60DB["custom"] = gettime() + 50;
    var_0._id_60DF["threat"] = [];
    var_0._id_60DF["order"] = [];
    var_0._id_60DF["reaction"] = [];
    var_0._id_60DF["response"] = [];
    var_0._id_60DF["inform"] = [];
    var_0._id_60DF["custom"] = [];
    var_0._id_5151["threat"] = 0;
    var_0._id_5151["order"] = 0;
    var_0._id_5151["reaction"] = 0;
    var_0._id_5151["response"] = 0;
    var_0._id_5151["inform"] = 0;
    var_0._id_5151["custom"] = 0;
    var_0._id_5595 = "";
    var_0._id_5B9D[var_0._id_5B9D.size] = animscripts\battlechatter_ai::_id_0850;
    var_0._id_5B9E[var_0._id_5B9E.size] = "::addToSystem";
    var_0._id_5BA4[var_0._id_5BA4.size] = animscripts\battlechatter_ai::_id_73AE;
    var_0._id_5BA5[var_0._id_5BA5.size] = "::removeFromSystem";
    var_0._id_8AD9[var_0._id_8AD9.size] = ::_id_4DA3;
    var_0._id_8ADA[var_0._id_8ADA.size] = "::initContact";

    for ( var_1 = 0; var_1 < anim._id_8ACE.size; var_1++ )
        var_0 thread _id_4DA3( anim._id_8ACE[var_1].stand );

    var_0 thread animscripts\battlechatter_ai::_id_8AD7();
    var_0 thread animscripts\battlechatter_ai::_id_8AD3();
    var_0._id_1CA5 = 1;
    var_0 notify( "squad chat initialized" );
}

_id_854E()
{
    var_0 = self;
    var_0._id_62AE = undefined;
    var_0._id_5A54 = undefined;
    var_0._id_60DA = undefined;
    var_0._id_60DB = undefined;
    var_0._id_60DF = undefined;
    var_0._id_5151 = undefined;

    for ( var_1 = 0; var_1 < var_0._id_5B9D.size; var_1++ )
    {
        if ( var_0._id_5B9E[var_1] != "::addToSystem" )
            continue;

        if ( var_1 != var_0._id_5B9D.size - 1 )
        {
            var_0._id_5B9D[var_1] = var_0._id_5B9D[var_0._id_5B9D.size - 1];
            var_0._id_5B9E[var_1] = var_0._id_5B9E[var_0._id_5B9E.size - 1];
        }

        var_0._id_5B9D[var_0._id_5B9D.size - 1] = undefined;
        var_0._id_5B9E[var_0._id_5B9E.size - 1] = undefined;
    }

    for ( var_1 = 0; var_1 < var_0._id_5BA4.size; var_1++ )
    {
        if ( var_0._id_5BA5[var_1] != "::removeFromSystem" )
            continue;

        if ( var_1 != var_0._id_5BA4.size - 1 )
        {
            var_0._id_5BA4[var_1] = var_0._id_5BA4[var_0._id_5BA4.size - 1];
            var_0._id_5BA5[var_1] = var_0._id_5BA5[var_0._id_5BA5.size - 1];
        }

        var_0._id_5BA4[var_0._id_5BA4.size - 1] = undefined;
        var_0._id_5BA5[var_0._id_5BA5.size - 1] = undefined;
    }

    for ( var_1 = 0; var_1 < var_0._id_8AD9.size; var_1++ )
    {
        if ( var_0._id_8ADA[var_1] != "::initContact" )
            continue;

        if ( var_1 != var_0._id_8AD9.size - 1 )
        {
            var_0._id_8AD9[var_1] = var_0._id_8AD9[var_0._id_8AD9.size - 1];
            var_0._id_8ADA[var_1] = var_0._id_8ADA[var_0._id_8ADA.size - 1];
        }

        var_0._id_8AD9[var_0._id_8AD9.size - 1] = undefined;
        var_0._id_8ADA[var_0._id_8ADA.size - 1] = undefined;
    }

    for ( var_1 = 0; var_1 < anim._id_8ACE.size; var_1++ )
        var_0 _id_854F( anim._id_8ACE[var_1].stand );

    var_0._id_1CA5 = 0;
}

_id_1357()
{
    return anim._id_1CA5;
}

_id_1356()
{
    var_0 = getdvar( "bcs_enable" );

    for (;;)
    {
        var_1 = getdvar( "bcs_enable" );

        if ( var_1 != var_0 )
        {
            switch ( var_1 )
            {
                case "on":
                    if ( !anim._id_1CA5 )
                        _id_3109();

                    break;
                case "off":
                    if ( anim._id_1CA5 )
                        _id_2AF6();

                    break;
            }

            var_0 = var_1;
        }

        wait 1.0;
    }
}

_id_3109()
{
    _id_4CB8();
    anim.playercardbackground thread animscripts\battlechatter_ai::_id_0850();
    var_0 = getaiarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] animscripts\battlechatter_ai::_id_0850();
}

_id_2AF6()
{
    _id_854B();
    var_0 = getaiarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_8AB0 ) && var_0[var_1]._id_8AB0._id_1CA5 )
            var_0[var_1]._id_8AB0 _id_854E();

        var_0[var_1] animscripts\battlechatter_ai::_id_73AE();
    }
}

_id_6A2E()
{
    if ( !_id_1357() )
        return;

    if ( !self._id_132D )
        return;

    if ( self._id_51B3 )
        return;

    if ( self._id_0550 > 0 )
        return;

    if ( self._id_8AB0._id_62AE >= self._id_8AB0._id_5A54 )
        return;

    if ( anim.isteamspeaking[self.team] )
        return;

    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_0 = _id_3FC7();

    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "custom":
            thread _id_6A3B();
            break;
        case "response":
            thread _id_6DD3();
            break;
        case "order":
            thread _id_6DCC();
            break;
        case "threat":
            thread _id_6DE3();
            break;
        case "reaction":
            thread _id_6DD2();
            break;
        case "inform":
            thread _id_6DAF();
            break;
    }
}

_id_6DE3()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self endon( "cancel speaking" );
    self._id_24C5 = self._id_1CA6["threat"];
    var_0 = self._id_1CA6["threat"]._id_9317;

    if ( !isalive( var_0 ) || isdefined( var_0._id_1A07 ) && isdefined( var_0._id_1A07[self._id_8AB0.stand] ) )
        return;

    anim thread _id_5808( self, "threat" );

    switch ( self._id_1CA6["threat"]._id_33DD )
    {
        case "infantry":
            if ( var_0 == level.playercardbackground || !isdefined( var_0 _meth_8198() ) )
                _id_932B( var_0 );

            break;
        case "dog":
            _id_9329( var_0 );
            break;
        case "vehicle":
            break;
    }

    self notify( "done speaking" );

    if ( !isalive( var_0 ) )
        return;

    var_0._id_1A07[self._id_8AB0.stand] = spawnstruct();
    var_0._id_1A07[self._id_8AB0.stand]._id_8A97 = self;
    var_0._id_1A07[self._id_8AB0.stand]._id_9333 = self._id_1CA6["threat"]._id_33DD;
    var_0._id_1A07[self._id_8AB0.stand]._id_351C = gettime() + 3000;

    if ( isdefined( var_0._id_8AB0 ) )
        self._id_8AB0._id_8AD0[var_0._id_8AB0.stand]._id_1A07 = 1;
}

_id_932B( var_0, var_1 )
{
    self endon( "cancel speaking" );
    var_2 = _id_23EB();
    var_2._id_59D8 = 1;

    if ( !isdefined( var_1 ) )
        var_2.forcedetail = 0;
    else
        var_2.forcedetail = var_1;

    var_2._id_932A = var_0;

    if ( self._id_9F32 == "british" )
    {
        if ( var_0 animscripts\pain::weaponanims() == "rocketlauncher" )
            var_2 _id_932E( var_0 );
        else
        {
            var_3 = _id_3F5A( self.origin, var_0.origin );

            switch ( var_3 )
            {
                case "northwest":
                    var_3 = "nthwest";

                    if ( var_3 == self._id_8AB0._id_5595 )
                        var_3 = "generic";

                    break;
                case "northeast":
                    var_3 = "ntheast";

                    if ( var_3 == self._id_8AB0._id_5595 )
                        var_3 = "generic";

                    break;
                case "southwest":
                    var_3 = "sthwest";

                    if ( var_3 == self._id_8AB0._id_5595 )
                        var_3 = "generic";

                    break;
                case "southeast":
                    var_3 = "stheast";

                    if ( var_3 == self._id_8AB0._id_5595 )
                        var_3 = "generic";

                    break;
                case "impossible":
                    var_3 = "generic";
            }

            self._id_8AB0._id_5595 = var_3;
            var_2 _id_0837( 1.0, "infantry", var_3 );
        }
    }
    else if ( var_0 animscripts\pain::weaponanims() == "rocketlauncher" )
        var_2 _id_932E( var_0 );
    else if ( var_0 animscripts\pain::weaponanims() == "mg" )
        var_2 threatinfantrymg( var_0 );
    else if ( var_0 _id_5103() && !isdefined( var_0 getlandmark() ) )
        var_2 _id_932D( var_0 );
    else if ( !isdefined( var_0 _id_400A() ) && !isdefined( var_0 getlandmark() ) )
    {
        var_2 _id_0837( 1.0, "infantry", "generic" );
        var_2 adddirectionalias( 1.0, "relative", var_0 );
        var_2 addareaalias( 0.5, var_0 );
    }
    else
    {
        var_2 _id_0837( 1.0, "infantry", "generic" );

        if ( var_2 addlocationalias( 1.0, var_0 ) )
        {
            var_4 = _id_4108( var_0 );

            if ( isdefined( var_4 ) )
            {
                if ( isdefined( var_4._id_1342 ) && _id_1ADE( var_4._id_1342 ) )
                {
                    var_2 _id_0802( var_4._id_1342 );
                    var_2.lootnew = var_4;
                }
                else if ( isdefined( var_4._id_1346 ) )
                {
                    var_2 _id_0822( var_4._id_1346 );
                    var_2.lootnew = var_4;
                }

                var_2 _id_081A( 1.0, "attack", "infantry" );

                if ( _id_5164() )
                    var_4 animscripts\battlechatter_ai::_id_0826( "ack", "yes", self, 0.9 );
                else
                    var_4 animscripts\battlechatter_ai::_id_0826( "ack", "norankyes", self, 0.9 );
            }
            else if ( randomfloat( 1 ) > 0.3 )
                var_2 adddirectionalias( 1.0, "side", var_0, var_2.locationent getorigin() );
            else
            {
                var_2 addareaalias( 0.5, var_0 );
                var_2 _id_081A( 1.0, "attack", "infantry" );
            }
        }
        else if ( var_2 addlandmarkalias( 1.0, var_0 ) )
        {
            var_4 = _id_4108( var_0 );

            if ( isdefined( var_4 ) )
            {
                if ( isdefined( var_4._id_1342 ) && _id_1ADE( var_4._id_1342 ) )
                {
                    var_2 _id_0802( var_4._id_1342 );
                    var_2.lootnew = var_4;
                }
                else if ( isdefined( var_4._id_1346 ) )
                {
                    var_2 _id_0822( var_4._id_1346 );
                    var_2.lootnew = var_4;
                }

                var_2 _id_081A( 1.0, "attack", "infantry" );

                if ( _id_5164() )
                    var_4 animscripts\battlechatter_ai::_id_0826( "ack", "yes", self, 0.9 );
                else
                    var_4 animscripts\battlechatter_ai::_id_0826( "ack", "norankyes", self, 0.9 );
            }
            else if ( randomfloat( 1 ) > 0.3 )
                var_2 adddirectionalias( 1.0, "relative", var_0 );
            else
            {
                var_2 addareaalias( 0.5, var_0 );
                var_2 _id_081A( 1.0, "attack", "infantry" );
            }
        }
    }

    _id_6DD0( var_2 );
}

_id_9329( var_0, var_1 )
{
    self endon( "cancel speaking" );
    var_2 = _id_23EB();
    var_2._id_59D8 = 1;

    if ( !isdefined( var_1 ) )
        var_2.forcedetail = 0;
    else
        var_2.forcedetail = var_1;

    var_2._id_932A = var_0;

    if ( self._id_9F32 == "british" )
    {
        var_3 = _id_3F5A( self.origin, var_0.origin );

        switch ( var_3 )
        {
            case "northwest":
                var_3 = "nthwest";
                break;
            case "northeast":
                var_3 = "ntheast";
                break;
            case "southwest":
                var_3 = "sthwest";
                break;
            case "southeast":
                var_3 = "stheast";
                break;
            case "impossible":
                var_3 = "generic";
        }

        var_2 _id_0837( 1.0, "dog", var_3 );
    }
    else
    {
        var_2 _id_0837( 1.0, "dog", "generic" );
        var_2 adddirectionalias( 1.0, "relative", var_0 );
    }

    _id_6DD0( var_2 );
}

_id_932D( var_0 )
{
    if ( !isdefined( var_0 getlandmark() ) )
        _id_0837( 1.0, "infantry", "exposed" );
    else
        _id_0837( 1.0, "infantry", "generic" );

    if ( addlandmarkalias( 1.0, var_0 ) )
        adddirectionalias( 0.5, "relative", var_0 );
    else
        adddirectionalias( 1.0, "relative", var_0 );
}

_id_932E( var_0 )
{
    _id_0837( 1.0, "rpg", "generic" );

    if ( addareaalias( 0.5, var_0 ) && self.areadetail )
        return;

    if ( addlocationalias( 0.5, var_0 ) )
        adddirectionalias( 0.5, "side", var_0, self.locationent getorigin() );
    else if ( addlandmarkalias( 0.5, var_0 ) )
        adddirectionalias( 0.5, "relative", var_0 );
}

threatinfantrymg( var_0 )
{
    _id_0837( 1.0, "mg", "generic" );

    if ( addareaalias( 0.5, var_0 ) && self.areadetail )
        return;

    if ( addlocationalias( 0.5, var_0 ) )
        adddirectionalias( 0.5, "side", var_0, self.locationent getorigin() );
    else if ( addlandmarkalias( 0.5, var_0 ) )
        adddirectionalias( 0.5, "relative", var_0 );
}

_id_6DD2()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self._id_24C5 = self._id_1CA6["reaction"];
    var_0 = self._id_1CA6["reaction"]._id_71CF;
    anim thread _id_5808( self, "reaction" );

    switch ( self._id_1CA6["reaction"]._id_33DD )
    {
        case "casualty":
            _id_7188( var_0, self._id_1CA6["reaction"]._id_5D47 );
            break;
        case "taunt":
            _id_718C( var_0, self._id_1CA6["reaction"]._id_5D47 );
            break;
    }

    self notify( "done speaking" );
}

_id_7188( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();
    var_2 _id_0823( 1.0, "casualty", "generic" );
    _id_6DD0( var_2 );
}

_id_718C( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();
    var_2 _id_0836( 1.0, "taunt", "generic" );
    _id_6DD0( var_2 );
}

_id_6DD3()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self._id_24C5 = self._id_1CA6["response"];
    var_0 = self._id_1CA6["response"]._id_747E;

    if ( !isalive( var_0 ) )
        return;

    if ( self._id_1CA6["response"]._id_5D47 == "follow" && self.a._id_8D56 != "move" )
        return;

    anim thread _id_5808( self, "response" );

    switch ( self._id_1CA6["response"]._id_33DD )
    {
        case "killfirm":
            responsekillconfirm( var_0, self._id_1CA6["response"]._id_5D47 );
            break;
        case "ack":
            responseacknowledge( var_0, self._id_1CA6["response"]._id_5D47 );
            break;
    }

    self notify( "done speaking" );
}

responseacknowledge( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !isalive( var_0 ) )
        return;

    var_2 = _id_23EB();
    var_2 _id_0825( 1.0, "ack", var_1 );
    var_2.lootnew = var_0;
    _id_6DD0( var_2 );
}

responsekillconfirm( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();
    var_2 _id_0825( 1.0, "killfirm", "infantry" );
    var_2.lootnew = var_0;
    _id_6DD0( var_2 );
}

_id_6DCC()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self._id_24C5 = self._id_1CA6["order"];
    anim thread _id_5808( self, "order" );

    switch ( self._id_1CA6["order"]._id_33DD )
    {
        case "action":
            _id_657C( self._id_1CA6["order"]._id_5D47 );
            break;
        case "move":
            _id_657E( self._id_1CA6["order"]._id_5D47, self._id_1CA6["order"]._id_6580 );
            break;
        case "displace":
            _id_657D( self._id_1CA6["order"]._id_5D47 );
            break;
        case "cover":
            ordercover( self._id_1CA6["order"]._id_5D47, self._id_1CA6["order"]._id_6580 );
            break;
    }

    self notify( "done speaking" );
}

_id_657E( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();

    if ( var_0 == "follow" )
    {
        var_3 = getaiarray( self.team );
        var_1 = undefined;

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4] == self )
                continue;

            if ( distance( self.origin, var_3[var_4].origin ) > 500 && var_3[var_4].a._id_8D56 == "move" && var_3[var_4] _id_1ADD( "response" ) )
                var_1 = var_3[var_4];
        }

        if ( isdefined( var_1 ) && isdefined( var_1._id_1342 ) && _id_1ADE( var_1._id_1342 ) )
        {
            var_2 _id_0802( var_1._id_1342 );
            var_2.lootnew = var_1;
            var_1 animscripts\battlechatter_ai::_id_0826( "ack", "follow", self, 1.0 );
        }
        else if ( isdefined( var_1 ) && isdefined( var_1._id_1346 ) )
        {
            var_2 _id_0822( var_1._id_1346 );
            var_2.lootnew = var_1;
            var_1 animscripts\battlechatter_ai::_id_0826( "ack", "follow", self, 1.0 );
        }
        else
            level notify( "follow order", self );

        var_2 _id_081A( 1.0, "move", var_0 );
    }
    else
        var_2 _id_081A( 1.0, "move", var_0 );

    _id_6DD0( var_2 );
}

_id_657D( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();
    var_1 _id_081A( 1.0, "displace", var_0 );
    _id_6DD0( var_1, 1 );
}

_id_657C( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();
    var_1 _id_081A( 1.0, "action", var_0 );
    _id_6DD0( var_1 );
}

ordercover( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();

    if ( randomfloat( 1 ) < 0.5 && _id_5164() )
    {
        if ( isdefined( var_1 ) && isdefined( var_1._id_1346 ) )
        {
            var_2 _id_0822( var_1._id_1346 );
            var_2.lootnew = var_1;
        }
    }
    else if ( isdefined( var_1 ) && isdefined( var_1._id_1342 ) && _id_1ADE( var_1._id_1342 ) )
    {
        var_2 _id_0802( var_1._id_1342 );
        var_2.lootnew = var_1;
    }
    else if ( isdefined( var_1 ) && isdefined( var_1._id_1346 ) )
    {
        var_2 _id_0822( var_1._id_1346 );
        var_2.lootnew = var_1;
    }

    var_2 _id_081A( 1.0, "cover", var_0 );
    _id_6DD0( var_2 );
}

_id_6DAF()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self._id_24C5 = self._id_1CA6["inform"];
    anim thread _id_5808( self, "inform" );

    switch ( self._id_1CA6["inform"]._id_33DD )
    {
        case "killfirm":
            informkillconfirm( self._id_1CA6["inform"]._id_5D47 );
            break;
        case "incoming":
            _id_4C62( self._id_1CA6["inform"]._id_5D47 );
            break;
        case "attack":
            _id_4C61( self._id_1CA6["inform"]._id_5D47 );
            break;
        case "reloading":
            _id_4C64( self._id_1CA6["inform"]._id_4C66, self._id_1CA6["inform"]._id_5D47 );
            break;
        case "suppressed":
            informsupressed( self._id_1CA6["inform"]._id_5D47 );
            break;
    }

    self notify( "done speaking" );
}

_id_4C64( var_0, var_1 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_2 = _id_23EB();

    if ( var_1 == "coverme" && isalive( var_0 ) && isdefined( var_0._id_1342 ) && _id_1ADE( var_0._id_1342 ) )
    {
        if ( var_0 == level.playercardbackground || self._id_2243 != "US" )
            var_1 = "generic";
        else
        {
            var_1 = var_0._id_1342;
            var_0 animscripts\battlechatter_ai::_id_0826( "ack", "covering", self, 0.9 );
            var_2.lootnew = var_0;
        }
    }
    else
        var_1 = "generic";

    var_2 _id_07E6( 1.0, "reloading", var_1 );
    _id_6DD0( var_2 );
}

informsupressed( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();
    var_1 _id_07E6( 1.0, "suppressed", var_0 );
    _id_6DD0( var_1 );
}

_id_4C62( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();

    if ( var_0 == "grenade" )
        var_1._id_59D8 = 1;

    var_1 _id_07E6( 1.0, "incoming", var_0 );
    _id_6DD0( var_1 );
}

_id_4C61( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();
    var_1 _id_07E6( 1.0, "attack", var_0 );
    _id_6DD0( var_1 );
}

informkillconfirm( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_1 = _id_23EB();
    var_1 _id_07E6( 1.0, "killfirm", "infantry" );
    _id_6DD0( var_1 );
}

_id_6A3B()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self._id_24C5 = self._id_1CA6["custom"];
    anim thread _id_5808( self, self._id_24C5.unlockpoints, 1 );
    _id_6DD0( self._id_2558 );
    self notify( "done speaking" );
    self._id_2557 = undefined;
    self._id_2558 = undefined;
}

_id_6DD0( var_0, var_1 )
{
    anim endon( "battlechatter disabled" );
    self endon( "death" );

    if ( isdefined( var_1 ) )
        return;

    if ( isdefined( level._id_0669 ) && self._id_9F32 == "british" )
    {
        for ( var_2 = 0; var_2 < var_0._id_88A9.size; var_2++ )
            var_0._id_88A9[var_2] += "_s";
    }

    if ( _id_132E() )
    {
        for ( var_2 = 0; var_2 < var_0._id_88A9.size; var_2++ )
            _id_1335( var_0._id_88A9[var_2] );

        battlechatter_println( "" );
    }

    thread _id_1336( var_0._id_88A9 );

    for ( var_2 = 0; var_2 < var_0._id_88A9.size; var_2++ )
    {
        if ( !self._id_132D )
            continue;

        if ( self._id_0550 > 0 )
            continue;

        if ( _id_5105( self._id_24C5._id_33D8 ) )
        {
            wait 0.85;
            continue;
        }

        var_3 = gettime();

        if ( var_0._id_59D8 && self.team == "allies" )
        {
            if ( getdvar( "bcs_threatPlayerRelative" ) == "on" )
            {
                if ( strfind( var_0._id_88A9[var_2], "_direction_" ) )
                {
                    if ( isdefined( var_0._id_932A ) )
                        var_0._id_88A9[var_2] = var_0 getdirectionaliasplayerrelative( var_0._id_932A );
                }
            }

            self playsoundasmaster( var_0._id_88A9[var_2], var_0._id_88A9[var_2], 1 );
            thread maps\_anim::_id_0BC4( var_0._id_88A9[var_2], var_0.lootnew );
            self waittill( var_0._id_88A9[var_2] );
            continue;
        }

        self playsound( var_0._id_88A9[var_2], var_0._id_88A9[var_2], 1 );
        thread maps\_anim::_id_0BC4( var_0._id_88A9[var_2], var_0.lootnew );
        self waittill( var_0._id_88A9[var_2] );
    }

    _id_2D8B( self._id_24C5._id_33D8, self._id_24C5._id_33DD );
}

_id_51B4( var_0 )
{
    self endon( "death" );
    wait 45;
    _id_1EF1( var_0 );
}

_id_1EF1( var_0 )
{
    self._id_51B3 = 0;
    self._id_1CA6[var_0]._id_351C = 0;
    self._id_1CA6[var_0]._id_6FBE = 0.0;
    self._id_60DB[var_0] = gettime() + anim._id_33D9[var_0]["self"];
}

_id_5808( var_0, var_1, var_2 )
{
    anim endon( "battlechatter disabled" );
    var_3 = var_0._id_8AB0;
    var_4 = var_0.team;
    var_0._id_51B3 = 1;
    var_0 thread _id_51B4( var_1 );
    var_3._id_5151[var_1] = 1;
    var_3._id_62AE++;
    anim.isteamspeaking[var_4] = 1;
    anim._id_51CF[var_4][var_1] = 1;
    var_5 = var_0 common_scripts\utility::_id_A070( "death", "done speaking", "cancel speaking" );
    var_3._id_5151[var_1] = 0;
    var_3._id_62AE--;
    anim.isteamspeaking[var_4] = 0;
    anim._id_51CF[var_4][var_1] = 0;
    anim._id_5602[var_4] = gettime();

    if ( var_5 == "cancel speaking" )
        return;

    if ( isalive( var_0 ) )
        var_0 _id_1EF1( var_1 );

    var_3._id_60DB[var_1] = gettime() + anim._id_33D9[var_1]["squad"];
}

_id_9B0A( var_0, var_1 )
{
    if ( gettime() - self._id_8AD0[var_0]._id_558C > 10000 )
    {
        var_2 = 0;

        for ( var_3 = 0; var_3 < self._id_5BA6.size; var_3++ )
        {
            if ( self._id_5BA6[var_3] != var_1 && isalive( self._id_5BA6[var_3].enemy ) && isdefined( self._id_5BA6[var_3].enemy._id_8AB0 ) && self._id_5BA6[var_3].enemy._id_8AB0.stand == var_0 )
                var_2 = 1;
        }

        if ( !var_2 )
        {
            self._id_8AD0[var_0]._id_3819 = gettime();
            self._id_8AD0[var_0]._id_1A07 = 0;
        }
    }

    self._id_8AD0[var_0]._id_558C = gettime();
}

_id_1ADD( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( self == level.playercardbackground )
        return 0;

    if ( !isdefined( self._id_132D ) || !self._id_132D )
        return 0;

    if ( isdefined( var_2 ) && var_2 >= 1 )
        return 1;

    if ( gettime() + anim._id_33D9[var_0]["self"] < self._id_60DB[var_0] )
        return 0;

    if ( gettime() + anim._id_33D9[var_0]["squad"] < self._id_8AB0._id_60DB[var_0] )
        return 0;

    if ( isdefined( var_1 ) && _id_99E7( var_0, var_1 ) )
        return 0;

    if ( isdefined( var_1 ) && anim._id_33DC[var_0][var_1] < self._id_134D )
        return 0;

    if ( self._id_9F32 == "british" )
        return britfilter( var_0, var_1, var_3 );

    return 1;
}

britfilter( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( var_1 ) )
        return 0;

    switch ( var_0 )
    {
        case "order":
            if ( var_1 == "action" && var_2 == "coverme" )
                return 1;

            break;
        case "threat":
            if ( var_1 == "infantry" || var_1 == "dog" || var_1 == "rpg" )
                return 1;

            break;
        case "inform":
            if ( var_1 == "attack" && var_2 == "grenade" )
                return 1;
            else if ( var_1 == "incoming" && var_2 == "grenade" )
                return 1;
            else if ( var_1 == "killfirm" && var_2 == "infantry" )
                return 1;
            else if ( var_1 == "reloading" && var_2 == "generic" )
                return 1;

            break;
        case "reaction":
            if ( var_1 == "casualty" && var_2 == "generic" )
                return 1;

            break;
        default:
            return 0;
    }

    return 0;
}

_id_3FC7()
{
    var_0 = undefined;
    var_1 = -999999999;

    if ( _id_51EB( "custom" ) )
    {
        var_0 = "custom";
        var_1 = self._id_1CA6["custom"]._id_6FBE;
    }

    if ( _id_51EB( "response" ) )
    {
        if ( self._id_1CA6["response"]._id_6FBE > var_1 )
        {
            var_0 = "response";
            var_1 = self._id_1CA6["response"]._id_6FBE;
        }
    }

    if ( _id_51EB( "order" ) )
    {
        if ( self._id_1CA6["order"]._id_6FBE > var_1 )
        {
            var_0 = "order";
            var_1 = self._id_1CA6["order"]._id_6FBE;
        }
    }

    if ( _id_51EB( "threat" ) )
    {
        if ( self._id_1CA6["threat"]._id_6FBE > var_1 )
        {
            var_0 = "threat";
            var_1 = self._id_1CA6["threat"]._id_6FBE;
        }
    }

    if ( _id_51EB( "inform" ) )
    {
        if ( self._id_1CA6["inform"]._id_6FBE > var_1 )
        {
            var_0 = "inform";
            var_1 = self._id_1CA6["inform"]._id_6FBE;
        }
    }

    if ( _id_51EB( "reaction" ) )
    {
        if ( self._id_1CA6["reaction"]._id_6FBE > var_1 )
        {
            var_0 = "reaction";
            var_1 = self._id_1CA6["reaction"]._id_6FBE;
        }
    }

    return var_0;
}

_id_4108( var_0 )
{
    var_1 = self._id_8AB0;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1._id_5BA6.size; var_3++ )
    {
        if ( isdefined( var_1._id_5BA6[var_3].enemy ) && var_1._id_5BA6[var_3].enemy == var_0 )
            var_2[var_2.size] = var_1._id_5BA6[var_3];
    }

    if ( !isdefined( var_2[0] ) )
        return undefined;

    var_4 = undefined;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] _id_1ADD( "response" ) )
            return var_4;
    }

    return common_scripts\utility::_id_3F33( self.origin, var_2 );
}

_id_40A1()
{
    var_0 = [];
    var_1 = [];
    var_0[0] = "custom";
    var_0[1] = "response";
    var_0[2] = "order";
    var_0[3] = "threat";
    var_0[4] = "inform";

    for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
    {
        for ( var_3 = 1; var_3 <= var_2; var_3++ )
        {
            if ( self._id_1CA6[var_0[var_3 - 1]]._id_6FBE < self._id_1CA6[var_0[var_3]]._id_6FBE )
            {
                var_4 = var_0[var_3 - 1];
                var_0[var_3 - 1] = var_0[var_3];
                var_0[var_3] = var_4;
            }
        }
    }

    var_5 = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_6 = _id_3F8A( var_0[var_2] );

        if ( var_6 == " valid" && !var_5 )
        {
            var_5 = 1;
            var_1[var_2] = "g " + var_0[var_2] + var_6 + " " + self._id_1CA6[var_0[var_2]]._id_6FBE;
            continue;
        }

        if ( var_6 == " valid" )
        {
            var_1[var_2] = "y " + var_0[var_2] + var_6 + " " + self._id_1CA6[var_0[var_2]]._id_6FBE;
            continue;
        }

        if ( self._id_1CA6[var_0[var_2]]._id_351C == 0 )
        {
            var_1[var_2] = "b " + var_0[var_2] + var_6 + " " + self._id_1CA6[var_0[var_2]]._id_6FBE;
            continue;
        }

        var_1[var_2] = "r " + var_0[var_2] + var_6 + " " + self._id_1CA6[var_0[var_2]]._id_6FBE;
    }

    return var_1;
}

_id_3F8A( var_0 )
{
    var_1 = "";

    if ( self._id_8AB0._id_5151[var_0] )
        var_1 += " playing";

    if ( gettime() > self._id_1CA6[var_0]._id_351C )
        var_1 += " expired";

    if ( gettime() < self._id_8AB0._id_60DB[var_0] )
        var_1 += " cantspeak";

    if ( var_1 == "" )
        var_1 = " valid";

    return var_1;
}

_id_5105( var_0 )
{
    if ( getdvar( "bcs_filter" + var_0 ) == "on" || getdvar( "bcs_filter" + var_0 ) == "1" )
        return 1;

    return 0;
}

_id_51EB( var_0 )
{
    if ( !self._id_8AB0._id_5151[var_0] && !anim._id_51CF[self.team][var_0] && gettime() < self._id_1CA6[var_0]._id_351C && gettime() > self._id_8AB0._id_60DB[var_0] )
    {
        if ( !_id_99E7( var_0, self._id_1CA6[var_0]._id_33DD ) )
            return 1;
    }

    return 0;
}

_id_99E7( var_0, var_1 )
{
    if ( !isdefined( anim._id_33DE[var_0][var_1] ) )
        return 0;

    if ( !isdefined( self._id_8AB0._id_60DF[var_0][var_1] ) )
        return 0;

    if ( gettime() > self._id_8AB0._id_60DF[var_0][var_1] )
        return 0;

    return 1;
}

_id_2D8B( var_0, var_1 )
{
    if ( !isdefined( anim._id_33DE[var_0][var_1] ) )
        return;

    self._id_8AB0._id_60DF[var_0][var_1] = gettime() + anim._id_33DE[var_0][var_1];
}

_id_1340()
{
    if ( isplayer( self ) )
        return 0;

    if ( _id_5103() )
        return 0;

    return animscripts\utility::_id_51AC( self.weapon_switch_invalid );
}

_id_5103()
{
    if ( isdefined( _id_400A() ) )
        return 0;

    var_0 = _id_133E();

    if ( !isdefined( var_0 ) )
        return 1;

    if ( var_0.unlockpoints[0] == "C" && var_0.unlockpoints[1] == "o" && var_0.unlockpoints[2] == "v" )
        return 0;

    return 1;
}

isclaimednodecover()
{
    var_0 = _id_133E();

    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0.unlockpoints[0] == "C" && var_0.unlockpoints[1] == "o" && var_0.unlockpoints[2] == "v" )
        return 1;

    return 0;
}

isclaimednodewindow()
{
    var_0 = _id_133E();

    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0._id_7A27 ) )
        return 0;

    if ( var_0._id_7A27 == "window" )
        return 1;

    return 0;
}

isnodecover()
{
    var_0 = self.node_relinquished;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0.unlockpoints[0] == "C" && var_0.unlockpoints[1] == "o" && var_0.unlockpoints[2] == "v" )
        return 1;

    return 0;
}

_id_5164()
{
    var_0 = _id_40A9();

    if ( var_0 == "sergeant" || var_0 == "lieutenant" || var_0 == "captain" || var_0 == "sergeant" )
        return 1;

    return 0;
}

_id_133E()
{
    if ( isplayer( self ) )
        var_0 = self.node_relinquished;
    else
        var_0 = animscripts\utility::_id_3F2F();
}

_id_4030()
{
    if ( self.team == "axis" )
        var_0 = self._id_0986;
    else if ( self.team == "allies" )
        var_0 = self.nearz;
    else
        var_0 = undefined;

    if ( !isdefined( var_0 ) || self._id_9F32 == "british" )
        return undefined;

    var_1 = strtok( var_0, " " );

    if ( var_1.size < 2 )
        return undefined;

    return var_1[1];
}

_id_40A9()
{
    return self._id_0992;
}

getclosestspeaker( var_0, var_1 )
{
    var_2 = _id_40DF( var_0, var_1 );
    var_3 = common_scripts\utility::_id_3F33( self.origin, var_2 );
    return var_3;
}

_id_40DF( var_0, var_1 )
{
    var_2 = [];
    var_3 = getaiarray( self.team );

    if ( isdefined( var_1 ) && var_1 )
    {
        var_4 = [];

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            if ( var_3[var_5] _id_5164() )
                var_4[var_4.size] = var_3[var_5];
        }

        var_3 = var_4;
    }

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( var_3[var_5] == self )
            continue;

        if ( !var_3[var_5] _id_1ADD( var_0 ) )
            continue;

        var_2[var_2.size] = var_3[var_5];
    }

    return var_2;
}

getarea()
{
    var_0 = anim.areas;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( self istouching( var_0[var_1] ) && isdefined( var_0[var_1]._id_793E ) )
            return var_0[var_1];
    }

    return undefined;
}

_id_400A()
{
    var_0 = anim.locations;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( self istouching( var_0[var_1] ) && isdefined( var_0[var_1]._id_7A27 ) )
            return var_0[var_1];
    }

    return undefined;
}

getlandmark()
{
    var_0 = anim.landmarks;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( self istouching( var_0[var_1] ) && isdefined( var_0[var_1]._id_7A20 ) )
            return var_0[var_1];
    }

    return undefined;
}

_id_3F5A( var_0, var_1 )
{
    var_2 = vectortoangles( var_1 - var_0 );
    var_3 = var_2[1];
    var_4 = getnorthyaw();
    var_3 -= var_4;

    if ( var_3 < 0 )
        var_3 += 360;
    else if ( var_3 > 360 )
        var_3 -= 360;

    if ( var_3 < 22.5 || var_3 > 337.5 )
        var_5 = "north";
    else if ( var_3 < 67.5 )
        var_5 = "northwest";
    else if ( var_3 < 112.5 )
        var_5 = "west";
    else if ( var_3 < 157.5 )
        var_5 = "southwest";
    else if ( var_3 < 202.5 )
        var_5 = "south";
    else if ( var_3 < 247.5 )
        var_5 = "southeast";
    else if ( var_3 < 292.5 )
        var_5 = "east";
    else if ( var_3 < 337.5 )
        var_5 = "northeast";
    else
        var_5 = "impossible";

    return var_5;
}

getdirectionreferenceside( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 - var_0 );
    var_4 = vectortoangles( var_1 - var_0 );
    var_5 = var_3[1] - var_4[1];
    var_5 += 360;
    var_5 = int( var_5 ) % 360;

    if ( var_5 > 180 )
        var_5 -= 360;

    if ( var_5 > 2 && var_5 < 45 )
        var_6 = "right";
    else if ( var_5 < -2 && var_5 > -45 )
        var_6 = "left";
    else if ( distance( var_0, var_1 ) < distance( var_0, var_2 ) )
        var_6 = "front";
    else
        var_6 = "rear";

    return var_6;
}

_id_3F5E( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 );
    var_4 = vectortoangles( var_1 - var_0 );
    var_5 = var_3[1] - var_4[1];
    var_5 += 360;
    var_5 = int( var_5 ) % 360;

    if ( var_5 > 315 || var_5 < 45 )
        var_6 = "front";
    else if ( var_5 < 135 )
        var_6 = "right";
    else if ( var_5 < 225 )
        var_6 = "rear";
    else
        var_6 = "left";

    return var_6;
}

_id_4152( var_0 )
{
    return ( var_0[1], 0 - var_0[0], var_0[2] );
}

_id_4151( var_0 )
{
    var_1 = ( 0, 0, 0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1 += var_0[var_2];

    return ( var_1[0] / var_0.size, var_1[1] / var_0.size, var_1[2] / var_0.size );
}

_id_0802( var_0 )
{
    self._id_88A9[self._id_88A9.size] = self.owner._id_2243 + "_" + self.owner._id_6252 + "_name_" + var_0;
}

_id_0822( var_0 )
{
    self._id_88A9[self._id_88A9.size] = self.owner._id_2243 + "_" + self.owner._id_6252 + "_rank_" + var_0;
}

_id_1ADE( var_0 )
{
    var_1 = self._id_2243 + "_" + self._id_6252 + "_name_" + var_0;

    if ( soundexists( var_1 ) )
        return 1;
    else
        return 0;
}

addareaalias( var_0, var_1 )
{
    if ( randomfloat( 1 ) > var_0 )
        return 0;

    self.areaent = var_1 getarea();

    if ( !isdefined( self.areaent ) )
        return 0;

    if ( self.areaent._id_793E == "window" || self.areaent._id_793E == "doorway" )
    {

    }

    var_2 = self.areaent._id_793E;
    var_3 = var_1 _id_133E();

    if ( isdefined( var_3 ) && isdefined( var_3._id_793E ) )
    {
        var_2 += var_3._id_793E;
        self.areadetail = 1;
    }
    else
    {
        self.areadetail = 0;
        var_2 += "_generic";
    }

    self.area = self.owner._id_2243 + "_" + self.owner._id_6252 + "_area_" + var_2;
    self._id_88A9[self._id_88A9.size] = self.area;
    return 1;
}

addlocationalias( var_0, var_1 )
{
    if ( randomfloat( 1 ) > var_0 )
        return 0;

    self.locationent = var_1 _id_400A();

    if ( !isdefined( self.locationent ) )
        return 0;

    var_2 = self.locationent._id_7A27;
    var_3 = var_1 _id_133E();

    if ( isdefined( var_3 ) && isdefined( var_3._id_7A27 ) )
        var_2 += ( "_" + var_3._id_7A27 );
    else
        var_2 += "_generic";

    self._id_57F4 = self.owner._id_2243 + "_" + self.owner._id_6252 + "_location_" + var_2;
    self._id_88A9[self._id_88A9.size] = self._id_57F4;
    return 1;
}

addlandmarkalias( var_0, var_1 )
{
    if ( randomfloat( 1 ) > var_0 )
        return 0;

    self.landmarkent = var_1 getlandmark();

    if ( !isdefined( self.landmarkent ) )
        return 0;

    var_2 = self.landmarkent._id_7A20;
    var_3 = getdirectionreferenceside( self.owner.origin, var_1.origin, self.landmarkent.origin );

    if ( var_3 == "rear" && soundexists( self.owner._id_2243 + "_" + self.owner._id_6252 + "_landmark_behind_" + var_2 ) )
        var_2 = "behind_" + var_2;
    else if ( soundexists( self.owner._id_2243 + "_" + self.owner._id_6252 + "_landmark_near_" + var_2 ) )
        var_2 = "near_" + var_2;
    else
        return 0;

    self.landmark = self.owner._id_2243 + "_" + self.owner._id_6252 + "_landmark_" + var_2;
    self._id_88A9[self._id_88A9.size] = self.landmark;
    return 1;
}

addgenericalias( var_0, var_1, var_2, var_3 )
{
    self._id_88A9[self._id_88A9.size] = self.owner._id_2243 + "_" + self.owner._id_6252 + "_" + var_1 + "_" + var_2 + "_" + var_3;
    _id_2D8B( var_1, var_2 );
}

adddirectionalias( var_0, var_1, var_2, var_3, var_4 )
{
    if ( randomfloat( 1 ) > var_0 )
        return 0;

    switch ( var_1 )
    {
        case "side":
            var_5 = getdirectionreferenceside( self.owner.origin, var_2.origin, var_3 );

            if ( 1 )
                return 0;

            var_5 = var_1 + "_" + var_5;
            break;
        case "relative":
            if ( isdefined( var_4 ) )
            {
                if ( var_4 == "clock" )
                    var_6 = 0;
                else if ( var_4 == "flank" )
                    var_6 = 1;
                else if ( var_4 == "compass" )
                    var_6 = 2;
                else
                    var_6 = randomintrange( 0, 3 ) - 1;
            }
            else if ( distance( self.owner.origin, var_2.origin ) > 2048 )
                var_6 = 2;
            else if ( distance( self.owner.origin, var_2.origin ) > 800 )
                var_6 = 0;
            else
                var_6 = 1;

            if ( var_6 == 0 )
                var_5 = _id_3F5A( self.owner.origin, var_2.origin );
            else if ( var_6 == 1 )
                return 0;
            else
                var_5 = _id_3F5A( self.owner.origin, var_2.origin );

            var_5 = var_1 + "_" + var_5;
            break;
        default:
            return 0;
    }

    self._id_2A6D = self.owner._id_2243 + "_" + self.owner._id_6252 + "_direction_" + var_5;
    self._id_88A9[self._id_88A9.size] = self._id_2A6D;
    return 1;
}

getdirectionaliasplayerrelative( var_0 )
{
    var_1 = getdirectionreferenceside( level.playercardbackground.origin, var_0.origin, anglestoforward( level.playercardbackground.angles ) );
    var_1 = "relative_" + var_1;
    self._id_2A6D = self.owner._id_2243 + "_" + self.owner._id_6252 + "_direction_" + var_1;
    return self._id_2A6D;
}

_id_0837( var_0, var_1, var_2 )
{
    self._id_9317 = self.owner._id_2243 + "_" + self.owner._id_6252 + "_threat_" + var_1 + "_" + var_2;
    self._id_88A9[self._id_88A9.size] = self._id_9317;
    return 1;
}

_id_07E6( var_0, var_1, var_2 )
{
    self.inform = self.owner._id_2243 + "_" + self.owner._id_6252 + "_inform_" + var_1 + "_" + var_2;
    self._id_88A9[self._id_88A9.size] = self.inform;
    return 1;
}

_id_0825( var_0, var_1, var_2 )
{
    self.response = self.owner._id_2243 + "_" + self.owner._id_6252 + "_response_" + var_1 + "_" + var_2;
    self._id_88A9[self._id_88A9.size] = self.response;
    return 1;
}

_id_0823( var_0, var_1, var_2 )
{
    self._id_717C = self.owner._id_2243 + "_" + self.owner._id_6252 + "_reaction_" + var_1 + "_" + var_2;
    self._id_88A9[self._id_88A9.size] = self._id_717C;
    return 1;
}

_id_0836( var_0, var_1, var_2 )
{
    self._id_717C = self.owner._id_2243 + "_" + self.owner._id_6252 + "_taunt";
    self._id_88A9[self._id_88A9.size] = self._id_717C;
    return 1;
}

_id_081A( var_0, var_1, var_2 )
{
    self.order = self.owner._id_2243 + "_" + self.owner._id_6252 + "_order_" + var_1 + "_" + var_2;
    self._id_88A9[self._id_88A9.size] = self.order;
    return 1;
}

_id_4DA3( var_0 )
{
    if ( !isdefined( self._id_8AD0[var_0]._id_1A07 ) )
        self._id_8AD0[var_0]._id_1A07 = 0;

    if ( !isdefined( self._id_8AD0[var_0]._id_3819 ) )
        self._id_8AD0[var_0]._id_3819 = 2000000000;

    if ( !isdefined( self._id_8AD0[var_0]._id_558C ) )
        self._id_8AD0[var_0]._id_558C = 0;
}

_id_854F( var_0 )
{
    self._id_8AD0[var_0]._id_1A07 = undefined;
    self._id_8AD0[var_0]._id_3819 = undefined;
    self._id_8AD0[var_0]._id_558C = undefined;
}

_id_23EA( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.owner = self;
    var_3._id_33DD = var_1;
    var_3._id_33D8 = var_0;

    if ( isdefined( var_2 ) )
        var_3._id_6FBE = var_2;
    else
        var_3._id_6FBE = anim._id_33DC[var_0][var_1];

    var_3._id_351C = gettime() + anim._id_33DB[var_0][var_1];
    return var_3;
}

_id_23EB()
{
    var_0 = spawnstruct();
    var_0.owner = self;
    var_0._id_88A9 = [];
    var_0._id_59D8 = 0;
    return var_0;
}

canseepoint( var_0 )
{
    var_1 = anglestoforward( self.angles );
    return vectordot( var_1, var_0 - self.origin ) > 0.766;
}

_id_6E26( var_0 )
{
    var_1 = anglestoforward( self.angles );
    return vectordot( var_1, var_0 - self.origin ) > 0.766;
}

_id_132E()
{
    if ( getdvar( "debug_bcprint" ) == self.team || getdvar( "debug_bcprint" ) == "all" )
        return 1;

    return 0;
}

_id_1335( var_0 )
{

}

battlechatter_println( var_0 )
{

}

battlechatter_print_internal( var_0, var_1 )
{
    if ( !_id_132E() )
        return;

    var_2 = "";

    if ( var_0 != "" )
        var_2 = common_scripts\utility::_id_9294( self.team == "allies", "^5", "^6" ) + "BC: ";

    [[ var_1 ]]( var_2 + var_0 );
}

_id_132F()
{
    return getdvar( "debug_bcprintdump" ) == "on";
}

_id_1336( var_0 )
{

}

_id_1337( var_0, var_1, var_2 )
{

}

strfind( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[0] )
            continue;

        if ( var_1.size > var_0.size - var_2 )
            return 0;

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_0[var_2 + var_3] != var_1[var_3] )
                break;

            if ( var_3 == var_1.size - 1 )
                return 1;
        }
    }
}

threattracker()
{
    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = getaiarray( "allies" );
        var_2 = [];

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( !level.playercardbackground _id_6E26( var_0[var_3].origin ) )
                continue;

            if ( distance( level.playercardbackground.origin, var_0[var_3].origin ) > 2048 )
                continue;

            var_4 = "";
            var_5 = var_0[var_3] _id_400A();

            if ( !isdefined( var_5 ) )
            {
                var_5 = var_0[var_3] getlandmark();

                if ( !isdefined( var_5 ) )
                    continue;

                var_4 = var_5._id_7A20;
            }
            else
                var_4 = var_5._id_7A27;

            var_6 = 0;

            for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            {
                if ( isdefined( var_1[var_7].enemy ) && var_1[var_7].enemy == var_0[var_3] )
                    var_6 = 1;
            }

            if ( var_6 )
            {
                var_2[var_2.size] = "^2" + var_4;
                continue;
            }

            var_2[var_2.size] = "^1" + var_4;
        }

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {

        }

        wait 0.5;
    }
}

_id_133D()
{
    for ( var_0 = 0; var_0 < anim.areas.size; var_0++ )
    {
        if ( !isdefined( anim.areas[var_0]._id_793E ) )
            continue;

        thread _id_2DD3( "Area:     " + anim.areas[var_0]._id_793E, anim.areas[var_0] getorigin(), ( 0, 0, 16 ), ( 1, 1, 1 ) );
    }

    for ( var_0 = 0; var_0 < anim.locations.size; var_0++ )
    {
        if ( !isdefined( anim.locations[var_0]._id_7A27 ) )
            continue;

        thread _id_2DD3( "Location: " + anim.locations[var_0]._id_7A27, anim.locations[var_0] getorigin(), ( 0, 0, 8 ), ( 1, 1, 1 ) );
    }

    for ( var_0 = 0; var_0 < anim.landmarks.size; var_0++ )
    {
        if ( !isdefined( anim.landmarks[var_0]._id_7A20 ) )
            continue;

        thread _id_2DD3( "Landmark: " + anim.landmarks[var_0]._id_7A20, anim.landmarks[var_0] getorigin(), ( 0, 0, 0 ), ( 1, 1, 1 ) );
        thread _id_2DD2( anim.landmarks[var_0] getorigin(), ( 0, 0, 8 ), ( 1, 1, 0 ) );
    }

    var_1 = getallnodes();

    for ( var_0 = 0; var_0 < var_1.size; var_0++ )
    {
        if ( !isdefined( var_1[var_0]._id_7A27 ) )
            continue;

        anim._id_5F63.origin = var_1[var_0].origin;
        anim._id_5F63.origin += ( 0, 0, 10 );
        var_2 = anim._id_5F63 _id_400A();

        if ( isdefined( var_2 ) )
        {
            thread _id_2DD3( var_1[var_0]._id_7A27 + " @ " + var_2._id_7A27, var_1[var_0].origin, ( 0, 0, 0 ), ( 0, 1, 0 ) );
            continue;
        }

        thread _id_2DD3( var_1[var_0]._id_7A27 + " @ undefined", var_1[var_0].origin, ( 0, 0, 0 ), ( 1, 0, 0 ) );
    }

    var_1 = undefined;
}

_id_2DD3( var_0, var_1, var_2, var_3 )
{
    for (;;)
    {
        if ( distance( level.playercardbackground.origin, var_1 ) > 2048 )
        {
            wait 0.1;
            continue;
        }

        wait 0.05;
    }
}

_id_2DD2( var_0, var_1, var_2 )
{
    for (;;)
    {
        if ( distance( level.playercardbackground.origin, var_0 ) > 2048 )
        {
            wait 0.1;
            continue;
        }

        var_3 = _id_3F5A( level.playercardbackground.origin, var_0 );
        wait 0.05;
    }
}

_id_7451( var_0, var_1 )
{
    var_2 = getaiarray( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( !isalive( var_4 ) )
            continue;

        if ( !isdefined( var_4._id_132D ) )
            continue;

        var_4._id_60DB[var_1] = gettime() + 350;
        var_4._id_8AB0._id_60DB[var_1] = gettime() + 350;
    }
}

_id_3F5D( var_0 )
{
    var_1 = undefined;

    if ( var_0 > 345 || var_0 < 15 )
        var_1 = "12";
    else if ( var_0 < 45 )
        var_1 = "1";
    else if ( var_0 < 75 )
        var_1 = "2";
    else if ( var_0 < 105 )
        var_1 = "3";
    else if ( var_0 < 135 )
        var_1 = "4";
    else if ( var_0 < 165 )
        var_1 = "5";
    else if ( var_0 < 195 )
        var_1 = "6";
    else if ( var_0 < 225 )
        var_1 = "7";
    else if ( var_0 < 255 )
        var_1 = "8";
    else if ( var_0 < 285 )
        var_1 = "9";
    else if ( var_0 < 315 )
        var_1 = "10";
    else
        var_1 = "11";

    return var_1;
}

_id_3F5B( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( var_0 );
    var_4 = vectornormalize( var_3 );
    var_5 = vectortoangles( var_4 );
    var_6 = vectortoangles( var_2 - var_1 );
    var_7 = var_5[1] - var_6[1];
    var_7 += 360;
    var_7 = int( var_7 ) % 360;
    return var_7;
}

_id_40B4( var_0 )
{
    var_1 = var_0.angles;

    if ( !isplayer( var_0 ) )
    {
        var_2 = var_0 _id_133E();

        if ( isdefined( var_2 ) )
            var_1 = var_2.angles;
    }

    return var_1;
}

_id_3CBF()
{
    var_0 = [];

    if ( !isdefined( self ) )
        return var_0;

    var_1 = anim._id_134A;
    var_2 = self getistouchingentities( var_1 );

    if ( !isdefined( var_2 ) )
        return var_0;

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_57FB ) )
            var_0[var_0.size] = var_4;
    }

    return var_0;
}

_id_3F38( var_0 )
{
    var_1 = _id_40DF( var_0, 0 );
    var_2 = common_scripts\utility::_id_3F33( self.origin, var_1 );
    return var_2;
}
