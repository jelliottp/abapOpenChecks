*----------------------------------------------------------------------*
*       CLASS lcl_Test DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  FINAL.

  PRIVATE SECTION.
* ================

    DATA: mt_code   TYPE string_table,
          ms_result TYPE scirest_ad,
          mo_check  TYPE REF TO zcl_aoc_check_24.

    METHODS: setup,
             test001_01 FOR TESTING,
             test001_02 FOR TESTING.

ENDCLASS.       "lcl_Test

*----------------------------------------------------------------------*
*       CLASS lcl_Test IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test IMPLEMENTATION.
* ==============================

  DEFINE _code.
    append &1 to mt_code.
  END-OF-DEFINITION.

  METHOD setup.
    CREATE OBJECT mo_check.
  ENDMETHOD.                    "setup

  METHOD test001_01.
* ===========

    _code 'CHECK 1 = 2.'.
    _code 'CHECK 2 = 2.'.
    _code 'CHECK 3 = 2.'.
    _code 'CHECK 4 = 2.'.
    _code 'CHECK 5 = 2.'.
    _code 'CHECK 6 = 2.'.
    _code 'CHECK 7 = 2.'.
    _code 'CHECK 8 = 2.'.
    _code 'CHECK 9 = 2.'.
    _code 'CHECK 10 = 2.'.

    APPEND LINES OF mt_code TO mt_code.

    ms_result = zcl_aoc_unit_test=>check( it_code  = mt_code
                                          io_check = mo_check ).

    cl_abap_unit_assert=>assert_equals( exp = '001'
                                        act = ms_result-code ).

  ENDMETHOD.                    "test1

  METHOD test001_02.
* ===========

    _code 'LOOP AT lt_table INTO lv_structure.'.
    _code '  CHECK 1 = 2.                     '.
    _code 'ENDLOOP.                           '.

    ms_result = zcl_aoc_unit_test=>check( it_code  = mt_code
                                          io_check = mo_check ).

    cl_abap_unit_assert=>assert_initial( ms_result ).

  ENDMETHOD.                    "test2

ENDCLASS.       "lcl_Test