// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

init()
{
    level.drone_anims["neutral"]["stand"]["idle"] = %casual_stand_idle;
    level.drone_anims["neutral"]["stand"]["run"] = %unarmed_scared_run;
    level.drone_anims["neutral"]["stand"]["death"] = %exposed_death;
    level.attachpropsfunction = animscripts\civilian\civilian_init::attachprops;
    maps\_drone::initglobals();
}
