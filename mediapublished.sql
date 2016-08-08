
select * 
from Beholder.MediaPublished
where DateCreated >= CONVERT(date, getdate())
order by datecreated desc


select id from Beholder.MediaPublishedContext
where MediaPublishedId in (
select id 
from Beholder.MediaPublished
where DateCreated >= CONVERT(date, getdate())
)


/*

delete from Beholder.MediaPublishedContext
where MediaPublishedId in (
select id 
from Beholder.MediaPublished
where DateCreated >= CONVERT(date, getdate())
)

delete
from Beholder.MediaPublished
where DateCreated >= CONVERT(date, getdate())

*/

