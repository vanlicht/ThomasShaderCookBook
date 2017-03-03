using UnityEngine;
using System.Collections;

public class tObjBoundsShaderDissolve : MonoBehaviour
{

    public GameObject TrackingObject;
    public Material tMat;
    Vector3 trackPos;
    Vector4 trackV4;

    //For Renderer Bounds
    Bounds combinedBounds;
    Renderer[] renderers;

    Vector3 centerPos; //centerPos is only to query center of the combined bounds, it's not effective for combine bounds

    // Use this for initialization
    void Start()
    {
        //Query renderers in children, for bounds
        //This assums that the parent object is only empty game object
        renderers = this.GetComponentsInChildren<Renderer>();

        //centerPos
        centerPos = Vector3.zero;
    }

    // Update is called once per frame
    void Update()
    {
        trackPos = TrackingObject.transform.position;
        trackV4 = new Vector4(trackPos.x, trackPos.y, trackPos.z, 0f);
        //Debug.Log(trackV4);
        tMat.SetVector("_SF_Input", trackV4);


        //___For Bounds___
        var renderers = this.GetComponentsInChildren<Renderer>();
        if (renderers.Length == 0)
        {
            return;
        }

        combinedBounds = renderers[0].bounds;
        centerPos = Vector3.zero;

        //foreach (Renderer renderer in renderers)
        //for (int i = 1; i < renderers.Length; i++)
        //{
        //    combinedBounds.Encapsulate(renderer.bounds);

        //    combinedBounds.center = renderer.bounds.center;

        //    //combinedBounds.center += new Vector3(combinedBounds.extents.x, combinedBounds.extents.y, combinedBounds.extents.z);
        //    centerPos += combinedBounds.center;
        //}
        for (int i = 0; i< renderers.Length; i++)
        {
            centerPos += combinedBounds.center;
            combinedBounds.Encapsulate(renderers[i].bounds);           
            combinedBounds.center = renderers[i].bounds.center;

            //combinedBounds.center += new Vector3(combinedBounds.extents.x, combinedBounds.extents.y, combinedBounds.extents.z);
            
        }
        centerPos = (centerPos/renderers.Length)/2.0f;

        //combinedBounds.center = this.transform.position;
        //bounds.center = this.transform.position;
        Debug.Log(combinedBounds.size.ToString("F4"));
        Debug.Log(centerPos.ToString("F4"));
        //Debug.Log(combinedBounds.max.ToString("F4"));
        //Debug.Log(combinedBounds.center.ToString("F4"));
    }
}
