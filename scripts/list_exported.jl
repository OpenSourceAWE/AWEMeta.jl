using KiteUtils
# This script lists all global variables in the current module.

function list_exported(mod)
    # Get all global variables in the module
    globals = names(mod)

    # Print the global variables
    println("Exported names in module $(string(mod)):")
    for g in globals
        println(g)
    end
end

list_exported(KiteUtils)