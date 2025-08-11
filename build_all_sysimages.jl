using PackageCompiler
using Pkg

println("Starting sysimage build process...")

# Function to build a sysimage for a specific use case
function build_sysimage(packages, sysimage_name, description)
    println("Building $description sysimage...")
    
    # Create a temporary environment for building the sysimage
    temp_env = mktempdir()
    println("Created temporary environment: $temp_env")
    
    # Add packages to the temporary environment
    println("Adding packages: $(join(packages, ", "))")
    for pkg in packages
        run(`$(Base.julia_cmd()) --project=$temp_env -e "using Pkg; Pkg.add(\"$pkg\")"`)
    end
    
    # Build the sysimage
    println("Creating sysimage: $sysimage_name")
    create_sysimage(
        packages,
        sysimage_path=sysimage_name,
        project=temp_env,
        incremental=false
    )
    
    println("✓ $description sysimage built successfully: $sysimage_name")
end

# Define packages for the combined sysimage
combined_packages = ["LanguageServer", "SymbolServer", "Plots"]

# Build the combined sysimage
build_sysimage(combined_packages, "combined_sysimage", "LanguageServer + Plots")

println("Combined sysimage built successfully!")
