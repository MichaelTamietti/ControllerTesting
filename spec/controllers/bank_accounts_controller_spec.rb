require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  
  # logs in user (our created test user), before tests
  login_user

  # an attribute we can use to test to pass
  let(:valid_attributes) {
    { institution: 'Chase', amount: 200, active: true }
  }

  # an attribute we can use to test to fail
  let(:invalid_attributes) {
    { institution: '', amount: 200, active: true }
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attributes
      get :show, params: { id: bank_account.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attributes
      get :edit, params: { id: bank_account.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new bank account" do
        expect {
          post :create, params: { bank_account: valid_attributes }
      }.to change(BankAccount, :count).by(1)
      end
      
      it "redirects to the created bank account" do
        post :create, params: { bank_account: valid_attributes }
        expect(response).to redirect_to(BankAccount.last)
      end
    end

    context "with invalid params" do
      it "does not create a bank account" do
        expect {
          post :create, params: { bank_account: invalid_attributes }
      }.to change(BankAccount, :count).by(0)
      end
    end

      it "return the form" do
        post :create, params: { bank_account: invalid_attributes }
        expect(response).to be_successful
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { amount: 220 }
      }

      it "updates the bank account" do
        bank_account = @user.bank_accounts.create! valid_attributes
        put :update, params: { id: bank_account.id, bank_account: new_attributes }
        bank_account.reload
        # make sure the amount is 220
        expect(bank_account.amount).to eq(new_attributes[:amount])
      end

      it "redirects to bank account" do
        bank_account = @user.bank_accounts.create! valid_attributes
        put :update, params: { id: bank_account.id, bank_account: new_attributes }
        expect(response).to redirect_to(bank_account)
      end
    end

    context "with invalid params" do

      it "updates the bank account" do
        bank_account = @user.bank_accounts.create! invalid_attributes
        put :update, params: { id: bank_account.id, bank_account: invalid_attributes }
        bank_account.reload
        expect(bank_account.amount).to_not eq(invalid_attributes[:institution])
      end

      it "redirects to bank account" do
        bank_account = @user.bank_accounts.create! valid_attributes
        put :update, params: { id: bank_account.id, bank_account: invalid_attributes }
        expect(response).to redirect_to(bank_account)
      end
    end    
  end

  describe "Delete #destroy" do
    it "destroys the bank account" do
      bank_account = @user.bank_accounts.create! valid_attributes
      expect {
        delete :destroy, params: { id: bank_account.id }
    }.to change(BankAccount, :count).by(-1)
    end

    it "redirects to the bank account" do
      bank_account = @user.bank_accounts.create! valid_attributes
      delete :destroy, params { id: bank_account.id }
      expect(response).to redirect_to(bank_accounts_url)
    end
  end

end
