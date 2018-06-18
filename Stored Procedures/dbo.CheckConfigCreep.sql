SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*****************************************************************************************************
** Name: dbo.CheckConfigCreep
** Desc: Compares original advanced features config against current for Solarwinds alerting
** Auth: Greg Matthewson
** Date: 18/06/2018
**************************
** Change History
**************************
** PR   Date        Author  Description 
** --   --------   -------   ------------------------------------
** 1    18/06/2018 GM        Initial Version
*****************************************************************************************************/


CREATE PROC [dbo].[CheckConfigCreep]
AS

--check setup against current config - any differences return -1 
IF EXISTS(
	SELECT c.configuration_id,
		   c.name,
		   c.value,
		   c.minimum,
		   c.maximum,
		   c.value_in_use,
		   c.description,
		   c.is_dynamic,
		   c.is_advanced
	FROM dbo.Configurations c
	INNER JOIN sys.configurations sc
		ON c.configuration_id = sc.configuration_id
	WHERE c.value <> sc.value)
BEGIN
	RETURN -1
END	
ELSE
BEGIN
    RETURN 0
END


/*
--example call
DECLARE @rtn TINYINT
EXEC @rtn = dbo.CheckConfigCreep
SELECT 'ReturnStatus' = @rtn
*/


GO
