require 'test_helper'

class ScoutsControllerTest < ActionDispatch::IntegrationTest
  test "index test" do
    get '/'
    assert_select 'h1', '500PX SCOUT'
  end

  test "scout search" do
    get '/scouts/:user', params: { search: 'sofia'}
    assert_select 'h2', 'sofia'
  end

end
