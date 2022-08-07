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

_id_19EE()
{
    level._id_4A38 = 0;

    if ( level.gameended )
        return;

    var_0 = getmatchdata( "hostMigrationCount" );
    var_0++;
    setmatchdata( "hostMigrationCount", var_0 );

    foreach ( var_2 in level.characters )
        var_2._id_4A36 = 0;

    level._id_4A39 = 1;
    setdvar( "ui_inhostmigration", 1 );
    level notify( "host_migration_begin" );
    maps\mp\gametypes\_gamelogic::_id_9B8C();

    foreach ( var_2 in level.characters )
    {
        var_2 thread _id_4A3A();

        if ( isplayer( var_2 ) )
            var_2 setclientomnvar( "ui_session_state", var_2.sharpturnlookaheaddist );
    }

    setdvar( "ui_game_state", game["state"] );
    level endon( "host_migration_begin" );
    _id_4A3C();
    level._id_4A39 = undefined;
    setdvar( "ui_inhostmigration", 0 );
    level notify( "host_migration_end" );
    maps\mp\gametypes\_gamelogic::_id_9B8C();
    level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_4A3C()
{
    level endon( "game_ended" );
    level.ingraceperiod = 25;
    thread maps\mp\gametypes\_gamelogic::_id_59ED( 20.0 );
    _id_4A3D();
    level.ingraceperiod = 10;
    thread maps\mp\gametypes\_gamelogic::_id_59ED( 5.0 );
    wait 5;
    level.ingraceperiod = 0;
}

_id_4A3D()
{
    level endon( "hostmigration_enoughplayers" );
    wait 15;
}

_id_4A37( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "<removed_ent>";

    var_1 = -1;
    var_2 = "?";

    if ( isdefined( var_0.entity_number ) )
        var_1 = var_0.entity_number;

    if ( isplayer( var_0 ) && isdefined( var_0.nearz ) )
        var_2 = var_0.nearz;

    if ( isplayer( var_0 ) )
        return "player <" + var_2 + "> (entNum " + var_1 + " )";

    if ( isagent( var_0 ) && maps\mp\_utility::_id_5112( var_0 ) )
        return "participant agent <" + var_1 + ">";

    if ( isagent( var_0 ) )
        return "non-participant agent <" + var_1 + ">";

    return "unknown entity <" + var_1 + ">";
}

_id_4A3B()
{
    level endon( "host_migration_begin" );
    level endon( "host_migration_end" );
    self endon( "disconnect" );
    self._id_4A36 = 1;

    while ( !maps\mp\_utility::_id_5189( self ) )
        self waittill( "spawned" );

    maps\mp\_utility::_id_3A32( 1 );
    self disableammogeneration();
    level waittill( "host_migration_end" );
}

_id_4A3A()
{
    level endon( "host_migration_begin" );
    self endon( "disconnect" );

    if ( isagent( self ) )
        self endon( "death" );

    _id_4A3B();

    if ( self._id_4A36 )
    {
        if ( maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        {
            maps\mp\_utility::_id_3A32( 0 );
            self enableammogeneration();
        }

        self._id_4A36 = undefined;
    }
}

_id_A0DD()
{
    if ( !isdefined( level._id_4A39 ) )
        return 0;

    var_0 = gettime();
    level waittill( "host_migration_end" );
    return gettime() - var_0;
}

_id_A0DE( var_0 )
{
    if ( isdefined( level._id_4A39 ) )
        return;

    level endon( "host_migration_begin" );
    wait(var_0);
}

_id_A052( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0DE( ( var_2 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A39 ) )
        {
            var_3 = _id_A0DD();
            var_2 += var_3;
        }
    }

    _id_A0DD();
    return gettime() - var_1;
}

_id_A0A1( var_0, var_1 )
{
    self endon( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = gettime();
    var_3 = gettime() + var_1 * 1000;

    while ( gettime() < var_3 )
    {
        _id_A0DE( ( var_3 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A39 ) )
        {
            var_4 = _id_A0DD();
            var_3 += var_4;
        }
    }

    _id_A0DD();
    return gettime() - var_2;
}

_id_A051( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0DE( ( var_2 - gettime() ) / 1000 );

        while ( isdefined( level._id_4A39 ) )
        {
            var_2 += 1000;
            setgameendtime( int( var_2 ) );
            wait 1;
        }
    }

    while ( isdefined( level._id_4A39 ) )
    {
        var_2 += 1000;
        setgameendtime( int( var_2 ) );
        wait 1;
    }

    return gettime() - var_1;
}
