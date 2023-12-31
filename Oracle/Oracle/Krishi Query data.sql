--CREATE TABLE BC_KRISHI_DIVISION AS SELECT * FROM bc_municipal_zone; 
--SELECT * from BC_KRISHI_DIVISION

--CREATE TABLE BC_KRISHI_DIVISION_LOCATION AS SELECT * FROM bc_municipal_division; 
--SELECT * from BC_KRISHI_DIVISION_LOCATION
--TRUNCATE  table BC_KRISHI_DIVISION_LOCATION

--CREATE TABLE BC_KRISHI_CUSTOMERS AS SELECT * FROM bc_municipal_customers; 
--SELECT * from BC_KRISHI_CUSTOMERS
--TRUNCATE  table BC_KRISHI_CUSTOMERS

--SELECT DISTINCT CR.ZONE_ID,L.DBCONFIG_ID,DC.DBLINKID FROM BC_MUNICIPAL_CUSTOMERS C
--                            JOIN BC_MUNICIPAL_DIVISION D ON C.LOCATION_CODE = D.LOCATION_CODE
--                            JOIN BC_MUNICIPAL_CIRCLE CR ON D.CIRCLE_ID= CR.ID
--                            --JOIN BC_MUNICIPAL_ZONE Z ON CR.ZONE_ID = Z.ID
--                            JOIN BC_DB_LOCATION L ON L.ID = D.LOCATION_ID
--                            JOIN BC_DATABASE_CONFIG DC ON L.DBCONFIG_ID = DC.ID
--                            ORDER BY CR.ZONE_ID
                            

--INSERT INTO BC_KRISHI_CUSTOMERS (ID,CUSTOMER_NO,LOCATION_CODE,CUST_ID,CUSTOMER_NAMEBN,AGRICULTURE_LOCATIONBN) VALUES (
--3, 'Bn-name','J6','61',1
--)
SELECT * from BC_DB_LOCATION WHERE LOCATION_CODE='H3'

INSERT INTO BC_KRISHI_DIVISION_LOCATION (ID,NAMEBN,LOCATION_CODE,LOCATION_ID,DIV_LOCATION_ID) VALUES (
14, '','H3',87,1
)

-- krishi
select h.cust_id, G.LOCATION_CODE,sum(PRINCIPAL_AMT+PRINCIPAL_ADJ-PRINCIPAL_APPL) PRN,
                        sum(LPS_AMT+LPS_ADJ-LPS_APPL) LPS,
                        sum(VAT_AMT+VAT_ADJ-VAT_APPL) VAT,
                        SUM(PRINCIPAL_AMT+PRINCIPAL_ADJ-PRINCIPAL_APPL+LPS_AMT+LPS_ADJ-LPS_APPL+VAT_AMT+VAT_ADJ-VAT_APPL) TOTAL
                        from ebc.bc_invoice_hdr H
                        join ebc.bc_customers c on h.cust_id= c.cust_id
                        join ebc.bc_location_master G ON G.LOCATION_CODE = C.LOCATION_CODE
                        where  bill_cycle_code <='202109' AND 
                      H.CUST_ID IN(618650,76954,49386,354636,611223,611225,611224,611226,923631,611227,773508,923633,675816,549935,790239,493722,676850,537579) Group by G.LOCATION_CODE, h.cust_id
					  
					  
	select cid('77056326') from dual;
	
	
	--- krishi data
	
	


SELECT C.CUST_ID FROM BC_MUNICIPAL_CUSTOMERS C
                        JOIN BC_MUNICIPAL_DIVISION D ON C.LOCATION_CODE = D.LOCATION_CODE
                        JOIN BC_MUNICIPAL_CIRCLE CR ON D.CIRCLE_ID= CR.ID
                        JOIN BC_MUNICIPAL_ZONE Z ON CR.ZONE_ID = Z.ID
                        JOIN BC_DB_LOCATION L ON L.ID = D.LOCATION_ID
                        WHERE L.DBCONFIG_ID = 2 AND D.ISMUNICIPAL=1

-- update BC_MUNICIPAL_DIVISION set ISMUNICIPAL=1 where ISMUNICIPAL=0

SELECT DISTINCT Z.NAME,Z.NAMEBN,CR.ZONE_ID,L.DBCONFIG_ID,Z.CITYCORPORATIONNAMEBN FROM BC_MUNICIPAL_CUSTOMERS C
                            JOIN BC_MUNICIPAL_DIVISION D ON C.LOCATION_CODE = D.LOCATION_CODE
                            JOIN BC_MUNICIPAL_CIRCLE CR ON D.CIRCLE_ID= CR.ID
                            JOIN BC_MUNICIPAL_ZONE Z ON CR.ZONE_ID = Z.ID
                            JOIN BC_DB_LOCATION L ON L.ID = D.LOCATION_ID
                            JOIN BC_DATABASE_CONFIG DC ON L.DBCONFIG_ID = DC.ID
                            ORDER BY CR.ZONE_ID

--- porshor

SELECT DISTINCT  D.ID DIVISION_ID, D.NAME,D.NAMEBN,L.DBCONFIG_ID from BC_KRISHI_CUSTOMERS C
    join BC_KRISHI_DIVISION D on D.ID=C.Division_ID
    JOIN BC_KRISHI_DIVISION_LOCATION DL ON DL.LOCATION_CODE=C.LOCATION_CODE
    JOIN BC_DB_LOCATION L ON L.ID=DL.LOCATION_ID
    JOIN BC_DATABASE_CONFIG DC ON DC.ID=L.DBCONFIG_ID
    ORDER BY D.ID
    
    SELECT C.CUST_ID FROM BC_MUNICIPAL_CUSTOMERS C
                        JOIN BC_MUNICIPAL_DIVISION D ON C.LOCATION_CODE = D.LOCATION_CODE
                        JOIN BC_MUNICIPAL_CIRCLE CR ON D.CIRCLE_ID= CR.ID
                        JOIN BC_MUNICIPAL_ZONE Z ON CR.ZONE_ID = Z.ID
                        JOIN BC_DB_LOCATION L ON L.ID = D.LOCATION_ID
                        WHERE L.DBCONFIG_ID =7
    SELECT C.CUSTOMER_NO FROM BC_KRISHI_CUSTOMERS C
                        JOIN BC_KRISHI_DIVISION_LOCATION DL ON C.LOCATION_CODE = DL.LOCATION_CODE
                        JOIN BC_MUNICIPAL_DIVISION D ON D.ID = C.Division_ID
                        JOIN BC_DB_LOCATION L ON L.ID = DL.LOCATION_ID
                        WHERE L.DBCONFIG_ID = 2
                        
                        
    SELECT DISTINCT  D.ID DIVISION_ID,L.DBCONFIG_ID from BC_KRISHI_CUSTOMERS C
    join BC_KRISHI_DIVISION D on D.ID=C.Division_ID
    JOIN BC_KRISHI_DIVISION_LOCATION DL ON DL.LOCATION_CODE=C.LOCATION_CODE
    JOIN BC_DB_LOCATION L ON L.ID=DL.LOCATION_ID
    JOIN BC_DATABASE_CONFIG DC ON DC.ID=L.DBCONFIG_ID
    ORDER BY D.ID
-- get all customers with divisin    
    select C.CUST_ID, C.CUSTOMER_NO, C.LOCATION_CODE, C.CUSTOMER_NAMEBN, C.AGRICULTURE_LOCATIONBN, D.NAMEBN,C.CON_EXTG_NUM, DL.NAMEBN PROVIDER_NAME 
    from BC_KRISHI_CUSTOMERS C
    join BC_KRISHI_DIVISION D on D.ID=C.DIVISION_ID
    join BC_KRISHI_DIVISION_LOCATION DL ON DL.LOCATION_CODE=C.LOCATION_CODE
    
    update BC_KRISHI_CUSTOMERS set AGRICULTURE_LOCATIONBN='সিলেট সদর, সিলেট' where LOCATION_CODE='H3'
    
    SELECT Distinct  L.DBCONFIG_ID from BC_KRISHI_CUSTOMERS C
                                join BC_KRISHI_DIVISION D on D.ID=C.Division_ID
                                JOIN BC_KRISHI_DIVISION_LOCATION DL ON DL.LOCATION_CODE=C.LOCATION_CODE
                                JOIN BC_DB_LOCATION L ON L.ID=DL.LOCATION_ID
                                JOIN BC_DATABASE_CONFIG DC ON DC.ID=L.DBCONFIG_ID
                                ORDER BY  L.DBCONFIG_ID
    
    
	-- end of krishi data