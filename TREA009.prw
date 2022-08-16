#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE 'FWMVCDEF.CH'
/*/{Protheus.doc} TREA009

Rotina em MVC basica

@author charlesreitz
@since 05/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function TREA009()
	Local oBrowse

	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias('ZZ1')
	oBrowse:SetDescription('Valores a Pagar')
	oBrowse:AddLegend( "ZZ1_VER", "YELLOW", "Ativo"      )
	//oBrowse:AddLegend( "!ZZ1_VER", "BLUE"  , "Inativo" )
	oBrowse:Activate()

Return NIL

//menudef
Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.TREA009' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.TREA009' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.TREA009' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.TREA009' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.TREA009' OPERATION 8 ACCESS 0
	ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.TREA009' OPERATION 9 ACCESS 0
	ADD OPTION aRotina TITLE 'Processar'  ACTION 'U_A009Run()' 	   OPERATION 6 ACCESS 0


Return aRotina

//modeldef
Static Function ModelDef()
	Local oStruZZ1 := FWFormStruct( 1, 'ZZ1', /*bAvalCampo*/,/*lViewUsado*/ )
	Local oModel

	oModel := MPFormModel():New('TREA009M', /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )
	oModel:AddFields( 'ZZ1MASTER', /*cOwner*/, oStruZZ1, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
	oModel:SetDescription( 'Dados de baixas' )
	oModel:GetModel( 'ZZ1MASTER' ):SetDescription( 'Dados de Baixas' )
	oModel:SetPrimaryKey( {"ZZ1_FILIAL","ZZ1_ID"} )

Return oModel

//viewdef
Static Function ViewDef()
	Local oModel   := FWLoadModel( 'TREA009' )
	Local oStruZZ1 := FWFormStruct( 2, 'ZZ1' )
	Local oView
	Local cCampos := {}

	oView := FWFormView():New()
	oView:SetModel( oModel )

	oView:AddField( 'VIEW_ZZ1', oStruZZ1, 'ZZ1MASTER' )
	oView:CreateHorizontalBox( 'TELA' , 100 )
	oView:SetOwnerView( 'VIEW_ZZ1', 'TELA' )
Return oView

/*/{Protheus.doc} IncTitRec

Inclusao de título a receber

@author charlesreitz
@since 05/02/2018
@version undefined

@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function A009Run()
	Local lRet		:=	.F.
	Local aFina040	:=	{}
	Local nOpcX	:= "3"
	Local nSaveZZ1	:= ZZ1->(RecNo())

	Begin Sequence
		//aAdd(aFina040,{"E1_FILIAL",FWxFilial("SE1"),Nil})
		//aAdd(aFina040,{"E1_PREFIXO","GER",Nil})
		aAdd(aFina040,{"E1_NUM",ZZ1->ZZ1_ID,Nil})
		aAdd(aFina040,{"E1_PARCELA","01",Nil})
		aAdd(aFina040,{"E1_TIPO","NF",Nil})
		aAdd(aFina040,{"E1_CLIENTE","000003",Nil})
		aAdd(aFina040,{"E1_LOJA","02",Nil})
		aAdd(aFina040,{"E1_EMISSAO",ZZ1->ZZ1_DATA,Nil})
		aAdd(aFina040,{"E1_VENCTO",ZZ1->ZZ1_DATA+30,Nil})
		aAdd(aFina040,{"E1_HIST","TESTE DE INCLUSAO",Nil})
		aAdd(aFina040,{"E1_NATUREZ","0000000001",Nil})
		aAdd(aFina040,{"E1_VALOR",ZZ1->ZZ1_VALOR,Nil})

		BEGIN TRANSACTION
			lMsErroAuto		:= .F.
			pergunte("FIN040",.F.)
			MSExecAuto({|x,y| FINA040(x,y)},aFina040,nOpcX)
			If lMSErroAuto
				DisarmTransaction()
				MostraErro()
				Break
			EndIf
			//FLG NA ZZ1 DE PROCESSADO
			ZZ1->(dbGoTo(nSaveZZ1))
			ZZ1->(Reclock("ZZ1",.F.))
			ZZ1->ZZ1_VER := .F.
			ZZ1->(MsUnlock())

		END TRANSACTION

		lRet	:=	.T.
	End Sequence

Return lRet