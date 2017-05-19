def stock(archivo)
  file = File.open(archivo, "r")
  contenido = file.readlines
  file.close
  opcion = 0
  arr = []
  
  while opcion != 4
    suma = 0
    puts "\n"
    puts "Menú"
    puts "\n"
    puts "Ingrese una opción:
    1) Ver cantidad de productos
    2) Buscar por nombre de producto
    3) Ver productos con stock menor a 5 
    4) Salir"

    opcion = gets.chomp.to_i

    case opcion
    when 1
      contenido.each do |value|
        arr = value.split(", ")
        suma += arr[1].to_i
      end

      puts "La cantidad de productos en el archivo es #{contenido.count}" 
      puts "\n"
      puts "La cantidad total de stock es #{suma}"

    when 2
      total = 0
      puts "Ingrese un producto"
      produ = gets.chomp
      contenido.each do |value|
        arr = value.split(", ")
        if produ == arr[0]
          total = arr[1].chomp.to_i
        end
      end

      if total != 0
        puts "El producto #{produ} tiene #{total} cantidad de stock"
      else
        puts "El producto ingresado no existe"
      end

    when 3
      new_arr = []
      contenido.each do |value|
        arr = value.split(", ")
        if arr[1].to_i < 5
          new_arr.push(arr[0])
        end
      end
      puts "Los productos con stock menor a 5 son #{new_arr}"
    end

    if opcion > 4
      puts "\n"
      puts "Opción ingresada no es valida, intente nuevamente"
    end
  end
end

stock("stock.txt")