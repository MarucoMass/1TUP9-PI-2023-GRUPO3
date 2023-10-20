Algoritmo sin_titulo
	
	Definir opcionS Como Entero
	

	Definir entrada, entradaMayu, turnosHorarios, horarios Como Caracter
	
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
				
				mostrarHorarios(turnosHorarios, 5, 9)
				
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



SubProceso mostrarHorarios(arreglo, filas, columnas)
	Para i = 0 Hasta filas - 1
		Mostrar arreglo[i, 0] , ":"
		Para j = 1 hasta columnas - 1
			Mostrar "  " , arreglo[i, j]
		FinPara
	FinPara
	
	// mando a llamar este subproceso aca para que una vez que muestre los dias se ejecute la eleccion del horario
	//tambien por si elige un dia "ocupado" asi vuelve para atras y elige otro dia
	elegirHorario(arreglo, 9)
	
FinSubProceso


SubProceso elegirHorario(arreglo, filas)
	Escribir "Elija el dia 1-5"
	Leer dia
	
	Mientras dia < 1 o dia > 5
		Escribir "Error: elija el dia 1-5"
		Leer dia
	FinMientras
	
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
	Si arreglo[dia - 1, hora] = "Ocupado"
		Escribir "Elija otro horario por favor. Ese ya está ocupado"
		mostrarHorarios(arreglo, 5, 9)
	FinSi
	
	arreglo[dia - 1, hora] = "Ocupado"

FinSubProceso

	