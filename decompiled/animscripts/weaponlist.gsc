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

_id_9C2C()
{
    return weaponisauto( self.weapon_switch_invalid ) || weaponburstcount( self.weapon_switch_invalid ) > 0;
}

_id_9C38()
{
    return weaponissemiauto( self.weapon_switch_invalid );
}

_id_116C()
{
    if ( _id_9C2C() )
        return 0.1 / weaponfiretime( self.weapon_switch_invalid );
    else
        return 0.5;
}

_id_1934()
{
    if ( _id_9C2C() )
        return 0.1 / weaponfiretime( self.weapon_switch_invalid );
    else
        return 0.2;
}

_id_A004()
{
    return 0.25;
}

_id_83E9( var_0 )
{
    if ( !_id_9C2C() || isdefined( var_0 ) && var_0 == 1 )
    {
        var_1 = 0.5 + randomfloat( 1 );
        return weaponfiretime( self.weapon_switch_invalid ) * var_1;
    }
    else
        return weaponfiretime( self.weapon_switch_invalid );
}

_id_72B1()
{
    if ( self.weapon_switch_invalid == "none" )
    {
        self._id_18B0 = 0;
        return 0;
    }

    if ( !isdefined( self._id_18B0 ) )
        self._id_18B0 = weaponclipsize( self.weapon_switch_invalid );
    else
        self._id_18B0 = weaponclipsize( self.weapon_switch_invalid );

    if ( self._id_18B0 <= 0 )
        return 0;
    else
        return 1;
}

_id_07C1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 3.0;

    if ( !isdefined( var_3 ) )
        var_2 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = "rifle";

    var_0 = tolower( var_0 );
    anim._id_09AC[var_0]["type"] = var_1;
    anim._id_09AC[var_0]["time"] = var_2;
    anim._id_09AC[var_0]["clipsize"] = var_3;
    anim._id_09AC[var_0]["anims"] = var_4;
}

_id_0857( var_0 )
{
    anim._id_09AC[tolower( var_0 )]["type"] = "turret";
}
