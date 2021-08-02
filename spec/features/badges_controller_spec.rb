describe 'BadgesController' do
  describe '#new' do
    it 'renders submit new badge page for unlogged user' do
      visit root_path

      expect(page).to have_http_status(:ok)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Submit badge')
    end

    context 'when invalid data provided' do
      it 'renders new badge page with error message' do
        visit new_badge_path

        fill_in 'submit_badge_form_issue_date', with: '21/08/2021'
        fill_in 'submit_badge_form_recipient_name', with: 'Jhon'
        fill_in 'submit_badge_form_uuid', with: 'INVALID_UUID'

        click_on 'Submit to Chainpoint'

        expect(page).to have_http_status(:ok)
        expect(page).to have_current_path(badges_path)
        expect(page).to have_content('Uuid must be a valid UUID')
      end
    end

    context 'when valid data provided' do
      it 'renders success page' do
        visit new_badge_path

        fill_in 'submit_badge_form_issue_date', with: '21/08/2021'
        fill_in 'submit_badge_form_recipient_name', with: 'Jhon'
        fill_in 'submit_badge_form_uuid', with: 'Ia8254e2f-6f05-4ee4-b038-2997553f8a94'

        click_on 'Submit to Chainpoint'

        expect(page).to have_http_status(:ok)
        expect(page).to have_current_path(badges_path)
        expect(page).to have_content('Badge submitted successfully!')
      end
    end
  end
end
