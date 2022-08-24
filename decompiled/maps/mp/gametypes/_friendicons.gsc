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
    level.drawfriend = 0;
    game["headicon_allies"] = maps\mp\gametypes\_teams::_id_4116( "allies" );
    game["headicon_axis"] = maps\mp\gametypes\_teams::_id_4116( "axis" );
    level thread _id_64C8();

    for (;;)
    {
        _id_9B1D();
        wait 5;
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
        var_0 thread _id_64D3();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_850D();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "killed_player" );
        self.headicon = "";
    }
}

_id_850D()
{
    if ( level.drawfriend )
    {
        if ( self.pers["team"] == "allies" )
        {
            self.headicon = game["headicon_allies"];
            self.headiconteam = "allies";
        }
        else
        {
            self.headicon = game["headicon_axis"];
            self.headiconteam = "axis";
        }
    }
}

_id_9B1D()
{
    var_0 = maps\mp\_utility::_id_3FDB( "scr_drawfriend", level.drawfriend );

    if ( level.drawfriend != var_0 )
    {
        level.drawfriend = var_0;
        _id_9B1C();
    }
}

_id_9B1C()
{
    var_0 = level.players;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.pers["team"] ) && var_2.pers["team"] != "spectator" && var_2.sessionstate == "playing" )
        {
            if ( level.drawfriend )
            {
                if ( var_2.pers["team"] == "allies" )
                {
                    var_2.headicon = game["headicon_allies"];
                    var_2.headiconteam = "allies";
                }
                else
                {
                    var_2.headicon = game["headicon_axis"];
                    var_2.headiconteam = "axis";
                }

                continue;
            }

            var_0 = level.players;

            for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            {
                var_2 = var_0[var_1];

                if ( isdefined( var_2.pers["team"] ) && var_2.pers["team"] != "spectator" && var_2.sessionstate == "playing" )
                    var_2.headicon = "";
            }
        }
    }
}
