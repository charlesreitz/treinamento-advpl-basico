#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA006

Manipulação de fonte de daodos (banco de dados)

@author charlesreitz
@since 02/02/2018
@version undefined
@example
(examples)
@see (links_or_references)
/*/
user function TREA006()

	//ALTERACAO DE UM REGISTRO POSICIONADO
	dbSelectArea("SA1")
	dbSetOrder(1)//A1_FILIAL+A1_COD+A1_LOJA
	If dbSeek(FWxFilial("SA1")+"00005001")

		conout(SA1->A1_COD + "  " + SA1->A1_LOJA + "  " +  SA1->A1_NOME )

		SA1->(Reclock("SA1",.F.))
		SA1->A1_NOME	:=	"NOVO NOME"
		SA1->(msUnlock())

		conout(SA1->A1_COD + "  " + SA1->A1_LOJA + "  " +  SA1->A1_NOME )

	EndIf


	//COMO LOCALIZAR UM REGISTRO
//	dbSelectArea("SA1")
//	dbSetOrder(1)//A1_FILIAL+A1_COD+A1_LOJA
//	dbSeek(FWxFilial("SA1")+"0005001")
//	conout(SA1->A1_COD + "  " + SA1->A1_LOJA + "  " +  SA1->A1_NOME )


	//SELECT COM ALIAS
//	dbSelectArea("SA1")
//	dbSetOrder(1)
//	dbgotop()
//	While SA1->(!Eof())
//
//		conout(SA1->A1_COD + "  " + SA1->A1_LOJA + "  " +  SA1->A1_NOME )
//
//		SA1->(dbSkip())
//	EndDo


	//SELECT COM SQL EMBEDADO
//	BeginSQL alias "SA1TEMP"
//		SELECT A1_COD,A1_LOJA,A1_NOME
//		FROM %table:SA1% SA1
//		WHERE  SA1.A1_FILIAL = %xFilial:SA1%
//		AND SA1.%notdel%
//	EndSql
//
//	conout( GetLastQuery()[2] )
//
//	While SA1TEMP->(!Eof())
//
//		conout(SA1TEMP->A1_COD + "  " + SA1TEMP->A1_LOJA + "  " +  SA1TEMP->A1_NOME )
//
//		SA1TEMP->(dbSkip())
//	EndDo

	//cQuery	:=	" SELECT A1_COD,A1_LOJA,A1_NOME "
	//cQuery	+=	" FROM "+RETSQLNAME("SA1")+" SA1
	//cQuery	+=	"	WHERE SA1.D_E_L_E_ = ' ' "
	//cQuery	+=	"	AND SA1.A1_FILIAL = '"+ fwxfilial("SA1")+"'"
	//dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),"SA1TEMP",.F.,.T.)
	//TCQuery cQuery NEW ALIAS "SA1TEMP"

return