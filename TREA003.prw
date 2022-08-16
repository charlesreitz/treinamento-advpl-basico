#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA003

Estruturas de decição if, case e loop e for lista e matriz

@author charlesreitz
@since 02/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA003()
	Local aMeses	:=	{"1","2","3","4","5","6","7","8","9","10","11","12"}
	Local cMsg		:=	""
	Local nI		:= 0
	Local nTotal	:= 0


	//OPERADORES
//	nTotal := 12+10 //Adição
//	conout(nTotal)
//
//	nTotal := 123-23 // Subtração
//	conout(nTotal)
//
//	nTotal := 5*5 // Multiplicação
//	conout(nTotal)
//
//	nTotal := (100/2)/10 //Divisão
//	conout(nTotal)
//
//	nTotal := 100%3.93//Resto da divisão
//	conout(nTOtal)





	//ESTRUTURA DE DECISÃO CASE
	//For nI := 1 To Len(aMeses)
	//	Do Case
	//		Case aMeses[nI] == "1"

	//			conout("Janeiro")

	//		Case aMeses[nI] == "2"

	//			conout("Fevereiro")

	//		Case aMeses[nI] == "3"

	//			conout("Março")

	//		OtherWise

	//			conout("Outro mes")

	//	EndCase
	//Next

	//ESTRUTURA DE DECISÃO IF COM FOR
	//For nI := 1 To Len(aMeses)

		//APENAS IF
	//	If aMeses[nI] == "5"
	//		conout("Maio")
	//	EndIf

		//IF COM ELSE
	//	If aMeses[nI] == "12"
	//		conout("Dezembro")
	//	ElseIf aMeses[nI] == "1"
	//		conout("Janeiro")
	//	Else
	//		conout("Outros meses")
	//	End

	//Next



	//ESTRUTURA DE LAÇO WHILE
	//While nTotal < 10

	//	nTotal++
	//	conout("Imprima isso")

		//Estrutura de decisão
	//	If nTotal == 5
	//		Exit
	//	EndIf

	//Enddo

	//ESTRUTURA DE LAÇO FOR
	//For nI = 1 To 2000
	//For nI = 1 To Len(aMeses)
		//nTotal++
		//nTotal := nTotal + 1

		//cMsg	+= aMeses[nI]+"/"
		//cMsg	:= cMsg+aMeses[nI]+"/"


		//conout("Executando -> "+Str(nI))

	//Next
	//alert(cMsg)
	//alert(nTotal)
	//varinfo("aMeses",aMeses)
return