#include "Basic.hlsli"

// 顶点着色器(3D)
VertexPosHWNormalTex VS(VertexPosNormalTex vIn)
{
    VertexPosHWNormalTex vOut;
    matrix viewProj = mul(g_View, g_Proj);
    float4 posW = mul(float4(vIn.posL, 1.0f), g_World);

    vOut.posH = mul(posW, viewProj);
    vOut.posW = posW.xyz;
    vOut.normalW = mul(vIn.normalL, (float3x3) g_WorldInvTranspose);
    //vOut.tex = vIn.tex;
    vOut.tex = mul(float4(vIn.tex.x - 0.5, 0, vIn.tex.y - 0.5, 1), g_TexRotate).xz + float2(0.5, 0.5);
    return vOut;
}
