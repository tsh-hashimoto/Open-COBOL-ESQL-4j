      ******************************************************************
      *  Open Cobol ESQL (Ocesql) Sample Program
      *
      *  INSERTTBL -- demonstrates CONNECT, DROP TABLE, CREATE TABLE, 
      *               INSERT rows, COMMIT, ROLLBACK, DISCONNECT
      *
      *  Copyright 2013 Tokyo System House Co., Ltd.
      ******************************************************************
       IDENTIFICATION              DIVISION.
      ******************************************************************
       PROGRAM-ID.                 INSERTTBL.
       AUTHOR.                     TSH.
       DATE-WRITTEN.               2013-06-28.

      ******************************************************************
       DATA                        DIVISION.
      ******************************************************************
       WORKING-STORAGE             SECTION.
       01  TEST-DATA.
                                       *>"---+++++++++++++++++++++----"
        03 FILLER       PIC X(28) VALUE "0001HOKKAI TARO         0400".
        03 FILLER       PIC X(28) VALUE "0002AOMORI JIRO         0350".
        03 FILLER       PIC X(28) VALUE "0003AKITA SABURO        0300".
        03 FILLER       PIC X(28) VALUE "0004IWATE SHIRO         025p".
        03 FILLER       PIC X(28) VALUE "0005MIYAGI GORO         020p".
        03 FILLER       PIC X(28) VALUE "0006FUKUSHIMA RIKURO    0150".
        03 FILLER       PIC X(28) VALUE "0007TOCHIGI SHICHIRO    010p".
        03 FILLER       PIC X(28) VALUE "0008IBARAKI HACHIRO     0050".
        03 FILLER       PIC X(28) VALUE "0009GUMMA KURO          020p".
        03 FILLER       PIC X(28) VALUE "0010SAITAMA JURO        0350".
        *> 03 FILLER       PIC X(28) VALUE "0001HOKKAI TARO       0400".
        *> 03 FILLER       PIC X(28) VALUE "0002AOMORI JIRO       0350".
        *> 03 FILLER       PIC X(28) VALUE "0003AKITA SABURO      0300".
        *> 03 FILLER       PIC X(28) VALUE "0004IWATE SHIRO       0250".
        *> 03 FILLER       PIC X(28) VALUE "0005MIYAGI GORO       0200".
        *> 03 FILLER       PIC X(28) VALUE "0006FUKUSHIMA RIKURO  0150".
        *> 03 FILLER       PIC X(28) VALUE "0007TOCHIGI SHICHIRO  0100".
        *> 03 FILLER       PIC X(28) VALUE "0008IBARAKI HACHIRO   0050".
        *> 03 FILLER       PIC X(28) VALUE "0009GUMMA KURO        0200".
        *> 03 FILLER       PIC X(28) VALUE "0010SAITAMA JURO      0350".
        *> 03 FILLER       PIC X(28) VALUE "0001北海　太郎          0400".
        *> 03 FILLER       PIC X(28) VALUE "0002青森　次郎          0350".
        *> 03 FILLER       PIC X(28) VALUE "0003秋田　三郎          0300".
        *> 03 FILLER       PIC X(28) VALUE "0004岩手　四郎          025p".
        *> 03 FILLER       PIC X(28) VALUE "0005宮城　五郎          020p".
        *> 03 FILLER       PIC X(28) VALUE "0006福島　六郎          0150".
        *> 03 FILLER       PIC X(28) VALUE "0007栃木　七郎          010p".
        *> 03 FILLER       PIC X(28) VALUE "0008茨城　八郎          0050".
        *> 03 FILLER       PIC X(28) VALUE "0009群馬　九郎          020p".
        *> 03 FILLER       PIC X(28) VALUE "0010埼玉　十郎          0350".
       01  TEST-DATA-R   REDEFINES TEST-DATA.
         03  TEST-TBL    OCCURS  10.
           05  TEST-NO             PIC S9(04).
           05  TEST-NAME           PIC  X(20).
           05  TEST-SALARY         PIC S9(04).
       01  IDX                     PIC  9(02).
       01  SYS-TIME                PIC  9(08).
 
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME                  PIC  X(30) VALUE SPACE.
       01  USERNAME                PIC  X(30) VALUE SPACE.
       01  PASSWD                  PIC  X(10) VALUE SPACE.
       01  EMP-REC-VARS.
         03  EMP-NO                PIC S9(04) VALUE ZERO.
         03  EMP-NAME              PIC  X(20).
         03  EMP-SALARY            PIC S9(04) VALUE ZERO.
      *01  EMP-NO                PIC S9(04) VALUE ZERO.
      *01  EMP-NAME              PIC  X(20).
      *01  EMP-SALARY            PIC S9(04) VALUE ZERO.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.

OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".
      ******************************************************************
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(24) VALUE
OCESQL     "DROP TABLE IF EXISTS EMP".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(135) VALUE
OCESQL     "CREATE TABLE EMP ( EMP_NO NUMERIC(4, 0) NOT NULL, EMP_NAME"
OCESQL  &  " CHAR(20), EMP_SALARY NUMERIC(4, 0), CONSTRAINT IEMP_0 PRI"
OCESQL  &  "MARY KEY (EMP_NO) )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(53) VALUE
OCESQL     "INSERT INTO EMP VALUES (46, 'KAGOSHIMA ROKURO', -320)".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(52) VALUE
OCESQL     "INSERT INTO EMP VALUES (47, 'OKINAWA SHICHIRO', 480)".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0005.
OCESQL     02  FILLER PIC X(34) VALUE
OCESQL     "INSERT INTO EMP VALUES ( ?, ?, ? )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0006.
OCESQL     02  FILLER PIC X(14) VALUE
OCESQL     "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       PROCEDURE                   DIVISION.
      ******************************************************************
       MAIN-RTN.
           DISPLAY "*** INSERTTBL STARTED ***".

      *    WHENEVER IS NOT YET SUPPORTED :(
      *      EXEC SQL WHENEVER SQLERROR PERFORM ERROR-RTN END-EXEC.
           
      *    CONNECT
           MOVE  "testdb"          TO   DBNAME.
           MOVE  "test_user"        TO   USERNAME.
           MOVE  "test"        TO   PASSWD.
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 30
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 30
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO PERFORM ERROR-RTN STOP RUN.
           display "CONNECT...OK".
           
      *    DROP TABLE
OCESQL*    EXEC SQL
OCESQL*        DROP TABLE IF EXISTS EMP
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0001
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO PERFORM ERROR-RTN.
           display "DROP...OK".
           
      *    CREATE TABLE 
OCESQL*    EXEC SQL
OCESQL*         CREATE TABLE EMP
OCESQL*         (
OCESQL*             EMP_NO     NUMERIC(4,0) NOT NULL,
OCESQL*             EMP_NAME   CHAR(20),
OCESQL*             EMP_SALARY NUMERIC(4,0),
OCESQL*             CONSTRAINT IEMP_0 PRIMARY KEY (EMP_NO)
OCESQL*         )
OCESQL*    END-EXEC
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL     END-CALL
           IF  SQLCODE NOT = ZERO PERFORM ERROR-RTN STOP RUN.
           display "CREATE TABLE...OK".
           
      *    INSERT ROWS USING LITERAL
OCESQL*    EXEC SQL
OCESQL*         INSERT INTO EMP VALUES (46, 'KAGOSHIMA ROKURO', -320)
OCESQL*>        INSERT INTO EMP VALUES (46, '�������@�Z�Y', -320)
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0003
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO PERFORM ERROR-RTN.
           display "INSERT ROWS USING LITERAL...OK".

OCESQL*    EXEC SQL
OCESQL*         INSERT INTO EMP VALUES (47, 'OKINAWA SHICHIRO', 480)
OCESQL*>        INSERT INTO EMP VALUES (47, '����@���Y', 480)
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO PERFORM ERROR-RTN.
           display "INSERT ROWS USING LITERAL...OK".

      *    INSERT ROWS USING HOST VARIABLE
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 10
              MOVE TEST-NO(IDX)     TO  EMP-NO
              MOVE TEST-NAME(IDX)   TO  EMP-NAME
              MOVE TEST-SALARY(IDX) TO  EMP-SALARY
      *>        ***** DEBUG *****
              display "Inserting: " EMP-NO " " EMP-NAME " " EMP-SALARY
      *>        **********
OCESQL*       EXEC SQL
OCESQL*          INSERT INTO EMP VALUES
OCESQL*                 (:EMP-NO,:EMP-NAME,:EMP-SALARY)
OCESQL*       END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 3
OCESQL          BY VALUE 4
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE EMP-NO
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE EMP-NAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 3
OCESQL          BY VALUE 4
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE EMP-SALARY
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0005
OCESQL          BY VALUE 3
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              IF  SQLCODE NOT = ZERO 
                  display "INSERT ROWS USING HOST VARIABLE...ERROR"
                  PERFORM ERROR-RTN
                  EXIT PERFORM
      *>        ***** DEBUG *****
              ELSE
                  display "INSERT ROWS USING HOST VARIABLE...OK"
      *>        **********
              END-IF
           END-PERFORM.

      *    COMMIT
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           
      *    DISCONNECT
OCESQL*    EXEC SQL
OCESQL*        DISCONNECT ALL
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           
      *    END
           DISPLAY "*** INSERTTBL FINISHED ***".
           STOP RUN.

      ******************************************************************
       ERROR-RTN.
      ******************************************************************
           DISPLAY "*** SQL ERROR ***".
           DISPLAY "SQLCODE: " SQLCODE " " NO ADVANCING.
           EVALUATE SQLCODE
              WHEN  +10
                 DISPLAY "Record not found"
              WHEN  -01
                 DISPLAY "Connection falied"
              WHEN  -20
                 DISPLAY "Internal error"
              WHEN  -30
                 DISPLAY "PostgreSQL error"
                 DISPLAY "ERRCODE: "  SQLSTATE
                 DISPLAY SQLERRMC
              *> TO RESTART TRANSACTION, DO ROLLBACK.
OCESQL*          EXEC SQL
OCESQL*              ROLLBACK
OCESQL*          END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ROLLBACK" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE: "  SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
      ******************************************************************  
