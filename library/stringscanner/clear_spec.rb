require_relative '../../spec_helper'
require_relative 'shared/terminate.rb'
require 'strscan'

describe "StringScanner#clear" do
  it_behaves_like :strscan_terminate, :clear

  it "warns in verbose mode that the method is obsolete" do
    s = StringScanner.new("abc")
    lambda {
      $VERBOSE = true
      s.clear
    }.should complain(/clear.*obsolete.*terminate/)

    lambda {
      $VERBOSE = false
      s.clear
    }.should_not complain
  end
end
