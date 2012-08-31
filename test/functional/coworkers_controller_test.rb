# -*- encoding : utf-8 -*-
require 'test_helper'

class CoworkersControllerTest < ActionController::TestCase
  setup do
    @coworker = coworkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coworkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coworker" do
    assert_difference('Coworker.count') do
      post :create, coworker: @coworker.attributes
    end

    assert_redirected_to coworker_path(assigns(:coworker))
  end

  test "should show coworker" do
    get :show, id: @coworker.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coworker.to_param
    assert_response :success
  end

  test "should update coworker" do
    put :update, id: @coworker.to_param, coworker: @coworker.attributes
    assert_redirected_to coworker_path(assigns(:coworker))
  end

  test "should destroy coworker" do
    assert_difference('Coworker.count', -1) do
      delete :destroy, id: @coworker.to_param
    end

    assert_redirected_to coworkers_path
  end
end
