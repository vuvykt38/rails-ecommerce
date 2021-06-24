class NewslettersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def subscribe
    redirect_back(fallback_location: store_index_path, flash: { success: 'Thanks for subscribing.' })
  end
end
