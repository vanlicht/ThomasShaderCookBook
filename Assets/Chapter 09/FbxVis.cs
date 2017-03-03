using UnityEngine;
using System.Collections;

public class FbxVis : MonoBehaviour
{
    [SerializeField]
    GameObject VisDriver;
    [SerializeField]
    GameObject visObj01;
    [SerializeField]
    GameObject visObj02;
    [SerializeField]
    GameObject visObj03;
    [SerializeField]
    GameObject[] GlowArray;

    // Update is called once per frame
    void Update()
    {
        if (VisDriver.transform.position.x < -0.5)
        {
            visObj01.SetActive(true);
        }
        else
        {
            visObj01.SetActive(false);
        }
        if (VisDriver.transform.position.y> 0.5)
        {
            visObj02.SetActive(true);
        }
        else
        {
            visObj02.SetActive(false);
        }
        if (VisDriver.transform.position.z > 0.5)
        {
            visObj03.SetActive(true);
        }
        else
        {
            visObj03.SetActive(false);
        }
    }
}
