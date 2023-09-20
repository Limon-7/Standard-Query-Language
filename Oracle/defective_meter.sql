select DISTINCT DEFECTIVE_CODE, DEFECTIVE_DESC FROM BC_DEFECTIVE_CODE WHERE DEFECTIVE_CODE!='00' ORDER BY DEFECTIVE_CODE

SELECT DISTINCT substr(AREA_CODE,4,2) AS BILL_GROUP FROM EBC.BC_CUSTOMERS
SELECT DISTINCT AREA_CODE AS BILL_GROUP, Location_Code FROM EBC.BC_CUSTOMERS where Location_Code='J6'
SELECT DISTINCT substr(AREA_CODE,1,3) AS BILL_GROUP, Location_Code FROM EBC.BC_CUSTOMERS where Location_Code='J6'
select DISTINCT DEFECTIVE_CODE, DEFECTIVE_DESC FROM BC_DEFECTIVE_CODE WHERE DEFECTIVE_CODE!='00' ORDER BY DEFECTIVE_CODE

--defective meter
SELECT DISTINCT C.LOCATION_CODE LOC,
                            LM.DESCR AS OFFICE_NAME,
                            C.CONS_EXTG_NUM AS REG_ACC,
                            SUBSTR(C.AREA_CODE, 4, 2) BILL_GROUP,
                            SUBSTR(C.AREA_CODE, 1, 3) BOOK,
                            C.WALKING_SEQUENCE WLK_SEQ,
                            C.CUSTOMER_NUM || C.CHECK_DIGIT AS CONS_NUM,
                            C.CUSTOMER_NAME,
                            C.START_BILL_CYCLE,
                            B.METER_NUM_KWH,
                            B.METER_COND_KWH,
                            B.CONS_KWH_SR,
                            R.MAX_PAYMENT_DATE AS INVOICE_DUE_DATE,
                            B.TARIFF
                            FROM BC_CUSTOMERS C,
                            ebc.bc_bill_image b,
                            BC_LOCATION_MASTER LM,
                             (SELECT CUST_ID, MAX(RECEIPT_DATE) MAX_PAYMENT_DATE FROM EBC.BC_RECEIPT_HDR
                            GROUP BY CUST_ID) R
                            WHERE C.LOCATION_CODE = LM.LOCATION_CODE
                            AND b.CUST_ID = C.CUST_ID
                            AND C.CUST_ID = R.CUST_ID
                            AND B.METER_COND_KWH != '00' AND UPPER(BILL_STATUS) like '%E%'
                           AND C.LOCATION_CODE ='J6'
                            AND  B.BILL_CYCLE_CODE='202101'
                            AND  substr(C.AREA_CODE,4,2)='03'
                            AND  substr(C.AREA_CODE,1,3)='101' 
                            AND  B.METER_COND_KWH ='13'
                            ORDER BY C.LOCATION_CODE,SUBSTR(C.AREA_CODE, 1, 3),SUBSTR(C.AREA_CODE, 4, 2),C.CONS_EXTG_NUM
							
							
Data to check:
							
"locationCode": "J6",
  "billMonth": "202101",
  "billGroupId": "03",
  "bookId": "101",
  "meterConditionId": "13"
							
							
-- end of defective meter

--CustomerList

--check condition
var isLocationCodeExists = (dto.LocationCode != "0") ? true : false;
                    var isBillGroupId = (dto.BillGroupId != "0") ? true : false;
                    var isBookId = (dto.BookId!= "0") ? true : false; 
					
		+(isLocationCodeExists? (@" AND C.LOCATION_CODE =:LocationCode"):"")
                            + @" AND  B.BILL_CYCLE_CODE=:BillMonth"
                            + (isBillGroupId ? @" AND  substr(C.AREA_CODE,4,2)=:BillGroupId " : "")
                            + (isBookId ? @" AND  substr(C.AREA_CODE,1,3)=:BookId " : "")
select  b.CUSTOMER_NAME,
            c.ADDR_DESCR1,
            c.ADDR_DESCR2,
            substr(a.AREA_CODE,4,2) BILL_GROUP,
            substr(a.area_code,1,3) as BOOK,
            a.WALKING_SEQUENCE AS WLK_SEQ, 
            a.CUSTOMER_NUM||a.CONS_CHK_DIGIT CONS_NUM,
            a.CONS_EXTG_NUM AS REG_ACC,
            a.tariff,
            a.sanc_load,
            a.connect_load,
            a.meter_num_kwh 
            from bc_bill_image a,
            bc_customers b,bc_customer_addr c 
            where a.cust_id=b.cust_id 
            and a.cust_id=c.cust_id 
            and C.ADDR_TYPE='B'
            and c.ADDR_EXP_DATE IS NULL
            and a.total_bill>=0
            
            AND  A.bill_cycle_code ='202101'
            AND B.LOCATION_CODE ='J6'
            AND  substr(A.AREA_CODE,4,2)='01'
            AND  substr(A.AREA_CODE,1,3)='311'
            
            and a.invoice_num is not null 
            order by substr(a.AREA_CODE,4,2), a.WALKING_SEQUENCE asc,b.customer_name
			
			
Data to check:
							
"locationCode": "J6",
  "billMonth": "202101",
  "billGroupId": "03",
  "bookId": "101",
  "meterConditionId": "13"

-- end CustomerList

--MinistryDetailsRequestDto  Error
SELECT 
                    RUN_BILL_CYCLE,
                    BILL_CYCLE_CODE,
                    LOCATION_CODE,
                    LOC_DESC,
                    MINISTRY_CODE,
                    MINISTRY,
                    BOOK_NO,
                    TARIFF,
                    CUSTOMER_NUM,
                    CONS_EXTG_NUM,
                    CUSTOMER_NAME,
                    ADDRESS,
                    INVOICE_NUM,
                    ENERGY_ARR,
                    CURRENT_PRIN,
                    VAT_ARR,
                    CURRENT_VAT,
                    SURCHARGE_ARR,
                    CURRENT_LPS,
                    (NVL(CURRENT_PRIN,0)+NVL(CURRENT_VAT,0)+NVL(CURRENT_LPS,0)) AS CURRENT_BILL,
                    (NVL(CURRENT_PRIN,0)+NVL(CURRENT_VAT,0)+NVL(CURRENT_LPS,0)+NVL(ENERGY_ARR,0)+NVL(VAT_ARR,0)+NVL(SURCHARGE_ARR,0)) AS TOTAL_BILL
                 FROM BC_MINISTRY_CODE_+"databaseServiceName" 
                 WHERE
                 BILL_CYCLE_CODE <='202001' 
                 AND  MINISTRY_CODE ='57'
                 AND  LOCATION_CODE = 'J6'
               ORDER BY  MINISTRY,LOC_DESC,BILL_CYCLE_CODE,LOCATION_CODE,MINISTRY

data:
 public int CenterCode { get; set; }=7
        public string MinistryCode { get; set; }='06'
        public string LocationCode { get; set; }='J6'
        public string BillMonth { get; set; }="202012"
        public int ReportType { get; set; }=1

--end MinistryDetailsRequestDto

--ministry summery
	SELECT                  
		MINISTRY_CODE,
		MINISTRY,
		SUM(NVL(ENERGY_ARR,0)) ENERGY_ARR,
		SUM(NVL(CURRENT_PRIN,0)) CURRENT_PRIN,
		SUM(NVL(VAT_ARR,0)) VAT_ARR,
		SUM(NVL(CURRENT_VAT,0)) CURRENT_VAT,
		SUM(NVL(SURCHARGE_ARR,0)) SURCHARGE_ARR,
		SUM(NVL(CURRENT_LPS,0)) CURRENT_LPS,
		SUM(NVL(CURRENT_PRIN,0)+NVL(CURRENT_VAT,0)+NVL(CURRENT_LPS,0)) AS CURRENT_BILL,
		SUM(NVL(CURRENT_PRIN,0)+NVL(CURRENT_VAT,0)+NVL(CURRENT_LPS,0)+NVL(ENERGY_ARR+VAT_ARR,0)+NVL(SURCHARGE_ARR,0)) AS TOTAL_BILL,
		count(*) as NOC
                 FROM BC_MINISTRY_" + serviceName + @"
                 WHERE  BILL_CYCLE_CODE <= '202001'
				 LOCATION_CODE ='J6'
               GROUP BY  MINISTRY_CODE, MINISTRY
               ORDER BY  MINISTRY,MINISTRY
			   
data to check:
public int CenterCode { get; set; }=7 --to get Dabase service name 
        public string LocationCode { get; set; }='J6'
        public string BillMonth { get; set; }="202012"
        public int ReportType { get; set; }=1
--send Ministry summery

