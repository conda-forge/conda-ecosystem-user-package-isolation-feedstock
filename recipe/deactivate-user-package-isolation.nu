# Decrement activation counter. Compute it first: assigning a variable and then
# hiding it in the same source-env file would expose the caller's old value.
let counter = ([(($env.CONDA_USER_PACKAGE_ISOLATION? | default "0" | into int) - 1) 0] | math max)

if $counter > 0 {
    $env.CONDA_USER_PACKAGE_ISOLATION = ($counter | into string)
} else {
    # Reset PYTHONNOUSERSITE
    if ($env.CONDA_PYTHONNOUSERSITE_BAK? | default "" | is-empty) {
        hide-env -i PYTHONNOUSERSITE
    } else {
        $env.PYTHONNOUSERSITE = $env.CONDA_PYTHONNOUSERSITE_BAK
    }
    hide-env -i CONDA_PYTHONNOUSERSITE_BAK

    # Reset R_LIBS_USER
    if ($env.CONDA_RLIBSUSER_BAK? | default "" | is-empty) {
        hide-env -i R_LIBS_USER
    } else {
        $env.R_LIBS_USER = $env.CONDA_RLIBSUSER_BAK
    }
    hide-env -i CONDA_RLIBSUSER_BAK

    # Finally get rid of counter
    hide-env -i CONDA_USER_PACKAGE_ISOLATION
}
