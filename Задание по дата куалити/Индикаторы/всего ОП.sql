/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT [ID]
  FROM [KazNITU].[dbo].[Edu_Specialities]
  WHERE Deleted != 1
