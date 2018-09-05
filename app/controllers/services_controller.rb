class ServicesController < ApplicationController
  def index
    @services = Service.all.where.not(latitude: nil, longitude: nil)
    if params[:category].present?
      @markers = @services.where(category: params[:category]).map do |service|
        {
          lat: service.latitude,
          lng: service.longitude,
          infoWindow:  {content: render_to_string(partial: "services/map_box", locals: { service: service })},
          icon: { url: ActionController::Base.helpers.image_url('orangepin.png')}
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    else
      @markers = @services.map do |service|
        {
          lat: service.latitude,
          lng: service.longitude,
          infoWindow:  {content: render_to_string(partial: "services/map_box", locals: { service: service })},
          icon: { url: ActionController::Base.helpers.image_url('orangepin.png')}
        }
      end
    end
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
