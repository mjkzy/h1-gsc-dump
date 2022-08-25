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

main()
{
    animscripts\init::main();
    _id_1DCF();
}
#using_animtree("generic_human");

_id_1DCF()
{
    self.allowdeath = 1;
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self._id_6094 = 1;
    self.alwaysrunforward = 1;
    self _meth_8193( "face default" );
    self.combatmode = "no_cover";
    self _meth_81A7( 0 );
    self.a._id_71D0 = 1;

    if ( !isdefined( level._id_4DDE ) )
    {
        level._id_4DDE = 1;
        level._id_78AC["default_civilian"]["run_combat"][0] = %civilian_run_upright;
        level._id_78AC["default_civilian"]["run_hunched_combat"][0] = %civilian_run_hunched_a;
        level._id_78AC["default_civilian"]["run_hunched_combat"][1] = %civilian_run_hunched_c;
        level._id_78AC["default_civilian"]["run_hunched_combat"][2] = %civilian_run_hunched_flinch;
        level._id_78AC["default_civilian"]["run_noncombat"][0] = %civilian_walk_cool;
        var_0 = [];
        var_0[0] = 3;
        var_0[1] = 3;
        var_0[2] = 1;
        level._id_78AC["default_civilian"]["run_hunched_weights"] = common_scripts\utility::_id_3D1E( var_0 );
        var_0 = [];
        var_0[0] = 1;
        level._id_78AC["default_civilian"]["run_weights"] = common_scripts\utility::_id_3D1E( var_0 );
        level._id_78AC["default_civilian"]["idle_noncombat"][0] = %unarmed_cowerstand_idle;
        level._id_78AC["default_civilian"]["idle_combat"][0] = %casual_crouch_v2_idle;
        level._id_78AC["default_civilian"]["idle_combat"][1] = %unarmed_cowercrouch_idle_duck;
        anim._id_1E0F[0] = %unarmed_cowerstand_react;
        anim._id_1E0F[1] = %unarmed_cowercrouch_react_a;
        anim._id_1E0F[2] = %unarmed_cowercrouch_react_b;
    }

    var_1 = undefined;

    if ( isdefined( self._id_1DFD ) )
    {
        self.animname = self._id_1DFD;
        attachprops( self._id_1DFD );
        self.alertlevel = "noncombat";
        _id_8D31();
    }
    else
    {
        self.animname = "default_civilian";
        self.alertlevel = "alert";
        _id_8D04();
    }

    thread _id_1CF8();
    self.dropweapon = 0;
    animscripts\shared::_id_2F6B();
    self._id_7810 = 0;
}

attachprops( var_0 )
{
    if ( isdefined( self._id_471B ) )
        return;

    _id_4D97();
    var_1 = anim._id_1E13[var_0];

    if ( isdefined( var_1 ) )
    {
        self.attachedpropmodel = var_1;
        self.attachedproptag = "tag_inhand";
        self attach( self.attachedpropmodel, self.attachedproptag, 1 );
        self._id_471B = 1;
    }
}

_id_2983()
{
    if ( isdefined( self._id_471B ) )
    {
        self detach( self.attachedpropmodel, self.attachedproptag );
        var_0 = spawn( "script_model", self gettagorigin( self.attachedproptag ) );
        var_0.angles = self gettagangles( self.attachedproptag );
        var_0 setmodel( self.attachedpropmodel );
        var_0 physicslaunch();
        var_0 thread _id_A019();
        self._id_471B = undefined;
        self.attachedpropmodel = undefined;
        self.attachedproptag = undefined;
    }
}

_id_A019()
{
    wait 10;
    self delete();
}

_id_4D97()
{
    if ( isdefined( anim._id_1E13 ) )
        return;

    anim._id_1E13 = [];
    anim._id_1E13["civilian_briefcase_walk"] = "com_metal_briefcase";
    anim._id_1E13["civilian_crazy_walk"] = "electronics_pda";
    anim._id_1E13["civilian_cellphone_walk"] = "com_cellphone_on";
    anim._id_1E13["sit_lunch_A"] = "com_cellphone_on";
    anim._id_1E13["civilian_soda_walk"] = "ma_cup_single_closed";
    anim._id_1E13["civilian_paper_walk"] = "paper_memo";
    anim._id_1E13["civilian_coffee_walk"] = "cs_coffeemug02";
    anim._id_1E13["civilian_pda_walk"] = "electronics_pda";
    anim._id_1E13["reading1"] = "open_book";
    anim._id_1E13["reading2"] = "open_book";
    anim._id_1E13["texting_stand"] = "electronics_pda";
    anim._id_1E13["texting_sit"] = "electronics_pda";
    anim._id_1E13["smoking1"] = "prop_cigarette";
    anim._id_1E13["smoking2"] = "prop_cigarette";
}

_id_8D31()
{
    self.turnrate = 0.2;

    if ( isdefined( self._id_1DFD ) )
    {
        var_0 = %civilian_briefcase_walk_dodge_l;
        var_1 = %civilian_briefcase_walk_dodge_r;

        if ( isdefined( level._id_78AC[self.animname]["dodge_left"] ) )
            var_0 = level._id_78AC[self.animname]["dodge_left"];

        if ( isdefined( level._id_78AC[self.animname]["dodge_right"] ) )
            var_1 = level._id_78AC[self.animname]["dodge_right"];

        animscripts\move::_id_7F53( var_0, var_1 );
    }

    if ( isdefined( level._id_78AC[self.animname]["turn_left_90"] ) )
    {
        self._id_66F5 = animscripts\civilian\civilian_move::_id_1DDA;
        self._id_66F4 = 0.1;
        maps\_utility::_id_3102();
    }
    else
        maps\_utility::_id_2AEA();

    self._id_76AF = level._id_78AC[self.animname]["run_noncombat"];
    self._id_A108 = self._id_76AF;
    self._id_76B1 = undefined;

    if ( self.animname == "default_civilian" )
    {
        self._id_76AE = level._id_78AC[self.animname]["run_weights_noncombat"];
        self._id_A107 = self._id_76AE;
    }
}

_id_8D04()
{
    self notify( "combat" );
    animscripts\move::_id_1EE8();
    self._id_66F4 = undefined;
    maps\_utility::_id_3102();
    self.turnrate = 0.3;
    var_0 = randomint( 3 ) < 1;

    if ( isdefined( self._id_398F ) )
        var_0 = 1;
    else if ( isdefined( self._id_398E ) )
        var_0 = 0;

    if ( var_0 )
    {
        self._id_66F5 = animscripts\civilian\civilian_move::_id_1DA5;
        self._id_76AF = level._id_78AC["default_civilian"]["run_combat"];
        self._id_76AE = level._id_78AC["default_civilian"]["run_weights"];
    }
    else
    {
        self._id_66F5 = animscripts\civilian\civilian_move::_id_1DA4;
        self._id_76AF = level._id_78AC["default_civilian"]["run_hunched_combat"];
        self._id_76AE = level._id_78AC["default_civilian"]["run_hunched_weights"];
    }

    self._id_76B1 = [];
    self._id_76B1[0] = %run_react_stumble;
    self._id_A108 = self._id_76AF;
    self._id_A107 = self._id_76AE;
}

_id_1CF8()
{
    self endon( "death" );
    self endon( "disable_combat_state_check" );
    var_0 = self.alertlevelint > 1;

    for (;;)
    {
        var_1 = self.alertlevelint > 1;

        if ( var_0 && !var_1 )
            _id_8D31();
        else if ( !var_0 && var_1 )
            _id_8D04();

        var_0 = var_1;
        wait 0.05;
    }
}
