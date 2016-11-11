require 'test_helper'

class ScoutsControllerTest < ActionDispatch::IntegrationTest
  test "index test" do
    get '/'
    assert_select 'h1', '500PX SCOUT'
  end

  test "scout search" do
    get '/scouts/:user', params: { search: 'juliana_nan'}
    assert_select 'h2', 'juliana_nan'
  end
  
  test "scout search" do
    get '/scouts/:user', params: { search: 'so'}
    assert_select 'h2', 'There was a error searching for: so'
  end

end
