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
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;

            if ( maps\mp\_utility::_id_4FA6() )
            {
                var_4 = var_0 _meth_8568();
                var_1 = _func_2fa( var_4, common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
                var_3 = _func_2fa( var_4, common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );
                var_2 = _func_2fa( var_4, common_scripts\utility::getstatsgroup_common(), "callingCardIndex" );
            }
            else
            {
                var_1 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
                var_3 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );
                var_2 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "callingCardIndex" );
            }

            var_0.playerid = var_1;
            var_0 _meth_8577( var_3 );
            var_0.playerconnectionhistory = var_2;
        }
    }
}
