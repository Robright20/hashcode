require 'pry'

class Library
	attr_accessor :id, :books, :time, :scan_max, :books_ids

	def initialize(lib_id, books, time, scan_max)
		@lib_id = lib_id
		@books = books
		@time = time
		@scan_max = scan_max
	end

	def books_ids=(books_ids)
		@books_ids = books_ids
	end
end

class Book
	attr_accessor :id, :score, :lib_id 

	def initialize(id, score, lib_id)
		@id = id
		@score = score
		@lib_id = lib_id
	end
end

class Solve
	@numline = 0
	File.open(ARGV[0]).each do |line|
		if @numline == 0
			split = line.split
			@books_num = split[0].to_i
			@lib_num = split[1].to_i
			@deadline = split[2].to_i
		end
		if (@numline == 1)
			split = line.split
			@books = []
			i = 0
			while i < @books_num 
				@books << Book.new(i, split[i].to_i, 0)
				i += 1
			end
		end
		if (@numline == 2)
			split = line.split
			@libs = []

			i = 0
			@libs << Library.new(0, split[0].to_i, split[1].to_i, split[2].to_i)
		end
		if (@numline == 3)
			split = line.split

			@libs[0].books_ids = split.map {|x| x.to_i }
		end
		if (@numline == 4)
			split = line.split

			i = 0
			@libs << Library.new(1, split[0].to_i, split[1].to_i, split[2].to_i)
		end
		if (@numline == 5)
			split = line.split

			@libs[1].books_ids = split.map {|x| x.to_i }
			binding.pry
		end
		@numline += 1
	end
	puts @deadline
	puts @lib_num
	puts @books_num

end
