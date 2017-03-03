Shader "8ninths/CTScan01" 
{
	Properties 
	{
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
		_ConstructY("Construct Y", Float) = 0.0
		_ConstructGap("Construct Gap", Float) = 0.0
		_ConstructColor("Constructor Color", Color) = (1,1,1,1)
			
	}
	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		Cull Off
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Custom fullforwardshadows
		#pragma target 3.0
		#include "UnityPBSLighting.cginc"

		sampler2D _MainTex;
		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
		float _ConstructY;
		fixed4 _ConstructColor;
		float _ConstructGap;
		
		struct Input 
		{
			float2 uv_MainTex;
			float3 worldPos;
			float3 viewDir;
		};
		int building = 0;
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			//float s = +sin((IN.worldPos.x * IN.worldPos.z) * 60 + _Time[3] + o.Normal) / 120;
			float s = sin((IN.worldPos.x * IN.worldPos.z)*5+ _Time[2] + o.Normal) / 120;
			if (IN.worldPos.y < _ConstructY)
			{
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = c.rgb;
				o.Alpha = c.a;
				building = 0;
			}
			else
			{
				o.Albedo = _ConstructColor.rgb * 3;
				o.Alpha = _ConstructColor.a;
				building = 1;
			}
			if (IN.worldPos.y > _ConstructY + s + _ConstructGap)
			{
				discard;
			}

			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
		}
		inline half4 LightingCustom(SurfaceOutputStandard s, half3 viewDir, UnityGI gi)
		{
			if (building) 
			{
				return _ConstructColor;
			}
			/*if (dot(s.Normal, viewDir)<=0) 
			{
				return _ConstructColor;
			}*/
			return LightingStandard(s, viewDir, gi);
		}

		inline void LightingCustom_GI(SurfaceOutputStandard s, UnityGIInput data, inout UnityGI gi)
		{
			LightingStandard_GI(s, data, gi);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
