#ifndef EXAMPLE_CPP_LIBRARY_H
#define EXAMPLE_CPP_LIBRARY_H

#include <ISmmPlugin.h>

class ExamplePlugin : public ISmmPlugin {
public:
    // Implement plugin event of ISmmPlugin
    // Override: Load
    bool Load(PluginId id, ISmmAPI *ismm, char *error, size_t maxlength, bool late) override;
    // Override: Unload
    bool Unload(char *error, size_t maxlen) override;
    // Override: Pause
    bool Pause(char *error, size_t maxlen) override;
    // Override: Unpause
    bool Unpause(char *error, size_t maxlen) override;
public:
    // Implement plugin information of ISmmPlugin
    const char *GetAuthor() override;
    const char *GetName() override;
    const char *GetDescription() override;
    const char *GetURL() override;
    const char *GetLicense() override;
    const char *GetVersion() override;
    const char *GetDate() override;
    const char *GetLogTag() override;
};

extern ExamplePlugin g_sPluginSelf;

PLUGIN_GLOBALVARS();
#endif //EXAMPLE_CPP_LIBRARY_H
