                select 
                    sch.dcid
                    , sch.id
                    , sch.school_number as schoolid
                    , sch.alternate_school_number
                    , case when coalesce(sch.alternate_school_number, 0) <> 0 then sch.alternate_school_number else sch.school_number end as school_number
                    , lpad(d.district_id, 3, '0') 
                        || lpad(
                            case when coalesce(sch.alternate_school_number, 0) <> 0 then sch.alternate_school_number else sch.school_number end     
                            , 4, '0') as state_id
                    , sch.name 
                    , sch.abbreviation
                    , sch.low_grade as low_grade_id
                    , sch.high_grade as high_grade_id
                    , case 
                        when sch.low_grade <=-1 then 'Prekindergarten'
                        when sch.low_grade =0 then 'Kindergarten'
                        when sch.low_grade >12 then 'Postgraduate'
                        else cast(sch.low_grade as varchar(2)) 
                    end as low_grade
                    , case 
                        when sch.high_grade <=-1 then 'Prekindergarten'
                        when sch.high_grade =0 then 'Kindergarten'
                        when sch.high_grade >12 then 'Postgraduate'
                        else cast(sch.high_grade as varchar(2)) 
                    end as high_grade
                    , sch.principal
                    , case when regexp_like(sch.principalemail, '^(\S+)\@(\S+)\.(\S+)$') then sch.principalemail end as principalemail
                    , sch.schooladdress
                    , sch.schoolcity
                    , upper(substr(sch.schoolstate, 1, 2)) as schoolstate
                    , regexp_replace(sch.schoolzip, '[^0-9]+', '') as schoolzip
                    , regexp_replace(sch.schoolphone, '[^0-9]+', '') as schoolphone
                    , sch.state_excludefromreporting
                    , coalesce(sch.transaction_date, to_date('01/01/1900', 'MM/DD/YYYY')) as date_last_modified
                from schools sch, (select * from district) d
                where 1=1 
                    and sch.school_number <> 999999