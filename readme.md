# Configurable Transpiler for Python written in bash
> uses sed & regex

### Usage
- `pyro [filename without extension] "[python exec params]"` (eg. pyro german "mamamia"), creates and runs [filename without extension].py
- use flag `-c` to compile without running
- use flag `-d` to show config details

### Configuration; Environment Variables
- `PYRO_REGEX` set this to the path of the regex file, default is `~/.config/pyro/pyro.regex`
- `PYRO_CONFIG` set this to the desired config file, default looks in local directory `.pyro`

### Disclamer
This project's objective is to provide 90% functionality, with 10% of development time. There are likely many issues that I'm unaware of, hopefully most can be addressed by editing the regex config file. Good luck!
