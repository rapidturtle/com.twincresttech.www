class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def support
    @manufacturers = Manufacturer.where.not("support_url = ?", "")
  end
end
