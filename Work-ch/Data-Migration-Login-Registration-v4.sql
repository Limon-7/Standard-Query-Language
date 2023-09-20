-- 1. /api/Script/DeleteInvalidUserStudent::: Delete Invalid User's(user has no profile) Student

---invalid Parent student
Select u."Id", u."GuardianId", p."UserProfileId" from (Select u."Id", up."UserProfileId" from "AspNetUsers" as u
left join "UserProfile" as up on u."Id"=up."UserProfileId"
where up."UserProfileId" is null and u."GuardianId" is null) as p
join "AspNetUsers" as u on u."GuardianId"=p."Id";
--- each parent students
Select u."GuardianId", count(*) as student from (Select u."Id", up."UserProfileId" from "AspNetUsers" as u
left join "UserProfile" as up on u."Id"=up."UserProfileId"
where up."UserProfileId" is null and u."GuardianId" is null) as p
join "AspNetUsers" as u on u."GuardianId"=p."Id" group by  u."GuardianId";

-- 2. /api/Script/DeleteInvalidUser::: where user has no userprofile
---invalid Parent
Select u."Id", up."UserProfileId" from "AspNetUsers" as u
left join "UserProfile" as up on u."Id"=up."UserProfileId"
where up."UserProfileId" is null and u."GuardianId" is null;
--- invalid parent Total
Select count(*) as TotalParent from "AspNetUsers" as u
left join "UserProfile" as up on u."Id"=up."UserProfileId"
where up."UserProfileId" is null and u."GuardianId" is null;
-- Test:: Get TotalMissing UserProfile
select (select count(*) from "AspNetUsers") -
       (select count(*) from "UserProfile") as TotalMIssingRow;
--3. /api/Script/StudentInformation::: clear students(email, emailConfirmed, phoneNumber, phoneConfirmed, passwordHash) 
Select "Id", "PasswordHash", "Email", "NormalizedEmail", "EmailConfirmed", "PhoneNumber", "PhoneNumberConfirmed", "GuardianId" from "AspNetUsers"
where "GuardianId" is not null and
    ("Email" is not null or "EmailConfirmed" is true or "NormalizedEmail" is not null or "PhoneNumber" is not null or "PhoneNumberConfirmed" is true or "PasswordHash" is not null) ;

--4./api/Script/ValidParentInformation:: Update Phone to null and phoneConfirmed false, if email confirmed true and email not null.Or Update email to null and emailConfirmed false, if phoneConfirmed true and phoneNumber not null
--- Total valid Parents
select * from "AspNetUsers" where "GuardianId" is null and "EmailConfirmed" = true or "PhoneNumberConfirmed" = true;

---Test:: valid parent with email
Select "Id", "PasswordHash", "Email", "NormalizedEmail", "EmailConfirmed", "PhoneNumber", "PhoneNumberConfirmed", "GuardianId" from "AspNetUsers"
where "GuardianId" is  null
  and "Email" is not null and "EmailConfirmed"=true
  and "PhoneNumber" is  null and "PhoneNumberConfirmed"=false;

-- Test:: valid parent with phone number
Select "Id", "PasswordHash", "Email", "NormalizedEmail", "EmailConfirmed", "PhoneNumber", "PhoneNumberConfirmed", "GuardianId" from "AspNetUsers"
where "GuardianId" is  null
  and "Email" is  null and "EmailConfirmed"=false and "NormalizedEmail" is null
  and "PhoneNumber" is not null and "PhoneNumberConfirmed"=true;
--Test:: Total Valid parent:
Select (Select Count(*) from "AspNetUsers"
        where "GuardianId" is  null
          and "Email" is not null and "EmailConfirmed"=true
          and "PhoneNumber" is  null and "PhoneNumberConfirmed"=false)
           +
    (Select Count(*) from "AspNetUsers" where "GuardianId" is  null
      and "Email" is  null and "EmailConfirmed"=false and "NormalizedEmail" is null
      and "PhoneNumber" is not null and "PhoneNumberConfirmed"=true)
    as TotalValidParents; 

-- 5. /api/Script/UpdateUnfortunateParents::: if userName is a valid phoneNumber then set all phoneRelated column and clear all email columns.
select * from "AspNetUsers" where "GuardianId" is null and "EmailConfirmed" = false and "PhoneNumberConfirmed" = false;

-- 6. /api/Script/UpdateStudentUserRole:: get All missing role for Student
select u."Id", u."Email", u."EmailConfirmed", u."PhoneNumber", u."PhoneNumberConfirmed", u."GuardianId", ur."RoleId",
       r."Name"
from "AspNetUsers"  u
         left join "AspNetUserRoles" as ur on ur."UserId"=u."Id"
         left join "AspNetRoles" as r on ur."RoleId"=r."Id"
where  u."GuardianId" is not null and ur."RoleId" is  null;


-- 7. /api/Script/UpdateParentUserRole:: get All parents missing role
select u."Id", u."Email", u."EmailConfirmed", u."PhoneNumber", u."PhoneNumberConfirmed", u."GuardianId", ur."RoleId",
       r."Name"
from "AspNetUsers"  u
         left join "AspNetUserRoles" as ur on ur."UserId"=u."Id"
         left join "AspNetRoles" as r on ur."RoleId"=r."Id"
where  u."GuardianId" is  null and ur."RoleId" is  null;

---8. /api/Script/UpdateUserTwoFactor:::set TwoFactorEnabled= false
Select count(*) as TotalUsers from "AspNetUsers" where "TwoFactorEnabled" = true;

-- 9. /api/Script/UpdateUserFirstName::: Get user having no first name where (Email not null and EmailConfirm) or (Phone not null and PhoneConfirm)
Select u."Id",u."Email", u."EmailConfirmed", u."PhoneNumber", u."PhoneNumberConfirmed", up."UserProfileId", up."FirstName"  from "AspNetUsers" as u
                                                                                                                                     join "UserProfile" as up on u."Id"=up."UserProfileId"
where
    ((u."Email" is not null and u."EmailConfirmed" =true)  or (u."PhoneNumber" is not null and u."PhoneNumberConfirmed" =true))  and up."FirstName" is null ;

---Test: Get user having no first name where (Email not null and EmailConfirm) or (Phone not null and PhoneConfirm)
Select * from "AspNetUsers" as u
                  join "UserProfile" as up on u."Id"=up."UserProfileId"
where
    ((u."Email" is not null and u."EmailConfirmed" =true)  or (u."PhoneNumber" is not null and u."PhoneNumberConfirmed" =true))  and up."FirstName" is null ;


--- Get All invalidate users having mobile number +88 or 88
SELECT * FROM "AspNetUsers" WHERE "PhoneNumber" like'88%' or "PhoneNumber" like'+88%';

--- Get Users  
Select u."Id", up."UserProfileId" from "AspNetUsers" as u
                                           left join "UserProfile" as up on u."Id"=up."UserProfileId"
                                           right join "ProBookLogsByUsers" as bl on bl."AppUserId"=u."Id"
where up."UserProfileId" is null;

---
SET CONSTRAINTS ALL DEFERRED;
DO $$
    DECLARE
        my_cursor CURSOR FOR
            SELECT "Id"
            FROM "AspNetUsers" as u left join "UserProfile" as up on u."Id"=up."UserProfileId"
            WHERE up."UserProfileId" is null and u."GuardianId" is null;
        row_data "AspNetUsers"%ROWTYPE;
    BEGIN
        OPEN my_cursor;
        LOOP
            FETCH my_cursor INTO row_data;
            EXIT WHEN NOT FOUND;
--             Update   "AspNetUsers" Set "UpdatedAt" = '2023-06-15 17:27:06.876096' where "Id"=row_data."Id";
            Delete from "AspNetUsers" where "Id"= row_data."Id";
            RAISE NOTICE 'column1: %', row_data."Id";
        END LOOP;
        CLOSE my_cursor;
    END $$;

SET CONSTRAINTS ALL IMMEDIATE;

