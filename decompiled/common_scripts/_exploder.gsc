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

_id_3F8E( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
        return level._id_241A[var_0];

    var_1 = [];

    foreach ( var_3 in level._id_2417 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.v["type"] != "exploder" )
            continue;

        if ( !isdefined( var_3.v["exploder"] ) )
            continue;

        if ( var_3.v["exploder"] == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_814F( var_0 )
{
    var_1 = var_0._id_79BF;

    if ( !isdefined( level._id_353C[var_1] ) )
        level._id_353C[var_1] = [];

    var_2 = var_0.teambalanced;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    level._id_353C[var_1][level._id_353C[var_1].size] = var_0;

    if ( _id_3532( var_0 ) )
    {
        var_0 hide();
        return;
    }

    if ( _id_3531( var_0 ) )
    {
        var_0 hide();
        var_0 notsolid();

        if ( isdefined( var_0.specialgrenade ) && var_0.specialgrenade & 1 )
        {
            if ( isdefined( var_0._id_79A0 ) )
                var_0 connectpaths();
        }

        return;
    }

    if ( _id_3530( var_0 ) )
    {
        var_0 hide();
        var_0 notsolid();

        if ( isdefined( var_0.specialgrenade ) && var_0.specialgrenade & 1 )
            var_0 connectpaths();

        return;
    }

    if ( exploder_model_is_anim_model( var_0 ) && issubstr( var_0.teambalanced, "exploderanimhide" ) )
    {
        var_0 hide();
        var_0 notsolid();

        if ( isdefined( var_0.specialgrenade ) && var_0.specialgrenade & 1 )
            var_0 connectpaths();

        return;
    }
}

_id_8313()
{
    level._id_353C = [];
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_7AA6 ) )
            var_4._id_79BF = var_4._id_7AA6;

        if ( isdefined( var_4._id_59D6 ) )
            continue;

        if ( isdefined( var_4._id_79BF ) )
            _id_814F( var_4 );
    }

    var_6 = [];
    var_7 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_origin", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = level._id_8F60;

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( !isdefined( var_7[var_2] ) )
            continue;

        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
        {
            if ( !isdefined( var_7[var_2].angles ) )
                var_7[var_2].angles = ( 0.0, 0.0, 0.0 );

            var_6[var_6.size] = var_7[var_2];
        }
    }

    if ( !isdefined( level._id_2417 ) )
        level._id_2417 = [];

    var_8 = [];
    var_8["exploderchunk visible"] = 1;
    var_8["exploderchunk"] = 1;
    var_8["exploder"] = 1;
    thread _id_8103();

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        var_9 = var_6[var_2];
        var_4 = common_scripts\utility::_id_23FE( var_9.script_fxid );
        var_4.v = [];
        var_4.v["origin"] = var_9.origin;
        var_4.v["angles"] = var_9.angles;
        var_4.v["delay"] = var_9.script_lightset;
        var_4.v["delay_post"] = var_9._id_798F;
        var_4.v["firefx"] = var_9._id_79CB;
        var_4.v["firefxdelay"] = var_9._id_79CC;
        var_4.v["firefxsound"] = var_9._id_79CD;
        var_4.v["firefxtimeout"] = var_9._id_79CE;
        var_4.v["earthquake"] = var_9._id_79B5;
        var_4.v["rumble"] = var_9._id_7ABB;
        var_4.v["damage"] = var_9._id_7981;
        var_4.v["damage_radius"] = var_9._id_7AB2;
        var_4.v["soundalias"] = var_9._id_7ACB;
        var_4.v["repeat"] = var_9._id_7AB6;
        var_4.v["delay_min"] = var_9._id_798E;
        var_4.v["delay_max"] = var_9._id_798D;
        var_4.v["target"] = var_9._not_team;
        var_4.v["ender"] = var_9._id_79B8;
        var_4.v["physics"] = var_9._id_7AA0;
        var_4.v["type"] = "exploder";

        if ( !isdefined( var_9.script_fxid ) )
            var_4.v["fxid"] = "No FX";
        else
            var_4.v["fxid"] = var_9.script_fxid;

        var_4.v["exploder"] = var_9._id_79BF;

        if ( isdefined( level._id_241A ) )
        {
            var_10 = level._id_241A[var_4.v["exploder"]];

            if ( !isdefined( var_10 ) )
                var_10 = [];

            var_10[var_10.size] = var_4;
            level._id_241A[var_4.v["exploder"]] = var_10;
        }

        if ( !isdefined( var_4.v["delay"] ) )
            var_4.v["delay"] = 0;

        if ( isdefined( var_9._not_team ) )
        {
            var_11 = getentarray( var_4.v["target"], "targetname" )[0];

            if ( isdefined( var_11 ) )
            {
                var_12 = var_11.origin;
                var_4.v["angles"] = vectortoangles( var_12 - var_4.v["origin"] );
            }
            else
            {
                var_11 = common_scripts\utility::_id_3E89( var_4.v["target"] );

                if ( isdefined( var_11 ) )
                {
                    var_12 = var_11.origin;
                    var_4.v["angles"] = vectortoangles( var_12 - var_4.v["origin"] );
                }
            }
        }

        if ( !isdefined( var_9.code_classname ) )
        {
            var_4.motiontrackerenabled = var_9;

            if ( isdefined( var_4.motiontrackerenabled._id_7A3C ) )
                precachemodel( var_4.motiontrackerenabled._id_7A3C );
        }
        else if ( var_9.code_classname == "script_brushmodel" || isdefined( var_9.motiontrackerenabled ) )
        {
            var_4.motiontrackerenabled = var_9;
            var_4.motiontrackerenabled._id_2B34 = var_9._id_79A0;
        }

        if ( isdefined( var_9.teambalanced ) && isdefined( var_8[var_9.teambalanced] ) )
            var_4.v["exploder_type"] = var_9.teambalanced;
        else if ( isdefined( var_9.teambalanced ) && issubstr( var_9.teambalanced, "exploderanim" ) )
            var_4.v["exploder_type"] = "exploderanim";
        else
            var_4.v["exploder_type"] = "normal";

        if ( isdefined( var_9._id_59D6 ) )
        {
            var_4.v["masked_exploder"] = var_9.motiontrackerenabled;
            var_4.v["masked_exploder_spawnflags"] = var_9.specialgrenade;
            var_4.v["masked_exploder_script_disconnectpaths"] = var_9._id_79A0;
            var_9 delete();
        }

        var_4 common_scripts\_createfx::_id_6E6D();
    }

    if ( level._id_2409 && getdvar( "createfx_exploder_waittime" ) == "" )
        setdvar( "createfx_exploder_waittime", 3 );
}

_id_8103()
{
    waitframe;
    waitframe;
    waitframe;
    var_0 = [];

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2.v["type"] != "exploder" )
            continue;

        var_3 = var_2.v["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == "nil" )
            var_2.v["flag"] = undefined;

        var_0[var_3] = 1;
    }

    foreach ( var_7, var_6 in var_0 )
        thread _id_352E( var_7 );
}

_id_352E( var_0 )
{
    if ( !common_scripts\utility::_id_3839( var_0 ) )
        common_scripts\utility::_id_383D( var_0 );

    common_scripts\utility::_id_384A( var_0 );

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2.v["type"] != "exploder" )
            continue;

        var_3 = var_2.v["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 != var_0 )
            continue;

        var_2 common_scripts\utility::_id_06FD();
    }
}

_id_3531( var_0 )
{
    return isdefined( var_0.teambalanced ) && var_0.teambalanced == "exploder";
}

_id_3532( var_0 )
{
    return var_0.motiontrackerenabled == "fx" && ( !isdefined( var_0.teambalanced ) || var_0.teambalanced != "exploderchunk" );
}

_id_3530( var_0 )
{
    return isdefined( var_0.teambalanced ) && var_0.teambalanced == "exploderchunk";
}

exploder_model_is_anim_model( var_0 )
{
    return isdefined( var_0.teambalanced ) && issubstr( var_0.teambalanced, "exploderanim" );
}

_id_84CF( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !_id_3532( var_3.motiontrackerenabled ) && !_id_3531( var_3.motiontrackerenabled ) && !_id_3530( var_3.motiontrackerenabled ) )
                    var_3.motiontrackerenabled show();

                if ( isdefined( var_3._id_1820 ) )
                    var_3.motiontrackerenabled show();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3.motiontrackerenabled ) )
            {
                if ( !_id_3532( var_3.motiontrackerenabled ) && !_id_3531( var_3.motiontrackerenabled ) && !_id_3530( var_3.motiontrackerenabled ) )
                    var_3.motiontrackerenabled show();

                if ( isdefined( var_3._id_1820 ) )
                    var_3.motiontrackerenabled show();
            }
        }
    }
}

_id_8E7F( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !isdefined( var_3._id_587B ) )
                    continue;

                var_3._id_587B delete();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( !isdefined( var_3._id_587B ) )
                continue;

            var_3._id_587B delete();
        }
    }
}

_id_3D60( var_0 )
{
    var_0 += "";
    var_1 = [];

    if ( isdefined( level._id_241A ) )
    {
        var_2 = level._id_241A[var_0];

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }
    else
    {
        foreach ( var_4 in level._id_2417 )
        {
            if ( var_4.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_4.v["exploder"] ) )
                continue;

            if ( var_4.v["exploder"] + "" != var_0 )
                continue;

            var_1[var_1.size] = var_4;
        }
    }

    return var_1;
}

_id_4850( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3.motiontrackerenabled ) )
                    var_3.motiontrackerenabled hide();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3.motiontrackerenabled ) )
                var_3.motiontrackerenabled hide();
        }
    }
}

_id_280E( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3.motiontrackerenabled ) )
                    var_3.motiontrackerenabled delete();
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3.motiontrackerenabled ) )
                var_3.motiontrackerenabled delete();
        }
    }

    level notify( "killexplodertridgers" + var_0 );
}

_id_352B()
{
    if ( isdefined( self.v["delay"] ) )
        var_0 = self.v["delay"];
    else
        var_0 = 0;

    if ( isdefined( self.v["damage_radius"] ) )
        var_1 = self.v["damage_radius"];
    else
        var_1 = 128;

    var_2 = self.v["damage"];
    var_3 = self.v["origin"];
    wait(var_0);

    if ( isdefined( level._id_254E ) )
        [[ level._id_254E ]]( var_3, var_1, var_2 );
    else
        radiusdamage( var_3, var_1, var_2, var_2 );
}

_id_06FE()
{
    if ( isdefined( self.v["firefx"] ) )
        thread _id_37AD();

    if ( isdefined( self.v["fxid"] ) && self.v["fxid"] != "No FX" )
        thread _id_1AD3();
    else if ( isdefined( self.v["soundalias"] ) && self.v["soundalias"] != "nil" )
        thread _id_889C();

    if ( isdefined( self.v["loopsound"] ) && self.v["loopsound"] != "nil" )
        thread _id_301C();

    if ( isdefined( self.v["damage"] ) )
        thread _id_352B();

    if ( isdefined( self.v["earthquake"] ) )
        thread _id_352D();

    if ( isdefined( self.v["rumble"] ) )
        thread _id_3536();

    if ( self.v["exploder_type"] == "exploderanim" )
        thread exploder_anim();
    else if ( self.v["exploder_type"] == "exploder" )
        thread _id_181F();
    else if ( self.v["exploder_type"] == "exploderchunk" || self.v["exploder_type"] == "exploderchunk visible" )
        thread _id_1821();
    else
        thread _id_181E();
}

_id_181E()
{
    var_0 = self.v["exploder"];

    if ( isdefined( self.v["delay"] ) && self.v["delay"] >= 0 )
        wait(self.v["delay"]);
    else
        wait 0.05;

    if ( !isdefined( self.motiontrackerenabled ) )
        return;

    if ( isdefined( self.motiontrackerenabled.classname ) )
    {
        if ( common_scripts\utility::_id_51AE() && self.motiontrackerenabled.specialgrenade & 1 )
            self.motiontrackerenabled call [[ level._id_214E ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;

        if ( isdefined( self.motiontrackerenabled ) && isdefined( self.motiontrackerenabled.classname ) )
        {
            self.motiontrackerenabled hide();
            self.motiontrackerenabled notsolid();
        }

        var_1 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_1);
        self._id_3527 = undefined;

        if ( isdefined( self.motiontrackerenabled ) && isdefined( self.motiontrackerenabled.classname ) )
        {
            self.motiontrackerenabled show();
            self.motiontrackerenabled solid();
        }

        return;
    }

    if ( !isdefined( self.v["fxid"] ) || self.v["fxid"] == "No FX" )
        self.v["exploder"] = undefined;

    waitframe;

    if ( isdefined( self.motiontrackerenabled ) && isdefined( self.motiontrackerenabled.classname ) )
        self.motiontrackerenabled delete();
}

_id_1821()
{
    if ( isdefined( self.v["delay"] ) )
        wait(self.v["delay"]);

    var_0 = undefined;

    if ( isdefined( self.v["target"] ) )
        var_0 = common_scripts\utility::_id_3E89( self.v["target"] );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self.motiontrackerenabled ) )
            self.motiontrackerenabled delete();

        return;
    }

    self.motiontrackerenabled show();

    if ( isdefined( self.v["delay_post"] ) )
        wait(self.v["delay_post"]);

    var_1 = self.v["origin"];
    var_2 = self.v["angles"];
    var_3 = var_0.origin;
    var_4 = var_3 - self.v["origin"];
    var_5 = var_4[0];
    var_6 = var_4[1];
    var_7 = var_4[2];
    var_8 = isdefined( self.v["physics"] );

    if ( var_8 )
    {
        var_9 = undefined;

        if ( isdefined( var_0._not_team ) )
            var_9 = var_0 common_scripts\utility::_id_3E89();

        if ( !isdefined( var_9 ) )
        {
            var_10 = var_1;
            var_11 = var_0.origin;
        }
        else
        {
            var_10 = var_0.origin;
            var_11 = ( var_9.origin - var_0.origin ) * self.v["physics"];
        }

        self.motiontrackerenabled physicslaunch( var_10, var_11 );
        return;
    }
    else
    {
        self.motiontrackerenabled rotatevelocity( ( var_5, var_6, var_7 ), 12 );
        self.motiontrackerenabled movegravity( ( var_5, var_6, var_7 ), 12 );
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;
        var_12 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_12);
        self._id_3527 = undefined;
        self.v["origin"] = var_1;
        self.v["angles"] = var_2;
        self.motiontrackerenabled hide();
        return;
    }

    self.v["exploder"] = undefined;
    wait 6;

    if ( isdefined( self.motiontrackerenabled ) )
        self.motiontrackerenabled delete();
}

_id_181F()
{
    if ( isdefined( self.v["delay"] ) )
        wait(self.v["delay"]);

    if ( !isdefined( self.motiontrackerenabled._id_7A3C ) )
    {
        self.motiontrackerenabled show();
        self.motiontrackerenabled solid();
    }
    else
    {
        var_0 = self.motiontrackerenabled common_scripts\utility::_id_8959();

        if ( isdefined( self.motiontrackerenabled.script_origin ) )
            var_0.script_origin = self.motiontrackerenabled.script_origin;

        var_0 setmodel( self.motiontrackerenabled._id_7A3C );
        var_0 show();
    }

    self._id_1820 = 1;

    if ( common_scripts\utility::_id_51AE() && !isdefined( self.motiontrackerenabled._id_7A3C ) && self.motiontrackerenabled.specialgrenade & 1 )
    {
        if ( !isdefined( self.motiontrackerenabled._id_2B34 ) )
            self.motiontrackerenabled call [[ level._id_214E ]]();
        else
            self.motiontrackerenabled call [[ level._id_2B39 ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;
        var_1 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_1);
        self._id_3527 = undefined;

        if ( !isdefined( self.motiontrackerenabled._id_7A3C ) )
        {
            self.motiontrackerenabled hide();
            self.motiontrackerenabled notsolid();
        }
    }
}

exploder_anim()
{
    var_0 = self.motiontrackerenabled;
    var_0 show();
    var_0 solid();

    if ( isdefined( var_0.specialgrenade ) && var_0.specialgrenade & 1 )
        var_0 connectpaths();

    var_0 notify( "play_exploder_anim" );
}

_id_3536()
{
    if ( !common_scripts\utility::_id_51AE() )
        return;

    _id_352C();
    level.playercardbackground playrumbleonentity( self.v["rumble"] );
}

_id_352C()
{
    if ( !isdefined( self.v["delay"] ) )
        self.v["delay"] = 0;

    var_0 = self.v["delay"];
    var_1 = self.v["delay"] + 0.001;

    if ( isdefined( self.v["delay_min"] ) )
        var_0 = self.v["delay_min"];

    if ( isdefined( self.v["delay_max"] ) )
        var_1 = self.v["delay_max"];

    if ( var_0 > 0 )
        wait(randomfloatrange( var_0, var_1 ));
}

_id_301C()
{
    if ( isdefined( self._id_5891 ) )
        self._id_5891 delete();

    var_0 = self.v["origin"];
    var_1 = self.v["loopsound"];
    _id_352C();
    self._id_5891 = common_scripts\utility::_id_697A( var_1, var_0 );
}

_id_889C()
{
    _id_301D();
}

_id_301D()
{
    var_0 = self.v["origin"];
    var_1 = self.v["soundalias"];
    _id_352C();
    common_scripts\utility::_id_69C2( var_1, var_0 );
}

_id_352D()
{
    _id_352C();
    common_scripts\utility::_id_2BBD( self.v["earthquake"], self.v["origin"] );
}

_id_3535()
{
    if ( !isdefined( self.v["soundalias"] ) || self.v["soundalias"] == "nil" )
        return;

    common_scripts\utility::_id_69C2( self.v["soundalias"], self.v["origin"] );
}

_id_37AD()
{
    var_0 = self.v["forward"];
    var_1 = self.v["up"];
    var_2 = undefined;
    var_3 = self.v["firefxsound"];
    var_4 = self.v["origin"];
    var_5 = self.v["firefx"];
    var_6 = self.v["ender"];

    if ( !isdefined( var_6 ) )
        var_6 = "createfx_effectStopper";

    var_7 = 0.5;

    if ( isdefined( self.v["firefxdelay"] ) )
        var_7 = self.v["firefxdelay"];

    _id_352C();

    if ( isdefined( var_3 ) )
        common_scripts\utility::_id_5874( var_3, var_4, ( 0.0, 0.0, 0.0 ), 1, var_6 );

    playfx( level._effect[var_5], self.v["origin"], var_0, var_1 );
}

_id_1AD3()
{
    if ( isdefined( self.v["repeat"] ) )
    {
        thread _id_3535();

        for ( var_0 = 0; var_0 < self.v["repeat"]; var_0++ )
        {
            playfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"] );
            _id_352C();
        }

        return;
    }

    if ( !isdefined( self.v["delay"] ) )
        self.v["delay"] = 0;

    if ( self.v["delay"] >= 0 )
    {
        _id_352C();
        var_1 = 0;
    }
    else
        var_1 = self.v["delay"];

    if ( isdefined( self.v["cannon_spawn_func"] ) )
        self [[ self.v["cannon_spawn_func"] ]]();
    else
        cannon_spawnfx( var_1 );

    _id_3535();
}

cannon_spawnfx( var_0 )
{
    if ( isdefined( self._id_587B ) )
        self._id_587B delete();

    self._id_587B = spawnfx( common_scripts\utility::_id_3FA8( self.v["fxid"] ), self.v["origin"], self.v["forward"], self.v["up"] );

    if ( level._id_2409 )
        setfxkillondelete( self._id_587B, 1 );

    if ( self.v["delay"] >= 0 )
        triggerfx( self._id_587B );
    else
        triggerfx( self._id_587B, var_0 );
}

_id_06F9( var_0, var_1, var_2 )
{
    var_0 += "";
    level notify( "exploding_" + var_0 );
    var_3 = 0;

    if ( isdefined( level._id_241A ) && !level._id_2409 )
    {
        var_4 = level._id_241A[var_0];

        if ( isdefined( var_4 ) )
        {
            foreach ( var_6 in var_4 )
            {
                if ( !var_6 _id_1CB9() )
                    continue;

                var_6 common_scripts\utility::_id_06FD();
                var_3 = 1;
            }
        }
    }
    else
    {
        for ( var_8 = 0; var_8 < level._id_2417.size; var_8++ )
        {
            var_6 = level._id_2417[var_8];

            if ( !isdefined( var_6 ) )
                continue;

            if ( var_6.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_6.v["exploder"] ) )
                continue;

            if ( var_6.v["exploder"] + "" != var_0 )
                continue;

            if ( !var_6 _id_1CB9() )
                continue;

            var_6 common_scripts\utility::_id_06FD();
            var_3 = 1;
        }
    }

    if ( !_id_84A8() && !var_3 )
        _id_06F5( var_0, var_1, var_2 );
}

_id_3528( var_0, var_1, var_2 )
{
    [[ level._id_05B2._id_3539 ]]( var_0, var_1, var_2 );
}

_id_5309( var_0 )
{
    var_1 = _id_3F8E( var_0 );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_587B ) )
                setfxkillondelete( var_3._id_587B, 1 );
        }

        waittillframeend;

        foreach ( var_3 in var_1 )
            var_3 common_scripts\utility::_id_671F();
    }
}

_id_1CB9()
{
    var_0 = self;

    if ( isdefined( var_0.v["platform"] ) && isdefined( level.currentgen ) )
    {
        var_1 = var_0.v["platform"];

        if ( var_1 == "cg" && !level.currentgen || var_1 == "ng" && !level.nextreadghosts1 )
            return 0;
    }

    return 1;
}

_id_06F5( var_0, var_1, var_2 )
{
    if ( !_id_509A( var_0 ) )
        return;

    var_3 = int( var_0 );
    activateclientexploder( var_3, var_1, var_2 );
}

_id_262B( var_0, var_1, var_2 )
{
    if ( !_id_509A( var_0 ) )
        return;

    var_3 = int( var_0 );
    stopclientexploder( var_3, var_1, var_2 );
}

_id_509A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0;

    if ( isstring( var_0 ) )
    {
        var_1 = int( var_0 );

        if ( var_1 == 0 && var_0 != "0" )
            return 0;
    }

    return var_1 >= 0;
}

_id_84A8()
{
    if ( common_scripts\utility::_id_51AE() )
        return 1;

    if ( !isdefined( level._id_2409 ) )
        level._id_2409 = getdvar( "createfx" ) != "";

    if ( level._id_2409 )
        return 1;
    else
        return getdvar( "clientSideEffects" ) != "1";
}

_id_352A( var_0, var_1, var_2 )
{
    waitframe;
    waitframe;
    _id_06F9( var_0, var_1, var_2 );
}

_id_3529( var_0, var_1, var_2 )
{
    _id_06F9( var_0, var_1, var_2 );
}
