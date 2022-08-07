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

_id_7F43()
{
    thread _id_248D();
    _id_2483();
}

_id_248D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetCrouchMovement" );
    self notifyonplayercommand( "adjustedStance", "+stance" );
    self notifyonplayercommand( "adjustedStance", "+goStand" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;
        _id_2483();
    }
}

_id_2483()
{
    self._id_8AFB = self getstance();
    var_0 = 0;

    if ( self._id_8AFB == "crouch" )
        var_0 = self._id_247D;
    else if ( maps\mp\_utility::_hasperk( "specialty_lightweight" ) )
        var_0 = maps\mp\_utility::_id_5761();

    self.movespeedscaler = var_0;
    maps\mp\gametypes\_weapons::_id_9B3D();
}

_id_9A67()
{
    self notify( "unsetCrouchMovement" );
    var_0 = 1;

    if ( maps\mp\_utility::_hasperk( "specialty_lightweight" ) )
        var_0 = maps\mp\_utility::_id_5761();

    self.movespeedscaler = var_0;
    maps\mp\gametypes\_weapons::_id_9B3D();
}

_id_7FE0()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.team = self.team;
    var_0 makeportableradar( self );
    self._id_67E3 = var_0;
    thread _id_70AF( var_0 );
}

_id_70AF( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "personal_uav_remove" );
    self endon( "personal_uav_removed" );

    for (;;)
    {
        var_0 moveto( self.origin, 0.05 );
        wait 0.05;
    }
}

_id_9A85()
{
    if ( isdefined( self._id_67E3 ) )
    {
        self notify( "personal_uav_removed" );
        level maps\mp\gametypes\_portable_radar::_id_2865( self._id_67E3 );
        self._id_67E3 = undefined;
    }
}

_id_7FD7()
{

}

_id_9A83()
{

}

_id_7F60()
{

}

_id_9A6A()
{

}

_id_7F2B()
{
    _id_116E();
    _id_116F();
}

_id_116F()
{
    self waittill( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    self autospotoverlayoff();
}

_id_9A62()
{
    self notify( "endAutoSpotAdsWatcher" );
    self autospotoverlayoff();
}

_id_116E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self isusingturret() )
        {
            self autospotoverlayoff();
            continue;
        }

        var_1 = self playerads();

        if ( var_1 < 1 && var_0 )
        {
            var_0 = 0;
            self autospotoverlayoff();
        }

        if ( var_1 < 1 && !var_0 )
            continue;

        if ( var_1 == 1 && !var_0 )
        {
            var_0 = 1;
            self autospotoverlayon();
        }
    }
}

_id_7FFE()
{

}

_id_9A88()
{

}

_id_8007()
{
    self setviewkickscale( 0.5 );
}

_id_9A8A()
{
    self setviewkickscale( 1 );
}

_id_7F59()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endDoubleLoad" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self getweaponslist( "primary" );

        foreach ( var_2 in var_0 )
        {
            var_3 = self getweaponammoclip( var_2 );
            var_4 = weaponclipsize( var_2 );
            var_5 = var_4 - var_3;
            var_6 = self getweaponammostock( var_2 );

            if ( var_3 != var_4 && var_6 > 0 )
            {
                if ( var_3 + var_6 >= var_4 )
                {
                    self setweaponammoclip( var_2, var_4 );
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammoclip( var_2, var_3 + var_6 );

                if ( var_6 - var_5 > 0 )
                {
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammostock( var_2, 0 );
            }
        }
    }
}

_id_9A69()
{
    self notify( "endDoubleLoad" );
}

_id_7FA8( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;
    else
        var_0 = int( var_0 ) * 2;

    maps\mp\_utility::_id_7FFB( var_0 );
    self.recoilscale = var_0;
}

_id_9A7F()
{
    maps\mp\_utility::_id_7FFB( 0 );
    self.recoilscale = 0;
}

_id_8020( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( var_0 ) )
        self.stunscaler = 0.5;
    else
        self.stunscaler = int( var_0 ) / 10;
}

_id_9A93()
{
    self.stunscaler = 1;
}

_id_801B()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self setaimspreadmovementscale( 0.5 );
}

_id_9A8F()
{
    self notify( "end_SteadyAimPro" );
    self setaimspreadmovementscale( 1.0 );
}

_id_1496( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_perkUseTracker" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "empty_offhand" );

        if ( !common_scripts\utility::_id_5163() )
            continue;

        self [[ var_1 ]]( maps\mp\_utility::_hasperk( "specialty_blastshield2" ) );
    }
}

_id_67D6()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self._id_0682 = undefined;
}

_id_7FFA()
{

}

_id_9A86()
{
    self notify( "end_perkUseTracker" );
}

_id_7F62()
{
    if ( isdefined( self._id_315F ) )
        return;

    self.maxturnspeed = maps\mp\gametypes\_tweakables::_id_4142( "player", "maxhealth" ) * 4;
    self.helmet = self.maxturnspeed;
    self._id_315F = 1;
    self._id_0E36[0] = "";
    self visionsetnakedforplayer( "end_game", 5 );
    thread _id_3160( 7 );
    self._id_4729 = 1;
}

_id_9A6B()
{
    self notify( "stopEndGame" );
    self._id_315F = undefined;
    maps\mp\_utility::_id_74FA();

    if ( !isdefined( self._id_3165 ) )
        return;

    self._id_3165 maps\mp\gametypes\_hud_util::_id_28E9();
    self._id_3162 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_3160( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self endon( "stopEndGame" );
    wait(var_0 + 1);
    maps\mp\_utility::_id_066F();
}

_id_8AFD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notifyonplayercommand( "adjustedStance", "+stance" );

    for (;;)
    {
        self waittill( "adjustedStance" );

        if ( self.movespeedscaler != 0 )
            continue;

        _id_9A8D();
    }
}

_id_52CB()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notifyonplayercommand( "jumped", "+goStand" );

    for (;;)
    {
        self waittill( "jumped" );

        if ( self.movespeedscaler != 0 )
            continue;

        _id_9A8D();
    }
}

_id_9A8D()
{
    self.movespeedscaler = level._id_1317;
    self resetspreadoverride();
    maps\mp\gametypes\_weapons::_id_9B3D();
    self player_recoilscaleoff();
    self allowjump( 1 );
}

_id_8000()
{
    self.objectivescaler = 2;
}

_id_9A89()
{
    self.objectivescaler = 1;
}

_id_7FA3( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 10;

    self.movespeedscaler = maps\mp\_utility::_id_5761( var_0 );
    maps\mp\gametypes\_weapons::_id_9B3D();
}

_id_9A7D()
{
    self.movespeedscaler = level._id_1317;
    maps\mp\gametypes\_weapons::_id_9B3D();
}

_id_7F2F()
{
    self._id_53A5 = 1.5;
}

_id_9A63()
{
    self._id_53A5 = 1;
}

_id_801C()
{
    maps\mp\_utility::_id_41F8( "specialty_bulletaccuracy", 1 );
    maps\mp\_utility::_id_41F8( "specialty_holdbreath", 0 );
}

_id_9A90()
{
    maps\mp\_utility::_unsetperk( "specialty_bulletaccuracy" );
    maps\mp\_utility::_unsetperk( "specialty_holdbreath" );
}

_id_7F4F()
{

}

_id_9A68()
{

}

_id_7FA4()
{
    if ( !maps\mp\_utility::_id_50F9() )
        self _meth_8216( 0 );
}

_id_9A7E()
{
    self _meth_8216( 1 );
}

_id_802F()
{
    self thermalvisionon();
}

_id_9A94()
{
    self thermalvisionoff();
}

_id_7FCF()
{
    thread _id_648C();
}

_id_9A81()
{
    self notify( "stop_oneManArmyTracker" );
}

_id_648C()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_oneManArmyTracker" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 != "onemanarmy_mp" )
            continue;

        thread _id_7C70();
    }
}

_id_5165( var_0 )
{
    if ( var_0 == game["menu_onemanarmy"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_defaults_splitscreen"] ) && var_0 == game["menu_onemanarmy_defaults_splitscreen"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_custom_splitscreen"] ) && var_0 == game["menu_onemanarmy_custom_splitscreen"] )
        return 1;

    return 0;
}

_id_7C70()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    common_scripts\utility::_id_0588();
    common_scripts\utility::_id_0585();
    common_scripts\utility::_id_0586();
    self openpopupmenu( game["menu_onemanarmy"] );
    thread _id_1FDD();
    self waittill( "menuresponse", var_0, var_1 );
    common_scripts\utility::_id_0596();
    common_scripts\utility::_id_0593();
    common_scripts\utility::_id_0594();

    if ( var_1 == "back" || !_id_5165( var_0 ) || maps\mp\_utility::_id_51E3() )
    {
        if ( self getcurrentweapon() == "onemanarmy_mp" )
        {
            common_scripts\utility::_id_0588();
            common_scripts\utility::_id_0585();
            common_scripts\utility::_id_0586();
            self switchtoweapon( common_scripts\utility::_id_3FFD() );
            self waittill( "weapon_change" );
            common_scripts\utility::_id_0596();
            common_scripts\utility::_id_0593();
            common_scripts\utility::_id_0594();
        }

        return;
    }

    thread _id_41F6( var_1 );
}

_id_1FDD()
{
    self endon( "menuresponse" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    common_scripts\utility::_id_0596();
    common_scripts\utility::_id_0593();
    common_scripts\utility::_id_0594();
    self closepopupmenu();
}

_id_41F6( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::_hasperk( "specialty_omaquickchange" ) )
    {
        var_1 = 3.0;
        self playlocalsound( "foly_onemanarmy_bag3_plr" );
        self playsoundtoteam( "foly_onemanarmy_bag3_npc", "allies", self );
        self playsoundtoteam( "foly_onemanarmy_bag3_npc", "axis", self );
    }
    else
    {
        var_1 = 6.0;
        self playlocalsound( "foly_onemanarmy_bag6_plr" );
        self playsoundtoteam( "foly_onemanarmy_bag6_npc", "allies", self );
        self playsoundtoteam( "foly_onemanarmy_bag6_npc", "axis", self );
    }

    thread _id_6437( var_1 );
    common_scripts\utility::_id_0587();
    common_scripts\utility::_id_0585();
    common_scripts\utility::_id_0586();
    wait(var_1);
    common_scripts\utility::_id_0595();
    common_scripts\utility::_id_0593();
    common_scripts\utility::_id_0594();
    self.omaclasschanged = 1;
    maps\mp\gametypes\_class::giveloadout( self.pers["team"], var_0, 0 );

    if ( isdefined( self.carryflag ) )
        self attach( self.carryflag, "J_spine4", 1 );

    self notify( "changed_kit" );
    level notify( "changed_kit" );
}

_id_6437( var_0 )
{
    self endon( "disconnect" );
    var_1 = maps\mp\gametypes\_hud_util::_id_2435( 0, -25 );
    var_2 = maps\mp\gametypes\_hud_util::_id_2436( 0, -25 );
    var_2 settext( &"MPUI_CHANGING_KIT" );
    var_1 maps\mp\gametypes\_hud_util::_id_9AF7( 0, 1 / var_0 );

    for ( var_3 = 0; var_3 < var_0 && isalive( self ) && !level.gameended; var_3 += 0.05 )
        wait 0.05;

    var_1 maps\mp\gametypes\_hud_util::_id_28E9();
    var_2 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_7F30()
{
    self setweaponhudiconoverride( "primaryoffhand", "specialty_s1_temp" );
}

_id_9A64()
{
    self setweaponhudiconoverride( "primaryoffhand", "none" );
}

_id_7F77()
{

}

_id_9A73()
{

}

_id_7FDB( var_0 )
{
    if ( isplayer( self ) )
    {
        if ( isdefined( var_0._id_8A3E ) && !maps\mp\_utility::_hasperk( "specialty_coldblooded" ) )
        {
            self._id_665D = 1;
            self setperk( "specialty_radararrow", 1, 0 );
            thread _id_9A84( var_0._id_8A3E );
            thread _id_A247();
        }
    }
}

_id_A247()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "unsetPainted" );
    self waittill( "death" );
    self._id_665D = 0;
}

_id_9A84( var_0 )
{
    self notify( "painted_again" );
    self endon( "painted_again" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self._id_665D = 0;
    self unsetperk( "specialty_radararrow", 1 );
    self notify( "unsetPainted" );
}

_id_516D()
{
    return isdefined( self._id_665D ) && self._id_665D;
}

_id_7FFC()
{
    if ( isdefined( self._id_6F83 ) )
        self givemaxammo( self._id_6F83 );

    if ( isdefined( self._id_7BF9 ) )
        self givemaxammo( self._id_7BF9 );
}

_id_7F6D()
{
    maps\mp\_utility::_id_41F8( "specialty_pistoldeath", 0 );
}

_id_9A70()
{
    maps\mp\_utility::_unsetperk( "specialty_pistoldeath" );
}

_id_803B()
{

}

_id_9A95()
{

}

_id_801F()
{
    maps\mp\_utility::_id_41F8( "specialty_bulletdamage", 0 );
    thread _id_A25E();
}

_id_A25E()
{
    self notify( "watchStoppingPowerKill" );
    self endon( "watchStoppingPowerKill" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "killed_enemy" );
    _id_9A92();
}

_id_9A92()
{
    maps\mp\_utility::_unsetperk( "specialty_bulletdamage" );
    self notify( "watchStoppingPowerKill" );
}

_id_7F97( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    level endon( "end_game" );
    self._id_5137 = 1;

    if ( !isdefined( var_0 ) )
        var_0 = 1.25;

    self.movespeedscaler = var_0;
    maps\mp\gametypes\_weapons::_id_9B3D();

    if ( level.splitscreen )
    {
        var_3 = 56;
        var_4 = 21;
    }
    else
    {
        var_3 = 80;
        var_4 = 32;
    }

    if ( !isdefined( var_1 ) )
        var_1 = 7;

    if ( !isdefined( var_2 ) || var_2 == 1 )
    {
        self._id_52B0 = maps\mp\gametypes\_hud_util::_id_2447( "hudsmall", 1.0 );
        self._id_52B0 maps\mp\gametypes\_hud_util::_id_7FEE( "CENTER", "CENTER", 0, var_3 );
        self._id_52B0 settimer( var_1 );
        self._id_52B0.color = ( 0.8, 0.8, 0.0 );
        self._id_52B0.archived = 0;
        self._id_52B0.foreground = 1;
        self._id_52AF = maps\mp\gametypes\_hud_util::_id_2420( level._id_8A3D, var_4, var_4 );
        self._id_52AF.alpha = 0;
        self._id_52AF maps\mp\gametypes\_hud_util::_id_7FDC( self._id_52B0 );
        self._id_52AF maps\mp\gametypes\_hud_util::_id_7FEE( "BOTTOM", "TOP" );
        self._id_52AF.archived = 1;
        self._id_52AF.space = 1;
        self._id_52AF.foreground = 1;
        self._id_52AF fadeovertime( 1.0 );
        self._id_52AF.alpha = 0.85;
    }

    thread _id_9A79();
    thread _id_9A7A();
    wait(var_1 - 2);

    if ( isdefined( self._id_52AF ) )
    {
        self._id_52AF fadeovertime( 2.0 );
        self._id_52AF.alpha = 0.0;
    }

    if ( isdefined( self._id_52B0 ) )
    {
        self._id_52B0 fadeovertime( 2.0 );
        self._id_52B0.alpha = 0.0;
    }

    wait 2;
    _id_9A78();
}

_id_9A78( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( maps\mp\_utility::_id_5131() )
        {
            if ( isdefined( self._id_52AA ) )
                self.movespeedscaler = self._id_52AA;
            else
                self.movespeedscaler = 0.7;
        }
        else
        {
            self.movespeedscaler = level._id_1317;

            if ( maps\mp\_utility::_hasperk( "specialty_lightweight" ) )
                self.movespeedscaler = maps\mp\_utility::_id_5761();
        }

        maps\mp\gametypes\_weapons::_id_9B3D();
    }

    if ( isdefined( self._id_52AF ) )
        self._id_52AF destroy();

    if ( isdefined( self._id_52B0 ) )
        self._id_52B0 destroy();

    self._id_5137 = undefined;
    self notify( "unset_juiced" );
}

_id_9A7A()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );

    for (;;)
    {
        wait 0.05;

        if ( maps\mp\_utility::_id_51E3() )
        {
            thread _id_9A78();
            break;
        }
    }
}

_id_9A79()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    common_scripts\utility::_id_A069( "death", "faux_spawn" );
    thread _id_9A78( 1 );
}

_id_7FA1( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self._id_5714 = var_0;

        if ( isplayer( self ) && isdefined( self._id_5A3E ) && self._id_5A3E > 0 )
        {
            var_1 = clamp( self._id_5714 / self._id_5A3E, 0, 1 );
            self setclientomnvar( "ui_light_armor_percent", var_1 );
        }
    }
    else
    {
        self._id_5714 = undefined;
        self._id_5A3E = undefined;
        self setclientomnvar( "ui_light_armor_percent", 0 );
    }
}

_id_7FA0( var_0 )
{
    self notify( "give_light_armor" );

    if ( isdefined( self._id_5714 ) )
        _id_9A7C();

    thread _id_73B9();
    thread _id_73BA();

    if ( isdefined( var_0 ) )
        self._id_5A3E = var_0;
    else
        self._id_5A3E = 150;

    _id_7FA1( self._id_5A3E );
}

_id_73B9()
{
    self endon( "disconnect" );
    self endon( "give_light_armor" );
    self endon( "remove_light_armor" );
    self waittill( "death" );
    _id_9A7C();
}

_id_9A7C()
{
    _id_7FA1( undefined );
    self notify( "remove_light_armor" );
}

_id_73BA()
{
    self endon( "disconnect" );
    self endon( "remove_light_armor" );
    level common_scripts\utility::_id_A069( "round_end_finished", "game_ended" );
    thread _id_9A7C();
}

_id_4735()
{
    return isdefined( self._id_5714 ) && self._id_5714 > 0;
}
