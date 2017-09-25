using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAnimationSync : MonoBehaviour
{
    private Animator anim;


    void Start()
    {
        anim = this.GetComponent<Animator>();
    }


    public void SetAnim(AckSceneAnimOk animOk)
    {
        anim.SetBool("Skill1", animOk.skill1 == 1);
        anim.SetBool("Skill2", animOk.skill2 == 1);
        anim.SetBool("Skill3", animOk.skill3 == 1);
    }
}
