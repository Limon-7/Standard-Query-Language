CREATE TABLE "EBCWEB"."Pouroshova" 
   (
    "ID" NUMBER(*,0), 
	"DB_ID" NUMBER(*,0), 
	"ZONE_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(200), 
	"NAMEBN" NVARCHAR2(200),
	CONSTRAINT "Pouroshova_Pk" PRIMARY KEY ("ID")
   )
   
   CREATE TABLE "EBCWEB"."Pouroshova_Consumers" 
   (	
    "ID" NUMBER(*,0), 
	"Pouroshova_ID" NUMBER(*,0), 
	"Cust_ID" NUMBER(*,0), 
	"Consumer_No" VARCHAR2(200), 
	CONSTRAINT "Pouroshova_Consumers_Pk" PRIMARY KEY ("ID")
   )
   
   CREATE TABLE "EBCWEB"."Zone_Consumers" 
   (	
	"ID" NUMBER(*,0), 
	"DB_ID" NUMBER(*,0), 
	"Zone_ID" NUMBER(*,0), 
	"Cust_ID" NUMBER(*,0), 
	"Consumer_No" VARCHAR2(200), 
	CONSTRAINT "Zone_Consumers_pk" PRIMARY KEY ("ID")
   )