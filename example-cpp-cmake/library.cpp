#include "library.h"

ExamplePlugin g_sPluginSelf;

PLUGIN_EXPOSE(SamplePlugin,g_sPluginSelf)

bool ExamplePlugin::Load(PluginId id, ISmmAPI *ismm, char *error, size_t maxlength, bool late) {
    PLUGIN_SAVEVARS();
    return true;
}

bool ExamplePlugin::Unload(char *error, size_t maxlen) {
    return true;
}

bool ExamplePlugin::Pause(char *error, size_t maxlen) {
    return true;
}

bool ExamplePlugin::Unpause(char *error, size_t maxlen) {
    return true;
}

const char * ExamplePlugin::GetAuthor() {
    return "Simmo";
}

const char * ExamplePlugin::GetName() {
    return "Example CMake edition";
}

const char * ExamplePlugin::GetDescription() {
    return "An example plugin by Simmo.\nTemplate use CMake & Cpp";
}

const char * ExamplePlugin::GetURL() {
    return "";
}

const char * ExamplePlugin::GetLicense() {
    return "MIT";
}

const char * ExamplePlugin::GetVersion() {
    return "1.0.0-template";
}

const char * ExamplePlugin::GetDate() {
    return __DATE__;
}

const char *ExamplePlugin::GetLogTag() {
    return "Example-CMake";
}
