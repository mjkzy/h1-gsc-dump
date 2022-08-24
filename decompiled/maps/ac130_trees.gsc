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
    level._effect["ac130_pinetree_trunk"] = loadfx( "vfx/map/ac130/ac130_pinetree_trunk" );
    precachemodel( "ac130_pine01_stump" );
    var_0 = 500;
    var_1 = getentarray( "ac130_tree", "targetname" );
    common_scripts\utility::_id_76BB( "ac130_tree", ::ac130_tree_setup );
}
#using_animtree("script_model");

ac130_tree_setup()
{
    self useanimtree( #animtree );
    self.ac130_tree_health = 900;
    self.ac130_tree_anims = [];
    self.ac130_tree_anims["still"] = %ac130_pine01_still;
    self.ac130_tree_anims["sway"][0] = %ac130_pine01_sway01;
    self.ac130_tree_anims["sway"][1] = %ac130_pine01_sway02;
    self.ac130_tree_anims["sway"][2] = %ac130_pine01_sway03;
    self.ac130_tree_anims["sway"][3] = %ac130_pine01_sway04;

    if ( isdefined( self.target ) )
    {
        var_0 = getent( self.target, "targetname" );

        if ( isdefined( var_0 ) )
        {
            var_0 setcandamage( 1 );
            self.ac130_hitbox = var_0;
            thread ac130_tree_think();
        }
    }
}

ac130_tree_wobble( var_0 )
{
    if ( self.ac130_tree_health < 0 )
    {
        ac130_tree_death();
        return;
    }

    var_1 = 1000.0;
    var_2 = clamp( var_0 / var_1, 0.5, 1.0 ) * randomfloatrange( 0.95, 1.05 );
    var_3 = self.ac130_tree_anims["sway"][randomint( self.ac130_tree_anims["sway"].size )];
    self _meth_814d( var_3, var_2, 0.0, randomfloatrange( 0.75, 1.25 ) );
    wait(getanimlength( var_3 ));
    self _meth_8144( var_3, 0.0 );
}

ac130_tree_death()
{
    var_0 = spawn( "script_model", self getorigin() );
    var_0 setmodel( "ac130_pine01_stump" );
    self hide();
    playfx( level._effect["ac130_pinetree_trunk"], self.origin );
    wait 1.0;
    self.ac130_hitbox delete();
    self notify( "death" );
    self delete();
}

ac130_tree_think()
{
    self endon( "death" );
    self _meth_814d( self.ac130_tree_anims["still"], 1.0, 0.0, 1.0 );

    for (;;)
    {
        self.ac130_hitbox waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
        {
            var_5 = var_1 getcurrentweapon();

            switch ( tolower( var_5 ) )
            {
                case "ac130_25mm":
                    ac130_tree_wobble( var_0 );
                    continue;
                case "ac130_40mm":
                    self.ac130_tree_health -= var_0;
                    ac130_tree_wobble( var_0 );
                    continue;
                case "ac130_105mm":
                    ac130_tree_death();
                    continue;
                default:
                    continue;
            }
        }
    }
}
