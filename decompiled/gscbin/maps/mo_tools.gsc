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

wait_timeout( var_0, var_1 )
{
    self endon( "wait timed out" );
    thread wait_timeout2( var_0, var_1 );
    self waittill( "msg" );
}

wait_timeout2( var_0, var_1 )
{
    self endon( "msg" );
    wait(var_1);
    self notify( "wait timed out" );
}

get_ai( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "allies";

    if ( !isdefined( var_2 ) )
        var_2 = "targetname";

    var_3 = getaiarray( var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        switch ( var_2 )
        {
            case "targetname":
                if ( isdefined( var_3[var_5].teambalanced ) && var_3[var_5].teambalanced == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
            case "script_noteworthy":
                if ( isdefined( var_3[var_5].script_parentname ) && var_3[var_5].script_parentname == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
            case "script_forcecolor":
                if ( var_3[var_5] maps\_utility::_id_1CC0( var_0 ) )
                    var_4[var_4.size] = var_3[var_5];

                continue;
        }
    }

    return var_4;
}

get_closest( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = distancesquared( var_1[0].origin, var_0 );
    var_4 = var_1[0];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = distancesquared( var_1[var_5].origin, var_0 );

        if ( var_6 >= var_3 )
            continue;

        var_3 = var_6;
        var_4 = var_1[var_5];
    }

    if ( isdefined( var_2 ) && distance( var_0, var_4.origin ) > var_2 )
        var_4 = undefined;

    return var_4;
}

get_closest_fx( var_0, var_1, var_2 )
{

}

get_closest_ent( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = distancesquared( var_1[0] getorigin(), var_0 );
    var_4 = var_1[0];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = distancesquared( var_1[var_5] getorigin(), var_0 );

        if ( var_6 >= var_3 )
            continue;

        var_3 = var_6;
        var_4 = var_1[var_5];
    }

    if ( isdefined( var_2 ) && distance( var_0, var_4 getorigin() ) > var_2 )
        var_4 = undefined;

    return var_4;
}

get_ents_within_dist( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = distance( var_1[var_4] getorigin(), var_0 );

        if ( var_5 > var_2 )
            continue;

        var_3[var_3.size] = var_1[var_4];
    }

    return var_3;
}

_id_2D41( var_0, var_1, var_2, var_3 )
{
    var_1.ignoretriggers = 1;
    var_1._id_63DF = var_1.goalradius;
    var_1.goalradius = 16;
    var_4 = 0;
    var_5 = 0;

    if ( isdefined( var_1._id_7E3E ) )
        var_4 = 1;

    if ( isdefined( var_1._id_58D7 ) )
        var_5 = 1;

    if ( !var_4 )
        var_1 maps\_utility::_id_7E3F();

    if ( !var_5 )
        var_1 thread maps\_utility::_id_58D7();

    if ( var_3 == "kick" )
    {
        var_6 = anglestoforward( var_0.angles );
        var_6 = maps\_utility::vector_multiply( var_6, 20 );
        var_7 = spawn( "script_origin", var_0.origin + var_6 );
        var_7.angles = var_0.angles;
        var_0 = var_7;
    }

    var_1._id_63C4 = var_1._id_0C72;
    var_1._id_0C72 = "guy";

    if ( var_3 == "kick" )
        var_0 maps\_anim::_id_0BFF( var_1, var_3 );
    else
    {
        var_1 _meth_81a9( var_0 );
        var_1 waittill( "goal" );
    }

    var_0 thread maps\_anim::_id_0C24( var_1, var_3 );
    var_1 waittillmatch( "single anim", "kick" );
    common_scripts\utility::_id_0D13( var_2, ::door_breach_door );

    if ( var_3 == "kick" )
    {
        wait 0.2;
        var_1 _meth_8143();
    }
    else
        var_1 waittillmatch( "single anim", "end" );

    var_1._id_0C72 = var_1._id_63C4;
    var_1.goalradius = var_1._id_63DF;
    var_1.ignoretriggers = 0;

    if ( !var_4 )
        var_1 maps\_utility::_id_9A61();

    if ( !var_5 )
        var_1 maps\_utility::_id_8EA4();
}

door_breach_door()
{
    self notsolid();

    if ( self.specialgrenade & 1 )
        self connectpaths();

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    switch ( self._id_7A99 )
    {
        case "left":
            var_1 = randomfloatrange( 88, 92 );
            break;
        case "right":
            var_1 = -1 * randomfloatrange( 88, 92 );
            break;
        case "xleft":
            var_2 = 90;
            break;
        case "xright":
            var_2 = -90;
            break;
        case "yleft":
            var_0 = 90;
            break;
        case "yright":
            var_0 = -90;
            break;
    }

    var_3 = 0.4;
    var_4 = self.angles + ( var_0, var_1, var_2 );
    self rotateto( var_4, var_3, 0.05, 0.05 );
    wait(var_3);
    self solid();
    self disconnectpaths();
}

floodspawner_switch( var_0, var_1 )
{
    var_2 = var_0.size;

    if ( var_0.size > var_1.size )
        var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        var_0[var_3] thread spawner_switch_think( var_1[var_3] );

    if ( var_3 < var_1.size )
    {
        for ( var_4 = var_3; var_4 < var_1.size; var_4++ )
            var_1[var_4] thread spawner_switch_think2();
    }
}

spawner_switch_think( var_0 )
{
    var_0 endon( "death" );
    var_0.floodspawncount--;
    self waittill( "death" );
    var_0 thread spawner_switch_think2();
}

spawner_switch_think2()
{
    self endon( "death" );
    self.count = 1;

    if ( !maps\_utility::_id_7B20() )
        wait(randomfloatrange( 2, 4 ));

    for (;;)
    {
        var_0 = self dospawn();

        if ( !maps\_utility::_id_88F1( var_0 ) )
            break;

        wait 0.2;
    }
}
#using_animtree("fastrope");

player_fastrope_go( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "fastrope_arms" );
    var_1.angles = var_0.angles;
    var_2 = spawn( "script_origin", var_0.origin );
    var_2.angles = level.playercardbackground.angles;
    var_1 linkto( var_2 );
    var_1._id_0C72 = "playerfastrope";
    var_1 useanimtree( #animtree );
    level.playercardbackground allowlean( 0 );
    level.playercardbackground freezecontrols( 1 );
    level.playercardbackground playerlinktoabsolute( var_1, "tag_player" );
    playerweapontake();
    var_2 maps\_anim::_id_0C24( var_1, "fastrope_on" );
    var_2 movez( ( var_0._id_7131 + 96 ) * -1, var_0.titleunlocked + 0.5 );
    var_2 thread maps\_anim::_id_0BE1( var_1, "fastrope_loop", undefined, "stopanimscripted" );
    wait(var_0.titleunlocked);
    var_2 notify( "stopanimscripted" );
    level.playercardbackground maps\_anim::_id_0C24( var_1, "fastrope_off" );
    playerweapongive();
    level.playercardbackground unlink();
    level.playercardbackground freezecontrols( 0 );
    level.playercardbackground allowlean( 1 );
    var_2 delete();
    var_1 delete();
}

ai_clear_dialog( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level.ai_clear_dialog_last ) )
        level.ai_clear_dialog_last = 0;

    var_5 = getaiarray( "axis" );
    ai_clear_dialog_logic( var_5, var_0, var_1, var_2, var_3, var_4 );
}

ai_clear_dialog_logic_guy( var_0 )
{
    self waittill( "death" );
    var_0.count--;
    var_0 notify( "ai_death" );
}

ai_clear_dialog_logic_check()
{
    self endon( "death" );
    self._id_71D4 = 0;

    while ( self.count )
        self waittill( "ai_death" );

    self._id_71D4 = 1;
    self notify( "ready" );
}

ai_clear_dialog_logic( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_2 ) )
        var_2 endon( var_3 );

    var_6 = spawnstruct();
    var_6._id_71D4 = 1;

    if ( isdefined( var_1 ) )
    {
        var_6.count = var_1.size;
        var_6 thread ai_clear_dialog_logic_check();
        common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::ai_clear_dialog_logic_guy, var_6 );
    }

    maps\_utility::_id_A07E( var_0 );

    if ( !var_6._id_71D4 )
        var_6 waittill( "ready" );

    var_6 notify( "death" );

    if ( isdefined( var_4 ) )
    {
        wait 0.5;

        if ( var_4 == level.playercardbackground )
            thread radio_msg_stack( var_5 );
        else
            var_4 thread maps\_utility::_id_69C4( var_5 );
    }
    else
    {
        var_7 = getaiarray( "allies" );
        var_8 = [];
        var_9 = maps\_utility::_id_3CFA( level.playercardbackground.origin, var_7, 1024 );

        if ( !isdefined( var_9 ) )
        {
            level notify( "ai_clear_dialog_done" );
            return;
        }

        var_10 = 2;

        for ( var_11 = level.ai_clear_dialog_last; var_11 == level.ai_clear_dialog_last; var_11 = randomint( var_10 ) )
        {

        }

        level.ai_clear_dialog_last = var_11;
        wait 0.5;

        switch ( var_11 )
        {
            case 0:
                var_9 thread maps\_utility::_id_69C4( level.level_name + "_gm2_clear" );
                break;
            case 1:
                var_9 thread maps\_utility::_id_69C4( level.level_name + "_gm3_clear" );
                break;
        }
    }

    level notify( "ai_clear_dialog_done" );
}

playerweapongive()
{
    level.playercardbackground notify( "restore_player_weapons" );
}

playerweapontake()
{
    thread playerweapontakelogic();
}

playerweapontakelogic()
{
    if ( isdefined( level.playercardbackground.weaponstaken ) )
        return;

    level.playercardbackground.weaponstaken = 1;
    level.playercardbackground disableweapons();
    level.playercardbackground waittill( "restore_player_weapons" );
    level.playercardbackground enableweapons();
    level.playercardbackground.weaponstaken = undefined;
}

anim_single_stack( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2 thread anim_single_stack_proc( var_0, var_1 );
    var_2 waittill( "anim_single_done" );
}

anim_single_stack_proc( var_0, var_1 )
{
    if ( !isdefined( level.anim_stack ) )
        level.anim_stack = [];

    var_2 = "" + var_0._id_0908 + var_1;
    level.anim_stack[level.anim_stack.size] = var_2;

    while ( level.anim_stack[0] != var_2 )
        level waittill( "level_anim_stack_ready" );

    maps\_anim::_id_0C24( var_0, var_1 );
    level.anim_stack = common_scripts\utility::_id_0CF6( level.anim_stack, var_2 );
    level notify( "level_anim_stack_ready" );
    self notify( "anim_single_done" );
}

radio_msg_stack( var_0 )
{
    var_1 = spawnstruct();
    var_1 thread radio_msg_stack_proc( var_0 );
    var_1 waittill( "radio_dialogue_done" );
}

radio_msg_stack_proc( var_0 )
{
    if ( !isdefined( level.radio_stack ) )
        level.radio_stack = [];

    level.radio_stack[level.radio_stack.size] = var_0;

    while ( level.radio_stack[0] != var_0 )
        level waittill( "level_radio_stack_ready" );

    maps\_utility::_id_70BD( var_0 );
    level.radio_stack = common_scripts\utility::_id_0CF6( level.radio_stack, var_0 );
    level notify( "level_radio_stack_ready" );
    self notify( "radio_dialogue_done" );
}

disable_cqbwalk_ign_demo_wrapper()
{
    maps\_utility::_id_2A8D();

    if ( !isdefined( self.a.cqbchangedontmodifyinterval ) || !self.a.cqbchangedontmodifyinterval )
        self.invisible = 96;
}

enable_cqbwalk_ign_demo_wrapper()
{
    maps\_utility::_id_30B0();

    if ( !isdefined( self.a.cqbchangedontmodifyinterval ) || !self.a.cqbchangedontmodifyinterval )
        self.invisible = 50;
}
