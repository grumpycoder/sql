
----select
----p.Id, bp.Id

delete 
--r
bp
from Common.Person p
join [Security].[User] u on u.PersonId = p.Id
join Beholder.Person bp on bp.PersonId = p.Id
--join Beholder.ChapterPersonRel r on r.PersonId = bp.Id
--join Beholder.OrganizationPersonRel r on r.PersonId = bp.Id
--join Beholder.PersonEventRel r on r.PersonId = bp.Id
--join Beholder.PersonMediaAudioVideoRel r on r.PersonId = bp.Id
--join Beholder.PersonMediaCorrespondenceRel r on r.PersonId = bp.Id
--join Beholder.PersonMediaImageRel r on r.PersonId = bp.Id
--join Beholder.PersonMediaWebsiteEGroupRel r on r.PersonId = bp.Id
--join Beholder.PersonPersonRel r on r.PersonId = bp.Id
--join Beholder.PersonComment r on r.PersonId = bp.Id
--join Beholder.PersonMediaPublishedRel r on r.PersonId = bp.Id
--join Beholder.PersonContactRel r on r.PersonId = bp.Id
--join Beholder.PersonPersonRel r on r.PersonId = bp.Id
--join Common.ContactInfoPersonRel r on r.PersonId = p.Id
--join Common.AddressPersonRel r on r.PersonId = p.Id

