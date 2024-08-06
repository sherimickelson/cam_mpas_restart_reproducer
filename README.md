# cam_mpas_restart_reproducer

This code was created to reproduce a problem we're seeing when we run a cam-mpas restart run using the nvhpc compiler.  The problem seems to be coming from different type declarations of 'endrun'.

This is a stand alone code and needs nothing but a fortran compiler (no input files needed)

make the code using the makefile and switching compilers at the top of that file.  

To build, type 'make', to run, type './program'.

this example works with the intel (ifort) and gnu compilers.  it fails with the nvhpc compiler with a seg fault.
a successful run prints out 'latCell'.

Here's the stack in the original code

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/driver/cam_mpas_subdriver.F90#L48-L57

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/driver/cam_mpas_subdriver.F90#L1742-L1751

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/restart_dynamics.F90#L80

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/utils/cam_abortutils.F90#L4

https://github.com/ESCOMP/CESM_share/blob/main/src/shr_sys_mod.F90#L24

https://github.com/ESCOMP/CESM_share/blob/main/src/shr_abort_mod.F90#L38-L43

