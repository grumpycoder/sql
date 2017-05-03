delete from Products
delete from Publishers
delete from Staffs
delete from StaffProducts

dbcc checkident('dbo.Products', reseed, 1)
dbcc checkident('dbo.Publishers', reseed, 1)
dbcc checkident('dbo.Staffs', reseed, 1)

SET IDENTITY_INSERT MediaLibrary.dbo.Publishers ON
insert into Publishers
	(id, name, WebsiteUrl, Email, Street, Street2, City, State, Zipcode, Phone, CreatedUser, ModifiedUser, DateCreated, DateModified)
select distinct c.id, c.Name, c.WebsiteUrl, c.Email, c.Street, c.Street2, c.City, c.Abbr, c.PostalCode, Office, CreatedUser, ModifiedUser, DateCreated, DateModified from (
select 
c.id, LTRIM(RTRIM(c.Name)) [Name], LTRIM(RTRIM(c.WebsiteUrl)) [WebsiteUrl], LTRIM(RTRIM(c.Email)) [Email], 
LTRIM(RTRIM(a.Street)) [Street], LTRIM(RTRIM(a.Street2)) [Street2], LTRIM(RTRIM(a.City)) [City], s.Abbr, LTRIM(RTRIM(a.PostalCode)) [PostalCode], LTRIM(RTRIM(p.Office)) [Office], 
c.CreatedUser, c.ModifiedUser, c.DateCreated, c.DateModified
from MediaCatalog.dbo.Companies c
left join (select max(addressid) [AddressId], CompanyId from MediaCatalog.dbo.CompanyAddresses group by companyid) ca on ca.CompanyId = c.Id 
left join MediaCatalog.dbo.Addresses a on a.Id = ca.AddressId
left join MediaCatalog.dbo.States s on s.Id = a.StateId
left join (
			select max(companyid) [CompanyId], max(office) [Office] from (
			select cp.companyid, 
			case when cp.PhoneTypeId = 2 then Number end [office] 
			from MediaCatalog.dbo.CompanyPhones cp 
			join MediaCatalog.dbo.phones p on p.id = cp.phoneid
			) a group by companyid
) p on p.CompanyId = c.Id
group by c.id, c.Name, c.WebsiteUrl, c.Email, 
a.Street, a.Street2, a.City, s.Abbr, a.PostalCode, p.Office, c.CreatedUser, c.ModifiedUser, c.DateCreated, c.DateModified
) c order by id desc
SET IDENTITY_INSERT MediaLibrary.dbo.Publishers OFF


SET IDENTITY_INSERT MediaLibrary.dbo.Products ON
insert into MediaLibrary.dbo.Products
	(id, Title, ISBN, Summary, ReceiptDate, Reviewed, Purchased, Donated, PublisherId, CreatedUser, ModifiedUser, DateCreated, DateModified)
select 
id, LTRIM(RTRIM(Title)) [Title], LTRIM(RTRIM(ISBN)) [ISBN], LTRIM(RTRIM(Summary)) [Summary], ReceiptDate, Review, Purchased, Donate, CompanyId, CreatedUser, ModifiedUser, DateCreated, DateModified from MediaCatalog.dbo.Media
SET IDENTITY_INSERT MediaLibrary.dbo.Products OFF

SET IDENTITY_INSERT MediaLibrary.dbo.Staffs ON
insert into Staffs
	(id, Firstname, Lastname, Email, Phone, CreatedUser, ModifiedUser, DateCreated, DateModified)
select p.Id, LTRIM(RTRIM(Firstname)) [Firstname], LTRIM(RTRIM(Lastname)) [Lastname], LTRIM(RTRIM(Email)) [Email], LTRIM(RTRIM(pp.Number)) [Number], CreatedUser, ModifiedUser, DateCreated, DateModified
from MediaCatalog.dbo.People p 
left join (SELECT PersonId, MAX(Number) [Number] from MediaCatalog.dbo.PersonPhones pp join MediaCatalog.dbo.Phones ph on ph.Id = pp.PhoneId and pp.PhoneTypeId = 2 group by PersonId) pp on pp.PersonId = p.Id
SET IDENTITY_INSERT MediaLibrary.dbo.Staffs OFF


insert into MediaLibrary.dbo.StaffProducts
	(StaffId, ProductId)
select 
m.PersonId, m.MediaId 
from MediaCatalog.dbo.StaffMembers m 
join MediaCatalog.dbo.People s on s.Id = m.PersonId
join MediaLibrary.dbo.Products p on p.Id = m.MediaId

update prod 
set Author = LTRIM(RTRIM(p.FirstName)) + ' ' + LTRIM(RTRIM(p.Lastname))
from MediaCatalog.dbo.StaffMembers sm
join MediaCatalog.dbo.Roles r on r.Id = sm.RoleId and r.Name like '%author%'
join MediaCatalog.dbo.People p on p.Id = sm.PersonId
join MediaCatalog.dbo.Media m on m.Id = sm.MediaId
JOIN MediaLibrary.dbo.Products prod on prod.Id = sm.MediaId

