#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} TREA007

Manipulação de string

@author charlesreitz
@since 02/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA007()
	Local cString	:=	"Aqui no Brasil, a vida e mais clara como Vinho Tinto Branco!"
	Local cNumero	:= "001"
	Local nValor	:=	1050.23

	conout("UPPER(cString)="+UPPER(cString))
	conout("Lower(cString)="+Lower(cString))
	conout("ubStr(cString,1,5)="+SubStr(cString,1,5))
	conout("trTran(cString,'Brasil','Canadá')="+StrTran(cString,"Brasil","Canadá"))
	conout("Left(cString,5)="+Left(cString,5))
	conout("Right(cString,5)="+Right(cString,5))
	conout("soma1(cNumero)="+soma1(cNumero))
	conout("tira1(cNumero)="+tira1(cNumero))
	conout("#+space(10)+#="+"#"+space(10)+"#")
	conout("Transform(nValor,'@E 999.999.999,99')="+Transform(nValor,"@E 999,999,999.99"))
	conout("Replicate('#',90)="+Replicate("#",90))
	conout("Padl('GRU!',10)="+Padl("GRU!",10))
	conout("Padr('GRU!',10)="+Padr("GRU!",10))
	conout("Len(cString)="+Str(Len(cString)))


return