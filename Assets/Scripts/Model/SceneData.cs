using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class ScenePlayer
{
    public uint uid;
    public string uname;

    public float pos_x;
    public float pos_y;
    public float pos_z;
    public float rot_x;
    public float rot_y;
    public float rot_z;

    public PlayerMoveSync moveSync;
    public PlayerAnimationSync animSync;
}

public class SceneData
{
    public static Dictionary<uint, ScenePlayer> scenePlayers = new Dictionary<uint, ScenePlayer>();

    public static void AddPlayer(MsgScenePlayer msgScenePlayer, GameObject go)
    {
        if (scenePlayers.ContainsKey(msgScenePlayer.uid))
        {
            scenePlayers.Remove(msgScenePlayer.uid);
        }
        ScenePlayer scenePlayer = new ScenePlayer();
        scenePlayer.uid = msgScenePlayer.uid;
        scenePlayer.uname = msgScenePlayer.uname;
        scenePlayer.pos_x = msgScenePlayer.scene_pos_rot.pos_x;
        scenePlayer.pos_y = msgScenePlayer.scene_pos_rot.pos_y;
        scenePlayer.pos_z = msgScenePlayer.scene_pos_rot.pos_z;
        scenePlayer.rot_x = msgScenePlayer.scene_pos_rot.rot_x;
        scenePlayer.rot_y = msgScenePlayer.scene_pos_rot.rot_y;
        scenePlayer.rot_z = msgScenePlayer.scene_pos_rot.rot_z;

        scenePlayer.moveSync = go.GetComponent<PlayerMoveSync>();
        GameObject.Destroy(go.GetComponent<PlayerMove>());

        scenePlayer.animSync = go.GetComponent<PlayerAnimationSync>();
        GameObject.Destroy(go.GetComponent<PlayerAnimation>());

        scenePlayers.Add(scenePlayer.uid, scenePlayer);
    }

    public static ScenePlayer GetPlayer(uint uid)
    {
        if (scenePlayers.ContainsKey(uid))
        {
            return scenePlayers[uid];
        }
        return null;
    }

    public static void DelPlayer(uint uid)
    {
        if (scenePlayers.ContainsKey(uid))
        {
            ScenePlayer scenePlayer = scenePlayers[uid];
            scenePlayers.Remove(uid);
            GameObject.Destroy(scenePlayer.moveSync.gameObject);
        }
    }
}
