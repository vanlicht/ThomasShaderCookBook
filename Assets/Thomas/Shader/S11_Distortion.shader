Shader "8ninths/S11_Distortion"
{
	Properties
	{
		_MainTex("Main Texture", 2D) = "white" {}
		_DisplacementTex ("Displacement Texture", 2D) = "white"{}
		_Strength("Distortion Strength", Range(0,5)) = 0.1
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
			sampler2D _DisplacementTex;
			fixed _Strength;

			fixed4 frag(v2f_img i) : COLOR
			{
				half2 n = tex2D(_DisplacementTex, i.uv);
				half2 d = n * 2 - 1;
				i.uv += d * _Strength;
				i.uv = saturate(i.uv);

				float4 c = tex2D(_MainTex, i.uv);
				return c;
			}
			ENDCG
		}
	}
}
