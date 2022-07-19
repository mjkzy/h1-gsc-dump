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

}

_id_8241()
{
    if ( isdefined( level._id_6048 ) )
        return;

    var_0 = [];
    var_0[var_0.size] = "american";
    var_0[var_0.size] = "british";
    var_0[var_0.size] = "arab";
    var_0[var_0.size] = "russian";
    var_0[var_0.size] = "seal";
    var_0[var_0.size] = "taskforce";
    var_0[var_0.size] = "secretservice";
    var_0[var_0.size] = "multilingual";
    var_0[var_0.size] = "portuguese";
    var_0[var_0.size] = "shadowcompany";
    var_0[var_0.size] = "delta";
    var_0[var_0.size] = "french";
    var_0[var_0.size] = "african";
    var_0[var_0.size] = "czech";
    var_0[var_0.size] = "czech_surnames";
    var_0[var_0.size] = "pmc";
    var_0[var_0.size] = "xslice";
    var_0[var_0.size] = "kva";
    var_0[var_0.size] = "atlas";
    var_0[var_0.size] = "sentinel";
    var_0[var_0.size] = "squad";
    var_0[var_0.size] = "northkorea";

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        level._id_6048[var_0[var_1]] = [];

    _id_0778( "american", "Abrahamsson" );
    _id_0778( "american", "Alavi" );
    _id_0778( "american", "Alderman" );
    _id_0778( "american", "Allen" );
    _id_0778( "american", "Arya" );
    _id_0778( "american", "Baker" );
    _id_0778( "american", "Barb" );
    _id_0778( "american", "Bartolucci" );
    _id_0778( "american", "Bell" );
    _id_0778( "american", "Blumel" );
    _id_0778( "american", "Boon" );
    _id_0778( "american", "Bowling" );
    _id_0778( "american", "Campbell" );
    _id_0778( "american", "Chen" );
    _id_0778( "american", "Cherubini" );
    _id_0778( "american", "Collier" );
    _id_0778( "american", "Cotterell" );
    _id_0778( "american", "Davis" );
    _id_0778( "american", "Eady" );
    _id_0778( "american", "Emslie" );
    _id_0778( "american", "Field" );
    _id_0778( "american", "Fukuda" );
    _id_0778( "american", "Gaines" );
    _id_0778( "american", "Ganus" );
    _id_0778( "american", "Gigliotti" );
    _id_0778( "american", "Gillis" );
    _id_0778( "american", "Glasco" );
    _id_0778( "american", "Glenn" );
    _id_0778( "american", "Gompert" );
    _id_0778( "american", "Grenier" );
    _id_0778( "american", "Haggerty" );
    _id_0778( "american", "Hammon" );
    _id_0778( "american", "Harmer" );
    _id_0778( "american", "Harris" );
    _id_0778( "american", "Hatch" );
    _id_0778( "american", "Hawkins" );
    _id_0778( "american", "Heath" );
    _id_0778( "american", "James" );
    _id_0778( "american", "Kar" );
    _id_0778( "american", "Keating" );
    _id_0778( "american", "Kriegler" );
    _id_0778( "american", "Kuhn" );
    _id_0778( "american", "Lastimosa" );
    _id_0778( "american", "Lopez" );
    _id_0778( "american", "Lor" );
    _id_0778( "american", "Louie" );
    _id_0778( "american", "Lowis" );
    _id_0778( "american", "Luo" );
    _id_0778( "american", "Massey" );
    _id_0778( "american", "McCandlish" );
    _id_0778( "american", "McCoy" );
    _id_0778( "american", "McLeod" );
    _id_0778( "american", "Messerly" );
    _id_0778( "american", "Miller" );
    _id_0778( "american", "Niebel" );
    _id_0778( "american", "Oh" );
    _id_0778( "american", "Ojeda" );
    _id_0778( "american", "Onur" );
    _id_0778( "american", "Peas" );
    _id_0778( "american", "Pelayo" );
    _id_0778( "american", "Pierce" );
    _id_0778( "american", "Porter" );
    _id_0778( "american", "Rieke" );
    _id_0778( "american", "Rosemeier" );
    _id_0778( "american", "Roycewicz" );
    _id_0778( "american", "Rubin" );
    _id_0778( "american", "Rule" );
    _id_0778( "american", "Sharrigan" );
    _id_0778( "american", "Shiring" );
    _id_0778( "american", "Sue" );
    _id_0778( "american", "Turner" );
    _id_0778( "american", "Vinson" );
    _id_0778( "american", "Volker" );
    _id_0778( "american", "Wang" );
    _id_0778( "american", "West" );
    _id_0778( "american", "Yang" );
    _id_0778( "american", "Zampella" );
    _id_0778( "american", "Mejia" );
    _id_0778( "american", "Becerra" );
    _id_0778( "american", "Castillo" );
    _id_0778( "american", "Childress" );
    _id_0778( "american", "Germann" );
    _id_0778( "american", "Lara" );
    _id_0778( "american", "Ovando" );
    _id_0778( "american", "Slanchik" );
    _id_0778( "american", "Vo" );
    _id_0778( "american", "Garnett" );
    _id_0778( "american", "Smith" );
    _id_0778( "american", "Troy" );
    _id_0778( "american", "Carson" );
    _id_0778( "american", "Arriaga" );
    _id_0778( "american", "Beckman" );
    _id_0778( "american", "Castellanos" );
    _id_0778( "american", "Clopper" );
    _id_0778( "american", "Crow" );
    _id_0778( "american", "Demaray" );
    _id_0778( "american", "Eberlein" );
    _id_0778( "american", "Gallego" );
    _id_0778( "american", "Gonzalez" );
    _id_0778( "american", "Inman" );
    _id_0778( "american", "Kelly" );
    _id_0778( "american", "Kim" );
    _id_0778( "american", "Li" );
    _id_0778( "american", "McFerron" );
    _id_0778( "american", "Mertz" );
    _id_0778( "american", "Moss" );
    _id_0778( "american", "Oztalay" );
    _id_0778( "american", "Rude" );
    _id_0778( "american", "Shiau" );
    _id_0778( "american", "Slegeir" );
    _id_0778( "american", "Tangtiphongkul" );
    _id_0778( "american", "Torres" );
    _id_0778( "american", "Uberman" );
    _id_0778( "american", "Villamin" );
    _id_0778( "american", "Watts" );
    _id_0778( "american", "Yu" );
    _id_0778( "american", "Almaguer" );
    _id_0778( "american", "Bacon" );
    _id_0778( "american", "Harvey" );
    _id_0778( "american", "Hunter" );
    _id_0778( "american", "Thomas" );
    _id_0778( "american", "Wilson" );
    _id_0778( "american", "Adamson" );
    _id_0778( "american", "Apilado" );
    _id_0778( "american", "Bayless" );
    _id_0778( "american", "Beese" );
    _id_0778( "american", "Berger" );
    _id_0778( "american", "Biessman" );
    _id_0778( "american", "Bormann" );
    _id_0778( "american", "Botero" );
    _id_0778( "american", "Burnett" );
    _id_0778( "american", "Button" );
    _id_0778( "american", "Butts" );
    _id_0778( "american", "Carani" );
    _id_0778( "american", "Carraher" );
    _id_0778( "american", "Cervantes" );
    _id_0778( "american", "Comeau" );
    _id_0778( "american", "Cooper" );
    _id_0778( "american", "Crump" );
    _id_0778( "american", "Dahm" );
    _id_0778( "american", "Davis" );
    _id_0778( "american", "Degenhardt" );
    _id_0778( "american", "DeVenero" );
    _id_0778( "american", "Diorio" );
    _id_0778( "american", "Dunkelberger" );
    _id_0778( "american", "Eckstein" );
    _id_0778( "american", "Edwards" );
    _id_0778( "american", "Ellsbury" );
    _id_0778( "american", "Fifield" );
    _id_0778( "american", "Flickinger" );
    _id_0778( "american", "Frame" );
    _id_0778( "american", "Ganous" );
    _id_0778( "american", "Garcia" );
    _id_0778( "american", "Giombi" );
    _id_0778( "american", "Glowacki" );
    _id_0778( "american", "Gustafson" );
    _id_0778( "american", "Hackbarth" );
    _id_0778( "american", "Hamilton" );
    _id_0778( "american", "Hartmann" );
    _id_0778( "american", "Hatcher" );
    _id_0778( "american", "Hauptman" );
    _id_0778( "american", "Hiley" );
    _id_0778( "american", "Hill" );
    _id_0778( "american", "Holt" );
    _id_0778( "american", "Holzapfel" );
    _id_0778( "american", "Ross" );
    _id_0778( "american", "Jalowitz" );
    _id_0778( "american", "Karathomas" );
    _id_0778( "american", "Kausak" );
    _id_0778( "american", "Kelly" );
    _id_0778( "american", "Kierzek" );
    _id_0778( "american", "Kleiman" );
    _id_0778( "american", "Koenig" );
    _id_0778( "american", "Kornkven" );
    _id_0778( "american", "Kraft" );
    _id_0778( "american", "Kramer" );
    _id_0778( "american", "Kreeger" );
    _id_0778( "american", "Kurdziel" );
    _id_0778( "american", "Leslie" );
    _id_0778( "american", "Linn" );
    _id_0778( "american", "Loane" );
    _id_0778( "american", "Matejka" );
    _id_0778( "american", "Maxwell" );
    _id_0778( "american", "Menard" );
    _id_0778( "american", "Merboth" );
    _id_0778( "american", "Meyer" );
    _id_0778( "american", "Miller" );
    _id_0778( "american", "Moore" );
    _id_0778( "american", "Negrete" );
    _id_0778( "american", "Newton" );
    _id_0778( "american", "Nigl" );
    _id_0778( "american", "O'leary" );
    _id_0778( "american", "Olson" );
    _id_0778( "american", "Paulsrud" );
    _id_0778( "american", "Peeples" );
    _id_0778( "american", "Pellas" );
    _id_0778( "american", "Person" );
    _id_0778( "american", "Petersen" );
    _id_0778( "american", "Pinkston" );
    _id_0778( "american", "Renner" );
    _id_0778( "american", "Riddle" );
    _id_0778( "american", "Ries" );
    _id_0778( "american", "Schmidt" );
    _id_0778( "american", "Seaman" );
    _id_0778( "american", "Shorey" );
    _id_0778( "american", "Skubal" );
    _id_0778( "american", "Smith" );
    _id_0778( "american", "Stampfli" );
    _id_0778( "american", "Stephens" );
    _id_0778( "american", "Styrwoll" );
    _id_0778( "american", "Sumsky" );
    _id_0778( "american", "Superty" );
    _id_0778( "american", "Swekel" );
    _id_0778( "american", "Thurler" );
    _id_0778( "american", "Tiran" );
    _id_0778( "american", "Tomplait" );
    _id_0778( "american", "Uttech" );
    _id_0778( "american", "Walker" );
    _id_0778( "american", "Weiss" );
    _id_0778( "american", "Willes" );
    _id_0778( "american", "Williams" );
    _id_0778( "american", "Ye" );
    _id_0778( "american", "Yen" );
    _id_0778( "american", "Yepes" );
    _id_0778( "american", "Zeng" );
    _id_0778( "american", "Zuehls" );
    _id_0778( "british", "Abbot" );
    _id_0778( "british", "Adams" );
    _id_0778( "british", "Bartlett" );
    _id_0778( "british", "Boyd" );
    _id_0778( "british", "Boyle" );
    _id_0778( "british", "Bremner" );
    _id_0778( "british", "Carlyle" );
    _id_0778( "british", "Carver" );
    _id_0778( "british", "Cheek" );
    _id_0778( "british", "Clarke" );
    _id_0778( "british", "Collins" );
    _id_0778( "british", "Compton" );
    _id_0778( "british", "Connolly" );
    _id_0778( "british", "Cook" );
    _id_0778( "british", "Dowd" );
    _id_0778( "british", "Field" );
    _id_0778( "british", "Fleming" );
    _id_0778( "british", "Fletcher" );
    _id_0778( "british", "Flynn" );
    _id_0778( "british", "Grant" );
    _id_0778( "british", "Greaves" );
    _id_0778( "british", "Griffin" );
    _id_0778( "british", "Harris" );
    _id_0778( "british", "Harrison" );
    _id_0778( "british", "Heath" );
    _id_0778( "british", "Henderson" );
    _id_0778( "british", "Hopkins" );
    _id_0778( "british", "Hoyt" );
    _id_0778( "british", "Kent" );
    _id_0778( "british", "Lewis" );
    _id_0778( "british", "Lipton" );
    _id_0778( "british", "Macdonald" );
    _id_0778( "british", "Maxwell" );
    _id_0778( "british", "McQuarrie" );
    _id_0778( "british", "Miller" );
    _id_0778( "british", "Mitchell" );
    _id_0778( "british", "Moore" );
    _id_0778( "british", "Murphy" );
    _id_0778( "british", "Murray" );
    _id_0778( "british", "Pearce" );
    _id_0778( "british", "Plumber" );
    _id_0778( "british", "Pritchard" );
    _id_0778( "british", "Rankin" );
    _id_0778( "british", "Reed" );
    _id_0778( "british", "Ritchie" );
    _id_0778( "british", "Ross" );
    _id_0778( "british", "Roth" );
    _id_0778( "british", "Smith" );
    _id_0778( "british", "Stevenson" );
    _id_0778( "british", "Stuart" );
    _id_0778( "british", "Sullivan" );
    _id_0778( "british", "Thompson" );
    _id_0778( "british", "Veale" );
    _id_0778( "british", "Wallace" );
    _id_0778( "british", "Wells" );
    _id_0778( "british", "Welsh" );
    _id_0778( "british", "Beinke" );
    _id_0778( "british", "Cable" );
    _id_0778( "british", "Flora" );
    _id_0778( "british", "Fox" );
    _id_0778( "british", "Grubner" );
    _id_0778( "british", "Knox" );
    _id_0778( "british", "Kuchar" );
    _id_0778( "british", "Lajoie" );
    _id_0778( "british", "Lepanen" );
    _id_0778( "british", "Lishman" );
    _id_0778( "british", "Mates" );
    _id_0778( "british", "Mauer" );
    _id_0778( "british", "McCready" );
    _id_0778( "british", "McInerney" );
    _id_0778( "british", "Robertson" );
    _id_0778( "british", "Scholten" );
    _id_0778( "british", "Smith" );
    _id_0778( "british", "Sutton" );
    _id_0778( "british", "Teebagy" );
    _id_0778( "british", "Treadwell" );
    _id_0778( "british", "Wahlquist" );
    _id_0778( "british", "Wallace" );
    _id_0778( "british", "Welch" );
    _id_0778( "british", "Whitlow" );
    _id_0778( "british", "Zimmermann" );
    _id_0778( "british", "Aube" );
    _id_0778( "british", "Auger" );
    _id_0778( "british", "Beaulieu" );
    _id_0778( "british", "Bellehumeur" );
    _id_0778( "british", "Bibeau" );
    _id_0778( "british", "Blondeau" );
    _id_0778( "british", "Boudreau" );
    _id_0778( "british", "Bouffard" );
    _id_0778( "british", "Boulianne" );
    _id_0778( "british", "Carrier" );
    _id_0778( "british", "Charette" );
    _id_0778( "british", "Charron" );
    _id_0778( "british", "Cormier" );
    _id_0778( "british", "Cote" );
    _id_0778( "british", "Demers" );
    _id_0778( "british", "Dion" );
    _id_0778( "british", "Dompierre" );
    _id_0778( "british", "Fortin" );
    _id_0778( "british", "Fournier" );
    _id_0778( "british", "Fradette" );
    _id_0778( "british", "Gagne" );
    _id_0778( "british", "Gauthier" );
    _id_0778( "british", "Giguere" );
    _id_0778( "british", "Gosselin" );
    _id_0778( "british", "Hebert" );
    _id_0778( "british", "Laberge" );
    _id_0778( "british", "Lachance" );
    _id_0778( "british", "Lagrange" );
    _id_0778( "british", "Larochelle" );
    _id_0778( "british", "Lavigne" );
    _id_0778( "british", "Lavoie" );
    _id_0778( "british", "Lepage" );
    _id_0778( "british", "Lesperance" );
    _id_0778( "british", "Lessard" );
    _id_0778( "british", "Levesque" );
    _id_0778( "british", "Mahe" );
    _id_0778( "british", "Martin" );
    _id_0778( "british", "Meunier" );
    _id_0778( "british", "Montcalm" );
    _id_0778( "british", "Moreau" );
    _id_0778( "british", "Morel" );
    _id_0778( "british", "Ouellet" );
    _id_0778( "british", "Paradis" );
    _id_0778( "british", "Parent" );
    _id_0778( "british", "Pinsonneault" );
    _id_0778( "british", "Poirier" );
    _id_0778( "british", "Polloni" );
    _id_0778( "british", "Pouliot" );
    _id_0778( "british", "Proulx" );
    _id_0778( "british", "Rheaume" );
    _id_0778( "british", "Rivard" );
    _id_0778( "british", "Robidoux" );
    _id_0778( "british", "Samson" );
    _id_0778( "british", "Simard" );
    _id_0778( "british", "St-Pierre" );
    _id_0778( "british", "Taddei" );
    _id_0778( "british", "Vezina" );
    _id_0778( "british", "Wauthy" );
    _id_0778( "russian", "Sasha Ivanov" );
    _id_0778( "russian", "Aleksei Vyshinskiy" );
    _id_0778( "russian", "Boris Ryzhkov" );
    _id_0778( "russian", "Dima Tikhonov" );
    _id_0778( "russian", "Oleg Kosygin" );
    _id_0778( "russian", "Pyotr Bulganin" );
    _id_0778( "russian", "Petya Malenkov" );
    _id_0778( "russian", "Alyosha Tarkovsky" );
    _id_0778( "russian", "Sergei Grombyo" );
    _id_0778( "russian", "Viktor Kuznetsov" );
    _id_0778( "russian", "Misha Podgorniy" );
    _id_0778( "russian", "Borya Mikoyan" );
    _id_0778( "russian", "Anatoly Voroshilov" );
    _id_0778( "russian", "Kolya Shvernik" );
    _id_0778( "russian", "Nikolai Kalinin" );
    _id_0778( "russian", "Vladimir Brezhnev" );
    _id_0778( "russian", "Pavel Chernenko" );
    _id_0778( "russian", "Volodya Andropov" );
    _id_0778( "russian", "Yuri Nikitin" );
    _id_0778( "russian", "Dmitri Petrenko" );
    _id_0778( "russian", "Vanya Gerasimov" );
    _id_0778( "russian", "Mikhail Zhuravlev" );
    _id_0778( "russian", "Ivan Lukin" );
    _id_0778( "russian", "Kostya Golubev" );
    _id_0778( "russian", "Konstantin Lebedev" );
    _id_0778( "russian", "Aleksandr Vasilev" );
    _id_0778( "russian", "Yakov Glushenko" );
    _id_0778( "russian", "Sasha Semenov" );
    _id_0778( "russian", "Aleksei Ulyanov" );
    _id_0778( "russian", "Boris Yefremov" );
    _id_0778( "russian", "Dima Chernyshenko" );
    _id_0778( "russian", "Oleg Stepanoshvili" );
    _id_0778( "russian", "Pyotr Demchenko" );
    _id_0778( "russian", "Petya Avagimov" );
    _id_0778( "russian", "Alyosha Murzaev" );
    _id_0778( "russian", "Sergei Shkuratov" );
    _id_0778( "russian", "Viktor Yakimenko" );
    _id_0778( "russian", "Misha Masijashvili" );
    _id_0778( "russian", "Borya Shapovalov" );
    _id_0778( "russian", "Anatoly Ivashenko" );
    _id_0778( "russian", "Kolya Dovzhenko" );
    _id_0778( "russian", "Nikolai Turdyev" );
    _id_0778( "russian", "Vladimir Sabgaida" );
    _id_0778( "russian", "Pavel Svirin" );
    _id_0778( "russian", "Volodya Sarayev" );
    _id_0778( "russian", "Yuri Kiselev" );
    _id_0778( "russian", "Dmitri Bondarenko" );
    _id_0778( "russian", "Vanya Chernogolov" );
    _id_0778( "russian", "Mikhail Voronov" );
    _id_0778( "russian", "Ivan Afanasyev" );
    _id_0778( "russian", "Kostya Gridin" );
    _id_0778( "russian", "Konstantin Petrov" );
    _id_0778( "russian", "Aleksandr Rykov" );
    _id_0778( "russian", "Yakov Shvedov" );
    _id_0778( "arab", "Abdulaziz" );
    _id_0778( "arab", "Abdullah" );
    _id_0778( "arab", "Ali" );
    _id_0778( "arab", "Amin" );
    _id_0778( "arab", "Bassam" );
    _id_0778( "arab", "Fahd" );
    _id_0778( "arab", "Faris" );
    _id_0778( "arab", "Fouad" );
    _id_0778( "arab", "Habib" );
    _id_0778( "arab", "Hakem" );
    _id_0778( "arab", "Hassan" );
    _id_0778( "arab", "Ibrahim" );
    _id_0778( "arab", "Imad" );
    _id_0778( "arab", "Jabbar" );
    _id_0778( "arab", "Kareem" );
    _id_0778( "arab", "Khalid" );
    _id_0778( "arab", "Malik" );
    _id_0778( "arab", "Muhammad" );
    _id_0778( "arab", "Nasir" );
    _id_0778( "arab", "Omar" );
    _id_0778( "arab", "Rafiq" );
    _id_0778( "arab", "Rami" );
    _id_0778( "arab", "Said" );
    _id_0778( "arab", "Salim" );
    _id_0778( "arab", "Samir" );
    _id_0778( "arab", "Talib" );
    _id_0778( "arab", "Tariq" );
    _id_0778( "arab", "Youssef" );
    _id_0778( "arab", "Ziad" );
    _id_0778( "seal", "######InvalidName######" );
    _id_0778( "taskforce", "######InvalidName######" );
    _id_0778( "xslice", "######InvalidName######" );
    _id_0778( "delta", "######InvalidName######" );
    _id_0778( "secretservice", "######InvalidName######" );
    _id_0778( "portuguese", "######InvalidName######" );
    _id_0778( "shadowcompany", "######InvalidName######" );
    _id_0778( "multilingual", "######InvalidName######" );
    _id_0778( "french", "######InvalidName######" );
    _id_0778( "african", "######InvalidName######" );
    _id_0778( "czech", "######InvalidName######" );
    _id_0778( "czech_surnames", "######InvalidName######" );
    _id_0778( "atlas", "######InvalidName######" );
    _id_0778( "sentinel", "######InvalidName######" );
    _id_0778( "kva", "######InvalidName######" );
    _id_0778( "squad", "######InvalidName######" );
    _id_0778( "northkorea", "######InvalidName######" );
    _id_0778( "pmc", "######InvalidName######" );
    _id_4D52();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        _id_737D( var_0[var_1] );
        _id_7127( var_0[var_1] );
        level._id_6045[var_0[var_1]] = 0;
    }
}

_id_21D7( var_0, var_1 )
{
    level._id_6048[var_0] = level._id_6048[var_1];
}

_id_0778( var_0, var_1 )
{
    level._id_6048[var_0][level._id_6048[var_0].size] = var_1;
}

_id_736E( var_0, var_1 )
{
    level._id_6048[var_0] = common_scripts\utility::_id_0CF6( level._id_6048[var_0], var_1 );
}

_id_4D52()
{
    var_0 = [];
    var_1 = getspawnerarray();
    var_2 = getaiarray();

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_79EE ) && var_4._id_79EE != "none" )
        {
            var_5 = _id_6160( var_4._id_79EE );
            var_0[var_0.size] = var_5;
        }
    }

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8._id_79EE ) && var_8._id_79EE != "none" )
        {
            var_5 = _id_6160( var_8._id_79EE );
            var_0[var_0.size] = var_5;
        }
    }

    level._id_79EF = var_0;
}

_id_6160( var_0 )
{
    var_1 = strtok( var_0, " " );

    if ( var_1.size > 1 )
        var_0 = var_1[1];

    return var_0;
}

_id_737D( var_0 )
{
    foreach ( var_2 in level._id_79EF )
    {
        foreach ( var_4 in level._id_6048[var_0] )
        {
            if ( var_2 == var_4 )
                _id_736E( var_0, var_4 );
        }
    }
}

_id_7127( var_0 )
{
    var_1 = level._id_6048[var_0].size;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = randomint( var_1 );
        var_4 = level._id_6048[var_0][var_2];
        level._id_6048[var_0][var_2] = level._id_6048[var_0][var_3];
        level._id_6048[var_0][var_3] = var_4;
    }
}

_id_3DE2( var_0 )
{
    if ( isdefined( self.team ) && self.team == "neutral" )
        return;

    if ( isdefined( self._id_79EE ) )
    {
        if ( self._id_79EE == "none" )
            return;

        self.nearz = self._id_79EE;
        _id_40AB( self.nearz );
        self notify( "set name and rank" );
        return;
    }

    _id_3DE3( self._id_9F32 );
    self notify( "set name and rank" );
}

validate_nationality( var_0 )
{
    switch ( var_0 )
    {
        case "american":
        case "british":
        case "arab":
        case "russian":
            return;
    }
}

_id_3DE3( var_0 )
{
    validate_nationality( var_0 );
    level._id_6045[var_0] = ( level._id_6045[var_0] + 1 ) % level._id_6048[var_0].size;
    var_1 = level._id_6048[var_0][level._id_6045[var_0]];
    var_2 = randomint( 10 );

    if ( var_2 > 5 )
    {
        var_3 = "Pvt. " + var_1;
        self._id_0992 = "private";
    }
    else if ( var_2 > 2 )
    {
        var_3 = "Cpl. " + var_1;
        self._id_0992 = "private";
    }
    else
    {
        var_3 = "Sgt. " + var_1;
        self._id_0992 = "sergeant";
    }

    if ( isai( self ) && self _meth_813f() )
        self._id_0986 = var_3;
    else
        self.nearz = var_3;
}

_id_40AB( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_0992 = "private";

    var_1 = strtok( var_0, " " );
    var_2 = var_1[0];

    switch ( var_2 )
    {
        case "Pvt.":
            self._id_0992 = "private";
            break;
        case "Pfc.":
            self._id_0992 = "private";
            break;
        case "Agent":
            self._id_0992 = "private";
            break;
        case "Cpl.":
            self._id_0992 = "private";
            break;
        case "Sgt.":
            self._id_0992 = "sergeant";
            break;
        case "Lt.":
            self._id_0992 = "lieutenant";
            break;
        case "Cpt.":
            self._id_0992 = "captain";
            break;
        default:
            self._id_0992 = "private";
            break;
    }
}

_id_6067( var_0 )
{
    switch ( var_0 )
    {
        case "delta":
        case "seal":
        case "taskforce":
        case "czech":
        case "xslice":
        case "atlas":
        case "sentinel":
            return 1;
    }

    return 0;
}

_id_6068( var_0 )
{
    return isdefined( level._id_6048[var_0 + "_surnames"] );
}
