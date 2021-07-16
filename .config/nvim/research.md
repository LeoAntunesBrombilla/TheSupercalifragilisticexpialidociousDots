# Ideas

-   Concept: the idea is to have a modular configuration organized in a similar way in which unix operating systems boot. Every single part is a module or a submodule of a module. Vaguely speaking, it would look like:
    -   main (UEFI): implicit module that kickstarts the config by loading the configuration.
    -   core (kernel): fundamental stuff such as system variables, nvim settings and dependencies assertion is done here.
    -   initialization (init): loads modules relevant for making nvdope _functional_, mostly plugins. E.g. LSP, DAP, UI.
    -   runlevel (runlevel): loads modules that extend init programs, for example: _mappings_, _autocmds_, _abbreviations_.
