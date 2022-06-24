# H1 GSC Dump
cod h1 (MW:R) gsc dump w/ personal comments and additions
## resources
- [my gsc-tool fork for h1](https://github.com/mjkzy/gsc-tool-h1/tree/h1-symbols)
- [iw6 dev gsc dump](https://github.com/mjkzy/iw6-gsc-dump) (provides comments, functions, methods, variable, etc.)
## todo
- xensik says he's going to possibly rework the decompiler to properly decompile all scripts. at the moment, a `invalid vector subscript` error occurs. you can still refer to `./disassembled/` and read the GSC asm, which does disassemble just fine.
- does not include SP
## incorrect/missing symbols on h1-mod
This GSC dump may contain symbols that H1-mod does not have named. Navigating to https://github.com/h1-mod/h1-mod/blob/develop/src/client/game/scripting/function_tables.cpp and<br/>
finding the function_map, method_map, & token_map maps will help you. CTRL + F (Find) and search your desired value (ex: `isplayer`) and see if it exists.<br/>

If H1-mod doesn't have the specific symbol you need named, then you'll need to use the `_ID` prefix.<br/>

(Reference for below information: https://github.com/mjkzy/gsc-tool/blob/97abc4f5b1814d64f06fd48d118876106e8a3a39/src/h1/xsk/resolver.cpp#L877)<br/>

For example, if H1-mod theroetically didn't have this symbol, then you'll refer to the '0x1ad' part. This is the hexdecimal key of the value `isplayer`. So, if `isplayer` wasn't defined with a proper name in H1-mod's function/method table, you would call this function as `game:_id_1AD(player)` or `game:_ID1AD(player)`<br/>

Once again, you may need to do this even though it's named in this GSC dump but not in H1-Mod. This dump just names stuff so you know what you're looking at. I'll try to update the function/method tables as much but I doubt I will.<br/>
