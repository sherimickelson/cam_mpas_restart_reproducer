# Define the Fortran compiler
#FC = gfortran
FC = nvfortran
#FC = ifort

# Define the flags for the compiler
FFLAGS = -Wall -O2

# Preprocessor
CPP = cpp

# Preprocessor flags
CPPFLAGS = -P

# Define the source files
#SRC = $(wildcard *.F90)
SRC = shr_kind_mod.F90  shr_strconvert_mod.F90 shr_log_mod.F90 shr_abort_mod.F90 shr_sys_mod.F90 cam_abortutils.F90 cam_mpas_subdriver.F90 restart_dynamics.F90

# Define the object files
OBJ = $(SRC:.F90=.o)

# Define the executable name
EXEC = program

# Default target
all: $(EXEC)

# Rule to build the executable
$(EXEC): $(OBJ)
	$(FC) $(FFLAGS) -o $@ $^

# Rule to build object files
%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

shr_sys_mod.o: shr_sys_mod.F90
	$(FC) $(FFLAGS) -c $< -o $@

shr_log_mod.o: shr_log_mod.F90
	$(FC) $(FFLAGS) -c $< -o $@

shr_strconvert_mod.o: shr_strconvert_mod.F90
	$(FC) $(FFLAGS) -c $< -o $@

shr_kind_mod.o: shr_kind_mod.F90
	$(FC) $(FFLAGS) -c $< -o $@

shr_abort_mod.o: shr_abort_mod.F90
	$(FC) $(FFLAGS) -c $< -o $@

cam_abortutils.o: cam_abortutils.F90
	$(FC) $(FFLAGS) -c $< -o $@

cam_mpas_subdriver.o: cam_mpas_subdriver.F90
	$(FC) $(FFLAGS) -c $< -o $@

restart_dynamics.o: restart_dynamics.F90
	$(FC) $(FFLAGS) -c $< -o $@

# Clean up the build files
clean:
	rm -f *.o *.mod

# Phony targets
.PHONY: all clean
