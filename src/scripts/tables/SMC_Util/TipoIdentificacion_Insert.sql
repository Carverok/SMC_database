/******************************************************************************************
** Descripción: llenar tabla tipo identificación
*******************************************************************************************
** BITÁCORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripción:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ayús	      Creación.
*******************************************************************************************/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'SMC_Master' AND ROUTINE_NAME = 'TipoIdentificacion')
BEGIN
	TRUNCATE TABLE SMC_Master.TipoIdentificacion
END

INSERT INTO SMC_Master.TipoIdentificacion (
	cd_TipoIdentificacion,
	nm_Nombre,
	ds_Descripcion,
	id_creado,
	dt_creado
) VALUES (
	'RC',
	'Registro civil',
	'Número de registro civil',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
), (
	'TI',
	'Tarjeta de identidad',
	'Número de tarjeta de identidad',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
), (

	'CC',
	'Cedula de ciudadanía',
	'Número de cédula',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
)