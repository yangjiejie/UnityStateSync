using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class FollowTarget : MonoBehaviour
{
    public Transform target;
    public float moveSmooth = 5f;

    private Vector3 offset;


	void Start()
    {
        offset = transform.position - target.position;
	}

	void FixedUpdate()
    {
        Vector3 targetPosition = offset + target.position;
        transform.position = Vector3.Lerp(transform.position, targetPosition, moveSmooth * Time.deltaTime);
	}
}
