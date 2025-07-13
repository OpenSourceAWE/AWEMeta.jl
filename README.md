# AWEMeta

[![Build Status](https://github.com/OpenSourceAWE/AWEMeta.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/OpenSourceAWE/AWEMeta.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Automated tests that runs on all (most) **OpenSourceAWE** repositories

Check [here](https://github.com/OpenSourceAWE/AWEMeta.jl/actions) for the last results.

This script installs the package `KiteSimulators.jl`, which is a meta-package
that installs most of the other packages of the `OpenSourceAWE` software tools.

## Purpose
Detect possible bugs due to the ways our packages interact with each other or
due to broken updates in indirect dependencies (integration test).
