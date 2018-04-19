/******************************************************************************************
** Descripción: Crear tabla información de contacto
*******************************************************************************************
** BITÁCORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripción:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ayús	      Creación.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'SMC_dbo' AND TABLE_NAME = 'PadreFamilia')
BEGIN
	DROP TABLE SMC_dbo.PadreFamilia
END

CREATE TABLE SMC_dbo.PadreFamilia (
	id_PadreFamilia			INT IDENTITY(1,1)	NOT NULL,
	id_Persona				INT					NOT NULL,
	id_InformacionContacto	INT					NOT NULL,

	--Campos de auditoría
	id_Creado				UNIQUEIDENTIFIER	NOT NULL,
	dt_Creado				DATETIME2			NOT NULL,
	id_Modificado			UNIQUEIDENTIFIER	NULL,
	dt_Modificado			DATETIME2			NULL

	CONSTRAINT PK_PadreFamilia PRIMARY KEY
		CLUSTERED (id_PadreFamilia ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) on [PRIMARY]

	CONSTRAINT FK_id_Persona FOREIGN KEY
		(id_Persona) REFERENCES SMC_dbo.Persona(id_Persona),

	CONSTRAINT FK_id_InformacionContacto FOREIGN KEY
		(id_InformacionContacto) REFERENCES SMC_dbo.InformacionContacto(id_InformacionContacto)
)