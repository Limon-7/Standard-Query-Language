---GeneralPracticeWithResult
Select s."GeneralPracticeId", s."SubjectAreaId", g."NameEn", g."ThirdPartyIdentifier",g0."GeneralPracticeResultId",
       g0."StudentId" from "SubjectAreaGeneralPractices" as s
  Inner Join "GeneralPractices" as g On (g."GeneralPracticeId"=s."GeneralPracticeId")
                                            and(g."IsActive" and g."IsDeleted"=false and g."GradeId"='Grade0022')                                                                                                                             LEFT JOIN "GeneralPracticeResults" AS g0 ON (g."ThirdPartyIdentifier"=g0."ThirdPartyIdentifier")
    and (g0."StudentId"='b55e9daa-90f8-4219-8f85-75f90b70dacb')

where s."SubjectAreaId"='8a5f8ce5-4070-4f9e-86c8-1cd0bf2a5fe4';

---Child SubjectAreas
SELECT s."SubjectAreaId", s."NameBn" AS "NameEn", s."NameEn" AS "NameBn", s."SortOrder", s."IsVisible", s."ActiveChildCount", COUNT(*)::INT AS "ActiveGeneralPracticeCount"
FROM "SubjectAreas" AS s
         INNER JOIN "SubjectAreaGeneralPractices" AS s0 ON s."SubjectAreaId" = s0."SubjectAreaId"
         Inner Join "GeneralPractices" as gp on (gp."GeneralPracticeId"=s0."GeneralPracticeId") and (gp."GradeId"='Grade0022')
WHERE ((s."SubjectAreaParentId" ='bc3e0223-00a2-4a93-aaca-6083c138c1db') AND NOT (s."IsDeleted")) AND s."IsActive"
GROUP BY s."SubjectAreaId", s."NameBn", s."NameEn", s."IsPro", s."IsVisible", s."SortOrder", s."ActiveChildCount";
