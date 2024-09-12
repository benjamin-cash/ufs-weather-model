help([[
loads UFS Model prerequisites for Hera/Intel
]])

prepend_path("MODULEPATH", "/opt/spack-stack/spack-stack-1.8.0/envs/unified-env/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2021.10.0"
load(pathJoin("stack-intel", stack_intel_ver))

stack_impi_ver=os.getenv("stack_impi_ver") or "2021.12.1"
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))

cmake_ver=os.getenv("cmake_ver") or "3.27.9"
load(pathJoin("cmake", cmake_ver))

load("ufs_common.container")

nccmp_ver=os.getenv("nccmp_ver") or "1.9.0.1"
load(pathJoin("nccmp", nccmp_ver))

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")
prepend_path("LIBRARY_PATH", "/opt/spack-stack/spack-stack-1.8.0/envs/unified-env/install/intel/2021.10.0/esmf-8.6.1-fqyhli6/lib")
setenv("FFLAGS", "-I/opt/spack-stack/spack-stack-1.8.0/envs/unified-env/install/intel/2021.10.0/intel-oneapi-mpi-2021.12.1-pvycn2u/mpi/2021.12/include/mpi")
setenv("FCFLAGS", "-I/opt/spack-stack/spack-stack-1.8.0/envs/unified-env/install/intel/2021.10.0/intel-oneapi-mpi-2021.12.1-pvycn2u/mpi/2021.12/include/mpi")
setenv("CMAKE_Platform", "container.intel")

whatis("Description: UFS build environment")
