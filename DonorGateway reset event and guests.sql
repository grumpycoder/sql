update Guests set
	IsWaiting = null, 
	IsAttending = null, 
	IsMailed = 0, 
	ResponseDate = null, 
	WaitingDate = null, 
	MailedDate = null, 
	TicketCount = 0, 
	Comment = null


	update Events set TicketMailedCount = 0, GuestWaitingCount = 0, GuestAttendanceCount = 0


	update Guests set IsMailed = 0