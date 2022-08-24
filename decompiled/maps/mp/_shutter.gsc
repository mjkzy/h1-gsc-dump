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
    level.inc = 0;
    common_scripts\utility::_id_0CF0( getentarray( "wire", "targetname" ), ::_id_A344 );
    var_0 = getentarray( "shutter_left", "targetname" );
    var_1 = getentarray( "shutter_right_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    var_1 = getentarray( "shutter_left_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 rotateto( ( var_3.angles[0], var_3.angles[1] + 180, var_3.angles[2] ), 0.1 );
    }

    wait 0.2;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2]._id_8D4A = var_0[var_2].angles[1];

    var_4 = getentarray( "shutter_right", "targetname" );
    var_1 = getentarray( "shutter_left_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    var_1 = getentarray( "shutter_right_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
        var_4[var_2]._id_8D4A = var_4[var_2].angles[1];

    var_1 = undefined;
    var_5 = "left";

    for (;;)
    {
        common_scripts\utility::_id_0CF0( var_0, ::_id_8559, var_5 );
        common_scripts\utility::_id_0CF0( var_4, ::_id_855A, var_5 );
        level waittill( "wind blows", var_5 );
    }
}

_id_A333()
{
    for (;;)
    {
        var_0 = "left";

        if ( randomint( 100 ) > 50 )
            var_0 = "right";

        level notify( "wind blows", var_0 );
        wait(2 + randomfloat( 10 ));
    }
}

_id_8559( var_0, var_1 )
{
    level.inc++;
    level endon( "wind blows" );
    var_2 = var_0._id_8D4A;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait(var_3 + 0.1);

    for (;;)
    {
        var_4 = randomint( 80 );

        if ( randomint( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_8D4A || var_2 > var_0._id_8D4A + 179 )
            var_2 = var_5;

        var_6 = abs( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + randomfloat( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }
}

_id_855A( var_0, var_1 )
{
    level.inc++;
    level endon( "wind blows" );
    var_2 = var_0._id_8D4A;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait(var_3 + 0.1);

    for (;;)
    {
        var_4 = randomint( 80 );

        if ( randomint( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_8D4A || var_2 > var_0._id_8D4A + 179 )
            var_2 = var_5;

        var_6 = abs( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + randomfloat( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }
}

_id_A344( var_0 )
{
    var_1 = getentarray( var_0.target, "targetname" );
    var_2 = var_1[0].origin;
    var_3 = var_1[1].origin;
    var_4 = vectortoangles( var_2 - var_3 );
    var_5 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_5.origin = var_2 * 0.5 + var_3 * 0.5;
    var_5.angles = var_4;
    var_0 linkto( var_5 );
    var_6 = 2;
    var_7 = 0.9;
    var_8 = 4 + randomfloat( 2 );
    var_5 rotateroll( var_8 * 0.5, 0.2 );
    wait 0.2;

    for (;;)
    {
        var_9 = var_6 + randomfloat( var_7 ) - var_7 * 0.5;
        var_5 rotateroll( var_8, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait(var_9);
        var_5 rotateroll( var_8 * -1, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait(var_9);
    }
}
