#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA003

Estruturas de deci��o if, case e loop e for lista e matriz

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
//	nTotal := 12+10 //Adi��o
//	conout(nTotal)
//
//	nTotal := 123-23 // Subtra��o
//	conout(nTotal)
//
//	nTotal := 5*5 // Multiplica��o
//	conout(nTotal)
//
//	nTotal := (100/2)/10 //Divis�o
//	conout(nTotal)
//
//	nTotal := 100%3.93//Resto da divis�o
//	conout(nTOtal)





	//ESTRUTURA DE DECIS�O CASE
	//For nI := 1 To Len(aMeses)
	//	Do Case
	//		Case aMeses[nI] == "1"

	//			conout("Janeiro")

	//		Case aMeses[nI] == "2"

	//			conout("Fevereiro")

	//		Case aMeses[nI] == "3"

	//			conout("Mar�o")

	//		OtherWise

	//			conout("Outro mes")

	//	EndCase
	//Next

	//ESTRUTURA DE DECIS�O IF COM FOR
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



	//ESTRUTURA DE LA�O WHILE
	//While nTotal < 10

	//	nTotal++
	//	conout("Imprima isso")

		//Estrutura de decis�o
	//	If nTotal == 5
	//		Exit
	//	EndIf

	//Enddo

	//ESTRUTURA DE LA�O FOR
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