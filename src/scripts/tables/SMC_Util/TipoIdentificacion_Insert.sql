/******************************************************************************************
** Descripci�n: llenar tabla tipo identificaci�n
*******************************************************************************************
** BIT�CORA: 
*******************************************************************************************
** Fecha:          Autor:         Descripci�n:
** ----------  --------------     ---------------------------------------------
** 2018-04-17	Nayib Ay�s	      Creaci�n.
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
	'N�mero de registro civil',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
), (
	'TI',
	'Tarjeta de identidad',
	'N�mero de tarjeta de identidad',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
), (

	'CC',
	'Cedula de ciudadan�a',
	'N�mero de c�dula',
	'E6AF321E-2D56-4B17-BB69-780521C3300A',
	GETDATE()
)