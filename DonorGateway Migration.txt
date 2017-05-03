update guests set IsMailed = 0 where IsMailed is null 
update guests set IsWaiting = 0 where IsWaiting is null 

alter table Guests alter column IsMailed bit not null
alter table Guests alter column IsWaiting bit not null
