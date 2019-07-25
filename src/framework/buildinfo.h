#pragma once
#ifndef BUILDINFO_H
#define BUILDINFO_H

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

const char *buildinfo_getPluginName();
const char *buildinfo_getPluginAuthor();
const char *buildinfo_getPluginDescription();
const char *buildinfo_getPluginVersion();
const char *buildinfo_getBuildTarget();
const char *buildinfo_getBuildName();
const char *buildinfo_getBuildDate();
const char *buildinfo_getBuildTime();

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus

#endif  // !BUILDINFO_H