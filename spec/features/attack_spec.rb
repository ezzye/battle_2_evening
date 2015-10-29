require 'spec_helper.rb'

feature 'Attack' do
  scenario 'attack player Aaron' do
    sign_in_and_play
    click_link('Attack Aaron')
    expect(page).to have_content 'Ivan attacked Aaron'
  end

  scenario 'reduce Aaron hit points' do
    sign_in_and_play
    click_link('Attack Aaron')
    expect(page).not_to have_content 'Aaron has 100 hit points'
    expect(page).to have_content 'Aaron has 80 hit points'
  end
  scenario 'after attacking going back to play page' do
    sign_in_and_play
    click_link('Attack Aaron')
    click_link('Switch Turn')
    expect(page).to have_content 'Attack Ivan'
  end
  scenario 'after being attacked Aaron score changes' do
    sign_in_and_play
    click_link('Attack Aaron')
    click_link('Switch Turn')
    expect(page).to have_content 'Aaron HP = 80'
  end
  scenario 'after attacking Aaron score stays the same' do
    sign_in_and_play
    click_link('Attack Aaron')
    click_link('Switch Turn')
    expect(page).to have_content 'Ivan HP = 100'
  end
  scenario 'after attacking Ivan score reduces by 20' do
    sign_in_and_play
    click_link('Attack Aaron')
    click_link('Switch Turn')
    click_link('Attack Ivan')
    expect(page).not_to have_content 'Ivan has 100 hit points'
    expect(page).to have_content 'Ivan has 80 hit points'
  end

end
