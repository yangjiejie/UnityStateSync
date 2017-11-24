using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;


[LuaCallCSharp]
public class LuaCallCs
{
    public static string GetLuaPath()
    {
        return Application.dataPath + "/../lua/";
    }
}
