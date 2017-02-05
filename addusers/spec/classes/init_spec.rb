require 'spec_helper'
describe 'addusers' do

  context 'with defaults for all parameters' do
    it { should contain_class('addusers') }
  end
end
