#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA008

Função para chamar no campo de validação do dicionário de dados.

@author charlesreitz
@since 05/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA008()
	Local lRet	:= .F.
	Local lRegraAt	:=	GetMV("TR_ATIVO",.T.,.F.)//SuperGetMv("MV_COMIDEV")

	If lRegraAt .AND. MsgYesNo("Deseja realmente continuar com isso? ","Preste atenção - "+ProcName())
		lRet	:=	.T.
	EndIf


return lRet