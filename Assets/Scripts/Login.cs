using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;


public class Login : MonoBehaviour
{
    public InputField inputName;


    void Start()
    {
        EventMgr.Inst.AttachEvent(EventDef.NetConnectSuccess, HandleEvent);

        Net.Inst.AddEventHandler(Msg.P_ACK_ROLE_LOGIN_OK, OnNetHandler);
    }

    void OnDestroy()
    {
        EventMgr.Inst.DetachEvent(EventDef.NetConnectSuccess, HandleEvent);

        Net.Inst.DelEventHandler(Msg.P_ACK_ROLE_LOGIN_OK, OnNetHandler);
    }


    public void OnBtnLogin()
    {
        if (inputName.text != "")
        {
            Net.Inst.Connect("127.0.0.1", 8888);
        }
    }


    public void HandleEvent(EventDef id, object data)
    {
        //Debug.Log("AppMgr HandleEvent id: " + id);

        switch (id)
        {
            case EventDef.NetConnectSuccess:
                ReqRoleLogin roleLogin = new ReqRoleLogin();
                roleLogin.uname = inputName.text;

                Net.Inst.Send(roleLogin.Encode());
                break;
        }
    }

    public void OnNetHandler(ushort packetId, System.Object obj)
    {
        //Log.Error("AppMgr OnNetHandler packetId:" + packetId);
        if (packetId == Msg.P_ACK_ROLE_LOGIN_OK)
        {
            AckRoleLoginOk roleLoginOk = obj as AckRoleLoginOk;
            PlayerData.uname = roleLoginOk.uname;
            PlayerData.pos_x = roleLoginOk.pos_x;
            PlayerData.pos_y = roleLoginOk.pos_y;
            PlayerData.pos_z = roleLoginOk.pos_z;

            SceneManager.LoadScene("Main");
        }
    }
}
