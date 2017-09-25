using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerAnimation : MonoBehaviour
{
    private Animator anim;


	void Start()
    {
        anim = this.GetComponent<Animator>();
	}
	

	void Update()
    {
        if (Input.GetKeyDown(KeyCode.J))
        {
            DoAnim(1);
        }
        else if (Input.GetKeyDown(KeyCode.K))
        {
            DoAnim(2);
        }
        else if (Input.GetKeyDown(KeyCode.L))
        {
            DoAnim(3);
        }

        if (Input.GetKeyUp(KeyCode.J))
        {
            UndoAnim(1);
        }
        else if (Input.GetKeyUp(KeyCode.K))
        {
            UndoAnim(2);
        }
        else if (Input.GetKeyUp(KeyCode.L))
        {
            UndoAnim(3);
        }
	}


    private void DoAnim(int skillId)
    {
        anim.SetBool("Skill" + skillId, true);

        ReqSceneAnim pbAnim = new ReqSceneAnim();
        switch (skillId)
        { 
            case 1:
                pbAnim.skill1 = 1;
                break;
            case 2:
                pbAnim.skill2 = 1;
                break;
            case 3:
                pbAnim.skill3 = 1;
                break;
        }
        Net.Inst.Send(pbAnim.Encode());
    }

    private void UndoAnim(int skillId)
    {
        anim.SetBool("Skill" + skillId, false);

        ReqSceneAnim pbAnim = new ReqSceneAnim();
        switch (skillId)
        {
            case 1:
                pbAnim.skill1 = 0;
                break;
            case 2:
                pbAnim.skill2 = 0;
                break;
            case 3:
                pbAnim.skill3 = 0;
                break;
        }
        Net.Inst.Send(pbAnim.Encode());
    }
}
