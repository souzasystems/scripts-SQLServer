IF OBJECT_ID('enderecos.sp_ConsultaLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLogradouro
    @IdLogradouro SMALLINT           = NULL
   ,@DescricaoLogradouro VARCHAR(25) = NULL
AS
BEGIN
   SELECT IdLogradouro
         ,DescricaoLogradouro
         ,AbreviaturaLogradouro
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Logradouros WITH(NOLOCK)
   WHERE IdLogradouro        = @IdLogradouro
      OR DescricaoLogradouro = @DescricaoLogradouro

   RETURN
END