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
    @items = []
  end

  # GET /pedidos/1/edit
  def edit
    @items = @pedido.items
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @items = get_items
    respond_to do |format|
      if validate_items && @pedido.save # TODO: deal with validate_items errors messages
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
      if validate_items && @pedido.update(pedido_params) # TODO: deal with validate_items errors messages
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

    def get_items
      items = []
      if params[:item]
        params[:item].delete_if {|i| i[:produto_id] + i[:valor] + i[:quantidade] == ""}
        params[:item].each do |i|
          items.append(Item.new(produto_id: i[:produto_id],
                                valor: i[:valor],
                                quantidade: i[:quantidade]))
        end
      end
      return items
    end

    # TODO: write tests for this method
    def validate_items
      # must have one or more items
      return false if @items.empty?
      @items.each do |i|
        # each item must have produto, valor and quantidade > 0
        return false unless i.produto && i.valor && i.quantidade && i.quantidade > 0
      end
      return true
    end

    def add_items
      @items.each do |i|
        i.pedido = @pedido
        i.save
      end
    end
end
