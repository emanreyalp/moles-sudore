# frozen_string_literal: true

require 'rails_helper'

describe 'Activities', mask_errors: true do
  describe '#POST create', :uses_active_job do
    def request(method, endpoint, params = {}, headers = {})
      options = { params: final_params, headers: headers }
      options[:as] = :json

      send(method, endpoint, options)
    end

    let(:method_call) do
      request(:post, '/activities', params, default_headers)
    end
    let(:params) do
      {
        activity: {
          name: 'asd',
          date: Time.now
        }
      }

    end

    let(:default_headers) do
      {
        'HTTP_ACCEPT' => 'application/json',
        'HTTP_USER_AGENT' => 'AmigaVoyager/2.95 (compatible; MC680x0; AmigaOS; SV1)'
      }
    end

    it do
      binding.pry
    end
  end
end