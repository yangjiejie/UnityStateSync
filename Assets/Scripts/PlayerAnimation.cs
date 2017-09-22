using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerAnimation : MonoBehaviour
{
    private Animator anim;


    void Awake()
    {
        anim = this.GetComponent<Animator>();
    }

    void Update()
    {
        anim.SetBool("Move", GetComponent<Rigidbody>().velocity.magnitude > 0.5f);
    }
}
