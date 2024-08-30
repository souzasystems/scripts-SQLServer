IF OBJECT_ID('common.sp_InsereFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereFuncionario
END
GO

CREATE PROCEDURE common.sp_InsereFuncionario
    @IdFuncaoFuncionario TINYINT              = NULL
   ,@IdDescricaoHorario TINYINT               = NULL
   ,@IdEstadoCivil TINYINT                    = NULL
   ,@NomeFuncionario VARCHAR(100)             = NULL
   ,@DataAdmissao DATE                        = NULL
   ,@DataDemissao DATE                        = NULL
   ,@Sexo CHAR(01)                            = NULL
   ,@DataNascimento DATE                      = NULL
   ,@CPF CHAR(11)                             = NULL
   ,@Email VARCHAR(80)                        = NULL
   ,@Inativo BIT                              = NULL
   ,@NumeroCarteiraTrabalho VARCHAR(15)       = NULL
   ,@NumeroPisPasep VARCHAR(15)               = NULL
   ,@DigitoVerificadorPisPasep VARCHAR(03)    = NULL
   ,@NumeroSerie VARCHAR(05)                  = NULL
   ,@DigitoVerificadorNumeroSerie VARCHAR(03) = NULL
   ,@IdEstadoEmissao SMALLINT                 = NULL
   ,@DataEmissaoCarteiraTrabalho DATE         = NULL
   ,@LocalEmissaoCarteiraTrabalho VARCHAR(20) = NULL
   ,@LogIdUsuario SMALLINT                    = NULL
   ,@IdFuncionario SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO common.Funcionarios (
       IdFuncaoFuncionario
      ,IdDescricaoHorario
      ,IdEstadoCivil
      ,NomeFuncionario
      ,DataAdmissao
      ,DataDemissao
      ,Sexo
      ,DataNascimento
      ,CPF
      ,Email
      ,Inativo
      ,NumeroCarteiraTrabalho
      ,NumeroPisPasep
      ,DigitoVerificadorPisPasep
      ,NumeroSerie
      ,DigitoVerificadorNumeroSerie
      ,IdEstadoEmissao
      ,DataEmissaoCarteiraTrabalho
      ,LocalEmissaoCarteiraTrabalho
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdFuncaoFuncionario
      ,@IdDescricaoHorario
      ,@IdEstadoCivil
      ,@NomeFuncionario
      ,@DataAdmissao
      ,@DataDemissao
      ,@Sexo
      ,@DataNascimento
      ,@CPF
      ,@Email
      ,@Inativo
      ,@NumeroCarteiraTrabalho
      ,@NumeroPisPasep
      ,@DigitoVerificadorPisPasep
      ,@NumeroSerie
      ,@DigitoVerificadorNumeroSerie
      ,@IdEstadoEmissao
      ,@DataEmissaoCarteiraTrabalho
      ,@LocalEmissaoCarteiraTrabalho
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdFuncionario = (SELECT @@IDENTITY)

   RETURN
END
GO