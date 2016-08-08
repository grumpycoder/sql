
select * from Beholder.Chapter where id in (6621, 1661)

--6621 => 1661


select * from Beholder.ChapterPersonRel where ChapterId = 6621
--update Beholder.ChapterPersonRel set ChapterId = 1661 where ChapterId = 6621

select * from Beholder.ChapterMediaWebsiteEGroupRel where ChapterId = 6621
--update Beholder.ChapterMediaWebsiteEGroupRel set ChapterId = 1661 where ChapterId = 6621

select * from Beholder.ChapterMediaCorrespondenceRel where ChapterId = 6621
--update Beholder.ChapterMediaCorrespondenceRel set ChapterId = 1661 where ChapterId = 6621

select * from Beholder.ChapterMediaPublishedRel where ChapterId = 6621
--update Beholder.ChapterMediaPublishedRel set ChapterId = 1661 where ChapterId = 6621

select * from Beholder.ChapterComment where ChapterId = 6621
--update Beholder.ChapterComment set ChapterId = 1661 where ChapterId = 6621