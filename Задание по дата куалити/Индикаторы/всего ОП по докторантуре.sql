/****** ������ ��� ������� SelectTopNRows �� ����� SSMS  ******/
SELECT [ID], Code, Title
  FROM [KazNITU].[dbo].[Edu_Specialities]
  WHERE Deleted != 1
  AND 
  (Code LIKE '%D%')