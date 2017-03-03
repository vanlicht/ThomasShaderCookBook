Shader "8ninths/S01_SimpleDiffuse" 
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)

	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert
		#pragma target 3.0

		float4 _Color;
		struct Input 
		{
			float4 color : COLOR;
		};

		void surf(Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = float4(1,1,1,1) * _Color;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
