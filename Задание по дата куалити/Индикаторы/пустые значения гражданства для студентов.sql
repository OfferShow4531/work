SELECT [StudentID], CitizenshipCountryID, CitizenCategoryID
  FROM [KazNITU].[dbo].[Edu_Students] stOut
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Users] usOut
  ON
  usOut.ID = stOut.StatusID
  WHERE 
	(CitizenshipCountryID IS NOT NULL
	OR
	CitizenCategoryID IS NOT NULL)
