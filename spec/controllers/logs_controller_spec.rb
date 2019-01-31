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
        post :create, params: { log: @valid_params } 
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when valid' do
      it 'dont create a new log' do  
        post :create, params: { log: @valid_params.except!(:object_type) }
        expect(response).to have_http_status(:unprocessable_entity) 
      end
    end
  end
end