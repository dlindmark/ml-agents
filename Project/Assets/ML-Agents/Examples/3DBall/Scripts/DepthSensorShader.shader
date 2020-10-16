Shader "DepthSensor"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        CGINCLUDE
        inline float Linear01FromEyeToLinear01FromNear(float depth01)
        {
            float near = _ProjectionParams.y;
            float far = _ProjectionParams.z;
            return (depth01 - near/far) * (1 + near/far);
        }
        ENDCG


        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f {
                float4 pos          : SV_POSITION;
                float depth         : TEXCOORD0;
            };

            v2f vert (appdata_base v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.depth = COMPUTE_DEPTH_01;
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                float d = Linear01FromEyeToLinear01FromNear(i.depth);
                return float4(d, d, d, 1.0);
            }
            ENDCG
        }
    }
}
