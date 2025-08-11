using PackageCompiler

# Create a temporary environment for building the sysimage
temp_env = mktempdir()

# Add packages to the temporary environment
data_packages = [
    "DataFrames",
    "CSV", 
    "Plots",
    "Flux",
    "NearestNeighbors",
    "Random",
    "Statistics",
    "StatsPlots"
]

run(`$(Base.julia_cmd()) --project=$temp_env -e 'using Pkg; Pkg.add($data_packages)'`)

# Define the sysimage name
sysimage_name = "dataanalysis_sysimage"

# Build the sysimage
create_sysimage(
    data_packages,
    sysimage_path=sysimage_name,
    project=temp_env,
    incremental=false
)

println("Data analysis sysimage built successfully: $sysimage_name")
