/******************************************************************************************
** Descripción: Save/Update información de un padre de familia
*******************************************************************************************
** BITÁCORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripción:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ayús	      Creación.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'SMC_dbo' AND ROUTINE_NAME = 'pr_PadreFamilia_Save')
BEGIN
	DROP PROCEDURE SMC_dbo.pr_PadreFamilia_Save
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SMC_dbo.pr_PadreFamilia_Save
	--Campos persona
	@iVch_cdTipoIdentificacion		VARCHAR(50)			NOT NULL,
	@iVch_cdNumeroIdentificacion	VARCHAR(50)			NOT NULL,
	@iVch_nmPrimerNombre			VARCHAR(50)			NOT NULL,
	@iVch_nmSegundoNombre			VARCHAR(50)			NULL,
	@iVch_nmPrimerApellido			VARCHAR(50)			NOT NULL,
	@iVch_nmSegundoApellido			VARCHAR(50)			NULL,

	--Campos información de contacto
	@iVch_nmDireccion				VARCHAR(250)		NOT NULL,
	@iVch_nmTelefono				VARCHAR(50)			NOT NULL,

	--Campos padre de familia
	@iInt_idPadreFamilia			INT					NULL,

	--Id usuario que ejecuta el sp
	@iUniq_idcreado					UNIQUEIDENTIFIER	NOT NULL
AS
BEGIN
	DECLARE @vInt_idTipoIdentificacion	INT					= NULL
	DECLARE @vUniq_idCreado				UNIQUEIDENTIFIER	= @iUniq_idcreado
	DECLARE @vDt_dtCreado				DATETIME2			= GETDATE()
	DECLARE @vUniq_idModificado			UNIQUEIDENTIFIER	= @iUniq_idcreado
	DECLARE @vDt_dtModificado			DATETIME2			= GETDATE()
	DECLARE @vVch_ErrorMessage			VARCHAR(MAX)		= NULL

	SET NOCOUNT ON;
	--Insertar nuevo registro
	IF (@iInt_idPadreFamilia = NULL)
	BEGIN		
		BEGIN TRY
			BEGIN TRAN TranPadreFamilia			
			
			INSERT INTO SMC_dbo.InformacionContacto (
				nm_Direccion,
				nm_Telefono,
				id_Creado,	
				dt_Creado
			) VALUES (
				@iVch_nmDireccion,
				@iVch_nmTelefono,
				@vUniq_idCreado,
				@vDt_dtCreado
			)

			SELECT @vInt_idTipoIdentificacion = id_TipoIdentificacion FROM SMC_Master.TipoIdentificacion WHERE cd_TipoIdentificacion = @iVch_cdTipoIdentificacion

			INSERT INTO SMC_dbo.Persona (
				id_TipoIdentificacion,
				cd_NumeroIdentificacion,
				nm_Primer_Nombre,	
				nm_Segundo_Nombre,	
				nm_Primer_Apellido,	
				nm_Segundo_Apellido,
				id_Creado,
				dt_Creado
			) VALUES (
				@vInt_idTipoIdentificacion,
				@iVch_cdNumeroIdentificacion,
				@iVch_nmPrimerNombre,
				@iVch_nmSegundoNombre,
				@iVch_nmPrimerApellido,
				@iVch_nmSegundoApellido,
				@vUniq_idCreado,
				@vDt_dtCreado
			)

			INSERT INTO SMC_dbo.InformacionContacto (
				nm_Direccion,			
				nm_Telefono,			
				id_Creado,			
				dt_Creado				
			) VALUES (
				@iVch_nmDireccion,
				@iVch_nmTelefono,
				@vUniq_idCreado,
				@vDt_dtCreado
			)

			COMMIT TRAN TranPadreFamilia
		END TRY
		BEGIN CATCH
			IF (@@TRANCOUNT > 0)
			BEGIN
				SET @vVch_ErrorMessage = ERROR_MESSAGE()
				RAISERROR(@vVch_ErrorMessage, 16, 1)
				ROLLBACK TRAN TranPadreFamilia
			END
		END CATCH
	END
END
GO