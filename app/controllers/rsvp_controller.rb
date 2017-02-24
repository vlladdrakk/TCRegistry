class RsvpController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    access_code = params[:access_code]
    # Verify access code
    invalid_code = AccessCode.where(
      active: true,
      code: access_code
    ).empty?

    if invalid_code
      render json: {
        result: "Invalid Code",
        code: "500"
      } and return
    end

    rsvp_data = {
      comment: params[:comments],
      attending: params[:attending]
    }
    begin
      Rsvp.create(rsvp_data)

      render json: {
        result: "success",
        code: "200"
      }
    rescue
      render json: {
        result: "An unexpected error occured...Now locating a repair monkey",
        code: "500"
      }
    end
  end
end
