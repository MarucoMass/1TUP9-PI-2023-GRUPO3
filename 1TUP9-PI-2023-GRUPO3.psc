Algoritmo sin_titulo
	
	Definir opcionS, stockVacunas, indice Como Entero
	Definir entrada, entradaMayu, turnosHorarios, horarios, vacunas, pacientes Como Caracter
	indice = 0


	// array con las horas
    Dimension horarios[8]
    horarios[0] = "08:00"
    horarios[1] = "08:30"
    horarios[2] = "09:00"
    horarios[3] = "09:30"
    horarios[4] = "10:00"
    horarios[5] = "10:30"
    horarios[6] = "11:00"
    horarios[7] = "11:30"
	
	// array con los dias
	Dimension turnosHorarios[5, 9]
	turnosHorarios[0,0] = "Lunes"
	turnosHorarios[1,0] = "Martes"
	turnosHorarios[2,0] = "Miércoles"
	turnosHorarios[3,0] = "Jueves"
	turnosHorarios[4,0] = "Viernes"
	
	// ciclo para cargar el arreglo de los horarios
	Para i = 0 Hasta 4 
		Para j = 0 Hasta 7  
			turnosHorarios[i,j + 1] = horarios[j]
		FinPara
	FinPara
	
	// array de vacunas
	Dimension vacunas[6]
	vacunas[0] = "Neumococo conjugada"
	vacunas[1] = "Poliomielitis (IPV o Salk)"
	vacunas[2] = "Quíntuple (o pentavalente)"
	vacunas[3] = "Rotavirus"
	vacunas[4] = "Meningococo"
	vacunas[5] = "Tripe Viral"
	
	// array del stock cuyo indice corresponde al del arrays de vacunas
	Dimension stockVacunas[6]
	stockVacunas[0] = 10
	stockVacunas[1] = 10
	stockVacunas[2] = 10
	stockVacunas[3] = 10
	stockVacunas[4] = 10
	stockVacunas[5] = 10
	
	Dimension pacientes[5, 6]
	Dimension pacientesOrdenados[5, 6]
	
	entrada = ""
	
	Repetir
		
		Escribir "1. Reservar turno"
		
		Escribir "2. Buscar paciente"
		
		Escribir "3. Ver agenda vacunatorio"
		
		Escribir "4. Ordenar y mostrar lista pacientes"
		
		Escribir "   a. Por edad"
		
		Escribir "   b. Por vacuna a aplicar"
		
		Escribir "5. Listado/s"
		
		Escribir "   a. Cantidad turnos otorgados por día"
		
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		
		
		Escribir "Ingrese un numero (o SALIR)"
		
		Leer entrada
		entradaMayu = Mayusculas(entrada)
		
		Repetir
			
			si entrada <> "1" y entrada <> "5" y entrada <> "2" y entrada <>"3" y entrada <> "4" y entradaMayu <> "SALIR" Entonces
				
				Escribir " Error, ingrese nuevamente:"
				Leer entrada
				entradaMayu = Mayusculas(entrada)
			FinSi
		Hasta Que (entrada = "1" o entrada = "5" o entrada = "2" o entrada = "3" o entrada = "4" o entradaMayu = "SALIR")
		
		Segun entrada Hacer
			
			"1":
				Escribir "Funcion reservar"
				mostrarHorarios(turnosHorarios, 5, 9, pacientes,indice, vacunas, stockVacunas, vacunasSelec)
				
			"2":
				
				Escribir "Funcion buscar"
				buscarPaciente(pacientes)
				
			"3":
				
				Escribir "Funcion ver agenda"
				mostrarAgenda(turnosHorarios,5,9)
				
			"4":
				
				Escribir "Funcion ordenar y mostrar"
				ordenarYMostrar(pacientes, 5)
			
				
			"5":
				
				Escribir "Funcion listado"
				mostrarContadores(pacientes, 5)
				
		Fin Segun
		
	Mientras Que (entradaMayu <> "SALIR") 
	
	Escribir "Se salio del sistema"
	
FinAlgoritmo



SubProceso mostrarHorarios(arreglo, filas, columnas, pacientes, indice Por Referencia,vacunas , stockVacunas Por Referencia, vacunasSelec Por Referencia)
	Para i = 0 Hasta filas - 1
		contador = 0
		todasLibres = Verdadero 
		Para j = 1 hasta columnas - 1
			Si arreglo[i, j] == "  Ocupado" Entonces
				contador = contador + 1
			FinSi
		FinPara
		Si contador == columnas - 1 Entonces
			todasLibres = Falso
		FinSi
		Si todasLibres Entonces
			Mostrar i + 1, " - ", arreglo[i, 0]
		SiNo
			Mostrar "No hay turnos disponibles para este día"
		FinSi
	FinPara
	
	// mando a llamar este subproceso aca para que una vez que muestre los dias se ejecute la eleccion del horario
	//tambien por si elige un dia "ocupado" asi vuelve para atras y elige otro dia
	elegirHorario(arreglo, 9, pacientes, indice,vacunas, stockVacunas, vacunasSelec)
	
FinSubProceso


SubProceso elegirHorario(arreglo, filas, pacientes, indice Por Referencia, vacunas, stockVacunas Por Referencia, vacunasSelec Por Referencia)
	Escribir "Elija el dia 1-5"
	Leer dia
	Mientras dia < 1 o dia > 5
		Escribir "Error: elija el dia 1-5"
		Leer dia
	FinMientras
	
	//Para i = 0 hasta filas - 1
		//Mostrar arreglo[dia - 1, i]
	//FinPara
	
	Para i = dia - 1 Hasta dia - 1 Hacer
		Mostrar arreglo[dia - 1, 0], ":"
		para j = 1 hasta 7 Hacer
			Mostrar "  ", j, " - ", arreglo[dia - 1, j]
		FinPara
	FinPara
	
	Escribir "Elija la hora 1-8"
	Leer hora
	
	Mientras hora < 1 o hora > 8 
		Escribir "Error: elija el horario 1-8"
		Leer hora
	FinMientras
	
	// Aca si elige un dia que esta "ocupado" manda a llamar al subproceso que muestra los dias
	Mientras arreglo[dia - 1, hora] = "  Ocupado"
		Escribir "Elija otro horario por favor. Ese ya está ocupado"
		Leer hora
		//mostrarHorarios(arreglo, 5, 9, pacientes, indice)
	FinMientras
	
	cargarPaciente(dia, hora, pacientes, arreglo, indice, vacunas, stockVacunas, vacunasSelec)
	
	arreglo[dia - 1, hora] = "  Ocupado"

FinSubProceso



SubProceso cargarPaciente(dia, hora, pacientes, arregloHorario, indice Por Referencia,vacunas, stockVacunas Por Referencia, vacunasSelec Por Referencia)
	Definir nombre, apellido, dni, edad Como Cadena
	
		Escribir "Ingrese su nombre"
		Leer nombre
		
		Escribir "Ingrese su apellido"
		Leer apellido
		
		nombreCompleto = nombre + " " + apellido
		pacientes[indice, 0] = nombreCompleto
		
		Escribir "Ingrese su dni"
		Leer dni
		pacientes[indice, 1] = dni
		
		Escribir "Ingrese su edad"
		Leer edad
		
		pacientes[indice, 2] = edad
		mostrarVacuna(vacunas, stockVacunas,6)
		elegirVacuna(vacunas, stockVacunas, entrada, vacunaSelec)
		pacientes[indice, 3] = vacunaSelec
		
		pacientes[indice, 4] = arregloHorario[dia - 1, 0]
		
		pacientes[indice, 5] = arregloHorario[dia  - 1,hora]
		
		indice = indice + 1
		
FinSubProceso

SubProceso mostrarVacuna(vacunas, stockVacunas,filas)
	Para i<- 0 Hasta filas-1 Hacer
		si stockVacunas[i] > 0 Entonces
			mostrar i + 1, " - ", vacunas[i]
		SiNo
			mostrar i + 1, " - ", vacunas[i] , " - STOCK AGOTADO" 
		FinSi
	Fin Para
FinSubProceso

SubProceso elegirVacuna(vacunas, stockVacunas Por Referencia, entrada, vacunaSelec Por Referencia)
	Mostrar "Que vacuna desea: "
	Leer entrada
	vacunaSelec = vacunas[entrada-1]
	stockVacunas[entrada-1] = (stockVacunas[entrada-1])-1
FinSubProceso

SubProceso ordenarYMostrar(array, filas)
	Definir orden Como Caracter
	Repetir
		Escribir "Ordenar y mostrar lista pacientes"
		Escribir "   a. Por edad"
		Escribir "   b. Por vacuna a aplicar"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	si orden="a" Entonces
		ordenarLista(array, filas , 6, 2)
	SiNo
		ordenarLista(array, filas , 6, 3)
	FinSi
FinSubProceso

SubProceso ordenarLista(array, filas, columnas, columnaAOrdenar)
	//Para i = 0 Hasta 4 Hacer
		//arrayOrdenado[i, 0] = array[i, 0]
		//para j = 1 hasta 5 Hacer
			//arrayOrdenado[i, j] = array[i, j]
		//FinPara
	//FinPara
	
	Definir aux, aux2 Como caracter; //cambiar el tipo de dato según el tipo de datos del array
	Para i<-0 Hasta filas-2 Hacer //recorro las filas del array hasta la penultima
		para k<-i+1 hasta filas-1 Hacer //recorro las filas del array hasta la última
			si array[i,columnaAOrdenar] > array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta columnas-1 Hacer //recorro las columnas del array
					aux <- array[i,j];
					//aux2 = arrayOrdenado[i, j] 
					
					array[i,j] <- array[k,j]; 
					//arrayOrdenado[i, j] = array[k, j]
					
					array[k,j] <- aux; 
					//arrayOrdenado[k, j] = aux2
					
				Fin Para
			FinSi
		FinPara
	FinPara
	
	Para i = 0 Hasta 4 Hacer
		para j = 0 hasta 5 Hacer
			Mostrar array[i, j]
		FinPara
	FinPara
FinSubProceso

SubProceso buscarPaciente(array) 
	Mostrar"Ingrese su dni:"
	Leer dni
	Para i<-0 Hasta array-1  Hacer
		Si array[i,1] = dni Entonces
			Para j<-0 Hasta 5 Hacer
				Mostrar array[i,j]
			Fin Para
		FinSi
	Fin Para
FinSubProceso

SubProceso mostrarAgenda(array,filas,columnas)
	Para i<-0 Hasta filas-1  Hacer
		Mostrar array[i,0]
		Para j<-1 Hasta columnas-1 Hacer
			mostrar array[i,j]
		Fin Para
	Fin Para
FinSubProceso

SubProceso mostrarContadores(array, filas)
	Definir orden Como Caracter
	Repetir
		Escribir "Listado/s"
		Escribir "   a. Cantidad turnos otorgados por día"
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	Si orden="a" Entonces
		contadorDeDias(array, filas, 4)
	SiNo
		contadorDeVacunas(array, filas, 3)
	FinSi
FinSubProceso

SubProceso contadorDeDias(array, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun array[i, j] Hacer
				"Lunes":
					contador1 = contador1 + 1
				"Martes":
					contador2 = contador2 + 1
				"Miércoles":
					contador3 = contador3 + 1
				"Jueves":
					contador4 = contador4 + 1
				"Viernes":
					contador5 = contador5 + 1
				De Otro Modo:
			Fin Segun
		Fin Para
	Fin Para
	Mostrar "La cantidad de turnos para el Lunes es de: ", contador1
	Mostrar "La cantidad de turnos para el Martes es de: ", contador2
	Mostrar "La cantidad de turnos para el Miercoles es de: ", contador3
	Mostrar "La cantidad de turnos para el Jueves es de: ", contador4
	Mostrar "La cantidad de turnos para el Viernes es de: ", contador5
FinSubProceso

SubProceso contadorDeVacunas(array, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5, contador6 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun array[i, j] Hacer
				"Neumococo conjugada":
					contador1 = contador1 + 1
				"Poliomielitis (IPV o Salk)":
					contador2 = contador2 + 1
				"Quíntuple (o pentavalente)":
					contador3 = contador3 + 1
				"Rotavirus":
					contador4 = contador4 + 1
				"Meningococo":
					contador5 = contador5 + 1
				"Tripe Viral":
					contador6 = contador6 + 1
				De Otro Modo:
			Fin Segun
		Fin Para
	Fin Para
	Mostrar "La cantidad de vacunas a aplicar para  Neumococo conjugada es de: ", contador1
	Mostrar "La cantidad de vacunas a aplicar para  Poliomielitis (IPV o Salk) es de: ", contador2
	Mostrar "La cantidad de vacunas a aplicar para Quíntuple (o pentavalente) es de: ", contador3
	Mostrar "La cantidad de vacunas a aplicar para Rotavirus es de: ", contador4
	Mostrar "La cantidad de vacunas a aplicar para  Meningococo es de: ", contador5
	Mostrar "La cantidad de vacunas a aplicar para  Tripe Viral es de: ", contador6
FinSubProceso
	