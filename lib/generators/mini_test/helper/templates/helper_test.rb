require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>HelperTest < MiniTest::Unit::TestCase

  def test_sanity
    flunk "Need real tests"
  end

end
<% end -%>
