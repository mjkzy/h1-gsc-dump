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
    level._id_67CD = [];
    level._id_8A3C = "specialty_pistoldeath";
    level._id_8A3A = "specialty_s1_temp";
    level._id_8A3B = "specialty_s1_temp";
    level._id_8A3D = "specialty_s1_temp";
    precacheshader( level._id_8A3C );
    level._id_7B45 = [];
    level._id_67D1 = [];
    level._id_67D5 = [];
    level._id_7B45["specialty_blastshield"] = 1;
    level._id_7B45["specialty_blastshield2"] = 1;
    level._id_7B45["specialty_akimbo"] = 1;
    level._id_7B45["specialty_falldamage"] = 1;
    level._id_7B45["specialty_shield"] = 1;
    level._id_7B45["specialty_feigndeath"] = 1;
    level._id_7B45["specialty_shellshock"] = 1;
    level._id_7B45["specialty_delaymine"] = 1;
    level._id_7B45["specialty_localjammer"] = 1;
    level._id_7B45["specialty_thermal"] = 1;
    level._id_7B45["specialty_blackbox"] = 1;
    level._id_7B45["specialty_steelnerves"] = 1;
    level._id_7B45["specialty_flashgrenade"] = 1;
    level._id_7B45["specialty_smokegrenade"] = 1;
    level._id_7B45["specialty_concussiongrenade"] = 1;
    level._id_7B45["specialty_saboteur"] = 1;
    level._id_7B45["specialty_endgame"] = 1;
    level._id_7B45["specialty_rearview"] = 1;
    level._id_7B45["specialty_hardline"] = 1;
    level._id_7B45["specialty_onemanarmy"] = 1;
    level._id_7B45["specialty_primarydeath"] = 1;
    level._id_7B45["specialty_secondarybling"] = 1;
    level._id_7B45["specialty_explosivedamage"] = 1;
    level._id_7B45["specialty_laststandoffhand"] = 1;
    level._id_7B45["specialty_dangerclose"] = 1;
    level._id_7B45["specialty_hardjack"] = 1;
    level._id_7B45["specialty_extraspecialduration"] = 1;
    level._id_7B45["specialty_rollover"] = 1;
    level._id_7B45["specialty_armorpiercing"] = 1;
    level._id_7B45["specialty_omaquickchange"] = 1;
    level._id_7B45["_specialty_rearview"] = 1;
    level._id_7B45["_specialty_onemanarmy"] = 1;
    level._id_7B45["specialty_steadyaimpro"] = 1;
    level._id_7B45["specialty_stun_resistance"] = 1;
    level._id_7B45["specialty_double_load"] = 1;
    level._id_7B45["specialty_regenspeed"] = 1;
    level._id_7B45["specialty_twoprimaries"] = 1;
    level._id_7B45["specialty_autospot"] = 1;
    level._id_7B45["specialty_overkillpro"] = 1;
    level._id_7B45["specialty_anytwo"] = 1;
    level._id_7B45["specialty_fasterlockon"] = 1;
    level._id_7B45["specialty_paint"] = 1;
    level._id_7B45["specialty_paint_pro"] = 1;
    level._id_7B45["specialty_silentkill"] = 1;
    level._id_7B45["specialty_crouchmovement"] = 1;
    level._id_7B45["specialty_personaluav"] = 1;
    level._id_7B45["specialty_unwrapper"] = 1;
    level._id_7B45["specialty_class_blindeye"] = 1;
    level._id_7B45["specialty_class_lowprofile"] = 1;
    level._id_7B45["specialty_class_coldblooded"] = 1;
    level._id_7B45["specialty_class_hardwired"] = 1;
    level._id_7B45["specialty_class_scavenger"] = 1;
    level._id_7B45["specialty_class_hoarder"] = 1;
    level._id_7B45["specialty_class_gungho"] = 1;
    level._id_7B45["specialty_class_steadyhands"] = 1;
    level._id_7B45["specialty_class_hardline"] = 1;
    level._id_7B45["specialty_class_peripherals"] = 1;
    level._id_7B45["specialty_class_quickdraw"] = 1;
    level._id_7B45["specialty_class_toughness"] = 1;
    level._id_7B45["specialty_class_lightweight"] = 1;
    level._id_7B45["specialty_class_engineer"] = 1;
    level._id_7B45["specialty_class_dangerclose"] = 1;
    level._id_7B45["specialty_horde_weaponsfree"] = 1;
    level._id_7B45["specialty_horde_dualprimary"] = 1;
    level._id_7B45["specialty_marksman"] = 1;
    level._id_7B45["specialty_sharp_focus"] = 1;
    level._id_7B45["specialty_moredamage"] = 1;
    level._id_7B45["specialty_copycat"] = 1;
    level._id_7B45["specialty_finalstand"] = 1;
    level._id_7B45["specialty_juiced"] = 1;
    level._id_7B45["specialty_light_armor"] = 1;
    level._id_7B45["specialty_stopping_power"] = 1;
    level._id_7B45["specialty_uav"] = 1;
    level._id_7B45["h1_concussiongrenade_mp"] = 1;
    level._id_7B45["h1_flashgrenade_mp"] = 1;
    level._id_7B45["h1_fraggrenade_mp"] = 1;
    level._id_7B45["h1_smokegrenade_mp"] = 1;
    level._id_7B45["bouncingbetty_mp"] = 1;
    level._id_7B45["c4_mp"] = 1;
    level._id_7B45["claymore_mp"] = 1;
    level._id_7B45["frag_grenade_mp"] = 1;
    level._id_7B45["rpg_mp"] = 1;
    level._id_7B45["concussion_grenade_mp"] = 1;
    level._id_7B45["flash_grenade_mp"] = 1;
    level._id_7B45["smoke_grenade_mp"] = 1;
    level._id_7B45["portable_radar_mp"] = 1;
    level._id_7B45["scrambler_mp"] = 1;
    level._id_7B45["trophy_mp"] = 1;
    level._id_7B45["specialty_wildcard_perkslot1"] = 1;
    level._id_7B45["specialty_wildcard_perkslot2"] = 1;
    level._id_7B45["specialty_wildcard_perkslot3"] = 1;
    level._id_7B45["specialty_wildcard_primaryattachment"] = 1;
    level._id_7B45["specialty_wildcard_secondaryattachment"] = 1;
    level._id_7B45["specialty_wildcard_extrastreak"] = 1;
    level._id_7B45["specialty_extraammo"] = 1;
    level._id_7B45["specialty_bulletdamage"] = 1;
    level._id_7B45["specialty_armorvest"] = 1;
    level._id_7B45["specialty_twoprimaries"] = 1;
    level._id_7B45["specialty_explosivedamage"] = 1;
    level._id_7B45["specialty_null"] = 1;
    level._id_67D1["specialty_blastshield"] = maps\mp\perks\_perkfunctions::_id_7F30;
    level._id_67D5["specialty_blastshield"] = maps\mp\perks\_perkfunctions::_id_9A64;
    level._id_67D1["specialty_falldamage"] = maps\mp\perks\_perkfunctions::_id_7F77;
    level._id_67D5["specialty_falldamage"] = maps\mp\perks\_perkfunctions::_id_9A73;
    level._id_67D1["specialty_localjammer"] = maps\mp\perks\_perkfunctions::_id_7FA4;
    level._id_67D5["specialty_localjammer"] = maps\mp\perks\_perkfunctions::_id_9A7E;
    level._id_67D1["specialty_thermal"] = maps\mp\perks\_perkfunctions::_id_802F;
    level._id_67D5["specialty_thermal"] = maps\mp\perks\_perkfunctions::_id_9A94;
    level._id_67D1["specialty_blackbox"] = maps\mp\perks\_perkfunctions::_id_7F2F;
    level._id_67D5["specialty_blackbox"] = maps\mp\perks\_perkfunctions::_id_9A63;
    level._id_67D1["specialty_lightweight"] = maps\mp\perks\_perkfunctions::_id_7FA3;
    level._id_67D5["specialty_lightweight"] = maps\mp\perks\_perkfunctions::_id_9A7D;
    level._id_67D1["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::_id_801C;
    level._id_67D5["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::_id_9A90;
    level._id_67D1["specialty_delaymine"] = maps\mp\perks\_perkfunctions::_id_7F4F;
    level._id_67D5["specialty_delaymine"] = maps\mp\perks\_perkfunctions::_id_9A68;
    level._id_67D1["specialty_saboteur"] = maps\mp\perks\_perkfunctions::_id_8000;
    level._id_67D5["specialty_saboteur"] = maps\mp\perks\_perkfunctions::_id_9A89;
    level._id_67D1["specialty_endgame"] = maps\mp\perks\_perkfunctions::_id_7F62;
    level._id_67D5["specialty_endgame"] = maps\mp\perks\_perkfunctions::_id_9A6B;
    level._id_67D1["specialty_rearview"] = maps\mp\perks\_perkfunctions::_id_7FFA;
    level._id_67D5["specialty_rearview"] = maps\mp\perks\_perkfunctions::_id_9A86;
    level._id_67D1["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::_id_7FCF;
    level._id_67D5["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::_id_9A81;
    level._id_67D1["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::_id_801B;
    level._id_67D5["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::_id_9A8F;
    level._id_67D1["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::_id_8020;
    level._id_67D5["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::_id_9A93;
    level._id_67D1["specialty_marksman"] = maps\mp\perks\_perkfunctions::_id_7FA8;
    level._id_67D5["specialty_marksman"] = maps\mp\perks\_perkfunctions::_id_9A7F;
    level._id_67D1["specialty_double_load"] = maps\mp\perks\_perkfunctions::_id_7F59;
    level._id_67D5["specialty_double_load"] = maps\mp\perks\_perkfunctions::_id_9A69;
    level._id_67D1["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::_id_8007;
    level._id_67D5["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::_id_9A8A;
    level._id_67D1["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::_id_7FFE;
    level._id_67D5["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::_id_9A88;
    level._id_67D1["specialty_autospot"] = maps\mp\perks\_perkfunctions::_id_7F2B;
    level._id_67D5["specialty_autospot"] = maps\mp\perks\_perkfunctions::_id_9A62;
    level._id_67D1["specialty_empimmune"] = maps\mp\perks\_perkfunctions::_id_7F60;
    level._id_67D5["specialty_empimmune"] = maps\mp\perks\_perkfunctions::_id_9A6A;
    level._id_67D1["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::_id_7FD7;
    level._id_67D5["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::_id_9A83;
    level._id_67D1["specialty_personaluav"] = maps\mp\perks\_perkfunctions::_id_7FE0;
    level._id_67D5["specialty_personaluav"] = maps\mp\perks\_perkfunctions::_id_9A85;
    level._id_67D1["specialty_crouchmovement"] = maps\mp\perks\_perkfunctions::_id_7F43;
    level._id_67D5["specialty_crouchmovement"] = maps\mp\perks\_perkfunctions::_id_9A67;
    level._id_67D1["specialty_light_armor"] = maps\mp\perks\_perkfunctions::_id_7FA0;
    level._id_67D5["specialty_light_armor"] = maps\mp\perks\_perkfunctions::_id_9A7C;
    level._id_67D1["specialty_finalstand"] = maps\mp\perks\_perkfunctions::_id_7F6D;
    level._id_67D5["specialty_finalstand"] = maps\mp\perks\_perkfunctions::_id_9A70;
    level._id_67D1["specialty_juiced"] = maps\mp\perks\_perkfunctions::_id_7F97;
    level._id_67D5["specialty_juiced"] = maps\mp\perks\_perkfunctions::_id_9A78;
    level._id_67D1["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::_id_801F;
    level._id_67D5["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::_id_9A92;
    level._id_67D1["specialty_uav"] = maps\mp\perks\_perkfunctions::_id_803B;
    level._id_67D5["specialty_uav"] = maps\mp\perks\_perkfunctions::_id_9A95;
    _id_4DF8();
    level thread _id_64C8();
}

perktablelookupgroup( var_0 )
{
    return tablelookup( "mp/perktable.csv", 1, var_0, 13 );
}

perktablelookupcount( var_0 )
{
    return int( tablelookup( "mp/perktable.csv", 1, var_0, 6 ) );
}

perktablelookupslot( var_0 )
{
    return int( tablelookup( "mp/perktable.csv", 1, var_0, 12 ) );
}

perktablelookuplocalizedname( var_0 )
{
    return tablelookupistring( "mp/perktable.csv", 1, var_0, 2 );
}

perktablelookupimage( var_0 )
{
    return tablelookup( "mp/perktable.csv", 1, var_0, 3 );
}

_id_9C4E( var_0, var_1 )
{
    if ( getdvarint( "scr_game_perks" ) == 0 )
        return "specialty_null";

    if ( var_0 == 0 )
    {
        switch ( var_1 )
        {
            case "claymore_mp":
            case "specialty_specialgrenade":
            case "specialty_extraammo":
            case "c4_mp":
            case "rpg_mp":
            case "specialty_fraggrenade":
            case "specialty_detectexplosive":
                return var_1;
            default:
                return "specialty_null";
        }
    }
    else if ( var_0 == 1 )
    {
        switch ( var_1 )
        {
            case "specialty_explosivedamage":
            case "specialty_twoprimaries":
            case "specialty_bulletdamage":
            case "specialty_armorvest":
            case "specialty_fastreload":
            case "specialty_rof":
            case "specialty_radarimmune":
                return var_1;
            default:
                return "specialty_null";
        }
    }
    else if ( var_0 == 2 )
    {
        switch ( var_1 )
        {
            case "specialty_bulletpenetration":
            case "specialty_pistoldeath":
            case "specialty_longersprint":
            case "specialty_bulletaccuracy":
            case "specialty_grenadepulldeath":
            case "specialty_holdbreath":
            case "specialty_quieter":
            case "specialty_parabolic":
                return var_1;
            default:
                return "specialty_null";
        }
    }

    return "specialty_null";
}

_id_3F7C()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 3; var_1++ )
        var_0[var_1] = "specialty_null";

    return var_0;
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
    }
}

_id_64D6()
{
    self endon( "disconnect" );
    self.perks = [];
    self.weaponlist = [];
}

_id_198D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) || !isplayer( var_1 ) || !maps\mp\_utility::_id_4FA6() && !isplayer( var_0 ) )
        return var_2;

    if ( var_1.sessionstate != "playing" || !isdefined( var_2 ) || !isdefined( var_3 ) )
        return var_2;

    if ( var_3 == "" )
        return var_2;

    var_9 = var_2;
    var_10 = var_2;

    if ( isdefined( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_bulletdamage" ) && maps\mp\_utility::_id_50CD( var_3 ) )
    {
        if ( isdefined( var_0 ) && isplayer( var_0 ) && var_0 maps\mp\_utility::_hasperk( "specialty_armorvest" ) )
            var_10 = var_9;
        else
            var_10 += var_2 * level._id_18AB;
    }
    else if ( isdefined( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_explosivedamage" ) && isexplosivedamagemod( var_3 ) )
    {
        if ( isdefined( var_0 ) && isplayer( var_0 ) && var_0 maps\mp\_utility::_hasperk( "specialty_armorvest" ) )
            var_10 = var_9;
        else
            var_10 += var_2 * level._id_3550;
    }
    else if ( isdefined( var_0 ) && isplayer( var_0 ) && var_0 maps\mp\_utility::_hasperk( "specialty_armorvest" ) )
        var_10 -= var_2 * level._id_0CD3;
    else
        var_10 = var_9;

    if ( isexplosivedamagemod( var_3 ) )
    {
        if ( maps\mp\gametypes\_weapons::_id_4C6E() )
            var_10 *= level._id_52A4;
    }

    if ( var_10 <= 1 )
    {
        var_10 = 1;
        return var_10;
    }
    else
        return int( var_10 );
}

_id_4DF8()
{
    level._id_52A4 = 0.08;
    level._id_529B = 0.08;
    level._id_0CD2 = 1.5;
    level._id_72D2 = 0.25;
    level._id_18AB = maps\mp\_utility::_id_3FDB( "perk_bulletDamage", 40 ) / 100;
    level._id_3550 = maps\mp\_utility::_id_3FDB( "perk_explosiveDamage", 25 ) / 100;
    level._id_0CD3 = maps\mp\_utility::_id_3FDB( "perk_armorVest", 25 ) / 100;
}

_id_198F()
{

}

_id_41E3()
{
    self endon( "death" );
    self endon( "disconnect" );
    maps\mp\_utility::_id_41F8( "specialty_blindeye", 0 );
    self._id_89F9 = 1;

    while ( self.avoidkillstreakonspawntimer > 0 )
    {
        self.avoidkillstreakonspawntimer -= 0.05;
        wait 0.05;
    }

    maps\mp\_utility::_unsetperk( "specialty_blindeye" );
    self._id_89F9 = 0;
}

_id_0CAF()
{
    self setviewkickscale( 1.0 );

    if ( maps\mp\_utility::_hasperk( "specialty_extended_battery" ) )
        maps\mp\_utility::_id_41F8( "specialty_exo_slamboots", 0 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_lowprofile" ) )
        maps\mp\_utility::_id_41F8( "specialty_radarimmune", 0 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_flakjacket" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_hard_shell", 0 );
        maps\mp\_utility::_id_41F8( "specialty_throwback", 0 );
        maps\mp\_utility::_id_41F8( "specialty_blastshield2", 0 );
        self._id_8A39 = maps\mp\_utility::_id_3FDB( "perk_blastShieldScale", 45 ) / 100;

        if ( isdefined( level.hardcoremode ) && level.hardcoremode )
            self._id_8A39 = maps\mp\_utility::_id_3FDB( "perk_blastShieldScale_HC", 50 ) / 100;
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_lightweight" ) )
        maps\mp\_utility::_id_41F8( "specialty_lightweight", 0 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_dangerclose" ) )
        maps\mp\_utility::_id_41F8( "specialty_explosivedamage", 0 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_blindeye" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_blindeye", 0 );
        maps\mp\_utility::_id_41F8( "specialty_plainsight", 0 );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_coldblooded" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_coldblooded", 0 );
        maps\mp\_utility::_id_41F8( "specialty_spygame", 0 );
        maps\mp\_utility::_id_41F8( "specialty_heartbreaker", 0 );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_peripherals" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_moreminimap", 0 );
        maps\mp\_utility::_id_41F8( "specialty_silentkill", 0 );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_fasthands" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_quickswap", 0 );
        maps\mp\_utility::_id_41F8( "specialty_fastoffhand", 0 );
        maps\mp\_utility::_id_41F8( "specialty_sprintreload", 0 );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_dexterity" ) )
        maps\mp\_utility::_id_41F8( "specialty_sprintfire", 0 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_hardwired" ) )
    {
        maps\mp\_utility::_id_41F8( "specialty_empimmune", 0 );
        maps\mp\_utility::_id_41F8( "specialty_stun_resistance", 0 );
        self.stunscaler = 0.1;
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_toughness" ) )
        self setviewkickscale( 0.2 );

    if ( maps\mp\_utility::_hasperk( "specialty_class_scavenger" ) )
    {
        self._id_0B7B = 0.2;
        maps\mp\_utility::_id_41F8( "specialty_scavenger", 0 );
        maps\mp\_utility::_id_41F8( "specialty_bulletresupply", 0 );
        maps\mp\_utility::_id_41F8( "specialty_extraammo", 0 );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_class_hardline" ) )
        maps\mp\_utility::_id_41F8( "specialty_hardline", 0 );
}

get_specialtydata( var_0, var_1, var_2 )
{
    var_3 = perktablelookupgroup( var_0 );
    var_4 = perktablelookupcount( var_0 );

    if ( var_1 == "specialty1" )
    {
        if ( issubstr( var_3, "grenade" ) )
        {
            if ( var_0 == "specialty_fraggrenade" )
                self.perkscustom["grenades_count"] = var_4;
            else
                self.perkscustom["grenades_count"] = 1;

            if ( var_0 == "specialty_specialgrenade" && isdefined( var_2.offhand ) && var_2.offhand != "h1_smokegrenade_mp" )
                self.perkscustom["specialgrenades_count"] = var_4;
            else
                self.perkscustom["specialgrenades_count"] = 1;

            return;
        }
        else
        {
            self.perkscustom["grenades_count"] = 1;
            self.perkscustom["specialgrenades_count"] = 1;
        }
    }

    if ( var_3 == "inventory" )
    {
        self.perkscustom["inventory"] = var_0;
        self.perkscustom["inventory_count"] = var_4;
    }
}

giveperkinventory()
{
    var_0 = self.perkscustom["inventory"];

    if ( isdefined( var_0 ) && var_0 != "" )
    {
        var_0 = "h1_" + var_0;
        self giveweapon( var_0 );
        setweaponammooverall( var_0, self.perkscustom["inventory_count"] );
        self setactionslot( 3, "weapon", var_0 );
    }
    else
        self setactionslot( 3, "altMode" );
}

setweaponammooverall( var_0, var_1 )
{
    if ( isweaponcliponly( var_0 ) )
        self setweaponammoclip( var_0, var_1 );
    else
    {
        self setweaponammoclip( var_0, var_1 );
        var_2 = var_1 - self getweaponammoclip( var_0 );
        self setweaponammostock( var_0, var_2 );
    }
}
