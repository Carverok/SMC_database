/******************************************************************************************
** Descripci�n: Crear tabla informacion de contacto
*******************************************************************************************
** BIT�CORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripci�n:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ay�s	      Creaci�n.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'SMC_dbo' AND TABLE_NAME = 'InformacionContacto')
BEGIN
	DROP TABLE SMC_dbo.InformacionContacto
END

CREATE TABLE SMC_dbo.InformacionContacto (
	id_InformacionContacto	INT IDENTITY(1,1)	NOT NULL,
	nm_Direccion			VARCHAR(250)		NOT NULL,
	nm_Telefono				VARCHAR(50)			NOT NULL,

	--Campos de auditor�a
	id_Creado				UNIQUEIDENTIFIER	NOT NULL,
	dt_Creado				DATETIME2			NOT NULL,
	id_Modificado			UNIQUEIDENTIFIER	NULL,
	dt_Modificado			DATETIME2			NULL

	CONSTRAINT PK_InformacionContacto PRIMARY KEY
		CLUSTERED (id_InformacionContacto ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) on [PRIMARY]
)