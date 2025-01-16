# Networkify
Basic wrapper for URLSession to make network layer simpler.

# Prerequisites

## Homebrew

Homebrew installs the stuff you need that Apple didn’t ([link](https://brew.sh)).

Paste below in a macOS Terminal

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


# Makefile

- `make install`: to install the 3rd party tools like `Mint` using `Homebrew`
- `make bootstrap`: to install the external dependencies like `SwiftLint` and `XcodeGen` using `Mint`
- `make project`: to generate or re-generate the `*.xcodeproj`
- `make lint`: to lint your project using `SwiftLint` tool
- `make lint_fix`: to fix code which is aginst`SwiftLint's`'config file
