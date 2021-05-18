/*
����� ���������, ����������� �� ������� ����������� �������� �� ��������������� ��������������� ������� � ���������:
���������� ��������� �� ��������� � ���������� �������� � 150 ������ (�� ��������� �� 1 ������� 2020 �.)
*/
SELECT [StudentID]
,[Year]
  FROM [KazNITU].[dbo].[Edu_Students] stOut
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Specialities] sp
  ON
  stOut.SpecialityID = sp.ID
  WHERE COALESCE(
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
		,stOut.[EntryDate]
	) < '20201001'
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
	LevelID IN (1, 2)
	AND
	EducationPaymentTypeID = 1
	ORDER BY Year
	/*
	����� - EducationPaymentTypeID = 1
	*/