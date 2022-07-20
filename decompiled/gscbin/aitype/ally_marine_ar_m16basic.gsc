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
    self._id_0C8E = "";
    self._id_07ED = "";
    self.team = "allies";
    self.unlockpoints = "human";
    self._id_8F7D = "regular";
    self.accuracy = 0.2;
    self.helmet = 150;
    self.groundentchanged = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "colt45";
    self._id_855D = "colt45";

    if ( isai( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self.weapon_switch_invalid = "m16_basic";

    switch ( codescripts\character::_id_3E43( 7 ) )
    {
        case 0:
            character\character_sp_usmc_james::main();
            break;
        case 1:
            character\character_sp_usmc_sami::main();
            break;
        case 2:
            character\character_sp_usmc_at4::main();
            break;
        case 3:
            character\character_sp_usmc_ryan::main();
            break;
        case 4:
            character\character_sp_usmc_sami_goggles::main();
            break;
        case 5:
            character\character_sp_usmc_zach::main();
            break;
        case 6:
            character\character_sp_usmc_zach_goggles::main();
            break;
    }
}

spawntime()
{
    self setspawnerteam( "allies" );
}

prestigedoublexp()
{
    character\character_sp_usmc_james::prestigedoublexp();
    character\character_sp_usmc_sami::prestigedoublexp();
    character\character_sp_usmc_at4::prestigedoublexp();
    character\character_sp_usmc_ryan::prestigedoublexp();
    character\character_sp_usmc_sami_goggles::prestigedoublexp();
    character\character_sp_usmc_zach::prestigedoublexp();
    character\character_sp_usmc_zach_goggles::prestigedoublexp();
    precacheitem( "m16_basic" );
    precacheitem( "colt45" );
    precacheitem( "colt45" );
    precacheitem( "fraggrenade" );
}
