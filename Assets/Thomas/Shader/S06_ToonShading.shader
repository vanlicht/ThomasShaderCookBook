Shader "8ninths/S06_ToonShading" 
{
	Properties
	{
		_MainColor("Main Color", Color) = (1.0,1.0,1.0,1.0)
		_MainTex("Base (RGB)", 2D) = "white" {}
		_RampTex("Ramp Texture", 2D) = "white" {}
	}
	SubShader{
	Tags{ "RenderType" = "Opaque" }
	LOD 200

	CGPROGRAM
	#pragma surface surf Toon

	sampler2D _MainTex;
	sampler2D _RampTex;
	float4 _MainColor;

	struct Input 
	{
		float2 uv_MainTex;
	};

	void surf(Input IN, inout SurfaceOutput o)
	{
		half4 c = tex2D(_MainTex, IN.uv_MainTex);
		o.Albedo = c.rgb * _MainColor;
		o.Alpha = 1;
	}

	fixed4 LightingToon(SurfaceOutput s, fixed3 lightDir, fixed atten) 
	{
		half NdotL = dot(s.Normal, lightDir);
		NdotL = saturate(NdotL);
		NdotL = tex2D(_RampTex, fixed2(NdotL, 0.1));

		fixed4 c;
		c.rgb = s.Albedo * _LightColor0.rgb * NdotL * atten * 1;
		c.a = s.Alpha;
		return c;
	}
	ENDCG
	}
		FallBack "Diffuse"
}