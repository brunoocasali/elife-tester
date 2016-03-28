require 'spec_helper'
require 'support/login_page.rb'

RSpec.feature 'Dashboard' do
  let!(:brand_name) { [*('a'..'z')].sample(8).join }

  before(:each) { LoginPage.new.login }

  scenario 'login' do
    expect(page).to have_css('div.user-photo')
  end

  scenario 'need to have a folder called Coca' do
    list = page.all('li.folder-list.ng-scope')

    expect(list[0].find('h2').text).to eq('Coca')
  end

  context 'Brands management' do
    scenario 'become true the visibilty of settings box' do
      expect(page).to have_css('div.box-settings', visible: false)
      
      find('.bt-settings').click

      expect(page).to have_css('div.box-settings', visible: true)
    end

    scenario 'find settings button and click to manage brands' do
      find('.bt-settings').click

      find("a[href='/user/brands/edit']", text: 'Brands').click
    end

    scenario 'assets the folder called brand_name' do
      visit '/user/brands/edit'

      find('.ng-pristine.ng-untouched.ng-valid').set(brand_name)
      find('a.bt.bt-see-my-reports', text: 'See my reports').click
      find('a.bt.submit.done-action', text: 'Save').click

      sleep 20

      expect(page).to have_selector('h2', text: /#{brand_name}/i)
    end
  end
end
