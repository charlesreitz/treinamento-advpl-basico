#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA001

Escopo de funções e chamada de funções

@author charlesreitz
@since 02/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA001()

	nTotal := SomaMais(1,5)

	alert(nTotal)

return nil


/*/{Protheus.doc} SomaMais
FUNÇÃO QUE FAZ A SOMA DE 2 VARIAVEIS
@author charlesreitz
@since 02/02/2018
@version 1.0
@param nSoma1, numeric, variavel para recebe um valor e soma
@param nSoma2, numeric, variavel para recebe um valor e soma
@return return, soma das variaveis
@example

nTotal := SomaMais(1,1)

@see (links_or_references)
/*/
Static Function SomaMais(nSoma1,nSoma2)

Return nSoma1+nSoma2