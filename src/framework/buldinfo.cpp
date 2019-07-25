#include "buildinfo.h"
#include "plugininfo.h"

#ifdef DEBUG
#define BUILDINFO_TARGET "Debug"
#else
#define BUILDINFO_TARGET "Release"
#endif

#if defined(_WIN64)
#define BUILDINFO_NAME "Win 64-bit"
#elif defined(_WIN32)
#define BUILDINFO_NAME "Win 32-bit"
#elif defined(LINUX) && defined(__x86_64__)
#define BUILDINFO_NAME "Linux 64-bit"
#elif defined(LINUX) && defined(__i386__)
#define BUILDINFO_NAME "Linux 32-bit"
#else
#define BUILDINFO_NAME "Unknown Build"
#endif

const char *buildinfo_getPluginName() {
	return PLUGININFO_NAME;
}

const char *buildinfo_getPluginAuthor() {
	return PLUGININFO_AUTHOR;
}

const char *buildinfo_getPluginDescription() {
	return PLUGININFO_DESCRIPTION;
}

const char *buildinfo_getPluginVersion() {
	return PLUGININFO_VERSION " " BUILDINFO_TARGET " " BUILDINFO_NAME;
}

const char *buildinfo_getBuildTarget() {
	return BUILDINFO_TARGET;
}

const char *buildinfo_getBuildName() {
	return BUILDINFO_NAME;
}

const char *buildinfo_getBuildDate() {
	return __DATE__;
}

const char *buildinfo_getBuildTime() {
	return __TIME__;
}