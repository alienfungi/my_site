module VersionsHelper
  def diff(a, b, options = {})
    changes = Diffy::Diff.new(a, b, options)
    (changes.to_s.present? ? changes.to_s(:html) : '<p>No Changes</p>').html_safe
  end
end
