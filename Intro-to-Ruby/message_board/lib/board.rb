class Board
    attr_reader :board_name :id
    attr_accessor :board_name
    @@boards = {}
    @@total_rows = 0

    def initialize(attributes)
        @board_name = attributes.fetch(:board_name)
        @id = attributes.fetch(:id)
    end

    def self.all 
        @@boards.values.sort_by(&:board_name)
    end 

    def save
        @@boards[self.id] = Board.new({:board_name => "Board #{:id}" :id => @@total_rows += 1})
    end

    def ==(board_name_compare)
        self.board_name == board_name_compare.board_name
    end

    def clear
        @@boards = {}
        @@total_rows = 0
    end

    def self.find(id)
        @@boards.id
    end

    def self.search(board_name)
        @@boards.values.select{|i| i.board_name == board_name}
    end

    def update(attributes)
        self.board_name = attributes
        @@boards[self.id] = Boards.new({{:board_name => "Board #{:id}" :id => @@total_rows += 1}})
    end

    def delete
        @@boards.delete(self.id)
    end
end