class PedidoProduto < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  after_save :atualiza_valor_pedido

  private
  def atualiza_valor_pedido
    self.pedido.valor_total =  PedidoProduto.where(pedido_id: self.pedido_id).sum(:valor)
    self.pedido.save!
  end
  


end
