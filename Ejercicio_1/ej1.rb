def pagina(dato1, dato2, arr, color)
	File.open("index.html", "w") { |f|  
		f.puts "<html><body>"
    f.puts "
    <style> 
    p {
      background-color: #{color}
    }
    </style>
    "
    f.puts "<p>#{dato1}</p>"
		f.puts "<p>#{dato2}</p>"
    if arr.any? #.any verifica si el arreglo viene vacio, o nulo	
      f.puts "<ol>"     
      arr.each do |i|
        f.puts "<li>#{i}</li>"
      end
      f.puts "</ol>"
    end
    f.puts "</body></html>"
	}

  nil #El metodo al final retorna un nil
end

puts "Ingrese caracteres separados por (,)"
dato = gets.chomp #Recibe la palabra como string
puts "Ingrese color en ingles"
color = gets.chomp
puts "\n"
puts "Archivo creado correctamente (Ver en carpeta)"
puts "\n"

arreglo = dato.split(",") #La palabra la guarda en el arreglo, y split separa la palabra por ,

pagina("Hola","mundo",arreglo,color)