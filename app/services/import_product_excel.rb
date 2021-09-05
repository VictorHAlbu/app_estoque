require 'roo'
class ImportProductExcel
  attr_accessor :file, :path, :capture_errors

  def initialize(path)
      @path = Roo::Spreadsheet.open(path)
      @capture_errors = []
  end

  def import
    create_objects
  end

  def errors
   @capture_errors
  end

  private

  def create_objects
    headers = path.row(1)
    @path.each_with_index do |row, idx|
      next if idx == 0 
      @parse_data = Hash[[headers, row].transpose]
      
      produto = Produto.new(@parse_data)
      produto.save!
    end
   
  end

end