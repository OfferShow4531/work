/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT [StudentID]
      ,[SpecialityID]
	  ,[Code]
      ,[StatusID]
      ,[CategoryID]
      ,[NeedsDorm]
      ,[AltynBelgi]
      ,[EducationTypeID]
      ,[EducationPaymentTypeID]
      ,[GrantTypeID]
      ,[EducationDurationID]
      ,[Year]
      ,[StudyLanguageID]
      ,[RupID]
      ,[EntryDate]
      ,[GPA]
      ,[LastUpdatedBy]
      ,[LastUpdatedOn]
      ,[AdvisorID]
      ,[AcademicStatusID]
      ,[GraduatedOn]
      ,[AcademicStatusEndsOn]
      ,[AcademicStatusStartsOn]
      ,[GPA_Y]
      ,[IsPersonalDataComplete]
      ,[HosterPrivelegeID]
      ,[MinorSpecialityID]
      ,[EnrollmentTypeId]
  FROM [KazNITU].[dbo].[Edu_Students] st
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Specialities] sp
  ON sp.ID = st.SpecialityID
  WHERE StatusID != 2