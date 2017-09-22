using UnityEngine;
using System.Collections;


public class Log
{ 
    public delegate void LogFunc(object obj);


    public static LogFunc Error = UnityEngine.Debug.LogError;

#if UNITY_EDITOR
    public static LogFunc Debug = UnityEngine.Debug.Log;
    public static LogFunc Warning = UnityEngine.Debug.LogWarning;
#else
    public static void Debug(object obj) { }

    public static void Warning(object obj) { }
#endif
}
