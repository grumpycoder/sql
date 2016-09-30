
select 
c.Id, 'Chapter' BeholderType, c.ChapterName, 
a.City, s.StateCode, a.Zip5
--, r.Id, r.*
from Beholder.Chapter c
left join Beholder.AddressChapterRel r on r.ChapterId = c.Id and r.PrimaryStatusId = 1
left join Common.Address a on a.Id = r.AddressId
left join Common.State s on s.Id = a.StateId
order by c.Id
