shared_context :log_in_user do
  let(:user) { create(:user) }
  before { sign_in user }
end
