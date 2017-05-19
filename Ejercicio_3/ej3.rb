#3) Contando palabras

#1° Método - Contador de palabras
def contando(archivo)
	file = File.open(archivo, "r")
	contenido = file.readlines 
	file.close
	palabras = contenido.count #Asigna a palabra el contenido count
	"El archivo tiene #{palabras} palabras"
end

puts contando("palabras.txt")

puts "\n"

#2° Método - Contador de palabras especificas
def contandostr(archivo, str)
	file = File.open(archivo, "r")
	contenido = file.read
	file.close
	palabras = contenido.split("\n")
	suma = 0
	palabras.each do |i|
		if str == i
			suma += 1
		end
	end
	"La palabra #{str} se repite #{suma} veces en el archivo"
end

puts contandostr("palabras.txt", "twain")
