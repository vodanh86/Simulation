//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Distance Field" {
Properties {
_FaceTex ("Face Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
_SpecularColor ("Specular", Color) = (1,1,1,1)
_SpecularPower ("Specular", Range(0, 4)) = 2
_Reflectivity ("Reflectivity", Range(5, 15)) = 10
_Diffuse ("Diffuse", Range(0, 1)) = 0.5
_Ambient ("Ambient", Range(1, 0)) = 0.5
_BumpMap ("Normal map", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0
_BumpFace ("Bump Face", Range(0, 1)) = 0
_ReflectFaceColor ("Reflection Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Reflection Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
_MaskCoord ("Mask Coordinates", Vector) = (0,0,32767,32767)
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
_MaskSoftnessX ("Mask SoftnessX", Float) = 0
_MaskSoftnessY ("Mask SoftnessY", Float) = 0
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_CullMode ("Cull Mode", Float) = 0
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 27164
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4 * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "GLOW_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "GLOW_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "GLOW_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_3.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat0.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat5 = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat0.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat5 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_6 = u_xlat16_3.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_3;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_3.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat0.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat5 = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat0.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat5 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_6 = u_xlat16_3.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_3;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4 = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4);
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_3.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat4) + u_xlat16_2.xyz;
    u_xlat0.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat5 = u_xlat0.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat0.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat5 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_6 = u_xlat16_3.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_3;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = vec4(u_xlat16_1) * u_xlat16_3;
    u_xlat16_4.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1 = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_7 = u_xlat16_4.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_4;
    u_xlatb6 = u_xlat16_7<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = vec4(u_xlat16_1) * u_xlat16_3;
    u_xlat16_4.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1 = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_7 = u_xlat16_4.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_4;
    u_xlatb6 = u_xlat16_7<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = vec4(u_xlat16_1) * u_xlat16_3;
    u_xlat16_4.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1 = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_7 = u_xlat16_4.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_4;
    u_xlatb6 = u_xlat16_7<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
    u_xlat16_1.x = u_xlat5.y * u_xlat5.x;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_1.w;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
    u_xlat16_1.x = u_xlat5.y * u_xlat5.x;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_1.w;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
    u_xlat16_1.x = u_xlat5.y * u_xlat5.x;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_1.w;
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_6 = u_xlat16_0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_6 = u_xlat16_0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat5 = u_xlat16_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0.x) + vs_TEXCOORD1.z;
    u_xlatb5 = u_xlat5<0.0;
    if(u_xlatb5){discard;}
    u_xlat5 = _OutlineWidth * _ScaleRatioA;
    u_xlat5 = u_xlat5 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat5, 1.0);
    u_xlat16_6 = u_xlat5 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_11 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_6;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlat16_6 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_6);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat2 = u_xlat16_0 * _OutlineColor;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_4 = texture(_FaceTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat4.x = u_xlat16_4.w * _FaceColor.w;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat16_3.xyz);
    u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4.x);
    u_xlat16_2 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_2.xyz;
    u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
    u_xlat4.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat4.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat4.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
    u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat4.y * u_xlat4.x;
    u_xlat16_6 = u_xlat16_0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_1);
    SV_Target0 = u_xlat16_0 * vs_COLOR0.wwww;
    u_xlatb4 = u_xlat16_6<0.0;
    if(u_xlatb4){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat6.xy = u_xlat6.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD2.zw;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_10 = u_xlat16_1.w * u_xlat16_4.x + -0.00100000005;
    u_xlatb6 = u_xlat16_10<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat16_1 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat6.xy = u_xlat6.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD2.zw;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_10 = u_xlat16_1.w * u_xlat16_4.x + -0.00100000005;
    u_xlatb6 = u_xlat16_10<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat16_1 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = abs(u_xlat8.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
    u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat8.xy;
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
    u_xlat8.x = inversesqrt(u_xlat13);
    u_xlat12 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat13 = _Sharpness + 1.0;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * u_xlat8.x;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
    u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat6.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat12 = (-_WeightNormal) + _WeightBold;
    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
    u_xlat6.z = u_xlat8.x * 0.5;
    vs_TEXCOORD1.yw = u_xlat6.xz;
    u_xlat12 = 0.5 / u_xlat6.x;
    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
    u_xlat2.x = (-_GlowOffset) * _ScaleRatioB + 1.0;
    u_xlat2.x = (-_GlowOuter) * _ScaleRatioB + u_xlat2.x;
    u_xlat13 = min(u_xlat13, u_xlat2.x);
    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
    u_xlat8.x = floor(u_xlat0.x);
    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6.x = u_xlat16_0 + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat16_0) + vs_TEXCOORD1.z;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat16_1.x = min(u_xlat6.x, 1.0);
    u_xlat16_7 = u_xlat6.x * 0.5;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
    u_xlat16_2 = texture(_OutlineTex, u_xlat6.xy);
    u_xlat3 = u_xlat16_2 * _OutlineColor;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
    u_xlat16_5 = texture(_FaceTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2 = u_xlat16_5.w * _FaceColor.w;
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat2);
    u_xlat16_3.xyz = u_xlat3.xyz * u_xlat3.www + (-u_xlat16_4.xyz);
    u_xlat16_3.w = _OutlineColor.w * u_xlat16_2.w + (-u_xlat2);
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_3;
    u_xlat16_2.xyz = u_xlat6.xyz * vec3(u_xlat2) + u_xlat16_3.xyz;
    u_xlat16_2.w = _FaceColor.w * u_xlat16_5.w + u_xlat16_3.w;
    u_xlat0.y = _OutlineSoftness * _ScaleRatioA;
    u_xlat0.xz = u_xlat0.xy * vs_TEXCOORD1.yy;
    u_xlat16_1.x = u_xlat0.y * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat0.z * 0.5 + u_xlat16_7;
    u_xlat16_1.x = u_xlat16_7 / u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat6.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat6.xy = u_xlat6.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD2.zw;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_10 = u_xlat16_1.w * u_xlat16_4.x + -0.00100000005;
    u_xlatb6 = u_xlat16_10<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.x = _GlowOffset * _ScaleRatioB;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat0.x = (-u_xlat6.x) * 0.5 + u_xlat0.x;
    u_xlatb6 = u_xlat0.x>=0.0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat12 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat6.x = u_xlat6.x * u_xlat12 + _GlowInner;
    u_xlat6.x = u_xlat6.x * vs_TEXCOORD1.y;
    u_xlat12 = u_xlat6.x * 0.5 + 1.0;
    u_xlat6.x = u_xlat6.x * 0.5;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = _GlowColor.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat16_1 * vs_COLOR0.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "GLOW_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
Fallback "TextMeshPro/Mobile/Distance Field"
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}