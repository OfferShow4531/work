/****** ������ ��� ������� SelectTopNRows �� ����� SSMS  ******/
SELECT [ID]
  FROM [KazNITU].[dbo].[Edu_Specialities]
  WHERE Deleted != 1
  AND EducationalProgramType = 2