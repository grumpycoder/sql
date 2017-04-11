delete from Products
delete from Publishers
delete from Staff
delete from ProductStaff

dbcc checkident('dbo.Products', reseed, 1)
dbcc checkident('dbo.Publishers', reseed, 1)
dbcc checkident('dbo.Staff', reseed, 1)

SET IDENTITY_INSERT Publishers ON
insert into Publishers
	(id, name, WebsiteUrl, Email, Street, Street2, City, State, PostalCode, Phone, Fax)
select distinct c.id, c.Name, c.WebsiteUrl, c.Email, c.Street, c.Street2, c.City, c.Abbr, c.PostalCode, Office, Fax from (
select 
c.id, LTRIM(RTRIM(c.Name)) [Name], LTRIM(RTRIM(c.WebsiteUrl)) [WebsiteUrl], LTRIM(RTRIM(c.Email)) [Email], 
LTRIM(RTRIM(a.Street)) [Street], LTRIM(RTRIM(a.Street2)) [Street2], LTRIM(RTRIM(a.City)) [City], s.Abbr, LTRIM(RTRIM(a.PostalCode)) [PostalCode], LTRIM(RTRIM(p.Fax)) [Fax], LTRIM(RTRIM(p.Office)) [Office]
from Companies c
left join (select max(addressid) [AddressId], CompanyId from CompanyAddresses group by companyid) ca on ca.CompanyId = c.Id 
left join Addresses a on a.Id = ca.AddressId
left join States s on s.Id = a.StateId
left join (
			select max(companyid) [CompanyId], max(fax) [Fax], max(office) [Office] from (
			select cp.companyid, 
			case when cp.PhoneTypeId = 4 then Number end [fax], 
			case when cp.PhoneTypeId = 2 then Number end [office] 
			from CompanyPhones cp 
			join phones p on p.id = cp.phoneid
			) a group by companyid
) p on p.CompanyId = c.Id
group by c.id, c.Name, c.WebsiteUrl, c.Email, 
a.Street, a.Street2, a.City, s.Abbr, a.PostalCode, p.Office, p.Fax
) c order by id desc
SET IDENTITY_INSERT Publishers OFF

SET IDENTITY_INSERT Products ON
insert into Products
	(id, Title, ISBN, Summary, ReceiptDate, Review, Purchased, Donate, PublisherId, MediaTypeId)
select 
id, LTRIM(RTRIM(Title)) [Title], LTRIM(RTRIM(ISBN)) [ISBN], LTRIM(RTRIM(Summary)) [Summary], ReceiptDate, Review, Purchased, Donate, CompanyId, MediaTypeId from Media
SET IDENTITY_INSERT Products OFF

SET IDENTITY_INSERT Staff ON
insert into Staff
	(id, Title, Firstname, Lastname, Email, Phone)
select p.Id, LTRIM(RTRIM(Title)) [Title], LTRIM(RTRIM(Firstname)) [Firstname], LTRIM(RTRIM(Lastname)) [Lastname], LTRIM(RTRIM(Email)) [Email], LTRIM(RTRIM(pp.Number)) [Number]
from People p 
left join (SELECT PersonId, MAX(Number) [Number] from PersonPhones pp join Phones ph on ph.Id = pp.PhoneId and pp.PhoneTypeId = 2 group by PersonId) pp on pp.PersonId = p.Id
SET IDENTITY_INSERT Staff OFF


insert into ProductStaff
	(StaffId, ProductId)
select 
m.PersonId, m.MediaId 
from StaffMembers m 
join Staff s on s.Id = m.PersonId
join Products p on p.Id = m.MediaId

