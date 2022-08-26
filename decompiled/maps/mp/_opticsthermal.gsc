// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

opticsthermal_think()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( isagent( self ) )
        return;

    var_0 = 0.65;
    self.opticsthermalenabled = 0;
    self.orbitalthermalmode = 0;
    self.has_opticsthermal = 0;

    for (;;)
    {
        var_1 = !self.has_opticsthermal;
        var_1 |= ( self.has_opticsthermal && self playerads() < var_0 );
        var_1 |= self isusingturret();
        var_1 |= self.orbitalthermalmode;

        if ( var_1 )
            opticsthermal_blur_off( self );
        else
            opticsthermal_blur( self, 0.05 );

        wait 0.05;
    }
}

opticsthermal_blur( var_0, var_1 )
{
    if ( var_0.opticsthermalenabled )
        return;

    var_0 _meth_84A5( 3 );
    var_0 _meth_84A7( 70, 0, 40, 80 );
    var_0.opticsthermalenabled = 1;
}

opticsthermal_blur_off( var_0 )
{
    if ( !var_0.opticsthermalenabled )
        return;

    var_0 _meth_84A6();
    var_0.opticsthermalenabled = 0;
}
