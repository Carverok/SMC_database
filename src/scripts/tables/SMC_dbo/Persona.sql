/******************************************************************************************
** Descripción: Crear tabla persona
*******************************************************************************************
** BITÁCORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripción:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ayús	      Creación.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'SMC_dbo' AND TABLE_NAME = 'Persona')
BEGIN
	DROP TABLE SMC_dbo.Persona
END

CREATE TABLE SMC_dbo.Persona (
	id_Persona				INT IDENTITY(1,1)	NOT NULL,
	id_TipoIdentificacion	INT					NOT NULL,
	cd_NumeroIdentificacion	VARCHAR(50)			NOT NULL,
	nm_Primer_Nombre		VARCHAR(50)			NOT NULL,
	nm_Segundo_Nombre		VARCHAR(50)			NULL,
	nm_Primer_Apellido		VARCHAR(50)			NOT NULL,
	nm_Segundo_Apellido		VARCHAR(50)			NULL,

	--Campos de auditoría
	id_Creado				UNIQUEIDENTIFIER	NOT NULL,
	dt_Creado				DATETIME2			NOT NULL,
	id_Modificado			UNIQUEIDENTIFIER	NULL,
	dt_Modificado			DATETIME2			NULL

	CONSTRAINT PK_Persona PRIMARY KEY
		CLUSTERED (id_Persona ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) on [PRIMARY]

	CONSTRAINT FK_id_TipoIdentificacion FOREIGN KEY
		(id_TipoIdentificacion) REFERENCES SMC_Master.TipoIdentificacion(id_TipoIdentificacion)
)