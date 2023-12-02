INSERT INTO public."MediaLessons" ("MediaLessonId", "NameEn", "NameBn", "ThumbnailFileId", "ThumbnailFileUri", "DescriptionBn", "DescriptionEn", "GradeId", "SubjectId", "ChapterId", "AuthorEn", "AuthorBn", "SortOrder", "CreatedBy", "UpdatedBy", "IsActive", "IsPro", "IsDeleted", "CreatedAt", "UpdatedAt") 
VALUES ( uuid_generate_v4(),'practice', 'practice', null, 'mediaLesson/21e9cd7d-3e95-416c-317d-79b6dcdc4f41/21e9cd7d-3e95-416c-317d-79b6dcdc4f41.jpg', '', '', 'GradeId0022', 'SubjectId0011', 'f1b0a05b-5768-47f8-82f5-53d6158d0f12', 'author name', 'author name', 18, 'a856104b-dec9-4c5c-bc0d-ea7b99c2f4f5', 'a856104b-dec9-4c5c-bc0d-ea7b99c2f4f5', false, false, false, '2023-06-05 10:54:28.886327', '2023-06-05 10:54:28.886333');

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
Select uuid_generate_v4();

DO $$
    DECLARE Id text;
    BEGIN
        FOR counter IN 1..30 LOOP
            Id:=uuid_generate_v4();
                INSERT INTO public."MediaLessons" ("MediaLessonId", "NameEn", "NameBn", "ThumbnailFileId", "ThumbnailFileUri", "DescriptionBn", "DescriptionEn", "GradeId", "SubjectId", "ChapterId", "AuthorEn", "AuthorBn", "SortOrder", "CreatedBy", "UpdatedBy", "IsActive", "IsPro", "IsDeleted", "CreatedAt", "UpdatedAt")
                VALUES ( Id,'Divisions Lesson '||counter, 'Divisions Lesson Bn '||counter, null,
                        'mediaLesson/'||Id||'/'||Id||'.jpg', 
                        '', '', 'GradeId0022', 'SubjectId0011', 'ChapterId0022', 
                        'author name', 'author nameBn', counter, 'a856104b-dec9-4c5c-bc0d-ea7b99c2f4f5', 
                        'a856104b-dec9-4c5c-bc0d-ea7b99c2f4f5', true, false, false,
                        '2023-06-05 10:54:28.886327', '2023-06-05 10:54:28.886333');

        END Loop ;
    END
$$;

select * from "Chapters" as ch where ch."SubjectId"='SubjectId0011';
UPDATE  "Chapters" as ch  set "IsActive"=true where "SubjectId"='SubjectId0011';

select * from "MediaLessons" as ml where ml."ChapterId"='ChapterId0022';

SELECT 'Hello' ||uuid_generate_v4()|| ' ' || 'World' AS concatenated_text;
