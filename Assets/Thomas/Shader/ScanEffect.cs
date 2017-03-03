using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScanEffect : MonoBehaviour
{
    public Material material;
    public float minY = 0;
    public float maxY = 1;
    public float duration = 5;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
        //float y = Mathf.Lerp(minY, maxY, Time.time / duration);
        float y = Mathf.Abs(Mathf.Sin(Time.time *0.50f));
        material.SetFloat("_ConstructY", y);
	}
}
