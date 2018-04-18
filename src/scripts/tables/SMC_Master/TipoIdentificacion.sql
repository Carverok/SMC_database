/******************************************************************************************
** Descripción: Crear tabla tipo identificación
*******************************************************************************************
** BITÁCORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripción:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ayús	      Creación.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'SMC_Master' AND TABLE_NAME = 'TipoIdentificacion')
BEGIN
	DROP TABLE SMC_Master.TipoIdentificacion
END

CREATE TABLE SMC_Master.TipoIdentificacion (
	id_TipoIdentificacion	INT IDENTITY(1,1) NOT NULL,
	cd_TipoIdentificacion	VARCHAR(50) NULL,
	nm_Nombre				VARCHAR(50),
	ds_Descripcion			VARCHAR(100) NULL,

	--Campos de auditoría
	id_creado				UNIQUEIDENTIFIER NOT NULL,
	dt_creado				DATETIME2 NOT NULL,
	id_modificado			UNIQUEIDENTIFIER NULL,
	dt_modificado			DATETIME2 NULL

	CONSTRAINT PK_TipoIdentificacion PRIMARY KEY CLUSTERED
	(id_TipoIdentificacion ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) on [PRIMARY]
)