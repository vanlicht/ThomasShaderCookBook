using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class tBound : MonoBehaviour
{
    // First find a center for your bounds.
    Bounds combinedBounds;
    Renderer[] renderers;

    void Start()
    {
        //Vector3 center = Vector3.zero;
        //Bounds bounds = new Bounds(center, Vector2.zero);

        //foreach (Renderer childR in this.GetComponentsInChildren<Renderer>())
        //{
        //    bounds.Encapsulate(childR.bounds);
        //    center += childR.bounds.center;
        //}
        //center /= this.transform.childCount;
        //foreach (Renderer childR in this.GetComponentsInChildren<Renderer>())
        //{
        //    bounds.Encapsulate(childR.bounds);
        //}
        /////////////////////
        renderers = this.GetComponentsInChildren<Renderer>();
    }

    void Update()
    {
        var renderers = this.GetComponentsInChildren<Renderer>();

        if (renderers.Length == 0)
        {
            return;
        }

        combinedBounds = renderers[0].bounds;
        foreach (Renderer renderer in renderers)
        {
            combinedBounds.Encapsulate(renderer.bounds);
            //combinedBounds.center += new Vector3(combinedBounds.extents.x, combinedBounds.extents.y, combinedBounds.extents.z);
            combinedBounds.center = renderer.bounds.center;
        }
        combinedBounds.center = this.transform.position;

        //bounds.center = this.transform.position;
        //Debug.Log(combinedBounds.size.ToString("F4"));
        //Debug.Log(combinedBounds.center.ToString("F4"));
    }
}
