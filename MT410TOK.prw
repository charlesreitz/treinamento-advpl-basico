#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} MT410TOK

Este ponto de entrada � executado ao clicar no bot�o OK e pode ser usado para validar a
confirma��o das opera��es: incluir,  alterar, copiar
e excluir.Se o ponto de entrada retorna o conte�do .T., o sistema continua a opera��o,
caso contr�rio, volta para a tela do pedido.

@author charlesreitz
@since 05/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function MT410TOK()
	Local lRet         	:= .F.				// Conteudo de retorno
	Local nOpc         	:= PARAMIXB[1]	// Opcao de manutencao
	Local aRecTiAdt 	:= PARAMIXB[2]	// Array com registros de adiantamentoc
	Local aSaveArea		:= GetArea()
	Local cCodProd 		:= ""
	Begin Sequence

		If (INCLUI .Or. ALTERA) .AND. !MsgYesNo("Continuar?","Aten��o")
			Help(" ",1,ProcName(),,"Para pedidos de exporta��o o campo "+GetSX3Cache("C5_NUM","X3_TITULO")+" (C5_NUM) � obrigat�rio",1,0)
			Break
		EndIF

		For nI := 1 To Len(aCols)
			cCodProd	:=	GDFieldGet("C6_PRODUTO",nI)
			alert(cCodProd)
		Next

		lRet	:=	.T.
	End Sequence

	RestArea(aSaveArea)
Return lRet