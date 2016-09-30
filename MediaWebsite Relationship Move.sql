USE [Beholder]
GO
--8048 => 7964
declare @sourceId int = 8048
declare @targetId int = 7964
declare @userId int
declare @requestedBy varchar(150) = 'keegan.hankes'

select @userId = id from Security.[User] where UserName = 'mark.lawrence'

select * from Beholder.MediaWebsiteEGroup where id in (@sourceId, @targetId)
select * from Beholder.PersonMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.ChapterMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.OrganizationMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.EventMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupMediaAudioVideoRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupVehicleRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaCorrespondenceMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaPublishedMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupSubscriptionRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaImageMediaWebsiteEGroupRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupComment where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupVehicleRel where MediaWebsiteEGroupId = @sourceId
select * from Beholder.MediaWebsiteEGroupContext where MediaWebsiteEGroupId = @sourceId

/* UPDATE */
--update Beholder.PersonMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.ChapterMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.OrganizationMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.EventMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupMediaAudioVideoRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupVehicleRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaCorrespondenceMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaPublishedMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupSubscriptionRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaImageMediaWebsiteEGroupRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupComment set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupVehicleRel set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--update Beholder.MediaWebsiteEGroupContext set MediaWebsiteEGroupId = @targetId where MediaWebsiteEGroupId = @sourceId

--insert into Beholder.MediaWebsiteEGroupComment (MediaWebsiteEgroupId, Comment, DateCreated, CreatedUserId)
--VALUES (@targetId, 'Migrated data from Website ' + convert(varchar(10), @sourceId) + '. Requested by ' + @requestedBy, GETDATE(), @userId)

--insert into Beholder.MediaWebsiteEGroupComment (MediaWebsiteEgroupId, Comment, DateCreated, CreatedUserId)
--VALUES (@sourceId, 'Migrated data to Website ' + convert(varchar(10), @targetId) + '. Requested by ' + @requestedBy, GETDATE(), @userId)
