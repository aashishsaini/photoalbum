require 'spec_helper'

describe 'GadgetsController' do
  it "displays the sign in form to the user" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "Sign in"
  end

  it "displays the sign up form to the user" ,:js=> true do
    visit '/users/sign_up'
    sleep 10
    page.should have_content "Sign up"
  end


  ################## Happy case  signup##################
  it "user sign's up in the application" ,:js=> true do
    visit '/users/sign_up'
    sleep 3
    page.should have_content "Sign up"
    fill_in 'user_name' ,:with => 'test_user'
    fill_in "#user_email" ,:with => "test_user123@yopmail.com"
    fill_in "#user_password" ,:with => "test_user123"
    fill_in "#user_password_confirmation" ,:with => "test_user123"
    click_button "Sign up"
    sleep 10
  end

  ################## failure case  signup ##################
  it "user sign's up fails in the application if balnk form submits" ,:js=> true do
    visit '/users/sign_up'
    sleep 3
    page.should have_content "Sign up"
    click_button "Sign up"
    sleep 10
    page.should have_content "Name can't be blank"
    page.should have_content "Email can't be blank"
  end

  ################## failure case  signup##################
  it "user sign's up fails in the application if email id exists" ,:js=> true do
    visit '/users/sign_up'
    sleep 3
    page.should have_content "Sign up"
    fill_in 'user_name' ,:with => 'test_user'
    fill_in "#user_email" ,:with => "aashish@yopmail.com"
    fill_in "#user_password" ,:with => "test_user123"
    fill_in "#user_password_confirmation" ,:with => "test_user123"
    click_button "Sign up"
    sleep 10
    page.should have_content "Email already been taken"
  end

  ################## failure case  signup##################
  it "user sign's up fails in the application if password doesn't match" ,:js=> true do
    visit '/users/sign_up'
    sleep 3
    page.should have_content "Sign up"
    fill_in 'user_name' ,:with => 'test_user'
    fill_in "#user_email" ,:with => "aashish@yopmail.com"
    fill_in "#user_password" ,:with => "test_user123"
    fill_in "#user_password_confirmation" ,:with => "test_user1234"
    click_button "Sign up"
    sleep 10
    page.should have_content "Password confirm must match password"
  end

  ################## failure case  signin##################
  it "user sign's in fails in the application if password doesn't match" ,:js=> true do
    visit '/'
    sleep 3
    page.should have_content "Sign in"
    fill_in "#user_email" ,:with => "aashish@yopmail.com"
    fill_in "#user_password" ,:with => "test_user123"
    click_button "Sign in"
    sleep 10
    page.should have_content "Please enter valid username and password"
  end

  ################## Happy case  signin##################
  it "user sign's in  in the application" ,:js=> true do
    visit '/'
    sleep 3
    page.should have_content "Sign in"
    fill_in "#user_email" ,:with => "aashish@yopmail.com"
    fill_in "#user_password" ,:with => "test123456"
    click_button "Sign in"
    sleep 10
    page.should have_content "All Gadgets"
  end

  ################## Happy case  signin##################
  it "verify all links on gadgets page" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
  end

  ################## Happy case  signin##################
  it "user displays all gadgets on list view" ,:js=> true do
    visit '/'
    sleep 3
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "List View"
  end

  ################## Happy case  signin##################
  it "user displays all gadgets on Iconic view" ,:js=> true do
    visit '/'
    sleep 3
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "Iconic View"
  end

  ################## Happy case  signin##################
  it "user displays all gadgets on created by him" ,:js=> true do
    visit '/'
    sleep 3
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "View My Gadgets"
  end

  ################## Happy case  signin##################
  it "user visits on add new gadget page" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "Add New Gadget"
    page.should have_content "Add New Gadget"
  end

  ################## Happy case  signin##################
  it "user creates a new gadget" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "Add New Gadget"
    page.should have_content "Add New Gadget"
    fill_in 'name' , :with => "test gadget 12345"
    click_button 'Save'
    sleep 10
  end

  ################## Happy case  signin##################
  it "user creates a new gadget" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "Add New Gadget"
    page.should have_content "Add New Gadget"
    fill_in 'name' , :with => "test gadget 12345"
    click_button 'Save'
    sleep 10
  end

  ################## Happy case  signin##################
  it "user uploads a new photo to a new gadget" ,:js=> true do
    visit '/'
    sleep 10
    page.should have_content "All Gadgets"
    page.should have_content "List View"
    page.should have_content "Iconic View"
    page.should have_content "View My Gadgets"
    page.should have_content "Add New Gadget"
    click_on "Add New Gadget"
    page.should have_content "Add New Gadget"
    fill_in 'name' , :with => "test gadget 12345"
    click_button 'Save'
    sleep 10
    attach 'photo_gadget_photo', :with => 'test.jpg'
    click_button 'Save'
    sleep 5
    page.should have_content "photo uploaded successfully"
  end

end