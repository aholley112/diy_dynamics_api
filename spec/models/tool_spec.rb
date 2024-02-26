require 'rails_helper'

RSpec.describe Tool, type: :model do
  
    it 'is valid with valid attributes' do
        tool = Tool.new(tool_name: 'Hammer', description: 'A tool for nails') 
        expect(tool).to be_valid
      end
      
      it 'is not valid without a tool_name' do
        tool = Tool.new(description: 'A tool for nails')
        expect(tool).not_to be_valid
      end
      
        it 'is not valid without a description' do
        tool = Tool.new(tool_name: 'Hammer')
        expect(tool).not_to be_valid
      end

end
