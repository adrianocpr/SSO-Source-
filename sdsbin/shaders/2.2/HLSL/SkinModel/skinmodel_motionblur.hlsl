#include "Mesh_Comm.h"

string entrynames = "ps_2_0 ps_main";

float4 g_Color = (1.0f, 1.0f, 1.0f, 1.0f);
float g_Time = 0.0f;	// 0 代表 motion blur开始, 1 代表motion blur 结束

//-----------------------------------------------------------------
// PS Entry
//-----------------------------------------------------------------
float4 ps_main(PS_INPUT Input) : COLOR0
{
	return g_Color;
}