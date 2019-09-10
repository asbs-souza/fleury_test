Before do
    page.current_window.resize_to(1440, 900) 
end

Before('@login') do
    visit 'http://devcommercial.lenovo.com:8000/us/en/truscale'
    page.should have_selector('.fromLogin #loginForm')
    fill_in 'UserID', :with => "gatest_4@outlook.com"
    fill_in 'Password', :with => "lenovo123"
    find('#btnsignin').click
       page.should have_selector('#l-navbar-title-page')
end

After do |scenario|
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
    nome_cenario = nome_cenario.tr(' ', '_').downcase!

    if scenario.failed?
       screenshot = "log/screenshots/failed/#{nome_cenario}.png"
    else
       screenshot = "log/screenshots/passed/#{nome_cenario}.png"
       page.save_screenshot(screenshot)
       embed(screenshot, 'image/png', 'Evidence')
    end
end