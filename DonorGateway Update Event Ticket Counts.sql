

update e set GuestAttendanceCount = ActualTicketCount
from Events e 
join (select EventId, sum(ticketcount) [ActualTicketCount] from guests where isattending = 1 group by EventId) s on s.EventId = e.Id
where e.GuestAttendanceCount <> s.ActualTicketCount

update e set TicketMailedCount = ActualMailedTicketCount
from Events e 
join (select EventId, sum(ticketcount) [ActualMailedTicketCount] from guests where IsAttending = 1 and IsMailed = 1 group by EventId) s on s.EventId = e.Id
where e.TicketMailedCount <> s.ActualMailedTicketCount

update e set GuestWaitingCount = ActualWaitingTicketCount
from Events e 
join (select EventId, sum(ticketcount) [ActualWaitingTicketCount] from guests where IsAttending = 1 and IsWaiting = 1 group by EventId) s on s.EventId = e.Id
where e.TicketMailedCount <> s.ActualWaitingTicketCount

