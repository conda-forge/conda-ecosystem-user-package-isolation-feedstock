if ($env.CONDA_USER_PACKAGE_ISOLATION? | default "0" | into int) == 0 {
    # Ignore python packages installed into the user's home directory
    $env.CONDA_PYTHONNOUSERSITE_BAK = ($env.PYTHONNOUSERSITE? | default "")
    $env.PYTHONNOUSERSITE = "1"
    # Ignore R packages installed into the user's home directory
    $env.CONDA_RLIBSUSER_BAK = ($env.R_LIBS_USER? | default "")
    $env.R_LIBS_USER = "-"
}

# Update activation counter
$env.CONDA_USER_PACKAGE_ISOLATION = (($env.CONDA_USER_PACKAGE_ISOLATION? | default "0" | into int) + 1 | into string)
