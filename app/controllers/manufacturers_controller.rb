class ManufacturersController < ApplicationController
  def index
    @manufacturers = []
  end

  def new
    @manufacturer = Manufacturer.new
  end
end
