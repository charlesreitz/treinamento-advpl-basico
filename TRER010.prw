#include 'protheus.ch'
#include 'parmtype.ch'

user function TRER010()
	Local 	oReport
	Local 	aArea	:=	GetArea()
	Private cPerg	:=	ProcName()

	oReport := ReportDef()
	oReport:PrintDialog()

	RestARea(aArea)
return

Static Function ReportDef()
	Local oReport
	Local oSection
	Local oCell


	//AjustaSX1(cPerg)
	//Pergunte(CPERG,.T.)
	oReport := TReport():New(cPerg,"Exemplo de Relatorio",cPerg, {|oReport| ReportPrint(oReport)},"Descrição com mais detalhes")  //"  Este relatorio lista a posicao das SA's de acordo com os para-"##"metros selecionados."
	oSection := TRSection():New(oReport,"Section 1 ",) //"Solicitações ao armazem"

	TRCell():New(oSection,"E1_NUM",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection,"E1_PREFIXO",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection,"E1_NUM",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection,"E1_PARCELA",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection,"E1_TIPO",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New(oSection,"E1_VALOR",,/*Titulo*/,/*Picture*/,/*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)

Return(oReport)

Static Function ReportPrint(oReport)
	Local oSection  := oReport:Section(1)
	Local cAliasQRY := GetNextAlias()
	Local nCount	:=	0

	oReport:Section(1):BeginQuery()

		BeginSql Alias cAliasQRY
			SELECT E1_NUM,E1_PREFIXO,E1_TIPO,E1_PARCELA,E1_VALOR
			FROM %table:SE1% SE1
			WHERE  SE1.E1_FILIAL = %xFilial:SE1%
			/*AND SE1.E1_NUM BETWEEN %exp:MV_PAR01% AND %exp:MV_PAR02%*/
			ORDER BY E1_NUM
		EndSql

	oReport:Section(1):EndQuery()

	Count to nCount
	(cAliasQRY)->(dbgotop())
	oReport:SetMeter(nCount)

	oReport:Section(1):Print()
	(cAliasQRY)->(dbCloseArea())

Return NIL

Static Function AjustaSx1(cPerg)
	aHelpPor	:=	{}
	//PutSx1(cGrupo ,cOrdem,cPergunt,cPerSpa,cPerEng  	,cVar    ,cTipo,nTam,nDec,nPres,cGSC,cValid		,cF3	, cGrpSxg,cPyme	,cVar01		,cDef01						,cDefSpa1,cDefEng1,cCnt01, cDef02					 ,cDefSpa2,cDefEng2,cDef03				,cDefSpa3	,cDefEng3 	, cDef04					,cDefSpa4	,cDefEng4, cDef05		,cDefSpa5,cDefEng5, aHelpPor,aHelpEng,aHelpSpa,cHelp)

    aHelpPor := {'Num Título'}
	U_PutSx1(cPerg,;				//-- 01 - X1_GRUPO
	    '01',;						//-- 02 - X1_ORDEM
	    'Título',;	//-- 03 - X1_PERGUNT
	    '',;	//-- 04 - X1_PERSPA
	    '',;		//-- 05 - X1_PERENG
	    'mv_chb',;					//-- 06 - X1_VARIAVL
	    'C',;						//-- 07 - X1_TIPO
	    TAMSX3("E1_NUM")[1],;		//-- 08 - X1_TAMANHO
	    0,;							//-- 09 - X1_DECIMAL
	    ,;							//-- 10 - X1_PRESEL
	    'C',;						//-- 11 - X1_GSC
	    '',;						//-- 12 - X1_VALID
	    '',;						//-- 13 - X1_F3
	    '',;						//-- 14 - X1_GRPSXG
	    '',;						//-- 15 - X1_PYME
	    'MV_PAR01',;				//-- 16 - X1_VAR01
	    '',;					//-- 17 - X1_DEF01
	    '',;					//-- 18 - X1_DEFSPA1
	    '',;					//-- 19 - X1_DEFENG1
	    '',;			//-- 20 - X1_CNT01
	    '',;				//-- 21 - X1_DEF02
	    '',;				//-- 22 - X1_DEFSPA2
	    '',;				//-- 23 - X1_DEFENG2
	    '',;						//-- 24 - X1_DEF03
	    '',;						//-- 25 - X1_DEFSPA3
	    '',;						//-- 26 - X1_DEFENG3
	    '',;						//-- 27 - X1_DEF04
	    '',;						//-- 28 - X1_DEFSPA4
	    '',;						//-- 29 - X1_DEFENG4
	    '',;						//-- 30 - X1_DEF05
	    '',;						//-- 31 - X1_DEFSPA5
	    '',;						//-- 32 - X1_DEFENG5
	    aHelpPor,;							//-- 33 - HelpPor
	    ,;							//-- 35 - HelpEng
	    ,;							//-- 34 - HelpSpa
	    '')							//-- 36 - X1_HELP

	  aHelpPor := {'numero ate'}
	 U_PutSx1(cPerg,;				//-- 01 - X1_GRUPO
	    '02',;						//-- 02 - X1_ORDEM
	    'Numeró Até',;	//-- 03 - X1_PERGUNT
	    '',;	//-- 04 - X1_PERSPA
	    '',;		//-- 05 - X1_PERENG
	    'mv_chb',;					//-- 06 - X1_VARIAVL
	    'C',;						//-- 07 - X1_TIPO
	    TamSX3("E1_NUM")[1],;		//-- 08 - X1_TAMANHO
	    0,;							//-- 09 - X1_DECIMAL
	    ,;							//-- 10 - X1_PRESEL
	    'C',;						//-- 11 - X1_GSC
	    '',;						//-- 12 - X1_VALID
	    '',;						//-- 13 - X1_F3
	    '',;						//-- 14 - X1_GRPSXG
	    '',;						//-- 15 - X1_PYME
	    'MV_PAR01',;				//-- 16 - X1_VAR01
	    '',;					//-- 17 - X1_DEF01
	    '',;					//-- 18 - X1_DEFSPA1
	    '',;					//-- 19 - X1_DEFENG1
	    '',;			//-- 20 - X1_CNT01
	    '',;				//-- 21 - X1_DEF02
	    '',;				//-- 22 - X1_DEFSPA2
	    '',;				//-- 23 - X1_DEFENG2
	    '',;						//-- 24 - X1_DEF03
	    '',;						//-- 25 - X1_DEFSPA3
	    '',;						//-- 26 - X1_DEFENG3
	    '',;						//-- 27 - X1_DEF04
	    '',;						//-- 28 - X1_DEFSPA4
	    '',;						//-- 29 - X1_DEFENG4
	    '',;						//-- 30 - X1_DEF05
	    '',;						//-- 31 - X1_DEFSPA5
	    '',;						//-- 32 - X1_DEFENG5
	    aHelpPor,;							//-- 33 - HelpPor
	    ,;							//-- 35 - HelpEng
	    ,;							//-- 34 - HelpSpa
	    '')							//-- 36 - X1_HELP

Return nil



/*/{Protheus.doc} PutSx1
Put sx1 customizado
@author administrador
@since 28/11/2017
@version undefined
@param cGrupo, characters, descricao
@param cOrdem, characters, descricao
@param cPergunt, characters, descricao
@param cPerSpa, characters, descricao
@param cPerEng, characters, descricao
@param cVar, characters, descricao
@param cTipo, characters, descricao
@param nTamanho, numeric, descricao
@param nDecimal, numeric, descricao
@param nPresel, numeric, descricao
@param cGSC, characters, descricao
@param cValid, characters, descricao
@param cF3, characters, descricao
@param cGrpSxg, characters, descricao
@param cPyme, characters, descricao
@param cVar01, characters, descricao
@param cDef01, characters, descricao
@param cDefSpa1, characters, descricao
@param cDefEng1, characters, descricao
@param cCnt01, characters, descricao
@param cDef02, characters, descricao
@param cDefSpa2, characters, descricao
@param cDefEng2, characters, descricao
@param cDef03, characters, descricao
@param cDefSpa3, characters, descricao
@param cDefEng3, characters, descricao
@param cDef04, characters, descricao
@param cDefSpa4, characters, descricao
@param cDefEng4, characters, descricao
@param cDef05, characters, descricao
@param cDefSpa5, characters, descricao
@param cDefEng5, characters, descricao
@param aHelpPor, array, descricao
@param aHelpEng, array, descricao
@param aHelpSpa, array, descricao
@param cHelp, characters, descricao
@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function PutSx1(cGrupo,cOrdem,cPergunt,cPerSpa,cPerEng,cVar,;
	cTipo ,nTamanho,nDecimal,nPresel,cGSC,cValid,;
	cF3, cGrpSxg,cPyme,;
	cVar01,cDef01,cDefSpa1,cDefEng1,cCnt01,;
	cDef02,cDefSpa2,cDefEng2,;
	cDef03,cDefSpa3,cDefEng3,;
	cDef04,cDefSpa4,cDefEng4,;
	cDef05,cDefSpa5,cDefEng5,;
	aHelpPor,aHelpEng,aHelpSpa,cHelp)

LOCAL aArea := GetArea()
Local cKey
Local lPort := .f.
Local lSpa  := .f.
Local lIngl := .f.


	cKey  := "P." + AllTrim( cGrupo ) + AllTrim( cOrdem ) + "."

	cPyme    := Iif( cPyme 		== Nil, " ", cPyme		)
	cF3      := Iif( cF3 		== NIl, " ", cF3		)
	cGrpSxg  := Iif( cGrpSxg	== Nil, " ", cGrpSxg	)
	cCnt01   := Iif( cCnt01		== Nil, "" , cCnt01 	)
	cHelp	 := Iif( cHelp		== Nil, "" , cHelp		)

	dbSelectArea( "SX1" )
	dbSetOrder( 1 )

	// Ajusta o tamanho do grupo. Ajuste emergencial para validação dos fontes.
	// RFC - 15/03/2007
	cGrupo := PadR( cGrupo , Len( SX1->X1_GRUPO ) , " " )

	If !( DbSeek( cGrupo + cOrdem ))

	    cPergunt:= If(! "?" $ cPergunt .And. ! Empty(cPergunt),Alltrim(cPergunt)+" ?",cPergunt)
		cPerSpa	:= If(! "?" $ cPerSpa  .And. ! Empty(cPerSpa) ,Alltrim(cPerSpa) +" ?",cPerSpa)
		cPerEng	:= If(! "?" $ cPerEng  .And. ! Empty(cPerEng) ,Alltrim(cPerEng) +" ?",cPerEng)

		Reclock( "SX1" , .T. )

		Replace X1_GRUPO   With cGrupo
		Replace X1_ORDEM   With cOrdem
		Replace X1_PERGUNT With cPergunt
		Replace X1_PERSPA  With cPerSpa
		Replace X1_PERENG  With cPerEng
		Replace X1_VARIAVL With cVar
		Replace X1_TIPO    With cTipo
		Replace X1_TAMANHO With nTamanho
		Replace X1_DECIMAL With nDecimal
		Replace X1_PRESEL  With nPresel
		Replace X1_GSC     With cGSC
		Replace X1_VALID   With cValid

		Replace X1_VAR01   With cVar01

		Replace X1_F3      With cF3
		Replace X1_GRPSXG  With cGrpSxg

		If Fieldpos("X1_PYME") > 0
			If cPyme != Nil
				Replace X1_PYME With cPyme
			Endif
		Endif

		Replace X1_CNT01   With cCnt01
		If cGSC == "C"			// Mult Escolha
			Replace X1_DEF01   With cDef01
			Replace X1_DEFSPA1 With cDefSpa1
			Replace X1_DEFENG1 With cDefEng1

			Replace X1_DEF02   With cDef02
			Replace X1_DEFSPA2 With cDefSpa2
			Replace X1_DEFENG2 With cDefEng2

			Replace X1_DEF03   With cDef03
			Replace X1_DEFSPA3 With cDefSpa3
			Replace X1_DEFENG3 With cDefEng3

			Replace X1_DEF04   With cDef04
			Replace X1_DEFSPA4 With cDefSpa4
			Replace X1_DEFENG4 With cDefEng4

			Replace X1_DEF05   With cDef05
			Replace X1_DEFSPA5 With cDefSpa5
			Replace X1_DEFENG5 With cDefEng5
		Endif

		Replace X1_HELP  With cHelp

		PutSX1Help(cKey,aHelpPor,aHelpEng,aHelpSpa)

		MsUnlock()
	Else

	   lPort := ! "?" $ X1_PERGUNT .And. ! Empty(SX1->X1_PERGUNT)
	   lSpa  := ! "?" $ X1_PERSPA  .And. ! Empty(SX1->X1_PERSPA)
	   lIngl := ! "?" $ X1_PERENG  .And. ! Empty(SX1->X1_PERENG)

	   If lPort .Or. lSpa .Or. lIngl
			RecLock("SX1",.F.)
			If lPort
	         SX1->X1_PERGUNT:= Alltrim(SX1->X1_PERGUNT)+" ?"
			EndIf
			If lSpa
				SX1->X1_PERSPA := Alltrim(SX1->X1_PERSPA) +" ?"
			EndIf
			If lIngl
				SX1->X1_PERENG := Alltrim(SX1->X1_PERENG) +" ?"
			EndIf
			SX1->(MsUnLock())
		EndIf
	Endif

	RestArea( aArea )

Return
