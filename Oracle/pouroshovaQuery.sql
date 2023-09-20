select p.Id, Name,namebn,location_code,db_id from pouroshova p

-- CHITTAGONG- DB_ID=2
-- UPDATE ZONE_CONSUMERS SET db_id=2 WHERE location_code IN ('E1','E2','E3','E4','E5','E6','N1','N2','N3','N4','R1','R2','R3','R4','R5','R6','R7','R8','R9','S1','S2','S3','S4','S5','S6','S7','S8','S9','W1','W2','W3','W4','W5','W6','RD','RM','RP','NS','RO','RT','RR','N5')
-- COMMILLA DB ID=5: ('B1','B2','B5','B6','B7','B8','C1','C2','C3','C6','C7','D1','D2','D3','D6','D7','C8')

-- DBID=12:IN('G2','G5','G6','G7','H1','H2','H3','H7','H8')
-- DBID=9:IN('H4','H5','H6')
--DBID=10: IN('J1','J2','J3','J4','J5','J8','K6','K7','K8','M1','M2','M3','M4','M5','M6','M7','M8','M9')
--DBID=8: IN('K1','K2','K3','K4','K5')
--DBID=13: IN('T1','T2','T3','T4','T5','T6','T7')


--cITYCORPORATION DATA 
DELETE  FROM ZONE_CONSUMERS WHERE ZONE_ID=1 AND LOCATION_CODE NOT  IN('E1','E2','E3','E4','E5','E6','N1','N2','N3','N4','S2','W1','W2','W3','W4','W5','W6')