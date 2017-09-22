using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerMove : MonoBehaviour
{
    public float velocity = 20;


    void Update()
    {
        float h = Input.GetAxis("Horizontal");
        float v = Input.GetAxis("Vertical");

        Vector3 vel = this.GetComponent<Rigidbody>().velocity;
        if (Mathf.Abs(h) > 0.05f || Mathf.Abs(v) > 0.05f)
        {
            this.GetComponent<Rigidbody>().velocity = new Vector3(-h * velocity, vel.y, -v * velocity);
            this.transform.rotation = Quaternion.LookRotation(new Vector3(-h, 0, -v));
        }
    }
}
