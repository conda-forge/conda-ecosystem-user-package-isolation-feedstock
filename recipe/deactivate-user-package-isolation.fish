# Decrement activation counter
if test "$CONDA_USER_PACKAGE_ISOLATION" -gt "0"
    set -gx CONDA_USER_PACKAGE_ISOLATION (math $CONDA_USER_PACKAGE_ISOLATION - 1)
end

if test "$CONDA_USER_PACKAGE_ISOLATION" -eq "0"
    # Reset PYTHONNOUSERSITE
    if test -z "$CONDA_PYTHONNOUSERSITE_BAK"
        set -e PYTHONNOUSERSITE
    else
        set -gx PYTHONNOUSERSITE "$CONDA_PYTHONNOUSERSITE_BAK"
    end
    set -e CONDA_PYTHONNOUSERSITE_BAK

    # Reset R_LIBS_USER
    if test -z "$CONDA_RLIBSUSER_BAK"
        set -e R_LIBS_USER
    else
        set -gx R_LIBS_USER "$CONDA_RLIBSUSER_BAK"
    end
    set -e CONDA_RLIBSUSER_BAK

    # Finally get rid of counter
    set -e CONDA_USER_PACKAGE_ISOLATION
end
