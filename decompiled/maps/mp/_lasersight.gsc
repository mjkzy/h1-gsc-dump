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

_id_54FF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_54DA = undefined;
    self._id_A1C7 = 0;
    self.has_laser = 0;

    for (;;)
    {
        while ( maps\mp\_utility::_id_50F9() && self.has_laser )
        {
            wait 0.05;
            self laseroff();
            self._id_A1C7 = 1;
            continue;
        }

        if ( self._id_A1C7 && self.has_laser )
        {
            self._id_A1C7 = 0;

            if ( maps\mp\gametypes\_class::_id_5101( self getcurrentweapon() ) || maps\mp\gametypes\_class::_id_5198( self getcurrentweapon() ) )
                self laseron( "mp_attachment_lasersight_short" );
            else
                self laseron( "mp_attachment_lasersight" );
        }

        if ( issubstr( self getcurrentweapon(), "maaws" ) )
            self.has_laser = 1;

        if ( self.has_laser && self isthrowinggrenade() )
        {
            if ( isdefined( self._id_54DA ) && self._id_54DA )
            {
                self laseroff();
                self._id_54DA = 0;

                while ( !self _meth_84D8() && self isthrowinggrenade() )
                    wait 0.05;

                while ( self _meth_84D8() && self isthrowinggrenade() )
                    wait 0.05;

                while ( self isthrowinggrenade() )
                    wait 0.05;

                if ( maps\mp\gametypes\_class::_id_5101( self getcurrentweapon() ) || maps\mp\gametypes\_class::_id_5198( self getcurrentweapon() ) )
                    self laseron( "mp_attachment_lasersight_short" );
                else
                    self laseron( "mp_attachment_lasersight" );

                self._id_54DA = 1;
            }
        }

        if ( !self.has_laser )
        {
            if ( isdefined( self._id_54DA ) && self._id_54DA )
            {
                self laseroff();
                self._id_54DA = 0;
            }
        }
        else if ( !isdefined( self._id_54DA ) || !self._id_54DA )
        {
            if ( maps\mp\gametypes\_class::_id_5101( self getcurrentweapon() ) || maps\mp\gametypes\_class::_id_5198( self getcurrentweapon() ) )
                self laseron( "mp_attachment_lasersight_short" );
            else
                self laseron( "mp_attachment_lasersight" );

            self._id_54DA = 1;
        }

        wait 0.05;
    }
}
