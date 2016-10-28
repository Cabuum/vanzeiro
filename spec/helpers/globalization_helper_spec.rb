require 'rails_helper'

RSpec.describe GlobalizationHelper, type: :helper do
  describe '.translate_model_name' do
    it { expect(tm(User)).to eq('Usuário') }
    it { expect(tm(User, count: 2)).to eq('Usuários') }
  end

  describe '.translate_model_name_pluralized' do
    it { expect(tmp(User)).to eq('Usuários') }
  end

  describe '.translate_model_attribute' do
    it { expect(ta(User, :name)).to eq('Nome') }
  end
end
