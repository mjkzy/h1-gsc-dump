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

_id_2E58()
{
    assign_drone_tree();
    self startusingheroonlylighting();

    if ( isdefined( self._id_7A41 ) )
        self._id_5F65 = self._id_7A41;
    else
        self._id_5F65 = 1;

    if ( self.team == "allies" )
    {
        maps\_names::_id_3DE2();

        if ( isdefined( self.name ) )
            self setlookattext( self.name, &"" );
    }

    if ( isdefined( level._id_2EFA ) )
        self thread [[ level._id_2EFA ]]();

    if ( !isdefined( self._id_79ED ) )
        level thread maps\_friendlyfire::_id_3A59( self );

    if ( !isdefined( level.ai_dont_glow_in_thermal ) )
        _id_9302();
}

_id_9302()
{
    if ( !isdefined( level._id_2F2F ) )
        level._id_2F2F = "all";

    var_0 = 0;

    switch ( level._id_2F2F )
    {
        case "all":
            var_0 = 1;
            break;
        case "axis":
            var_0 = self.team == "axis";
            break;
        default:
            break;
    }

    if ( var_0 )
        self thermaldrawenable();
}

_id_2E62()
{
    if ( !isdefined( self.target ) )
        return;

    if ( isdefined( level._id_2E9E[self.target] ) )
        return;

    level._id_2E9E[self.target] = 1;
    var_0 = self.target;
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = [];
    var_3 = [];
    var_4 = var_1;

    for (;;)
    {
        var_1 = var_4;
        var_5 = 0;

        for (;;)
        {
            if ( !isdefined( var_1.target ) )
                break;

            var_6 = common_scripts\utility::_id_40FD( var_1.target, "targetname" );

            if ( var_6.size )
                break;

            var_7 = undefined;

            foreach ( var_9 in var_6 )
            {
                if ( isdefined( var_3[var_9.origin + ""] ) )
                    continue;

                var_7 = var_9;
                break;
            }

            if ( !isdefined( var_7 ) )
                break;

            var_3[var_7.origin + ""] = 1;
            var_2[var_1.targetname] = var_7.origin - var_1.origin;
            var_1.angles = vectortoangles( var_2[var_1.targetname] );
            var_1 = var_7;
            var_5 = 1;
        }

        if ( !var_5 )
            break;
    }

    var_0 = self.target;
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_11 = var_1;
    var_3 = [];

    for (;;)
    {
        var_1 = var_4;
        var_5 = 0;

        for (;;)
        {
            if ( !isdefined( var_1.target ) )
                return;

            if ( !isdefined( var_2[var_1.targetname] ) )
                return;

            var_6 = common_scripts\utility::_id_40FD( var_1.target, "targetname" );

            if ( var_6.size )
                break;

            var_7 = undefined;

            foreach ( var_9 in var_6 )
            {
                if ( isdefined( var_3[var_9.origin + ""] ) )
                    continue;

                var_7 = var_9;
                break;
            }

            if ( !isdefined( var_7 ) )
                break;

            if ( isdefined( var_1.radius ) )
            {
                var_14 = var_2[var_11.targetname];
                var_15 = var_2[var_1.targetname];
                var_16 = ( var_14 + var_15 ) * 0.5;
                var_1.angles = vectortoangles( var_16 );
            }

            var_5 = 1;
            var_11 = var_1;
            var_1 = var_7;
        }

        if ( !var_5 )
            break;
    }
}

assign_drone_tree()
{
    if ( isdefined( self.type ) )
    {
        if ( self.type == "dog" )
            assign_animals_tree();
        else
            assign_generic_human_tree();
    }
}
#using_animtree("generic_human");

assign_generic_human_tree()
{
    self useanimtree( #animtree );
}
#using_animtree("animals");

assign_animals_tree()
{
    self useanimtree( #animtree );
}
