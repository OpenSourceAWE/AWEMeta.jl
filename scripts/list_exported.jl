using Pkg
modules = ["KiteUtils", "KiteModels"]
dict = Dict{String, Vector{Symbol}}()

function list_exported(pkgname::String)
    # Get all global variables in the module
    globals = @eval names($(Symbol(pkgname)))

    # Print the global variables
    println("Exported names in module $(string(mod)):")
    for g in globals
        println(g)
    end
end

function add_exported!(dict::Dict{String, Vector{Symbol}}, pkgname::String)
    # Get the module object from its name
    mod = @eval $(Symbol(pkgname))
    
    # Get only the exported names (not all globals)
    exported = names(mod; all=false)
    
    # Store in the dictionary
    dict[pkgname] = exported
end

for mod in modules
    Pkg.activate("./scripts/$(mod)")
    Pkg.update()
    @eval using $(Symbol(mod))
    add_exported!(dict, mod)
end
