MODULE MODEL_DIAGNOSTICS_MOD
  USE YOMLDDH , ONLY : TLDDH
  USE YOMSPDDH, ONLY : TSPDDH
  IMPLICIT NONE

  TYPE MODEL_DIAGNOSTICS_TYPE

  TYPE(TLDDH)              :: YRLDDH
  TYPE(TSPDDH)             :: YRSPDDH

  END TYPE MODEL_DIAGNOSTICS_TYPE

END MODULE MODEL_DIAGNOSTICS_MOD
