using PackageCompiler

# Create a temporary environment for building the sysimage
temp_env = mktempdir()

# Add packages to the temporary environment
run(`$(Base.julia_cmd()) --project=$temp_env -e 'using Pkg; Pkg.add(["LanguageServer", "SymbolServer"])'`)

# Define the sysimage name
sysimage_name = "languageserver_sysimage"

# Build the sysimage
create_sysimage(
    ["LanguageServer", "SymbolServer"],
    sysimage_path=sysimage_name,
    project=temp_env,
    incremental=false
)

println("LanguageServer sysimage built successfully: $sysimage_name")
