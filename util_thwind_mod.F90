MODULE UTIL_THWIND_MOD

USE INTDYN_MOD, ONLY : THWIND

INTERFACE SAVE
MODULE PROCEDURE SAVE_THWIND
END INTERFACE

INTERFACE LOAD
MODULE PROCEDURE LOAD_THWIND
END INTERFACE

INTERFACE COPY
MODULE PROCEDURE COPY_THWIND
END INTERFACE

INTERFACE WIPE
MODULE PROCEDURE WIPE_THWIND
END INTERFACE



CONTAINS

SUBROUTINE SAVE_THWIND (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (THWIND), INTENT (IN), TARGET :: YD

WRITE (KLUN) YD%M_UH
WRITE (KLUN) YD%M_VH
WRITE (KLUN) YD%M_WWI
WRITE (KLUN) YD%NDIM
END SUBROUTINE

SUBROUTINE LOAD_THWIND (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (THWIND), INTENT (OUT), TARGET :: YD

READ (KLUN) YD%M_UH
READ (KLUN) YD%M_VH
READ (KLUN) YD%M_WWI
READ (KLUN) YD%NDIM
END SUBROUTINE


SUBROUTINE COPY_THWIND (YD, LDCREATED)

IMPLICIT NONE
TYPE (THWIND), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDCREATED
LOGICAL :: LLCREATED

LLCREATED = .FALSE.
IF (PRESENT (LDCREATED)) THEN
  LLCREATED = LDCREATED
ENDIF
IF (.NOT. LLCREATED) THEN
  !$acc enter data create (YD)
  !$acc update device (YD)
ENDIF




END SUBROUTINE

SUBROUTINE WIPE_THWIND (YD, LDDELETED)

IMPLICIT NONE
TYPE (THWIND), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDDELETED
LOGICAL :: LLDELETED





LLDELETED = .FALSE.
IF (PRESENT (LDDELETED)) THEN
  LLDELETED = LDDELETED
ENDIF
IF (.NOT. LLDELETED) THEN
  !$acc exit data delete (YD)
ENDIF
END SUBROUTINE



END MODULE
