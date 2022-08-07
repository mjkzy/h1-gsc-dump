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
    level._id_293C = 50;
    level._id_293B = [];
    _id_3763();
}

_id_2906( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level.destructible_type ) )
        level.destructible_type = [];

    var_5 = level.destructible_type.size;
    var_5 = level.destructible_type.size;
    level.destructible_type[var_5] = spawnstruct();
    level.destructible_type[var_5].v["type"] = var_0;
    level.destructible_type[var_5]._id_66A7 = [];
    level.destructible_type[var_5]._id_66A7[0][0] = spawnstruct();
    level.destructible_type[var_5]._id_66A7[0][0].v["modelName"] = self.motiontrackerenabled;
    level.destructible_type[var_5]._id_66A7[0][0].v["health"] = var_1;
    level.destructible_type[var_5]._id_66A7[0][0].v["validAttackers"] = var_2;
    level.destructible_type[var_5]._id_66A7[0][0].v["validDamageZone"] = var_3;
    level.destructible_type[var_5]._id_66A7[0][0].v["validDamageCause"] = var_4;
    level.destructible_type[var_5]._id_66A7[0][0].v["godModeAllowed"] = 1;
}

_id_2924( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = level.destructible_type.size - 1;
    var_11 = level.destructible_type[var_10]._id_66A7.size;
    var_12 = 0;
    _id_291E( var_11, var_12, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_2931( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = level.destructible_type.size - 1;
    var_8 = level.destructible_type[var_7]._id_66A7.size - 1;
    var_9 = level.destructible_type[var_7]._id_66A7[var_8].size;
    _id_291E( var_8, var_9, var_0, var_1, var_2, var_3, var_4, var_5, undefined, undefined, var_6 );
}

_id_2912( var_0, var_1, var_2 )
{
    var_1 = try_override_destructible_fx( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = level.destructible_type.size - 1;
    var_4 = level.destructible_type[var_3]._id_66A7.size - 1;
    var_5 = level.destructible_type[var_3]._id_66A7[var_4].size - 1;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["fx_filename"] = var_1;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["fx_tag"] = var_0;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["fx_useTagAngles"] = var_2;
}

_id_2920( var_0, var_1, var_2 )
{
    var_1 = try_override_destructible_fx( var_1 );
    var_3 = level.destructible_type.size - 1;
    var_4 = level.destructible_type[var_3]._id_66A7.size - 1;
    var_5 = level.destructible_type[var_3]._id_66A7[var_4].size - 1;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["loopfx_filename"] = var_1;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["loopfx_tag"] = var_0;
    level.destructible_type[var_3]._id_66A7[var_4][var_5].v["loopfx_rate"] = var_2;
}

try_override_destructible_fx( var_0 )
{
    if ( !isdefined( level.destructible_effect_override ) )
        return var_0;

    var_1 = getarraykeys( level.destructible_effect_override );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return level.destructible_effect_override[var_3];
    }

    return var_0;
}

_id_291D( var_0, var_1, var_2, var_3 )
{
    var_4 = level.destructible_type.size - 1;
    var_5 = level.destructible_type[var_4]._id_66A7.size - 1;
    var_6 = level.destructible_type[var_4]._id_66A7[var_5].size - 1;
    level.destructible_type[var_4]._id_66A7[var_5][var_6].v["healthdrain_amount"] = var_0;
    level.destructible_type[var_4]._id_66A7[var_5][var_6].v["healthdrain_interval"] = var_1;
    level.destructible_type[var_4]._id_66A7[var_5][var_6].v["badplace_radius"] = var_2;
    level.destructible_type[var_4]._id_66A7[var_5][var_6].v["badplace_team"] = var_3;
}

_id_292A( var_0, var_1 )
{
    var_2 = level.destructible_type.size - 1;
    var_3 = level.destructible_type[var_2]._id_66A7.size - 1;
    var_4 = level.destructible_type[var_2]._id_66A7[var_3].size - 1;

    if ( !isdefined( level.destructible_type[var_2]._id_66A7[var_3][var_4].v["sound"] ) )
    {
        level.destructible_type[var_2]._id_66A7[var_3][var_4].v["sound"] = [];
        level.destructible_type[var_2]._id_66A7[var_3][var_4].v["soundCause"] = [];
    }

    var_5 = level.destructible_type[var_2]._id_66A7[var_3][var_4].v["sound"].size;
    level.destructible_type[var_2]._id_66A7[var_3][var_4].v["sound"][var_5] = var_0;
    level.destructible_type[var_2]._id_66A7[var_3][var_4].v["soundCause"][var_5] = var_1;
}

_id_2921( var_0, var_1 )
{
    var_2 = level.destructible_type.size - 1;
    var_3 = level.destructible_type[var_2]._id_66A7.size - 1;
    var_4 = level.destructible_type[var_2]._id_66A7[var_3].size - 1;

    if ( !isdefined( level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsound"] ) )
    {
        level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsound"] = [];
        level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsoundCause"] = [];
    }

    var_5 = level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsound"].size;
    level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsound"][var_5] = var_0;
    level.destructible_type[var_2]._id_66A7[var_3][var_4].v["loopsoundCause"][var_5] = var_1;
}

_id_28FA( var_0, var_1, var_2, var_3 )
{
    var_4 = level.destructible_type.size - 1;
    var_5 = level.destructible_type[var_4]._id_66A7.size - 1;
    var_6 = level.destructible_type[var_4]._id_66A7[var_5].size - 1;

    if ( !isdefined( var_3 ) )
    {
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["anim"] = var_0;
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["animTree"] = var_1;
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["animType"] = var_2;
    }
    else
    {
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["partAnim"] = var_0;
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["partAnimTree"] = var_1;
        level.destructible_type[var_4]._id_66A7[var_5][var_6].v["partAnimType"] = var_2;
    }
}

_id_2926()
{
    var_0 = level.destructible_type.size - 1;
    var_1 = level.destructible_type[var_0]._id_66A7.size - 1;
    var_2 = level.destructible_type[var_0]._id_66A7[var_1].size - 1;
    level.destructible_type[var_0]._id_66A7[var_1][var_2].v["physics"] = 1;
}

_id_290D( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level.destructible_type.size - 1;
    var_6 = level.destructible_type[var_5]._id_66A7.size - 1;
    var_7 = level.destructible_type[var_5]._id_66A7[var_6].size - 1;
    level.destructible_type[var_5]._id_66A7[var_6][var_7].v["explode_force_min"] = var_0;
    level.destructible_type[var_5]._id_66A7[var_6][var_7].v["explode_force_max"] = var_1;
    level.destructible_type[var_5]._id_66A7[var_6][var_7].v["explode_range"] = var_2;
    level.destructible_type[var_5]._id_66A7[var_6][var_7].v["explode_mindamage"] = var_3;
    level.destructible_type[var_5]._id_66A7[var_6][var_7].v["explode_maxdamage"] = var_4;
}

_id_291E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = level.destructible_type.size - 1;
    level.destructible_type[var_12]._id_66A7[var_0][var_1] = spawnstruct();
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["modelName"] = var_3;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["tagName"] = var_2;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["health"] = var_4;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["validAttackers"] = var_5;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["validDamageZone"] = var_6;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["validDamageCause"] = var_7;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["alsoDamageParent"] = var_8;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["physicsOnExplosion"] = var_9;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["grenadeImpactDeath"] = var_10;
    level.destructible_type[var_12]._id_66A7[var_0][var_1].v["godModeAllowed"] = 0;

    if ( !isdefined( var_11 ) )
        level.destructible_type[var_12]._id_66A7[var_0][var_1].v["createEntityForAnimation"] = 0;
    else
        level.destructible_type[var_12]._id_66A7[var_0][var_1].v["createEntityForAnimation"] = var_11;
}

_id_3763()
{
    common_scripts\utility::_id_0D13( getentarray( "destructible", "targetname" ), ::_id_80B1 );
}

_id_6EBB()
{
    if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_0 = 0; var_0 < level.destructible_type[self.destuctableinfo]._id_66A7.size; var_0++ )
        {
            for ( var_1 = 0; var_1 < level.destructible_type[self.destuctableinfo]._id_66A7[var_0].size; var_1++ )
            {
                if ( level.destructible_type[self.destuctableinfo]._id_66A7[var_0].size <= var_1 )
                    continue;

                if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["modelName"] ) )
                    precachemodel( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["modelName"] );

                if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["fx_filename"] ) )
                    level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["fx"] = loadfx( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["fx_filename"] );

                if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["loopfx_filename"] ) )
                    level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["loopfx"] = loadfx( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["loopfx_filename"] );
            }
        }
    }
}

_id_80B1( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = undefined;
    self._id_5D41 = 0;
    _id_074B();
    self.destuctableinfo = common_scripts\_destructible_types::maketype( self.destructible_type );

    if ( !var_0 )
        _id_6EBB();

    if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7 ) )
    {
        self._id_2925 = [];

        for ( var_2 = 0; var_2 < level.destructible_type[self.destuctableinfo]._id_66A7.size; var_2++ )
        {
            self._id_2925[var_2] = spawnstruct();
            self._id_2925[var_2].v["currentState"] = 0;

            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_2][0].v["health"] ) )
                self._id_2925[var_2].v["health"] = level.destructible_type[self.destuctableinfo]._id_66A7[var_2][0].v["health"];

            if ( var_2 == 0 )
                continue;

            var_3 = level.destructible_type[self.destuctableinfo]._id_66A7[var_2][0].v["modelName"];
            var_4 = level.destructible_type[self.destuctableinfo]._id_66A7[var_2][0].v["tagName"];
            self attach( var_3, var_4 );

            if ( self._id_5D41 )
                self._id_5D40 attach( var_3, var_4 );
        }
    }

    if ( self.classname != "script_vehicle" )
        self setcandamage( 1 );

    thread setup_destructible_entities();
    thread _id_2150();
    thread _id_2932();
}

_id_074B()
{
    self._id_6AC2 = 0;
    self._id_614F = 0;
    self._id_1B69 = 1;
}

_id_2932()
{
    self endon( "stop_taking_damage" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 <= 0 )
            continue;

        var_4 = _id_3F4C( var_4 );

        if ( var_5 == "" )
            var_5 = self.motiontrackerenabled;

        if ( isdefined( var_6 ) && var_6 == "" )
            var_6 = undefined;

        if ( var_4 == "splash" )
        {
            _id_292C( int( var_0 ), var_3, var_2, var_1, var_4 );
            continue;
        }

        thread _id_2936( int( var_0 ), var_5, var_6, var_3, var_2, var_1, var_4 );
    }
}

_id_2936( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self._id_2925 ) )
        return;

    if ( self._id_2925.size == 0 )
        return;

    var_7 = -1;
    var_8 = -1;

    if ( tolower( var_1 ) == tolower( self.motiontrackerenabled ) && !isdefined( var_2 ) )
    {
        var_1 = self.motiontrackerenabled;
        var_2 = undefined;
        var_7 = 0;
        var_8 = 0;
    }

    for ( var_9 = 0; var_9 < level.destructible_type[self.destuctableinfo]._id_66A7.size; var_9++ )
    {
        var_8 = self._id_2925[var_9].v["currentState"];

        if ( level.destructible_type[self.destuctableinfo]._id_66A7[var_9].size <= var_8 )
            continue;

        if ( !isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_9][var_8].v["modelName"] ) )
            continue;

        if ( tolower( level.destructible_type[self.destuctableinfo]._id_66A7[var_9][var_8].v["modelName"] ) == tolower( var_1 ) )
        {
            if ( level.destructible_type[self.destuctableinfo]._id_66A7[var_9][var_8].v["tagName"] == var_2 )
            {
                var_7 = var_9;
                break;
            }
        }
    }

    if ( var_7 < 0 )
        return;

    var_10 = var_8;
    var_11 = 0;
    var_12 = 0;

    for (;;)
    {
        var_8 = self._id_2925[var_7].v["currentState"];

        if ( !isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8] ) )
            break;

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][0].v["alsoDamageParent"] ) )
        {
            if ( _id_3F4C( var_6 ) != "splash" )
            {
                var_13 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][0].v["alsoDamageParent"];
                var_14 = int( var_0 * var_13 );
                thread _id_6229( var_14, var_5, var_4, var_3, var_6, "", "" );
            }
        }

        if ( !isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["health"] ) )
            break;

        if ( !isdefined( self._id_2925[var_7].v["health"] ) )
            break;

        if ( var_11 )
            self._id_2925[var_7].v["health"] = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["health"];

        var_11 = 0;

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["grenadeImpactDeath"] ) && var_6 == "impact" )
            var_0 = 100000000;

        var_15 = _id_50C1( var_7, var_8, var_5 );

        if ( var_15 )
        {
            var_16 = _id_51E9( var_7, var_8, var_6 );

            if ( var_16 )
            {
                if ( var_5 == level.playercardbackground )
                    self._id_6AC2 += var_0;
                else if ( var_5 != self )
                    self._id_614F += var_0;

                self._id_2925[var_7].v["health"] -= var_0;
            }
        }

        if ( self._id_2925[var_7].v["health"] > 0 )
            return;

        var_0 = int( abs( self._id_2925[var_7].v["health"] ) );

        if ( var_0 < 0 )
            return;

        self._id_2925[var_7].v["currentState"]++;
        var_8 = self._id_2925[var_7].v["currentState"];
        var_17 = var_8 - 1;

        if ( !isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17] ) )
            return;

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_force_min"] ) )
            self._id_353D = 1;

        if ( isdefined( self._id_588C ) && isdefined( self._id_588C[maps\_utility::_id_8F53( var_7 )] ) )
        {
            for ( var_9 = 0; var_9 < self._id_588C[maps\_utility::_id_8F53( var_7 )].size; var_9++ )
            {
                self notify( self._id_588C[maps\_utility::_id_8F53( var_7 )][var_9] );

                if ( self._id_5D41 )
                    self._id_5D40 notify( self._id_588C[maps\_utility::_id_8F53( var_7 )][var_9] );
            }

            self._id_588C[maps\_utility::_id_8F53( var_7 )] = undefined;
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8] ) )
        {
            if ( var_7 == 0 )
            {
                var_18 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["modelName"];
                self setmodel( var_18 );

                if ( self._id_5D41 )
                    self._id_5D40 setmodel( var_18 );
            }
            else
            {
                self detach( var_1, var_2 );

                if ( self._id_5D41 )
                    self._id_5D40 detach( var_1, var_2 );

                var_1 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["modelName"];
                var_2 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["tagName"];

                if ( isdefined( var_1 ) && isdefined( var_2 ) )
                {
                    if ( self._id_5D41 )
                        self._id_5D40 attach( var_1, var_2 );

                    self attach( var_1, var_2 );
                }
            }
        }

        var_19 = _id_3D4B();

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["fx"] ) )
        {
            var_20 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["fx"];

            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["fx_tag"] ) )
            {
                var_21 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["fx_tag"];
                self notify( "FX_State_Change" + var_7 );

                if ( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["fx_useTagAngles"] )
                {
                    if ( delayvfxonmultipleframes( var_19 ) )
                    {
                        if ( !isdefined( self.playingfxpartscount ) )
                            self.playingfxpartscount = 0;

                        if ( self.playingfxpartscount < 3 )
                            destructible_playfxontag_internal( var_20, var_19, var_21 );
                        else
                        {
                            while ( self.playingfxpartscount >= 3 )
                                wait 0.05;

                            destructible_playfxontag_internal( var_20, var_19, var_21 );
                        }
                    }
                    else
                        playfxontag( var_20, var_19, var_21 );
                }
                else
                {
                    var_22 = var_19 gettagorigin( var_21 );
                    var_23 = var_22 + ( 0, 0, 100 ) - var_22;
                    playfx( var_20, var_22, var_23 );
                }
            }
            else
            {
                var_22 = var_19.origin;
                var_23 = var_22 + ( 0, 0, 100 ) - var_22;
                playfx( var_20, var_22, var_23 );
            }
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopfx"] ) )
        {
            var_24 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopfx"];
            var_25 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopfx_tag"];
            var_26 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopfx_rate"];
            self notify( "FX_State_Change" + var_7 );
            thread _id_587D( var_24, var_25, var_26, var_7 );
        }

        if ( !isdefined( self._id_3527 ) )
        {
            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["anim"] ) )
            {
                var_27 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["anim"];
                var_28 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["animTree"];
                var_19 useanimtree( var_28 );
                var_29 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["animType"];

                if ( !isdefined( self._id_0C7B ) )
                    self._id_0C7B = [];

                self._id_0C7B[self._id_0C7B.size] = var_27;

                if ( isdefined( self._id_353D ) )
                {
                    if ( isdefined( self._id_0C7B ) )
                    {
                        for ( var_9 = 0; var_9 < self._id_0C7B.size; var_9++ )
                            var_19 _meth_8144( self._id_0C7B[var_9], 0 );
                    }
                }

                if ( var_29 == "setanim" )
                    var_19 _meth_814d( var_27, 1.0, 1.0, 1.0 );
                else if ( var_29 == "setanimknob" )
                    var_19 _meth_8145( var_27, 1.0, 1.0, 1.0 );
                else
                {

                }
            }
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["createEntityForAnimation"] ) && level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["createEntityForAnimation"] && !isdefined( self._id_3527 ) )
        {
            var_30 = createentity( var_7, var_17, self.destuctableinfo );

            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["partAnim"] ) )
            {
                var_27 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["partAnim"];
                var_28 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["partAnimTree"];
                var_30 useanimtree( var_28 );
                var_29 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["partAnimType"];

                if ( !isdefined( self._id_0C7B ) )
                    self._id_0C7B = [];

                self._id_0C7B[self._id_0C7B.size] = var_27;

                if ( isdefined( self._id_353D ) && isdefined( self._id_0C7B ) )
                {
                    for ( var_9 = 0; var_9 < self._id_0C7B.size; var_9++ )
                        var_30 _meth_8144( self._id_0C7B[var_9], 0 );
                }

                if ( var_29 == "setanim" )
                    var_30 _meth_814d( var_27, 1.0, 1.0, 1.0 );
                else if ( var_29 == "setanimknob" )
                    var_30 _meth_8145( var_27, 1.0, 1.0, 1.0 );
                else
                {

                }
            }
        }

        if ( !isdefined( self._id_3527 ) )
        {
            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["sound"] ) )
            {
                for ( var_9 = 0; var_9 < level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["sound"].size; var_9++ )
                {
                    var_31 = _id_51F6( "soundCause", var_7, var_17, var_9, var_6 );

                    if ( var_31 )
                    {
                        var_32 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["sound"][var_9];
                        var_33 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["tagName"];
                        var_19 thread maps\_utility::_id_69C5( var_32, var_33 );
                    }
                }
            }
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopsound"] ) )
        {
            for ( var_9 = 0; var_9 < level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopsound"].size; var_9++ )
            {
                var_31 = _id_51F6( "loopsoundCause", var_7, var_17, var_9, var_6 );

                if ( var_31 )
                {
                    var_34 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["loopsound"][var_9];
                    var_35 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["tagName"];
                    thread _id_6974( var_34, var_35 );

                    if ( !isdefined( self._id_588C ) )
                        self._id_588C = [];

                    if ( !isdefined( self._id_588C[maps\_utility::_id_8F53( var_7 )] ) )
                        self._id_588C[maps\_utility::_id_8F53( var_7 )] = [];

                    var_36 = self._id_588C[maps\_utility::_id_8F53( var_7 )].size;
                    self._id_588C[maps\_utility::_id_8F53( var_7 )][var_36] = "stop sound" + var_34;
                }
            }
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["healthdrain_amount"] ) )
        {
            self notify( "Health_Drain_State_Change" + var_7 );
            var_37 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["healthdrain_amount"];
            var_38 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["healthdrain_interval"];
            var_39 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["modelName"];
            var_40 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["tagName"];
            var_41 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["badplace_radius"];
            var_42 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["badplace_team"];

            if ( var_37 > 0 )
                thread _id_4781( var_37, var_38, var_7, var_39, var_40, var_41, var_42 );
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_force_min"] ) )
        {
            var_12 = 1;
            var_43 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_force_min"];
            var_44 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_force_max"];
            var_45 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_range"];
            var_46 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_mindamage"];
            var_47 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["explode_maxdamage"];

            if ( isdefined( var_5 ) && var_5 != self )
                self.attacker = var_5;

            thread explode( var_7, var_43, var_44, var_45, var_46, var_47 );
        }

        if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_17].v["physics"] ) )
        {
            var_48 = var_3;
            var_49 = ( 0, 0, 0 );

            if ( isdefined( var_5 ) )
            {
                var_49 = var_5.origin;

                if ( var_5 == level.playercardbackground )
                    var_49 = level.playercardbackground geteye();

                var_48 = vectornormalize( var_3 - var_49 );
                var_48 = maps\_utility::vector_multiply( var_48, 200 );
            }

            thread _id_67FD( var_7, var_17, var_3, var_48 );
            return;
        }

        var_11 = 1;
    }
}

delayvfxonmultipleframes( var_0 )
{
    return var_0.motiontrackerenabled == "vehicle_uaz_hardtop_dsr" && level.script_context == "icbm";
}

reduceplayingcount( var_0 )
{
    wait(var_0);
    self.playingfxpartscount--;
}

destructible_playfxontag_internal( var_0, var_1, var_2 )
{
    self.playingfxpartscount++;
    playfxontag( var_0, var_1, var_2 );
    thread reduceplayingcount( 0.05 );
}

_id_292C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 <= 0 )
        return;

    var_5 = [];
    var_6 = undefined;

    if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_7 = 0; var_7 < level.destructible_type[self.destuctableinfo]._id_66A7.size; var_7++ )
        {
            for ( var_8 = 0; var_8 < level.destructible_type[self.destuctableinfo]._id_66A7[var_7].size; var_8++ )
            {
                if ( level.destructible_type[self.destuctableinfo]._id_66A7[var_7].size <= var_8 )
                    continue;

                if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["modelName"] ) )
                {
                    var_9 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["modelName"];

                    if ( var_7 == 0 )
                    {
                        var_10 = distance( var_1, self.origin );
                        var_11 = undefined;
                    }
                    else
                    {
                        var_11 = level.destructible_type[self.destuctableinfo]._id_66A7[var_7][var_8].v["tagName"];
                        var_10 = distance( var_1, self gettagorigin( var_11 ) );
                    }

                    if ( !isdefined( var_6 ) || var_10 < var_6 )
                        var_6 = var_10;

                    var_12 = var_5.size;
                    var_5[var_12] = spawnstruct();
                    var_5[var_12].v["modelName"] = var_9;
                    var_5[var_12].v["tagName"] = var_11;
                    var_5[var_12].v["distance"] = var_10;
                }
            }
        }
    }

    if ( !isdefined( var_6 ) )
        return;

    if ( var_6 < 0 )
        return;

    if ( var_5.size <= 0 )
        return;

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
    {
        var_13 = var_5[var_7].v["distance"] * 1.4;
        var_14 = var_0 - ( var_13 - var_6 );

        if ( var_14 <= 0 )
            continue;

        thread _id_2936( var_14, var_5[var_7].v["modelName"], var_5[var_7].v["tagName"], var_1, var_2, var_3, var_4 );
    }
}

_id_51F6( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level.destructible_type[self.destuctableinfo]._id_66A7[var_1][var_2].v[var_0][var_3];

    if ( !isdefined( var_5 ) )
        return 1;

    if ( var_5 == var_4 )
        return 1;

    return 0;
}

_id_50C1( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_39BE ) )
        return 1;

    if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["explode_force_min"] ) )
    {
        if ( isdefined( self._id_2D2A ) )
            return 0;
    }

    if ( !isdefined( var_2 ) )
        return 1;

    if ( var_2 == self )
        return 1;

    var_3 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["validAttackers"];

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 == "no_player" )
    {
        if ( var_2 != level.playercardbackground )
            return 1;
    }
    else if ( var_3 == "player_only" )
    {
        if ( var_2 == level.playercardbackground )
            return 1;
    }
    else if ( var_3 == "no_ai" )
    {
        if ( !isai( var_2 ) )
            return 1;
    }
    else if ( var_3 == "ai_only" )
    {
        if ( isai( var_2 ) )
            return 1;
    }
    else
    {

    }

    return 0;
}

_id_51E9( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        return 1;

    var_3 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["godModeAllowed"];

    if ( var_3 && ( isdefined( self._id_4257 ) && self._id_4257 || isdefined( self._id_7965 ) && self._id_7965 && var_2 == "bullet" ) )
        return 0;

    var_4 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v["validDamageCause"];

    if ( !isdefined( var_4 ) )
        return 1;

    if ( var_4 == "no_melee" && var_2 == "melee" )
        return 0;

    return 1;
}

_id_3F4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "melee":
        case "mod_melee":
        case "mod_crush":
            return "melee";
        case "mod_pistol_bullet":
        case "mod_rifle_bullet":
        case "bullet":
            return "bullet";
        case "mod_grenade":
        case "mod_grenade_splash":
        case "mod_projectile":
        case "mod_projectile_splash":
        case "mod_explosive":
        case "splash":
            return "splash";
        case "mod_impact":
            return "impact";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

_id_587D( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3D4B();
    self endon( "FX_State_Change" + var_3 );
    self endon( "delete_destructible" );
    level endon( "putout_fires" );

    for (;;)
    {
        var_4 = _id_3D4B();
        playfxontag( var_0, var_4, var_1 );
        wait(var_2);
    }
}

_id_4781( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "Health_Drain_State_Change" + var_2 );
    level endon( "putout_fires" );
    wait(var_1);
    self._id_4788 = 1;
    var_7 = undefined;

    if ( isdefined( var_5 ) && isdefined( var_6 ) )
    {
        var_7 = "" + gettime();

        if ( !isdefined( self._id_2AF5 ) )
        {
            if ( var_6 == "both" )
                badplace_cylinder( var_7, 0, self.origin, var_5, 128, "allies", "axis" );
            else
                badplace_cylinder( var_7, 0, self.origin, var_5, 128, var_6 );
        }
    }

    while ( self._id_2925[var_2].v["health"] > 0 )
    {
        self notify( "damage", var_0, self, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_UNKNOWN", var_3, var_4 );
        wait(var_1);
    }

    if ( isdefined( var_5 ) && isdefined( var_6 ) )
        badplace_delete( var_7 );
}

_id_67FD( var_0, var_1, var_2, var_3 )
{
    var_4 = get_model_from_part( var_0, var_1 );
    var_5 = get_last_model_from_part( var_0 );
    var_6 = get_tag_from_part( var_0, var_1 );

    if ( !ismodelattached( var_4, var_6 ) )
        return;

    self detach( var_4, var_6 );

    if ( self._id_5D41 )
        self._id_5D40 detach( var_4, var_6 );

    if ( level._id_293B.size >= level._id_293C )
        _id_6800( level._id_293B[0] );

    var_7 = spawn( "script_model", self gettagorigin( var_6 ) );
    var_7.angles = self gettagangles( var_6 );
    var_7 setmodel( var_5 );
    level._id_293B[level._id_293B.size] = var_7;
    var_7 physicslaunch( var_2, var_3 );
}

_id_6800( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_293B.size; var_2++ )
    {
        if ( level._id_293B[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_293B[var_2];
    }

    level._id_293B = var_1;
    var_0 delete();
}

createentity( var_0, var_1, var_2 )
{
    var_3 = get_model_from_part( var_0, var_1 );
    var_4 = get_last_model_from_part( var_0 );
    var_5 = get_tag_from_part( var_0, var_1 );

    if ( !ismodelattached( var_3, var_5 ) )
        return;

    self detach( var_3, var_5 );

    if ( self._id_5D41 )
        self._id_5D40 detach( var_3, var_5 );

    var_6 = spawn( "script_model", self gettagorigin( var_5 ) );
    var_6.angles = self gettagangles( var_5 );
    var_6 setmodel( var_4 );
    var_6 linkto( self );

    if ( !isdefined( self.partsspawnedents ) )
        self.partsspawnedents = [];

    self.partsspawnedents[self.partsspawnedents.size] = var_6;
    return var_6;
}

explode( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( self._id_3527 ) )
        return;

    self._id_3527 = 1;

    if ( self.classname == "script_vehicle" || self.code_classname == "script_vehicle" )
        self notify( "death" );

    thread _id_2B3A();
    thread destroy_destructible_entities();
    wait 0.05;
    var_6 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][self._id_2925[var_0].v["currentState"]].v["tagName"];

    if ( isdefined( var_6 ) )
        var_7 = self gettagorigin( var_6 );
    else
        var_7 = self.origin;

    self notify( "damage", var_5, self, ( 0, 0, 0 ), var_7, "MOD_EXPLOSIVE", "", "" );
    waitframe;

    if ( isdefined( self.partsspawnedents ) )
    {
        foreach ( var_9 in self.partsspawnedents )
            var_9 delete();
    }

    if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_11 = level.destructible_type[self.destuctableinfo]._id_66A7.size - 1; var_11 >= 0; var_11-- )
        {
            if ( var_11 == var_0 )
                continue;

            var_12 = self._id_2925[var_11].v["currentState"];

            if ( var_12 >= level.destructible_type[self.destuctableinfo]._id_66A7[var_11].size )
                var_12 = level.destructible_type[self.destuctableinfo]._id_66A7[var_11].size - 1;

            var_13 = get_model_from_part( var_11, var_12 );
            var_6 = get_tag_from_part( var_11, var_12 );

            if ( !isdefined( var_13 ) )
                continue;

            if ( !isdefined( var_6 ) )
                continue;

            if ( !ismodelattached( var_13, var_6 ) )
                continue;

            if ( part_has_physics_exposion( var_11 ) )
            {
                apply_physics_explosion_to_part( var_11, var_12, var_6, var_7, var_1, var_2 );
                continue;
            }

            self detach( var_13, var_6 );

            if ( self._id_5D41 )
                self._id_5D40 detach( var_13, var_6 );
        }
    }

    self notify( "stop_taking_damage" );
    wait 0.05;
    var_14 = var_7 + ( 0, 0, 80 );

    if ( getsubstr( level.destructible_type[self.destuctableinfo].v["type"], 0, 7 ) == "vehicle" )
    {
        anim._id_5583 = gettime();
        anim._id_5580 = var_14;
        anim._id_5581 = var_7;
        anim._id_5582 = var_3;
    }

    self entityradiusdamage( var_14, var_3, var_5, var_4, self );

    if ( arcademode_car_kill() )
        thread maps\_arcademode::arcademode_add_points( self.origin, 1, "explosive", 200 );

    self notify( "destroyed" );
}

arcademode_car_kill()
{
    if ( !maps\_utility::_id_0CC3() )
        return 0;

    if ( level.script_context == "ac130" )
        return 0;

    if ( isdefined( level.allcarsdamagedbyplayer ) )
        return 1;

    return maps\_gameskill::_id_6ACA();
}

get_destructible_index( var_0, var_1, var_2 )
{
    if ( var_1 >= 0 )
        return level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_1].v[var_2];
    else if ( var_1 == -1 )
    {
        var_3 = undefined;

        for ( var_4 = 0; var_4 < level.destructible_type[self.destuctableinfo]._id_66A7[var_0].size; var_4++ )
        {
            if ( isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_4].v[var_2] ) )
                var_3 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][var_4].v[var_2];
        }

        return var_3;
    }
}

get_tag_from_part( var_0, var_1 )
{
    return get_destructible_index( var_0, var_1, "tagName" );
}

get_model_from_part( var_0, var_1 )
{
    return get_destructible_index( var_0, var_1, "modelName" );
}

get_last_model_from_part( var_0 )
{
    return get_destructible_index( var_0, -1, "modelName" );
}

apply_physics_explosion_to_part( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = level.destructible_type[self.destuctableinfo]._id_66A7[var_0][0].v["physicsOnExplosion"];
    var_7 = self gettagorigin( var_2 );
    var_8 = vectornormalize( var_7 - var_3 );
    var_8 = maps\_utility::vector_multiply( var_8, randomfloatrange( var_4, var_5 ) * var_6 );
    thread _id_67FD( var_0, var_1, var_7, var_8 );
}

part_has_physics_exposion( var_0 )
{
    if ( !isdefined( level.destructible_type[self.destuctableinfo]._id_66A7[var_0][0].v["physicsOnExplosion"] ) )
        return 0;

    return level.destructible_type[self.destuctableinfo]._id_66A7[var_0][0].v["physicsOnExplosion"] > 0;
}

ismodelattached( var_0, var_1 )
{
    var_2 = 0;
    var_0 = tolower( var_0 );
    var_1 = tolower( var_1 );

    if ( !isdefined( var_1 ) )
        return var_2;

    var_3 = self getattachsize();
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        var_4[var_5] = tolower( self getattachmodelname( var_5 ) );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( var_4[var_5] != var_0 )
            continue;

        var_6 = tolower( self getattachtagname( var_5 ) );

        if ( var_1 != var_6 )
            continue;

        var_2 = 1;
        break;
    }

    return var_2;
}

_id_6974( var_0, var_1 )
{
    var_2 = _id_3D4B();
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( isdefined( var_1 ) )
        var_3.origin = var_2 gettagorigin( var_1 );
    else
        var_3.origin = var_2.origin;

    if ( soundexists( var_0 ) )
        var_3 playloopsound( var_0 );
    else
    {

    }

    var_2 thread _id_39A7( var_0 );
    var_2 waittill( "stop sound" + var_0 );
    var_3 stoploopsound( var_0 );
    var_3 delete();
}

_id_39A7( var_0 )
{
    self endon( "stop sound" + var_0 );
    level waittill( "putout_fires" );
    self notify( "stop sound" + var_0 );
}

_id_6229( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level._id_6229 ) )
        return;

    level._id_6229 = 1;
    waitframe;

    if ( isdefined( self._id_3527 ) )
    {
        level._id_6229 = undefined;
        return;
    }

    self notify( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    level._id_6229 = undefined;
}

_id_3D4B()
{
    if ( self._id_5D41 )
        var_0 = self._id_5D40;
    else
        var_0 = self;

    return var_0;
}

_id_2AA1()
{
    self._id_2D2A = 1;
}

_id_3995()
{
    self._id_2D2A = undefined;
    self._id_39BE = 1;
    self notify( "damage", 1000000000, self, self.origin, self.origin, "MOD_EXPLOSIVE", "", "" );
}

_id_3EA1()
{
    if ( !isdefined( self._not_team ) )
        return undefined;

    var_0 = getent( self._not_team, "targetname" );

    if ( !isdefined( var_0 ) )
        return undefined;

    if ( !var_0.specialgrenade & 1 )
        return undefined;

    return var_0;
}

_id_2150()
{
    var_0 = _id_3EA1();

    if ( !isdefined( var_0 ) )
        return;

    var_0 connectpaths();
    var_0.origin -= ( 0, 0, 10000 );
}

_id_2B3A()
{
    var_0 = _id_3EA1();

    if ( !isdefined( var_0 ) )
        return;

    var_0.origin += ( 0, 0, 10000 );
    var_0 disconnectpaths();
    var_0.origin -= ( 0, 0, 10000 );
}

setup_destructible_entities()
{
    var_0 = common_scripts\utility::_id_3DBD();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_parentname ) )
            continue;

        switch ( var_2.script_parentname )
        {
            case "destroyed":
                var_2.origin -= ( 0, 0, 10000 );
                continue;
        }
    }
}

destroy_destructible_entities()
{
    var_0 = common_scripts\utility::_id_3DBD();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_parentname ) )
            continue;

        switch ( var_2.script_parentname )
        {
            case "destructible":
                var_2 delete();
                continue;
            case "destroyed":
                var_2.origin += ( 0, 0, 10000 );
                continue;
        }
    }
}

_id_2904()
{

}

_id_2914( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{

}

_id_292D( var_0 )
{

}
