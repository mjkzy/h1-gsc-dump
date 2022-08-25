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
    _id_8072();
    _id_805D();
}

_id_8072()
{
    level.bot_funcs["gametype_think"] = ::bot_gun_think;
}

_id_805D()
{

}

bot_gun_pick_personality_from_weapon( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_2 = level.bot_weap_personality[var_0];

        if ( isdefined( var_2 ) )
        {
            var_3 = strtok( var_2, "| " );

            if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_pistol" )
                var_3 = [ "cqb", "run_and_gun" ];

            if ( var_3.size > 0 )
            {
                var_4 = undefined;

                if ( common_scripts\utility::array_contains( var_3, var_1 ) )
                    var_4 = var_1;
                else
                    var_4 = common_scripts\utility::_id_710E( var_3 );

                maps\mp\bots\_bots_util::bot_set_personality( var_4 );
            }
        }
    }
}

bot_gun_think()
{
    self notify( "bot_gun_think" );
    self endon( "bot_gun_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );
    var_0 = "";
    var_1 = self._id_67DF;
    wait 0.1;

    for (;;)
    {
        var_2 = self getcurrentweapon();

        if ( var_2 != "none" && !maps\mp\_utility::iskillstreakweapon( var_2 ) && var_2 != var_0 )
        {
            var_0 = var_2;

            if ( self botgetdifficultysetting( "advancedPersonality" ) && self botgetdifficultysetting( "strategyLevel" ) > 0 )
            {
                var_3 = maps\mp\_utility::_id_3F11( var_2 );
                bot_gun_pick_personality_from_weapon( var_3, var_1 );
            }
        }

        self [[ self._id_67E1 ]]();
        wait 0.05;
    }
}
