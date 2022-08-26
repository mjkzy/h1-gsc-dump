// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_ct_assault_mitchel" );
    self attach( "head_slum_civ_male_h", "", 1 );
    self.headmodel = "head_slum_civ_male_h";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_ct_assault_mitchel" );
    precachemodel( "head_slum_civ_male_h" );
}
