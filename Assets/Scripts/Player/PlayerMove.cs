using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerMove : MonoBehaviour
{
    public float velocity = 20;

    private Vector3 lastPosition;
    private Vector3 lastEulerAngles;

    private Animator anim;
    private bool isMove = false;


    void Start()
    {
        lastPosition = transform.position;
        lastEulerAngles = transform.eulerAngles;

        anim = this.GetComponent<Animator>();

        isMove = anim.GetBool("Move");

        InvokeRepeating("SyncPositionAndRotation", 0, 1f / 30);
        InvokeRepeating("SyncMoveAnimation", 0, 1f / 30);
    }

    void Update()
    {
        float h = Input.GetAxis("Horizontal");
        float v = Input.GetAxis("Vertical");

        Vector3 vel = this.GetComponent<Rigidbody>().velocity;
        if (Mathf.Abs(h) > 0.05f || Mathf.Abs(v) > 0.05f)
        {
            this.GetComponent<Rigidbody>().velocity = new Vector3(-h * velocity, vel.y, -v * velocity);
            this.transform.rotation = Quaternion.LookRotation(new Vector3(-h, 0, -v));
            anim.SetBool("Move", true);
        }
        else
        {
            anim.SetBool("Move", false);
            this.GetComponent<Rigidbody>().velocity = new Vector3(0, vel.y, 0);
        }
    }


    //同步当前角色的位置和旋转 发起请求的
    void SyncPositionAndRotation()
    {
        Vector3 position = transform.position;
        Vector3 eulerAngles = transform.eulerAngles;
        if (position.x != lastPosition.x || position.y != lastPosition.y || position.z != lastPosition.z ||
            eulerAngles.x != lastEulerAngles.x || eulerAngles.y != lastEulerAngles.y ||
            eulerAngles.z != lastEulerAngles.z)
        {
            lastPosition = position;
            lastEulerAngles = eulerAngles;

            ReqScenePosRot posRot = new ReqScenePosRot();
            posRot.posrot = new MsgScenePosRot();
            posRot.posrot.pos_x = position.x;
            posRot.posrot.pos_y = position.y;
            posRot.posrot.pos_z = position.z;
            posRot.posrot.rot_x = eulerAngles.x;
            posRot.posrot.rot_y = eulerAngles.y;
            posRot.posrot.rot_z = eulerAngles.z;
            Net.Inst.Send(posRot.Encode());
        }
    }

    //同步移动的动画
    void SyncMoveAnimation()
    {
        if (isMove != anim.GetBool("Move"))//当前动画状态发生了改变 需要同步
        {
            isMove = anim.GetBool("Move");

            ReqSceneAnimMove aniMove = new ReqSceneAnimMove();
            aniMove.is_move = (byte)(anim.GetBool("Move") ? 1 : 0);
            Net.Inst.Send(aniMove.Encode());
        }
    }
}
