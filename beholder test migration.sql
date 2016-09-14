select * 
from Beholder.OrganizationMediaImageRel
where OrganizationId in (select id from Beholder.Beholder.Organization)
and MediaImageId in (select id from Beholder.Beholder.MediaImage)

select 
*
from Beholder.Beholder.Organization
where id in (select id from Beholder.Organization)


select * 
from Beholder.OrganizationComment
where OrganizationId in (select id from Beholder.Beholder.Organization)


select * 
from Beholder.OrganizationStatusHistory
where OrganizationId in (select id from Beholder.Beholder.Organization)

select * 
from Beholder.OrganizationPersonRel
where OrganizationId in (select id from Beholder.Beholder.Organization)

select * 
from Beholder.OrganizationMediaAudioVideoRel
where OrganizationId in (select id from Beholder.Beholder.Organization)
and MediaAudioVideoId in (select id from Beholder.Beholder.MediaAudioVideo)

select * 
from Beholder.OrganizationMediaCorrespondenceRel
where OrganizationId in (select id from Beholder.Beholder.Organization)
and MediaCorrespondenceId in (select id from Beholder.Beholder.MediaCorrespondence)

select * 
from Beholder.OrganizationMediaPublishedRel
where OrganizationId in (select id from Beholder.Beholder.Organization)
and MediaPublishedId in (select id from Beholder.Beholder.MediaPublished)

select * 
from Beholder.ChapterOrganizationRel
where OrganizationId in (select id from Beholder.Beholder.Organization)
and ChapterId in (select id from Beholder.Beholder.Chapter)





