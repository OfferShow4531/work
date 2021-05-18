/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT [StudentID]
      ,[SpecialityID]
	  ,[Year]
      ,[StatusID]
      ,COALESCE(
	  (
		SELECT TOP 1
	   od.OrderDate
	  FROM [KazNITU].[dbo].[Edu_OrderStudents] AS st
	  RIGHT OUTER JOIN [KazNITU].[dbo].[Edu_Orders] AS od
	  ON (od.ID = st.OrderID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_Users] AS us
	  ON (st.StudentID = us.ID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionality] AS ftp
	  ON (od.OrderTypeID = ftp.OrderTypeID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionalityType] AS tp
	  ON (ftp.OrderFunctionalityTypeID = tp.ID)
	  WHERE st.StudentID = stOut.StudentID
	  AND ftp.OrderFunctionalityTypeID = 25
		)
		,[EntryDate]
	)
	,LevelID
  FROM [KazNITU].[dbo].[Edu_Students] stOut
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Specialities] spOut
  ON
  stOut.SpecialityID = spOut.ID
  WHERE 
  EntryDate >= '20180101' AND EntryDate < '20190101'
  AND
  LevelID IN (1, 2)