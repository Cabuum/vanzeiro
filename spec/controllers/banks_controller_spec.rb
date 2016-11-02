require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  let(:valid_attributes) { attributes_for(:bank) }
  let(:invalid_attributes) { attributes_for(:invalid_bank) }

  describe 'GET #index' do
    it 'returns a collection of banks' do
      bank = create :bank, valid_attributes

      get :index

      expect(assigns(:banks)).to include(bank)
    end
  end

  describe 'GET #show' do
    it 'returns a bank passed by param' do
      bank = create :bank, valid_attributes

      get :show, params: { id: bank.to_param }

      expect(assigns(:bank)).to eq(bank)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new bank' do
        expect do
          post :create, bank: valid_attributes
        end.to change(Bank, :count).by(1)
      end

      it 'assigns a newly created bank as @bank' do
        post :create, bank: valid_attributes

        expect(assigns(:bank)).to be_a(Bank)
        expect(assigns(:bank)).to be_persisted
      end

      it 'redirects to the created bank' do
        post :create, bank: valid_attributes

        expect(response).to be_created
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved bank as @bank' do
        post :create, bank: invalid_attributes

        expect(assigns(:bank)).to be_a_new(Bank)
      end

      it 'return bank for unprocessed entity' do
        post :create, bank: invalid_attributes

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for :bank, name: 'nn', abbreviation: 'ky'
      end

      it 'updates the requested bank' do
        bank = create :bank, valid_attributes

        put :update, params: {
          id: bank.to_param, bank: new_attributes
        }

        bank.reload

        expect(bank.name).to eq('nn')
        expect(bank.abbreviation).to eq('ky')
        expect(response).to be_success
      end

      it 'assigns the requested bank as @bank' do
        bank = create :bank, valid_attributes

        put :update, id: bank.to_param, bank: valid_attributes

        expect(assigns(:bank)).to eq(bank)
      end
    end

    context 'with invalid params' do
      it 'assigns the bank as @bank' do
        bank = create :bank, valid_attributes

        put :update, id: bank.to_param, bank: invalid_attributes

        expect(assigns(:bank)).to eq(bank)
      end

      it 'return bank for unprocessed entity' do
        bank = create :bank, valid_attributes

        put :update, id: bank.to_param, bank: invalid_attributes

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested bank' do
      bank = create :bank, valid_attributes

      expect do
        delete :destroy, id: bank.to_param
      end.to change(Bank, :count).by(-1)
    end

    it 'redirects to the bank list' do
      bank = create :bank, valid_attributes

      delete :destroy, id: bank.to_param

      expect(response).to be_success
    end
  end
end
