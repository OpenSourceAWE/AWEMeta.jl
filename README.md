# AWEMeta

## Integration tests for **OpenSourceAWE** packages

Check [here](https://github.com/OpenSourceAWE/AWEMeta.jl/actions) for the last results.

- The workflow **Install KiteSimulators (last release)** installs the package `KiteSimulators.jl`, which is a meta-package that installs most of the other packages of the `OpenSourceAWE` software tools.

- The workflow **Test KiteModels#main --update** checks out the main branch of `KiteModels.jl` and runs `create_sysimage --update`.
- The workflow **Test KiteModels#main** checks out the main branch of `KiteModels.jl` and runs `create_sysimage`, in other words, it uses `Manifest-v1.11.toml.default`.
- The workflow **Install KiteModels#main** installs KiteModels#main as package, installs the examples, creates a system image and runs the example `ram_air_kite.jl`
- The workflow **Install KiteModels** installs the latest, released version of KiteModels as package, installs the examples, creates a system image and runs the example `ram_air_kite.jl`

These scripts run automatically every night between `01:00am` and `06:00am`. 

## Purpose
Detect possible bugs due to the ways our packages interact with each other or
due to broken updates in indirect dependencies (integration test). Furthermore, test the
`install_examples()` function and the `create_sys_image` scripts. 
