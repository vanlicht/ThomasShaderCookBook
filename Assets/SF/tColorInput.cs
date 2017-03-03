using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class tColorInput : MonoBehaviour
{
    public GameObject TrackingObject;
    public Material tMat;
    Vector3 trackPos;
    Vector4 trackV4;

    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update ()
    {
        trackPos = TrackingObject.transform.position;
        trackV4 = new Vector4(trackPos.x, trackPos.y, trackPos.z, 0f);
        //Debug.Log(trackV4);
        tMat.SetVector("_SF_Input", trackV4);
    }
}
