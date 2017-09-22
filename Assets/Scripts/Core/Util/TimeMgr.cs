using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class TimeMgr : MonoBehaviour 
{
    public delegate void Interval();
    private Dictionary<Interval, float> mDicinterval = new Dictionary<Interval, float>();


    private static TimeMgr mInst;
    public static TimeMgr Inst
    {
        get
        {
            return mInst;
        }
    }


    // Awake is called when the script instance is being loaded.
    void Awake()
    {
        mInst = this;
    }

    void Update()
    {
        if (mDicinterval.Count > 0)
        {
            List<Interval> remove = new List<Interval>();
            foreach (KeyValuePair<Interval, float> KeyValue in mDicinterval)
            {
                if (KeyValue.Value <= Time.time)
                {
                    remove.Add(KeyValue.Key);
                }
            }

            for (int i = 0; i < remove.Count; i++)
            {
                remove[i]();
                mDicinterval.Remove(remove[i]);
            }
        }

    }


    public void AddInterval(Interval interval, float time)
    {
        if (null != interval)
        {
            mDicinterval[interval] = Time.time + time;
        }
    }

    public void RemoveInterval(Interval interval)
    {
         if (null != interval)
         {
             if (mDicinterval.ContainsKey(interval))
             {
                 mDicinterval.Remove(interval);
             }
         }
    }
}
