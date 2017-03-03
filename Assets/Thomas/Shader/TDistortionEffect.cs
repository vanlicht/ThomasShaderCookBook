using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TDistortionEffect : MonoBehaviour
{
    public Material material;
    public float strength;

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        material.SetFloat("_Strength", strength);
        Graphics.Blit(source, destination, material);
    }
}
