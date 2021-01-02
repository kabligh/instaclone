require 'rails_helper.rb'

feature 'Creating posts' do

  scenario 'can create a post' do
    visit '/'
    click_link 'New post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New post'
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content('Stop. You need an image to post.')
  end

end
