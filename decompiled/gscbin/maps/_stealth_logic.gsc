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

stealth_init()
{
    _id_908E();
    thread _id_9090();
}

_id_9092( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
    {
        level._id_0669._id_5836._id_298E["hidden"]["prone"] = var_0["prone"];
        level._id_0669._id_5836._id_298E["hidden"]["crouch"] = var_0["crouch"];
        level._id_0669._id_5836._id_298E["hidden"]["stand"] = var_0["stand"];
    }

    if ( isdefined( var_1 ) )
    {
        level._id_0669._id_5836._id_298E["alert"]["prone"] = var_1["prone"];
        level._id_0669._id_5836._id_298E["alert"]["crouch"] = var_1["crouch"];
        level._id_0669._id_5836._id_298E["alert"]["stand"] = var_1["stand"];
    }

    if ( isdefined( var_2 ) )
    {
        level._id_0669._id_5836._id_298E["spotted"]["prone"] = var_2["prone"];
        level._id_0669._id_5836._id_298E["spotted"]["crouch"] = var_2["crouch"];
        level._id_0669._id_5836._id_298E["spotted"]["stand"] = var_2["stand"];
    }
}

_id_908A()
{
    var_0 = [];
    var_0["prone"] = 70;
    var_0["crouch"] = 600;
    var_0["stand"] = 1024;
    var_1 = [];
    var_1["prone"] = 140;
    var_1["crouch"] = 900;
    var_1["stand"] = 1500;
    var_2 = [];
    var_2["prone"] = 512;
    var_2["crouch"] = 5000;
    var_2["stand"] = 8000;
    _id_9092( var_0, var_1, var_2 );
}

_id_3A54()
{
    var_0 = [];
    var_0["prone"] = 3;
    var_0["crouch"] = 2;
    var_0["stand"] = 2;
    var_1 = [];
    var_1["prone"] = 2;
    var_1["crouch"] = 2;
    var_1["stand"] = 2;
    var_2 = [];
    var_2["prone"] = 2;
    var_2["crouch"] = 2;
    var_2["stand"] = 2;
    _id_3A7D( var_0, var_1, var_2 );
}

_id_3A7D( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
    {
        self._id_0669._id_5836._id_5F78["hidden"]["prone"] = var_0["prone"];
        self._id_0669._id_5836._id_5F78["hidden"]["crouch"] = var_0["crouch"];
        self._id_0669._id_5836._id_5F78["hidden"]["stand"] = var_0["stand"];
    }

    if ( isdefined( var_1 ) )
    {
        self._id_0669._id_5836._id_5F78["alert"]["prone"] = var_1["prone"];
        self._id_0669._id_5836._id_5F78["alert"]["crouch"] = var_1["crouch"];
        self._id_0669._id_5836._id_5F78["alert"]["stand"] = var_1["stand"];
    }

    if ( isdefined( var_2 ) )
    {
        self._id_0669._id_5836._id_5F78["spotted"]["prone"] = var_2["prone"];
        self._id_0669._id_5836._id_5F78["spotted"]["crouch"] = var_2["crouch"];
        self._id_0669._id_5836._id_5F78["spotted"]["stand"] = var_2["stand"];
    }
}

_id_908E()
{
    common_scripts\utility::_id_383D( "_stealth_hidden" );
    common_scripts\utility::_id_383D( "_stealth_alert" );
    common_scripts\utility::_id_383D( "_stealth_spotted" );
    common_scripts\utility::_id_383D( "_stealth_found_corpse" );
    common_scripts\utility::_id_383F( "_stealth_hidden" );
    level._id_0669 = spawnstruct();
    level._id_0669._id_5836 = spawnstruct();
    level._id_0669._id_5836._id_29A1 = "hidden";
    level._id_0669._id_5836._id_298E = [];
    level._id_0669._id_5836._id_298E["alert"] = [];
    level._id_0669._id_5836._id_298E["hidden"] = [];
    level._id_0669._id_5836._id_298E["spotted"] = [];
    _id_908A();
    level._id_0669._id_5836._id_222C = spawnstruct();
    level._id_0669._id_5836._id_222C._id_0CD8 = [];
    level._id_0669._id_5836._id_222C._id_554A = undefined;
    level._id_0669._id_5836._id_222C.max_num = int( getdvar( "ai_corpseCount" ) );
    level._id_0669._id_5836._id_222C.sight_dist = 1500;
    level._id_0669._id_5836._id_222C.detect_dist = 256;
    level._id_0669._id_5836._id_222C.found_dist = 96;
    level._id_0669._id_5836._id_222C._id_8563 = level._id_0669._id_5836._id_222C.sight_dist * level._id_0669._id_5836._id_222C.sight_dist;
    level._id_0669._id_5836._id_222C._id_298A = level._id_0669._id_5836._id_222C.detect_dist * level._id_0669._id_5836._id_222C.detect_dist;
    level._id_0669._id_5836._id_222C._id_39F3 = level._id_0669._id_5836._id_222C.found_dist * level._id_0669._id_5836._id_222C.found_dist;
    level._id_0669._id_5836._id_222C._id_2232 = [];
    level._id_0669._id_5836._id_222C._id_2232["spotted"] = 10;
    level._id_0669._id_5836._id_222C._id_2232["alert"] = 10;
    level._id_0669._id_5836._id_222C._id_2232["hidden"] = 6;
    level._id_0669._id_5836.ai_event = [];
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["spotted"] = getdvar( "ai_eventDistDeath" );
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["alert"] = 512;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] = 256;
    level._id_0669._id_5836.ai_event["ai_eventDistPain"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistPain"]["spotted"] = getdvar( "ai_eventDistPain" );
    level._id_0669._id_5836.ai_event["ai_eventDistPain"]["alert"] = 384;
    level._id_0669._id_5836.ai_event["ai_eventDistPain"]["hidden"] = 256;
    level._id_0669._id_5836.ai_event["ai_eventDistExplosion"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistExplosion"]["spotted"] = 4000;
    level._id_0669._id_5836.ai_event["ai_eventDistExplosion"]["alert"] = 4000;
    level._id_0669._id_5836.ai_event["ai_eventDistExplosion"]["hidden"] = 4000;
    level._id_0669._id_5836.ai_event["ai_eventDistBullet"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistBullet"]["spotted"] = getdvar( "ai_eventDistBullet" );
    level._id_0669._id_5836.ai_event["ai_eventDistBullet"]["alert"] = 64;
    level._id_0669._id_5836.ai_event["ai_eventDistBullet"]["hidden"] = 64;
    level._id_0669._id_5836.ai_event["ai_eventDistFootstep"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistFootstep"]["spotted"] = getdvar( "ai_eventDistFootstep" );
    level._id_0669._id_5836.ai_event["ai_eventDistFootstep"]["alert"] = 64;
    level._id_0669._id_5836.ai_event["ai_eventDistFootstep"]["hidden"] = 64;
    level._id_0669._id_5836.ai_event["ai_eventDistFootstepWalk"] = [];
    level._id_0669._id_5836.ai_event["ai_eventDistFootstepWalk"]["spotted"] = getdvar( "ai_eventDistFootstepWalk" );
    level._id_0669._id_5836.ai_event["ai_eventDistFootstepWalk"]["alert"] = 32;
    level._id_0669._id_5836.ai_event["ai_eventDistFootstepWalk"]["hidden"] = 32;
    level._id_0669._id_5836.system_state_functions = [];
    level._id_0669._id_5836.system_state_functions["hidden"] = ::system_state_hidden;
    level._id_0669._id_5836.system_state_functions["alert"] = ::system_state_alert;
    level._id_0669._id_5836.system_state_functions["spotted"] = ::_id_9095;
    anim._id_33D9["threat"]["self"] = 20000;
    anim._id_33D9["threat"]["squad"] = 30000;
    _id_908F();
}

_id_908F()
{
    common_scripts\utility::_id_0D13( getentarray( "_stealth_shadow", "targetname" ), ::_id_8E08 );
    common_scripts\utility::_id_0D13( getentarray( "stealth_shadow", "targetname" ), ::_id_8E08 );
}

_id_8E08()
{
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 _id_A5A4::_id_32D8( "_stealth_in_shadow" ) )
            continue;

        var_0 thread _id_8E07( self );
    }
}

_id_9090()
{
    var_0 = level._id_0669._id_5836.system_state_functions;
    thread system_message_handler( "_stealth_hidden", "hidden", var_0["hidden"] );
    thread system_message_handler( "_stealth_alert", "alert", var_0["alert"] );
    thread system_message_handler( "_stealth_spotted", "spotted", var_0["spotted"] );
}

system_message_handler( var_0, var_1, var_2 )
{
    level endon( "_stealth_stop_stealth_logic" );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        _id_908C( var_1 );
        level._id_0669._id_5836._id_29A1 = var_1;
        level notify( "_stealth_detection_level_change" );
        thread [[ var_2 ]]();
        common_scripts\utility::_id_3857( var_0 );
    }
}

_id_908C( var_0 )
{
    var_1 = getarraykeys( level._id_0669._id_5836.ai_event );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        setsaveddvar( var_3, level._id_0669._id_5836.ai_event[var_3][var_0] );
    }
}

_id_9095()
{
    common_scripts\utility::_id_3831( "_stealth_hidden" );
    common_scripts\utility::_id_3831( "_stealth_alert" );
    level endon( "_stealth_detection_level_change" );
    level endon( "_stealth_stop_stealth_logic" );
    waitframe;

    for ( var_0 = getaispeciesarray( "axis", "all" ); var_0.size; var_0 = getaispeciesarray( "axis", "all" ) )
    {
        var_1 = 1;
        var_0 = getaispeciesarray( "axis", "all" );

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( isalive( var_0[var_2].enemy ) )
            {
                var_1 = 0;
                break;
            }
        }

        if ( var_1 )
        {
            wait 1;
            var_0 = getaispeciesarray( "axis", "all" );

            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            {
                if ( isalive( var_0[var_2].enemy ) )
                {
                    var_1 = 0;
                    break;
                }
            }
        }

        if ( var_1 )
            break;

        wait 0.1;
    }

    common_scripts\utility::_id_3831( "_stealth_spotted" );
    common_scripts\utility::_id_383F( "_stealth_alert" );
}

system_state_alert()
{
    common_scripts\utility::_id_3831( "_stealth_hidden" );
    level endon( "_stealth_detection_level_change" );
    level endon( "_stealth_stop_stealth_logic" );
    waitframe;
    var_0 = 15;

    for ( var_1 = 0.1; var_0 > 0; var_0 -= var_1 )
    {
        var_2 = getaispeciesarray( "axis", "all" );

        if ( !var_2.size )
            break;

        wait(var_1);
    }

    common_scripts\utility::_id_3857( "_stealth_found_corpse" );
    common_scripts\utility::_id_3831( "_stealth_spotted" );
    common_scripts\utility::_id_3831( "_stealth_alert" );
    common_scripts\utility::_id_383F( "_stealth_hidden" );
}

system_state_hidden()
{
    level endon( "_stealth_detection_level_change" );
    level endon( "_stealth_stop_stealth_logic" );
}

friendly_logic()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    _id_3A66();
    var_0 = self._id_0669._id_5836._id_24FA;

    if ( isplayer( self ) )
        thread friendly_movespeed_calc_loop();

    for (;;)
    {
        self [[ var_0 ]]();
        self.meleeattackdist = _id_3A4C();
        wait 0.05;
    }
}

_id_3A66()
{
    self._id_0669 = spawnstruct();
    self._id_0669._id_5836 = spawnstruct();

    if ( isplayer( self ) )
    {
        self._id_0669._id_5836._id_40E6 = ::_id_3A5F;
        self._id_0669._id_5836._id_3EF4 = ::_id_3A5C;

        if ( level.console )
            self._id_0669._id_5836._id_4157 = ::_id_3A60;
        else
        {
            self._id_0669._id_5836._id_4157 = ::_id_6B2C;
            self._id_0669._id_5836._id_6BB6 = 0;
        }

        self._id_0669._id_5836._id_24FA = ::_id_3A4E;
    }
    else
    {
        self._id_0669._id_5836._id_40E6 = ::_id_3A5E;
        self._id_0669._id_5836._id_3EF4 = ::_id_3A5B;
        self._id_0669._id_5836._id_4157 = ::_id_3A60;
        self._id_0669._id_5836._id_24FA = ::_id_3A4D;
    }

    self._id_0669._id_5836._id_8AF7 = 0.2;
    self._id_0669._id_5836._id_8AF6 = 0;
    self._id_0669._id_5836._id_63E3 = self [[ self._id_0669._id_5836._id_40E6 ]]();
    self._id_0669._id_5836._id_8AF2 = self [[ self._id_0669._id_5836._id_40E6 ]]();
    self._id_0669._id_5836._id_8A93 = [];
    self._id_0669._id_5836._id_5F76 = [];
    self._id_0669._id_5836._id_5F78 = [];
    self._id_0669._id_5836._id_5F76["hidden"] = [];
    self._id_0669._id_5836._id_5F76["hidden"]["prone"] = 0;
    self._id_0669._id_5836._id_5F76["hidden"]["crouch"] = 0;
    self._id_0669._id_5836._id_5F76["hidden"]["stand"] = 0;
    self._id_0669._id_5836._id_5F76["alert"] = [];
    self._id_0669._id_5836._id_5F76["alert"]["prone"] = 0;
    self._id_0669._id_5836._id_5F76["alert"]["crouch"] = 0;
    self._id_0669._id_5836._id_5F76["alert"]["stand"] = 0;
    self._id_0669._id_5836._id_5F76["spotted"] = [];
    self._id_0669._id_5836._id_5F76["spotted"]["prone"] = 0;
    self._id_0669._id_5836._id_5F76["spotted"]["crouch"] = 0;
    self._id_0669._id_5836._id_5F76["spotted"]["stand"] = 0;
    _id_3A54();
    _id_A5A4::_id_32DD( "_stealth_in_shadow" );
}

_id_3A60()
{
    return length( self getvelocity() );
}

_id_6B2C()
{
    var_0 = length( self getvelocity() );
    var_1 = self._id_0669._id_5836._id_8AF2;
    var_2 = [];
    var_2["stand"] = 30;
    var_2["crouch"] = 15;
    var_2["prone"] = 4;
    var_3 = [];
    var_3["stand"] = 40;
    var_3["crouch"] = 25;
    var_3["prone"] = 10;

    if ( !var_0 )
        self._id_0669._id_5836._id_6BB6 = 0;
    else if ( var_0 > self._id_0669._id_5836._id_6BB6 )
    {
        self._id_0669._id_5836._id_6BB6 += var_2[var_1];

        if ( self._id_0669._id_5836._id_6BB6 > var_0 )
            self._id_0669._id_5836._id_6BB6 = var_0;
    }
    else if ( var_0 < self._id_0669._id_5836._id_6BB6 )
    {
        self._id_0669._id_5836._id_6BB6 -= var_3[var_1];

        if ( self._id_0669._id_5836._id_6BB6 < 0 )
            self._id_0669._id_5836._id_6BB6 = 0;
    }

    return self._id_0669._id_5836._id_6BB6;
}

friendly_movespeed_calc_loop()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    var_0 = self._id_0669._id_5836._id_3EF4;
    var_1 = self._id_0669._id_5836._id_4157;
    var_2 = self [[ var_0 ]]();

    for (;;)
    {
        var_3 = undefined;

        if ( _id_A5A4::_id_32D8( "_stealth_in_shadow" ) )
            var_3 = 0;
        else
        {
            var_4 = self [[ var_1 ]]();
            var_5 = length( var_2 - self [[ var_0 ]]() );

            if ( var_5 > 30 )
                var_5 = 30;

            var_3 = var_4 + var_5;
        }

        self._id_0669._id_5836._id_5F76["hidden"]["prone"] = var_3 * self._id_0669._id_5836._id_5F78["hidden"]["prone"];
        self._id_0669._id_5836._id_5F76["spotted"]["prone"] = var_3 * self._id_0669._id_5836._id_5F78["spotted"]["prone"];
        self._id_0669._id_5836._id_5F76["alert"]["prone"] = var_3 * self._id_0669._id_5836._id_5F78["alert"]["prone"];
        self._id_0669._id_5836._id_5F76["hidden"]["crouch"] = var_3 * self._id_0669._id_5836._id_5F78["hidden"]["crouch"];
        self._id_0669._id_5836._id_5F76["spotted"]["crouch"] = var_3 * self._id_0669._id_5836._id_5F78["spotted"]["crouch"];
        self._id_0669._id_5836._id_5F76["alert"]["crouch"] = var_3 * self._id_0669._id_5836._id_5F78["alert"]["crouch"];
        self._id_0669._id_5836._id_5F76["hidden"]["stand"] = var_3 * self._id_0669._id_5836._id_5F78["hidden"]["stand"];
        self._id_0669._id_5836._id_5F76["spotted"]["stand"] = var_3 * self._id_0669._id_5836._id_5F78["spotted"]["stand"];
        self._id_0669._id_5836._id_5F76["alert"]["stand"] = var_3 * self._id_0669._id_5836._id_5F78["alert"]["stand"];
        var_2 = self [[ var_0 ]]();
        wait 0.1;
    }
}

_id_3A4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_0669._id_5836._id_8AF2;

    var_1 = level._id_0669._id_5836._id_29A1;
    var_2 = level._id_0669._id_5836._id_298E[var_1][var_0];

    if ( _id_A5A4::_id_32D8( "_stealth_in_shadow" ) )
    {
        var_2 *= 0.5;

        if ( var_2 < level._id_0669._id_5836._id_298E["hidden"]["prone"] )
            var_2 = level._id_0669._id_5836._id_298E["hidden"]["prone"];
    }

    var_3 = self._id_0669._id_5836._id_5F76[var_1][var_0];

    if ( isdefined( self._id_066A ) && var_3 > self._id_066A )
        var_3 = self._id_066A;

    return var_2 + var_3;
}

_id_3A5E()
{
    return self.a._id_6E5A;
}

_id_3A5F()
{
    return level.playercardbackground getstance();
}

_id_3A5B()
{
    return self.angles;
}

_id_3A5C()
{
    return self getplayerangles();
}

_id_3A4D()
{
    self._id_0669._id_5836._id_8AF2 = self [[ self._id_0669._id_5836._id_40E6 ]]();
    self._id_0669._id_5836._id_63E3 = self._id_0669._id_5836._id_8AF2;
}

_id_3A4E()
{
    var_0 = self [[ self._id_0669._id_5836._id_40E6 ]]();

    if ( !self._id_0669._id_5836._id_8AF6 )
    {
        switch ( var_0 )
        {
            case "prone":
                if ( self._id_0669._id_5836._id_63E3 != "prone" )
                    self._id_0669._id_5836._id_8AF6 = self._id_0669._id_5836._id_8AF7;

                break;
            case "crouch":
                if ( self._id_0669._id_5836._id_63E3 == "stand" )
                    self._id_0669._id_5836._id_8AF6 = self._id_0669._id_5836._id_8AF7;

                break;
        }
    }

    if ( self._id_0669._id_5836._id_8AF6 )
    {
        self._id_0669._id_5836._id_8AF2 = self._id_0669._id_5836._id_63E3;

        if ( self._id_0669._id_5836._id_8AF6 > 0.05 )
            self._id_0669._id_5836._id_8AF6 -= 0.05;
        else
        {
            self._id_0669._id_5836._id_8AF6 = 0;
            self._id_0669._id_5836._id_8AF2 = var_0;
            self._id_0669._id_5836._id_63E3 = var_0;
        }
    }
    else
    {
        self._id_0669._id_5836._id_8AF2 = var_0;
        self._id_0669._id_5836._id_63E3 = var_0;
    }
}

enemy_logic()
{
    _id_324F();
    thread _id_328C();
    thread _id_3210();
}

_id_324F()
{
    self _meth_816a();
    self._id_0669 = spawnstruct();
    self._id_0669._id_5836 = spawnstruct();
    self._id_0669._id_5836.dog = 0;

    if ( issubstr( self.classname, "dog" ) )
        self._id_0669._id_5836.dog = 1;

    self._id_0669._id_5836._id_09C4 = spawnstruct();
    self._id_0669._id_5836._id_09C4.lvl = undefined;
    self._id_0669._id_5836._id_09C4.enemy = undefined;
    self._id_0669._id_5836.stoptime = 0;
    self._id_0669._id_5836._id_222C = spawnstruct();
    self._id_0669._id_5836._id_222C._id_2231 = undefined;
    _id_A5A4::_id_32DD( "_stealth_saw_corpse" );
    _id_A5A4::_id_32DD( "_stealth_found_corpse" );
    _id_322E();
    _id_A5A4::_id_32DD( "_stealth_in_shadow" );
}

_id_322E()
{
    _id_A5A4::_id_32DD( "_stealth_bad_event_listener" );
    self._id_0669._id_5836._id_33C0 = spawnstruct();
    self._id_0669._id_5836._id_33C0.listener = [];
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "grenade danger";
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "gunshot";
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "bulletwhizby";
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "silenced_shot";
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "projectile_impact";

    for ( var_0 = 0; var_0 < self._id_0669._id_5836._id_33C0.listener.size; var_0++ )
        self addaieventlistener( self._id_0669._id_5836._id_33C0.listener[var_0] );

    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "explode";
    self._id_0669._id_5836._id_33C0.listener[self._id_0669._id_5836._id_33C0.listener.size] = "doFlashBanged";

    for ( var_0 = 0; var_0 < self._id_0669._id_5836._id_33C0.listener.size; var_0++ )
        thread _id_322F( self._id_0669._id_5836._id_33C0.listener[var_0] );

    thread _id_322C( "damage", "ai_eventDistPain" );
    thread _id_322C( "death", "ai_eventDistDeath" );
    thread _id_3230();
    self._id_0669._id_5836._id_33C0.awareness = [];
    thread _id_3228( "reset" );
    thread _id_3228( "alerted_once" );
    thread _id_3228( "alerted_again" );
    thread _id_3228( "attack" );
    thread _id_3228( "heard_scream" );
    thread _id_3228( "heard_corpse" );
    thread _id_3228( "saw_corpse" );
    thread _id_3228( "found_corpse" );
    thread _id_3228( "explode" );
    thread _id_3228( "doFlashBanged" );
    thread _id_3228( "bulletwhizby" );
    thread _id_3228( "projectile_impact" );
}

_id_322F( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );

    for (;;)
    {
        self waittill( var_0 );
        _id_A5A4::_id_32DE( "_stealth_bad_event_listener" );
    }
}

_id_3230()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );

    for (;;)
    {
        _id_A5A4::_id_32E0( "_stealth_bad_event_listener" );
        wait 0.65;
        _id_A5A4::_id_32DA( "_stealth_bad_event_listener" );
    }
}

_id_3228( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    self._id_0669._id_5836._id_33C0.awareness[var_0] = 1;
    var_1 = undefined;

    for (;;)
    {
        self waittill( var_0, var_2, var_3 );

        if ( !self._id_0669._id_5836.dog )
        {
            if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) && ( isdefined( self.enemy ) || isdefined( self.favoriteenemy ) ) )
                continue;
        }

        switch ( var_0 )
        {
            case "projectile_impact":
                var_1 = var_3;
                break;
            default:
                var_1 = var_2;
                break;
        }

        self._id_0669._id_5836._id_33C0.awareness[var_0] = var_1;
        self notify( "event_awareness", var_0 );
        level notify( "event_awareness", var_0 );
        waitframe;

        if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) && var_0 != "alerted_once" )
            common_scripts\utility::_id_383F( "_stealth_alert" );
    }
}

_id_322C( var_0, var_1 )
{
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    var_2 = undefined;
    var_3 = self.team;

    for (;;)
    {
        if ( !isalive( self ) )
            return;

        self waittill( var_0, var_4, var_5 );

        switch ( var_0 )
        {
            case "death":
                var_2 = var_4;
                break;
            case "damage":
                var_2 = var_5;
                break;
        }

        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2 == level.playercardbackground || isdefined( var_2.team ) && var_2.team != var_3 )
            break;
    }

    if ( !isdefined( self ) )
        return;

    var_6 = getaispeciesarray( "axis", "all" );
    var_7 = int( level._id_0669._id_5836.ai_event[var_1][level._id_0669._id_5836._id_29A1] );

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        if ( !isalive( var_6[var_8] ) )
            continue;

        if ( !isdefined( var_6[var_8]._id_0669 ) )
            continue;

        if ( distance( var_6[var_8].origin, self.origin ) > var_7 )
            continue;

        var_6[var_8] _id_A5A4::_id_32DE( "_stealth_bad_event_listener" );
    }
}

_id_328C()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );

    for (;;)
    {
        self waittill( "enemy" );

        if ( !isalive( self.enemy ) )
            continue;

        if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) && !self._id_0669._id_5836.dog )
        {
            if ( !_id_31DC( self.enemy ) )
                continue;
        }
        else
            _id_31D8( "attack", self.enemy );

        thread _id_3291();
        wait 20;

        while ( isdefined( self.enemy ) )
        {
            if ( distance( self.origin, self.enemy.origin ) > self.meleeattackdist )
                self _meth_816a();

            wait 0.25;
        }

        _id_31D8( "reset", undefined );
    }
}

_id_3291()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    level thread enemy_threat_being_spotted_clear();
    thread enemy_threat_being_spotted_clear();
    common_scripts\utility::_id_383F( "being_spotted" );
    wait(randomfloatrange( 0.25, 0.5 ));
    common_scripts\utility::_id_383F( "_stealth_spotted" );
    common_scripts\utility::_id_3831( "being_spotted" );
}

enemy_threat_being_spotted_clear()
{
    common_scripts\utility::_id_A069( "_stealth_stop_stealth_logic", "death", "pain_death" );
    common_scripts\utility::_id_3831( "being_spotted" );
}

_id_31DC( var_0 )
{
    if ( !isdefined( var_0._id_0669 ) )
        return 1;

    if ( !isdefined( var_0._id_0669._id_5836._id_8A93[self._id_0908] ) )
        var_0._id_0669._id_5836._id_8A93[self._id_0908] = 0;

    if ( !self._id_0669._id_5836.stoptime )
        var_0._id_0669._id_5836._id_8A93[self._id_0908]++;

    if ( _id_A5A4::_id_32D8( "_stealth_bad_event_listener" ) || var_0._id_0669._id_5836._id_8A93[self._id_0908] > 2 )
    {
        _id_31D8( "attack", var_0 );
        return 1;
    }

    self _meth_816a();

    if ( self._id_0669._id_5836.stoptime )
        return 0;

    switch ( var_0._id_0669._id_5836._id_8A93[self._id_0908] )
    {
        case 1:
            _id_31D8( "alerted_once", var_0 );
            break;
        case 2:
            _id_31D8( "alerted_again", var_0 );
            break;
    }

    thread _id_31DB( var_0 );
    thread _id_31E1( var_0 );
    return 0;
}

_id_31DB( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    wait 60;
    var_0._id_0669._id_5836._id_8A93[self._id_0908]--;
}

_id_31E1( var_0 )
{
    self endon( "death" );
    var_1 = distance( self.origin, var_0.origin ) * 0.0005;
    self._id_0669._id_5836.stoptime = 0.25 + var_1;
    common_scripts\utility::_id_3856( "_stealth_spotted", self._id_0669._id_5836.stoptime );
    self._id_0669._id_5836.stoptime = 0;
}

_id_31D8( var_0, var_1 )
{
    level notify( "_stealth_enemy_alert_level_change" );
    self notify( "_stealth_enemy_alert_level_change" );
    self notify( var_0, var_1 );
    self._id_0669._id_5836._id_09C4.lvl = var_0;
    self._id_0669._id_5836._id_09C4.enemy = var_1;
}

_id_3210()
{
    thread enemy_corpse_death();

    if ( self._id_0669._id_5836.dog )
        return;

    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    thread _id_320E();

    for (;;)
    {
        while ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        {
            var_0 = 0;
            var_1 = 0;
            var_2 = undefined;

            for ( var_3 = 0; var_3 < level._id_0669._id_5836._id_222C._id_0CD8.size; var_3++ )
            {
                var_2 = level._id_0669._id_5836._id_222C._id_0CD8[var_3];
                var_4 = distancesquared( self.origin, var_2.origin );

                if ( var_4 < level._id_0669._id_5836._id_222C._id_39F3 )
                {
                    var_0 = 1;
                    break;
                }

                if ( isdefined( self._id_0669._id_5836._id_222C._id_2231 ) )
                {
                    if ( self._id_0669._id_5836._id_222C._id_2231 == var_2 )
                        continue;

                    var_5 = distancesquared( self.origin, self._id_0669._id_5836._id_222C._id_2231.origin );

                    if ( var_5 <= var_4 )
                        continue;
                }

                if ( var_4 > level._id_0669._id_5836._id_222C._id_8563 )
                    continue;

                if ( var_4 < level._id_0669._id_5836._id_222C._id_298A )
                {
                    if ( self _meth_81c2( var_2 ) )
                    {
                        var_1 = 1;
                        break;
                    }
                }

                var_6 = self gettagangles( "tag_eye" );
                var_7 = self gettagorigin( "tag_eye" );
                var_8 = anglestoforward( var_6 );
                var_9 = vectornormalize( var_2.origin - var_7 );

                if ( vectordot( var_8, var_9 ) > 0.55 )
                {
                    if ( self _meth_81c2( var_2 ) )
                    {
                        var_1 = 1;
                        break;
                    }
                }
            }

            if ( var_0 )
            {
                if ( !_id_A5A4::_id_32D8( "_stealth_found_corpse" ) )
                    _id_A5A4::_id_32DE( "_stealth_found_corpse" );
                else
                    self notify( "_stealth_found_corpse" );

                _id_A5A4::_id_32DA( "_stealth_saw_corpse" );
                thread _id_320C( var_2 );
                self notify( "found_corpse", var_2 );
            }
            else if ( var_1 )
            {
                self._id_0669._id_5836._id_222C._id_2231 = var_2;

                if ( !_id_A5A4::_id_32D8( "_stealth_saw_corpse" ) )
                    _id_A5A4::_id_32DE( "_stealth_saw_corpse" );
                else
                    self notify( "_stealth_saw_corpse" );

                level notify( "_stealth_saw_corpse" );
                self notify( "saw_corpse", var_2 );
            }

            wait 0.05;
        }

        common_scripts\utility::_id_3857( "_stealth_spotted" );
    }
}

enemy_corpse_death()
{
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_corpse_logic" );
    var_0 = self._id_0908;
    self waittill( "death" );

    if ( !isdefined( self.origin ) )
        return;

    var_1 = level._id_0669._id_5836._id_222C._id_2232[level._id_0669._id_5836._id_29A1];
    var_2 = ( 0, 0, var_1 );
    var_3 = spawn( "script_origin", self.origin + var_2 );
    var_3.teambalanced = "corpse";
    var_3._id_0908 = var_0;
    var_3.script_parentname = var_3.teambalanced + "_" + var_3._id_0908;
    var_3 endon( "death" );

    while ( isdefined( self.origin ) )
    {
        var_3.origin = self.origin + var_2;
        wait 0.01;
    }

    if ( level.cheatstates["sf_use_tire_explosion"] )
        wait 0.25;

    var_3 enemy_corpse_add_to_stack();
}

enemy_corpse_add_to_stack()
{
    if ( level._id_0669._id_5836._id_222C._id_0CD8.size == level._id_0669._id_5836._id_222C.max_num )
        enemy_corpse_shorten_stack();

    level._id_0669._id_5836._id_222C._id_0CD8[level._id_0669._id_5836._id_222C._id_0CD8.size] = self;
}

enemy_corpse_shorten_stack()
{
    var_0 = [];
    var_1 = level._id_0669._id_5836._id_222C._id_0CD8;
    var_2 = level._id_0669._id_5836._id_222C._id_0CD8[0];

    for ( var_3 = 1; var_3 < level._id_0669._id_5836._id_222C.max_num; var_3++ )
        var_0[var_0.size] = var_1[var_3];

    level._id_0669._id_5836._id_222C._id_0CD8 = var_0;
    var_2 delete();
}

_id_320C( var_0 )
{
    level._id_0669._id_5836._id_222C._id_554A = var_0.origin;
    level._id_0669._id_5836._id_222C._id_0CD8 = common_scripts\utility::_id_0CF6( level._id_0669._id_5836._id_222C._id_0CD8, var_0 );

    if ( isdefined( self.no_corpse_announce ) )
    {
        level notify( "_stealth_no_corpse_announce" );
        self notify( "event_awareness", "found_corpse" );
        return;
    }

    wait(randomfloatrange( 0.25, 0.5 ));

    if ( !common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
        common_scripts\utility::_id_383F( "_stealth_found_corpse" );
    else
        level notify( "_stealth_found_corpse" );

    thread _id_320B();
}

_id_320E()
{
    self endon( "death" );
    self endon( "pain_death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );

    for (;;)
    {
        level waittill( "_stealth_found_corpse" );

        if ( !common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
            continue;

        _id_320A();
    }
}

_id_320A()
{
    var_0 = undefined;

    if ( isdefined( self.enemy ) )
        var_0 = self.enemy;
    else
        var_0 = level.playercardbackground;

    if ( !isdefined( var_0._id_0669._id_5836._id_8A93[self._id_0908] ) )
        var_0._id_0669._id_5836._id_8A93[self._id_0908] = 0;

    switch ( var_0._id_0669._id_5836._id_8A93[self._id_0908] )
    {
        case 0:
            var_0._id_0669._id_5836._id_8A93[self._id_0908]++;
            thread _id_31DB( var_0 );
            break;
        case 1:
            var_0._id_0669._id_5836._id_8A93[self._id_0908]++;
            thread _id_31DB( var_0 );
            break;
        case 2:
            var_0._id_0669._id_5836._id_8A93[self._id_0908]++;
            thread _id_31DB( var_0 );
            break;
    }

    common_scripts\utility::_id_383F( "_stealth_alert" );
}

_id_320B()
{
    level endon( "_stealth_found_corpse" );
    level endon( "_stealth_stop_stealth_logic" );
    _id_A5A4::_id_A07F( getaiarray( "axis" ), undefined, 90 );
    common_scripts\utility::_id_3831( "_stealth_found_corpse" );
}

_id_8E07( var_0 )
{
    self endon( "death" );
    level endon( "_stealth_stop_stealth_logic" );
    self endon( "_stealth_stop_stealth_logic" );
    _id_A5A4::_id_32DE( "_stealth_in_shadow" );

    while ( self istouching( var_0 ) )
        wait 0.05;

    _id_A5A4::_id_32DA( "_stealth_in_shadow" );
}

stealth_ai( var_0, var_1, var_2, var_3 )
{
    stealth_ai_logic();
    stealth_ai_behavior( var_0, var_1, var_2, var_3 );
}

stealth_ai_logic()
{
    switch ( self.team )
    {
        case "allies":
            thread friendly_logic();
            break;
        case "axis":
            thread enemy_logic();
            break;
    }
}

stealth_ai_behavior( var_0, var_1, var_2, var_3 )
{
    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "allies":
            thread maps\_stealth_behavior::friendly_logic( var_0 );
            break;
        case "axis":
            thread maps\_stealth_behavior::enemy_logic( var_0, var_1, var_2, var_3 );
            break;
    }
}

_id_8DCC()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );
    self endon( "_stealth_enemy_alert_level_change" );
    waitframe;

    if ( _id_A5A4::_id_32D8( "_stealth_saw_corpse" ) )
        return;

    self endon( "_stealth_saw_corpse" );
    self waittill( "event_awareness", var_0 );
}

_id_8DCA()
{
    _id_8DCC();
    waitframe;
    self notify( "stealth_enemy_endon_alert" );
}

_id_8DB9( var_0, var_1, var_2 )
{
    _id_9092( var_0, var_1, var_2 );
}

_id_8DB8()
{
    _id_908A();
}

_id_8DD9( var_0, var_1, var_2 )
{
    _id_3A7D( var_0, var_1, var_2 );
}

_id_8DD8()
{
    _id_3A54();
}

_id_8DDB( var_0, var_1 )
{
    maps\_stealth_behavior::_id_3A7E( var_0, var_1 );
}

_id_8DDA()
{
    maps\_stealth_behavior::_id_3A55();
}

stealth_ai_state_functions_set( var_0 )
{
    switch ( self.team )
    {
        case "allies":
            maps\_stealth_behavior::ai_change_ai_functions( "state", var_0 );
        case "axis":
            maps\_stealth_behavior::ai_change_ai_functions( "state", var_0 );
    }
}

stealth_ai_state_functions_default()
{
    switch ( self.team )
    {
        case "allies":
            maps\_stealth_behavior::friendly_default_ai_functions( "state" );
        case "axis":
            maps\_stealth_behavior::enemy_default_ai_functions( "state" );
    }
}

stealth_ai_alert_functions_set( var_0 )
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::ai_change_ai_functions( "alert", var_0 );
}

stealth_ai_alert_functions_default()
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::enemy_default_ai_functions( "alert" );
}

stealth_ai_corpse_functions_set( var_0 )
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::ai_change_ai_functions( "corpse", var_0 );
}

stealth_ai_corpse_functions_default()
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::enemy_default_ai_functions( "corpse" );
}

stealth_ai_awareness_functions_set( var_0 )
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::ai_change_ai_functions( "awareness", var_0 );
}

stealth_ai_awareness_functions_default()
{
    if ( self.team == "allies" )
        return;

    maps\_stealth_behavior::enemy_default_ai_functions( "awareness" );
}

_id_8D85()
{
    maps\_stealth_behavior::_id_08C7();
}

_id_8D86()
{
    maps\_stealth_behavior::_id_08C6();
}

_id_8D89( var_0, var_1, var_2, var_3 )
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    var_4 = "stop_loop";
    var_0.allowdeath = 1;
    var_0 _id_8DED();
    thread _id_A510::_id_0BCE( var_0, var_1, var_3, var_4 );
    var_0 maps\_stealth_behavior::_id_0910( self, var_2, var_3, var_4 );
}

_id_8D8D( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 _id_8DED();
    thread _id_8D8E( var_0, var_1, var_2, var_3, var_4 );
}

_id_8D8E( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 thread _id_8DCA();
    var_0 endon( "stealth_enemy_endon_alert" );
    var_0 endon( "death" );
    var_0 _id_8DED();
    _id_A510::_id_0BD0( var_0, var_1, var_4 );
    _id_8D89( var_0, var_2, var_3, var_4 );
}

_id_8D8B( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 _id_8DED();
    thread _id_8D8C( var_0, var_1, var_2, var_3, var_4 );
}

_id_8D8C( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 thread _id_8DCA();
    var_0 endon( "stealth_enemy_endon_alert" );
    var_0 endon( "death" );
    var_0 _id_8DED();
    _id_A510::_id_0BD1( var_0, var_1, var_4 );
    _id_8D89( var_0, var_2, var_3, var_4 );
}

_id_8DED()
{
    if ( isdefined( self._id_0669 ) )
        return;

    thread stealth_ai();
}
