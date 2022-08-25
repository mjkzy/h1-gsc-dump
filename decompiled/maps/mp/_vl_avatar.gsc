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

init_avatar()
{
    level.maxavatars = 18;
    setdvar( "scr_vl_link_primary_weap", 0 );
    animateallweaponrooms();
}

init_avatar_pool()
{
    var_0 = 3;
    var_1 = level.maxavatars + var_0;
    level.vlavatarpool = [];

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = maps\mp\agents\_agent_utility::_id_3FA2();
        level.vlavatarpool[var_2] = var_3;
        var_3 _meth_8388( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        var_3 _id_7DB2( "spectator", "none" );
        var_3 maps\mp\agents\_agent_common::_id_7DB0( 100 );
        var_3 botclearscriptenemy();
        var_3 botclearscriptgoal();
        var_3 bot_disable_tactical_goals();
        var_3 botsetflag( "disable_movement", 1 );
        var_3 botsetflag( "disable_rotation", 1 );
        var_3.isfree = 1;
    }
}

playerspawnlocalplayeravatar( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self;
    var_6 = maps\mp\gametypes\_class::_id_4009( var_5.pers["team"], var_1 );
    maps\mp\_vl_base::vlprintln( "adding xuid " + var_0 + "from vlobby_player" );
    var_7 = getnewlobbyavatarownerid( var_0 );
    var_8 = _id_88CE( var_5, var_5.avatar_spawnpoint, var_6._id_6F84, var_2, var_3, undefined, var_7 );
    var_8._id_A7EA = var_6.emblemindex;
    var_8 _meth_8577( var_6._id_A7EC );
    var_8.controller = var_4;
    var_8.xuid = var_0;
    setdvar( "virtuallobbymembers", level._id_9EAB.size );
}

bot_disable_tactical_goals()
{
    self._id_2ADD = 1;
    self._id_90AF = [];
}

_id_7DB2( var_0, var_1 )
{
    maps\mp\agents\_agent_utility::_id_7DB1( var_0 );
    self.agent_gameparticipant = 0;
    self._id_50A6 = 1;
    self.spawntime = gettime();
    self.issniper = 0;
    self.sessionteam = var_1;
}

alloc_avatar()
{
    if ( !isdefined( level.vlavatarpool ) )
        init_avatar_pool();

    foreach ( var_1 in level.vlavatarpool )
    {
        if ( var_1.isfree )
        {
            var_1.isfree = 0;
            return var_1;
        }
    }
}

free_avatar( var_0 )
{
    var_0 notify( "free_avatar" );
    var_0.isfree = 1;
}

teleport_avatar( var_0, var_1, var_2 )
{
    var_0 unlink();
    var_0 setplayerangles( var_1.angles );
    var_3 = getgroundposition( var_1.origin, 20, 512, 120 );
    var_0 setorigin( var_3, 1 );
    var_2 setorigin( var_3, 1 );
    var_4 = get_ownerid_for_avatar( var_0 );
    var_2 maps\mp\_vl_base::playerrefreshavatar( var_4 );
}

teleport_avatar_stick( var_0, var_1, var_2 )
{
    var_0 unlink();

    if ( !isdefined( var_0.teleportlinker ) )
    {
        var_0.teleportlinker = spawn( "script_model", var_1.origin );
        var_0.teleportlinker setmodel( "tag_origin" );
    }

    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    var_0.teleportlinker.origin = var_1.origin;
    var_0.teleportlinker.angles = var_1.angles;
    var_0.teleportlinker dontinterpolatewrapper();

    if ( !maps\mp\_utility::_id_5092( level.vl_setup ) )
        maps\mp\_utility::waittillplayersnextsnapshot( var_2 );

    var_0 _meth_8442( var_0.teleportlinker, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 setorigin( var_1.origin, 1 );
    var_3 = get_ownerid_for_avatar( var_0 );
    var_2 maps\mp\_vl_base::playerrefreshavatar( var_3 );
}

dontinterpolatewrapper()
{
    if ( !isdefined( self.lastinterpolatetime ) )
        self.lastinterpolatetime = 0;

    var_0 = gettime();
    var_1 = self.lastinterpolatetime == var_0;

    if ( !var_1 )
        self dontinterpolate();

    self.lastinterpolatetime = var_0;
}

_id_88CE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_8 ) )
        var_8 = 0;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    var_11 = "allies";
    var_12 = "none";
    var_13 = alloc_avatar();
    var_1._id_899F = var_13;
    var_13.avatar_spawnpoint = var_1;
    var_13._id_2236 = var_3;
    var_13 _id_7DB2( var_11, var_12 );
    var_14 = getgroundposition( var_13.avatar_spawnpoint.origin, 20, 512, 120 );
    var_13._id_88D0 = ( var_1.angles[0], var_1.angles[1], var_1.angles[2] );
    var_13.angles = var_13._id_88D0;
    var_13 show();
    var_13 setplayerangles( var_13._id_88D0 );
    var_13 setorigin( var_14, 1 );
    var_13.angles = var_13._id_88D0;
    var_13._id_8CFF = var_13._id_88D0;
    maps\mp\_vl_base::resetrotationdata( var_13 );
    var_13._id_1A25 = ( 0.0, 0.0, 0.0 );
    var_13._id_1A24 = ( 0.0, 0.0, 0.0 );
    var_13 motionblurhqdisable();
    var_13 maps\mp\gametypes\_spawnlogic::addtocharactersarray();

    if ( isdefined( var_9 ) )
    {
        var_13 detachall();
        var_13 setmodel( var_9 );
        var_13.bodymodel = var_9;

        if ( isdefined( var_10 ) )
        {
            var_13 attach( var_10 );
            var_13.head = var_10;
        }
    }
    else
    {
        thread _id_9E9E( var_0, var_6, var_2, var_3, var_4, var_13, var_5 );
        var_0 thread _id_9FDB( var_13, var_7 );
    }

    if ( !isscriptedagent( var_13 ) )
        var_13 enableanimstate( 1 );

    if ( var_8 )
        var_13.isdepotagent = 1;
    else
    {
        level._id_9EAB[var_6] = var_13;

        if ( var_7 )
            var_0 playerteleportavatartoweaponroom( var_13, level._id_1A3E._id_1A13 );
        else
            var_13 agentplaycacanim();
    }

    if ( var_7 )
        _id_84BF( var_13, !var_8 );
    else
        _id_4842( var_13 );

    var_13.fakemember = undefined;
    return var_13;
}

_id_9FDC( var_0 )
{
    if ( isalive( var_0 ) )
    {
        var_1 = isdefined( level.cac_weap );

        if ( !var_1 )
            _id_84BF( var_0 );
    }
}

_id_9FDD( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "wait_load_costume" );
    var_1 endon( "death" );
    var_1 endon( "hide_avatar" );
    wait(var_0);
    _id_9FDC( var_1 );
    var_1 notify( "wait_load_costume" );
}

_id_9FDB( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 notify( "wait_load_costume" );
    var_0 endon( "wait_load_costume" );
    var_0 endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    _id_4842( var_0 );

    if ( var_1 )
        thread _id_9FDD( 5.0, var_0 );

    var_2 = "none";

    if ( isdefined( var_0.primaryweapon ) )
        var_2 = var_0.primaryweapon;

    var_3 = maps\mp\_vl_cac::getfactionteam();
    var_4 = maps\mp\_vl_cac::getfactionenvironment();
    var_0.costumeloaded = 0;

    for ( var_5 = self _meth_84E6( var_0._id_2236, var_0.team, var_2, var_4 ); !var_5; var_5 = self _meth_84E6( var_0._id_2236, var_0.team, var_2, var_4 ) )
        waittillframeend;

    var_0.costumeloaded = 1;

    if ( var_1 )
        _id_9FDC( var_0 );

    var_0 notify( "wait_load_costume" );
}

allcostumesloaded()
{
    foreach ( var_1 in level._id_9EAB )
    {
        if ( !maps\mp\_utility::_id_5092( var_1.costumeloaded ) )
            return 0;
    }

    return 1;
}

getnewlobbyavatarownerid( var_0 )
{
    for ( var_1 = 0; isdefined( level._id_9EAB[var_1] ); var_1++ )
    {

    }

    maps\mp\_vl_base::vlprint( "Adding new xuid " + var_0 + " with ownerId=" + var_1 + "\\n" );
    return var_1;
}

showavataronly( var_0, var_1 )
{
    foreach ( var_3 in level._id_9EAB )
    {
        if ( var_0 == var_3 )
        {
            _id_84BF( var_3, var_1 );
            continue;
        }

        _id_4842( var_3 );
    }
}

_id_4842( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_0 notify( "hide_avatar" );
        var_0 hide();
        var_0 hideallparts();
        _id_4846( var_0 );
    }
}

_id_84BF( var_0, var_1 )
{
    var_0 show();
    var_0 showallparts();

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
    {
        show_avatar_primary_weapon( var_0 );
        var_0.hideweapons = undefined;
    }
}

show_avatar_primary_weapon( var_0 )
{
    if ( isdefined( var_0._id_6F8F ) )
    {
        var_0._id_6F8F show();
        var_0._id_6F8F showallparts();
    }
    else if ( isdefined( var_0.heldweapon ) && !var_0 hasweapon( var_0.heldweapon ) )
        var_0 thread avatargiveheldweapon();
}

avatargiveheldweapon()
{
    self notify( "give_avatar_held_weapon" );
    self endon( "give_avatar_held_weapon" );
    self endon( "free_avatar" );
    self endon( "heldWeaponGone" );
    maps\mp\_vl_base::waitstreamweapon( level.vlplayer, self.heldweapon, 0 );

    if ( !maps\mp\_utility::_id_5092( self.hideweapons ) )
    {
        self giveweapon( self.heldweapon );
        self switchtoweapon( self.heldweapon );
        self setspawnweapon( self.heldweapon );
    }
}

_id_4844( var_0 )
{
    if ( isdefined( var_0._id_6F8F ) )
    {
        var_0 notify( "hide_primary_weapon" );
        var_0._id_6F8F hide();
        var_0._id_6F8F hideallparts();
    }
    else if ( isdefined( var_0.heldweapon ) && var_0 hasweapon( var_0.heldweapon ) )
        var_0 takeweapon( var_0.heldweapon );

    var_0 notify( "heldWeaponGone" );
    var_0.primaryhidden = 1;
}

_id_4846( var_0 )
{
    _id_4844( var_0 );
    var_0.hideweapons = 1;
}

_id_4847()
{
    foreach ( var_1 in level._id_9EAB )
        _id_4842( var_1 );
}

_id_84C0()
{
    foreach ( var_1 in level._id_9EAB )
        _id_84BF( var_1 );
}

get_xuid_for_avatar( var_0 )
{
    if ( isdefined( var_0.xuid ) )
        return var_0.xuid;

    if ( isdefined( var_0._id_57D6 ) )
        return var_0._id_57D6.xuid;

    return "";
}

get_avatar_for_xuid( var_0 )
{
    foreach ( var_2 in level._id_9EAB )
    {
        if ( isdefined( var_2.xuid ) && var_2.xuid == var_0 )
            return var_2;

        if ( isdefined( var_2._id_57D6 ) && var_2._id_57D6.xuid == var_0 )
            return var_2;
    }

    return undefined;
}

get_ownerid_for_avatar( var_0 )
{
    foreach ( var_3, var_2 in level._id_9EAB )
    {
        if ( var_0 == var_2 )
            return var_3;
    }

    return 0;
}

removelobbyavatar( var_0 )
{
    var_1 = get_ownerid_for_avatar( var_0 );
    level._id_9EAB[var_1] = undefined;
    setdvar( "virtuallobbymembers", level._id_9EAB.size );

    if ( level._id_9EA2 == var_1 )
    {
        if ( level._id_9EAB.size > 0 )
        {
            foreach ( var_4, var_3 in level._id_9EAB )
            {
                level._id_9EA2 = var_4;
                break;
            }
        }
    }

    _id_4842( var_0 );
    var_0 takeallweapons();
    var_0 detachall();
    var_0.headmodel = undefined;
    var_0 hideallparts();

    if ( isdefined( var_0.avatar_spawnpoint._id_899F ) )
        var_0.avatar_spawnpoint._id_899F = undefined;

    if ( isdefined( var_0._id_6F8F ) )
    {
        var_0._id_6F8F delete();
        var_0._id_6F8F = undefined;
    }

    var_0.primaryweapon = undefined;
    var_0._id_8F18 = undefined;
    var_0.heldweapon = undefined;
    var_0.hideweapons = undefined;
    var_0.lastanim = undefined;
    var_0.updateloadout = undefined;
    var_0.updatecostume = undefined;
    var_0.weapclasschanged = undefined;
    free_avatar( var_0 );

    if ( level._id_9EA2 == var_1 )
        level._id_9EA2 = 0;
}

_id_9E9D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_2 ) )
        var_1._id_2236 = var_2;

    var_1 maps\mp\gametypes\_teams::applycostume( var_3, var_4, var_5 );
}

_id_9E9E( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_5 ) )
        var_5 = level._id_9EAB[var_1];

    var_7 = maps\mp\_vl_cac::getfactionteam();
    var_8 = maps\mp\_vl_cac::getfactionenvironment();

    if ( isdefined( var_6 ) )
    {
        var_7 = level.vl_factions[var_6].team;
        var_8 = level.vl_factions[var_6]._id_3338;
    }
    else if ( isdefined( var_5._id_57D6 ) && isdefined( var_5._id_57D6._id_A7E7 ) )
    {
        var_7 = level.vl_factions[var_5._id_57D6._id_A7E7].team;
        var_8 = level.vl_factions[var_5._id_57D6._id_A7E7]._id_3338;
    }

    var_5 takeallweapons();
    _id_9E9D( var_0, var_5, var_3, var_2, var_7, var_8 );
    var_0 _meth_84B6( var_5._id_2236, maps\mp\_utility::_id_3F11( var_2 ) + "_mp", var_7, var_8 );
    var_0 _meth_857C( var_4 );
    var_5 _meth_857C( var_4 );
    var_5.primaryweapon = var_2;
    var_5._id_A7ED = var_4;
    maps\mp\_vl_base::waitstreamweapon( var_0, var_2, 0 );
    _id_9EA3( var_5 );
}

_id_9EA3( var_0 )
{
    if ( !isdefined( var_0.primaryweapon ) )
        return;

    if ( var_0.primaryweapon != "" && var_0.primaryweapon != "none" && var_0.primaryweapon != "specialty_null" )
        var_0 avatarattachprimaryweapons();
    else
        _id_4846( var_0 );
}

avatarattachprimaryweapons()
{
    if ( getdvarint( "scr_vl_link_primary_weap", 0 ) != 0 )
    {
        if ( isdefined( self.heldweapon ) )
        {
            if ( self hasweapon( self.heldweapon ) )
                self takeweapon( self.heldweapon );

            self.heldweapon = undefined;
            self notify( "heldWeaponGone" );
        }

        if ( !isdefined( self._id_6F8F ) )
        {
            var_0 = spawn( "weapon_" + self.primaryweapon, ( 0.0, 0.0, 0.0 ) );
            var_1 = get_xuid_for_avatar( self );
            self._id_6F8F = var_0;
            var_0.primaryweapon = self.primaryweapon;
            self._id_6F8F show();
            self._id_6F8F showallparts();
            self._id_6F8F _meth_847F( self.primaryweapon );
        }
        else if ( self._id_6F8F.primaryweapon != self.primaryweapon )
        {
            self._id_6F8F.primaryweapon = self.primaryweapon;
            self._id_6F8F _meth_847F( self.primaryweapon );
        }

        if ( isdefined( self._id_6F8F ) )
            thread attachprimaryweapon( self );
    }
    else
    {
        if ( isdefined( self._id_6F8F ) )
        {
            var_1 = get_xuid_for_avatar( self );
            self._id_6F8F delete();
            self._id_6F8F = undefined;
        }

        if ( !isdefined( self.heldweapon ) || self.heldweapon != self.primaryweapon || !maps\mp\_utility::_id_5092( self.hideweapons ) && !self hasweapon( self.heldweapon ) )
        {
            if ( isdefined( self.heldweapon ) )
                self takeweapon( self.heldweapon );

            self.heldweapon = self.primaryweapon;
            thread avatargiveheldweapon();
        }
    }
}

attachprimaryweapon( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0.player ) )
        var_1 = var_0.player;

    var_2 = "tag_weapon_right";

    if ( issubstr( var_0._id_6F8F.primaryweapon, "combatknife" ) )
        var_2 = "tag_inhand";

    if ( issubstr( var_0._id_6F8F.primaryweapon, "riotshield" ) )
        var_2 = "tag_weapon_left";

    var_0._id_6F8F unlink();
    var_0._id_6F8F.origin = var_0 gettagorigin( var_2 );
    var_0._id_6F8F.angles = var_0 gettagangles( var_2 );
    var_0._id_6F8F _meth_8442( var_0, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0._id_6F8F _meth_8523( var_1 );
}

playerteleportavatarcao( var_0, var_1 )
{
    teleport_avatar_stick( var_0, var_1, self );
    var_0 agentplaycacanim();
}

playerteleportavatartocac( var_0 )
{
    teleport_avatar( var_0, var_0.avatar_spawnpoint, self );
    var_0 agentplaycacanim();
}

playerteleportavatartoweaponroom( var_0, var_1, var_2 )
{
    var_3 = maps\mp\_vl_base::getweaponroomstring( var_0.primaryweapon );
    maps\mp\_vl_base::vlprintln( "playerTeleportAvatarToWeaponRoom - weap = " + var_0.primaryweapon + ", loc = " + var_3 );
    var_4 = "character" + var_3;
    var_5 = common_scripts\utility::_id_40FB( var_4, "targetname" );
    var_1.scenenode = var_5.scenenode;
    var_0 unlink();
    var_0 agentplaylobbyanim( var_1.scenenode, var_0.primaryweapon, var_2 );
}

getlobbyidleanimalias( var_0 )
{
    var_1 = "idle";
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    switch ( var_2 )
    {
        case "h1_m14":
        case "h1_barrett":
        case "h1_dragunov":
        case "h1_junsnp":
            var_1 = "idle_alt";
            break;
        default:
            break;
    }

    return var_1;
}

agentplaylobbyanim( var_0, var_1, var_2 )
{
    var_3 = tolower( maps\mp\_vl_base::getweaponroomanimstring( var_1 ) );
    var_4 = "lobby_" + var_3;
    var_5 = getlobbyidleanimalias( var_1 );
    var_6 = var_4 + var_5;

    if ( !isdefined( self.lastanim ) || self.lastanim != var_6 )
    {
        var_7 = 0.0;

        if ( maps\mp\_utility::_id_5092( var_2 ) )
            var_7 = randomfloat( 1.0 );

        self setanimclass( "vlobby_animclass" );
        self setanimstate( var_4, var_5, 1, var_7 );
        self.lastanim = var_6;
        self getmlgspectatorteam( 1 );
        self setphysicsmode( "noclip" );
        self _meth_8552( 0, 0, var_0, "j_prop_1", "tag_origin" );
    }

    _id_84BF( self );
}

debugnode( var_0 )
{
    var_0 notify( "debugNode" );
    var_0 endon( "debugNode" );

    for (;;)
    {
        var_1 = var_0.origin;
        var_2 = var_0 gettagorigin( "j_prop_1" );
        var_3 = var_0 gettagangles( "j_prop_1" );
        var_4 = anglestoforward( var_3 );
        var_5 = var_2 + var_4 * 5;
        var_6 = var_0 gettagorigin( "j_prop_2" );
        var_7 = var_0 gettagangles( "j_prop_2" );
        var_8 = anglestoforward( var_7 );
        var_9 = var_6 + var_8 * 5;
        waittillframeend;
    }
}

agentplaycacanim()
{
    var_0 = "lobby_idle";
    var_1 = "cao_01";
    var_2 = var_0 + var_1;

    if ( !isdefined( self.lastanim ) || self.lastanim != var_2 )
    {
        self setanimclass( "vlobby_animclass" );
        self getmlgspectatorteam( 0 );
        self setorientmode( "face angle abs", self._id_88D0 );
        self setanimstate( var_0, var_1 );
        self.lastanim = var_2;
    }

    _id_4846( self );
}

animateallweaponrooms()
{
    var_0 = maps\mp\_vl_base::getallweaponroomstrings();

    foreach ( var_2 in var_0 )
    {
        var_3 = "character" + var_2;
        var_4 = common_scripts\utility::_id_40FB( var_3, "targetname" );
        var_4.scenenode = spawn( "script_model", var_4.origin );
        var_4.scenenode setmodel( "genericprop_x5" );
        var_4.scenenode._id_57F4 = var_2;
        var_4.scenenode.characterstruct = var_4;
        animateweaponroomscenenode( var_4.scenenode, var_4, var_2 );
    }
}

animateweaponroomscenenode( var_0, var_1, var_2 )
{
    var_3 = maps\mp\_vl_base::getalignmentanimation( var_2 );
    var_0 _meth_8487( var_3, var_1.origin, var_1.angles, "scene_node_anim" );
    startweaponroompropanimations( var_0, var_1, var_2 );
}

cameralinktoscenenode( var_0, var_1, var_2 )
{
    var_0 _meth_8442( var_1, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

startweaponroompropanimations( var_0, var_1, var_2 )
{
    var_3 = getent( "mk19", "targetname" );

    if ( var_2 == "LMG" )
    {
        if ( isdefined( var_3 ) )
        {
            if ( !var_3 islinked() )
                var_3 _meth_8442( var_0, "J_prop_3", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

            var_3 show();
            var_3 _meth_8487( "h1_lobby_mk19_idle", var_1.origin, var_1.angles, "mk19_anim" );
        }
    }
    else if ( isdefined( var_3 ) )
        var_3 hide();
}
