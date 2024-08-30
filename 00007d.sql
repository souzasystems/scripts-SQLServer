IF OBJECT_ID('enderecos.sp_ExcluiZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiZona
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiZona
    @IdZona SMALLINT                = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Zonas
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdZona = @IdZona

   DELETE FROM enderecos.Zonas
   WHERE IdZona = @IdZona

   RETURN
END