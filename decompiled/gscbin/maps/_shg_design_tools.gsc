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

_id_0C16( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isarray( var_0 ) )
    {
        foreach ( var_3 in var_0 )
        {
            var_1 = var_3.animation;
            var_3 thread _id_4B55( var_1, self );
        }
    }
    else
    {
        if ( !isdefined( var_1 ) )
            var_1 = var_0.animation;

        var_0 _id_4B55( var_1, self );
    }
}

_id_4B55( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( _id_50B9( var_0 ) )
    {
        if ( isalive( self ) && self._id_5680 == "generic" )
            var_1 _id_A510::_id_0BCE( self, var_0, "stop_loop" );
        else if ( isalive( self ) )
            var_1 _id_A510::_id_0BE1( self, var_0, "stop_loop" );
    }
    else if ( isalive( self ) && isdefined( self._id_0C72 ) && self._id_0C72 != "generic" )
        var_1 _id_A510::_id_0C24( self, var_0 );
    else if ( isalive( self ) )
        var_1 _id_A510::_id_0BC9( self, var_0 );

    self notify( "anim_simple_done", var_0 );
}

_id_50B9( var_0 )
{
    if ( _id_50BA( var_0, "generic" ) )
        return 1;
    else if ( isdefined( self._id_0C72 ) && _id_50BA( var_0, self._id_0C72 ) )
        return 1;

    return 0;
}

_id_50BA( var_0, var_1 )
{
    if ( isarray( level._id_78AC[var_1] ) )
    {
        if ( isarray( level._id_78AC[var_1][var_0] ) )
        {
            if ( isdefined( level._id_78AC[var_1][var_0][0] ) )
            {
                self._id_5680 = var_1;
                return 1;
            }
        }
    }

    return 0;
}

_id_6215( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        level notify( var_1 );
        return;
    }

    if ( isarray( var_0 ) )
    {
        while ( isdefined( var_0 ) && var_0.size > 0 )
        {
            var_0 = _id_A5A4::_id_0CFF( var_0 );
            var_0 = common_scripts\utility::_id_0D01( var_0 );
            waittillframeend;
        }
    }
    else
        var_0 waittill( "death" );

    level notify( var_1 );
}

_id_43CF( var_0, var_1, var_2 )
{
    var_3 = gettime() * 0.001;

    while ( self.origin[2] > var_1[2] )
    {
        var_4 = var_2 * 0.5;
        var_5 = 1 * var_4 / 2;
        var_6 = gettime() * 0.001 - var_3;
        self.origin += ( 0, 0, var_5 * var_6 - 0.5 * var_4 * squared( var_6 ) );
        waittillframeend;
    }
}

_id_43D0( var_0, var_1, var_2 )
{
    var_3 = var_2 * 0.5;
    var_4 = 1;
    var_5 = gettime() * 0.001 - var_0;
    var_6 = var_4 * var_5 - 0.5 * var_3 * squared( var_5 );
    return ( 0, 0, var_6 );
}

_id_43CE( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = gettime() * 0.001;

    if ( isdefined( self ) && !isdefined( self._id_0C9C ) )
        self._id_0C9C = 0;

    while ( isdefined( self ) && gettime() * 0.001 <= var_5 + var_2 )
    {
        self._id_5570 = self.origin[2];
        self.origin = _id_0CC1( var_5, var_0, var_1, var_2, var_3, var_4 );

        if ( self.origin[2] < self._id_5570 )
            self._id_0C9C = 1;

        wait 0.05;
    }

    self notify( "item_landed" );
}

_id_0CC1( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 386;

    if ( !isdefined( var_5 ) )
        var_5 = 386;

    var_7 = var_4;

    if ( self._id_0C9C )
        var_7 = var_5;

    var_8 = var_7 * 0.5;
    var_6 = var_3 * var_8 / 2;
    var_9 = gettime() * 0.001 - var_0;
    var_10 = var_6 * var_9 - 0.5 * var_8 * squared( var_9 );
    var_11 = _id_A5A4::_id_576B( var_9 / var_3, var_1, var_2 ) + ( 0, 0, var_10 );
    return var_11;
}

_id_0C3C( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
        var_0 _id_A5A4::_id_0C3D();

    _id_A5A4::_id_0C3D();

    if ( isdefined( var_0 ) )
        var_0 notify( "stop_first_frame" );

    self notify( "stop_first_frame" );

    if ( isdefined( var_2 ) && var_2 && isdefined( var_0 ) )
        var_0 delete();
}

_id_311F( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [ self ];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_588F ) && var_2._id_588F > 0 )
            var_2._id_588F = 0;

        if ( isdefined( var_2._id_587A ) && var_2._id_587A.size > 0 )
            var_2._id_587A = [];
    }
}

_id_735F()
{
    if ( isdefined( level._id_24EC ) )
        level._id_24EC destroy();
}

_id_484C()
{
    if ( isdefined( level._id_24EC ) )
        level._id_24EC.alpha = 0;
}

_id_0C17( var_0, var_1, var_2 )
{
    level waittill( var_2 );

    if ( isdefined( var_0._id_0C72 ) && var_0._id_0C72 != "generic" )
        var_0 _id_A510::_id_7F29();

    _id_0C16( var_0, var_1 );
}

_id_51FE( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0.helmet < 1 )
        return 0;

    return 1;
}

_id_A30B( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( !isplayer( var_3 ) )
        var_3 = level.playercardbackground;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_4 = newclienthudelem( var_3 );
    var_4 setshader( "white", 1280, 720 );
    var_4.hostquits = "fullscreen";
    var_4.visionsetnight = "fullscreen";
    var_4.alpha = var_2;
    wait(var_0);
    var_4 fadeovertime( var_1 );
    var_4.alpha = 0;
}

_id_35EA( var_0, var_1, var_2, var_3 )
{
    var_4 = self;

    if ( !isplayer( var_4 ) )
        var_4 = level.playercardbackground;

    var_4._id_1171 = newclienthudelem( var_4 );
    var_4._id_1171 setshader( "black", 1280, 720 );
    var_4._id_1171.hostquits = "fullscreen";
    var_4._id_1171.visionsetnight = "fullscreen";
    var_4._id_1171.alpha = var_2;
    wait(var_0);
    var_4._id_1171 fadeovertime( var_1 );
    var_4._id_1171.alpha = var_3;
}

_id_23D4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( issplitscreen() )
        var_0 += 2;

    var_7 = undefined;

    if ( isdefined( var_3 ) )
        var_7 = _id_3E40( -60, undefined, var_3, 1, var_4, var_5 );
    else
        var_7 = _id_3E40( -60, undefined, undefined, 1, var_4, var_5 );

    var_8 = var_7 _id_4ADE( var_0, var_1 );
    var_8.land = var_2;
    return var_8;
}

_id_3E40( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = undefined;

    if ( !level.console )
        var_6 = -250;
    else if ( !isdefined( var_0 ) )
        var_6 = -225;
    else
        var_6 = var_0;

    if ( var_3 )
        var_6 = var_0;

    if ( !isdefined( var_1 ) )
        var_7 = 100;
    else
        var_7 = var_1;

    if ( isdefined( var_2 ) )
        var_8 = newclienthudelem( var_2 );
    else
        var_8 = newhudelem();

    if ( !isdefined( var_4 ) )
        var_4 = ( 0.8, 1, 0.8 );

    if ( !isdefined( var_5 ) )
        var_5 = ( 0.3, 0.6, 0.3 );

    var_8.alignx = "left";
    var_8.aligny = "middle";
    var_8.hostquits = "right";
    var_8.visionsetnight = "top";
    var_8.xpmaxmultipliertimeplayed = var_6;
    var_8._id_0538 = var_7;
    var_8.fontscale = 1.6;
    var_8.color = var_4;
    var_8.font = "objective";
    var_8.glowcolor = var_5;
    var_8.glowalpha = 1;
    var_8.foreground = 1;
    var_8.hindlegstraceoffset = 0;
    var_8.high_priority = 1;
    return var_8;
}

_id_4ADE( var_0, var_1 )
{
    self.alignx = "center";
    self.aligny = "top";
    self.hostquits = "center";
    self.visionsetnight = "middle";
    self.xpmaxmultipliertimeplayed = var_1;
    self._id_0538 = -160 + 15 * var_0;
    self.font = "objective";
    self.foreground = 1;
    self.hindlegstraceoffset = 1;
    self.high_priority = 1;
    self.space = 2;
    self.fontscale = 1.15;
    return self;
}

_id_895A( var_0 )
{
    if ( !isdefined( level._id_5E51 ) )
        level._id_5E51 = [];

    var_1 = common_scripts\utility::_id_8959();
    var_1 _id_0B9A( self );

    if ( isdefined( var_0 ) )
        var_1._id_90BF = var_0;

    level._id_5E51[level._id_5E51.size] = var_1;
    level._id_5E51 = common_scripts\utility::_id_0D01( level._id_5E51 );
    iprintln( level._id_5E51.size );
    return var_1;
}

_id_736B( var_0 )
{
    if ( isdefined( level._id_5E51 ) )
    {
        var_1 = 0;

        foreach ( var_3 in level._id_5E51 )
        {
            if ( isdefined( var_3._id_90BF ) && var_3._id_90BF == var_0 )
            {
                var_3 delete();
                var_1++;
            }
        }

        iprintln( var_1 );
    }
}

_id_0B9A( var_0 )
{
    if ( isdefined( var_0.origin ) )
        self.origin = var_0.origin;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;
}

_id_0CE0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = common_scripts\utility::_id_0CDD( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_2 );

    if ( isdefined( var_3 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_3 );

    if ( isdefined( var_4 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_4 );

    if ( isdefined( var_5 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_5 );

    if ( isdefined( var_6 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_6 );

    if ( isdefined( var_7 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_7 );

    if ( isdefined( var_8 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_8 );

    return var_9;
}

_id_56AB( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4 = distance( var_0, self.origin );
    var_5 = 0;
    var_6 = self.origin;

    while ( var_5 < var_4 )
    {
        var_7 = _id_3FFE( self.origin, var_0, var_1, var_2 );

        if ( var_7 == 0 )
            break;

        self.origin = vectorlerp( self.origin, var_0, var_7 );

        if ( isdefined( var_3 ) )
            self.angles += var_3;

        var_5 = distance( self.origin, var_6 );
        waittillframeend;
    }

    self notify( "lerp_complete" );
}

_id_3FFE( var_0, var_1, var_2, var_3 )
{
    var_4 = distance( var_0, var_1 );

    if ( var_2 == 0 || var_4 == 0 )
        return 0;

    var_5 = var_2 / var_4 * 0.05;

    if ( var_5 > 0 )
        return var_5;
    else
        return 0;
}

_id_407F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
    {
        var_5 = 10;
        var_6 = 20;
        var_7 = 30;
    }
    else
    {
        var_5 = var_4;
        var_6 = var_4 + 10;
        var_7 = var_4 + 20;
    }

    var_8 = ( perlinnoise2d( gettime() * 0.001 * 0.05, var_5, var_0, var_1, var_2 ) * var_3, perlinnoise2d( gettime() * 0.001 * 0.05, var_6, var_0, var_1, var_2 ) * var_3, perlinnoise2d( gettime() * 0.001 * 0.05, var_7, var_0, var_1, var_2 ) * var_3 );
    return var_8;
}

_id_0B9D( var_0 )
{
    if ( isdefined( var_0.origin ) )
        self.origin = var_0.origin;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;
}

_id_27FC()
{
    self waittill( "goal" );
    self delete();
}

_id_2801()
{
    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_67C6( var_0 )
{
    if ( randomint( 100 ) <= var_0 )
        return 1;

    return 0;
}

_id_072C( var_0 )
{
    if ( !isdefined( self.count ) || self.count < 1 )
        self.count = 1;

    var_1 = _id_A5A4::_id_88C3( 1 );
    _id_A5A4::_id_88F1( var_1 );

    if ( isdefined( var_0 ) )
    {
        while ( !isdefined( var_1 ) )
        {
            self.count = 1;
            var_1 = _id_A5A4::_id_88C3( 1 );
            _id_A5A4::_id_88F1( var_1 );
            waittillframeend;
        }
    }

    return var_1;
}

_id_88EC( var_0, var_1, var_2 )
{
    if ( isarray( var_1 ) )
        var_3 = var_1;
    else
        var_3[0] = var_1;

    var_4 = [];

    for ( var_5 = 0; var_5 < var_0; var_5++ )
    {
        var_6 = common_scripts\utility::_id_710E( var_3 );
        var_7 = var_6 _id_072C();

        if ( !isdefined( var_7 ) )
            continue;

        if ( isdefined( var_2 ) )
            var_7 _meth_81ad( var_2 );

        var_4[var_4.size] = var_7;
        wait 0.1;
    }

    return var_4;
}

_id_9806( var_0, var_1 )
{
    _id_A0C2( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    level notify( var_1 );
}

_id_8EE9( var_0, var_1, var_2, var_3 )
{
    self waittill( var_3 );

    if ( isdefined( var_1 ) )
        stopfxontag( var_0, var_1, var_2 );
}

_id_8EEB( var_0, var_1, var_2, var_3 )
{
    wait(var_3);

    if ( isdefined( var_1 ) )
        stopfxontag( var_0, var_1, var_2 );
}

_id_A0C2( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        var_1 = getent( var_0, "script_noteworthy" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 waittill( "trigger" );
}

_id_4BFE( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 300;

    var_4 = [];

    foreach ( var_6 in var_0 )
    {
        if ( distance( var_6.origin, var_2 ) < var_1 )
            var_4[var_4.size] = var_6;
    }

    if ( var_4.size <= 0 )
        return;

    var_4 = sortbydistance( var_4, var_2 );
    var_8 = var_2;

    foreach ( var_6 in var_4 )
    {
        if ( !isdefined( var_6 ) )
            continue;

        if ( var_6 _id_A5A8::_id_51FD() )
        {
            var_6 dodamage( var_6.helmet * 2, var_2 );
            continue;
        }

        var_10 = distance( var_8, var_6.origin );
        var_11 = var_10 / var_3 * 0.05;
        wait(var_11);
        var_8 = var_6.origin;
        var_12 = vectornormalize( var_6 gettagorigin( "tag_eye" ) - var_2 );
        var_12 = vectornormalize( var_12 + ( 0, 0, 0.2 ) );
        var_6 startragdollfromimpact( "torso_lower", var_12 * 7000 );
        var_6 thread common_scripts\utility::_id_27CD( 2, ::kill );
    }
}

_id_8893( var_0, var_1 )
{
    return sortbydistance( var_0, var_1, 0, 1 );
}

_id_7E1A( var_0 )
{
    if ( !_id_A5A4::_id_32DC( var_0 ) )
        _id_A5A4::_id_32DD( var_0 );

    self waittill( var_0 );
    _id_A5A4::_id_32D8( var_0 );
}

_id_9805( var_0, var_1 )
{
    if ( !common_scripts\utility::_id_3839( var_1 ) )
        common_scripts\utility::_id_383D( var_1 );

    var_2 = getentarray( var_0, "targetname" );
    var_2[0] waittill( "trigger" );
    common_scripts\utility::_id_383F( var_1 );
}

_id_3854( var_0, var_1 )
{
    var_2 = randomfloat( 1000.0 );
    var_3 = "flag_or_timeout" + var_2;
    level endon( var_3 );
    level thread _id_A5A4::_id_61FD( var_3, var_1 );
    common_scripts\utility::_id_384A( var_0 );
}

_id_5371()
{
    self endon( "death" );
    self waittill( "bad_path" );

    if ( !isdefined( self._id_27F2 ) || !self._id_27F2 )
        self kill();
}

_id_637C( var_0, var_1, var_2 )
{
    var_3 = self gettagangles( var_1 );
    var_4 = self gettagorigin( var_1 );

    if ( var_0 == "up" )
        return var_4 + anglestoup( var_3 ) * var_2;

    if ( var_0 == "down" )
        return var_4 + anglestoup( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "right" )
        return var_4 + anglestoright( var_3 ) * var_2;

    if ( var_0 == "left" )
        return var_4 + anglestoright( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "forward" )
        return var_4 + anglestoforward( var_3 ) * var_2;

    if ( var_0 == "backward" )
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "backwardright" )
    {
        var_4 += anglestoright( var_3 ) * var_2;
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );
    }

    if ( var_0 == "backwardleft" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * -1 );
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );
    }

    if ( var_0 == "forwardright" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * 1 );
        return var_4 + anglestoforward( var_3 ) * var_2;
    }

    if ( var_0 == "forwardleft" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * -1 );
        return var_4 + anglestoforward( var_3 ) * var_2;
    }
}

_id_3F35( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_6 = distance( var_5.origin, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_4122( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = common_scripts\utility::_id_40FB( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = getnode( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = getvehiclenode( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;
}

_id_4123( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = common_scripts\utility::_id_40FD( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = getnodearray( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = getvehiclenodearray( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;
}

_id_5916( var_0 )
{
    var_1 = _id_A581::_id_89C1( var_0 );
    var_1._id_0C72 = "generic";
    var_1 _id_A5A4::_id_4462();
    return var_1;
}

_id_4FAF( var_0, var_1 )
{
    if ( !isdefined( level.playercardbackground._id_8F85 ) )
    {
        level.playercardbackground._id_8F85 = [];
        level._id_8F84 = 0;
    }

    var_2 = newclienthudelem( level.playercardbackground );
    var_2.xpmaxmultipliertimeplayed = 320;
    var_2._id_0538 = 325;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2.fontscale = 1.5;
    var_2 settext( var_0 );
    var_2.alpha = 0;
    var_2.color = ( 1, 1, 1 );
    var_2.glowcolor = ( 0.6, 0.6, 0.9 );
    var_2.glowalpha = 0.4;
    var_2.space = -10;
    var_2.font = "objective";
    level.playercardbackground._id_8F85[level.playercardbackground._id_8F85.size] = var_2;
    level notify( "new_subtitle_created" );
    level.playercardbackground thread _id_2838( 10, var_2, level._id_8F84 );
    level.playercardbackground thread _id_84F2( var_2, level._id_8F84 );
    level._id_8F84 = ( level._id_8F84 + 1 ) % 10;

    if ( isdefined( var_1 ) )
        wait(var_1);
}

_id_84F2( var_0, var_1 )
{
    var_2 = "delete_subtitle_hud" + var_1;
    var_3 = 0;
    var_4 = 19;
    var_0 fadeovertime( 0.5 );
    var_0.alpha = 1;
    level endon( var_2 );

    while ( isdefined( var_0 ) )
    {
        level waittill( "new_subtitle_created" );
        var_3++;

        if ( !isdefined( var_0 ) )
            break;

        var_0 moveovertime( 0.35 );
        var_0._id_0538 = 325 + var_3 * var_4;
        var_0.color = ( 1, 1, 1 );
        var_0.glowalpha = 0;
        var_0.alpha = 0.9 - var_3 / 5;
        waittillframeend;
    }
}

_id_2838( var_0, var_1, var_2 )
{
    var_3 = "delete_subtitle_hud" + var_2;
    level thread _id_A5A4::_id_61FD( var_3, var_0 );
    level waittill( var_3 );
    self._id_8F85 = common_scripts\utility::_id_0CF6( self._id_8F85, var_1 );
    var_1 destroy();
}

_id_21A0( var_0 )
{
    return var_0 / 255;
}

_id_3E6F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = var_0;
    var_11 = var_5 * var_2 + var_1;

    if ( !isdefined( var_6 ) )
        var_6 = ( 0.8, 1, 0.8 );

    if ( !isdefined( var_7 ) )
        var_7 = ( var_6[0] / 2, var_6[1] / 2, var_6[2] / 2 );

    if ( !isdefined( var_3 ) )
        var_3 = "center";

    if ( !isdefined( var_4 ) )
        var_4 = "middle";

    if ( !isdefined( var_8 ) )
        var_8 = "center";

    if ( !isdefined( var_9 ) )
        var_9 = "middle";

    var_12 = newclienthudelem( level.playercardbackground );
    var_12.alignx = var_3;
    var_12.aligny = var_4;
    var_12.hostquits = var_8;
    var_12.visionsetnight = var_9;
    var_12.xpmaxmultipliertimeplayed = var_10;
    var_12._id_0538 = var_11;
    var_12.fontscale = 1.6;
    var_12.color = var_6;
    var_12.font = "objective";
    var_12.glowcolor = var_7;
    var_12.glowalpha = 1;
    var_12.foreground = 1;
    var_12.hindlegstraceoffset = 1;
    var_12.high_priority = 1;
    return var_12;
}

_id_621E( var_0, var_1, var_2, var_3 )
{
    var_0 waittill( var_1 );
    var_2 notify( var_3 );
}
