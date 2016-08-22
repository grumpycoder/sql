
SET IDENTITY_INSERT dbo.Campaigns ON;

INSERT INTO dbo.campaigns 
            (Id,NAME,startdate,enddate,createddate,createdby) 
SELECT [id],[name],[startdate],[enddate],[datecreated],[userid] 
FROM   markit.dbo.campaigns;

SET IDENTITY_INSERT dbo.Campaigns OFF;

SET IDENTITY_INSERT dbo.Mailers ON;

INSERT INTO dbo.Mailers
(Id, FirstName, MiddleName, LastName, Suffix, Address, Address2, Address3, City, State, ZipCode, SourceCode, FinderNumber,
 Suppress, CampaignId)
SELECT [id],[firstname],[middlename],[lastname],[suffix],[address],[address2], 
       [address3],[city],[state],[zipcode],[sourcecode],[findernumber], 
       [suppress],[campaignid] 
FROM MarkIt.dbo.Mailers;

SET IDENTITY_INSERT dbo.Mailers OFF;

