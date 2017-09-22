using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Main : MonoBehaviour
{
    void Awake()
    {
        //这两个要在最前面且顺序不能乱
        this.gameObject.AddComponent<EventMgr>();
        this.gameObject.AddComponent<Net>();

        DontDestroyOnLoad(this.gameObject);
    }
}
