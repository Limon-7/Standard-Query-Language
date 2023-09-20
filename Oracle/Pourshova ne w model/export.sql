--------------------------------------------------------
--  File created - Tuesday-September-14-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BC_MUNICIPAL_CIRCLE
--------------------------------------------------------

  CREATE TABLE "EBCWEB"."BC_MUNICIPAL_CIRCLE" 
   (	"ID" NUMBER(*,0), 
	"ZONE_ID" NUMBER(*,0), 
	"NAME" NVARCHAR2(200), 
	"NAMEBN" NVARCHAR2(200)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into EBCWEB.BC_MUNICIPAL_CIRCLE
SET DEFINE OFF;
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (5,1,'Rangamati',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (1,1,'Chittagong North',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (2,1,'Chittagong South',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (3,1,'Chittagong East',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (4,1,'Chittagong West',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (6,2,'Comilla',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (7,2,'Noakhali',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (8,3,'Sylhet',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (9,3,'Moulvibazar',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (10,4,'Mymensingh',null);
Insert into EBCWEB.BC_MUNICIPAL_CIRCLE (ID,ZONE_ID,NAME,NAMEBN) values (11,4,'Tangail',null);
--------------------------------------------------------
--  DDL for Index BC_MUNICIPAL_CIRCLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EBCWEB"."BC_MUNICIPAL_CIRCLE_PK" ON "EBCWEB"."BC_MUNICIPAL_CIRCLE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BC_MUNICIPAL_CIRCLE
--------------------------------------------------------

  ALTER TABLE "EBCWEB"."BC_MUNICIPAL_CIRCLE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "EBCWEB"."BC_MUNICIPAL_CIRCLE" MODIFY ("ZONE_ID" NOT NULL ENABLE);
  ALTER TABLE "EBCWEB"."BC_MUNICIPAL_CIRCLE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "EBCWEB"."BC_MUNICIPAL_CIRCLE" ADD CONSTRAINT "BC_MUNICIPAL_CIRCLE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
