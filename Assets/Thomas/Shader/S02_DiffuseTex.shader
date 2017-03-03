Shader "8ninths/S02_DiffuseTex" 
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Main Texture", 2D) = "White"{}
		_Center("Center", Vector) = (0,0,0,0)
		_Radius("Radius", Float) = 0.5
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert
		#pragma target 3.0

		float4 _Color;
		sampler2D _MainTex;
		float3 _Center;
		float _Radius;

		struct Input
		{
			float3 worldPos;
			float4 color : COLOR;
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o) 
		{
			
			float d = distance(_Center, IN.worldPos);
			float dN = 1 - saturate(d / _Radius);

			/*if (dN > 0.1 && dN < 0.3) {
				o.Albedo = half3(1, 1, 1);
			}
			else {
				o.Albedo = _Color * tex2D(_MainTex, IN.uv_MainTex).rgb;
			}*/
			dN = step(0.25, dN) * step(dN, 0.3);
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * (1 - dN) + half3(1, 1, 1) * dN;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
