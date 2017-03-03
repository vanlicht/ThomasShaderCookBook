Shader "8ninths/S05_SimpleLambert" 
{
	Properties
	{
		_MainColor("Main Color", Color) = (1.0,1.0,1.0,1.0)
		_MainTex("Base (RGB)", 2D) = "white" {}

	}
	SubShader{
	Tags{ "RenderType" = "Opaque" }
	LOD 200

	CGPROGRAM
	#pragma surface surf SimpleLambert

	sampler2D _MainTex;
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

	half4 LightingSimpleLambert(SurfaceOutput s, half3 lightDir, half atten) 
	{
		half NdotL = saturate(dot(s.Normal, lightDir));
		half4 c;
		c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten * 1);
		c.a = s.Alpha;
		return c;
	}
	ENDCG
	}
		FallBack "Diffuse"
}