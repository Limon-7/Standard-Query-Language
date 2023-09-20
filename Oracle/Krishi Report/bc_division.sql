--------------------------------------------------------
--  File created - Sunday-August-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BC_KRISHI_DIVISION
--------------------------------------------------------

  CREATE TABLE "EBCWEB"."BC_KRISHI_DIVISION" 
   (	"ID" NUMBER(*,0), 
	"NAME" NVARCHAR2(200), 
	"NAMEBN" NVARCHAR2(200)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into EBCWEB.BC_KRISHI_DIVISION
SET DEFINE OFF;
Insert into EBCWEB.BC_KRISHI_DIVISION (ID,NAME,NAMEBN) values (1,'Poultry Industry','???????? ????? ?????');
Insert into EBCWEB.BC_KRISHI_DIVISION (ID,NAME,NAMEBN) values (2,'Agriculture Industry','??????????? ?????');
--------------------------------------------------------
--  Constraints for Table BC_KRISHI_DIVISION
--------------------------------------------------------

  ALTER TABLE "EBCWEB"."BC_KRISHI_DIVISION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "EBCWEB"."BC_KRISHI_DIVISION" MODIFY ("NAME" NOT NULL ENABLE);
