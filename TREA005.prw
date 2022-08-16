#include 'protheus.ch'
#include 'parmtype.ch'
/*/{Protheus.doc} function_method_class_name

Trabalhando com datas e hora

@author author
@since 02/02/2018
@version version
parametersSection
@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA005()

	conout(dtoc(Date())) //"02/02/2017"
	conout(dtos(Date()))//"20170202"

//	conout("Data")
//	conout(Date()+3)
//	conout( Month(date()) )
//	conout( day(date()) )
//	conout( year(date()) )



return