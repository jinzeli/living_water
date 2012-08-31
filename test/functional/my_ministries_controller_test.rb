# -*- encoding : utf-8 -*-
require 'test_helper'

class MyMinistriesControllerTest < ActionController::TestCase
  setup do
    @my_ministry = my_ministries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_ministries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_ministry" do
    assert_difference('MyMinistry.count') do
      post :create, my_ministry: @my_ministry.attributes
    end

    assert_redirected_to my_ministry_path(assigns(:my_ministry))
  end

  test "should show my_ministry" do
    get :show, id: @my_ministry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_ministry.to_param
    assert_response :success
  end

  test "should update my_ministry" do
    put :update, id: @my_ministry.to_param, my_ministry: @my_ministry.attributes
    assert_redirected_to my_ministry_path(assigns(:my_ministry))
  end

  test "should destroy my_ministry" do
    assert_difference('MyMinistry.count', -1) do
      delete :destroy, id: @my_ministry.to_param
    end

    assert_redirected_to my_ministries_path
  end
end
