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

function print_common_symbols(dict::Dict{String, Vector{Symbol}})
    # Flatten all symbols from all vectors into one array, keeping track of which key they came from
    symbol_to_keys = Dict{Symbol, Set{String}}()
    for (k, syms) in dict
        for s in syms
            if haskey(symbol_to_keys, s)
                push!(symbol_to_keys[s], k)
            else
                symbol_to_keys[s] = Set([k])
            end
        end
    end
    # Filter symbols that appear in more than one key
    common_symbols = [s for (s, keys) in symbol_to_keys if length(keys) > 1]
    println("Symbols present in more than one module:")
    for s in common_symbols
        println(s)
    end
end

print_common_symbols(dict)
