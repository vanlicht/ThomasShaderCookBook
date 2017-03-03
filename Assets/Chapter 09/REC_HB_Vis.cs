using UnityEngine;
using System.Collections;

public class REC_HB_Vis : MonoBehaviour {

    [SerializeField]
    GameObject[] VisJoints;
    [SerializeField]
    GameObject[] TargetObjects;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update ()
    {
	    for(int i = 0; i < VisJoints.Length; i++)
        {
            if(VisJoints[i].transform.localScale.x < 0.5)
            {
                TargetObjects[i].SetActive(false);
            }
            else
            {
                TargetObjects[i].SetActive(true);
            }
            
        }
	}
}
