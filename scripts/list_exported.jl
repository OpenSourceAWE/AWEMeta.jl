using Pkg
modules = ["KiteUtils", "KiteModels"]

function list_exported(pkgname::String)
    # Get all global variables in the module
    globals = @eval names($(Symbol(pkgname)))

    # Print the global variables
    println("Exported names in module $(string(mod)):")
    for g in globals
        println(g)
    end
end

for mod in modules
    Pkg.activate("./scripts/$(mod)")
    Pkg.update()
    @eval using $(Symbol(mod))
    list_exported(mod)
end
