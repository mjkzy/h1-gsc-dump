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

_id_7039( var_0, var_1 )
{
    if ( !isdefined( level._id_703A ) )
        level._id_703A = [];

    if ( !isdefined( level._id_703A[var_0] ) )
        level._id_703A[var_0] = [];

    if ( isdefined( level._id_703A[var_0][var_1] ) )
        return 1;

    level._id_703A[var_0][var_1] = 1;
    return 0;
}

_id_0796( var_0 )
{
    if ( _id_7039( var_0, "add_smoking_notetracks" ) )
        return;

    _id_A510::_id_0807( var_0, "attach cig", ::_id_0DDB );
    _id_A510::_id_0807( var_0, "detach cig", ::_id_2976 );
    _id_A510::_id_0807( var_0, "puff", ::_id_8682 );
    _id_A510::_id_0807( var_0, "exhale", ::_id_8680 );
    level._effect["cigar_glow"] = loadfx( "fx/fire/cigar_glow_far" );
    level._effect["cigar_glow_puff"] = loadfx( "fx/fire/cigar_glow_puff" );
    level._effect["cigar_smoke_puff"] = loadfx( "fx/smoke/cigarsmoke_puff_far" );
    level._effect["cigar_exhale"] = loadfx( "fx/smoke/cigarsmoke_exhale_far" );
    level._id_78B5["cigar"] = "prop_price_cigar";
}

_id_2979( var_0 )
{
    if ( isdefined( var_0._id_1F96 ) )
        var_0._id_1F96 delete();
}

_id_0793( var_0 )
{
    if ( _id_7039( var_0, "add_cellphone_notetracks" ) )
        return;

    _id_A510::_id_0807( var_0, "attach clip left", ::_id_0DDD );
    _id_A510::_id_0807( var_0, "detach clip left", ::_id_2979 );
    level._id_78B5["clip"] = "weapon_ak47_clip";
}

_id_0DDD( var_0 )
{
    var_0 notify( "new_prop_rotation" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_inhand", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1 setmodel( _id_A5A4::_id_4026( "clip" ) );
    var_0._id_1F96 = var_1;
    thread _id_7037( var_1, var_0 );
}

_id_073F( var_0 )
{
    if ( _id_7039( var_0, "add_cellphone_notetracks" ) )
        return;

    _id_A510::_id_0807( var_0, "attach phone", ::_id_0DEA );
    _id_A510::_id_0807( var_0, "detach phone", ::_id_297D );
    level._id_78B5["cellphone"] = "com_cellphone_off";
}

_id_0DEA( var_0 )
{
    var_0 notify( "new_phone_rotation" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_inhand", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1 setmodel( _id_A5A4::_id_4026( "cellphone" ) );
    var_0._id_67ED = var_1;
    thread _id_7037( var_1, var_0 );
}

_id_297D( var_0 )
{
    if ( isdefined( var_0._id_67ED ) )
        var_0._id_67ED delete();
}

_id_0DDB( var_0 )
{
    var_0 notify( "new_cigar_rotation" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_inhand", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1 setmodel( _id_A5A4::_id_4026( "cigar" ) );
    playfxontag( common_scripts\utility::_id_3FA8( "cigar_glow" ), var_1, "tag_cigarglow" );
    var_0._id_1D6B = var_1;
    thread _id_7038( var_1, var_0 );
}

_id_2976( var_0 )
{
    if ( isdefined( var_0._id_1D6B ) )
        var_0._id_1D6B thread _id_7036();
}

_id_7037( var_0, var_1 )
{
    var_1 notify( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_1 endon( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_0 endon( "death" );
    var_1 _id_A5A4::_id_075B( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_0 _id_A5A4::_id_075B( "death" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "stop_loop" );
    var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_2BDD();
    var_0 delete();
}

_id_7038( var_0, var_1 )
{
    var_1 notify( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_1 endon( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_0 endon( "death" );
    var_1 _id_A5A4::_id_075B( "new_prop_rotation" + var_0.motiontrackerenabled );
    var_0 _id_A5A4::_id_075B( "death" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "stop_loop" );
    var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_2BDD();
    var_0 thread _id_7036();
}

_id_7036()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_1D6A ) && self._id_1D6A )
        return;

    self._id_1D6A = 1;
    stopfxontag( common_scripts\utility::_id_3FA8( "cigar_glow" ), self, "tag_cigarglow" );
    var_0 = 3;
    var_1 = anglestoforward( self.angles );
    self unlink();
    self movegravity( var_1 * 100, var_0 );
    self rotatevelocity( ( 400, 0, 0 ), var_0, 0, var_0 );
    wait(var_0);
    self delete();
}

_id_8682( var_0 )
{
    if ( !isdefined( var_0._id_1D6B ) )
        return;

    var_0 endon( "death" );
    var_0._id_1D6B endon( "death" );
    playfxontag( common_scripts\utility::_id_3FA8( "cigar_glow_puff" ), var_0._id_1D6B, "tag_cigarglow" );
    wait 1;
    playfxontag( common_scripts\utility::_id_3FA8( "cigar_smoke_puff" ), var_0, "tag_eye" );
}

_id_8680( var_0 )
{
    if ( !isdefined( var_0._id_1D6B ) )
        return;

    playfxontag( common_scripts\utility::_id_3FA8( "cigar_exhale" ), var_0, "tag_eye" );
}

_id_418B()
{
    var_0 = [];
    var_0[var_0.size] = "J_MainRoot";
    var_0[var_0.size] = "J_Hip_LE";
    var_0[var_0.size] = "J_Shoulder_RI";
    var_0[var_0.size] = "J_Head";
    var_0[var_0.size] = "J_Neck";
    var_0[var_0.size] = "J_Clavicle_RI";
    var_0[var_0.size] = "J_Ball_LE";
    var_0[var_0.size] = "J_Ankle_RI";
    var_0[var_0.size] = "J_Ankle_LE";
    var_0[var_0.size] = "J_SpineUpper";
    var_0[var_0.size] = "J_Knee_RI";
    var_0[var_0.size] = "J_Knee_LE";
    var_0[var_0.size] = "J_HipTwist_RI";
    var_0[var_0.size] = "J_HipTwist_LE";
    var_0[var_0.size] = "J_SpineLower";
    var_0[var_0.size] = "J_Hip_RI";
    var_0[var_0.size] = "J_Elbow_LE";
    var_0[var_0.size] = "J_Wrist_RI";
    self endon( "death" );

    for (;;)
    {
        while ( self.mw3prestige != "run" )
        {
            wait 0.2;
            continue;
        }

        playfxontag( level._effect["ghillie_leaves"], self, common_scripts\utility::_id_710E( var_0 ) );
        wait(randomfloatrange( 0.1, 2.5 ));
    }
}

_id_0DDC()
{
    _id_0DDB( self );
}
