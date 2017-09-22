using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class SceneMgr : MonoBehaviour
{
    private GameObject playerPrefab;
    void Awake()
    {
        playerPrefab = Resources.Load<GameObject>("PlayerBoy");

        GameObject player = Instantiate(
            playerPrefab, 
            new Vector3(PlayerData.pos_x, PlayerData.pos_y, PlayerData.pos_z), 
            Quaternion.identity);
        PlayerData.player = player;
        Destroy(player.GetComponent<PlayerMoveSync>());


        Net.Inst.AddEventHandler(Msg.P_ACK_SCENE_PLAYERS, OnNetHandler);
        Net.Inst.AddEventHandler(Msg.P_ACK_SCENE_ENTER, OnNetHandler);
        Net.Inst.AddEventHandler(Msg.P_ACK_SCENE_EXIT, OnNetHandler);
        Net.Inst.AddEventHandler(Msg.P_ACK_SCENE_POS_ROT_OK, OnNetHandler);
        Net.Inst.AddEventHandler(Msg.P_ACK_SCENE_ANIM_MOVE_OK, OnNetHandler);
    }

    void Start()
    {
        ReqSceneReqPlayers reqPlayers = new ReqSceneReqPlayers();
        Net.Inst.Send(reqPlayers.Encode());
    }

    void OnDestroy()
    {
        Net.Inst.DelEventHandler(Msg.P_ACK_SCENE_PLAYERS, OnNetHandler);
        Net.Inst.DelEventHandler(Msg.P_ACK_SCENE_ENTER, OnNetHandler);
        Net.Inst.DelEventHandler(Msg.P_ACK_SCENE_EXIT, OnNetHandler);
        Net.Inst.DelEventHandler(Msg.P_ACK_SCENE_POS_ROT_OK, OnNetHandler);
        Net.Inst.DelEventHandler(Msg.P_ACK_SCENE_ANIM_MOVE_OK, OnNetHandler);
    }


    public void OnNetHandler(ushort packetId, System.Object obj)
    {
        Log.Error("SceneMgr OnNetHandler packetId:" + packetId);
        if (packetId == Msg.P_ACK_SCENE_PLAYERS)
        {
            AckScenePlayers scenePlayers = obj as AckScenePlayers;
            foreach (MsgScenePlayer msgPlayer in scenePlayers.players)
            {
                SceneAddPlayer(msgPlayer);
            }
        }
        else if (packetId == Msg.P_ACK_SCENE_ENTER)
        {
            AckSceneEnter sceneEnter = obj as AckSceneEnter;
            MsgScenePlayer msgPlayer = sceneEnter.player;

            SceneAddPlayer(msgPlayer);
        }
        else if (packetId == Msg.P_ACK_SCENE_EXIT)
        {
            AckSceneExit sceneExit = obj as AckSceneExit;
            SceneData.DelPlayer(sceneExit.uid);
        }
        else if (packetId == Msg.P_ACK_SCENE_POS_ROT_OK)
        {
            AckScenePosRotOk posRotOk = obj as AckScenePosRotOk;
            ScenePlayer scenePlayer = SceneData.GetPlayer(posRotOk.uid);
            if (scenePlayer != null)
            {
                scenePlayer.moveSync.SetPositionAndRotation(posRotOk.posrot);
            }
            else
            {
                Debug.Log("P_ACK_SCENE_POS_ROT_OK no player");
            }
        }
        else if (packetId == Msg.P_ACK_SCENE_ANIM_MOVE_OK)
        {
            AckSceneAnimMoveOk animMoveOk = obj as AckSceneAnimMoveOk;
            ScenePlayer scenePlayer = SceneData.GetPlayer(animMoveOk.uid);
            if (scenePlayer != null)
            {
                scenePlayer.moveSync.SetAnim(animMoveOk.is_move);
            }
            else
            {
                Debug.Log("P_ACK_SCENE_ANIM_MOVE_OK no player");
            }
        }
    }


    private void SceneAddPlayer(MsgScenePlayer msgPlayer)
    {
        MsgScenePosRot posRot = msgPlayer.scene_pos_rot;

        GameObject player = Instantiate(
        playerPrefab,
        new Vector3(posRot.pos_x, posRot.pos_y, posRot.pos_z),
        Quaternion.identity);
        player.transform.eulerAngles = new Vector3(posRot.rot_x, posRot.rot_y, posRot.rot_z);

        SceneData.AddPlayer(msgPlayer, player);
    }
}
