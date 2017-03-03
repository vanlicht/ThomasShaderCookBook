Shader "8ninths/S03_NormalExtrusion" 
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Main Texture", 2D) = "White"{}
		_Amount("Amount", Range(-1,1)) = 0
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		#pragma target 3.0

		float4 _Color;
		sampler2D _MainTex;
		float _Amount;

		struct Input
		{
			float4 color : COLOR;
			float2 uv_MainTex;
		};

		void vert(inout appdata_full v) 
		{
			v.vertex.xyz += v.normal * _Amount * 0.0001;
		}

		void surf(Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
