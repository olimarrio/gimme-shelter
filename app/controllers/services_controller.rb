class ServicesController < ApplicationController
  def index
    @services = Service.filter(params.slice(:starts_with))
  end

  def show
    @service = Service.find(params[:id])
  end


  private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:starts_with)
end

end
