with curyear as (
    select t.id
        , t.yearid
        , t.lastday
        , t.firstday
        , t.abbreviation
        , t.name
    from terms t
        join prefs 
            on t.id between to_number(to_char(prefs.value) || '00') and to_number(to_char(prefs.value) || '99')
            and lower(prefs.name) = 'coursearchiveyear'
    where 1=1
        and t.schoolid = 0 
        and t.isyearrec = 1
)

select * from curyear