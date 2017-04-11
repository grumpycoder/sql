
insert into Persons
	(AccountId, Firstname, Lastname, Zipcode, IsDonor, IsPriority, FuzzyMatchValue, DateCreated, SortOrder)
select 
LookupID,
SUBSTRING(fullname, 0, charindex(' ', ltrim(rtrim(fullname)))) [firstname], 
SUBSTRING(fullname, charindex(' ', ltrim(rtrim(fullname))), len(fullname)) [lastname],  
Zipcode, 
1, 0, 0, GETDATE(), NEWID()
from wot 

