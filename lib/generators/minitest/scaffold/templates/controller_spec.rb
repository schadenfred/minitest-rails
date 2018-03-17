require "test_helper"

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do
  <%- if mountable_engine? -%>
  include Engine.routes.url_helpers

  <%- end -%>
  Given(:<%= singular_table_name %>) { <%= fixture_name %> :one }

  describe "#index" do

    Given { get <%= index_helper %>_url }

    Then { value(response).must_be :success? }
  end

  describe "#new" do
    Given { get <%= new_helper %> }
    Then { value(response).must_be :success? }
  end

  describe "#create" do
    Given(:request) { post <%= index_helper %>_url, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> } }
    Then { expect { request }.must_change "<%= class_name %>.count" }

    must_redirect_to <%= singular_table_name %>_path(<%= class_name %>.last)
  end

  describe "#show" do
    Given { get <%= show_helper %> }
    Then { value(response).must_be :success? }
  end

  describe "#edit" do
    Given { get <%= edit_helper %> }
    Then { value(response).must_be :success? }
  end

  describe "#update" do
    Given { patch <%= show_helper %>, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> } }
    Then { must_redirect_to <%= singular_table_name %>_path(<%= "#{singular_table_name}" %>) }
  end

  describe "#destroy" do
    Then { expect {
      delete <%= show_helper %>
    }.must_change "<%= class_name %>.count", -1}

    And { must_redirect_to <%= index_helper %>_path }
  end
end
<% end -%>
