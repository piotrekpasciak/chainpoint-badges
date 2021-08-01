feature 'HomeController' do
  context '#index' do
    scenario 'Unlogged user vists home page' do
      visit root_path

      expect(page).to have_http_status(:ok)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Home page')
    end
  end
end
