## Windows Utilities

The `*.reg` files in this directory provide a mechanism for re-mapping CapsLock
to function like a Control key. This is the handiest change that can be made to
a windows keyboard for working with Vim.

The `bin/` directory contains a series of useful scripts for running `.bat`
files in git-bash on windows. It also provides wrappers for the vim and gvim command line
`.bat` files that allow these commands to be exececute from the git-bash
prompt.

To use these files:

1. copy the `bin` directory to `~/bin`
2. Make sure that `~/bin` is the first entry in git-bash's `PATH` variable.
3. Restart any open git-bash session

Now the `vim` and `gvim` commands execute the system wide installed version of
Vim instead of the git-bash version of vim.

After this the `bat` command will also be available for executing arbitrary
`*.bat` files in the git-bash shell.
