require 'spec_helper'

RSpec.describe Log do
  
  describe 'validations' do
    before do
      @log = Log.create(object_type: 'user', object_id: '1', author_id: 1, action: 'delete', serialized_object: { name: 'teste' })
    end

    %w(object_type object_id author_id action serialized_object).each do |field|
      it "validates the presence of #{field}" do
        @log.send "#{field}=", nil
        @log.save
        expect(@log).not_to be_valid
      end
    end
  end
end
