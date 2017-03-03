Shader "CookBook/tch10_01" {
	Properties {
		_MainTex("Base (RGB)", 2D) = "white" {}
		_MyColor("My color", Color) = (1,1,1,1)
		_DeSatValue("Desaturate", Range(0,1)) = 0.5
	}
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#include "MyCGInclude.cginc"
		#pragma surface surf HalfLambert
		#pragma target 3.0

		sampler2D _MainTex;
		fixed _DeSatValue;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D(_MainTex, IN.uv_MainTex);
			c.rgb = lerp(c.rgb, Luminance(c.rgb), _DeSatValue);

			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
