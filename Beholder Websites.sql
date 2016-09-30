
select 
w.Id, 
w.Name, 
w.URL,
c.ChapterName
from Beholder.MediaWebsiteEGroup w
join Beholder.ChapterMediaWebsiteEGroupRel r on r.MediaWebsiteEGroupId = w.Id 
join Beholder.Chapter c on c.Id = r.ChapterId
order by w.Id