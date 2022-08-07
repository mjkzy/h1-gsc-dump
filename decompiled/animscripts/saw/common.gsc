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
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "saw" );

    if ( !isdefined( var_0 ) )
        return;

    self.a._id_8A1A = "saw";

    if ( isdefined( var_0._id_798E ) )
        var_1 = var_0._id_798E;
    else
        var_1 = maps\_mgturret::_id_192C( "delay" );

    if ( isdefined( var_0._id_798D ) )
        var_2 = var_0._id_798D - var_1;
    else
        var_2 = maps\_mgturret::_id_192C( "delay_range" );

    if ( isdefined( var_0._id_7968 ) )
        var_3 = var_0._id_7968;
    else
        var_3 = maps\_mgturret::_id_192C( "burst" );

    if ( isdefined( var_0._id_7967 ) )
        var_4 = var_0._id_7967 - var_3;
    else
        var_4 = maps\_mgturret::_id_192C( "burst_range" );

    var_5 = gettime();
    var_6 = "start";
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "none" );
    var_0 show();

    if ( isdefined( var_0._id_098B ) )
    {
        self.a._id_6E8D = ::_id_6E8D;
        self.a._id_9C3C = var_0;
        var_0 notify( "being_used" );
        thread _id_8F09();
    }
    else
        self.a._id_6E8D = ::_id_6F1D;

    var_0._id_2C7E = 0;
    thread _id_37D1( var_0 );
    self _meth_8197( self._id_6F8E );
    self _meth_8147( self._id_6F8E, 1, 0.2, 1 );
    self _meth_8148( self._id_07F5 );
    self _meth_8148( self._id_07F4 );
    var_0 _meth_8148( var_0._id_07F5 );
    var_0 _meth_8148( var_0._id_07F4 );
    var_0 endon( "death" );

    for (;;)
    {
        if ( var_0._id_2C7E )
        {
            thread _id_2D79( var_0 );
            _id_A0FB( randomfloatrange( var_3, var_3 + var_4 ), var_0 );
            var_0 notify( "turretstatechange" );

            if ( var_0._id_2C7E )
            {
                thread _id_2BE1( var_0 );
                wait(randomfloatrange( var_1, var_1 + var_2 ));
            }

            continue;
        }

        thread _id_2BE1( var_0 );
        var_0 waittill( "turretstatechange" );
    }
}

_id_A0FB( var_0, var_1 )
{
    var_1 endon( "turretstatechange" );
    wait(var_0);
}

_id_37D1( var_0 )
{
    self endon( "killanimscript" );
    var_1 = cos( 15 );

    for (;;)
    {
        while ( isdefined( self.enemy ) )
        {
            var_2 = self.enemy.origin;
            var_3 = var_0 gettagangles( "tag_aim" );

            if ( common_scripts\utility::_id_A347( var_0.origin, var_3, var_2, var_1 ) || distancesquared( var_0.origin, var_2 ) < 40000 )
            {
                if ( !var_0._id_2C7E )
                {
                    var_0._id_2C7E = 1;
                    var_0 notify( "turretstatechange" );
                }
            }
            else if ( var_0._id_2C7E )
            {
                var_0._id_2C7E = 0;
                var_0 notify( "turretstatechange" );
            }

            wait 0.05;
        }

        if ( var_0._id_2C7E )
        {
            var_0._id_2C7E = 0;
            var_0 notify( "turretstatechange" );
        }

        wait 0.05;
    }
}

_id_99C3( var_0, var_1 )
{
    if ( var_0 <= 0 )
        return;

    self endon( "killanimscript" );
    var_1 endon( "turretstatechange" );
    wait(var_0);
    var_1 notify( "turretstatechange" );
}

_id_8F09()
{
    self endon( "killanimscript" );

    for (;;)
    {
        if ( !isdefined( self.node_relinquished ) || distancesquared( self.origin, self.node_relinquished.origin ) > 4096 )
            self _meth_818f();

        wait 0.25;
    }
}

_id_6E8D( var_0 )
{
    if ( var_0 == "pain" )
    {
        if ( isdefined( self.node_relinquished ) && distancesquared( self.origin, self.node_relinquished.origin ) < 4096 )
        {
            self.a._id_9C3C hide();
            animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
            self.a._id_6E8D = ::_id_6E8B;
            return;
        }
        else
            self _meth_818f();
    }

    if ( var_0 == "saw" )
    {
        var_1 = self _meth_8198();
        return;
    }

    self.a._id_9C3C delete();
    self.a._id_9C3C = undefined;
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
}

_id_6E8B( var_0 )
{
    if ( !isdefined( self.node_relinquished ) || distancesquared( self.origin, self.node_relinquished.origin ) > 4096 )
    {
        self _meth_818f();
        self.a._id_9C3C delete();
        self.a._id_9C3C = undefined;

        if ( isdefined( self.weapon_switch_invalid ) && self.weapon_switch_invalid != "none" )
            animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
    }
    else if ( var_0 != "saw" )
        self.a._id_9C3C delete();
}

_id_6F1D( var_0 )
{
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "right" );
}
#using_animtree("generic_human");

_id_2D79( var_0 )
{
    self _meth_814d( %additive_saw_idle, 0, 0.1 );
    self _meth_814d( %additive_saw_fire, 1, 0.1 );
    var_0 _id_99B0();
    _id_99AF( var_0 );
}

_id_2BE1( var_0 )
{
    self _meth_814d( %additive_saw_idle, 1, 0.1 );
    self _meth_814d( %additive_saw_fire, 0, 0.1 );
    var_0 _id_99AE();
}

_id_99AF( var_0 )
{
    self endon( "killanimscript" );
    var_0 endon( "turretstatechange" );

    for (;;)
    {
        var_0 shootturret();
        wait 0.1;
    }
}
#using_animtree("mg42");

_id_99B0()
{
    self _meth_814d( %additive_saw_idle, 0, 0.1 );
    self _meth_814d( %additive_saw_fire, 1, 0.1 );
}

_id_99AE()
{
    self _meth_814d( %additive_saw_idle, 1, 0.1 );
    self _meth_814d( %additive_saw_fire, 0, 0.1 );
}
