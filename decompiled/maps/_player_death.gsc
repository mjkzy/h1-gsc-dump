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
    level.player thread _id_6C30();
    thread death_behavior();
    thread death_quote_think();
}

death_behavior()
{
    level.player waittill( "death", var_0, var_1, var_2, var_3 );
    soundscripts\_snd::_id_870C( "player_death" );

    if ( isdefined( var_3 ) )
    {
        var_4 = level.player.origin - level.player geteye() + ( 0.0, 0.0, 35.0 );
        var_5 = spawn( "script_model", level.player.origin + ( 0, 0, var_4[2] ) );
        var_5.angles = ( -10, level.player.angles[2], 30 );
        var_5 linkto( var_3 );

        if ( var_1 != "MOD_CRUSH" )
            level.player playerlinkto( var_5 );
    }

    level.player allowprone( 1 );
    maps\_sp_matchdata::_id_72DC( var_2, var_1 );
}

_id_6C30()
{
    self endon( "death" );
    self._id_55A6 = 0;

    for (;;)
    {
        while ( !self isthrowinggrenade() )
            wait 0.05;

        self._id_55A6 = gettime();

        while ( self isthrowinggrenade() )
            wait 0.05;
    }
}

death_quote_think()
{
    level endon( "new_quote_string" );
    level.player waittill( "death", var_0, var_1, var_2 );

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    setdeadquote();
    _id_8A1E( var_0, var_1, var_2 );
}

_id_8A1E( var_0, var_1, var_2 )
{
    if ( maps\_utility::_id_5083() )
        return;

    if ( level._id_5CDE )
        return;

    if ( var_1 != "MOD_GRENADE" && var_1 != "MOD_GRENADE_SPLASH" && var_1 != "MOD_SUICIDE" && var_1 != "MOD_EXPLOSIVE" )
        return;

    if ( level._id_3BFE >= 2 )
    {
        if ( !maps\_load::_id_5982() )
            return;
    }

    switch ( var_1 )
    {
        case "MOD_SUICIDE":
            if ( level.player._id_55A6 - gettime() > 3500.0 )
                return;

            thread _id_43E5( &"SCRIPT_GRENADE_SUICIDE_LINE1", &"SCRIPT_GRENADE_SUICIDE_LINE2" );
            break;
        case "MOD_EXPLOSIVE":
            if ( level.player _id_290A( var_0 ) )
                return;

            if ( level.player _id_9CA1( var_0 ) )
                return;

            if ( level.player _id_353E( var_0 ) )
                return;

            break;
        case "MOD_GRENADE":
        case "MOD_GRENADE_SPLASH":
            if ( isdefined( var_2 ) && !issubstr( var_2, "grenade" ) )
                return;

            _id_7E03( "@SCRIPT_GRENADE_DEATH" );
            thread _id_43E6();
            break;
        default:
            break;
    }
}

_id_9CA1( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0.code_classname != "script_vehicle" )
        return 0;

    _id_7E03( "@SCRIPT_EXPLODING_VEHICLE_DEATH" );
    thread _id_7E04( "hud_burningcaricon", 50, 50 );
    return 1;
}

_id_290A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0.destructible_type ) )
        return 0;

    if ( issubstr( var_0.destructible_type, "vehicle" ) )
    {
        _id_7E03( "@SCRIPT_EXPLODING_VEHICLE_DEATH" );
        thread _id_7E04( "hud_burningcaricon", 50, 50 );
    }
    else
    {
        _id_7E03( "@SCRIPT_EXPLODING_DESTRUCTIBLE_DEATH" );
        thread _id_7E04( "hud_destructibledeathicon", 96, 96 );
    }

    return 1;
}

_id_353E( var_0 )
{
    if ( isdefined( level._id_55A0 ) )
    {
        if ( gettime() != level._id_55A0["time"] )
            return 0;

        var_1 = distance( self.origin, level._id_55A0["origin"] );

        if ( var_1 > level._id_55A0["radius"] )
            return 0;

        _id_7E03( "@SCRIPT_EXPLODING_BARREL_DEATH" );
        thread _id_7E04( "hud_burningbarrelicon", 50, 50 );
        return 1;
    }

    return 0;
}

_id_7E03( var_0 )
{
    if ( getdvar( "limited_mode" ) == "1" )
        return;

    setdvar( "ui_deadquote", var_0 );
}

setdeadquote()
{
    if ( !level._id_5CDE )
    {
        var_0 = int( tablelookup( "sp/deathQuoteTable.csv", 1, "size", 0 ) );
        var_1 = randomint( var_0 );

        if ( getdvar( "cycle_deathquotes" ) != "" )
        {
            if ( getdvar( "ui_deadquote_index" ) == "" )
                setdvar( "ui_deadquote_index", "0" );

            var_1 = getdvarint( "ui_deadquote_index" );
            setdvar( "ui_deadquote", _id_5866( var_1 ) );
            var_1++;

            if ( var_1 > var_0 - 1 )
                var_1 = 0;

            setdvar( "ui_deadquote_index", var_1 );
        }
        else
            setdvar( "ui_deadquote", _id_5866( var_1 ) );
    }
}

_id_263A( var_0 )
{
    if ( var_0 == getdvar( "ui_deadquote_v1" ) )
        return 1;

    if ( var_0 == getdvar( "ui_deadquote_v2" ) )
        return 1;

    if ( var_0 == getdvar( "ui_deadquote_v3" ) )
        return 1;

    return 0;
}

_id_5866( var_0 )
{
    var_1 = tablelookup( "sp/deathQuoteTable.csv", 0, var_0, 1 );

    if ( tolower( var_1[0] ) != tolower( "@" ) )
        var_1 = "@" + var_1;

    return var_1;
}

_id_43E5( var_0, var_1 )
{
    level.player._id_3615 = 1;

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    _id_7E03( "" );
    wait 2.5;
    var_2 = newhudelem();
    var_2._id_3026 = "font";
    var_2.font = "default";
    var_2.fontscale = 1;
    var_2.x = 0;
    var_2.y = -30;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2.horzalign = "center";
    var_2.vertalign = "middle";
    var_2 settext( var_0 );
    var_2.foreground = 1;
    var_2.alpha = 0;
    var_2 fadeovertime( 2 );
    var_2.alpha = 1;
    var_2.hidewheninmenu = 1;

    if ( isdefined( var_1 ) )
    {
        var_2 = newhudelem();
        var_2._id_3026 = "font";
        var_2.font = "default";
        var_2.fontscale = 1;
        var_2.x = 0;
        var_2.y = -25 + level._id_397D * var_2.fontscale;
        var_2.alignx = "center";
        var_2.aligny = "middle";
        var_2.horzalign = "center";
        var_2.vertalign = "middle";
        var_2 settext( var_1 );
        var_2.foreground = 1;
        var_2.alpha = 0;
        var_2 fadeovertime( 2 );
        var_2.alpha = 1;
        var_2.hidewheninmenu = 1;
    }
}

_id_43E6()
{
    if ( getdvar( "limited_mode" ) == "1" )
        return;

    wait 2.5;
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 20;
    var_0 setshader( "hud_grenadeicon", 25, 25 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.foreground = 1;
    var_0.alpha = 0;
    var_0 fadeovertime( 2 );
    var_0.alpha = 1;
    var_0.hidewheninmenu = 1;
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "hud_grenadepointer", 25, 13 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.foreground = 1;
    var_0.alpha = 0;
    var_0 fadeovertime( 2 );
    var_0.alpha = 1;
    var_0.hidewheninmenu = 1;
}

_id_7E04( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 2.5;

    wait(var_3);
    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 25;
    var_4 setshader( var_0, var_1, var_2 );
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.horzalign = "center";
    var_4.vertalign = "middle";
    var_4.foreground = 1;
    var_4.alpha = 0;
    var_4 fadeovertime( 2 );
    var_4.alpha = 1;
    var_4.hidewheninmenu = 1;
}
