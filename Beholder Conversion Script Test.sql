

SET IDENTITY_INSERT Organizations ON

insert into Organizations
(Id, Name, Description, FormedDate, DisbandDate, MovementId, ConfidentialityId, Active, StatusId, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy, OrganizationTypeId)
SELECT id, OrganizationName, OrganizationDesc, CONVERT(datetime2, FormedDate), CONVERT(datetime2, DisbandDate), MovementClassId, ConfidentialityTypeId, 
CASE WHEN ActiveStatusId = 1 THEN 1 ELSE 0 END [ActiveStatusId], 
ApprovalStatusId, DateCreated, CreatedUserId, DateModified, ModifiedUserId, OrganizationTypeId  from Beholder.Organization

SET IDENTITY_INSERT Organizations OFF


