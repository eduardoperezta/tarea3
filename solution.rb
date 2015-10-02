class Node
	def initialize (data,refe = nil) #Valores por default
		@data = data #asigna data de inicializacion a variable
		@refe = refe   #asigna data de inicializacion a variable
	end
	
 	#definicion de metodos

#geters
	def get_refe
		return @refe #regrasa refe
	end
 

	def get_data
		return @data #regresa data de inicializacion a variable
	end

#seters
	def set_data(newdata) 
		@data = newdata #asigna un nuevo valor a data
	end


	def set_refe(newrefe)
		@refe = newrefe #asigna nueva refe a refe
	end
end

class Linkedlist
	def initialize 
		@tamanio = 0	#
		@header = nil 	#
	end

	def add_element(a)
		@tamanio = @tamanio + 1
		if @header == nil
				@header = Node.new(a)
		else
		newNode = @header
			while newNode.get_refe!= nil
				  newNode = newNode.get_refe
			end
		newNode.set_refe(Node.new(a))
		end
	end

	def  display_List
		newNode = @header
		acum = []
		while newNode.get_refe != nil
			acum += [newNode.get_data]
			newNode = newNode.get_refe
		end
		acum += [newNode.get_data]
		puts acum.join(",") #esto encadena todo y te ahorra todo lo de abajo
	end

	def erase_element(borrar_Elemento)
		newNode = @header

		if newNode.get_data == borrar_Elemento
			@header = @header.get_refe
		else
			newNode = @header
			while (newNode.get_refe != nil) && ((newNode.get_refe).get_data != borrar_Elemento)
				newNode = newNode.get_refe
			end
			if (newNode != nil) && (newNode.get_refe != nil)
				newNode.set_refe((newNode.get_refe).get_refe)
			end
		end

	end

end

myList = Linkedlist.new

alto = 1

while alto != -1
	e = gets.chomp 
	if e.to_i == -1
		alto = -1
	else
		myList.add_element(e)
	end
end

myList.display_List

begin
puts "Dato a borrar: "
t=gets.chomp
myList.erase_element(t)
myList.display_List
end
