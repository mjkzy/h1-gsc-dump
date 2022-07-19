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

}

_id_9B0C( var_0, var_1 )
{
    if ( !isplayer( self ) || !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "scavenger":
            self playlocalsound( "scavenger_pack_pickup" );

            if ( !level.hardcoremode )
                self setclientomnvar( "damage_feedback", var_0 );

            break;
        case "hitblastshield":
        case "hitlightarmor":
        case "hitjuggernaut":
            self playlocalsound( "mp_hit_armor" );
            self setclientomnvar( "damage_feedback", var_0 );
            break;
        case "mp_solar":
            if ( !isdefined( self._id_849F ) )
            {
                if ( isdefined( level._id_598B ) )
                    self thread [[ level._id_598B ]]();
            }
            else
                self._id_25A1 = 10;

            break;
        case "laser":
            if ( isdefined( level._id_7CC8 ) )
            {
                if ( !isdefined( self._id_849F ) )
                {
                    if ( isdefined( level._id_598B ) )
                        self thread [[ level._id_598B ]]( level._id_7CC8 );
                }
            }

            break;
        case "headshot":
            self playlocalsound( "mp_hit_headshot" );
            self setclientomnvar( "damage_feedback", "headshot" );
            break;
        case "hitmorehealth":
            self playlocalsound( "mp_hit_armor" );
            self setclientomnvar( "damage_feedback", "hitmorehealth" );
            break;
        case "killshot":
            self playlocalsound( "mp_hit_kill" );
            self setclientomnvar( "damage_feedback", "killshot" );
            break;
        case "killshot_headshot":
            self playlocalsound( "mp_hit_kill_headshot" );
            self setclientomnvar( "damage_feedback", "killshot_headshot" );
            break;
        case "none":
            break;
        default:
            self playlocalsound( "mp_hit_default" );
            self setclientomnvar( "damage_feedback", "standard" );
            break;
    }
}
