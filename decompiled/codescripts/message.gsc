// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

codecallback_handleinstantmessage( var_0 )
{
    if ( isdefined( level.globalinstantmessagehandler ) )
        [[ level.globalinstantmessagehandler ]]( var_0 );
    else
        iprintlnbold( "no level handler for: " + var_0 );
}
