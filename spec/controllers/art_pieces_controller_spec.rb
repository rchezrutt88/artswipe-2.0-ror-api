require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ArtPiecesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ArtPiece. As you add validations to ArtPiece, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:art_piece)
  }

  let(:invalid_attributes) {
    attributes_for(:void_art_piece)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtPiecesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:expected_keys) {['id', 'title', 'artist', 'url', 'created_at', 'updated_at']}

  describe "GET #index" do


    before do
      create(:art_piece)
      create(:art_piece)
      get :index, params: {}, session: valid_session
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "returns an array of length equal to num art_pieces" do
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
    end

    it "each JSON object in returned array represents a complete art_piece" do
      json = JSON.parse(response.body)
      json.each do |art_piece|
        expect(art_piece.keys).to contain_exactly(*expected_keys)
      end
    end



  end

  describe "GET #show" do
    it "returns a success response" do
      art_piece = ArtPiece.create! valid_attributes
      get :show, params: {id: art_piece.to_param}, session: valid_session
      expect(response).to be_success
    end

    it "returns a valid JSON art_piece" do
      art_piece = create(:art_piece)
      get :show, params: {id: art_piece.id}
      response.body.should == art_piece.to_json
    end

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ArtPiece" do
        expect {
          post :create, params: {art_piece: valid_attributes}, session: valid_session
        }.to change(ArtPiece, :count).by(1)
      end

      it "renders a JSON response with the new art_piece" do

        post :create, params: {art_piece: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(art_piece_url(ArtPiece.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new art_piece" do

        post :create, params: {art_piece: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested art_piece" do
        art_piece = ArtPiece.create! valid_attributes
        put :update, params: {id: art_piece.to_param, art_piece: new_attributes}, session: valid_session
        art_piece.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the art_piece" do
        art_piece = ArtPiece.create! valid_attributes

        put :update, params: {id: art_piece.to_param, art_piece: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the art_piece" do
        art_piece = ArtPiece.create! valid_attributes

        put :update, params: {id: art_piece.to_param, art_piece: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested art_piece" do
      art_piece = ArtPiece.create! valid_attributes
      expect {
        delete :destroy, params: {id: art_piece.to_param}, session: valid_session
      }.to change(ArtPiece, :count).by(-1)
    end
  end

end
