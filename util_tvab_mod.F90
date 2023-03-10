MODULE UTIL_TVAB_MOD

USE YOMVERT, ONLY : TVAB

INTERFACE SAVE
MODULE PROCEDURE SAVE_TVAB
END INTERFACE

INTERFACE LOAD
MODULE PROCEDURE LOAD_TVAB
END INTERFACE

INTERFACE COPY
MODULE PROCEDURE COPY_TVAB
END INTERFACE

INTERFACE WIPE
MODULE PROCEDURE WIPE_TVAB
END INTERFACE



CONTAINS

SUBROUTINE SAVE_TVAB (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TVAB), INTENT (IN), TARGET :: YD
LOGICAL :: LVAF, LVAH, LVALH, LVBF, LVBH, LVC, LVDELA, LVDELB
LVALH = ALLOCATED (YD%VALH)
WRITE (KLUN) LVALH
IF (LVALH) THEN
  WRITE (KLUN) LBOUND (YD%VALH)
  WRITE (KLUN) UBOUND (YD%VALH)
  WRITE (KLUN) YD%VALH
ENDIF
LVBH = ALLOCATED (YD%VBH)
WRITE (KLUN) LVBH
IF (LVBH) THEN
  WRITE (KLUN) LBOUND (YD%VBH)
  WRITE (KLUN) UBOUND (YD%VBH)
  WRITE (KLUN) YD%VBH
ENDIF
LVAH = ALLOCATED (YD%VAH)
WRITE (KLUN) LVAH
IF (LVAH) THEN
  WRITE (KLUN) LBOUND (YD%VAH)
  WRITE (KLUN) UBOUND (YD%VAH)
  WRITE (KLUN) YD%VAH
ENDIF
LVC = ALLOCATED (YD%VC)
WRITE (KLUN) LVC
IF (LVC) THEN
  WRITE (KLUN) LBOUND (YD%VC)
  WRITE (KLUN) UBOUND (YD%VC)
  WRITE (KLUN) YD%VC
ENDIF
LVAF = ALLOCATED (YD%VAF)
WRITE (KLUN) LVAF
IF (LVAF) THEN
  WRITE (KLUN) LBOUND (YD%VAF)
  WRITE (KLUN) UBOUND (YD%VAF)
  WRITE (KLUN) YD%VAF
ENDIF
LVBF = ALLOCATED (YD%VBF)
WRITE (KLUN) LVBF
IF (LVBF) THEN
  WRITE (KLUN) LBOUND (YD%VBF)
  WRITE (KLUN) UBOUND (YD%VBF)
  WRITE (KLUN) YD%VBF
ENDIF
LVDELA = ALLOCATED (YD%VDELA)
WRITE (KLUN) LVDELA
IF (LVDELA) THEN
  WRITE (KLUN) LBOUND (YD%VDELA)
  WRITE (KLUN) UBOUND (YD%VDELA)
  WRITE (KLUN) YD%VDELA
ENDIF
LVDELB = ALLOCATED (YD%VDELB)
WRITE (KLUN) LVDELB
IF (LVDELB) THEN
  WRITE (KLUN) LBOUND (YD%VDELB)
  WRITE (KLUN) UBOUND (YD%VDELB)
  WRITE (KLUN) YD%VDELB
ENDIF
END SUBROUTINE

SUBROUTINE LOAD_TVAB (KLUN, YD)
USE PARKIND1, ONLY : JPRD

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TVAB), INTENT (OUT), TARGET :: YD
INTEGER :: IL1(1), IU1(1)
LOGICAL :: LVAF, LVAH, LVALH, LVBF, LVBH, LVC, LVDELA, LVDELB
REAL(KIND=JPRD), ALLOCATABLE :: ZTMP1 (:)
READ (KLUN) LVALH
IF (LVALH) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VALH (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VALH,1):UBOUND(YD%VALH,1)))
  READ (KLUN) ZTMP1
  YD%VALH = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVBH
IF (LVBH) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VBH (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VBH,1):UBOUND(YD%VBH,1)))
  READ (KLUN) ZTMP1
  YD%VBH = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVAH
IF (LVAH) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VAH (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VAH,1):UBOUND(YD%VAH,1)))
  READ (KLUN) ZTMP1
  YD%VAH = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVC
IF (LVC) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VC (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VC,1):UBOUND(YD%VC,1)))
  READ (KLUN) ZTMP1
  YD%VC = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVAF
IF (LVAF) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VAF (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VAF,1):UBOUND(YD%VAF,1)))
  READ (KLUN) ZTMP1
  YD%VAF = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVBF
IF (LVBF) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VBF (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VBF,1):UBOUND(YD%VBF,1)))
  READ (KLUN) ZTMP1
  YD%VBF = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVDELA
IF (LVDELA) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VDELA (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VDELA,1):UBOUND(YD%VDELA,1)))
  READ (KLUN) ZTMP1
  YD%VDELA = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
READ (KLUN) LVDELB
IF (LVDELB) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%VDELB (IL1(1):IU1(1)))
  ALLOCATE (ZTMP1(LBOUND(YD%VDELB,1):UBOUND(YD%VDELB,1)))
  READ (KLUN) ZTMP1
  YD%VDELB = ZTMP1
  DEALLOCATE (ZTMP1)
ENDIF
END SUBROUTINE


SUBROUTINE COPY_TVAB (YD, LDCREATED)

IMPLICIT NONE
TYPE (TVAB), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDCREATED
LOGICAL :: LLCREATED
LOGICAL :: LVAF, LVAH, LVALH, LVBF, LVBH, LVC, LVDELA, LVDELB

LLCREATED = .FALSE.
IF (PRESENT (LDCREATED)) THEN
  LLCREATED = LDCREATED
ENDIF
IF (.NOT. LLCREATED) THEN
  !$acc enter data create (YD)
  !$acc update device (YD)
ENDIF
LVALH = ALLOCATED (YD%VALH)
IF (LVALH) THEN
  !$acc enter data create (YD%VALH)
  !$acc update device (YD%VALH)
  !$acc enter data attach (YD%VALH)
ENDIF

LVBH = ALLOCATED (YD%VBH)
IF (LVBH) THEN
  !$acc enter data create (YD%VBH)
  !$acc update device (YD%VBH)
  !$acc enter data attach (YD%VBH)
ENDIF

LVAH = ALLOCATED (YD%VAH)
IF (LVAH) THEN
  !$acc enter data create (YD%VAH)
  !$acc update device (YD%VAH)
  !$acc enter data attach (YD%VAH)
ENDIF

LVC = ALLOCATED (YD%VC)
IF (LVC) THEN
  !$acc enter data create (YD%VC)
  !$acc update device (YD%VC)
  !$acc enter data attach (YD%VC)
ENDIF

LVAF = ALLOCATED (YD%VAF)
IF (LVAF) THEN
  !$acc enter data create (YD%VAF)
  !$acc update device (YD%VAF)
  !$acc enter data attach (YD%VAF)
ENDIF

LVBF = ALLOCATED (YD%VBF)
IF (LVBF) THEN
  !$acc enter data create (YD%VBF)
  !$acc update device (YD%VBF)
  !$acc enter data attach (YD%VBF)
ENDIF

LVDELA = ALLOCATED (YD%VDELA)
IF (LVDELA) THEN
  !$acc enter data create (YD%VDELA)
  !$acc update device (YD%VDELA)
  !$acc enter data attach (YD%VDELA)
ENDIF

LVDELB = ALLOCATED (YD%VDELB)
IF (LVDELB) THEN
  !$acc enter data create (YD%VDELB)
  !$acc update device (YD%VDELB)
  !$acc enter data attach (YD%VDELB)
ENDIF

END SUBROUTINE

SUBROUTINE WIPE_TVAB (YD, LDDELETED)

IMPLICIT NONE
TYPE (TVAB), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDDELETED
LOGICAL :: LLDELETED
LOGICAL :: LVAF, LVAH, LVALH, LVBF, LVBH, LVC, LVDELA, LVDELB

LVALH = ALLOCATED (YD%VALH)
IF (LVALH) THEN
  !$acc exit data detach (YD%VALH)
  !$acc exit data delete (YD%VALH)
ENDIF

LVBH = ALLOCATED (YD%VBH)
IF (LVBH) THEN
  !$acc exit data detach (YD%VBH)
  !$acc exit data delete (YD%VBH)
ENDIF

LVAH = ALLOCATED (YD%VAH)
IF (LVAH) THEN
  !$acc exit data detach (YD%VAH)
  !$acc exit data delete (YD%VAH)
ENDIF

LVC = ALLOCATED (YD%VC)
IF (LVC) THEN
  !$acc exit data detach (YD%VC)
  !$acc exit data delete (YD%VC)
ENDIF

LVAF = ALLOCATED (YD%VAF)
IF (LVAF) THEN
  !$acc exit data detach (YD%VAF)
  !$acc exit data delete (YD%VAF)
ENDIF

LVBF = ALLOCATED (YD%VBF)
IF (LVBF) THEN
  !$acc exit data detach (YD%VBF)
  !$acc exit data delete (YD%VBF)
ENDIF

LVDELA = ALLOCATED (YD%VDELA)
IF (LVDELA) THEN
  !$acc exit data detach (YD%VDELA)
  !$acc exit data delete (YD%VDELA)
ENDIF

LVDELB = ALLOCATED (YD%VDELB)
IF (LVDELB) THEN
  !$acc exit data detach (YD%VDELB)
  !$acc exit data delete (YD%VDELB)
ENDIF

LLDELETED = .FALSE.
IF (PRESENT (LDDELETED)) THEN
  LLDELETED = LDDELETED
ENDIF
IF (.NOT. LLDELETED) THEN
  !$acc exit data delete (YD)
ENDIF
END SUBROUTINE



END MODULE
