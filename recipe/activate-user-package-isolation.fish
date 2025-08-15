# Initialize counter if not set
if not set -q CONDA_USER_PACKAGE_ISOLATION
    set -gx CONDA_USER_PACKAGE_ISOLATION 0
end

if test "$CONDA_USER_PACKAGE_ISOLATION" -eq "0"
    # Ignore python packages installed into the user's home directory
    set -gx CONDA_PYTHONNOUSERSITE_BAK "$PYTHONNOUSERSITE"
    set -gx PYTHONNOUSERSITE 1
    # Ignore R packages installed into the user's home directory
    set -gx CONDA_RLIBSUSER_BAK "$R_LIBS_USER"
    set -gx R_LIBS_USER "-"
end

# Update activation counter
set -gx CONDA_USER_PACKAGE_ISOLATION (math $CONDA_USER_PACKAGE_ISOLATION + 1)
