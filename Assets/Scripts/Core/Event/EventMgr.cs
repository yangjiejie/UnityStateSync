using UnityEngine;
using System.Collections.Generic;


public class EventMgr : MonoBehaviour
{
    #region 初始化
    private static EventMgr mInst;
    public static EventMgr Inst
    {
        get { return mInst; }
    }

    //事件列表
    public Queue<KeyValuePair<EventDef, object>> _event_queue;
    void Awake()
    {
        mInst = this;

        this._event_queue = new Queue<KeyValuePair<EventDef, object>>();
    }

    /// <summary>
    /// 处理事件
    /// </summary>
    void Update()
    {
        lock (this._event_queue)
        {
            while (this._event_queue.Count > 0)
            {
                KeyValuePair<EventDef, object> kv = this._event_queue.Dequeue();
                EventDef key = kv.Key;
                
                if (m_dicEvents.ContainsKey(key))
                {
                    CommonEvent eventHandler = m_dicEvents[key];
                    if (eventHandler != null)
                    {
                        eventHandler(key, kv.Value);
                    }
                }
                else
                {
                    Log.Error("没有这个定义的事件:" + key);
                }
            }
        }
    }
    #endregion


    //公共委托事件
    public delegate void CommonEvent(EventDef eventDef, object data);

    //事件回调列表
    public Dictionary<EventDef, CommonEvent> m_dicEvents = new Dictionary<EventDef, CommonEvent>();


    /// <summary>
    /// 发送事件
    /// </summary>
    public void SendEvent(EventDef key, object param = null)
    {
        lock (this._event_queue)
        {
            this._event_queue.Enqueue(new KeyValuePair<EventDef, object>(key, param));
        }
    }

    /// <summary>
    /// 事件绑定
    /// </summary>
    public void AttachEvent(EventDef eventKey, CommonEvent attachEvent)
    {
        if (m_dicEvents.ContainsKey(eventKey))
        {
            m_dicEvents[eventKey] += attachEvent;
        }
        else
        {
            m_dicEvents.Add(eventKey, attachEvent);
        }
    }

    /// <summary>
    /// 事件解除
    /// </summary>
    public void DetachEvent(EventDef eventKey, CommonEvent attachEvent)
    {
        if (m_dicEvents.ContainsKey(eventKey))
        {
            m_dicEvents[eventKey] -= attachEvent;
        }
        else
        {
            Log.Error("没有这个定义的事件:" + eventKey);
        }
    }
}
