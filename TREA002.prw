#include 'protheus.ch'
#include 'parmtype.ch'

Static cFuncSta	:=	"Funcao statica"

/*/{Protheus.doc} TREA002

Treinamento de escopo de variaveis

@author charlesreitz
@since 02/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA002(cParam)
	Local cNomeCoA := "Charles REitz "
	Local cNomeCoB := "Outro NOme"
	Private cNomeNew := "Meu novo nome"
	Default cParam	:=	 "Sem parametro"


	//alert(cNomeCoA)
	//alert(cNomeCoB)
	//alert(cFuncSta)
	//Calculo(cNomeCompleto)

return nil

//outra funcao
Static Function Calculo(cNomeCompleto)

	alert(cNomeCompleto)

Return nil