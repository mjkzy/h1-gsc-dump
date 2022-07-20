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

_id_4CFA()
{
    level._id_480C = ::_id_47BE;
    level._id_1D61 = ::_id_1D5C;
    level._id_1D60 = ::_id_1D5B;
}

_id_1D5B()
{
    self notify( "mg_off" );
}

_id_1D5C()
{
    self endon( "death" );
    self endon( "mg_off" );
    var_0 = cos( 55 );

    while ( self.helmet > 0 )
    {
        var_1 = _id_3F7F( 16000, var_0, 1, 1 );

        if ( isdefined( var_1 ) )
            thread _id_83F0( var_1 );

        wait 2;
    }
}

_id_47BE( var_0 )
{
    var_1 = getent( var_0._id_7A26, "script_linkname" );
    var_2 = !isdefined( var_1 );

    if ( !isdefined( var_1 ) )
        var_1 = common_scripts\utility::_id_40FB( var_0._id_7A26, "script_linkname" );

    var_3 = var_0._id_79CF;

    if ( var_2 )
        var_1 = var_1 common_scripts\utility::_id_8959();

    switch ( var_3 )
    {
        case "zippy_burst":
            wait 1;
            _id_37BA( "hind_zippy", 1, var_1 );
            wait 0.1;
            _id_37BA( "hind_zippy", 1, var_1 );
            wait 0.2;
            _id_37BA( "hind_zippy", 1, var_1 );
            wait 0.3;
            _id_37BA( "hind_zippy", 1, var_1 );
            wait 0.3;
            _id_37BA( "hind_zippy", 1, var_1 );
            break;
        case "apache_zippy":
            var_4 = [ 0.1, 0.2, 0.3 ];
            wait 1;
            var_1.origin += ( 0, 0, -150 );
            var_1 moveto( var_1.origin + ( 0, 0, 150 ), 0.6, 0, 0 );

            foreach ( var_6 in var_4 )
            {
                if ( !isdefined( self ) )
                    continue;

                _id_37BA( "apache_zippy", 1, var_1 );
                wait(var_6);
            }

            break;
        case "hind_rpg":
            _id_37BA( "hind_rpg", 5, var_1, 0.3 );
            break;
        default:
            if ( self.classname == "script_vehicle_littlebird_armed" || self.classname == "script_vehicle_littlebird_md500" )
                vehicle_scripts\_attack_heli::_id_47BD( var_1, 2, 0.25 );
            else
                _id_37BA( "hind_zippy", 5, var_1, 0.3 );

            break;
    }

    if ( var_2 )
        var_1 delete();
}

_id_4233()
{
    if ( !isdefined( self.visionsetnaked ) )
        return;

    var_0 = 0;

    if ( self.visionsetnaked == "hind" || self.visionsetnaked == "hind_blackice" || self.visionsetnaked == "ny_harbor_hind" )
        var_0 = 1;

    if ( self.visionsetnaked == "cobra" || self.visionsetnaked == "cobra_player" )
    {
        thread _id_0E07( "chopperpilot_hellfire", "cobra_Sidewinder" );

        if ( isdefined( self._id_3AE1 ) )
            self._id_3AE1 thread _id_0E07( "chopperpilot_hellfire", "cobra_Sidewinder" );

        var_0 = 1;
    }

    if ( !var_0 )
        return;

    level thread _id_389B( self );
    level thread maps\_helicopter_ai::_id_33BF( self );

    if ( getdvar( "cobrapilot_wingman_enabled" ) == "1" )
    {
        if ( isdefined( self._id_7B25 ) )
        {
            level._id_A33F = self;
            level thread maps\_helicopter_ai::_id_A341( self );
        }
    }
}

_id_389B( var_0 )
{
    var_0 endon( "death" );
    notifyoncommand( "flare_button", "+frag" );
    notifyoncommand( "flare_button", "+usereload" );
    notifyoncommand( "flare_button", "+activate" );

    while ( var_0.helmet > 0 )
    {
        if ( isdefined( var_0._id_6C7E ) )
            var_0._id_6820 waittill( "flare_button" );
        else
        {
            var_0 waittill( "incomming_missile", var_1 );

            if ( !isdefined( var_1 ) )
                continue;

            if ( randomint( 3 ) == 0 )
                continue;

            wait(randomfloatrange( 0.5, 1.0 ));
        }

        thread _id_3896( var_0 );
        wait 3.0;
    }
}

_id_3897( var_0, var_1, var_2, var_3 )
{
    var_4 = 1;

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        playfx( level._id_3891[var_0.visionsetnaked], var_0 gettagorigin( "tag_flare" ) );

        if ( isdefined( var_0._id_6C7E ) )
        {
            level._id_8D77["flares_used"]++;
            var_0 notify( "dropping_flares" );

            if ( var_4 )
                var_0 playsound( "cobra_flare_fire" );

            var_4 = !var_4;
        }

        if ( var_5 <= var_2 - 1 )
            thread _id_389A( var_0, var_3 );

        wait 0.1;
    }
}

_id_3896( var_0 )
{
    var_0 endon( "death" );
    var_1 = 5.0;

    if ( isdefined( var_0._id_3890 ) )
        var_1 = var_0._id_3890;

    _id_3897( var_0, 8, 1, var_1 );
}

_id_23CD()
{
    if ( isdefined( self._id_5CB4 ) )
        missile_deleteattractor( self._id_5CB4 );

    self._id_5CB4 = missile_createattractorent( self._id_1C15, 10000, 10000 );
}

_id_389A( var_0, var_1 )
{
    var_0 notify( "flares_out" );
    var_0 endon( "death" );
    var_0 endon( "flares_out" );

    if ( !isdefined( var_1 ) )
        var_1 = 5.0;

    var_2 = _id_3898( var_0 );
    var_3 = spawn( "script_origin", var_0 gettagorigin( "tag_flare" ) );
    var_3 movegravity( var_2, var_1 );
    var_4 = undefined;

    if ( isdefined( var_0._id_6C7E ) )
    {
        if ( isdefined( var_0._id_5CB4 ) )
            missile_deleteattractor( var_0._id_5CB4 );

        var_4 = missile_createattractorent( var_3, 10000, 10000 );
    }

    if ( isdefined( var_0._id_4C2D ) )
    {
        for ( var_5 = 0; var_5 < var_0._id_4C2D.size; var_5++ )
            var_0._id_4C2D[var_5] _meth_81dc( var_3 );
    }

    wait(var_1);

    if ( isdefined( var_0._id_6C7E ) )
    {
        if ( isdefined( var_4 ) )
            missile_deleteattractor( var_4 );

        var_0 thread _id_23CD();
    }

    if ( !isdefined( var_0._id_7AED ) )
        var_0._id_7AED = 0;

    var_6 = ( 0, 0, var_0._id_7AED );

    if ( !isdefined( var_0._id_4C2D ) )
        return;

    for ( var_5 = 0; var_5 < var_0._id_4C2D.size; var_5++ )
        var_0._id_4C2D[var_5] _meth_81dc( var_0, var_6 );
}

_id_3898( var_0 )
{
    var_1 = var_0.origin;
    wait 0.05;
    var_2 = var_0.origin - var_1;
    return var_2 * 20;
}

_id_5C8F( var_0, var_1 )
{
    var_1 endon( "death" );
    var_0 waittill( "death" );

    if ( !isdefined( var_1._id_4C2D ) )
        return;

    var_1._id_4C2D = common_scripts\utility::_id_0CF6( var_1._id_4C2D, var_0 );
}

_id_3F7F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    var_7 = [];
    var_8 = undefined;
    var_9 = common_scripts\utility::_id_3D4F( self._id_7AEF );
    var_10 = [];

    if ( var_4 )
    {
        for ( var_11 = 0; var_11 < level._id_9D7A[var_9].size; var_11++ )
            var_10[var_10.size] = level._id_9D7A[var_9][var_11];
    }

    if ( var_2 )
    {
        var_12 = getaiarray( var_9 );

        for ( var_11 = 0; var_11 < var_12.size; var_11++ )
        {
            if ( isdefined( var_12[var_11]._id_4BB2 ) )
                continue;

            var_10[var_10.size] = var_12[var_11];
        }

        if ( var_9 == "allies" )
        {
            for ( var_11 = 0; var_11 < level.players.size; var_11++ )
                var_10[var_10.size] = level.players[var_11];
        }
    }

    if ( isdefined( var_6 ) )
        var_10 = maps\_utility::_id_0CE7( var_10, var_6 );

    if ( var_5 )
        var_10 = common_scripts\utility::_id_0CF5( var_10 );

    var_13 = anglestoforward( self.angles );

    for ( var_11 = 0; var_11 < var_10.size; var_11++ )
    {
        if ( issentient( var_10[var_11] ) && issentient( self ) && self getthreatbiasgroup() != "" )
        {
            var_14 = getthreatbias( var_10[var_11] getthreatbiasgroup(), self getthreatbiasgroup() );

            if ( var_14 <= -1000000 )
                continue;
        }

        if ( isdefined( var_0 ) && var_0 > 0 )
        {
            if ( distance( self.origin, var_10[var_11].origin ) > var_0 )
                continue;
        }

        if ( isdefined( var_1 ) )
        {
            var_15 = vectornormalize( var_10[var_11].origin - self.origin );
            var_16 = vectordot( var_13, var_15 );

            if ( var_16 <= var_1 )
                continue;
        }

        if ( var_3 )
        {
            var_17 = 0;

            if ( isai( var_10[var_11] ) )
                var_18 = 48;
            else
                var_18 = 150;

            var_17 = sighttracepassed( self.origin, var_10[var_11].origin + ( 0, 0, var_18 ), 0, self );

            if ( !var_17 )
                continue;
        }

        var_7[var_7.size] = var_10[var_11];
    }

    if ( var_7.size == 0 )
    {
        self notify( "gunner_new_target", var_8 );
        return var_8;
    }

    if ( var_7.size == 1 )
    {
        self notify( "gunner_new_target", var_7[0] );
        return var_7[0];
    }

    var_19 = common_scripts\utility::_id_3F33( self.origin, var_7 );
    self notify( "gunner_new_target", var_19 );
    return var_19;
}

_id_83F0( var_0 )
{
    self endon( "death" );
    self endon( "mg_off" );
    var_0 endon( "death" );
    self endon( "gunner_new_target" );

    if ( isdefined( self._id_6C7E ) )
        self endon( "gunner_stop_firing" );

    var_1 = ( 0, 0, 0 );

    if ( isdefined( var_0._id_7AED ) )
        var_1 += ( 0, 0, var_0._id_7AED );
    else if ( issentient( var_0 ) )
        var_1 = ( 0, 0, 32 );

    self setturrettargetent( var_0, var_1 );

    while ( self.helmet > 0 )
    {
        var_2 = randomintrange( 1, 25 );

        if ( getdvar( "cobrapilot_debug" ) == "1" )
            iprintln( "randomShots = " + var_2 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            if ( isdefined( self._id_6C7E ) )
            {
                if ( isdefined( level._id_1FFF ) && level._id_1FFF.size > 0 )
                    self setvehweapon( level._id_4478 );
            }

            thread _id_83F1( self, "tag_turret", var_0, var_1, ( 1, 1, 0 ), 0.05 );
            self fireweapon( "tag_flash" );

            if ( isdefined( self._id_6C7E ) )
                self setvehweapon( level._id_1FFF[self._id_6820._id_252D].v["weapon"] );

            wait 0.05;
        }

        wait(randomfloatrange( 0.25, 2.5 ));
    }
}

_id_83F1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( getdvar( "cobrapilot_debug" ) != "1" )
        return;

    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_2 endon( "death" );
    self endon( "gunner_new_target" );

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( isdefined( var_5 ) )
    {
        var_5 = gettime() + var_5 * 1000;

        while ( gettime() < var_5 )
            wait 0.05;
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}

_id_0E07( var_0, var_1, var_2, var_3 )
{
    self._id_471C = 1;
    var_4 = [];
    var_4[0] = var_0;

    if ( isdefined( var_1 ) )
        var_4[1] = var_1;

    if ( isdefined( var_2 ) )
        var_4[2] = var_2;

    if ( isdefined( var_3 ) )
        var_4[3] = var_3;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        for ( var_6 = 0; var_6 < level._id_1FFD[var_4[var_5]].size; var_6++ )
            self attach( level._id_1FFC[var_4[var_5]], level._id_1FFD[var_4[var_5]][var_6] );
    }
}

_id_37BA( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_5 = undefined;
    var_6 = undefined;
    var_7 = "cobra_20mm";
    var_8 = [];

    switch ( var_0 )
    {
        case "f15_missile":
            var_5 = "cobra_Sidewinder";
            var_8[0] = "le_side_wing_jnt";
            var_8[1] = "ri_side_wing_jnt";
            break;
        case "mi28_seeker":
            var_5 = "cobra_seeker";
            var_8[0] = "tag_store_L_1_a";
            var_8[1] = "tag_store_R_1_a";
            var_8[2] = "tag_store_L_2_a";
            var_8[3] = "tag_store_R_2_a";
            break;
        case "ffar":
            var_5 = "cobra_FFAR";
            var_8[0] = "tag_store_r_2";
            break;
        case "seeker":
            var_5 = "cobra_seeker";
            var_8[0] = "tag_store_r_2";
            break;
        case "ffar_bog_a_lite":
            var_5 = "cobra_ffar_bog_a_lite";
            var_8[0] = "tag_store_r_2";
            break;
        case "ffar_airlift":
            var_5 = "cobra_ffar_airlift";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "ffar_airlift_map_overwrite":
            var_5 = "cobra_ffar_airlift_map_overwrite";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "ffar_airlift_nofx":
            var_5 = "cobra_ffar_airlift_nofx";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "cobra_zippy":
            var_5 = "zippy_rockets";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "apache_zippy":
            var_5 = "zippy_rockets_apache";
            var_8[0] = "tag_flash_2";
            var_8[1] = "tag_flash_3";
            break;
        case "apache_zippy_nd":
            var_5 = "zippy_rockets_apache_nodamage";
            var_8[0] = "tag_flash_2";
            var_8[1] = "tag_flash_3";
            break;
        case "mi28_zippy":
            var_5 = "zippy_rockets_apache";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "mi28_zippy_cheap":
            var_5 = "zippy_rockets_apache_cheap";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "cobra_turret":
            var_5 = "hind_turret_penetration";
            var_8[0] = "tag_store_L_wing";
            var_8[1] = "tag_store_R_wing";
            break;
        case "ffar_hind":
            var_7 = "hind_turret";
            var_5 = "hind_ffar";
            var_8[0] = "tag_missile_left";
            var_8[1] = "tag_missile_right";
            break;
        case "hind_zippy":
            var_7 = "hind_turret";
            var_5 = "zippy_rockets";
            var_8[0] = "tag_missile_left";
            var_8[1] = "tag_missile_right";
            break;
        case "hind_rpg":
            var_7 = "hind_turret";
            var_5 = "rpg";
            var_8[0] = "tag_missile_left";
            var_8[1] = "tag_missile_right";
            break;
        case "hind_rpg_cheap":
            var_7 = "hind_turret";
            var_5 = "rpg_cheap";
            var_8[0] = "tag_missile_left";
            var_8[1] = "tag_missile_right";
            break;
        case "ffar_hind_nodamage":
            var_7 = "hind_turret";
            var_5 = "hind_FFAR_nodamage";
            var_8[0] = "tag_missile_left";
            var_8[1] = "tag_missile_right";
            break;
        case "ffar_mi28_village_assault":
            var_7 = "hind_turret";
            var_5 = "mi28_ffar_village_assault";
            var_8[0] = "tag_store_L_2_a";
            var_8[1] = "tag_store_R_2_a";
            var_8[2] = "tag_store_L_2_b";
            var_8[3] = "tag_store_R_2_b";
            var_8[4] = "tag_store_L_2_c";
            var_8[5] = "tag_store_R_2_c";
            var_8[6] = "tag_store_L_2_d";
            var_8[7] = "tag_store_R_2_d";
            break;
        case "ffar_co_rescue":
            var_5 = "cobra_ffar_bog_a_lite";
            var_8[0] = "tag_store_R_2_a";
            var_8[1] = "tag_store_L_2_a";
            break;
        default:
            break;
    }

    var_6 = weaponfiretime( var_5 );

    if ( isdefined( self._id_60D5 ) )
        var_9 = self._id_60D5;
    else
        var_9 = -1;

    for ( var_10 = 0; var_10 < var_1; var_10++ )
    {
        var_9++;
        var_9 %= var_8.size;

        if ( var_0 == "ffar_mi28_village_assault" )
        {
            if ( isdefined( var_2 ) && isdefined( var_2.origin ) )
            {
                var_11 = self gettagorigin( var_8[var_9] );
                var_12 = vectornormalize( var_2.origin - var_11 );
                var_12 *= 50;
                magicbullet( var_5, var_11 + var_12, var_2.origin );

                if ( isdefined( level._effect["ffar_mi28_muzzleflash"] ) )
                    playfxontag( common_scripts\utility::_id_3FA8( "ffar_mi28_muzzleflash" ), self, var_8[var_9] );

                thread _id_27D9( 0.1, 0.5, 0.2, var_2.origin, 1600 );
            }
        }
        else
        {
            self setvehweapon( var_5 );

            if ( isdefined( var_2 ) )
            {
                var_13 = self fireweapon( var_8[var_9], var_2 );
                soundscripts\_audio::_id_28A2( "missile_fired", var_13 );

                switch ( var_0 )
                {
                    case "ffar":
                    case "ffar_bog_a_lite":
                        var_13 thread maps\_utility::_id_69C5( "weap_lau61c_fire", undefined, 1 );
                    case "ffar_airlift":
                    case "ffar_airlift_map_overwrite":
                        var_13 thread _id_5CBE( 0.1 );
                        break;
                    case "apache_zippy":
                    case "apache_zippy_nd":
                    case "mi28_zippy":
                    case "mi28_zippy_cheap":
                    case "apache_zippy_wall":
                        if ( !isdefined( var_4 ) )
                            var_13 thread _id_5CBE( 0.6 );
                        else
                            var_13 thread _id_5CBE( var_4 );

                        break;
                    default:
                        break;
                }
            }
            else
                var_13 = self fireweapon( var_8[var_9] );

            self notify( "missile_fired", var_13 );
        }

        self._id_60D5 = var_9;

        if ( var_10 < var_1 - 1 )
            wait(var_6);

        if ( isdefined( var_3 ) )
            wait(var_3);
    }

    self setvehweapon( var_7 );
}

_id_27D9( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_0);
    earthquake( var_1, var_2, var_3, var_4 );
}

_id_5CBE( var_0 )
{
    self endon( "death" );
    wait(var_0);

    if ( isdefined( self ) )
        self _meth_81de();
}
