module cam_mpas_subdriver
    use cam_abortutils, only: endrun

    implicit none

    public :: cam_mpas_read_restart, &
              cam_mpas_update_halo

    private


    !
    ! This interface should be compatible with CAM's endrun routine
    !
    abstract interface
       subroutine halt_model(mesg, ierr)
           use shr_kind_mod, only : shr_kind_in
           character(len=*), intent(in), optional :: mesg
           integer(kind=shr_kind_in), intent(in), optional :: ierr
       end subroutine halt_model
    end interface


contains



subroutine cam_mpas_read_restart(endrun)

       ! Arguments
       procedure(halt_model) :: endrun

       ! Local variables
       character(len=*), parameter :: subname = 'cam_mpas_subdriver::cam_mpas_read_restart'

       integer :: ierr

       !
       ! Perform halo updates for all decomposed fields (i.e., fields with
       ! an outermost dimension of nCells, nVertices, or nEdges)
       !
       call cam_mpas_update_halo('latCell', endrun)

end subroutine cam_mpas_read_restart


subroutine cam_mpas_update_halo(fieldName, endrun)
       ! Arguments
       character(len=*), intent(in) :: fieldName
       procedure(halt_model) :: endrun

       ! Local variables
       character(len=*), parameter :: subname = 'cam_mpas_subdriver::cam_mpas_update_halo'

       character(len=StrKIND) :: errString

       write(*,*) fieldName
end subroutine cam_mpas_update_halo


end module cam_mpas_subdriver
