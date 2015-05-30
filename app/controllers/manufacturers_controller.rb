class ManufacturersController < ApplicationController
  before_filter :find_manufacturer

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to root_path, notice: %Q(Successfully created "#{@manufacturer.name}".)
    else
      render :new
    end
  end

  def update
    if @manufacturer.update_attributes(manufacturer_params)
      redirect_to root_path, notice: %Q(Successfully updated "#{@manufacturer.name}.")
    else
      render :edit
    end
  end

  def destroy
    @manufacturer.destroy
    redirect_to root_path
  end

private

  def find_manufacturer
    @manufacturer = Manufacturer.find(params[:id]) if params[:id]
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :description, :web_url, :support_url)
  end
end
