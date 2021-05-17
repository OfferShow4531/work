SELECT stOut.[StudentID], StatusID, Code, LevelID
  FROM 
  [KazNITU].[dbo].[Edu_Students] stOut
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Specialities] sp
  ON
  stOut.SpecialityID = sp.ID
  WHERE 
  13 IN
  (SELECT ftp.OrderFunctionalityTypeID
	  FROM [KazNITU].[dbo].[Edu_OrderStudents] AS st
	  RIGHT OUTER JOIN [KazNITU].[dbo].[Edu_Orders] AS od
	  ON (od.ID = st.OrderID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_Users] AS us
	  ON (st.StudentID = us.ID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionality] AS ftp
	  ON (od.OrderTypeID = ftp.OrderTypeID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionalityType] AS tp
	  ON (ftp.OrderFunctionalityTypeID = tp.ID)
	  Where st.StudentID = stOut.StudentID
	  AND OrderDate >= '2019-05-24'
	  AND OrderDate < '2020-05-24')
  AND LevelID = 1;