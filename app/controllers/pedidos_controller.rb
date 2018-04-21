class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @items = @pedido.items
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    respond_to do |format|
      if verify_items && @pedido.save # TODO: deal with verify_items errors messages
        add_items
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if verify_items && @pedido.update(pedido_params) # TODO: deal with verify_items errors messages
        @pedido.items.each {|item| item.destroy}
        add_items
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:data, :hora, :nota_fiscal, :valor_frete, :desconto, :transportadora_id)
    end

    # TODO: write tests for this method
    def verify_items
      # must have one or more items
      return false unless params[:item]
      params[:item].delete_if {|i| i[:produto_id] + i[:valor] + i[:quantidade] == ""}
      return false if params[:item].length == 0
      params[:item].each do |i|
        # each item must have produto_id, valor and quantidade
        return false if i[:produto_id] == "" || i[:valor] == "" || i[:quantidade] == ""
        # quantidade > 0
        return false if i[:quantidade].to_f <= 0
        # the produto_id must correspond to a produto that exists
        return false unless Produto.exists? i[:produto_id]
      end
      return true
    end

    def add_items
      params[:item].each do |i|
        item = Item.new(produto_id: i[:produto_id], valor: i[:valor], quantidade: i[:quantidade],
                        pedido_id: @pedido.id)
        item.save
      end
    end
end
