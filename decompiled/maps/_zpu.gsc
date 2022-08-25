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

main( var_0 )
{
    var_1 = getentarray( "zpu", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_2[var_3] = var_1[var_3]._id_79D3;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2.size - 1;

        for ( var_6 = var_4; var_6 < var_5; var_6++ )
            waitframe;
    }

    precacherumble( "zpu_rumble" );
    load_zpu_anims();
    load_zpugunner_anims();
    common_scripts\utility::array_thread( var_1, ::per_zpu_init );
    level.zpu_fx = loadfx( "fx/muzzleflashes/zpu_flash_wv" );
}

per_zpu_init()
{
    self endon( "death" );
    var_0 = getentarray( self.target, "targetname" );
    var_1 = [];
    common_scripts\utility::_id_383D( self._id_79D3 );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( issubstr( var_6.classname, "actor" ) )
        {
            var_2 = var_6;
            continue;
        }

        if ( isdefined( var_6.script_noteworthy ) && var_6.script_noteworthy == "dismount" )
        {
            var_3 = var_6;
            continue;
        }

        if ( isdefined( var_6.script_noteworthy ) && var_6.script_noteworthy == "kill_zpu_spawner" )
        {
            var_7 = var_6;
            var_7 thread zpu_cancel( self._id_79D3 );
            continue;
        }

        var_1[var_1.size] = var_6;

        if ( issubstr( var_6.classname, "trigger_" ) )
            var_4 = 1;
    }

    if ( var_4 )
        waittill_trigger_array( var_1 );

    for (;;)
    {
        if ( var_2.count > 0 )
        {
            var_8 = var_2 spawn_gunner();
            var_8 linkto( self, "tag_driver", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
            var_8 thread zpugunner_animation_think( self );
            var_8 thread monitor_gunner( self );
            var_8 thread gunner_death_think( self );

            if ( isdefined( var_3 ) )
            {
                waittill_death_or_dismount( var_3, var_8, self );
                zpu_recycle( self._id_79D3 );

                if ( common_scripts\utility::_id_382E( self._id_79D3 ) )
                    break;
                else
                    var_2.count = 1;
            }
        }
        else
            break;

        wait 0.1;
    }
}

zpu_cancel( var_0 )
{
    self waittill( "trigger" );
    common_scripts\utility::_id_383F( var_0 );
    level notify( var_0 );
}

zpu_recycle( var_0 )
{
    level endon( var_0 );
    wait 20;
}

waittill_death_or_dismount( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_1 endon( "damage" );
    var_0 maps\_utility::add_wait( maps\_utility::_id_A099, "trigger" );
    var_1 maps\_utility::add_wait( maps\_utility::_id_A099, "doFlashBanged" );
    var_1 maps\_utility::add_endon( "death" );
    maps\_utility::_id_2BDD();
    var_1 waittillmatch( "looping anim", "end" );
    var_2 notify( "stop_looping" );
    var_1 thread zpugunner_dismount( var_2 );
}

monitor_gunner( var_0 )
{
    self waittill( "death" );
    var_0 _meth_814D( level._id_78AC[var_0.animname]["fire_loop"][0], 1, 1, 0 );
    var_0 _meth_814D( level._id_78AC[var_0.animname]["fire_loop"][1], 1, 1, 0 );
}

gunner_death_think( var_0 )
{
    self.health = 5000;
    self endon( "dismount" );
    self waittill( "damage" );

    if ( !isdefined( self ) )
        return;

    self notify( "dying_damage" );
    self.a._id_612E = 1;
    self._id_2652 = level._id_78AC["zpu_gunner"]["deathslouch"];
    var_0 thread maps\_anim::anim_single_solo( self, "deathslouch", "tag_driver" );
    wait 0.5;
    maps\_utility::_id_2A51();
}

spawn_gunner()
{
    var_0 = maps\_utility::_id_88C3();

    if ( maps\_utility::_id_88F1( var_0 ) )
        return;

    var_0 endon( "death" );
    var_0.allowdeath = 1;
    return var_0;
}

waittill_trigger_array( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] endon( "trigger" );

    var_0[0] waittill( "trigger" );
}
#using_animtree("zpu");

load_zpu_anims()
{
    level._id_78B1["zpu_gun"] = #animtree;
    level._id_78AC["zpu_gun"]["fire_loop"][0] = %zpu_gun_fire_a;
    level._id_78AC["zpu_gun"]["fire_loop"][1] = %zpu_gun_fire_b;
    maps\_anim::addnotetrack_customfunction( "zpu_gun", "fire_1", ::zpu_shoot1 );
    maps\_anim::addnotetrack_customfunction( "zpu_gun", "fire_2", ::zpu_shoot2 );
}
#using_animtree("generic_human");

load_zpugunner_anims()
{
    level._id_78AC["zpu_gunner"]["deathslouch"] = %zpu_gunner_deathslouch;
    level._id_78AC["zpu_gunner"]["deathslouchidle"] = %zpu_gunner_deathslouchidle;
    level._id_78AC["zpu_gunner"]["dismount"] = %zpu_gunner_dismount;
    level._id_78AC["zpu_gunner"]["fire_loop"][0] = %zpu_gunner_fire_a;
    level._id_78AC["zpu_gunner"]["fire_loop"][1] = %zpu_gunner_fire_b;
}

zpu_shoot1( var_0 )
{
    playfxontag( level.zpu_fx, var_0, "tag_flash" );
    playfxontag( level.zpu_fx, var_0, "tag_flash2" );
    var_0 playsound( "zpu_fire1" );
    playrumbleonposition( "zpu_rumble", self.origin );
}

zpu_shoot2( var_0 )
{
    playfxontag( level.zpu_fx, var_0, "tag_flash1" );
    playfxontag( level.zpu_fx, var_0, "tag_flash3" );
    var_0 playsound( "zpu_fire2" );
    playrumbleonposition( "zpu_rumble", self.origin );
}

zpugunner_animation_think( var_0 )
{
    self endon( "death" );
    self endon( "dismount gunner" );
    var_0 endon( "dismount gunner" );
    var_0 endon( "new gunner" );
    self.animname = "zpu_gunner";
    var_0.animname = "zpu_gun";
    var_0 maps\_utility::assign_animtree();
    var_1 = [];
    var_1[var_1.size] = maps\_anim::anim_at_entity( var_0, "tag_driver" );
    var_1[var_1.size] = var_0 maps\_anim::anim_at_self();
    var_0 thread maps\_anim::anim_loop_packet( var_1, "fire_loop", "stop_looping" );
}

zpugunner_dismount( var_0 )
{
    self endon( "death" );
    self endon( "dying_damage" );
    self.animname = "zpu_gunner";
    var_0.animname = "zpu_gun";
    var_0 maps\_utility::assign_animtree();
    var_0 thread maps\_anim::anim_single_solo( self, "dismount", "tag_driver" );
    wait 0.8;
    self.health = 100;
    self notify( "dismount" );
    self._id_2652 = undefined;
    self unlink();
}
