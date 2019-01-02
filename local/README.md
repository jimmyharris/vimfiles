This folder contains local system specific overrides for configurations.

It contains the following files:

  * bundles.vim -- a file, if it exists that allows for local loading of other
                   plugins. This file should be loaded betwee plug#begin() and
                   plug#end()
  * overrides -- a local directory treated as a single vim-plug plugin that is
                 loaded last in the load order.
  * init.vim -- a local override file that will be sourced at the end of
                init.vim before plugins are loaded.
