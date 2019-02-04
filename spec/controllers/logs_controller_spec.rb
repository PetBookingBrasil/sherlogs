require 'spec_helper'
require 'rails_helper'

describe LogsController do

  before do
    @valid_params = {
      object_type: 'user',
      object_id: '1',
      author_id: 1,
      action: 'delete',
      serialized_object: { name: 'teste' }
    }
  end

  describe '#create' do
    context 'when valid' do
      it 'create a new log' do
        @coded_params = Authenticator.new(@valid_params).encode
        post :create, params: { log: @coded_params }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when invalid' do
      it 'dont create a new log' do
        @coded_params = Authenticator.new(@valid_params.except!(:object_type)).encode
        post :create, params: { log: @coded_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
