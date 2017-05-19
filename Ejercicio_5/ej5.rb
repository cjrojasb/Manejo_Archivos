def stock(archivo)
  file = File.open(archivo, "r")
  contenido = file.readlines
  file.close

  opcion = 0

  while opcion != 5
    puts "\n"
    puts "Menú"
    puts "Elige una de las siguientes opciones
    1) Suma total de productos de todas las bodegas
    2) Buscar stock por producto especifico
    3) Ver productos que falta registrar en cada bodega
    4) Registrar nuevo producto con sus respectivos stock
    5) Salir"

    opcion = gets.chomp.to_i

    case opcion
    when 1
      suma = 0
      contenido.each do |values|
        arr = values.split(", ")
        suma += arr[1].to_i + arr[2].to_i + arr[3].to_i
      end
      puts "La cantidad total de productos es #{contenido.count}"
      puts "\n"
      puts "La cantidad total de productos por cada bodega es #{suma}"

    when 2
      total = 0
      puts "Ingrese un producto para buscar"
      produ = gets.chomp
      contenido.each do |values|
        arr = values.split(", ")
        if produ == arr[0]
          total = arr[1].to_i + arr[2].to_i + arr[3].to_i
        end
      end

      if total != 0
        puts "El producto #{produ} tiene un stock total de #{total}"
      else
        puts "El producto ingresado no existe"
      end

    when 3
      contenido.each do |values|
        arr = values.split(", ") 
        new_arr = []
        nr = 0
        arr.each do |new_values|
          if new_values.chomp == "NR"
            new_arr.push(nr)
          end
          nr += 1
        end
        if new_arr.count > 0
          new_arr.each do |i|
            puts "El producto #{arr[0]} debe registrar en la bodega #{i}"
          end
        end
      end

    when 4
      puts "Ingresar un nuevo producto (nombre, stock1, stock2, stock3)
      EJ: Computador, 1, 2, 3"
      new_pro = gets.chomp
      File.open(archivo, "a") { |add|
        add.puts new_pro
      }
      puts "\n"
      puts "Producto ingresado correctamente (Revisar archivo)"

    end

    if opcion > 5
      puts "\n"
      puts "La opción ingresada no es valida"
    end
  end
end

stock("stock5.txt")