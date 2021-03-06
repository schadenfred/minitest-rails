require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %> do

  subject { <%= class_name %> }

  describe "db" do

    specify "columns & types" do

    end

    specify "indexes" do

    end

  end

  describe "associations" do
    specify "belongs to" do

    end

    specify "has many" do

    end
  end


  let(:<%= file_name %>) { <%= class_name %>.new }
  Given(:<%= file_name %>) { <%= class_name.classify.constantize.table_name %>.new }

  it "must be valid" do
    value(<%= file_name %>).must_be :valid?
  end


end
<% end -%>
