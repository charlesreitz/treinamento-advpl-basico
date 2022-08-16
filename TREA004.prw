#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA004

Arrays e matrizes, bloco de código e macro execução.

@author charlesreitz
@since 02/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA004()
	Local aNovoArray	:=	{}
	Local aMatriz	:=	{ {"COLUNA 1 ","COLUNA 2 "}, {"COLUNA 1","COLUNA 2"}, {"CONLUNA 1","COLUNA 2"} }
	Local nI
	Local aArray	:=	{1,4,5,6,1,23,439,392,3}
	Local nPos		:= 1
	Local bBloco	:=	{|| alert('Bloco de Código Executado')  }
	Local nTotal 	:=	 0
	Private nVar1		:= 1
	Private nVar2		:= 3

	//MACRO EXECUÇÃO
	For nI := 1 To 2

		conout("nVar"+cValTochar(nI))

		nTotal += &("nVar"+cValTochar(nI))

	Next
	conout(nTotal)


	//EXEMPLO DE BLOCO DE CÓDIGO
	//Eval(bBloco)

	//EXEMPLO FUNCAO ASCAN
//	nPos	:=	aScan(aArray,{| x |  x  == 439  })
//	conout(nPos)
//

	//USAR A ACLOSE PARA COPIA DE ARRAYS
	//aArray2 := aClone(aArray)


	//MATRIZ
//	For nI := 1 To Len(aMatriz)
//		conout("Linha "+Alltrim(str(nI))+": "+aMatriz[nI][1] + " | " + aMatriz[nI][2])
//	Next

	//LISTA SIMPLES DE ARRAY
	//	For nI	:= 1 to 100
	//		aadd(aNovoArray,"Item: "+str(nI)+" Adicionado ")
	//	Next
	//
	//	//faz a impressao
	//	For nI := 1 to Len(aNovoArray)
	//		conout(aNovoArray[nI])
//	Next
return