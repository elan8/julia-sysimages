# julia-sysimages
Julia sysimages

The purpose of this repository is to automatically build sysimages for Julia using GitHub Actions.
The sysimage covers the following use case:
- **LanguageServer + Plots**: LanguageServer.jl, SymbolServer, and Plots for IDE support and plotting capabilities

## Features

- **Multi-platform support**: Windows, macOS, and Linux
- **Automated builds**: GitHub Actions workflows for continuous integration
- **Pre-built releases**: Download ready-to-use sysimages from GitHub Releases
- **Customizable**: Easy to modify package lists for your specific needs



## Workflow

The repository uses GitHub Actions to manually build sysimages:

- **Manual triggers**: Workflows are triggered manually with specific Julia versions
- **Version-specific releases**: Each release is built for a specific Julia version
- **Matrix builds**: Builds for all OS × use case combinations
- **Flexible versioning**: Support for any Julia version (1.9, 1.10, 1.11, etc.)

## Documentation

- [Usage Guide](USAGE.md) - How to use the built sysimages
- [GitHub Actions Workflows](.github/workflows/) - Build automation details

## Contributing

1. Fork the repository
2. Modify package lists in `build_all_sysimages.jl` if needed
3. Push changes to trigger automated builds
4. Create a pull request

## License

This project is licensed under the same license as Julia itself.
