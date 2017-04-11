USE [Sandbox]
GO 

SELECT        h.RecordId, dateadd(ss, convert(int, h.Created), '19700101') [Created], h.Firstname, h.Lastname, h.Email, 
REPLACE(REPLACE(h.Background, CHAR(13), ''), CHAR(10), '') [Background], 
h.LocationType, h.IncidentDate, h.Address_Id, a.Country, a.AdministrativeArea, a.SubAdministrativeArea, a.Locality, a.DependentLocality, 
                         a.PostalCode, a.Thoroughfare, a.Premise, a.SubPremise, a.OrganisationName, a.NameLine, a.FirstName AS AddressFirstname, a.LastName AS AddressLastname, a.Data
FROM            HateIncidents AS h INNER JOIN
                         Addresses AS a ON a.Id = h.Address_Id