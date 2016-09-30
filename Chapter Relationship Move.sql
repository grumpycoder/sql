declare @sourceId int = 8048
declare @targetId int = 7964
--8048 => 7964
select * from Beholder.Chapter where id in (@sourceId, @targetId)

select * from Beholder.ChapterPersonRel where ChapterId = @sourceId
--update Beholder.ChapterPersonRel set ChapterId = @targetId where ChapterId = @sourceId

select * from Beholder.ChapterMediaWebsiteEGroupRel where ChapterId = @sourceId
--update Beholder.ChapterMediaWebsiteEGroupRel set ChapterId = @targetId where ChapterId = @sourceId

select * from Beholder.ChapterMediaCorrespondenceRel where ChapterId = @sourceId
--update Beholder.ChapterMediaCorrespondenceRel set ChapterId = @targetId where ChapterId = @sourceId

select * from Beholder.ChapterMediaPublishedRel where ChapterId = @sourceId
--update Beholder.ChapterMediaPublishedRel set ChapterId = @targetId where ChapterId = @sourceId

select * from Beholder.ChapterComment where ChapterId = @sourceId
--update Beholder.ChapterComment set ChapterId = @targetId where ChapterId = @sourceId