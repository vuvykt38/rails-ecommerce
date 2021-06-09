module Ext
  class WebhooksController  < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      Webhook.create(webhook_params)
      render json: {}, status: 200
    rescue ActiveRecord::RecordNotUnique => e
      Rails.logger.info("Not unique #{e}")
      render json: {}, status: 200
    end

    def facebook_verify
      render plain: params['hub.challenge']
    end

    private
    def webhook_params
      {
        external_event_id: params.dig("entry",0,"messaging",0,"message","mid"),
        event_type: params.dig("entry",0,"messaging",0,"message").present? ? "message" : "postback",
        provider: 'facebook',
        payload: params.permit!
      }
    end
  end
end
