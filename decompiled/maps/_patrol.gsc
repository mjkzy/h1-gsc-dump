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

_id_66FC( var_0, var_1, var_2 )
{
    if ( isdefined( self.enemy ) )
        return;

    self endon( "death" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    thread _id_A078();
    thread _id_A083();
    self endon( "enemy" );
    self.goalradius = 32;
    self _meth_81CE( "stand" );
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self.allowdeath = 1;
    self._id_7A9C = 1;
    var_3 = "patrol_walk";

    if ( isdefined( self._id_6718 ) )
        var_3 = self._id_6718;

    var_4 = isdefined( self.canpatrolturn ) && self.canpatrolturn;
    maps\_utility::_id_7E45( var_3, 1, !var_4 );
    thread patrol_walk_twitch_loop();
    var_5[1][1] = ::_id_3E8A;
    var_5[1][0] = common_scripts\utility::_id_3DBD;
    var_5[0][1] = ::_id_3E8C;
    var_5[0][0] = ::_id_3DBE;
    var_6[1] = maps\_utility::_id_7E47;
    var_6[0] = maps\_utility::_id_7E4B;

    if ( isdefined( var_0 ) )
        self.target = var_0;

    if ( isdefined( self.target ) )
    {
        var_7 = 1;
        var_8 = _id_3E8A();
        var_9 = _id_3E8C();

        if ( var_8.size )
        {
            var_10 = common_scripts\utility::_id_710E( var_8 );
            var_11 = 1;
        }
        else
        {
            var_10 = common_scripts\utility::_id_710E( var_9 );
            var_11 = 0;
        }
    }
    else
    {
        var_7 = 0;
        var_8 = common_scripts\utility::_id_3DBD();
        var_9 = _id_3DBE();

        if ( var_8.size )
        {
            var_10 = common_scripts\utility::_id_710E( var_8 );
            var_11 = 1;
        }
        else
        {
            var_10 = common_scripts\utility::_id_710E( var_9 );
            var_11 = 0;
        }
    }

    var_12 = var_10;

    for (;;)
    {
        while ( isdefined( var_12._id_6707 ) )
            wait 0.05;

        var_10._id_6707 = undefined;
        var_10 = var_12;
        self notify( "release_node" );
        var_10._id_6707 = 1;
        self._id_5545 = var_10;
        [[ var_6[var_11] ]]( var_10 );

        if ( isdefined( var_10.radius ) && var_10.radius > 0 )
            self.goalradius = var_10.radius;
        else
            self.goalradius = 32;

        self waittill( "goal" );
        var_10 notify( "trigger", self );

        if ( isdefined( var_10._id_793C ) )
        {
            if ( !isdefined( var_2 ) || var_2 == 0 )
            {
                var_13 = "patrol_stop";
                maps\_anim::anim_generic_custom_animmode( self, "gravity", var_13 );
            }

            switch ( var_10._id_793C )
            {
                case "pause":
                    var_14 = "patrol_idle_" + randomintrange( 1, 6 );

                    if ( var_14 == "patrol_idle_2" && !can_smoke() )
                        var_14 = "patrol_idle_" + randomintrange( 3, 6 );

                    maps\_anim::anim_generic( self, var_14 );
                    var_15 = "patrol_start";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_15 );
                    break;
                case "turn180":
                    var_16 = "patrol_turn180";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_16 );
                    break;
                case "smoke":
                    var_17 = "patrol_idle_smoke";

                    if ( !can_smoke() )
                        var_17 = "patrol_idle_" + randomintrange( 3, 6 );

                    maps\_anim::anim_generic( self, var_17 );
                    var_15 = "patrol_start";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_15 );
                    break;
                case "stretch":
                    var_17 = "patrol_idle_stretch";
                    maps\_anim::anim_generic( self, var_17 );
                    var_15 = "patrol_start";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_15 );
                    break;
                case "checkphone":
                    var_17 = "patrol_idle_checkphone";
                    maps\_anim::anim_generic( self, var_17 );
                    var_15 = "patrol_start";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_15 );
                    break;
                case "phone":
                    var_17 = "patrol_idle_phone";
                    maps\_anim::anim_generic( self, var_17 );
                    var_15 = "patrol_start";
                    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_15 );
                    break;
            }
        }

        if ( isdefined( var_1 ) && var_1 == 1 )
            self _meth_8192( "none" );

        var_18 = var_10 [[ var_5[var_11][var_7] ]]();

        if ( !var_18.size )
        {
            self notify( "reached_path_end" );
            break;
        }

        var_12 = common_scripts\utility::_id_710E( var_18 );
    }
}

add_to_patrol_animation_list( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        level._id_6706[var_0] = var_1;
}

init_patrol_animation_list()
{
    add_to_patrol_animation_list( "patrol_walk", level._id_78AC["generic"]["patrol_walk"] );
    add_to_patrol_animation_list( "patrol_walk_twitch", level._id_78AC["generic"]["patrol_walk_twitch"] );
    add_to_patrol_animation_list( "patrol_stop", level._id_78AC["generic"]["patrol_stop"] );
    add_to_patrol_animation_list( "patrol_start", level._id_78AC["generic"]["patrol_start"] );
    add_to_patrol_animation_list( "patrol_turn180", level._id_78AC["generic"]["patrol_turn180"] );
    add_to_patrol_animation_list( "patrol_idle_1", level._id_78AC["generic"]["patrol_idle_1"] );
    add_to_patrol_animation_list( "patrol_idle_2", level._id_78AC["generic"]["patrol_idle_2"] );
    add_to_patrol_animation_list( "patrol_idle_3", level._id_78AC["generic"]["patrol_idle_3"] );
    add_to_patrol_animation_list( "patrol_idle_4", level._id_78AC["generic"]["patrol_idle_4"] );
    add_to_patrol_animation_list( "patrol_idle_5", level._id_78AC["generic"]["patrol_idle_5"] );
    add_to_patrol_animation_list( "patrol_idle_6", level._id_78AC["generic"]["patrol_idle_6"] );
    add_to_patrol_animation_list( "patrol_idle_smoke", level._id_78AC["generic"]["patrol_idle_smoke"] );
    add_to_patrol_animation_list( "patrol_idle_checkphone", level._id_78AC["generic"]["patrol_idle_checkphone"] );
    add_to_patrol_animation_list( "patrol_idle_stretch", level._id_78AC["generic"]["patrol_idle_stretch"] );
    add_to_patrol_animation_list( "patrol_idle_phone", level._id_78AC["generic"]["patrol_idle_phone"] );
    add_to_patrol_animation_list( "patrol_turn_l45_rfoot", level._id_78AC["generic"]["patrol_turn_l45_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l45_lfoot", level._id_78AC["generic"]["patrol_turn_l45_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l90_rfoot", level._id_78AC["generic"]["patrol_turn_l90_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l90_lfoot", level._id_78AC["generic"]["patrol_turn_l90_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l135_rfoot", level._id_78AC["generic"]["patrol_turn_l135_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l135_lfoot", level._id_78AC["generic"]["patrol_turn_l135_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r45_rfoot", level._id_78AC["generic"]["patrol_turn_r45_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r45_lfoot", level._id_78AC["generic"]["patrol_turn_r45_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r90_rfoot", level._id_78AC["generic"]["patrol_turn_r90_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r90_lfoot", level._id_78AC["generic"]["patrol_turn_r90_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r135_rfoot", level._id_78AC["generic"]["patrol_turn_r135_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r135_lfoot", level._id_78AC["generic"]["patrol_turn_r135_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_in_lfoot", level._id_78AC["generic"]["patrol_walk_in_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_out_lfoot", level._id_78AC["generic"]["patrol_walk_out_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_in_rfoot", level._id_78AC["generic"]["patrol_walk_in_rfoot"] );
    add_to_patrol_animation_list( "patrol_walk_out_rfoot", level._id_78AC["generic"]["patrol_walk_out_rfoot"] );
}

is_patrolling()
{
    foreach ( var_1 in level._id_6706 )
    {
        if ( isdefined( var_1 ) && self _meth_8152( var_1 ) != 0.0 )
        {
            self.usepathsmoothingvalues = 1;
            self.pathlookaheaddist = 70.0;
            self.maxturnspeed = 19.0;
            self.sharpturn = 0.94;
            return 1;
        }
    }

    self.usepathsmoothingvalues = 0;
    return 0;
}

enable_patrol_turn()
{
    self.canpatrolturn = 1;
}

disable_patrol_turn()
{
    self.canpatrolturn = undefined;
}

can_smoke()
{
    if ( !isdefined( self.headmodel ) )
        return 0;

    switch ( self.headmodel )
    {
        case "head_sp_opforce_ski_mask_body_a":
        case "head_sp_opforce_fullwrap_body_d":
        case "head_sp_opforce_gas_mask_body_f":
        case "head_spetsnaz_assault_demetry":
        case "head_spetsnaz_assault_demetry_lob":
            return 0;
    }

    return 1;
}

patrol_walk_twitch_loop()
{
    self endon( "death" );
    self endon( "enemy" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self notify( "patrol_walk_twitch_loop" );
    self endon( "patrol_walk_twitch_loop" );

    if ( isdefined( self._id_6718 ) && !isdefined( self._id_6719 ) )
        return;

    for (;;)
    {
        wait(randomfloatrange( 8, 20 ));
        var_0 = "patrol_walk_twitch";

        if ( isdefined( self._id_6719 ) )
            var_0 = self._id_6719;

        var_1 = isdefined( self.canpatrolturn ) && self.canpatrolturn;
        maps\_utility::_id_7E45( var_0, 1, !var_1 );
        var_2 = getanimlength( maps\_utility::_id_3EF7( var_0 ) );
        wait(var_2);
        var_0 = "patrol_walk";

        if ( isdefined( self._id_6718 ) )
            var_0 = self._id_6718;

        maps\_utility::_id_7E45( var_0, 1, !var_1 );
    }
}

_id_A079()
{
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self waittill( "enemy" );
}

_id_A083()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self notify( "release_node" );

    if ( !isdefined( self._id_5545 ) )
        return;

    self._id_5545._id_6707 = undefined;
}

_id_A078()
{
    self endon( "death" );
    _id_A079();

    if ( !isdefined( self._stealth ) )
    {
        maps\_utility::_id_1ED1();
        self _meth_81CE( "stand", "crouch", "prone" );
        self._id_2AF3 = 0;
        self._id_2B0E = 0;
        self _meth_8143();
        self notify( "stop_animmode" );
    }

    self.allowdeath = 0;

    if ( !isdefined( self ) )
        return;

    self notify( "release_node" );

    if ( !isdefined( self._id_5545 ) )
        return;

    self._id_5545._id_6707 = undefined;
}

_id_3E8A()
{
    var_0 = [];

    if ( isdefined( self.target ) )
        var_0 = getentarray( self.target, "targetname" );

    return var_0;
}

_id_3E8C()
{
    var_0 = [];

    if ( isdefined( self.target ) )
        var_0 = getnodearray( self.target, "targetname" );

    return var_0;
}

_id_3DBE()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = strtok( self._id_7A26, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = getnode( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

_id_8502( var_0 )
{
    self endon( "release_node" );
}

_id_6712()
{

}

_id_67E7()
{

}
