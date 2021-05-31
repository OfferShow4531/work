/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT sm.[ID]
      ,sm.[Title]
      ,[StartsOn]
      ,[EndsOn]
      ,[StudyYear]
	  ,[InstructorID]
	  ,std.SpecialityID
  FROM 
  [KazNITU].[dbo].[Edu_Semesters] sm
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_SemesterCourses] smCrs
  ON
  sm.ID = smCrs.SemesterID
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_CourseWorkLoad_CourseGroups] crsGrp
  ON
  crsGrp.SemesterCourseID = smCrs.ID
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_StudentCourses] stdCrs
  ON
  stdCrs.SemesterCourseID = smCrs.ID
  LEFT OUTER JOIN
  KazNITU.dbo.Edu_Students std
  ON
  std.StudentID = stdCrs.StudentID
  WHERE StudyYear = 2020
  AND
  EndsOn < '2021-07-23'
  AND
  smCrs.Code = 'CSE6092'
  GROUP BY sm.[ID]
      ,sm.[Title]
      ,[StartsOn]
      ,[EndsOn]
      ,[StudyYear]
	  ,[InstructorID]
	  ,std.SpecialityID
  ORDER BY StartsOn