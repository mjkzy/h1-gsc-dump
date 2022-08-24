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
    _id_8FCC();
    var_0 = maps\_utility::_id_23DF( "cargoship" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.82742;
    var_0._id_0DB6 = 431.322;
    var_0._id_0DC2 = 6731.55;
    var_0._id_0DB3 = 3;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 10000;
    var_0._id_0DBC = 2340.66;
    var_0 = maps\_utility::_id_23DF( "cargoship_intro" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.418689, 0.425873, 0.423119 );
    var_0._id_0DB9 = 0.231324;
    var_0._id_0DB8 = 0.015338;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.60568;
    var_0._id_0DB6 = 894.398;
    var_0._id_0DC2 = 6731.55;
    var_0._id_0DB3 = 4.98444;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( 0.774522, 0.631243, -0.0406056 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 265.145;
    var_0._id_0DBC = 7559.24;
    var_0 = maps\_utility::_id_23DF( "cargoship_outro" );
    var_0._id_8D08 = 1700;
    var_0._id_4500 = 12500;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.416828, 0.33779, 0.276233 );
    var_0._id_0DB9 = 0.2;
    var_0._id_0DB8 = 0.03;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.60568;
    var_0._id_0DB6 = 3137.87;
    var_0._id_0DC2 = 150;
    var_0._id_0DB3 = 3;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.528517, 0.271863, -0.756654 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 250;
    var_0._id_0DBC = 1464.73;
    var_0 = maps\_utility::_id_23DF( "cargoship_exterior" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.82742;
    var_0._id_0DB6 = 850;
    var_0._id_0DC2 = 250;
    var_0._id_0DB3 = 3.03118;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 150;
    var_0._id_0DBC = 7000;
    var_0 = maps\_utility::_id_23DF( "cargoship_interior_transition" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.82742;
    var_0._id_0DB6 = 431.322;
    var_0._id_0DC2 = 6731.55;
    var_0._id_0DB3 = 3;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 10000;
    var_0._id_0DBC = 2340.66;
    var_0 = maps\_utility::_id_23DF( "cargoship_interior_upperdeck" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 8.96999;
    var_0._id_0DB6 = 624.864;
    var_0._id_0DC2 = 1448.87;
    var_0._id_0DB3 = 1.56681;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = -251.54;
    var_0._id_0DBC = 113.12;
    var_0 = maps\_utility::_id_23DF( "cargoship_interior_cargohold" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 8.96999;
    var_0._id_0DB6 = 624.864;
    var_0._id_0DC2 = 1448.87;
    var_0._id_0DB3 = 1.56681;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = -251.54;
    var_0._id_0DBC = 113.12;
    var_0 = maps\_utility::_id_23DF( "cargoship_exterior_container" );
    var_0._id_8D08 = 1696;
    var_0._id_4500 = 12289;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.446921, 0.446433, 0.446396 );
    var_0._id_0DB7 = ( 0.496815, 0.57431, 0.649682 );
    var_0._id_0DB9 = 0.0578818;
    var_0._id_0DB8 = 0.026612;
    var_0._id_0DB5 = 1;
    var_0._id_0DBD = 6.82742;
    var_0._id_0DB6 = 431.322;
    var_0._id_0DC2 = 6731.55;
    var_0._id_0DB3 = 3;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( -0.106337, 0.542525, 0.833282 );
    var_0._id_0DBB = 1;
    var_0._id_0DBA = 10000;
    var_0._id_0DBC = 2340.66;
    var_0 = maps\_utility::_id_23DF( "cargoship_interior_cargohold_alert" );
    var_0._id_8D08 = 3131.52;
    var_0._id_4500 = 14406;
    var_0._id_7299 = 0.258821;
    var_0._id_43D8 = 0.309172;
    var_0._id_14C5 = 0.350739;
    var_0._id_4774 = 12.029;
    var_0._id_5A47 = 1;
    var_0._id_971C = 0;
    var_0._id_8FD1 = 1;
    var_0._id_8FD9 = 0.369427;
    var_0._id_8FD2 = 0.467384;
    var_0._id_8FBF = 0.501062;
    var_0._id_4776 = 15.5251;
    var_0._id_8FC6 = ( 0.526726, -0.470463, 0.707973 );
    var_0._id_8FBD = 7.10021;
    var_0._id_8FC9 = 143.004;
    var_0._id_615E = 2.19207;
    var_0._id_85CD = 0.669102;
    var_0._id_85CF = -12.2129;
    var_0._id_85CE = 50.6368;
    var_0._id_479F = 0;
    var_0._id_479E = 0;
    var_0._id_47A0 = 1000;
    var_0._id_0DB4 = 1;
    var_0._id_0DC4 = ( 0.659236, 0.450106, 0.392781 );
    var_0._id_0DB7 = ( 0.454352, 0.366242, 0.348195 );
    var_0._id_0DB9 = 0.167015;
    var_0._id_0DB8 = 0.0334029;
    var_0._id_0DB5 = 0.810021;
    var_0._id_0DBD = 11.8727;
    var_0._id_0DB6 = 23174.2;
    var_0._id_0DC2 = -1.60032;
    var_0._id_0DB3 = 1.04384;
    var_0._id_0DBF = 100000;
    var_0._id_0DBE = 0;
    var_0._id_0DC1 = 0;
    var_0._id_0DC0 = 90;
    var_0._id_0DC3 = ( 0.606564, -0.515279, 0.605448 );
    var_0._id_0DBB = 0;
    var_0._id_0DBA = -1920.67;
    var_0._id_0DBC = 5720.68;
}

_id_8FCC()
{
    var_0 = maps\_utility::_id_23DB( "default" );
    var_0.position = ( -30.0, 85.0, 0.0 );
    maps\_art::_id_8FCD( "default", 0 );
}
