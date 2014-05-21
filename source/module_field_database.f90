module module_field_database
!-----------------------------------------------------------------------
! Module to manage the field database
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Francisco Pena, fran(dot)pena(at)usc(dot)es
! Last update: 16/05/2014
!
! PUBLIC PROCEDURES:
! id_mesh_ext: given the mesh extension, return the index of its position in the database
!-----------------------------------------------------------------------
implicit none
 
!Types
type :: field_db
  character(len=10) :: mesh_ext         = ' '     !mesh  extension
  character(len=10) :: field_ext        = ' '     !field extension
  logical           :: is_field_outside = .false. !is field outside mesh?
end type

type(field_db), parameter :: FLDB(6) = [       &
field_db('mfm       ', 'mff       ', .true.),  &
field_db('mum       ', 'muf       ', .true.),  &
field_db('vtu       ', 'vtu       ', .false.), &
field_db('msh       ', '          ', .false.), & !FreeFem++ (old format)
field_db('mesh      ', 'mesh      ', .false.), & !FreeFem++ (new format)
field_db('unv       ', 'unv       ', .false.)]
contains

!-----------------------------------------------------------------------
! id_mesh_ext: given the mesh extension, return the index of its position in the database
!-----------------------------------------------------------------------
function id_mesh_ext(mesh_ext) result(res)
character(*), intent(in) :: mesh_ext
integer :: res, i

res = 0
do i = 1, size(FLDB,1)
  if (mesh_ext == FLDB(i)%mesh_ext) then
    res = i
    return
  end if
enddo
end function

end module
