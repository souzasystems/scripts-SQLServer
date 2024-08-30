IF OBJECT_ID('academy.sp_AlteraTerminal') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraTerminal
END
GO

CREATE PROCEDURE academy.sp_AlteraTerminal
    @IdTerminal TINYINT            = NULL
   ,@DescricaoTerminal VARCHAR(25) = NULL
   ,@Inativo BIT                   = NULL
   ,@LogIdUsuario SMALLINT         = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE academy.Terminais
            SET DescricaoTerminal = @DescricaoTerminal
               ,Inativo           = @Inativo
               ,LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'A'
               ,LogDataHora       = (SELECT getDate())
         WHERE IdTerminal = @IdTerminal

      COMMIT
   END TRY
   BEGIN CATCH
      SELECT @ErrorMessage  = ERROR_MESSAGE()
            ,@ErrorSeverity = ERROR_SEVERITY()
            ,@ErrorState    = ERROR_STATE()

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
      ROLLBACK
   END CATCH

   RETURN
END