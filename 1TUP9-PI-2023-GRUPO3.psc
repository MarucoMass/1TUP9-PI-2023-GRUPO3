Algoritmo sin_titulo
	
	Definir opcionS Como Entero
	
	Definir entrada, entradaMayu Como Caracter
	
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
				
				//Funcion reservar
				
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