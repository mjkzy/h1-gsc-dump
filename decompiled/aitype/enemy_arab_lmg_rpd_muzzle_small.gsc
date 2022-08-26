// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "beretta";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 512.0, 400.0 );
        self setengagementmaxdist( 1024.0, 1250.0 );
    }

    self.weapon = "rpd_muzzle_small";

    switch ( codescripts\character::get_random_character( 6 ) )
    {
        case 0:
            character\character_sp_arab_regular_asad::main();
            break;
        case 1:
            character\character_sp_arab_regular_sadiq::main();
            break;
        case 2:
            character\character_sp_arab_regular_ski_mask::main();
            break;
        case 3:
            character\character_sp_arab_regular_ski_mask2::main();
            break;
        case 4:
            character\character_sp_arab_regular_suren::main();
            break;
        case 5:
            character\character_sp_arab_regular_yasir::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\character_sp_arab_regular_asad::precache();
    character\character_sp_arab_regular_sadiq::precache();
    character\character_sp_arab_regular_ski_mask::precache();
    character\character_sp_arab_regular_ski_mask2::precache();
    character\character_sp_arab_regular_suren::precache();
    character\character_sp_arab_regular_yasir::precache();
    precacheitem( "rpd_muzzle_small" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
