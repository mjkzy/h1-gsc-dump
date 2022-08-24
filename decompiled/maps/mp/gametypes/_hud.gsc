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

init()
{
    level.uiparent = spawnstruct();
    level.uiparent.horzalign = "left";
    level.uiparent.vertalign = "top";
    level.uiparent.alignx = "left";
    level.uiparent.aligny = "top";
    level.uiparent.x = 0;
    level.uiparent.y = 0;
    level.uiparent.width = 0;
    level.uiparent.height = 0;
    level.uiparent.children = [];
    level._id_397D = 12;
    level.hud["allies"] = spawnstruct();
    level.hud["axis"] = spawnstruct();
    level.primaryprogressbary = -61;
    level.primaryprogressbarx = 0;
    level.primaryprogressbarheight = 9;
    level.primaryprogressbarwidth = 120;
    level.primaryProgressBarTextY = -75;
    level.primaryprogressbartextx = 0;
    level.primaryprogressbarfontsize = 0.6;
    level.teamprogressbary = 32;
    level.teamprogressbarheight = 14;
    level.teamprogressbarwidth = 192;
    level.teamprogressbartexty = 8;
    level.teamprogressbarfontsize = 1.65;
    level.lowertextyalign = "BOTTOM";
    level.lowertexty = -90;
    level.lowertextfontsize = 1.0;
}

fontPulseInit( var_0 )
{
    self.basefontscale = self.fontscale;

    if ( isdefined( var_0 ) )
        self.maxfontscale = min( var_0, 6.3 );
    else
        self.maxfontscale = min( self.fontscale * 2, 6.3 );

    self.inframes = 2;
    self.outframes = 4;
}

fontPulse( var_0 )
{
    self notify( "fontPulse" );
    self endon( "fontPulse" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    self changefontscaleovertime( self.inframes * 0.05 );
    self.fontscale = self.maxfontscale;
    wait(self.inframes * 0.05);
    self changefontscaleovertime( self.outframes * 0.05 );
    self.fontscale = self.basefontscale;
}
