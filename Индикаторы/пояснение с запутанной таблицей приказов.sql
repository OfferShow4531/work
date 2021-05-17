SELECT [StudentID], LastName,  od.OrderTypeID 'Orders', ftp.OrderTypeID 'OrderFunctionality', tp.ID 'OrderFunctionalityType ID', tp.Title, OrderDate, isDone, isConfirmed
	  FROM [KazNITU].[dbo].[Edu_OrderStudents] AS st
	  RIGHT OUTER JOIN [KazNITU].[dbo].[Edu_Orders] AS od
	  ON (od.ID = st.OrderID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_Users] AS us
	  ON (st.StudentID = us.ID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionality] AS ftp
	  ON (od.OrderTypeID = ftp.OrderTypeID)
	  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionalityType] AS tp
	  ON (ftp.OrderFunctionalityTypeID = tp.ID)
	  WHERE OrderFunctionalityTypeID = 25
	  ORDER BY OrderDate DESC;

	SELECT DISTINCT DATENAME(month, OrderDate) AS 'Month Name', MONTH(OrderDate)
	FROM [KazNITU].[dbo].[Edu_OrderStudents] AS st
	RIGHT OUTER JOIN [KazNITU].[dbo].[Edu_Orders] AS od
	ON (od.ID = st.OrderID)
	LEFT OUTER JOIN [KazNITU].[dbo].[Edu_Users] AS us
	ON (st.StudentID = us.ID)
	LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionality] AS ftp
	ON (od.OrderTypeID = ftp.OrderTypeID)
	LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionalityType] AS tp
	ON (ftp.OrderFunctionalityTypeID = tp.ID)
	WHERE OrderFunctionalityTypeID = 25
	ORDER BY MONTH(OrderDate);