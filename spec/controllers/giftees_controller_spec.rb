require 'rails_helper'

RSpec.describe GifteesController, type: :controller do
  let(:giftee) { Giftee.create(name: "Ada") }

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
    it "assigns all giftees as @giftees" do
      get :index, id: giftee.id
      expect(assigns(:giftees)).to eq([giftee])
    end
  end

  describe "GET 'new'" do
  it "renders the new view" do
    get :new
    expect(subject).to render_template :new
  end
  it "assigns a new giftee as @giftee" do
    get :new, id: giftee.id
    expect(assigns(:giftee)).to be_a_new(Giftee)
  end
end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, {id: giftee.id}, giftee_id: giftee.id
      expect(subject).to render_template :show
    end
    it "assigns the requested giftee as @giftee" do
      get :show, {id: giftee.id}, giftee_id: giftee.id
      expect(assigns(:giftee)).to eq(giftee)
    end
  end

  describe "POST 'create'" do
    let(:create_params) do
       { giftee: { name: "Santa" }}
    end
    it "redirects to giftees page" do
      post :create, create_params
      expect(subject).to redirect_to giftees_path
    end
    it "creates a new Giftee" do
      expect {
        post :create, create_params
      }.to change(Giftee, :count).by(1)
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, {id: giftee.id}, giftee_id: giftee.id
      expect(subject).to render_template :edit
    end
    it "assigns the requested giftee as @giftee" do
      get :edit, {id: giftee.id}, giftee_id: giftee.id
      expect(assigns(:giftee)).to eq(giftee)
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do
      { id: giftee.id,
        giftee: { name: "Santa Claus" }}
    end

    context "with valid update params" do
      it "redirects to giftee show page" do
        patch :update, update_params, giftee_id: giftee.id
        expect(subject).to redirect_to giftee_path(giftee.id)
      end
    end
   end

   describe "DELETE 'destroy'" do
     it "redirects to giftees_path on delete" do
       delete :destroy, id: giftee.id
       expect(subject).to redirect_to giftees_path
     end
   end

 end
