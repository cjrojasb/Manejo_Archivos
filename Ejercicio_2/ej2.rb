def cont archivo
	file = File.open(archivo, "r")
	contenido = file.readlines 
	file.close
	lineas = contenido.count
	"El archivo tiene #{lineas} lineas en total"
end

puts cont("contando.txt")


