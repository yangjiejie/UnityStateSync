using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class FollowTarget : MonoBehaviour
{
    public float moveSmooth = 5f;

    private Transform target;
    private Vector3 offset;


	void Start()
    {
        target = PlayerData.player.transform.Find("Bip01");
        offset = transform.position - target.position;
	}

	void FixedUpdate()
    {
        Vector3 targetPosition = offset + target.position;
        transform.position = Vector3.Lerp(transform.position, targetPosition, moveSmooth * Time.deltaTime);
	}
}
