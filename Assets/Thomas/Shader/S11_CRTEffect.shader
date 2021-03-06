﻿Shader "8ninths/S11_CRTEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_MaskTex("Mask Texture", 2D) = "white"{}
		_maskBlend("Mask blending", Float) = 0.5
		_maskSize("Mask Size", Float) = 1
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			sampler2D _MaskTex;
			fixed _maskBlend;
			fixed _maskSize;
			
			fixed4 frag (v2f_img i) : COLOR
			{
				fixed4 mask = tex2D(_MaskTex, i.uv * _maskSize);
				fixed4 base = tex2D(_MainTex, i.uv);
				return lerp(base, mask, _maskBlend);
			}
			ENDCG
		}
	}
}
