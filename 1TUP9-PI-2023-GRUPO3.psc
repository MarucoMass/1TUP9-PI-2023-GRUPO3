Algoritmo turnosVacunatorio
	
	Definir opcionS, stockVacunas, indicePaciente Como Entero
	Definir entrada, entradaMayu, turnosHorarios, horarios, vacunas, pacientes Como Caracter
	Definir diaLibre, nombreDuplicado, dniDuplicado Como Logico
	entrada = ""
	indicePaciente = 0
	
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
	stockVacunas[0] = 1
	stockVacunas[1] = 10
	stockVacunas[2] = 10
	stockVacunas[3] = 10
	stockVacunas[4] = 10
	stockVacunas[5] = 10
	
	// array de los datos de los pacientes
	Dimension pacientes[5, 6]
	
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
				Escribir "Función reservar"
				reservarTurno(turnosHorarios, 5, 9, pacientes, indicePaciente, vacunas, stockVacunas, vacunasSelec, diaLibre, dniDuplicado)
				
			"2":
				Escribir "Función buscar"
				buscarPaciente(pacientes)
				
			"3":
				Escribir "Función ver agenda"
				mostrarAgenda(turnosHorarios, 5, 9)
				
			"4":
				Escribir "Función ordenar y mostrar"
				ordenarYMostrar(pacientes, 5, indicePaciente)
				
			"5":
				Escribir "Función listado"
				mostrarContadores(pacientes, 5)
				
		Fin Segun
		
	Mientras Que (entradaMayu <> "SALIR") 
	
	Escribir "Se salió del sistema."
	
FinAlgoritmo

SubProceso reservarTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente Por Referencia, vacunas, stockVacunas, vacunasSelec Por Referencia, diaLibre Por Referencia, dniDuplicado Por Referencia)
	diaLibre = Verdadero
	dniDuplicado = Falso
	mostrarDias(arregloHorarios, filas, columnas)
	elegirTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente, diaLibre)
	Si diaLibre
		cargarPaciente(pacientes, indicePaciente, nombreDuplicado, dniDuplicado)
		Si no dniDuplicado Entonces
			mostrarVacuna(pacientes, vacunas, stockVacunas, 6)
			elegirVacuna(pacientes, vacunas, stockVacunas, indicePaciente)
			indicePaciente = indicePaciente + 1
		FinSi
	FinSi
FinSubProceso

SubProceso mostrarDias(arregloHorarios, filas, columnas)
	Para i = 0 Hasta filas - 1
		contador = 0
		todasLibres = Verdadero 
		Para j = 1 hasta columnas - 1
			Si Longitud(arregloHorarios[i, j]) > 5  Entonces
				contador = contador + 1
			FinSi
		FinPara
		Si contador == columnas - 1 Entonces
			todasLibres = Falso
		FinSi
		Si todasLibres Entonces
			Mostrar i + 1, " - ", arregloHorarios[i, 0]
		SiNo
			Mostrar i + 1, " - ", arregloHorarios[i, 0], " - No hay turnos disponibles"
		FinSi
	FinPara
FinSubProceso

SubProceso elegirTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente Por Referencia, diaLibre Por Referencia)
	Definir cont Como Entero
	cont = 0
	Escribir "Elija el dia 1-5"
	Leer dia
	Mientras dia < 1 o dia > 5
		Escribir "Error: elija el dia 1-5"
		Leer dia
	FinMientras
	
	Para i = dia - 1 Hasta dia - 1 Hacer
		Para j = 1 hasta 7 Hacer
			Si Longitud(arregloHorarios[i, j]) > 5 Entonces
				cont = cont + 1
			FinSi
		FinPara
	FinPara
	
	Si cont >= 7 Entonces
		Escribir "El dia que eligió tiene todos los horarios ocupados."
		Escribir " "
		diaLibre = Falso
	Sino 
		Para i = dia - 1 Hasta dia - 1 Hacer
			Mostrar arregloHorarios[dia - 1, 0], ":"
			Para j = 1 hasta 7 Hacer
				Mostrar "  ", j, " - ", arregloHorarios[dia - 1, j]
			FinPara
		FinPara
		
		Escribir "Elija la hora 1-8"
		Leer hora
		
		Mientras hora < 1 o hora > 8 
			Escribir "Error: elija el horario 1-8"
			Leer hora
		FinMientras
		
		Mientras Longitud(arregloHorarios[dia - 1, hora]) > 5 
			Escribir "Elija otra hora por favor. Esa ya está ocupada"
			Leer hora
		FinMientras
		
		pacientes[indicePaciente, 4] = arregloHorarios[dia - 1, 0]
		
		pacientes[indicePaciente, 5] = arregloHorarios[dia  - 1, hora]
		
		diaOcupado = Concatenar(arregloHorarios[dia - 1, hora], " (Ocupado)")
		arregloHorarios[dia - 1, hora] =  diaOcupado
	FinSi
FinSubProceso

SubProceso cargarPaciente(pacientes, indicePaciente Por Referencia, nombreDuplicado Por Referencia, dniDuplicado Por Referencia)
	Definir nombre, apellido, dni, edad Como Cadena
	Definir edadEnMeses Como Real
	
		Escribir "Ingrese su nombre"
		Leer nombre
		Mientras Longitud(nombre) < 3
			Escribir "Ingrese su nombre"
			Leer nombre
		FinMientras
		
		Escribir "Ingrese su apellido"
		Leer apellido
		Mientras Longitud(apellido) < 2
			Escribir "Ingrese su apellido"
			Leer apellido
		FinMientras
		
		nombreCompleto = nombre + " " + apellido
		pacientes[indicePaciente, 0] = nombreCompleto
		
		Repetir
			Escribir "Ingrese su DNI"
			Leer dni
			Mientras ConvertirANumero(dni) < 1000000 o ConvertirANumero(dni) > 99999999
				Escribir "Ingrese un DNI válido"
				Leer dni
			FinMientras
			
			encontrarDNI = buscarDNI(pacientes, 5, 1, dni)
			
			Si no encontrarDNI Entonces
				dniDuplicado = Falso
				pacientes[indicePaciente, 1] = dni
				Escribir "Ingrese su edad"
				Leer edad
				Mientras ConvertirANumero(edad) < 0.1 o ConvertirANumero(edad) > 99
					Escribir "Ingrese su edad nuevamente"
					Leer edad
				FinMientras
				edadEnMeses = ConvertirANumero(edad) / 12
				pacientes[indicePaciente, 2] = ConvertirATexto(edadEnMeses)
			SiNo
				dniDuplicado = Verdadero
				Escribir "Ya hay otro paciente con ese DNI"
			FinSi
		Mientras Que encontrarDNI
FinSubProceso

SubProceso mostrarVacuna(pacientes, vacunas, stockVacunas, filas)
	Para i<- 0 Hasta filas-1 Hacer
		Si stockVacunas[i] > 0 Entonces
			Mostrar i + 1, " - ", vacunas[i]
		SiNo
			Mostrar i + 1, " - ", vacunas[i] , " - STOCK AGOTADO" 
		FinSi
	Fin Para
FinSubProceso

SubProceso elegirVacuna(pacientes, vacunas, stockVacunas, indicePaciente Por Referencia)
	Mostrar "Que vacuna desea: "
	Leer entrada
	Mientras stockVacunas[entrada-1] == 0
		Escribir "La vacuna que eligió no tiene más stock. Elija otra por favor"
		Leer entrada
	FinMientras
	vacunaSelec = vacunas[entrada-1]
	stockVacunas[entrada-1] = (stockVacunas[entrada-1])-1
	pacientes[indicePaciente, 3] = vacunaSelec
FinSubProceso

SubProceso ordenarYMostrar(arrayPacientes, filas, indicePacientes)
	Definir orden Como Caracter
	Repetir
		Escribir "Ordenar y mostrar lista pacientes"
		Escribir "   a. Por edad"
		Escribir "   b. Por vacuna a aplicar"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	si orden="a" Entonces
		ordenarLista(arrayPacientes, filas , 6, 2, indicePacientes)
	SiNo
		ordenarLista(arrayPacientes, filas , 6, 3, indicePacientes)
	FinSi
FinSubProceso

SubProceso ordenarLista(arrayPacientes, filas, columnas, columnaAOrdenar, indicePacientes)	
	Definir aux, aux2 Como caracter; 
	Para i<-0 Hasta filas-2 Hacer 
		para k<-i+1 hasta filas-1 Hacer 
			si arrayPacientes[i,columnaAOrdenar] < arrayPacientes[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta columnas-1 Hacer 
					aux <- arrayPacientes[i,j];
					arrayPacientes[i,j] <- arrayPacientes[k,j]; 
					arrayPacientes[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
	
	Para i = 0 Hasta indicePacientes - 1 Hacer
		Mostrar "Nombre y apellido: ", arrayPacientes[i, 0]
		Mostrar "DNI: ", arrayPacientes[i, 1]
		Mostrar "Edad: ", arrayPacientes[i, 2]
		Mostrar "Vacuna: ", arrayPacientes[i, 3]
		Mostrar "Día: ", arrayPacientes[i, 4]
		Mostrar "Hora: ", arrayPacientes[i, 5]
		Mostrar " "
	FinPara
FinSubProceso

SubProceso buscarPaciente(arrayPacientes) 
    Definir dni Como Caracter
    Definir i como Entero
    Definir encontrado Como Logico
	
    Mostrar"Ingrese el dni: "
    Leer dni
    i = 0
    encontrado = Falso
	
    Mientras i < 5 y no encontrado
        Si arrayPacientes[i,1] == dni Entonces
            encontrado = Verdadero
            Mostrar "Nombre y apellido: ", arrayPacientes[i, 0]
            Mostrar "DNI: ", arrayPacientes[i, 1]
            Mostrar "Edad: ", arrayPacientes[i, 2]
            Mostrar "Vacuna: ", arrayPacientes[i, 3]
            Mostrar "Día: ", arrayPacientes[i, 4]
            Mostrar "Hora: ", arrayPacientes[i, 5]
			Mostrar " "
        FinSi
        i = i + 1
    FinMientras
	
    Si no encontrado  Entonces
        Escribir "No se encontró el DNI buscado"
		Escribir " "
    FinSi
FinSubProceso

Funcion encontrado = buscarDNI(arrayPacientes, filas, columnaABuscar, datoAEncontrar)  
    Definir encontrado Como Logico
    indexPaciente = 0
    encontrado = Falso

    Mientras indexPaciente < filas - 1 y no encontrado
        Si arrayPacientes[indexPaciente, columnaABuscar] == datoAEncontrar Entonces
            encontrado = Verdadero
        FinSi
		indexPaciente =  indexPaciente + 1
    FinMientras
FinFuncion

SubProceso mostrarAgenda(array,filas,columnas)
	Para i<-0 Hasta filas-1  Hacer
		Mostrar Sin Saltar array[i,0], ": "
		Para j<-1 Hasta columnas-1 Hacer
			mostrar sin saltar array[i,j], " | "
		Fin Para
		Mostrar " "
		Mostrar " "
	Fin Para
FinSubProceso

SubProceso mostrarContadores(arrayPacientes, filas)
	Definir orden Como Caracter
	Repetir
		Escribir "Listado/s"
		Escribir "   a. Cantidad turnos otorgados por día"
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	Si orden="a" Entonces
		contadorDeDias(arrayPacientes, filas, 4)
	SiNo
		contadorDeVacunas(arrayPacientes, filas, 3)
	FinSi
FinSubProceso

SubProceso contadorDeDias(arrayPacientes, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun arrayPacientes[i, j] Hacer
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

SubProceso contadorDeVacunas(arrayPacientes, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5, contador6 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun arrayPacientes[i, j] Hacer
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
	Mostrar "La cantidad de vacunas a aplicar para Neumococo conjugada es de: ", contador1
	Mostrar "La cantidad de vacunas a aplicar para Poliomielitis (IPV o Salk) es de: ", contador2
	Mostrar "La cantidad de vacunas a aplicar para Quíntuple (o pentavalente) es de: ", contador3
	Mostrar "La cantidad de vacunas a aplicar para Rotavirus es de: ", contador4
	Mostrar "La cantidad de vacunas a aplicar para Meningococo es de: ", contador5
	Mostrar "La cantidad de vacunas a aplicar para Tripe Viral es de: ", contador6
FinSubProceso
	