// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    setup_bot_war();
}

setup_callbacks()
{
    level.bot_funcs["gametype_think"] = ::bot_war_think;
}

setup_bot_war()
{

}

bot_war_think()
{
    self notify( "bot_war_think" );
    self endon( "bot_war_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );

    if ( isdefined( level.bot_ignore_personality ) )
        return;

    for (;;)
    {
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}
