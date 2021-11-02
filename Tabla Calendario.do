
*----- Tabla Calendario ------------*

*----------

Calendario = CALENDAR(FIRSTDATE(FI_Data_Ind_Infor[Fecha_ID]),LASTDATE(FI_Data_Ind_Infor[Fecha_ID])) 

* Variable resultado: Remonbrar a Fecha_ID

*-----------

D_Año = YEAR(Calendario[Fecha_ID])

*-----------

D_Mes = MONTH(Calendario[Fecha_ID])


*-----------

D_Trimestre = ROUNDUP(Calendario[D_Mes]/3,0)

*-----------

D_Semestre = ROUNDUP(Calendario[D_Mes]/6,0)

*-----------

Nb_Mes = LEFT(UPPER(Calendario[Fecha_ID].[Mes])) & MID(Calendario[Fecha_ID].[Mes],2,10)

*-----------

Nb_Trimestre = "Trimestre "&Calendario[D_Trimestre]

*-----------

Nb_Semestre = "Semestre "&Calendario[D_Semestre]

*-----------

Año_Mes = Calendario[D_Año] & " - " & Calendario[Nb_Mes]

*-----------

No_Mes = FORMAT(Calendario[D_Mes],"0#") & ". " &Calendario[Nb_Mes]

*-----------

Año_Nb_Mes = Calendario[D_Año] & " - " & LEFT(Calendario[Nb_Mes],3)

*-----------

Año_No_Mes = Calendario[D_Año] & " - " & FORMAT(Calendario[D_Mes],"0#") 