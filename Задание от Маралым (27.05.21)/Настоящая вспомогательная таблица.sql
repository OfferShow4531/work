SELECT sm.ID "semID"
	  ,smCrs.ID "smCrsID"
	  ,smCrsGrp.ID "smCrsGrpID"
	  ,smCrsGrpStd.StudentID "smCrsGrpStd.StudentID"
	  ,smCrsSct.InstructorID "smCrsSct.InstructorID"
	  ,std.SpecialityID "std.SpecialityID"
  FROM
  /*Сначала наши семестры*/
  [KazNITU].[dbo].[Edu_Semesters] sm
  /*Теперь соединяем с КурсамиСеместра*/
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_SemesterCourses] smCrs
  ON
  smCrs.SemesterID = sm.ID
  /*Теперь вытаскиваем группы каждого курса*/
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_SemesterCourseGroups] smCrsGrp
  ON
  smCrsGrp.SemesterCourseID = smCrs.ID
  /*Теперь соединяем с группами*/
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_SemesterCourseGroupStudents] smCrsGrpStd
  ON
  smCrsGrpStd.CourseGroupID = smCrsGrp.ID
  /*Объединяем с секциями, чтобы вытащить перподавателей групп*/
  RIGHT OUTER JOIN
  [KazNITU].[dbo].[Edu_SemesterCourseSections] smCrsSct
  ON
  smCrsSct.CourseGroupID = smCrsGrp.ID
  /**/
  LEFT OUTER JOIN
  [KazNITU].[dbo].[Edu_Students] std
  ON
  std.StudentID = smCrsGrpStd.StudentID
  WHERE
  /*Сначала ограничим только по нашему году обучения*/
  sm.StartsOn >= '2020-08-23'
  AND
  sm.EndsOn <= '2021-06-10'
  /**************************************************/
  GROUP BY  sm.ID, smCrs.ID, smCrsGrp.ID, smCrsGrpStd.StudentID, smCrsSct.InstructorID, std.SpecialityID
  /*WTF*/
  ORDER BY sm.ID, smCrs.ID, smCrsGrp.ID, smCrsGrpStd.StudentID, smCrsSct.InstructorID, std.SpecialityID