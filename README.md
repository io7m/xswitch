xswitch
===

```
# Pick your C++ compiler
#

$ echo clang++ > conf-c++

# Pick the right dynamic library suffix for your platform
#   Linux: so
#   macOS: dylib
#   Windows: dll

$ echo so > conf-sosuffix

# Build the code
$ ./make.sh

# Copy the plugin to your system-specific LV2 plugin directory
$ cp -rv out/xswitch8.lv2 /usr/lib/lv2/

```
