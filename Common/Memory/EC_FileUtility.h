#pragma once
#include <stdio.h>

bool CECFileWrite(const void* buffer, const size_t num_byte, FILE* stream);
bool CECFileRead(void* buffer, const size_t num_byte, FILE* stream);