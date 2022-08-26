// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    sunflare();
    var_0 = maps\_utility::create_vision_set_fog( "cargoship" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.82742;
    var_0.atmosfoghalfplanedistance = 431.322;
    var_0.atmosfogstartdistance = 6731.55;
    var_0.atmosfogdistancescale = 3;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 10000;
    var_0.atmosfogheightfoghalfplanedistance = 2340.66;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_intro" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.418689, 0.425873, 0.423119 );
    var_0.atmosfoghazestrength = 0.231324;
    var_0.atmosfoghazespread = 0.015338;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.60568;
    var_0.atmosfoghalfplanedistance = 894.398;
    var_0.atmosfogstartdistance = 6731.55;
    var_0.atmosfogdistancescale = 4.98444;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( 0.774522, 0.631243, -0.0406056 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 265.145;
    var_0.atmosfogheightfoghalfplanedistance = 7559.24;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_outro" );
    var_0.startdist = 1700;
    var_0.halfwaydist = 12500;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.416828, 0.33779, 0.276233 );
    var_0.atmosfoghazestrength = 0.2;
    var_0.atmosfoghazespread = 0.03;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.60568;
    var_0.atmosfoghalfplanedistance = 3137.87;
    var_0.atmosfogstartdistance = 150;
    var_0.atmosfogdistancescale = 3;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.528517, 0.271863, -0.756654 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 250;
    var_0.atmosfogheightfoghalfplanedistance = 1464.73;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_exterior" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.82742;
    var_0.atmosfoghalfplanedistance = 850;
    var_0.atmosfogstartdistance = 250;
    var_0.atmosfogdistancescale = 3.03118;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 150;
    var_0.atmosfogheightfoghalfplanedistance = 7000;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_interior_transition" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.82742;
    var_0.atmosfoghalfplanedistance = 431.322;
    var_0.atmosfogstartdistance = 6731.55;
    var_0.atmosfogdistancescale = 3;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 10000;
    var_0.atmosfogheightfoghalfplanedistance = 2340.66;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_interior_upperdeck" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 8.96999;
    var_0.atmosfoghalfplanedistance = 624.864;
    var_0.atmosfogstartdistance = 1448.87;
    var_0.atmosfogdistancescale = 1.56681;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = -251.54;
    var_0.atmosfogheightfoghalfplanedistance = 113.12;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_interior_cargohold" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 8.96999;
    var_0.atmosfoghalfplanedistance = 624.864;
    var_0.atmosfogstartdistance = 1448.87;
    var_0.atmosfogdistancescale = 1.56681;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = -251.54;
    var_0.atmosfogheightfoghalfplanedistance = 113.12;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_exterior_container" );
    var_0.startdist = 1696;
    var_0.halfwaydist = 12289;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.446921, 0.446433, 0.446396 );
    var_0.atmosfoghazecolor = ( 0.496815, 0.57431, 0.649682 );
    var_0.atmosfoghazestrength = 0.0578818;
    var_0.atmosfoghazespread = 0.026612;
    var_0.atmosfogextinctionstrength = 1;
    var_0.atmosfoginscatterstrength = 6.82742;
    var_0.atmosfoghalfplanedistance = 431.322;
    var_0.atmosfogstartdistance = 6731.55;
    var_0.atmosfogdistancescale = 3;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( -0.106337, 0.542525, 0.833282 );
    var_0.atmosfogheightfogenabled = 1;
    var_0.atmosfogheightfogbaseheight = 10000;
    var_0.atmosfogheightfoghalfplanedistance = 2340.66;
    var_0 = maps\_utility::create_vision_set_fog( "cargoship_interior_cargohold_alert" );
    var_0.startdist = 3131.52;
    var_0.halfwaydist = 14406;
    var_0.red = 0.258821;
    var_0.green = 0.309172;
    var_0.blue = 0.350739;
    var_0.hdrcolorintensity = 12.029;
    var_0.maxopacity = 1;
    var_0.transitiontime = 0;
    var_0.sunfogenabled = 1;
    var_0.sunred = 0.369427;
    var_0.sungreen = 0.467384;
    var_0.sunblue = 0.501062;
    var_0.hdrsuncolorintensity = 15.5251;
    var_0.sundir = ( 0.526726, -0.470463, 0.707973 );
    var_0.sunbeginfadeangle = 7.10021;
    var_0.sunendfadeangle = 143.004;
    var_0.normalfogscale = 2.19207;
    var_0.skyfogintensity = 0.669102;
    var_0.skyfogminangle = -12.2129;
    var_0.skyfogmaxangle = 50.6368;
    var_0.heightfogenabled = 0;
    var_0.heightfogbaseheight = 0;
    var_0.heightfoghalfplanedistance = 1000;
    var_0.atmosfogenabled = 1;
    var_0.atmosfogsunfogcolor = ( 0.659236, 0.450106, 0.392781 );
    var_0.atmosfoghazecolor = ( 0.454352, 0.366242, 0.348195 );
    var_0.atmosfoghazestrength = 0.167015;
    var_0.atmosfoghazespread = 0.0334029;
    var_0.atmosfogextinctionstrength = 0.810021;
    var_0.atmosfoginscatterstrength = 11.8727;
    var_0.atmosfoghalfplanedistance = 23174.2;
    var_0.atmosfogstartdistance = -1.60032;
    var_0.atmosfogdistancescale = 1.04384;
    var_0.atmosfogskydistance = 100000;
    var_0.atmosfogskyangularfalloffenabled = 0;
    var_0.atmosfogskyfalloffstartangle = 0;
    var_0.atmosfogskyfalloffanglerange = 90;
    var_0.atmosfogsundirection = ( 0.606564, -0.515279, 0.605448 );
    var_0.atmosfogheightfogenabled = 0;
    var_0.atmosfogheightfogbaseheight = -1920.67;
    var_0.atmosfogheightfoghalfplanedistance = 5720.68;
}

sunflare()
{
    var_0 = maps\_utility::create_sunflare_setting( "default" );
    var_0.position = ( -30.0, 85.0, 0.0 );
    maps\_art::sunflare_changes( "default", 0 );
}
