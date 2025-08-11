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
    run(`$(Base.julia_cmd()) --project=$temp_env -e 'using Pkg; Pkg.add($packages)'`)
    
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

# Define packages for each use case
languageserver_packages = ["LanguageServer", "SymbolServer"]
dataanalysis_packages = [
    "DataFrames",
    "CSV", 
    "Plots",
    "Flux",
    "NearestNeighbors",
    "Random",
    "Statistics",
    "StatsPlots"
]

# Build both sysimages
build_sysimage(languageserver_packages, "languageserver_sysimage", "LanguageServer")
build_sysimage(dataanalysis_packages, "dataanalysis_sysimage", "Data Analysis")

println("All sysimages built successfully!")
