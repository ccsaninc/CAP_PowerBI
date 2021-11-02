
*------ Formulas usadas para el caculo de los indicadores -------*

D_Año_Infor_PocO = YEAR('FI_Data_Ind_Infor (Poc_Ocu)'[Fecha_ID])

*------

D_AñoP-1_Infor_PocO = CALCULATE(
                MIN('FI_Data_Ind_Infor (Poc_Ocu)'[D_Año_Infor_PocO]),DATEADD(Calendario[Fecha_ID],-1,YEAR)
)

*------

D_AñoP-2_Infor_PocO = CALCULATE(
                MIN('FI_Data_Ind_Infor (Poc_Ocu)'[D_Año_Infor_PocO]),DATEADD(Calendario[Fecha_ID],-2,YEAR)
)

*------

POB_Infor_Ind_PocO = 
    var Rojo = UNICHAR(9660)
    var Verde = UNICHAR(9650)
    var Neutro = UNICHAR(9665)
    return
    if( [POB_Infor_Varabs_PocO]>0, Verde, if( [POB_Infor_Varabs]=0, Neutro, Rojo))

POB_Infor_Ind_Color_PocO = if ( [POB_Infor_Varabs_PocO]>0.01, 1,IF([POB_Infor_Varabs_PocO]=0, 0,-1))

*------

POB_Infor_Var_%_PocO = 

        Var Presente =  SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes]
        Var Pasado =   CALCULATE(SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes],SAMEPERIODLASTYEAR(Calendario[Fecha_ID]))

        Return 

IF(AND(Presente = 0, Pasado=0),0,IF(AND(Presente > 0, Pasado=0), 100, IF(aND(Presente = 0, Pasado>0), -100, ((Presente/Pasado)-1)*100)))

*------

POB_Infor_Varabs_PocO = 

    Var Presente =  SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes]
    Var Pasado =   CALCULATE(SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes],SAMEPERIODLASTYEAR(Calendario[Fecha_ID]))

    Return 

Presente - Pasado

*------

POB_InforP_PocO = SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes]

*------

POB_InforP-1_PocO = CALCULATE(
                SUM('FI_Data_Ind_Infor (Poc_Ocu)'[OC])/[P_No_Mes],DATEADD(Calendario[Fecha_ID],-1,YEAR)
    )

*------

Tip_Trabajador_Infor_PocO = IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="For_DANE_0","Formal",IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="Inf_DANE_1","Informal", IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="For_SS_0","Formal", IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="Inf_SS_1","Informal", IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="For_Salud_0","Formal", IF('FI_Data_Ind_Infor (Poc_Ocu)'[Cod_Informalidad]="Inf_Salud_1","Informal",""))))))

*------

TS_Infor_Ind_PocO = 
    var Rojo = UNICHAR(9660)
    var Verde = UNICHAR(9650)
    var Neutro = UNICHAR(9665)
    return
    if( [TS_Infor_Varabs_PocO]>0, Verde, if( [TS_Infor_Varabs_PocO]=0, Neutro, Rojo))

*------

  TS_Infor_Varabs_PocO = 

    Var Presente =  [TS_InforP]
    Var Pasado =   [TS_InforP-1]

    Return 

   Presente - Pasado

*------

   TS_InforP_PocO = (CALCULATE([POB_InforP_PocO],'FI_Data_Ind_Infor (Poc_Ocu)'[Tip_Trabajador_Infor_PocO] = "Informal")/[POB_InforP_PocO])*100

*------

   TS_InforP-1_PocO = CALCULATE(
               [TS_InforP],DATEADD(Calendario[Fecha_ID],-1,YEAR)
    )