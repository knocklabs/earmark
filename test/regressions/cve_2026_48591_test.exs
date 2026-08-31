defmodule Regressions.CVE202648591Test do
  use ExUnit.Case, async: true

  test "escapes double quotes in HTML attribute values" do
    markdown = ~S|[click](http://example.com/?a=x" onerror="alert(1))|

    expected = """
    <p>
    <a href="http://example.com/?a=x&quot; onerror=&quot;alert(1)">click</a></p>
    """

    assert Earmark.as_html!(markdown) == expected
    assert Earmark.as_html!(markdown, escape: false) == expected
  end
end

# SPDX-License-Identifier: Apache-2.0
