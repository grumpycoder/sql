

select 
b.Id, 'Person' BeholderType, 
p.LName + ', ' + p.FName [Name], 
p.FName, p.LName,
a.City, s.StateCode, a.Zip5
--, r.Id, r.*
from Beholder.Person b
join Common.Person p on p.Id = b.PersonId
left join Common.AddressPersonRel r on r.PersonId = b.PersonId and r.PrimaryStatusId = 1
left join Common.Address a on a.Id = r.AddressId
left join Common.State s on s.Id = a.StateId
--where c.Id = 10460
order by b.Id

