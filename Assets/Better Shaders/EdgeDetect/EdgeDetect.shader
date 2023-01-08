﻿Shader "Hidden/EdgeDetect" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader {

        Pass {
            CGPROGRAM
            #pragma vertex vp
            #pragma fragment fp

            #include "UnityCG.cginc"

            struct VertexData {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vp(VertexData v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex, _CameraDepthTexture;
            float4 _CameraDepthTexture_TexelSize;
            float4 _BorderColor;
            float _ThreshHold, _DepthThreshHold;

            fixed4 fp(v2f i) : SV_Target {
                int x, y;
                fixed4 col = tex2D(_MainTex, i.uv);
                float depth = tex2D(_CameraDepthTexture, i.uv);
                depth = Linear01Depth(depth);
            
                float depths;
                //if the depth is greater than the threshhold dont do anything
                if (depth > _DepthThreshHold)
                    return col;


                float n = Linear01Depth(tex2D(_CameraDepthTexture, i.uv + _CameraDepthTexture_TexelSize * float2(0, 1)).r);
                float e = Linear01Depth(tex2D(_CameraDepthTexture, i.uv + _CameraDepthTexture_TexelSize * float2(1, 0)).r);
                float s = Linear01Depth(tex2D(_CameraDepthTexture, i.uv + _CameraDepthTexture_TexelSize * float2(0, -1)).r);
                float w = Linear01Depth(tex2D(_CameraDepthTexture, i.uv + _CameraDepthTexture_TexelSize * float2(-1, 0)).r);


                if (n - s > _ThreshHold || w - e > _ThreshHold || e - w > _ThreshHold || s - n > _ThreshHold)
                    col = _BorderColor;


                return col;
            }
            ENDCG
        }
    }
}
