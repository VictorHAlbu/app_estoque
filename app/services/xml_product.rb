class XmlProduct
  class_attribute :file, :base_structure, :params

  def initialize(file, params)
    self.file = file
    self.product_attributes = []
    self.params = params
  end

  def call
    read_and_validate_xml_file
    create_or_update_a_vendor
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
  
  #Cadastra ou altera os dados do fornecedor
  # def create_or_update_a_vendor
  #   vendor = self.base_structure[:emit]

  #   #selecionando ou criando um novo fornecedor
  #   self.client = self.account.clients.where(category: [:vendor, :both]).find_or_initialize_by(document: vendor[:cnpj])
  
  #   self.client.assign_attributes({
  #     name: vendor[:x_nome],
  #     author: self.author,
  #     category: self.client.new_record? ? :vendor : self.client.category,
  #     contact_attributes: {
  #       phone: vendor[:ender_emit][:fone],
  #       zipcode: vendor[:ender_emit][:cep],
  #       address: vendor[:ender_emit][:x_lgr],
  #       complement: vendor[:ender_emit][:x_cpl],
  #       number: vendor[:ender_emit][:nro],
  #       district: vendor[:ender_emit][:x_bairro],
  #       city: vendor[:ender_emit][:x_mun],
  #       state: vendor[:ender_emit][:uf],
  #       country: 'BR',
  #     }
  #   })
  #   self.client.save!
  # end

  # def create_a_product_list
  #   products = self.base_structure[:det]
  #   method = products.is_a?(Array) ? 'each' : 'tap'
  #   products.send(method) do |product|
  #     #adicionar o produto na lista de produtos
  #     self.product_attributes.push({
  #       product: find_or_create_a_product(product[:prod]),
  #       amount: product[:prod][:v_prod].to_f,
  #       quantity: product[:prod][:q_com],
  #     })
      
  #   end
  # end 

 
end