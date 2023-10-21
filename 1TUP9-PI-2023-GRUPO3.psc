Algoritmo sin_titulo
	
	Definir opcionS, stockVacunas, indice Como Entero
	indice = 0

	Definir entrada, entradaMayu, turnosHorarios, horarios, vacunas, pacientes Como Caracter
	
	// array con las horas
    Dimension horarios[8]
    horarios[0] = "  1- 08:00"
    horarios[1] = "  2- 08:30"
    horarios[2] = "  3- 09:00"
    horarios[3] = "  4- 09:30"
    horarios[4] = "  5- 10:00"
    horarios[5] = "  6- 10:30"
    horarios[6] = "  7- 11:00"
    horarios[7] = "  8- 11:30"
	
	// array con los dias
	Dimension turnosHorarios[5, 9]
	turnosHorarios[0,0] = "1. Lunes"
	turnosHorarios[1,0] = "2. Martes"
	turnosHorarios[2,0] = "3. Miércoles"
	turnosHorarios[3,0] = "4. Jueves"
	turnosHorarios[4,0] = "5. Viernes"
	
	// ciclo para cargar el arreglo de los horarios
	Para i = 0 Hasta 4 
		Para j = 0 Hasta 7  
			turnosHorarios[i,j + 1] = horarios[j]
		FinPara
	FinPara
	
	// array de vacunas
	Dimension vacunas[6]
	vacunas[0] = "1-Neumococo conjugada"
	vacunas[1] = "2-Poliomielitis (IPV o Salk)"
	vacunas[2] = "3-Quíntuple (o pentavalente)"
	vacunas[3] = "4-Rotavirus"
	vacunas[4] = "5-Meningococo"
	vacunas[5] = "6-Tripe Viral"
	
	// array del stock cuyo indice corresponde al del arrays de vacunas
	Dimension stockVacunas[6]
	stockVacunas[0] = 10
	stockVacunas[1] = 10
	stockVacunas[2] = 10
	stockVacunas[3] = 10
	stockVacunas[4] = 10
	stockVacunas[5] = 10
	
	Dimension pacientes[50, 6]
	
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
		
		
		Escribir "Ingrese un numero(o SALIR)"
		
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
				
				//Para i = 0 Hasta indice - 1 Hacer
					//para j = 0 hasta 5 Hacer
						//Mostrar pacientes[i, j]
					//FinPara
				//FinPara
			"2":
				
				Escribir "Funcion buscar"
				
				//Funcion buscar
				
			"3":
				
				Escribir "Funcion ver agenda"
				
				//Funcion ver agenda
				
			"4":
				
				Escribir "Funcion ordenar y mostrar"
				
				//Funcion ordenar y mostrar
				
			"5":
				
				Escribir "Funcion listado"
				
				//Funcion listado
				
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
			Mostrar arreglo[i, 0]
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
	
	//Si arreglo[dia - 1,0] == "No hay turnos disponibles para este día" Entonces
		//Mostrar "Error elija otro dia:"
		//mostrarHorarios(arreglo, filas, columnas, pacientes, indice,vacunas , stockVacunas, vacunasSelec)
	//FinSi
	
	Para i = 0 hasta filas - 1
		Mostrar arreglo[dia - 1, i]
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
	
	cargarPaciente(dia, hora, pacientes, arreglo, indice,vacunas, stockVacunas, vacunasSelec)
	
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
			mostrar vacunas[i]
		SiNo
			mostrar vacunas[i] , "STOCK AGOTADO" 
		FinSi
		
	Fin Para
FinSubProceso
SubProceso elegirVacuna(vacunas, stockVacunas Por Referencia, entrada, vacunaSelec Por Referencia)
	Mostrar "Que vacuna desea: "
	leer entrada
	vacunaSelec = vacunas[entrada-1]
	stockVacunas[entrada-1] = (stockVacunas[entrada-1])-1
	

	
	
FinSubProceso
	