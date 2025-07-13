# AWEMeta

[![Build Status](https://github.com/OpenSourceAWE/AWEMeta.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/OpenSourceAWE/AWEMeta.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Automated tests that run on all (most) **OpenSourceAWE** repositories

Check [here](https://github.com/OpenSourceAWE/AWEMeta.jl/actions) for the last results.

- The workflow **Test KiteModels#main --update** installs the package `KiteSimulators.jl`, which is a meta-package that installs most of the other packages of the `OpenSourceAWE` software tools.

- The workflow **Test KiteModels#main --update** checks out the main branch of `KiteModels.jl` and runs `create_sysimage --update`.
- The workflow **Test KiteModels#main** checks out the main branch of `KiteModels.jl` and runs `create_sysimage`, in other words, it uses `Manifest-v1.11.toml.default`.

## Purpose
Detect possible bugs due to the ways our packages interact with each other or
due to broken updates in indirect dependencies (integration test).
