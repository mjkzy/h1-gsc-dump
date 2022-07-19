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
    level.hostname = getdvar( "sv_hostname" );

    if ( level.hostname == "" )
        level.hostname = "CoDHost";

    setdvar( "sv_hostname", level.hostname );
    level.allowvote = getdvarint( "g_allowvote", 1 );
    setdvar( "g_allowvote", level.allowvote );
    level.friendlyfire = maps\mp\gametypes\_tweakables::_id_4142( "team", "fftype" );
    _id_215B( getdvar( "g_gametype" ) );

    for (;;)
    {
        _id_9B68();
        wait 5;
    }
}

_id_9B68()
{
    var_0 = getdvar( "sv_hostname" );

    if ( level.hostname != var_0 )
        level.hostname = var_0;

    var_1 = getdvarint( "g_allowvote", 1 );

    if ( level.allowvote != var_1 )
        level.allowvote = var_1;

    var_2 = maps\mp\gametypes\_tweakables::_id_4142( "team", "fftype" );

    if ( level.friendlyfire != var_2 )
        level.friendlyfire = var_2;
}

_id_215B( var_0 )
{
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 == "dm" )
        {
            if ( isdefined( var_3.script_gametype_dm ) && var_3.script_gametype_dm != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "tdm" )
        {
            if ( isdefined( var_3.script_gametype_tdm ) && var_3.script_gametype_tdm != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "ctf" )
        {
            if ( isdefined( var_3.script_gametype_ctf ) && var_3.script_gametype_ctf != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "hq" )
        {
            if ( isdefined( var_3.script_gametype_koth ) && var_3.script_gametype_koth != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "sd" )
        {
            if ( isdefined( var_3.script_gametype_sd ) && var_3.script_gametype_sd != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "koth" )
        {
            if ( isdefined( var_3._id_79F9 ) && var_3._id_79F9 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "atdm" )
        {
            if ( isdefined( var_3.script_gametype_atdm ) && var_3.script_gametype_atdm != "1" )
                var_3 delete();
        }
    }
}
