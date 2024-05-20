do
$$
    declare
        f record;
        h numeric;
    begin
        for f in select "NameEn", "NameBn", "ProBookId" 
                 from "ProBooks"
                 order by "NameEn"
            loop
                h:=(select count(*) from "ProBookPages" where "ProBookId"=f."ProBookId");
                if(h<=5) then 
                    delete from "ProBookPages" where "ProBookId"=f."ProBookId";
                    delete from "ProBooks" where "ProBookId" =f."ProBookId";
                    raise notice 'Deleted page =% for %',h, f."NameEn";
                else
                    raise notice 'Pages=% for %',h, f."NameEn";
                end if;
            end loop;
    end;
$$;


do
$$
    declare
        f record;
        h numeric;
    begin
        for f in select "NameEn", "NameBn", "GenreId"
                 from "Genres"
                 order by "NameEn"
            loop
                h:=(select count(*) from "ProBooks" where "GenreId"=f."GenreId");
                if(h<=0) then
                    delete from "Genres" where "GenreId"=f."GenreId";
                    raise notice 'Deleted Genre =% withId %', f."NameEn",f."GenreId";
                else
                    raise notice 'Active Genre=% withId %',f."NameEn",f."GenreId";
                end if;
            end loop;
    end;
$$;