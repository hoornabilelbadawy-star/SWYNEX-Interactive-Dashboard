
 USE CustomerPersonality


 SELECT * 
 FROM CustomerPersonality;

 -------------------------KPIS
 SELECT 
 FORMAT( COUNT (ID) ,'N0') CUSTOMERS ,
 FORMAT( SUM ( INCOME_CLEANED), 'N0') INCOME ,
 FORMAT( SUM (TOTALSPEND),'N0') TOTAL_SPEND ,
 FORMAT( SUM ( NUMOFPURCHASES),'N0') NUMOFPURCHASES

 FROM CustomerPersonality ; 



---------------------------------------------------- CUSTOMERS INCOME
 SELECT 
 COUNT(ID) AS TOTAL_CUSTOMERS,
 FORMAT (SUM(INCOME_CLEANED),'N0')  AS TOTAL_INCOME ,
 FORMAT (AVG(INCOME_CLEANED),'N0')  AS AVG_INCOME ,
 FORMAT (MAX(INCOME_CLEANED),'N0') AS MAX_INCOME ,
 FORMAT (MIN(INCOME_CLEANED),'N0') AS MIN_INCOME 
 FROM CustomerPersonality;


 ------------------------------------------------ PRODUCTS SALES


 SELECT 
 FORMAT (SUM(MNTWINES),'N0') WINS,
 FORMAT (SUM(MNTFRUITS),'N0') FRUITS,
 FORMAT (SUM(MNTMEATPRODUCTS),'N0') MEAT,
 FORMAT (SUM( MNTFISHPRODUCTS),'N0') FISH ,
 FORMAT (SUM( MNTSWEETPRODUCTS),'N0') SWEET,
 FORMAT (SUM( MNTGOLDPRODS),'N0') GOLD ,
 FORMAT (SUM( TOTALSPEND),'N0') TOTAL
 FROM CustomerPersonality ; 

 --------------------------- PURCHCHASES 
 SELECT 
 FORMAT( SUM( NUMWEBPURCHASES),'N0')  WEB_PURCHASES ,
 FORMAT( SUM( NumCatalogPurchases),'N0') CATALOG_PURCHASES ,
 FORMAT( SUM( NumStorePurchases),'N0') STORE_PURCHASES ,
 FORMAT( SUM( NumOfPurchases),'N0') TOTAL_PURCHASES
 FROM CustomerPersonality 
 
 ----------------------------  CAMPAIN 
 SELECT  _1stCmp AS CAMPAIGN ,
 COUNT (_1stCmp) AS FISRTCMP,
 COUNT (_2ndCmp) AS SECONDCMP,
 COUNT (_3rdCmp) AS THIRDCMP,
 COUNT (_4thCmp) AS FOURTHCMP,
 COUNT (_5thCmp) AS FIFTHCMP
 FROM CustomerPersonality
 GROUP BY _1stCmp

 -------------------------------- INCOME VS. SPENDING
 CREATE VIEW   INCOME_VS_SPENDING AS
 SELECT
    CASE 
       WHEN Income_cleaned < 30000 THEN 'VERY LOW'
       WHEN Income_cleaned < 90000 THEN ' LOW'
       WHEN Income_cleaned < 150000 THEN 'MEDIUM' 
       WHEN Income_cleaned < 250000 THEN 'HIGH'
          ELSE 'VERY HIGHT'
                   END AS INCOME_GRUP, 
     COUNT(*) AS CUSTOMERS ,
     AVG(TOTALSPEND) AS AVG_SPENDING
  FROM CustomerPersonality
  WHERE Income_cleaned IS NOT NULL 
  GROUP BY 
      CASE 
       WHEN Income_cleaned < 30000 THEN 'VERY LOW'
       WHEN Income_cleaned < 90000 THEN ' LOW'
       WHEN Income_cleaned < 150000 THEN 'MEDIUM' 
       WHEN Income_cleaned < 250000 THEN 'HIGH'
          ELSE 'VERY HIGHT'
                   END 
  ;
  