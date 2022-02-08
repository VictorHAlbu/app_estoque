class XmlProduct
  attr_accessor :file, :base_structure, :produto_attributes, :produto

  def initialize(file)
    self.file = file
    self.produto_attributes = []
  end

  def import
    read_and_validate_xml_file
    create_product
  end

  private
  
  #Responsável por ler o arquivo e validar se o layout é de uma NF-e
  def read_and_validate_xml_file
    self.file = Hash.from_xml(
      Nokogiri::XML.parse(self.file).to_s.gsub("\n", "")
    ).deep_transform_keys { |key| key.to_s.underscore.to_sym }
    self.base_structure =  self.file[:nfe_proc][:n_fe][:inf_n_fe] if self.file.has_key?(:nfe_proc)
    self.base_structure =  self.file[:n_fe][:inf_n_fe] if self.file.has_key?(:n_fe)
    
    raise 'O arquivo importado não é uma nota fiscal' if self.base_structure.blank?
  end

  def create_product
    produtos = self.base_structure[:det]
    produtos.each do |key, value|
      produto = Produto.new
      produto.preco_compra = key[:prod][:v_prod].to_f
      produto.quantidade = key[:prod][:q_com]
      produto.nome = key[:prod][:x_prod]
      produto.save!
    end
  end

  # def find_or_create_a_product(product_attributes)
  #   produto.assign_attributes({
  #     preco_compra: produto_attributes[:v_prod].to_f,
  #     quantidade: produto_attributes[:q_com],
  #     nome: produto_attributes[:x_prod]
  #   })    
  #   produto.save!
  # end
 
end