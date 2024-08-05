program reproducer

use cam_abortutils,     only: endrun
use cam_mpas_subdriver, only: cam_mpas_read_restart

call cam_mpas_read_restart(endrun)

end program

