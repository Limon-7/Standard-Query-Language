--------------------------------------------------------
--  File created - Sunday-August-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BC_KRISHI_DIVISION_LOCATION
--------------------------------------------------------

  CREATE TABLE "EBCWEB"."BC_KRISHI_DIVISION_LOCATION" 
   (	"ID" NUMBER(*,0), 
	"NAME" NVARCHAR2(200), 
	"NAMEBN" NVARCHAR2(200), 
	"LOCATION_CODE" NVARCHAR2(10), 
	"LOCATION_ID" NUMBER(*,0), 
	"ISBANGLAREPORT" NUMBER(*,0) DEFAULT 0, 
	"DIV_LOCATION_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into EBCWEB.BC_KRISHI_DIVISION_LOCATION
SET DEFINE OFF;
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (1,null,'?????? ??????','K6',64,1,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (2,null,'??????, ?????????-?(??????)','M2',68,1,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (3,null,'??????,????????,?????????
,????????,?????????','K1',50,1,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (4,null,'??????,???? ?????,?????????,????????,?????????','K2',51,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (5,null,'?????????? ??????? ??????','K4',53,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (6,null,'??????-?,????????','T1',89,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (7,null,'??????, ??????,?????????','E3',97,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (8,null,'??????, ?????,?????????','W4',126,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (9,null,'??????, ?????????,?????????','N2',102,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (10,null,'??????, ??????????,?????????','N4',104,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (11,null,'??????, ?????????,?????????','N1',101,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (12,null,'??????, ????????,?????????','E1',1,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (13,null,'????????? ??????? ??????','G6',86,0,1);
Insert into EBCWEB.BC_KRISHI_DIVISION_LOCATION (ID,NAME,NAMEBN,LOCATION_CODE,LOCATION_ID,ISBANGLAREPORT,DIV_LOCATION_ID) values (14,null,'??????? ? ?????  ?????-?, ???????, ?????','H3',87,0,1);
--------------------------------------------------------
--  Constraints for Table BC_KRISHI_DIVISION_LOCATION
--------------------------------------------------------

  ALTER TABLE "EBCWEB"."BC_KRISHI_DIVISION_LOCATION" MODIFY ("ID" NOT NULL ENABLE);



/* --report data
বিবিবি, ভালুকা
বিবিবি, ময়মনসিংহ-২(দক্ষিন)
বিবিবি,বাজিতপুর,কিশোরগঞ্জ
বিবিবি,ভৈরব বাজার,কিশোরগঞ্জ
কুলিয়ারচর বিদ্যুৎ সরবরাহ
বিবিবি-১,টাঙ্গাইল
বিবিবি, ষোলশহর,চট্টগ্রাম
বিবিবি, খুলশী,চট্টগ্রাম
বিবিবি, হাটহাজারী,চট্টগ্রাম
বিবিবি, বাড়বকুন্ড,চট্টগ্রাম
বিবিবি, ফৌজদারহাট,চট্টগ্রাম
বিবিবি, পাথরঘাটা,চট্টগ্রাম
জৈন্তাপুর বিদ্যুৎ সরবরাহ
বিক্রয় ও বিতরণ  বিভাগ-৩, বাবিউবো, সিলেট  
*/