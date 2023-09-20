SELECT CID(73573434) from dual

Select *from BC_CUSTOMERS Where Cust_ID=720717324 

SELECT nvl(BC_BILL_IMAGE.XF_LOSS_SR_CONS, nvl(BC_BILL_IMAGE.XF_LOSS_OFPK_CONS, 0.00)) as XF_LOSS_OFPK_CONS,
                             nvl(BC_BILL_IMAGE.PFC_SR_CONS, nvl(BC_BILL_IMAGE.PFC_OFPK_CONS, 0.00)) as PFC_OFPK_CONS,
                             nvl(BC_BILL_IMAGE.OLD_KWH_SR_CONS, nvl(BC_BILL_IMAGE.OLD_KWH_OFPK_CONS, 0.00)) as OLD_KWH_SR_CONS ,
                             nvl(BC_BILL_IMAGE.XF_LOSS_PK_CONS, 0.00) as XF_LOSS_PK_CONS,
                             nvl(BC_BILL_IMAGE.PFC_PK_CONS, 0.00) as PFC_PK_CONS,
                             nvl(BC_BILL_IMAGE.OLD_KWH_PK_CONS, 0.00) as OLD_KWH_PK_CONS,
                             nvl(BC_BILL_IMAGE.CLS_KWH_SR_RDNG, nvl(CLS_KWH_OFPK_RDNG, 0.00)) as CLS_KWH_SR_RDNG,
                             nvl(BC_BILL_IMAGE.OPN_KWH_SR_RDNG, nvl(OPN_KWH_OFPK_RDNG, 0.00)) as OPN_KWH_SR_RDNG,
                             nvl(BC_BILL_IMAGE.CONS_KWH_SR, nvl(CONS_KWH_OFPK, 0.00)) as CONS_KWH_SR,
                             nvl(BC_BILL_IMAGE.CLS_KWH_PK_RDNG, 0.00) as CLS_KWH_PK_RDNG,
                             nvl(BC_BILL_IMAGE.OPN_KWH_PK_RDNG, 0.00) as OPN_KWH_PK_RDNG,
                             nvl(BC_BILL_IMAGE.CONS_KWH_PK, 0.00) as CONS_KWH_PK,
                             nvl(BC_BILL_IMAGE.CLS_KVARH_SR_RDNG, nvl(BC_BILL_IMAGE.CLS_KVARH_OFPK_RDNG, 0.00)) as CLS_KVARH_SR_RDNG,
                             nvl(BC_BILL_IMAGE.OPN_KVARH_SR_RDNG, nvl(OPN_KVARH_OFPK_RDNG, 0.00)) as OPN_KVARH_SR_RDNG,
                             nvl(BC_BILL_IMAGE.CONS_KVARH_SR, nvl(CONS_KWH_OFPK, 0.00)) as CONS_KVARH_SR ,
                             nvl(BC_BILL_IMAGE.CLS_KVARH_PK_RDNG, 0.00) as CLS_KVARH_PK_RDNG,
                             nvl(BC_BILL_IMAGE.OPN_KVARH_PK_RDNG, 0.00) as OPN_KVARH_PK_RDNG,
                             nvl(BC_BILL_IMAGE.CONS_KVARH_PK, 0.00) as CONS_KVARH_PK,
                             nvl(BC_BILL_IMAGE.ENG_CHRG_SR, 0.00) as ENG_CHRG_SR,
                             nvl(BC_BILL_IMAGE.ENG_CHRG_OFPK, 0.00) as ENG_CHRG_OFPK,
                             nvl(BC_BILL_IMAGE.ENG_CHRG_PK, 0.00) as ENG_CHRG_PK,
                             nvl(BC_BILL_IMAGE.DEMAND_CHRG, 0.00) as DEMAND_CHRG,
                             nvl(BC_BILL_IMAGE.MINIMUM_CHRG, 0.00) as MINIMUM_CHRG,
                             nvl(BC_BILL_IMAGE.SERVICE_CHRG, 0.00) as SERVICE_CHRG,
                             nvl(BC_BILL_IMAGE.XF_LOSS_CHRG, 0.00) as XF_LOSS_CHRG,
                             nvl(BC_BILL_IMAGE.XF_RENT, 0.00) as XF_RENT,
                             nvl(BC_BILL_IMAGE.PFC_CHARGE, 0.00) as PFC_CHARGE,
                             nvl(BC_BILL_IMAGE.ADJUSTED_PRN, 0.00) as ADJUSTED_PRN,
                             nvl(BC_BILL_IMAGE.ADJUSTED_LPS, 0.00) as ADJUSTED_LPS,
                             nvl(BC_BILL_IMAGE.ADJUSTED_VAT, 0.00) as ADJUSTED_VAT,
                             nvl(BC_BILL_IMAGE.ARR_ADV_ADJ_PRN, 0.00) as ARR_ADV_ADJ_PRN,
                             (nvl(BC_BILL_IMAGE.ARR_ADV_ADJ_LPS, 0.00) + nvl(CURRENT_LPS, 0.00)) as ARR_ADV_ADJ_LPS,
                             nvl(BC_BILL_IMAGE.ARR_ADV_ADJ_VAT, 0.00) as ARR_ADV_ADJ_VAT,
                             SUBSTR(BC_BILL_IMAGE.INVOICE_NUM,
                                     1,
                                     (LENGTH(BC_BILL_IMAGE.INVOICE_NUM) - 1))
                                AS BILL_NO,
                             (SUBSTR(BC_BILL_IMAGE.INVOICE_NUM, -1, 1) || INVOICE_CHK_DGT) AS CD,
                             (BC_BILL_IMAGE.CUSTOMER_NUM || CONS_CHK_DIGIT ) AS CONSUMER_NUM,
                           SUBSTR(BC_BILL_IMAGE.AREA_CODE, 1, 3) AS BOOK_NO,
                             BC_BILL_IMAGE.*,BC_CUSTOMERS.CUSTOMER_NAME,BC_CUSTOMER_ADDR.ADDR_DESCR1,
                             BC_CUSTOMER_ADDR.ADDR_DESCR2,
                             BC_CUSTOMER_ADDR.ADDR_DESCR3,
                             BC_CUSTOMER_ADDR.PIN_CODE,
                             BC_CUSTOMER_ADDR.CITY,
                             BC_CUSTOMER_ADDR.DISTRICT,
                             BC_CUSTOMER_ADDR.VILLAGE,
                             to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY') as Bill_Month_Present,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -1) as month1,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -2) as month2,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -3) as month3,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -4) as month4,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -5) as month5,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -6) as month6,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -7) as month7,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -8) as month8,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -9) as month9,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -10) as month10,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -11) as month11,
                             add_months(to_date(substr(BILL_CYCLE_CODE, 5, 2) || '/' || '01' || '/' || substr(BILL_CYCLE_CODE, 1, 4), 'MM/DD/YYYY'), -12) as month12,
                             BC_LOCATION_MASTER.LOCATION_CODE3,BC_LOCATION_MASTER.DESCR,
                             EBC.BC_BANK_BRANCHES.BRANCH_NAME,
                             EBC.BC_BANK_BRANCHES.ADDRESS_LINE1,
                             EBC.BC_BANKS.BANK_NAME,
                             '' as BANK_NAME2,
                             '' as BRANCH_NAME2,
                             EBC.BC_CUSTOMER_BANK.BANK_CODE,
                             EBC.BC_CUSTOMER_BANK.BRANCH_CODE

                                                 from EBC.BC_BILL_IMAGE inner join EBC.BC_CUSTOMERS on BC_CUSTOMERS.CUST_ID = BC_BILL_IMAGE.CUST_ID
                                                 inner join EBC.BC_CUSTOMER_ADDR on BC_CUSTOMER_ADDR.CUST_ID = BC_BILL_IMAGE.CUST_ID
                                                 inner join EBC.BC_CUSTOMER_BANK on BC_CUSTOMER_BANK.CUST_ID = BC_CUSTOMERS.CUST_ID
                                                 left join EBC.BC_BANK_BRANCHES on BC_BANK_BRANCHES.BANK_BRANCH_ID = BC_CUSTOMER_BANK.BANK_BRANCH_ID
                                                 left join EBC.BC_BANKS on BC_BANKS.BANK_CODE = BC_CUSTOMER_BANK.BANK_CODE
                                                 inner join BC_LOCATION_MASTER on BC_LOCATION_MASTER.LOCATION_CODE = BC_BILL_IMAGE.LOCATION_CODE 
                            WHERE BC_BILL_IMAGE.CUSTOMER_NUM=73573434 and BILL_CYCLE_CODE='202103'
                            AND BC_CUSTOMER_ADDR.ADDR_TYPE='B' AND BC_CUSTOMER_BANK.EXP_DATE IS NULL AND EBC.BC_CUSTOMER_ADDR.ADDR_EXP_DATE IS NULL  
                            AND BC_CUSTOMERS.LOCATION_CODE ='J7'