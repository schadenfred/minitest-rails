require "test_helper"

<% module_namespacing do -%>
class <%= class_name %>ControllerTest < ActionDispatch::IntegrationTest
Given(:<%= class_name.to_s.downcase %>) { <%= class_name.classify.constantize.table_name %>.new }

<% if mountable_engine? -%>
  include Engine.routes.url_helpers

<% end -%>
<% if actions.empty? -%>
  # def test_sanity
  #   flunk "Need real tests"
  # end
<% else -%>
<% actions.each do |action| -%>
  def test_<%= action %>
    get <%= url_helper_prefix %>_<%= action %>_url
    assert_response :success
  end

<% end -%>
<% end -%>
end
<% end -%>
