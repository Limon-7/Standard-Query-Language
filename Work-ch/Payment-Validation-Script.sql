--1. /api/Script/CreateProductPlan
-- Basic Plan Validation
Select p."ProductId", pp."ProductPlanId", p."RecurringInterval", pp."RecurringInterval" from "Products" as p 
    left join "ProductPlans" as pp 
    on pp."ProductPlanId" = p."ProductId" where pp."IsPro" is False;

-- Pro Plan Validation
Select p."ProductId", pp."ProductPlanId", p."RecurringInterval", pp."RecurringInterval" from "Products" as p
               left join "ProductPlans" as pp 
                    on pp."ProductPlanId" = p."ProductId" where pp."IsPro" is True;

--2. /api/Script/UpdateParentSubscriptionPeriod: Parent Subscription Period validations script
Select q."UserId", 
       min(p."CurrentPeriodStart")as MinChildStartDate, max(p."CurrentPeriodEnd")as MaxChildExpireDate, 
       min(q."CurrentPeriodStart") as MinParentStartDate, max(q."CurrentPeriodEnd") as MaxParentStartDate from 
              (Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd",u."GuardianId" from "Subscriptions" as s
    join "AspNetUsers" as u on u."Id"=s."UserId" where u."GuardianId" is not null) as p 
    join (Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd",u."GuardianId" from "Subscriptions" as s
    join "AspNetUsers" as u on u."Id"=s."UserId" where u."GuardianId" is null) as q on p."GuardianId"=q."UserId"
Group by q."UserId"
or 

Select * from (Select q."UserId",
min(p."CurrentPeriodStart")as MinChildStartDate, max(p."CurrentPeriodEnd")as MaxChildExpireDate,
min(q."CurrentPeriodStart") as MinParentStartDate, max(q."CurrentPeriodEnd") as MaxParentStartDate from
(Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd",u."GuardianId" from "Subscriptions" as s
join "AspNetUsers" as u on u."Id"=s."UserId" where u."GuardianId" is not null) as p
join (Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd",u."GuardianId" from "Subscriptions" as s
join "AspNetUsers" as u on u."Id"=s."UserId" where u."GuardianId" is null) as q on p."GuardianId"=q."UserId"
Group by q."UserId")as c where c.MaxChildExpireDate<=c.MaxParentStartDate and c.MinChildStartDate>=c.MinParentStartDate;


-- 3. /api/Script/UpdateSubscriptionCholporiProductId: Validation Subscription ProductPlanDetails
Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd", u."GuardianId"
     ,pp."CholporiProductId" , s."ProductId"
from "Subscriptions" as s
         join "AspNetUsers" as u on u."Id"=s."UserId"
         join "ProductPlans" as pp on pp."ProductPlanId"=s."ProductId";

--4. /api/Script/DeleteStudentSubscription: Delete Students Validation script:
-- Validation script for students in Subscription Entity:
Select s."SubscriptionId", s."UserId", s."CurrentPeriodStart", s."CurrentPeriodEnd", u."GuardianId"
    , s."ProductId"
from "Subscriptions" as s
         join "AspNetUsers" as u on u."Id"=s."UserId"
Where u."GuardianId" is not null;
--5. /api/Script/UpdateCouponLogParentId: expected value 0
Select * from "CouponLogs" as i 
join "AspNetUsers" as u on i."UserId"=u."Id"
where u."GuardianId" is not null;

--6./api/Script/UpdateCouponLogProductPlanId: same number
Select *from "CouponLogs" s 
join "ProductPlans" as pp on s."ProductPlanId"=pp."ProductPlanId"
Where (s."ProductId" =s."ProductPlanId");

--Invoice Validation:
-- 7./api/Script/UpdateInvoiceParentId: expected value 0
Select * from "Invoices" as i 
join "AspNetUsers" as u on i."UserId"=u."Id"
where u."GuardianId" is not null;


--8./api/Script/UpdateInvoiceProductPlanId: same number
Select * from "Invoices" as i
                  join "ProductPlans" as p on i."ProductPlanId"=p."ProductPlanId"
where (i."ProductId" = i."ProductPlanId");

-- SslTransactions Validation Script:
--9. /api/Script/UpdateSslTransactionUserId: will return 0;
Select * from "SslTransactions" as s 
join "AspNetUsers" as u on s."UserId"=u."Id"
where u."GuardianId" is not null;

--10./api/Script/UpdateSslTransactionProductPlanId: same number
Select *from "SslTransactions" s 
join "ProductPlans" as pp on s."ProductPlanId"=pp."ProductPlanId"
Where (s."ProductId" =s."ProductPlanId");



--To check:
Select stu."SubscriptionId", stu."Id", stu."GuardianId" from (Select * from "Subscriptions" as s join "AspNetUsers" as u on s."UserId"=u."Id" where u."GuardianId" is null) as p
join (Select * from "Subscriptions" as s join "AspNetUsers" as u on s."UserId"=u."Id" where u."GuardianId" is not null) as stu on stu."GuardianId" = p."UserId";

--How to check two tables distinct data
-- In the join not equal id1 and id2 will return a cutasian product.


Select * from "Subscriptions" as s where not exists 
(SELECT 1
FROM "AspNetUsers" as u
WHERE u."Id"= s."UserId");

SELECT *
FROM "Subscriptions" as s
WHERE s."UserId" IN
      ( SELECT sub."UserId"
        FROM "Subscriptions" as sub
        EXCEPT
        SELECT u."Id"
        FROM "AspNetUsers" as u
      ) ;

SELECT *
FROM
    "Subscriptions" as s
        LEFT JOIN
    "AspNetUsers" as u
    ON  u."Id" = s."UserId"
WHERE u."Id" IS NULL ;

Delete from "Subscriptions" as s WHERE s."UserId" IN
( SELECT sub."UserId"
FROM "Subscriptions" as sub
EXCEPT
SELECT u."Id"
FROM "AspNetUsers" as u
) ;
