/* MAILERS TABLE */
update guests set IsMailed = 0 where IsMailed is null 
update guests set IsWaiting = 0 where IsWaiting is null 

alter table Guests alter column IsMailed bit not null
alter table Guests alter column IsWaiting bit not null


DROP INDEX [IX_FirstNameLastName] ON [dbo].[Mailers]
GO
DROP INDEX [IX_LastNameStateName] ON [dbo].[Mailers]
GO
DROP INDEX [IX_FinderNumber] ON [dbo].[Mailers]
GO


alter table Mailers alter column FirstName varchar(255)
alter table Mailers alter column LastName varchar(255)
alter table Mailers alter column MiddleName varchar(150)
alter table Mailers alter column Suffix varchar(10)
alter table Mailers alter column Address varchar(50)
alter table Mailers alter column Address2 varchar(50)
alter table Mailers alter column Address3 varchar(50)
alter table Mailers alter column City varchar(40)
alter table Mailers alter column State varchar(15)
alter table Mailers alter column ZipCode varchar(15)
alter table Mailers alter column SourceCode varchar(25)
alter table Mailers alter column FinderNumber varchar(13)
alter table Mailers alter column CreatedBy varchar(50)
alter table Mailers alter column UpdatedBy varchar(50)

USE [DonorGateway]
GO

/****** Object:  Index [IX_FirstNameLastName]    Script Date: 5/24/2017 8:18:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_FirstNameLastName] ON [dbo].[Mailers]
(
	[Suppress] ASC,
	[LastName] ASC,
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_LastNameStateName]    Script Date: 5/24/2017 8:18:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_LastNameStateName] ON [dbo].[Mailers]
(
	[Suppress] ASC,
	[State] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_FinderNumber]    Script Date: 5/24/2017 8:18:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_FinderNumber] ON [dbo].[Mailers]
(
	[Suppress] ASC,
	[FinderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/* GUESTS TABLE */
alter table Guests alter column LookupId varchar(15)
alter table Guests alter column FinderNumber varchar(15)
alter table Guests alter column ConstituentType varchar(15)
alter table Guests alter column SourceCode varchar(50)
alter table Guests alter column InteractionId varchar(15)
alter table Guests alter column MembershipYear varchar(10)
alter table Guests alter column InsideSalutation varchar(75)
alter table Guests alter column OutsideSalutation varchar(75)

alter table Guests alter column HouseholdSalutation1 varchar(150)
alter table Guests alter column HouseholdSalutation2 varchar(150)
alter table Guests alter column HouseholdSalutation3 varchar(150)
alter table Guests alter column EmailSalutation varchar(75)
alter table Guests alter column Name varchar(255)
alter table Guests alter column Email varchar(255)
alter table Guests alter column Phone varchar(150)
alter table Guests alter column Address varchar(75)
alter table Guests alter column Address2 varchar(75)
alter table Guests alter column Address3 varchar(75)
alter table Guests alter column City varchar(75)
alter table Guests alter column State varchar(50)
alter table Guests alter column Zipcode varchar(25)
alter table Guests alter column Country varchar(50)
alter table Guests alter column ActualDate varchar(25)

alter table Guests alter column MailedBy varchar(75)
alter table Guests alter column ExpectedDate varchar(75)

alter table Guests alter column Comment varchar(2000)
alter table Guests alter column ResponseType varchar(75)
alter table Guests alter column SPLCComment varchar(2000)
alter table Guests alter column Status varchar(75)
alter table Guests alter column ContactMethod varchar(75)
alter table Guests alter column Summary varchar(2000)
alter table Guests alter column Category varchar(75)
alter table Guests alter column SubCategory varchar(75)
alter table Guests alter column Owner varchar(75)
alter table Guests alter column CreatedBy varchar(50)
alter table Guests alter column UpdatedBy varchar(50)
alter table Guests alter column DonorType varchar(75)

/* CAMPAIGNS TABLE */
alter table Campaigns alter column Name varchar(255)
alter table Campaigns alter column CreatedBy varchar(50)
alter table Campaigns alter column UpdatedBy varchar(50)

/* CONSTITUENTS TABLE */
alter table Constituents alter column Name varchar(255)
alter table Constituents alter column LookupId varchar(15)
alter table Constituents alter column FinderNumber varchar(15)
alter table Constituents alter column Street varchar(150)
alter table Constituents alter column Street2 varchar(150)
alter table Constituents alter column City varchar(75)
alter table Constituents alter column State varchar(50)
alter table Constituents alter column Zipcode varchar(25)
alter table Constituents alter column Email varchar(255)
alter table Constituents alter column Phone varchar(150)

alter table Constituents alter column CreatedBy varchar(50)
alter table Constituents alter column UpdatedBy varchar(50)

/* DEMOGRAPHICCHANGES TABLE */
alter table DemographicChanges alter column Name varchar(255)
alter table DemographicChanges alter column LookupId varchar(15)
alter table DemographicChanges alter column FinderNumber varchar(15)
alter table DemographicChanges alter column Street varchar(150)
alter table DemographicChanges alter column Street2 varchar(150)
alter table DemographicChanges alter column City varchar(75)
alter table DemographicChanges alter column State varchar(50)
alter table DemographicChanges alter column Zipcode varchar(25)
alter table DemographicChanges alter column Email varchar(255)
alter table DemographicChanges alter column Phone varchar(150)
			
alter table DemographicChanges alter column CreatedBy varchar(50)
alter table DemographicChanges alter column UpdatedBy varchar(50)


/* EVENTS TABLE */
alter table Events alter column Name varchar(75)
alter table Events alter column DisplayName varchar(255)
alter table Events alter column EventCode varchar(50)

alter table Events alter column Speaker varchar(50)
alter table Events alter column Venue varchar(150)
alter table Events alter column Street varchar(150)
alter table Events alter column City varchar(75)
alter table Events alter column State varchar(50)
alter table Events alter column Zipcode varchar(25)
alter table Events alter column CreatedBy varchar(50)
alter table Events alter column UpdatedBy varchar(50)

sp_rename 'dbo.Events.Name', 'NameUrl', 'COLUMN';

/* SUPPRESSREASONS TABLE */
alter table SuppressReasons alter column Name varchar(150)


/* TAXITEMS TABLE */
alter table TaxItems alter column CreatedBy varchar(50)
alter table TaxItems alter column UpdatedBy varchar(50)

/* TEMPLATES TABLE */
alter table Templates alter column Name varchar(255)
alter table Templates alter column HeaderText varchar(2000)
alter table Templates alter column BodyText varchar(2000)
alter table Templates alter column FooterText varchar(2000)
alter table Templates alter column FAQText varchar(2000)
alter table Templates alter column YesResponseText varchar(2000)
alter table Templates alter column NoResponseText varchar(2000)
alter table Templates alter column WaitingResponseText varchar(2000)
alter table Templates alter column CancelledEventText varchar(2000)
alter table Templates alter column MimeType varchar(25)

alter table Templates alter column CreatedBy varchar(50)
alter table Templates alter column UpdatedBy varchar(50)
