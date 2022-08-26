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
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 280.0, 400.0 );
    }

    self.weapon = "m1014";

    switch ( codescripts\character::get_random_character( 7 ) )
    {
        case 0:
            character\character_sp_spetsnaz_boris::main();
            break;
        case 1:
            character\character_sp_spetsnaz_demetry::main();
            break;
        case 2:
            character\character_sp_spetsnaz_vlad::main();
            break;
        case 3:
            character\character_sp_spetsnaz_yuri::main();
            break;
        case 4:
            character\character_sp_spetsnaz_collins::main();
            break;
        case 5:
            character\character_sp_spetsnaz_geoff::main();
            break;
        case 6:
            character\character_sp_spetsnaz_derik::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\character_sp_spetsnaz_boris::precache();
    character\character_sp_spetsnaz_demetry::precache();
    character\character_sp_spetsnaz_vlad::precache();
    character\character_sp_spetsnaz_yuri::precache();
    character\character_sp_spetsnaz_collins::precache();
    character\character_sp_spetsnaz_geoff::precache();
    character\character_sp_spetsnaz_derik::precache();
    precacheitem( "m1014" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
