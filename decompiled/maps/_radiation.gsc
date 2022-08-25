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
    precachestring( &"SCOUTSNIPER_MRHR" );
    precachestring( &"SCRIPT_RADIATION_DEATH" );
    precacheshellshock( "radiation_low" );
    precacheshellshock( "radiation_med" );
    precacheshellshock( "radiation_high" );

    foreach ( var_2, var_1 in level.players )
    {
        var_1.radiation = spawnstruct();
        var_1.radiation.super_dose = 0;
        var_1.radiation.inside = 0;
        var_1 maps\_utility::_id_32DD( "_radiation_poisoning" );
    }

    common_scripts\utility::_id_76BB( "radiation", ::updateradiationtriggers );
    common_scripts\utility::_id_76BB( "super_radiation", ::super_radiation_trigger );
    common_scripts\utility::array_thread( level.players, ::updateradiationdosage );
    common_scripts\utility::array_thread( level.players, ::updateradiationdosimeter );
    common_scripts\utility::array_thread( level.players, ::updateradiationshock );
    common_scripts\utility::array_thread( level.players, ::updateradiationblackout );
    common_scripts\utility::array_thread( level.players, ::updateradiationsound );
    common_scripts\utility::array_thread( level.players, ::updateradiationflag );
    common_scripts\utility::array_thread( level.players, ::first_radiation_dialogue );
}

updateradiationtriggers()
{
    self._id_5BA6 = 0;

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread updateradiationtrigger_perplayer( var_0 );
    }
}

updateradiationtrigger_perplayer( var_0 )
{
    if ( var_0.radiation.inside )
        return;

    var_0.radiation.inside = 1;
    var_0.radiation.triggers[var_0.radiation.triggers.size] = self;

    while ( var_0 istouching( self ) )
        wait 0.05;

    var_0.radiation.inside = 0;
    var_0.radiation.triggers = common_scripts\utility::array_remove( var_0.radiation.triggers, self );
}

super_radiation_trigger()
{
    self waittill( "trigger", var_0 );
    var_0.radiation.super_dose = 1;
}

updateradiationdosage()
{
    self.radiation.triggers = [];
    self.radiation.rate = 0;
    self.radiation.ratepercent = 0;
    self.radiation._id_93F3 = 0;
    self.radiation.totalpercent = 0;
    var_0 = 1;
    var_1 = 0;
    var_2 = 1100000 / 60 * var_0;
    var_3 = 200000;
    var_4 = var_2 - var_1;

    for (;;)
    {
        var_5 = [];

        for ( var_6 = 0; var_6 < self.radiation.triggers.size; var_6++ )
        {
            var_7 = self.radiation.triggers[var_6];
            var_8 = distance( self.origin, var_7.origin ) - 15;
            var_5[var_6] = var_2 - var_2 / var_7.radius * var_8;
        }

        var_9 = 0;

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            var_9 += var_5[var_6];

        if ( var_9 < var_1 )
            var_9 = var_1;

        if ( var_9 > var_2 )
            var_9 = var_2;

        self.radiation.rate = var_9;
        self.radiation.ratepercent = ( var_9 - var_1 ) / var_4 * 100;

        if ( self.radiation.super_dose )
        {
            var_9 = var_2;
            self.radiation.ratepercent = 100;
        }

        if ( self.radiation.ratepercent > 25 )
        {
            self.radiation._id_93F3 += var_9;
            self.radiation.totalpercent = self.radiation._id_93F3 / var_3 * 100;
        }
        else if ( self.radiation.ratepercent < 1 && self.radiation._id_93F3 > 0 )
        {
            self.radiation._id_93F3 -= 1500;

            if ( self.radiation._id_93F3 < 0 )
                self.radiation._id_93F3 = 0;

            self.radiation.totalpercent = self.radiation._id_93F3 / var_3 * 100;
        }

        wait(var_0);
    }
}

updateradiationshock()
{
    var_0 = 1;

    for (;;)
    {
        if ( self.radiation.ratepercent >= 75 )
        {
            self shellshock( "radiation_high", 5 );
            soundscripts\_snd::_id_870C( "aud_radiation_shellshock", "radiation_high" );
        }
        else if ( self.radiation.ratepercent >= 50 )
        {
            self shellshock( "radiation_med", 5 );
            soundscripts\_snd::_id_870C( "aud_radiation_shellshock", "radiation_med" );
        }
        else if ( self.radiation.ratepercent > 25 )
        {
            self shellshock( "radiation_low", 5 );
            soundscripts\_snd::_id_870C( "aud_radiation_shellshock", "radiation_low" );
        }
        else if ( self.radiation.ratepercent <= 25 && self.radiation.ratepercent > 0 )
            soundscripts\_snd::_id_870C( "aud_radiation_shellshock", "radiation_none" );

        wait(var_0);
    }
}

updateradiationsound()
{
    thread playradiationsound();

    for (;;)
    {
        if ( self.radiation.ratepercent >= 75 )
            self.radiation._id_8899 = "item_geigercouner_level4";
        else if ( self.radiation.ratepercent >= 50 )
            self.radiation._id_8899 = "item_geigercouner_level3";
        else if ( self.radiation.ratepercent >= 25 )
            self.radiation._id_8899 = "item_geigercouner_level2";
        else if ( self.radiation.ratepercent > 0 )
            self.radiation._id_8899 = "item_geigercouner_level1";
        else
            self.radiation._id_8899 = "none";

        wait 0.05;
    }
}

updateradiationflag()
{
    for (;;)
    {
        if ( self.radiation.ratepercent > 25 )
            maps\_utility::_id_32DE( "_radiation_poisoning" );
        else
            maps\_utility::_id_32DA( "_radiation_poisoning" );

        wait 0.05;
    }
}

playradiationsound()
{
    wait 0.05;
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    var_1 = self.radiation._id_8899;

    for (;;)
    {
        if ( var_1 != self.radiation._id_8899 )
        {
            var_0 stoploopsound();

            if ( isdefined( self.radiation._id_8899 ) && self.radiation._id_8899 != "none" )
                var_0 playloopsound( self.radiation._id_8899 );
        }

        var_1 = self.radiation._id_8899;
        wait 0.05;
    }
}

updateradiationratepercent()
{
    var_0 = 0.05;
    var_1 = newclienthudelem( self );
    var_1.fontscale = 1.2;
    var_1.x = 670;
    var_1.y = 350;
    var_1.alignx = "right";
    var_1.label = "";
    var_1.alpha = 0;

    for (;;)
    {
        var_1.label = self.radiation.ratepercent;
        wait(var_0);
    }
}

updateradiationdosimeter()
{
    var_0 = 0.028;
    var_1 = 100;
    var_2 = 1;
    var_3 = var_1 - var_0;
    var_4 = self.origin;
    var_5 = newclienthudelem( self );
    var_5.fontscale = 1.2;
    var_5.x = 676;
    var_5.y = 360;
    var_5.alpha = 0;
    var_5.alignx = "right";
    var_5.label = &"SCOUTSNIPER_MRHR";
    var_5 thread updateradiationdosimetercolor( self );

    for (;;)
    {
        if ( self.radiation.rate <= var_0 )
        {
            var_6 = randomfloatrange( -0.001, 0.001 );
            var_5 setvalue( var_0 + var_6 );
        }
        else if ( self.radiation.rate > var_1 )
            var_5 setvalue( var_1 );
        else
            var_5 setvalue( self.radiation.rate );

        wait(var_2);
    }
}

updateradiationdosimetercolor( var_0 )
{
    var_1 = 0.05;

    for (;;)
    {
        var_2 = 1;
        var_3 = 0.13;

        while ( var_0.radiation.rate >= 100 )
        {
            if ( var_2 <= 0 || var_2 >= 1 )
                var_3 *= -1;

            var_2 += var_3;

            if ( var_2 <= 0 )
                var_2 = 0;

            if ( var_2 >= 1 )
                var_2 = 1;

            self.color = ( 1, var_2, var_2 );
            wait(var_1);
        }

        self.color = ( 1.0, 1.0, 1.0 );
        wait(var_1);
    }
}

updateradiationblackout()
{
    level endon( "special_op_terminated" );
    self endon( "death" );
    var_0 = newclienthudelem( self );
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 0;
    var_1 = 1;
    var_2 = 4;
    var_3 = 0.25;
    var_4 = 1;
    var_5 = 25;
    var_6 = 100;
    var_7 = 0;

    for (;;)
    {
        while ( self.radiation.totalpercent > 25 && self.radiation.ratepercent > 25 )
        {
            var_8 = var_6 - var_5;
            var_7 = ( self.radiation.totalpercent - var_5 ) / var_8;

            if ( var_7 < 0 )
                var_7 = 0;
            else if ( var_7 > 1 )
                var_7 = 1;

            var_9 = var_2 - var_1;
            var_10 = var_1 + var_9 * ( 1 - var_7 );
            var_11 = var_4 - var_3;
            var_12 = var_3 + var_11 * var_7;
            var_13 = 7.2 * var_12;
            var_14 = var_7 * 0.5;
            var_15 = 7.2 * var_14;

            if ( var_7 == 1 )
                break;

            var_16 = var_10 / 2;
            var_0 _id_35F1( var_16, var_12, var_13, self );
            var_0 _id_35F6( var_16, var_14, var_15, self );
            wait(var_7 * 0.5);
        }

        if ( var_7 == 1 )
            break;

        if ( var_0.alpha != 0 )
            var_0 _id_35F6( 1, 0, 0, self );

        wait 0.05;
    }

    var_0 _id_35F1( 2, 1, 6, self );
    thread radiation_kill();
}

radiation_kill()
{
    self._id_8A2A = 1;
    self._id_8A2B = 1;
    self.radiationdeath = 1;

    if ( !maps\_utility::_id_5346() )
        return;

    waitframe;
    var_0 = &"SCRIPT_RADIATION_DEATH";
    setdvar( "ui_deadquote", var_0 );
}

_id_35F1( var_0, var_1, var_2, var_3 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    var_3 setblurforplayer( var_2, var_0 );
    wait(var_0);
}

_id_35F6( var_0, var_1, var_2, var_3 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    var_3 setblurforplayer( var_2, var_0 );
    wait(var_0);
}

first_radiation_dialogue()
{
    self endon( "death" );

    for (;;)
    {
        maps\_utility::_id_32E0( "_radiation_poisoning" );

        if ( level.script == "scoutsniper" || level.script == "co_scoutsniper" )
            level thread maps\_utility::_id_3AF2( maps\_utility::_id_70BD, "scoutsniper_mcm_youdaft" );

        level notify( "radiation_warning" );
        maps\_utility::_id_32E4( "_radiation_poisoning" );
        wait 10;
    }
}
