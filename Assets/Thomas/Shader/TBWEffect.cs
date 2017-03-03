using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TBWEffect : MonoBehaviour
{
    [Range(0,1)]
    public float intensity;
    private Material material;

    // Use this for initialization
    void Awake()
    {
        material = new Material(Shader.Find("Hidden/S10_BWScreen"));
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (intensity == 0)
        {
            Graphics.Blit(source, destination);
            return;
        }

        material.SetFloat("_bwBlend", intensity);
        Graphics.Blit(source, destination, material);

    }
}
