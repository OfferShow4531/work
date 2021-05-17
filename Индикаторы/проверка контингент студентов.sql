SELECT st.StudentID
   ,us.LastName
   ,us.FirstName
   ,us.MiddleName
   ,st.OrderID
   ,od.OrderTypeID
   ,ftp.OrderFunctionalityTypeID
   ,od.OrderDate
   ,tp.Title
  FROM [KazNITU].[dbo].[Edu_OrderStudents] AS st
  RIGHT OUTER JOIN [KazNITU].[dbo].[Edu_Orders] AS od
  ON (od.ID = st.OrderID)
  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_Users] AS us
  ON (st.StudentID = us.ID)
  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionality] AS ftp
  ON (od.OrderTypeID = ftp.OrderTypeID)
  LEFT OUTER JOIN [KazNITU].[dbo].[Edu_OrderFunctionalityType] AS tp
  ON (ftp.OrderFunctionalityTypeID = tp.ID)
  WHERE st.StudentID IN (
						3369,
						4777,
						5660,
						22663,
						23271,
						25067,
						25132,
						25469,
						25476,
						25491,
						25551,
						25826,
						25882,
						26202,
						26308,
						26630,
						27903,
						29185,
						29710,
						30000,
						31174,
						31555,
						31567,
						31696,
						32246,
						33763,
						33822,
						33877,
						34376,
						35103,
						38464,
						39371,
						39750,
						39819,
						39857,
						39858,
						40150,
						40476,
						42662,
						43439,
						44542,
						44743,
						45537,
						47450,
						47835,
						51375,
						51690,
						53168,
						53365,
						53567)
  ORDER BY StudentID, OrderDate;

  /*
3369,
4777,
5660,
22663,
23271,
25067,
25132,
25469,
25476,
25491,
25551,
25826,
25882,
26202,
26308,
26630,
27903,
29185,
29710,
30000,
31174,
31555,
31567,
31696,
32246,
33763,
33822,
33877,
34376,
35103,
38464,
39371,
39750,
39819,
39857,
39858,
40150,
40476,
42662,
43439,
44542,
44743,
45537,
47450,
47835,
51375,
51690,
53168,
53365,
53567,
  */