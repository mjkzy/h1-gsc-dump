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

_id_7FDC( var_0 )
{
    if ( isdefined( self._id_6685 ) && self._id_6685 == var_0 )
        return;

    if ( isdefined( self._id_6685 ) )
        self._id_6685 _id_7399( self );

    self._id_6685 = var_0;
    self._id_6685 _id_07D8( self );

    if ( isdefined( self._id_6E19 ) )
        _id_7FEE( self._id_6E19, self._id_730A, self._id_A39F, self._id_A3BA );
    else
        _id_7FEE( "TOPLEFT" );
}

_id_407A()
{
    return self._id_6685;
}

_id_739D()
{
    if ( isdefined( self._id_1D3C ) && self._id_1D3C == gettime() )
        return;

    self._id_1D3C = gettime();
    var_0 = [];

    foreach ( var_3, var_2 in self._id_1D3D )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2.index = var_0.size;
        var_0[var_0.size] = var_2;
    }

    self._id_1D3D = var_0;
}

_id_07D8( var_0 )
{
    var_0.index = self._id_1D3D.size;
    self._id_1D3D[self._id_1D3D.size] = var_0;
    _id_739D();
}

_id_7399( var_0 )
{
    var_0._id_6685 = undefined;

    if ( self._id_1D3D[self._id_1D3D.size - 1] != var_0 )
    {
        self._id_1D3D[var_0.index] = self._id_1D3D[self._id_1D3D.size - 1];
        self._id_1D3D[var_0.index].index = var_0.index;
    }

    self._id_1D3D[self._id_1D3D.size - 1] = undefined;
    var_0.index = undefined;
}

_id_7FEE( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = _id_407A();

    if ( var_4 )
        self moveovertime( var_4 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self._id_A39F = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self._id_A3BA = var_3;
    self._id_6E19 = var_0;
    self.alignx = "center";
    self.aligny = "middle";

    if ( issubstr( var_0, "TOP" ) )
        self.aligny = "top";

    if ( issubstr( var_0, "BOTTOM" ) )
        self.aligny = "bottom";

    if ( issubstr( var_0, "LEFT" ) )
        self.alignx = "left";

    if ( issubstr( var_0, "RIGHT" ) )
        self.alignx = "right";

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self._id_730A = var_1;
    var_6 = "center";
    var_7 = "middle";

    if ( issubstr( var_1, "TOP" ) )
        var_7 = "top";

    if ( issubstr( var_1, "BOTTOM" ) )
        var_7 = "bottom";

    if ( issubstr( var_1, "LEFT" ) )
        var_6 = "left";

    if ( issubstr( var_1, "RIGHT" ) )
        var_6 = "right";

    if ( var_5 == level._id_99F4 )
    {
        self.horzalign = var_6;
        self.vertalign = var_7;
    }
    else
    {
        self.horzalign = var_5.horzalign;
        self.vertalign = var_5.vertalign;
    }

    if ( var_6 == var_5.alignx )
    {
        var_8 = 0;
        var_9 = 0;
    }
    else if ( var_6 == "center" || var_5.alignx == "center" )
    {
        var_8 = int( var_5.width / 2 );

        if ( var_6 == "left" || var_5.alignx == "right" )
            var_9 = -1;
        else
            var_9 = 1;
    }
    else
    {
        var_8 = var_5.width;

        if ( var_6 == "left" )
            var_9 = -1;
        else
            var_9 = 1;
    }

    self.x = var_5.x + var_8 * var_9;

    if ( var_7 == var_5.aligny )
    {
        var_10 = 0;
        var_11 = 0;
    }
    else if ( var_7 == "middle" || var_5.aligny == "middle" )
    {
        var_10 = int( var_5.height / 2 );

        if ( var_7 == "top" || var_5.aligny == "bottom" )
            var_11 = -1;
        else
            var_11 = 1;
    }
    else
    {
        var_10 = var_5.height;

        if ( var_7 == "top" )
            var_11 = -1;
        else
            var_11 = 1;
    }

    self.y = var_5.y + var_10 * var_11;
    self.x += self._id_A39F;
    self.y += self._id_A3BA;

    switch ( self._id_3026 )
    {
        case "bar":
            _id_7FEF( var_0, var_1, var_2, var_3 );
            break;
    }

    _id_9B01( var_4 );
}

_id_7FEF( var_0, var_1, var_2, var_3 )
{
    self._id_12DB.horzalign = self.horzalign;
    self._id_12DB.vertalign = self.vertalign;
    self._id_12DB.alignx = "left";
    self._id_12DB.aligny = self.aligny;
    self._id_12DB.y = self._id_12DB.offset_y + self.y;

    if ( self.alignx == "left" )
        self._id_12DB.x = self._id_12DB.offset_x + self.x + self._id_A3A3;
    else if ( self.alignx == "right" )
        self._id_12DB.x = self._id_12DB.offset_x + self.x - ( self.width - self._id_A3A3 );
    else
        self._id_12DB.x = self._id_12DB.offset_x + self.x - int( ( self.width - self._id_A3A3 * 2 ) / 2 );

    if ( isdefined( self.progress_bg_distort ) )
    {
        self.progress_bg_distort.x = self.x;
        self.progress_bg_distort.y = self.y;
        self.progress_bg_distort.horzalign = self.horzalign;
        self.progress_bg_distort.vertalign = self.vertalign;
        self.progress_bg_distort.alignx = self.alignx;
        self.progress_bg_distort.aligny = self.aligny;
    }

    _id_9AF7( self._id_12DB._id_3A08 );
}

_id_9AF7( var_0 )
{
    var_1 = int( ( self.width - self._id_A3A3 * 2 ) * var_0 );

    if ( !var_1 )
        var_1 = 1;

    self._id_12DB._id_3A08 = var_0;
    self._id_12DB setshader( self._id_12DB._id_8392, var_1, self.height - self._id_A3BD * 2 );
}

_id_486E( var_0 )
{
    var_0 = common_scripts\utility::_id_9294( isdefined( var_0 ), var_0, 1 );

    if ( var_0 || !isdefined( self._id_658B ) || !isdefined( self._id_12DB._id_658B ) )
    {
        self._id_658B = self.alpha;
        self._id_12DB._id_658B = self._id_12DB.alpha;
    }

    self.alpha = common_scripts\utility::_id_9294( var_0, 0, self._id_658B );
    self._id_12DB.alpha = common_scripts\utility::_id_9294( var_0, 0, self._id_12DB._id_658B );
}

_id_2401( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2._id_3026 = "font";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    return var_2;
}

_id_23ED( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_3026 = "font";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    return var_2;
}

_id_23F1( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_3026 = "timer";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    return var_2;
}

_id_243D( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2._id_3026 = "font";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    return var_2;
}

_id_243F( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2._id_3026 = "timer";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    return var_2;
}

_id_2420( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    return _id_2421( var_3, var_0, var_1, var_2 );
}

_id_23EF( var_0, var_1, var_2 )
{
    var_3 = newclienthudelem( self );
    return _id_2421( var_3, var_0, var_1, var_2 );
}

_id_2421( var_0, var_1, var_2, var_3 )
{
    var_0._id_3026 = "icon";
    var_0.x = 0;
    var_0.y = 0;
    var_0.width = var_2;
    var_0.height = var_3;
    var_0._id_A39F = 0;
    var_0._id_A3BA = 0;
    var_0._id_1D3D = [];
    var_0 _id_7FDC( level._id_99F4 );

    if ( isdefined( var_1 ) )
        var_0 setshader( var_1, var_2, var_3 );

    return var_0;
}

h1_createbar( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = newhudelem();
    var_7.alignx = "center";
    var_7.aligny = "bottom";
    var_7.horzalign = "center";
    var_7.vertalign = "bottom";
    var_7.x = var_0;
    var_7.y = var_1 + 1;
    var_7.alpha = 0.9;
    var_7 setshader( var_5, var_2, var_3 );
    var_7.sort = -2;
    var_8 = newhudelem();
    var_8 setshader( var_6, 10, 0 );
    var_8.alignx = "right";
    var_8.aligny = "bottom";
    var_8.horzalign = "right";
    var_8.vertalign = "bottom";
    var_8.offset_x = 1;
    var_8.offset_y = -2;
    var_8.color = ( 1.0, 0.9, 0.1 );
    var_8.alpha = 0.9;
    var_8.sort = 0;
    var_8._id_3A08 = 0.25;
    var_8._id_8392 = var_6;
    var_9 = newhudelem();
    var_9._id_3026 = "bar";
    var_9.alignx = "center";
    var_9.aligny = "bottom";
    var_9.horzalign = "center";
    var_9.vertalign = "bottom";
    var_9.x = var_0;
    var_9.y = var_1 + 1;
    var_9.alpha = 0.3;
    var_9 setshader( var_4, var_2, var_3 );
    var_9.sort = -1;
    var_9.width = var_2;
    var_9.height = var_3;
    var_9._id_A3A3 = 2;
    var_9._id_A3BD = 3;
    var_9._id_1D3D = [];
    var_9.progress_bg_distort = var_7;
    var_9._id_12DB = var_8;
    var_9 _id_7FDC( level._id_99F4 );
    return var_9;
}

_id_23E5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "white";

    if ( !isdefined( var_1 ) )
        var_1 = "black";

    if ( !isdefined( var_2 ) )
        var_2 = 100;

    if ( !isdefined( var_3 ) )
        var_3 = 9;

    var_5 = newhudelem();
    var_5.x = 2;
    var_5.y = 2;
    var_5._id_3A08 = 0.25;
    var_5._id_8392 = var_0;
    var_5.sort = -1;
    var_5 setshader( var_0, var_2 - 2, var_3 - 2 );

    if ( isdefined( var_4 ) )
    {
        var_5._id_38B2 = var_4;
        var_5 thread _id_38C6();
    }

    var_5.offset_x = 0;
    var_5.offset_y = 0;
    var_6 = newhudelem();
    var_6._id_3026 = "bar";
    var_6.x = 0;
    var_6.y = 0;
    var_6.width = var_2;
    var_6.height = var_3;
    var_6._id_A39F = 0;
    var_6._id_A3BA = 0;
    var_6._id_12DB = var_5;
    var_6._id_1D3D = [];
    var_6._id_A3A3 = 2;
    var_6._id_A3BD = 2;
    var_6.sort = -2;
    var_6.alpha = 0.5;
    var_6 _id_7FDC( level._id_99F4 );
    var_6 setshader( var_1, var_2, var_3 );
    return var_6;
}

_id_23F0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_0 = common_scripts\utility::_id_9294( isdefined( var_0 ), var_0, level.player );
    var_1 = common_scripts\utility::_id_9294( isdefined( var_1 ), var_1, 90 );
    var_2 = common_scripts\utility::_id_9294( isdefined( var_2 ), var_2, "white" );
    var_3 = common_scripts\utility::_id_9294( isdefined( var_3 ), var_3, "black" );
    var_4 = common_scripts\utility::_id_9294( isdefined( var_4 ), var_4, 100 );
    var_5 = common_scripts\utility::_id_9294( isdefined( var_5 ), var_5, 9 );
    var_6 = common_scripts\utility::_id_9294( isdefined( var_6 ), var_6, 2 );
    var_7 = common_scripts\utility::_id_9294( isdefined( var_7 ), var_7, 2 );
    var_8 = var_0 _id_23EC( var_2, var_3, var_4, var_5, undefined, var_6, var_7 );
    var_8 _id_7FEE( "CENTER", undefined, 0, var_1 );
    return var_8;
}

_id_23EC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_5 ) )
        var_5 = 2;

    if ( !isdefined( var_6 ) )
        var_6 = 2;

    var_7 = newclienthudelem( self );
    var_7.x = 0 - var_5;
    var_7.y = 0 - var_6;
    var_7._id_3A08 = 0.25;
    var_7._id_8392 = var_0;
    var_7.sort = -1;
    var_7 setshader( var_0, var_2 - var_5 * 2, var_3 - var_6 * 2 );

    if ( isdefined( var_4 ) )
    {
        var_7._id_38B2 = var_4;
        var_7 thread _id_38C6();
    }

    var_8 = newclienthudelem( self );
    var_8._id_3026 = "bar";
    var_8.x = 0;
    var_8.y = 0;
    var_8.width = var_2;
    var_8.height = var_3;
    var_8._id_A39F = -1 * var_5;
    var_8._id_A3BA = 0;
    var_8._id_12DB = var_7;
    var_8._id_1D3D = [];
    var_8._id_A3A3 = var_5;
    var_8._id_A3BD = var_6;
    var_8.sort = -2;
    var_8.alpha = 0.5;
    var_8 _id_7FDC( level._id_99F4 );
    var_8 setshader( var_1, var_2, var_3 );
    return var_8;
}

_id_7F72( var_0 )
{
    self._id_12DB._id_38B2 = var_0;
}

_id_35E8( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 > 0 )
        self fadeovertime( var_1 );

    self.alpha = var_0;

    if ( isdefined( var_1 ) && var_1 > 0 )
        wait(var_1);
}

_id_38C6()
{
    self endon( "death" );
    self.alpha = 1;

    for (;;)
    {
        if ( self._id_3A08 >= self._id_38B2 )
        {
            self fadeovertime( 0.3 );
            self.alpha = 0.2;
            wait 0.35;
            self fadeovertime( 0.3 );
            self.alpha = 1;
            wait 0.7;
            continue;
        }

        self.alpha = 1;
        wait 0.05;
    }
}

_id_28E9()
{
    if ( isdefined( self._id_1D3D ) && self._id_1D3D.size )
    {
        var_0 = [];

        for ( var_1 = 0; var_1 < self._id_1D3D.size; var_1++ )
            var_0[var_1] = self._id_1D3D[var_1];

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] _id_7FDC( _id_407A() );
    }

    if ( isdefined( self._id_3026 ) && self._id_3026 == "bar" )
    {
        self._id_12DB destroy();

        if ( isdefined( self.progress_bg_distort ) )
            self.progress_bg_distort destroy();
    }

    self destroy();
}

_id_7F8D( var_0 )
{
    self setshader( var_0, self.width, self.height );
}

_id_8358( var_0 )
{
    self.width = var_0;
}

_id_7F89( var_0 )
{
    self.height = var_0;
}

_id_800F( var_0, var_1 )
{
    self.width = var_0;
    self.height = var_1;
}

_id_9B01( var_0 )
{
    for ( var_1 = 0; var_1 < self._id_1D3D.size; var_1++ )
    {
        var_2 = self._id_1D3D[var_1];
        var_2 _id_7FEE( var_2._id_6E19, var_2._id_730A, var_2._id_A39F, var_2._id_A3BA, var_0 );
    }
}

_id_8AF5( var_0 )
{
    if ( isdefined( var_0 ) && var_0 == 0 )
    {
        _id_8AF4();
        return;
    }

    setsaveddvar( "hud_showStanceCarry", "1" );
}

_id_8AF4()
{
    setsaveddvar( "hud_showStanceCarry", "0" );
}

_id_23CB()
{
    if ( level.console )
    {
        var_0 = _id_2401( "default", 1.8 );
        var_0 _id_7FEE( "CENTER", undefined, 0, 115 );
        var_0 settext( level._id_8F58["mantle"] );
    }
    else
    {
        var_0 = _id_2401( "default", 1.6 );
        var_0 _id_7FEE( "CENTER", undefined, 0, 115 );
        var_0 settext( level._id_8F58["mantle"] );
    }

    var_0.alpha = 0;
    level._id_4AC8 = [];
    level._id_4AC8["text"] = var_0;
}

_id_0763( var_0, var_1, var_2 )
{
    clear_hint_background();

    if ( !isdefined( var_1 ) )
        var_1 = 0.0;

    if ( !isdefined( var_2 ) )
        var_2 = 0.0;

    if ( isdefined( var_0 ) )
    {
        var_3 = 121;
        var_4 = 38;
        level._id_48F3 = _id_2420( "h1_hud_tutorial_blur", 560, 39 );
        level.hintbordertop = _id_2420( "h1_hud_tutorial_border", 560, 1 );
        level.hintborderbottom = _id_2420( "h1_hud_tutorial_border", 560, 1 );
    }
    else
    {
        var_3 = 121;
        var_4 = 24;
        level._id_48F3 = _id_2420( "h1_hud_tutorial_blur", 560, 25 );
        level.hintbordertop = _id_2420( "h1_hud_tutorial_border", 560, 1 );
        level.hintborderbottom = _id_2420( "h1_hud_tutorial_border", 560, 1 );
    }

    level._id_48F3 _id_7FEE( "TOP", undefined, 0, var_3 + var_1 );
    level._id_48F3.sort = 1;
    level._id_48F3.hidewheninmenu = 1;
    level._id_48F3.hidewhendead = 1;
    level.hintbordertop _id_7FEE( "TOP", undefined, 0, var_3 + var_1 );
    level.hintbordertop.sort = 1;
    level.hintbordertop.hidewheninmenu = 1;
    level.hintbordertop.hidewhendead = 1;
    level.hintborderbottom _id_7FEE( "TOP", undefined, 0, var_3 + var_1 + var_4 );
    level.hintborderbottom.sort = 1;
    level.hintborderbottom.hidewheninmenu = 1;
    level.hintborderbottom.hidewhendead = 1;

    if ( var_2 == 0 )
    {
        level._id_48F3.alpha = 0.9;
        level.hintbordertop.alpha = 0.05;
        level.hintborderbottom.alpha = 0.05;
    }
    else
    {
        level._id_48F3.alpha = 0;
        level._id_48F3 fadeovertime( var_2 );
        level._id_48F3.alpha = 0.9;
        level.hintbordertop.alpha = 0;
        level.hintbordertop fadeovertime( var_2 );
        level.hintbordertop.alpha = 0.05;
        level.hintborderbottom.alpha = 0;
        level.hintborderbottom fadeovertime( var_2 );
        level.hintborderbottom.alpha = 0.05;
    }
}

fade_hint_background( var_0 )
{
    if ( isdefined( level._id_48F3 ) )
    {
        if ( var_0 > 0 )
            level._id_48F3 fadeovertime( var_0 );

        level._id_48F3.alpha = 0;
    }

    if ( isdefined( level.hintbordertop ) )
    {
        if ( var_0 > 0 )
            level.hintbordertop fadeovertime( var_0 );

        level.hintbordertop.alpha = 0;
    }

    if ( isdefined( level.hintborderbottom ) )
    {
        if ( var_0 > 0 )
            level.hintborderbottom fadeovertime( var_0 );

        level.hintborderbottom.alpha = 0;
    }
}

clear_hint_background()
{
    if ( isdefined( level._id_48F3 ) )
        level._id_48F3 _id_28E9();

    if ( isdefined( level.hintbordertop ) )
        level.hintbordertop _id_28E9();

    if ( isdefined( level.hintborderbottom ) )
        level.hintborderbottom _id_28E9();
}

get_stats_display_hud( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = common_scripts\utility::_id_9294( !isdefined( var_0 ) || var_3, -225, var_0 );
    var_7 = common_scripts\utility::_id_9294( !isdefined( var_1 ), 10.5, var_1 );
    var_4 = common_scripts\utility::_id_9294( !isdefined( var_4 ), 1.6, var_4 );

    if ( isdefined( var_2 ) )
        var_8 = newclienthudelem( var_2 );
    else
        var_8 = newhudelem();

    var_8.alignx = "left";
    var_8.aligny = "middle";
    var_8.horzalign = "right";
    var_8.vertalign = "top";
    var_8.x = var_6;
    var_8.y = var_7;

    if ( maps\_utility::_id_0CC3() )
    {
        var_8.alignx = "left";
        var_8.aligny = "top";
        var_8.horzalign = "right";
        var_8.vertalign = "top";
        var_8.y = 0;
    }

    var_8.fontscale = var_4;
    var_8.color = ( 0.8, 1.0, 0.8 );
    var_8.font = "objective";
    var_8.glowcolor = ( 0.26, 0.65, 0.32 );
    var_8.glowalpha = 0.2;
    var_8.foreground = 1;
    var_8.hidewheninmenu = 1;
    var_8.hidewhendead = 1;

    if ( isdefined( var_5 ) )
        var_8 settext( var_5 );

    return var_8;
}

add_countdown_flourish_flash_timer( var_0, var_1, var_2, var_3 )
{
    level endon( "kill_timer_flourish" );

    for (;;)
    {
        var_0.color = var_2;
        wait(var_1);
        var_0.color = var_3;
        wait(var_1);
    }
}

add_countdown_flourish( var_0, var_1, var_2, var_3 )
{
    level endon( "kill_timer_flourish" );
    var_4 = 57;
    var_5 = ( 1.0, 1.0, 1.0 );
    var_6 = 210;
    var_7 = 0.13;
    var_8 = 0.03;
    var_9 = 0.01;
    var_10 = 5;
    var_11 = 0.1;
    var_12 = ( 0.9, 0.2, 0.2 );
    var_13 = var_7 + var_8;

    if ( var_2 > 30 )
        var_14 = var_5;
    else
        var_14 = var_12;

    var_15 = newhudelem();
    var_15.x = var_0;
    var_15.y = var_1 - 10;
    var_15 setshader( "h1_timer_on_flare", 0, var_4 );
    var_15.alignx = "center";
    var_15.color = var_14;
    var_15.aligny = "top";
    var_15.sort = 1;
    var_15.foreground = 0;
    var_15.horzalign = "center_adjustable";
    var_15.vertalign = "top_adjustable";
    var_15.hidewheninmenu = 1;
    var_15.hidewhendead = 1;
    var_15.alpha = 1;
    var_2 -= 0.05;
    wait 0.05;

    if ( var_2 > 30 )
    {
        var_15 scaleovertime( var_13, var_6, var_4 );
        var_2 -= var_7;
        wait(var_7);
        var_15 fadeovertime( var_8 );
        var_15.alpha = 0;
        var_2 -= var_8;
        wait(var_8);
        var_16 = var_2 - 30;
        var_2 -= var_16;
        wait(var_16);
        var_15 scaleovertime( 0.05, 0, var_4 );
        var_2 -= 0.05;
        wait 0.05;
    }

    var_3.color = var_12;
    var_15.color = var_12;
    var_15.alpha = 1;
    var_15 scaleovertime( var_13, var_6, var_4 );
    var_2 -= var_7;
    wait(var_7);
    var_15 fadeovertime( var_8 );
    var_15.alpha = 0;
    var_2 -= var_8;
    wait(var_8);
    var_15 scaleovertime( 0.05, 0, var_4 );

    if ( var_2 > 15 )
    {
        var_17 = var_2 - 15;
        var_2 -= var_17;
        wait(var_17);
    }

    thread add_countdown_flourish_flash_timer( var_3, var_11, var_5, var_12 );
    var_18 = var_3.y;

    for (;;)
    {
        var_15.alpha = 1;
        var_15 scaleovertime( 0.05, var_6, var_4 );
        var_3.y = var_18 + var_10;
        wait(var_9);
        var_15 fadeovertime( 0.05 );
        var_15.alpha = 0;
        var_3.y = var_18;
        wait(1.0 - var_9);
    }

    var_15 destroy();
}

_id_3D17( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = common_scripts\utility::_id_9294( !isdefined( var_0 ) || var_3, 0, var_0 );
    var_6 = common_scripts\utility::_id_9294( !isdefined( var_1 ), 10.5, var_1 );

    if ( isdefined( var_2 ) )
        var_7 = newclienthudelem( var_2 );
    else
        var_7 = newhudelem();

    var_7.alignx = "center";
    var_7.aligny = "top";
    var_7.horzalign = "center_adjustable";
    var_7.vertalign = "top_adjustable";
    var_7.x = var_5;

    switch ( getdvarint( "loc_language" ) )
    {
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 15:
            var_7.y = var_6 + 18;
            break;
        default:
            var_7.y = var_6 + 16;
            break;
    }

    var_7.fontscale = 0.75;
    var_7.color = ( 1.0, 1.0, 1.0 );
    var_7.font = "timer";
    var_7.glowcolor = ( 0.0, 0.0, 0.0 );
    var_7.glowalpha = 1;
    var_7.foreground = 1;
    var_7.hidewheninmenu = 1;
    var_7.hidewhendead = 1;
    var_7._id_92B2 = newhudelem();
    var_7._id_92B2.alignx = "center";
    var_7._id_92B2.aligny = "top";
    var_7._id_92B2.horzalign = "center_adjustable";
    var_7._id_92B2.vertalign = "top_adjustable";
    var_7._id_92B2.x = var_5;
    var_7._id_92B2.y = var_6 + 8;
    var_7._id_92B2.fontscale = 0.45;
    var_7._id_92B2.color = ( 1.0, 1.0, 1.0 );
    var_7._id_92B2.font = "timer";
    var_7._id_92B2.glowcolor = ( 0.0, 0.0, 0.0 );
    var_7._id_92B2.glowalpha = 1;
    var_7._id_92B2.foreground = 1;
    var_7._id_92B2.hidewheninmenu = 1;
    var_7._id_92B2.hidewhendead = 1;
    var_7.blur = newhudelem();
    var_7.blur.x = var_5;
    var_7.blur.y = var_6;
    var_7.blur setshader( "h1_hud_timer_blur", 227, 57 );
    var_7.blur.alignx = "center";
    var_7.blur.aligny = "top";
    var_7.blur.sort = 1;
    var_7.blur.foreground = 0;
    var_7.blur.horzalign = "center_adjustable";
    var_7.blur.vertalign = "top_adjustable";
    var_7.blur.alpha = 0.9;
    var_7.blur.hidewheninmenu = 1;
    var_7.blur.hidewhendead = 1;
    var_7.border = newhudelem();
    var_7.border.x = var_5;
    var_7.border.y = var_6;
    var_7.border setshader( "h1_hud_timer_border", 227, 57 );
    var_7.border.alignx = "center";
    var_7.border.aligny = "top";
    var_7.border.sort = 1;
    var_7.border.foreground = 0;
    var_7.border.horzalign = "center_adjustable";
    var_7.border.vertalign = "top_adjustable";
    var_7.border.alpha = 0.1;
    var_7.border.hidewheninmenu = 1;
    var_7.border.hidewhendead = 1;

    if ( isdefined( var_4 ) )
        thread add_countdown_flourish( var_5, var_6, var_4, var_7 );

    return var_7;
}

destroy_countdown_hud( var_0 )
{
    level notify( "kill_timer_flourish" );

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_92B2 ) )
        var_0._id_92B2 destroy();

    if ( isdefined( var_0.blur ) )
        var_0.blur destroy();

    if ( isdefined( var_0.border ) )
        var_0.border destroy();

    var_0 destroy();
}

_id_3D47( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = undefined;

    if ( !level.console )
        var_4 = -250;
    else if ( !isdefined( var_0 ) )
        var_4 = -170;
    else
        var_4 = var_0;

    if ( var_3 )
        var_4 = var_0;

    if ( !isdefined( var_1 ) )
        var_5 = 100;
    else
        var_5 = var_1;

    if ( isdefined( var_2 ) )
        var_6 = newclienthudelem( var_2 );
    else
        var_6 = newhudelem();

    var_6.alignx = "right";
    var_6.aligny = "middle";
    var_6.horzalign = "right";
    var_6.vertalign = "top";
    var_6.x = var_4;
    var_6.y = var_5;
    var_6.fontscale = 1.6;
    var_6.color = ( 0.8, 1.0, 0.8 );
    var_6.font = "objective";
    var_6.glowcolor = ( 0.3, 0.6, 0.3 );
    var_6.glowalpha = 1;
    var_6.foreground = 1;
    var_6.hidewheninmenu = 1;
    var_6.hidewhendead = 1;
    return var_6;
}

_id_23A2( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newclienthudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( var_0, 640, 480 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.sort = 1;
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = var_1;
    var_3.foreground = 1;
    return var_3;
}

_id_23A3( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = maps\_utility::_id_3E25();
    var_6 = newclienthudelem( var_5 );

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6.x = var_2;
    var_6.y = var_3;
    var_6 setshader( var_0, int( 640 * var_4 ), int( 480 * var_4 ) );
    var_6.alignx = "center";
    var_6.aligny = "middle";
    var_6.sort = 1;
    var_6.horzalign = "center";
    var_6.vertalign = "middle";
    var_6.alpha = var_1;
    var_6.foreground = 1;
    return var_6;
}

_id_23A4( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = maps\_utility::_id_3E25();
    var_6 = newclienthudelem( var_5 );

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    var_6.x = var_2;
    var_6.y = var_3;
    var_6 setshader( var_0, int( 640 * var_4 ), int( 480 * var_4 ) );
    var_6.alignx = "center";
    var_6.aligny = "middle";
    var_6.sort = 1;
    var_6.horzalign = "fullscreen";
    var_6.vertalign = "fullscreen";
    var_6.alpha = var_1;
    var_6.foreground = 1;
    return var_6;
}

_id_35DC( var_0, var_1 )
{
    if ( level._id_5CDE )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 0.3;

    var_2 = _id_3E03( var_1 );
    var_2 fadeovertime( var_0 );
    var_2.alpha = 0;
    wait(var_0);
}

_id_3E03( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "black";

    return _id_3E13( var_0 );
}

_id_35E3( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.3;

    var_2 = _id_3E03( var_1 );

    if ( var_0 > 0 )
        var_2 fadeovertime( var_0 );

    var_2.alpha = 1;
    wait(var_0);
}

_id_8C23( var_0 )
{
    var_1 = _id_3E03( var_0 );
    var_1.alpha = 1;
}

_id_3E13( var_0 )
{
    if ( isplayer( self ) )
        var_1 = self;
    else
        var_1 = level.player;

    if ( !isdefined( var_1._id_65F6 ) )
        var_1._id_65F6 = [];

    if ( !isdefined( var_1._id_65F6[var_0] ) )
        var_1._id_65F6[var_0] = _id_23A2( var_0, 0, var_1 );

    var_1._id_65F6[var_0].sort = 0;
    var_1._id_65F6[var_0].foreground = 1;
    return var_1._id_65F6[var_0];
}

display_custom_nameplate( var_0, var_1, var_2 )
{
    if ( !maps\_utility::_id_32DC( "kill_custom_nameplate" ) )
        maps\_utility::_id_32DD( "kill_custom_nameplate" );

    var_3 = undefined;

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else if ( isdefined( self.name ) )
        var_3 = self.name;

    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else if ( isdefined( self.team ) )
        var_4 = self.team;

    var_5 = undefined;

    for (;;)
    {
        if ( !isdefined( self ) || maps\_utility::_id_32D8( "kill_custom_nameplate" ) )
        {
            if ( isdefined( var_5 ) )
                var_5 destroy();

            break;
        }

        if ( [[ var_0 ]]() )
        {
            if ( !isdefined( var_5 ) )
                var_5 = create_nameplate_hud( var_3, var_4 );
        }
        else if ( isdefined( var_5 ) )
            var_5 destroy();

        wait 0.05;
    }
}

create_nameplate_hud( var_0, var_1 )
{
    var_2 = 25.0;
    var_3 = -2.0;
    var_4 = newhudelem();
    var_4.alignx = "left";
    var_4.aligny = "bottom";
    var_4.horzalign = "center";
    var_4.vertalign = "middle";
    var_4.x = var_2;
    var_4.y = var_3;
    var_4.fontscale = 1.2;
    var_4.font = "objective";
    var_4.label = var_0;
    var_5 = get_nameplate_color( "hostileNameFontColor" );
    var_6 = get_nameplate_color( "hostileNameFontGlowColor" );
    var_7 = get_nameplate_color( "friendlyNameFontColor" );
    var_8 = get_nameplate_color( "friendlyNameFontGlowColor" );

    if ( var_1 == "axis" )
    {
        var_4.color = ( var_5[0], var_5[1], var_5[2] );
        var_4.alpha = var_5[3];
        var_4.glowcolor = ( var_6[0], var_6[1], var_6[2] );
        var_4.glowalpha = var_6[3];
    }
    else
    {
        var_4.color = ( var_7[0], var_7[1], var_7[2] );
        var_4.alpha = var_7[3];
        var_4.glowcolor = ( var_8[0], var_8[1], var_8[2] );
        var_4.glowalpha = var_8[3];
    }

    var_4.foreground = 1;
    var_4.hidewheninmenu = 1;
    var_4.hidewhendead = 1;
    return var_4;
}

get_nameplate_color( var_0 )
{
    var_1 = strtok( getdvar( var_0 ), " " );
    var_2 = [];
    var_2 = common_scripts\utility::_id_0CDA( var_2, float( var_1[0] ) );
    var_2 = common_scripts\utility::_id_0CDA( var_2, float( var_1[1] ) );
    var_2 = common_scripts\utility::_id_0CDA( var_2, float( var_1[2] ) );
    var_2 = common_scripts\utility::_id_0CDA( var_2, float( var_1[3] ) );
    return var_2;
}
