SELECT [StudentID]
  FROM [KazNITU].[dbo].[Edu_Students] stOut
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Specialities] sp
  ON
  stOut.SpecialityID = sp.ID
  WHERE EntryDate < '20201001'
	AND
	(
	  (
	  SELECT TOP 1 od.OrderDate
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
	  AND ftp.OrderFunctionalityTypeID IN (13, 12)
	  ORDER BY OrderDate DESC
	  ) > '20201001'
	  OR
	  (
	  SELECT TOP 1 od.OrderDate
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
	  AND ftp.OrderFunctionalityTypeID IN (13, 12)
	  ORDER BY OrderDate DESC
	  ) IS NULL
	)
	AND
	( SELECT TOP 1 od.OrderDate
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
	  ) IS NOT NULL
	AND
	LevelID = 1;
