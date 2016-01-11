require 'spec_helper'
describe 'honeycombui' do

  context 'with defaults for all parameters' do
    it { should contain_class('honeycombui') }
  end
end
