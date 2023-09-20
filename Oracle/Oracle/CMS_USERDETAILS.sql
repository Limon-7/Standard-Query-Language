 CREATE SEQUENCE  "CMS"."CMS_USERDETAILS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10322 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

  CREATE TABLE "CMS"."CMS_USERDETAILS" 
   (	"ID" NUMBER(*,0) NOT NULL ENABLE, 
	"USERNAME" NVARCHAR2(100) NOT NULL ENABLE, 
	"USERPASSWORD" NVARCHAR2(250) NOT NULL ENABLE, 
	"MOBILE" VARCHAR2(15 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"CREATEBY" NVARCHAR2(30), 
	"CREATEDATE" DATE DEFAULT SYSDATE, 
	"UPDATEBY" NVARCHAR2(30), 
	"UPDATEDATE" DATE, 
	"STATUS" VARCHAR2(10 BYTE), 
	"ROLEID" NUMBER NOT NULL ENABLE, 
	"LOCATIONCODE" VARCHAR2(5 CHAR), 
	"INVOICENO" NUMBER, 
	"CD" NUMBER, 
	"BILLCYCLE" NUMBER, 
	 CONSTRAINT "CMS_USERDETAILS_PK" PRIMARY KEY ("ID"),
	  CONSTRAINT "CMS_USERDETAILS_ROLE_ID_FK" FOREIGN KEY("ROLEID")  REFERENCES "CMS"."CMS_ROLE_MASTER"("ID")
   )
   
create or replace TRIGGER "CMS"."AUTOID_CMS_USERDETAILS" 
BEFORE INSERT
ON CMS.CMS_USERDETAILS 
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
tmpVar NUMBER;

BEGIN
   tmpVar := 0;

   SELECT CMS_USERDETAILS_SEQ.NEXTVAL INTO tmpVar FROM dual;
   :NEW.ID := tmpVar;

   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END AUTOID_CMS_USERDETAILS;