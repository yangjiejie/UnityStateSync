using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerMoveSync : MonoBehaviour
{
    private Animator anim;


    void Start()
    {
        anim = this.GetComponent<Animator>();
    }


    public void SetPositionAndRotation(MsgScenePosRot posRot)
    {
        transform.position = new Vector3(posRot.pos_x, posRot.pos_y, posRot.pos_x);
        transform.eulerAngles = new Vector3(posRot.rot_x, posRot.rot_y, posRot.rot_z); ;
    }

    public void SetAnim(byte isMove)
    {
        anim.SetBool("Move", isMove == 1 ? true : false);
    }
}
