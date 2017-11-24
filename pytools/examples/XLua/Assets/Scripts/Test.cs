using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Test : MonoBehaviour
{
    [XLua.CSharpCallLua]
    public delegate double LuaMax(double a, double b);


	// Use this for initialization
	void Start()
    {
        XLua.LuaEnv luaenv = new XLua.LuaEnv();
        luaenv.DoString(@"
            CS.UnityEngine.Debug.Log('hello world')
            require 'socket'
            require 'pack'
            CS.UnityEngine.Debug.Log('哈哈')
            print(tonumber('40050.0'));
        ");

        var max = luaenv.Global.GetInPath<LuaMax>("math.max");
        Debug.Log("max:" + max(32, 12).ToString());
        max = null;

        luaenv.Dispose();
	}
	
	// Update is called once per frame
	void Update()
    {
		
	}
}
