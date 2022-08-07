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
    var_0 = common_scripts\utility::_id_242E( "00_particle_shadow_animated_lrg_e" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 5591.65, 8816.33, 138.044 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1566.45, 4607.07, 116.125 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2102.13, 4274.05, 141.342 ), ( 270.0, 0.0, 0.0 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "31" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1649.45, -121.399, 65.3755 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "32" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -579.914, 4969.53, 56.9287 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -610.895, -5549.72, 115.473 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 33.7553, -5293.56, 115.223 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "50" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -635.625, 3709.13, 140.674 ), ( 297.303, 229.278, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "50" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -635.625, 4073.75, 129.47 ), ( 0.0, 180.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "3" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2970.52, 1298.75, 135.578 ), ( 278.531, 270.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "4" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 625.68, 73.125, 171.433 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "30" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2344.02, 845.501, 0.0 ), ( 270.0, 0.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "16" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 556.485, -3916.65, 116.96 ), ( 276.618, 318.334, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "62" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 674.298, 1265.58, 30.0872 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "62" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 836.097, 1243.72, 21.0953 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "61" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2097.21, 2097.19, 95.1349 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "64" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2829.16, 2106.63, -0.463783 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "63" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2287.55, -432.373, 67.0 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "60" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2318.58, 5496.5, 13.1654 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "60" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2605.05, 5470.59, 10.2784 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "12" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -15557.3, -17653.4, -104.067 ), ( 272.08, 332.006, -67.0002 ) );
    var_0.v["delay"] = 5.5;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "12" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -15629.3, -17339.0, -43.6434 ), ( 290.42, 286.215, -97.6455 ) );
    var_0.v["delay"] = 5.25;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1699.16, 4548.44, 237.79 ), ( 270.0, 0.0, 52.9994 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2147.54, 4088.97, 256.579 ), ( 270.0, 0.0, -36.0012 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -629.177, -5494.81, 250.799 ), ( 270.0, 180.0, 146.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -137.194, -5058.9, 261.309 ), ( 270.0, 356.055, 58.9444 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1868.42, 4284.61, 170.125 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 0.5;
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1973.68, 4066.17, 57.9678 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 1;
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "10" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1438.86, 4747.93, 263.577 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 1;
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -812.015, -5727.22, 263.304 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 1;
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -391.162, -5000.15, 150.913 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "11" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -680.57, -5344.35, 153.813 ), ( 270.0, 0.0, -36.0012 ) );
    var_0.v["sizescale"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "smk_churn", "16" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 587.784, -3914.12, 144.36 ), ( 276.618, 318.334, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "smk_churn", "35" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -2970.89, -3695.89, 163.241 ), ( 276.618, 318.333, -56.0003 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "117" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1978.81, -3702.91, 65.1621 ), ( 276.618, 318.334, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "117" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1802.37, -3930.52, 37.499 ), ( 276.618, 318.334, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "smk_churn", "113" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -4191.24, -7094.18, 76.8797 ), ( 276.618, 318.334, 123.999 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "smk_churn", "118" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1138.71, -135.171, 123.622 ), ( 276.618, 318.334, 129.998 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "61" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 1943.48, 2171.86, 58.5425 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "61" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2112.06, 2362.71, 38.0115 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "60" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 2600.21, 5490.3, 20.9154 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "110" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1583.29, -1526.48, 30.125 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "111" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1581.92, -2387.5, 13.6195 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "fire_bits", "111" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -1388.01, -2536.36, 16.4056 ), ( 0.0, 90.0, 0.0 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "200" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -7362.69, -10154.2, 253.125 ), ( 270.0, 0.0, -34.0015 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "200" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -7085.87, -10275.1, 294.103 ), ( 270.0, 0.0, -27.0014 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "202" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -13409.9, -18416.2, 253.84 ), ( 270.0, 0.0, 8.99833 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "202" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -13658.0, -18787.2, 252.356 ), ( 270.0, 0.0, 8.99833 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "201" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -16177.4, -16765.9, 264.484 ), ( 270.0, 0.0, -2.00196 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "201" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -16555.9, -17071.4, 214.625 ), ( 270.0, 0.0, -2.00196 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "200" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -7384.68, -10098.6, 8.64706 ), ( 270.0, 0.0, -24.0016 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "202" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -13751.4, -18598.4, 7.0 ), ( 270.0, 0.0, 8.99833 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "201" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -16178.1, -16972.8, 2.79431 ), ( 270.0, 0.0, -2.00196 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "200" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -7516.56, -10686.2, 239.657 ), ( 270.0, 0.0, 63.9982 ) );
    var_0.v["sizescale"] = 0.2;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "200" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -7505.45, -10693.2, 25.125 ), ( 270.0, 341.565, 81.4328 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "dust_line", "202" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -13640.9, -18120.2, 18.625 ), ( 270.0, 0.0, -78.0022 ) );
    var_0.v["delay"] = 2;
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "35" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -2848.47, -3675.95, 208.125 ), ( 276.618, 318.333, -56.0003 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "114" );
    var_0 common_scripts\_createfx::_id_7E8F( ( -3151.59, -6792.21, 104.239 ), ( 276.618, 318.333, -56.0003 ) );
    var_0 = common_scripts\_createfx::_id_23FF( "houseFire", "119" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 3174.41, 4303.84, 182.439 ), ( 270.0, 0.0, 0.0 ) );
}
