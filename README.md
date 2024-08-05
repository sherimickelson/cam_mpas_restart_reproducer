# cam_mpas_restart_reproducer

This code was created to reproduce a problem we're seeing when we run a cam-mpas restart run using the nvhpc compiler.
It is a stand alone code and needs nothing but the compler (no input files needed)

make the code using the makefile and switching comilers at the top

this example works with the intel (ifort) and gnu compiler.  it fails with the nvphpc comiler with a seg fault.
a successful run prints out 'latCell'.

Here's the stack in the original code

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/driver/cam_mpas_subdriver.F90#L48-L57

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/driver/cam_mpas_subdriver.F90#L1742-L1751

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/dynamics/mpas/restart_dynamics.F90#L80

https://github.com/EarthWorksOrg/CAM/blob/ew-main/src/utils/cam_abortutils.F90#L4

https://github.com/ESCOMP/CESM_share/blob/main/src/shr_sys_mod.F90#L24

https://github.com/ESCOMP/CESM_share/blob/main/src/shr_abort_mod.F90#L38-L43

