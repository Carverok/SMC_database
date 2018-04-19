/******************************************************************************************
** Descripci�n: Seleccionar informaci�n de los padres de familia
*******************************************************************************************
** BIT�CORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripci�n:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ay�s	      Creaci�n.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'SMC_dbo' AND ROUTINE_NAME = 'pr_PadreFamilia_Select')
BEGIN
	DROP PROCEDURE SMC_dbo.pr_PadreFamilia_Select
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SMC_dbo.pr_PadreFamilia_Select
	@iIntPageSize
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END
GO
